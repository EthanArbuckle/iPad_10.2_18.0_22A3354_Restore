uint64_t EKUIOverriddenTraitsBasedOnWindowGeometryIsEnforced()
{
  return 0;
}

BOOL EKUICurrentWidthSizeClassIsCompactInViewHierarchy(void *a1)
{
  return _EKUIActiveWidthSizeClass(a1) == 1;
}

uint64_t _EKUIActiveWidthSizeClass(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  v2 = EKUICurrentWindowInterfaceParadigm(v1);
  if (v2 == -1)
  {
    _rootHierarchyForViewHierarchy(v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "ekui_horizontalSizeClass");

  }
  else if (v2 == 16 || v2 == 8)
  {
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

uint64_t EKUICurrentWindowInterfaceParadigm(void *a1)
{
  id v1;
  double v2;
  double v3;
  uint64_t v4;

  v1 = a1;
  v2 = EKUICurrentWindowSize(v1);
  v4 = EKUIWindowInterfaceParadigmForWindowSize(v1, v2, v3);

  return v4;
}

double EKUICurrentWindowSize(void *a1)
{
  void *v1;
  double v2;
  double v3;

  _rootHierarchyForViewHierarchy(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ekui_size");
  v3 = v2;

  return v3;
}

uint64_t EKUIWindowInterfaceParadigmForWindowSize(void *a1, double a2, double a3)
{
  id v5;
  int v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a1;
  v6 = EKUIWindowSizeParadigmForWindowSize(a2, a3);
  if (!v5 && (v6 & 0x154400BE) != 0)
  {
    v7 = 2;
    goto LABEL_31;
  }
  if (!v5 && (v6 & 0x140) != 0)
  {
    v7 = 4;
    goto LABEL_31;
  }
  if (!v5 && (v6 & 0x22880400) != 0)
  {
    v7 = 8;
    goto LABEL_31;
  }
  if ((*(_QWORD *)&v6 & 0x31FA00) != 0 && v5 == 0)
    v7 = 16;
  else
    v7 = -1;
  if (v5)
  {
    _rootHierarchyForViewHierarchy(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "ekui_horizontalSizeClass") == 1)
    {
      v10 = objc_msgSend(v9, "ekui_verticalSizeClass");
      if (v10 == 2)
        v11 = 2;
      else
        v11 = -1;
      v12 = v10 == 1;
      v13 = 4;
    }
    else
    {
      if (objc_msgSend(v9, "ekui_horizontalSizeClass") != 2)
      {
        v7 = -1;
LABEL_30:

        goto LABEL_31;
      }
      v14 = objc_msgSend(v9, "ekui_verticalSizeClass");
      v11 = 16;
      if (v14 != 2)
        v11 = -1;
      v12 = v14 == 1;
      v13 = 8;
    }
    if (v12)
      v7 = v13;
    else
      v7 = v11;
    goto LABEL_30;
  }
LABEL_31:

  return v7;
}

uint64_t EKUIWindowSizeParadigmForWindowSize(double a1, double a2)
{
  uint64_t result;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  BOOL v7;
  BOOL v8;

  if (a1 + -1764.0 > -0.001)
    return 0x40000000;
  if (a1 + -1366.0 > -0.001)
    return 0x4000;
  if (a1 + -1194.0 > -0.001)
    return 0x200000;
  if (a1 + -1112.0 > -0.001)
    return 0x10000;
  if (a1 + -1024.0 > -0.001)
  {
    v3 = a2 + -1366.0 <= -0.001;
    v4 = 4096;
    v5 = 0x2000;
    goto LABEL_11;
  }
  if (a1 + -956.0 > -0.001 && 440.0 - a2 > -0.001 || a1 + -932.0 > -0.001 && 430.0 - a2 > -0.001)
    return 0x20000000;
  if (a1 + -926.0 > -0.001 && 428.0 - a2 > -0.001)
    return 0x2000000;
  v6 = 414.0 - a2;
  if (a1 + -896.0 > -0.001 && v6 > -0.001)
    return 0x80000;
  if (a1 + -874.0 > -0.001 && 402.0 - a2 > -0.001 || a1 + -852.0 > -0.001 && 393.0 - a2 > -0.001)
    return 0x8000000;
  if (a1 + -844.0 > -0.001 && 390.0 - a2 > -0.001)
    return 0x800000;
  if (a1 + -834.0 > -0.001)
  {
    v3 = a2 + -1194.0 <= -0.001;
    v4 = 0x8000;
    v5 = 0x100000;
    goto LABEL_11;
  }
  if (a1 + -768.0 > -0.001)
    return 2048;
  if (a1 + -736.0 > -0.001 && v6 > -0.001)
    return 1024;
  result = 512;
  if (a1 + -700.0 <= -0.001 && a1 + -678.0 <= -0.001)
  {
    result = 256;
    if (a1 + -667.0 <= -0.001 && a1 + -568.0 <= -0.001)
    {
      if (a1 + -512.0 > -0.001)
        return 128;
      if (a1 + -480.0 > -0.001)
        return 64;
      v7 = a1 + -440.0 > -0.001;
      if (956.0 - a2 <= -0.001)
        v7 = 0;
      result = 0x10000000;
      if (a1 + -430.0 <= -0.001 && !v7)
      {
        if (a1 + -428.0 > -0.001)
          return 0x1000000;
        if (a1 + -414.0 > -0.001)
        {
          v3 = a2 + -896.0 <= -0.001;
          v4 = 32;
          v5 = 0x40000;
LABEL_11:
          if (v3)
            return v4;
          else
            return v5;
        }
        v8 = a1 + -402.0 > -0.001;
        if (874.0 - a2 <= -0.001)
          v8 = 0;
        result = 0x4000000;
        if (a1 + -393.0 <= -0.001 && !v8)
        {
          if (a1 + -390.0 > -0.001)
            return 0x400000;
          if (a1 + -375.0 <= -0.001)
          {
            if (a1 + -320.0 <= -0.001)
              return -1;
            if (a2 + -768.0 > -0.001)
              return 8;
            v3 = a2 + -568.0 <= -0.001;
            v4 = 2;
            v5 = 4;
            goto LABEL_11;
          }
          if (vabdd_f64(812.0, a2) >= 2.22044605e-16)
            return 16;
          else
            return 0x20000;
        }
      }
    }
  }
  return result;
}

id _rootHierarchyForViewHierarchy(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v7;
  void *v8;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v2 = v1;
LABEL_4:
    v3 = v2;
    goto LABEL_5;
  }
  objc_msgSend(v1, "ekui_rootViewHierarchy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v1, "ekui_rootViewHierarchy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  +[SizeContext sharedInstance](SizeContext, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewHierarchyForCurrentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  if (_shouldAssertOnUnknownWindow_onceToken != -1)
    dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_39);
  if (_shouldAssertOnUnknownWindow_shouldAssert)
  {
    if (!v3)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("EKUIDeviceCapabilities assertion failed: %@"), CFSTR("_windowForView: Unable to find window: is the view not connected to a view hierarchy?"));
  }
  else if (!v3)
  {
    EKUIMainWindowForMultiwindowError();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v4 = v3;
LABEL_12:
  v5 = v4;

  return v5;
}

uint64_t CalTimeDirectionIsLeftToRight()
{
  if (CalTimeDirectionIsLeftToRight_onceToken != -1)
    dispatch_once(&CalTimeDirectionIsLeftToRight_onceToken, &__block_literal_global_14_0);
  return __calendarDirectionLeftToRight;
}

uint64_t CalRoundToScreenScale(double a1)
{
  uint64_t result;

  if ((double)(int)a1 != a1)
    return UIRoundToViewScale();
  return result;
}

double CalOffsetToCenterNumberWithFont(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v12;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "pointSize");
  if (v5 < 18.0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("1")) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", CFSTR("2")) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", CFSTR("4")) & 1) == 0)
    {
      v6 = 0.0;
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("11")))
        goto LABEL_13;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v6 = -1.0 / v10;

    goto LABEL_13;
  }
  objc_msgSend(v4, "pointSize");
  v6 = 0.0;
  if (v7 >= 21.0)
    goto LABEL_13;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("1")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("4")))
  {
    UIRoundToViewScale();
    v6 = v8;
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("3")))
    goto LABEL_12;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("6")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("11")))
  {
    v12 = CalFloorToScreenScale___scale;
    if (*(double *)&CalFloorToScreenScale___scale == -1.0)
    {
      *(double *)&v12 = _EKUIScaleFactor();
      CalFloorToScreenScale___scale = v12;
    }
    v6 = -floor(*(double *)&v12 * 0.4) / *(double *)&v12;
  }
LABEL_13:

  return v6;
}

uint64_t CalInterfaceIsLeftToRight()
{
  if (CalInterfaceIsLeftToRight_onceToken != -1)
    dispatch_once(&CalInterfaceIsLeftToRight_onceToken, &__block_literal_global_12);
  return _leftToRight;
}

void sub_1AF85476C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double CalFloorRectToScreenScale(double a1)
{
  uint64_t v2;

  v2 = CalFloorToScreenScale___scale;
  if (*(double *)&CalFloorToScreenScale___scale == -1.0)
  {
    *(double *)&v2 = _EKUIScaleFactor();
    CalFloorToScreenScale___scale = v2;
  }
  if (a1 != 0.0)
    a1 = floor(a1 * *(double *)&v2) / *(double *)&v2;
  if (*(double *)&v2 == -1.0)
  {
    *(double *)&v2 = _EKUIScaleFactor();
    CalFloorToScreenScale___scale = v2;
  }
  if (*(double *)&v2 == -1.0)
  {
    *(double *)&v2 = _EKUIScaleFactor();
    CalFloorToScreenScale___scale = v2;
  }
  if (*(double *)&v2 == -1.0)
    CalFloorToScreenScale___scale = _EKUIScaleFactor();
  return a1;
}

void sub_1AF855D1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF855E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double CalRoundRectToScreenScale(double a1, double a2, double a3, double a4)
{
  double v7;
  double v8;

  v7 = a1;
  if (a1 != (double)(int)a1)
  {
    UIRoundToViewScale();
    v7 = v8;
  }
  if (a2 != (double)(int)a2)
    UIRoundToViewScale();
  if (a3 != (double)(int)a3)
    UIRoundToViewScale();
  if (a4 != (double)(int)a4)
    UIRoundToViewScale();
  return v7;
}

double CalFloorToScreenScale(double a1)
{
  uint64_t v2;

  v2 = CalFloorToScreenScale___scale;
  if (*(double *)&CalFloorToScreenScale___scale == -1.0)
  {
    *(double *)&v2 = _EKUIScaleFactor();
    CalFloorToScreenScale___scale = v2;
  }
  if (a1 != 0.0)
    return floor(*(double *)&v2 * a1) / *(double *)&v2;
  return a1;
}

void sub_1AF858204(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF858380(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t EKUIUseLargeFormatPhoneUI()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t result;
  BOOL v4;
  uint64_t v5;

  +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "viewHierarchyOrOverride");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = EKUICurrentWindowSizeParadigmForViewHierarchy(v1);
  result = 1;
  if (v2 > 0xFFFFFF)
  {
    if (v2 > 0x7FFFFFF)
    {
      v4 = v2 == 0x8000000 || v2 == 0x10000000;
      v5 = 0x20000000;
    }
    else
    {
      v4 = v2 == 0x1000000 || v2 == 0x2000000;
      v5 = 0x4000000;
    }
    if (!v4 && v2 != v5)
      return 0;
  }
  else if (v2 >= 0x80000)
  {
    if (v2 != 0x80000 && v2 != 0x400000 && v2 != 0x800000)
      return 0;
  }
  else if (v2 != 32 && v2 != 1024 && v2 != 0x40000)
  {
    return 0;
  }
  return result;
}

id EKUIMainWindowForMultiwindowError()
{
  void *v0;
  void *v1;

  +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "viewHierarchyOrOverride");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t EKUICurrentWindowSizeParadigmForViewHierarchy(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  v2 = EKUICurrentWindowWidthWithViewHierarchy(v1);
  v3 = EKUICurrentWindowHeightWithViewHierarchy(v1);

  return EKUIWindowSizeParadigmForWindowSize(v2, v3);
}

double EKUICurrentWindowWidthWithViewHierarchy(void *a1)
{
  void *v1;
  double v2;
  double v3;

  _rootHierarchyForViewHierarchy(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ekui_width");
  v3 = v2;

  return v3;
}

double EKUICurrentWindowHeightWithViewHierarchy(void *a1)
{
  void *v1;
  double v2;
  double v3;

  _rootHierarchyForViewHierarchy(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ekui_height");
  v3 = v2;

  return v3;
}

uint64_t EKUIHasFallbackSizingContext()
{
  void *v0;
  uint64_t v1;

  +[SizeContext sharedInstance](SizeContext, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "hasViewHierarchyForCurrentContext");

  return v1;
}

double EKUIWidthForWindowSizeParadigm(uint64_t a1)
{
  double result;
  double v2;
  BOOL v3;

  result = 320.0;
  if (a1 >= 0x20000)
  {
    if (a1 > 0xFFFFFF)
    {
      if (a1 <= 0x7FFFFFF)
      {
        switch(a1)
        {
          case 0x1000000:
            return 428.0;
          case 0x2000000:
            return 926.0;
          case 0x4000000:
            return 393.0;
        }
      }
      else if (a1 > 0x1FFFFFFF)
      {
        if (a1 == 0x20000000)
        {
          return 932.0;
        }
        else if (a1 == 0x40000000)
        {
          return 1764.0;
        }
      }
      else if (a1 == 0x8000000)
      {
        return 852.0;
      }
      else if (a1 == 0x10000000)
      {
        return 430.0;
      }
      return result;
    }
    if (a1 < 0x100000)
    {
      if (a1 != 0x20000)
      {
        if (a1 != 0x40000)
        {
          v3 = a1 == 0x80000;
          v2 = 896.0;
LABEL_31:
          if (v3)
            return v2;
          return result;
        }
        return 414.0;
      }
      return 375.0;
    }
    if (a1 >= 0x400000)
    {
      if (a1 == 0x400000)
        return 390.0;
      if (a1 == 0x800000)
        return 844.0;
      return result;
    }
    if (a1 != 0x100000)
    {
      if (a1 == 0x200000)
        return 1194.0;
      return result;
    }
    return 834.0;
  }
  if (a1 > 1023)
  {
    if (a1 < 0x2000)
    {
      if (a1 == 1024)
        return 736.0;
      if (a1 == 2048)
        return 768.0;
      if (a1 != 4096)
        return result;
      return 1024.0;
    }
    if (a1 < 0x8000)
    {
      if (a1 != 0x2000)
      {
        if (a1 == 0x4000)
          return 1366.0;
        return result;
      }
      return 1024.0;
    }
    if (a1 != 0x8000)
    {
      if (a1 == 0x10000)
        return 1112.0;
      return result;
    }
    return 834.0;
  }
  if (a1 <= 63)
  {
    if (a1 != -1)
    {
      if (a1 != 16)
      {
        if (a1 != 32)
          return result;
        return 414.0;
      }
      return 375.0;
    }
    if (_shouldAssertOnUnknownWindow_onceToken != -1)
      dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_39);
    if (_shouldAssertOnUnknownWindow_shouldAssert)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("EKUIDeviceCapabilities assertion failed: %@"), CFSTR("EKUIWidthForWindowSizeParadigm: Unable to find window width for paradigm"));
    return 1.84467441e19;
  }
  if (a1 <= 255)
  {
    v2 = 480.0;
    if (a1 == 128)
      result = 512.0;
    v3 = a1 == 64;
    goto LABEL_31;
  }
  if (a1 == 256)
    return 568.0;
  if (a1 == 512)
    return 700.0;
  return result;
}

void sub_1AF85AD60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF85B0C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double CalOnePixelInPoints()
{
  uint64_t v0;

  v0 = CalOnePixelInPoints___scale;
  if (*(double *)&CalOnePixelInPoints___scale == -1.0)
  {
    *(double *)&v0 = _EKUIScaleFactor();
    CalOnePixelInPoints___scale = v0;
  }
  return 1.0 / *(double *)&v0;
}

BOOL EKUIShouldSaveStateInPreferences()
{
  return !EKUIDeviceCanTransform();
}

double _EKUIScaleFactor()
{
  void *v0;
  void *v1;
  double v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayScale");
  v3 = v2;

  return v3;
}

BOOL EKUIDeviceCanTransform()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom") == 1;

  return v2;
}

double EKUIScaleFactor()
{
  void *v0;
  void *v1;
  double v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayScale");
  v3 = v2;

  return v3;
}

BOOL EKUICurrentWidthSizeClassIsRegularInViewHierarchy(void *a1)
{
  return _EKUIActiveWidthSizeClass(a1) == 2;
}

void sub_1AF85D820(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Unwind_Resume(a1);
}

void sub_1AF85D928(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double CalCeilToScreenScale(double a1)
{
  uint64_t v2;

  v2 = CalCeilToScreenScale___scale;
  if (*(double *)&CalCeilToScreenScale___scale == -1.0)
  {
    *(double *)&v2 = _EKUIScaleFactor();
    CalCeilToScreenScale___scale = v2;
  }
  if (a1 != 0.0)
    return ceil(*(double *)&v2 * a1) / *(double *)&v2;
  return a1;
}

NSBundle *EventKitUIBundle(void)
{
  if (EventKitUIBundle_onceToken != -1)
    dispatch_once(&EventKitUIBundle_onceToken, &__block_literal_global_45);
  return (NSBundle *)(id)EventKitUIBundle_bundle;
}

void EKUIPushFallbackSizingContextWithViewHierarchy(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a1;
  if (v16)
  {
    EKUIMultiwindowAssert(1, CFSTR("Attempt to push nil window as fallback sizing context"), v1, v2, v3, v4, v5, v6, v15);
    +[SizeContext sharedInstance](SizeContext, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushContextWithViewHierarchy:", v16);
  }
  else
  {
    +[SizeContext sharedInstance](SizeContext, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasViewHierarchyForCurrentContext");
    EKUIMultiwindowAssert(v8, CFSTR("Attempt to push nil window as fallback sizing context"), v9, v10, v11, v12, v13, v14, v15);
  }

}

void EKUIPopFallbackSizingContextWithViewHierarchy(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a1;
  if (v16)
  {
    EKUIMultiwindowAssert(1, CFSTR("Attempt to pop nil window as fallback sizing context"), v1, v2, v3, v4, v5, v6, v15);
    +[SizeContext sharedInstance](SizeContext, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "popContextFromViewHierarchy:", v16);
  }
  else
  {
    +[SizeContext sharedInstance](SizeContext, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasViewHierarchyForCurrentContext");
    EKUIMultiwindowAssert(v8, CFSTR("Attempt to pop nil window as fallback sizing context"), v9, v10, v11, v12, v13, v14, v15);
  }

}

void EKUIMultiwindowAssert(char a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;

  v10 = a2;
  if (_shouldAssertOnUnknownWindow_onceToken != -1)
    dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_39);
  if (_shouldAssertOnUnknownWindow_shouldAssert)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);
    if ((a1 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("EKUIDeviceCapabilities assertion failed: %@"), v11);

  }
}

void sub_1AF85ED78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

double EKUILayoutMarginsForFullscreenLayoutRectWithSize(void *a1, double a2)
{
  double v3;
  double v4;

  objc_msgSend(a1, "layoutMargins");
  v4 = v3;
  if (a2 <= 1024.0 && a2 <= 700.0 && a2 <= 678.0 && a2 <= 414.0 && a2 > 375.0)
    CalRoundToScreenScale(22.3333333);
  return v4;
}

double CalRoundEdgeInsetsToScreenScale(double a1, double a2, double a3, double a4)
{
  double v7;

  if (a2 != (double)(int)a2)
    UIRoundToViewScale();
  if (a4 != (double)(int)a4)
    UIRoundToViewScale();
  if (a1 != (double)(int)a1)
  {
    UIRoundToViewScale();
    a1 = v7;
  }
  if (a3 != (double)(int)a3)
    UIRoundToViewScale();
  return a1;
}

id CalendarAppTintColor()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)CalendarAppTintColor___AppTintColor;
  if (!CalendarAppTintColor___AppTintColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)CalendarAppTintColor___AppTintColor;
    CalendarAppTintColor___AppTintColor = v1;

    v0 = (void *)CalendarAppTintColor___AppTintColor;
  }
  return v0;
}

void sub_1AF861E14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF861F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF862E20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL EKUIUsesLargeTextLayout(void *a1)
{
  NSString *v1;
  void *v2;
  _BOOL8 IsAccessibilityCategory;

  if (a1)
  {
    objc_msgSend(a1, "preferredContentSizeCategory");
    v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredContentSizeCategoryOrOverride");
    v1 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v1);

  return IsAccessibilityCategory;
}

BOOL EKUIPrefersLargerTextThanDefault(void *a1)
{
  NSString *v1;
  void *v2;
  _BOOL8 v3;

  if (a1)
  {
    objc_msgSend(a1, "preferredContentSizeCategory");
    v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredContentSizeCategoryOrOverride");
    v1 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  v3 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]) == NSOrderedDescending;

  return v3;
}

id WeekendTextColor()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)WeekendTextColor_sWeekendTextColor;
  if (!WeekendTextColor_sWeekendTextColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)WeekendTextColor_sWeekendTextColor;
    WeekendTextColor_sWeekendTextColor = v1;

    v0 = (void *)WeekendTextColor_sWeekendTextColor;
  }
  return v0;
}

BOOL EKUICurrentHeightSizeClassIsCompact(void *a1)
{
  return _EKUIActiveHeightSizeClass(a1) == 1;
}

uint64_t _EKUIActiveHeightSizeClass(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  v2 = EKUICurrentWindowInterfaceParadigm(v1);
  if (v2 == -1)
  {
    _rootHierarchyForViewHierarchy(v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "ekui_verticalSizeClass");

  }
  else if (v2 == 16 || v2 == 2)
  {
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

void ___shouldAssertOnUnknownWindow_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _shouldAssertOnUnknownWindow_shouldAssert = objc_msgSend(v0, "enableMultiwindowAsserts");

}

void EKUILogInitIfNeeded()
{
  if (EKUILogInitIfNeeded_onceToken != -1)
    dispatch_once(&EKUILogInitIfNeeded_onceToken, &__block_literal_global_54);
}

void sub_1AF867A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF868480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF8686FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF8687E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
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

id _StringWithLineEndingsRemoved(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1AF86C2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _StringValuePartsForDateComponents(void *a1, void *a2, void *a3, int a4, uint64_t a5, char a6, id *a7, id *a8)
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v29 = a1;
  v14 = a2;
  v15 = a3;
  _CalendarForFormattingStrings();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateFromComponents:", v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Start time zone format"), CFSTR("%@ %@"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    CUIKShortTZString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    a6 = 1;
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v20 = 0;
    if (a4)
    {
LABEL_3:
      if (a7)
      {
        CUIKStringForDateAndDayOfWeekInCalendarTimezone();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
        *a7 = v21;
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  if (v14
    && (v22 = objc_msgSend(v14, "year"), v22 == objc_msgSend(v29, "year"))
    && (v23 = objc_msgSend(v14, "month"), v23 == objc_msgSend(v29, "month"))
    && (v24 = objc_msgSend(v14, "day"), v25 = objc_msgSend(v29, "day"), a7)
    && v24 == v25)
  {
    CUIKStringForTime();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    *a7 = v26;
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v19, v26, v20);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      *a7 = v26;
    }
  }
  else
  {
    if (!a7)
      goto LABEL_17;
    v26 = *a7;
  }
  if (!v26)
  {
    if ((a6 & 1) != 0)
      CUIKShortStringForDay();
    else
      CUIKStringForDateWithCommaAndYear();
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a7 = v27;

    if (a8)
    {
      CUIKStringForTime();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      *a8 = v28;
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v19, v28, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        a7 = a8;
        goto LABEL_5;
      }
    }
  }
LABEL_17:

}

id _CalendarForFormattingStrings()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeZone");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToTimeZone:", v2);

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setTimeZone:", v4);

  }
  return v0;
}

void sub_1AF8730BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF874338(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF8743A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF8746D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF8747C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF875D14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF87BCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(v20);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1AF87D388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18)
{
  objc_destroyWeak(a18);
  objc_destroyWeak(a17);
  objc_destroyWeak(a16);
  objc_destroyWeak(a15);
  objc_destroyWeak(a14);
  objc_destroyWeak(a13);
  objc_destroyWeak(a12);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)&STACK[0x398]);
  _Unwind_Resume(a1);
}

void sub_1AF87F45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

double springAnimationDuration()
{
  return 0.91;
}

void scaleViewToFrame(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9;
  double MidX;
  double MidY;
  CGFloat v12;
  CGFloat v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  if (a1)
  {
    v9 = a1;
    v18.origin.x = a2;
    v18.origin.y = a3;
    v18.size.width = a4;
    v18.size.height = a5;
    MidX = CGRectGetMidX(v18);
    v19.origin.x = a2;
    v19.origin.y = a3;
    v19.size.width = a4;
    v19.size.height = a5;
    MidY = CGRectGetMidY(v19);
    objc_msgSend(v9, "frame");
    v12 = a4 / CGRectGetWidth(v20);
    objc_msgSend(v9, "frame");
    memset(&v17, 0, sizeof(v17));
    v13 = a5 / CGRectGetHeight(v21);
    objc_msgSend(v9, "transform");
    v15 = v17;
    CGAffineTransformScale(&v16, &v15, v12, v13);
    v17 = v16;
    v14 = v16;
    objc_msgSend(v9, "setTransform:", &v14);
    objc_msgSend(v9, "setCenter:", MidX, MidY);

  }
}

id createImageViewFromView(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  void *v10;
  void *v11;

  captureImageFromView(a1, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  createImageViewFromImage(v10, a3, a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id captureImageFromView(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  char v18;

  v3 = a1;
  v4 = objc_msgSend(v3, "isHidden");
  objc_msgSend(v3, "setHidden:", 0);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setScale:", EKUIScaleFactor());
  objc_msgSend(v5, "setOpaque:", a2);
  objc_msgSend(v5, "setPreferredRange:", 1);
  v6 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(v3, "bounds");
  v9 = (void *)objc_msgSend(v6, "initWithSize:format:", v5, v7, v8);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __captureImageFromView_block_invoke;
  v16 = &unk_1E6018CE8;
  v18 = a2;
  v17 = v3;
  v10 = v3;
  objc_msgSend(v9, "imageWithActions:", &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v4, v13, v14, v15, v16);

  return v11;
}

id createImageViewFromImage(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  CGImage *v19;
  CGImage *v20;
  id v21;
  void *v22;
  void *v23;
  CGRect v25;

  v9 = a1;
  objc_msgSend(v9, "scale");
  v11 = a2 * v10;
  objc_msgSend(v9, "scale");
  v13 = a3 * v12;
  objc_msgSend(v9, "scale");
  v15 = a4 * v14;
  objc_msgSend(v9, "scale");
  v17 = a5 * v16;
  v18 = objc_retainAutorelease(v9);
  v19 = (CGImage *)objc_msgSend(v18, "CGImage");

  v25.origin.x = v11;
  v25.origin.y = v13;
  v25.size.width = v15;
  v25.size.height = v17;
  v20 = CGImageCreateWithImageInRect(v19, v25);
  v21 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithImage:", v22);

  if (v20)
    CGImageRelease(v20);
  objc_msgSend(v23, "setFrame:", a2, a3, a4, a5);
  return v23;
}

void __captureImageFromView_block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  CGRect v8;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = (void *)MEMORY[0x1E0DC3E88];
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrentTraitCollection:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "set");

    objc_msgSend(*(id *)(a1 + 32), "bounds");
    CGContextFillRect(v3, v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderInContext:", v3);

}

id createSnapshotFromView(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  id v11;
  uint64_t v12;
  id v13;
  void *v14;

  v11 = a1;
  v12 = objc_msgSend(v11, "isHidden");
  objc_msgSend(v11, "setHidden:", 0);
  objc_msgSend(v11, "setNeedsDisplay");
  v13 = objc_alloc(MEMORY[0x1E0DC3C88]);
  objc_msgSend(v11, "bounds");
  v14 = (void *)objc_msgSend(v13, "initWithFrame:");
  objc_msgSend(v14, "captureSnapshotRect:fromView:withSnapshotType:", v11, a2, a3, a4, a5, a6);
  objc_msgSend(v11, "setHidden:", v12);

  return v14;
}

uint64_t synchronizationOffsetForLabels(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "objectAtIndex:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v35;
    while (2)
    {
      v11 = 0;
      v12 = v9 + v8;
      do
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v11), "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
          v22 = v9 + v11;
          v25 = v6;
          v15 = v5;
          goto LABEL_22;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(v6, "objectAtIndex:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = v3;
  v16 = v3;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v31;
    while (2)
    {
      v21 = 0;
      v22 = v19 - v18;
      do
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v21), "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v15, "isEqualToString:", v23);

        if ((v24 & 1) != 0)
        {
          v22 = v19 - v21;
          goto LABEL_21;
        }
        ++v21;
      }
      while (v18 != v21);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      v19 = v22;
      if (v18)
        continue;
      break;
    }
  }
  else
  {
    v22 = 0;
  }
LABEL_21:

  v25 = v27;
  v3 = v28;
LABEL_22:

  return v22;
}

id createCrossFadeViewsFromViews(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double Width;
  double v20;
  double Height;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
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
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CrossFadeView *v53;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v5 = a1;
  v6 = a2;
  v7 = -a3 & (-a3 >> 63);
  v8 = objc_msgSend(v5, "count");
  v9 = objc_msgSend(v6, "count");
  if (v8 <= v9 - a3)
    v10 = v9 - a3;
  else
    v10 = v8;
  v11 = _estimatedSpacing(v5);
  v65 = v12;
  v66 = v11;
  v13 = _estimatedSpacing(v6);
  v63 = v14;
  v64 = v13;
  v15 = v6;
  objc_msgSend(v5, "objectAtIndex:", -a3 & (a3 >> 63));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (-a3 & (a3 >> 63)) + a3;
  if (v17 < 0
    || v17 >= (unint64_t)objc_msgSend(v15, "count")
    || (objc_msgSend(v15, "objectAtIndex:", v17), (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v15, "objectAtIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v18, "bounds");
  Width = CGRectGetWidth(v67);
  objc_msgSend(v16, "bounds");
  v20 = CGRectGetWidth(v68);
  objc_msgSend(v18, "bounds");
  Height = CGRectGetHeight(v69);
  objc_msgSend(v16, "bounds");
  v22 = CGRectGetHeight(v70);

  objc_msgSend(v5, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v61 = v25;
  v62 = v24;

  objc_msgSend(v15, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v59 = v28;
  v60 = v27;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10 - v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 > v7)
  {
    v57 = Height / v22;
    v58 = Width / v20;
    v55 = 1.0 / (Height / v22);
    v56 = 1.0 / (Width / v20);
    do
    {
      if (v7 < 0 || v7 >= (unint64_t)objc_msgSend(v5, "count"))
      {
        v30 = 0;
      }
      else
      {
        objc_msgSend(v5, "objectAtIndex:", v7);
        v30 = objc_claimAutoreleasedReturnValue();
      }
      v31 = a3 + v7;
      if (a3 + v7 < 0 || v31 >= (unint64_t)objc_msgSend(v15, "count"))
      {
        v32 = 0;
      }
      else
      {
        objc_msgSend(v15, "objectAtIndex:", a3 + v7);
        v32 = objc_claimAutoreleasedReturnValue();
      }
      if (!(v30 | v32))
        goto LABEL_25;
      if (v30)
      {
        objc_msgSend((id)v30, "frame");
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        if (!v32)
          goto LABEL_23;
      }
      else
      {
        objc_msgSend((id)v32, "bounds");
        v34 = v62 + (double)v7 * v66;
        v36 = v61 + (double)v7 * v65;
        v38 = v56 * v49;
        v40 = v55 * v50;
        if (!v32)
        {
LABEL_23:
          objc_msgSend((id)v30, "bounds");
          v42 = v60 + (double)v31 * v64;
          v44 = v59 + (double)v31 * v63;
          v46 = v58 * v51;
          v48 = v57 * v52;
          goto LABEL_24;
        }
      }
      objc_msgSend((id)v32, "frame");
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;
LABEL_24:
      v53 = -[CrossFadeView initWithStartView:endView:startFrame:endFrame:]([CrossFadeView alloc], "initWithStartView:endView:startFrame:endFrame:", v30, v32, v34, v36, v38, v40, v42, v44, v46, v48);
      objc_msgSend(v29, "addObject:", v53);

LABEL_25:
      ++v7;
    }
    while (v10 != v7);
  }

  return v29;
}

double _estimatedSpacing(void *a1)
{
  id v1;
  double v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "count") > 1)
  {
    objc_msgSend(v1, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectAtIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    objc_msgSend(v3, "frame");
    v2 = v6 - v7;
    objc_msgSend(v4, "frame");
    objc_msgSend(v3, "frame");

  }
  else
  {
    v2 = *MEMORY[0x1E0C9D538];
  }

  return v2;
}

id springAnimateViewPosition(void *a1, unsigned int a2, void *a3, double a4, double a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v9 = a1;
  v10 = a3;
  if (v9)
  {
    _createSpringOfBasicAnimationDependingOnDebugState(CFSTR("position"), a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFromValue:", v12);

    objc_msgSend(v9, "frame");
    v14 = a4 + v13 * 0.5;
    objc_msgSend(v9, "frame");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v14, a5 + v15 * 0.5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setToValue:", v16);

    if (v10)
      objc_msgSend(v11, "setDelegate:", v10);
    objc_msgSend(v9, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAnimation:forKey:", v11, CFSTR("position"));

    objc_msgSend(v9, "frame");
    objc_msgSend(v9, "setFrame:", a4, a5);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id _createSpringOfBasicAnimationDependingOnDebugState(void *a1, unsigned int a2)
{
  id v3;
  float v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  float v11;

  v3 = a1;
  UIAnimationDragCoefficient();
  if (v4 <= 1.5)
  {
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMass:", 2.0);
    objc_msgSend(v5, "setStiffness:", 300.0);
    objc_msgSend(v5, "setDamping:", 400.0);
    _createTimingFunction(a2, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimingFunction:", v10);

  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CD2710]);
    objc_msgSend(v5, "setKeyPath:", v3);
  }
  UIAnimationDragCoefficient();
  objc_msgSend(v5, "setDuration:", v11 * 0.91);

  return v5;
}

id springAnimateViewBounds(void *a1, unsigned int a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v13 = a1;
  v14 = a3;
  if (v13)
  {
    _createSpringOfBasicAnimationDependingOnDebugState(CFSTR("bounds"), a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFromValue:", v16);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a4, a5, a6, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setToValue:", v17);

    if (v14)
      objc_msgSend(v15, "setDelegate:", v14);
    objc_msgSend(v13, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAnimation:forKey:", v15, CFSTR("bounds"));

    objc_msgSend(v13, "setBounds:", a4, a5, a6, a7);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id springAnimateViewFrame(void *a1, unsigned int a2, void *a3, double a4, double a5, double a6, double a7)
{
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  if (a1)
  {
    v13 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v15 = a3;
    v16 = a1;
    v17 = springAnimateViewBounds(v16, a2, 0, v13, v14, a6, a7);
    springAnimateViewPosition(v16, a2, v15, a4, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

id springAnimateViewAlpha(void *a1, unsigned int a2, void *a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  void *v14;

  v7 = a1;
  v8 = a3;
  if (v7)
  {
    _createSpringOfBasicAnimationDependingOnDebugState(CFSTR("opacity"), a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "alpha");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFromValue:", v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setToValue:", v12);

    UIAnimationDragCoefficient();
    objc_msgSend(v9, "setDuration:", v13 * 0.91);
    if (v8)
      objc_msgSend(v9, "setDelegate:", v8);
    objc_msgSend(v7, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAnimation:forKey:", v9, CFSTR("opacity"));

    objc_msgSend(v7, "setAlpha:", a4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id _createTimingFunction(unsigned int a1, double a2, double a3, double a4, double a5)
{
  if (a1 > 4)
  {
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", CFSTR("default"));
  }
  else
  {
    LODWORD(a2) = 1046804326;
    LODWORD(a3) = 990057071;
    LODWORD(a4) = 1057860511;
    LODWORD(a5) = 1064563009;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", a2, a3, a4, a5);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

void recursiveAnimationRemove(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(a1, "sublayers", 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v8;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v1);
          v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
          recursiveAnimationRemove(v6);
          objc_msgSend(v6, "removeAllAnimations");
        }
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v3);
    }

  }
}

float preferredNavigationAnimationFrameRateRange()
{
  float result;

  LODWORD(result) = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return result;
}

void animateNavigationPreferringFRR(void *a1)
{
  void *v1;
  id v2;
  CAFrameRateRange v3;

  v1 = (void *)MEMORY[0x1E0DC3F10];
  v2 = a1;
  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v1, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1572874, v2, *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);

}

id navigationAnimationsPreferringFRR(void *a1)
{
  id v1;
  id v2;
  void *v3;
  _QWORD aBlock[4];
  id v6;

  v1 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __navigationAnimationsPreferringFRR_block_invoke;
  aBlock[3] = &unk_1E6018D30;
  v6 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);

  return v3;
}

void __navigationAnimationsPreferringFRR_block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  double v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  CAFrameRateRange v11;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v11.minimum;
  maximum = v11.maximum;
  preferred = v11.preferred;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __navigationAnimationsPreferringFRR_block_invoke_2;
  v9[3] = &unk_1E6018D30;
  v10 = *(id *)(a1 + 32);
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1572874, v9, v6, v7, v8);

}

uint64_t __navigationAnimationsPreferringFRR_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id dayViewScrollAnimationsPreferringFRR(void *a1)
{
  id v1;
  id v2;
  void *v3;
  _QWORD aBlock[4];
  id v6;

  v1 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __dayViewScrollAnimationsPreferringFRR_block_invoke;
  aBlock[3] = &unk_1E6018D30;
  v6 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);

  return v3;
}

void __dayViewScrollAnimationsPreferringFRR_block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  double v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  CAFrameRateRange v11;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v11.minimum;
  maximum = v11.maximum;
  preferred = v11.preferred;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __dayViewScrollAnimationsPreferringFRR_block_invoke_2;
  v9[3] = &unk_1E6018D30;
  v10 = *(id *)(a1 + 32);
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1572884, v9, v6, v7, v8);

}

uint64_t __dayViewScrollAnimationsPreferringFRR_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id DisplayAddressForIdentity(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;

  v1 = a1;
  objc_msgSend(v1, "emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(v1, "phoneNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D0CDD8], "sharedGenerator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "phoneNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "formattedStringForPhoneNumber:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v1, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "cal_hasSchemeTel");

      if (!v9)
      {
        objc_msgSend(v1, "URL");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "resourceSpecifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0D0CDD8], "sharedGenerator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "formattedStringForTelURL:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v3 = (void *)v7;

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(v1, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v3;
}

uint64_t DisplayStringForIdentity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0D0CD18], "displayStringForIdentity:useAddressAsFallback:contactIdentifier:", a1, a2, a3);
}

id IdentityNameFromRecipient(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v1 = a1;
  objc_msgSend(v1, "displayString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
    objc_msgSend(v1, "displayString");
  else
    objc_msgSend(v1, "compositeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "cal_isPhoneNumber"))
  {
    objc_msgSend(MEMORY[0x1E0D0CDD8], "sharedGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0CDD8], "normalizedPhoneNumber:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedStringForPhoneNumber:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByRemovingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t CanSeeAttendeeStatuses(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CA9FE8], "canSeeAttendeeStatusesForEvent:", a1);
}

BOOL EKUIAttendeeUtils_ShouldConsiderAttendeeForConflictChecking(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "participantType") != 2;
  }
  else
  {
    v4 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "EKUIAttendeeUtils_ShouldConsiderAttendeeForConflictChecking";
      _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_ERROR, "'nil' participant given to function: [%s].  Will not attempt to check whether this attendee should be considered for conflict checking.", (uint8_t *)&v6, 0xCu);
    }
    v3 = 0;
  }

  return v3;
}

BOOL EKUIAttendeeUtils_ShouldCountAttendeeAsConflicted(void *a1, uint64_t a2)
{
  id v3;
  _BOOL8 v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    v4 = (objc_msgSend(MEMORY[0x1E0CA9FE8], "showTypeAsBusy:", a2) & 1) != 0
      || objc_msgSend(v3, "participantStatus") == 3;
  }
  else
  {
    v5 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "EKUIAttendeeUtils_ShouldCountAttendeeAsConflicted";
      _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_ERROR, "'nil' participant given to function: [%s].  Will not compute conflicted state.", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

uint64_t EKUIAttendeeUtils_AttendeeHasResponded(void *a1)
{
  return objc_msgSend(a1, "needsResponse") ^ 1;
}

void sub_1AF885568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

double _CachedSizeForButton(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v1 = a1;
  if (_CachedSizeForButton_onceToken != -1)
    dispatch_once(&_CachedSizeForButton_onceToken, &__block_literal_global_5);
  objc_msgSend(v1, "titleForState:", objc_msgSend(v1, "state"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_CachedSizeForButton___sizes, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend((id)_CachedSizeForButton___sizes, "setObject:forKeyedSubscript:", v3, v2);
  }
  objc_msgSend(v1, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v1, "intrinsicContentSize");
    objc_msgSend(v7, "valueWithSize:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v5);
  }
  objc_msgSend(v6, "sizeValue");
  v9 = v8;

  return v9;
}

void sub_1AF88E440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF88ECEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF88EE40(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

Class __getREMObjectIDClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary();
  result = objc_getClass("REMObjectID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMObjectIDClass_block_invoke_cold_1();
  getREMObjectIDClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
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
    v1 = xmmword_1E6018F08;
    v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary)
    ReminderKitLibrary_cold_1(&v0);
}

Class __getREMStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary();
  result = objc_getClass("REMStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMStoreClass_block_invoke_cold_1();
  getREMStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMRecurrenceRuleFormatterClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary();
  result = objc_getClass("REMRecurrenceRuleFormatter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMRecurrenceRuleFormatterClass_block_invoke_cold_1();
  getREMRecurrenceRuleFormatterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id defaultDarkLineColor()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)defaultDarkLineColor_sDarkLineColor;
  if (!defaultDarkLineColor_sDarkLineColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.76, 1.0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)defaultDarkLineColor_sDarkLineColor;
    defaultDarkLineColor_sDarkLineColor = v1;

    v0 = (void *)defaultDarkLineColor_sDarkLineColor;
  }
  return v0;
}

id defaultLineColorWithOpaque(int a1)
{
  void *v1;
  uint64_t v2;
  uint64_t *v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)defaultLineColorWithOpaque_sDefaultLineColorOpaque;
    if (!defaultLineColorWithOpaque_sDefaultLineColorOpaque)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.84, 1.0);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = &defaultLineColorWithOpaque_sDefaultLineColorOpaque;
LABEL_6:
      v4 = (void *)*v3;
      *v3 = v2;

      v1 = (void *)*v3;
    }
  }
  else
  {
    v1 = (void *)defaultLineColorWithOpaque_sDefaultLineColor;
    if (!defaultLineColorWithOpaque_sDefaultLineColor)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.24);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = &defaultLineColorWithOpaque_sDefaultLineColor;
      goto LABEL_6;
    }
  }
  return v1;
}

id CalendarInvitationTitleColorOpaque()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)CalendarInvitationTitleColorOpaque___InvitationTitleColorOpaque;
  if (!CalendarInvitationTitleColorOpaque___InvitationTitleColorOpaque)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)CalendarInvitationTitleColorOpaque___InvitationTitleColorOpaque;
    CalendarInvitationTitleColorOpaque___InvitationTitleColorOpaque = v1;

    v0 = (void *)CalendarInvitationTitleColorOpaque___InvitationTitleColorOpaque;
  }
  return v0;
}

uint64_t TodayTimelineColor()
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "cuik_todayTimelineColor");
}

id CalendarForegroundColorForColor(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
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
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v1 = a1;
  v55 = 0;
  v56 = 0;
  v53 = 0;
  v54 = 0;
  objc_msgSend(v1, "getRed:green:blue:alpha:", &v56, &v55, &v54, &v53);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v1, "hash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)CalendarForegroundColorForColor_sTextColors;
  if (!CalendarForegroundColorForColor_sTextColors)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 7);
    v5 = (void *)CalendarForegroundColorForColor_sTextColors;
    CalendarForegroundColorForColor_sTextColors = v4;

    for (i = 0; i != 168; i += 24)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", *(double *)((char *)&unk_1AFA13208 + i), *(double *)((char *)&unk_1AFA13208 + i + 8), *(double *)((char *)&unk_1AFA13208 + i + 16), 1.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", *(double *)((char *)&unk_1AFA132B0 + i), *(double *)((char *)&unk_1AFA132B0 + i + 8), *(double *)((char *)&unk_1AFA132B0 + i + 16), 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "hash"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)CalendarForegroundColorForColor_sTextColors, "setObject:forKey:", v8, v9);

    }
    v3 = (void *)CalendarForegroundColorForColor_sTextColors;
  }
  objc_msgSend(v3, "objectForKey:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.55);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKBlendColorsSourceOver();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "isGreenOrYellow");
    if (v15)
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.18, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "overlayWithColor:", v16);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    CUIKLuminance();
    v18 = v17;
    CUIKLuminance();
    v20 = v19;
    objc_msgSend(v14, "differenceFromColor:", v12);
    if (v21 < 1.0)
    {
      v22 = (void *)MEMORY[0x1E0DC3658];
      v23 = (1.0 - v21) / 3.0;
      objc_msgSend(v12, "redComponent");
      v25 = v24 - v23;
      objc_msgSend(v12, "greenComponent");
      v27 = v26 - v23;
      objc_msgSend(v12, "blueComponent");
      objc_msgSend(v22, "colorWithRed:green:blue:alpha:", v25, v27, v28 - v23, 1.0);
      v29 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v29;
    }
    v30 = v18 - v20;
    if (v15)
    {
      if (v30 < 0.75)
      {
        v31 = 0.75 - v30;
        v32 = (void *)MEMORY[0x1E0DC3658];
        objc_msgSend(v12, "redComponent");
        v34 = v33;
        objc_msgSend(v12, "redComponent");
        v36 = v34 + (0.75 - v30) * v35 * -0.299;
        objc_msgSend(v12, "greenComponent");
        v38 = v37;
        objc_msgSend(v12, "greenComponent");
        v40 = v38 + (0.75 - v30) * v39 * -0.587;
        objc_msgSend(v12, "blueComponent");
        v42 = v41;
        objc_msgSend(v12, "blueComponent");
        objc_msgSend(v32, "colorWithRed:green:blue:alpha:", v36, v40, v42 + v31 * v43 * -0.114, 1.0);
        v44 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v51 = (void *)v44;

        v12 = v51;
      }
    }
    else if (v30 < 0.28)
    {
      v45 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(v12, "hueComponent");
      v47 = v46;
      objc_msgSend(v12, "saturationComponent");
      v49 = v48;
      objc_msgSend(v12, "brightnessComponent");
      objc_msgSend(v45, "colorWithHue:saturation:brightness:alpha:", v47, v49, v50 - (0.28 - v30), 1.0);
      v44 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_msgSend((id)CalendarForegroundColorForColor_sTextColors, "setObject:forKey:", v12, v2);

    goto LABEL_19;
  }
  v12 = v10;
LABEL_19:

  return v12;
}

id CalendarAppCircleNonTodayBGColor()
{
  if (CalendarAppCircleNonTodayBGColor_onceToken != -1)
    dispatch_once(&CalendarAppCircleNonTodayBGColor_onceToken, &__block_literal_global_6);
  return (id)CalendarAppCircleNonTodayBGColor__color;
}

id CalendarAppCircleTextColor()
{
  if (CalendarAppCircleTextColor_onceToken != -1)
    dispatch_once(&CalendarAppCircleTextColor_onceToken, &__block_literal_global_10);
  return (id)CalendarAppCircleTextColor__color;
}

uint64_t EKUISimulatedNavigationBarColor()
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_14);
}

uint64_t EKUIVerticalGridLineColor()
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
}

id ClearButtonImageColor()
{
  if (ClearButtonImageColor_onceToken != -1)
    dispatch_once(&ClearButtonImageColor_onceToken, &__block_literal_global_15);
  return (id)ClearButtonImageColor__color;
}

uint64_t EKHalfSystemGroupedBackgroundColor()
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_18);
}

uint64_t SuggestedLocationDismissImageColor()
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.654901961, 0.654901961, 0.670588235, 1.0);
}

uint64_t CheckmarkGreenColor()
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
}

void sub_1AF897074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id EKUIIOSMacLogHandle()
{
  if (EKUIIOSMacLogHandle_onceToken != -1)
    dispatch_once(&EKUIIOSMacLogHandle_onceToken, &__block_literal_global_31);
  return (id)EKUIIOSMacLogHandle_handle;
}

void sub_1AF897864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF89908C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24,id *a25,id *a26,id *a27,id *a28,id *a29,id *a30,id *a31,id *a32,id *a33,id *a34,id *a35,id *a36,id *location)
{
  objc_destroyWeak(a35);
  objc_destroyWeak(a25);
  objc_destroyWeak(a24);
  objc_destroyWeak(a23);
  objc_destroyWeak(a22);
  objc_destroyWeak(a21);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a13);
  objc_destroyWeak(a17);
  objc_destroyWeak(a16);
  objc_destroyWeak(a18);
  objc_destroyWeak(a19);
  objc_destroyWeak(a20);
  objc_destroyWeak(location);
  objc_destroyWeak(a36);
  objc_destroyWeak(a34);
  objc_destroyWeak(a33);
  objc_destroyWeak(a32);
  objc_destroyWeak(a31);
  objc_destroyWeak(a30);
  objc_destroyWeak(a29);
  objc_destroyWeak(a28);
  objc_destroyWeak(a27);
  objc_destroyWeak(a26);
  objc_destroyWeak((id *)&STACK[0x6C8]);
  _Unwind_Resume(a1);
}

void sub_1AF8997A8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AF89A758(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AF89B250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
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

void sub_1AF8A0534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CalStringForRelativeOffset(int a1, double a2)
{
  const void *v3;
  uint64_t GregorianDate;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  if (a1)
  {
    v3 = (const void *)CalTimeZoneCopyCFTimeZone();
    GregorianDate = CalDateTimeGetGregorianDate();
    v5 = (void *)MEMORY[0x1E0C99D68];
    MEMORY[0x1B5DFE51C](GregorianDate);
    objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
    v7 = a2 > 0.0;
    if (a2 >= 86400.0)
      v7 = 0;
    if (a2 == 0.0 || v7)
    {
      EventKitUIBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("On day of event (%@)"), &stru_1E601DFA8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0CB3940];
      CUIKStringForGMTTime();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a2 == -572400.0)
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        EventKitUIBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%@ before"), &stru_1E601DFA8, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        CalIntervalOneWeekLocalizedString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringWithFormat:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a2 >= 0.0 || a2 < -21600.0)
        {
          EventKitUIBundle();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (a2 >= 0.0)
          {
            objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("%@ after"), &stru_1E601DFA8, 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = floor(a2 / 86400.0);
          }
          else
          {
            objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("%@ before"), &stru_1E601DFA8, 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = ceil(fabs(a2) / 86400.0);
          }
          v24 = (uint64_t)v23;
          v25 = (void *)MEMORY[0x1E0CB3940];
          EventKitUIBundle();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("interval_days_long"), &stru_1E601DFA8, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringWithFormat:", v27, v24);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x1E0CB3940];
          EventKitUIBundle();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("All-day alarm format"), CFSTR("%@ (%@)"), 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          CUIKStringForGMTTime();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "localizedStringWithFormat:", v29, v11, v30);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          CalOnTimeLocalizedString();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          CUIKDurationStringForTimeInterval();
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          CUIKStringForGMTTime();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0CB3940];
          EventKitUIBundle();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("All-day alarm format"), CFSTR("%@ (%@)"), 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "localizedStringWithFormat:", v20, v9, v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
    }

  }
  else if (a2 == -604800.0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@ before"), &stru_1E601DFA8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CalIntervalOneWeekLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v14, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CalOnTimeLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKDurationStringForTimeInterval();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id CalIntervalOneWeekLocalizedString()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("interval_weeks"), &stru_1E601DFA8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringWithFormat:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id CalOnTimeLocalizedString()
{
  void *v0;
  void *v1;

  EventKitUIBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("At time of event"), &stru_1E601DFA8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1AF8A2C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF8A3B04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1AF8A8490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 144));
  _Unwind_Resume(a1);
}

void sub_1AF8A88E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1AF8AADFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t CalendarLinkLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = CalendarLinkLibraryCore_frameworkLibrary;
  v6 = CalendarLinkLibraryCore_frameworkLibrary;
  if (!CalendarLinkLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E60196D0;
    v8 = *(_OWORD *)&off_1E60196E0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    CalendarLinkLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1AF8ABC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1AF8AD300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,id a26)
{
  id *v26;
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a26);
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

void sub_1AF8AD5DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
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

void sub_1AF8AD874(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t EKUILabeledDisplayStringForContact(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D0CD40], "CUIKLabeledDisplayStringForContact:label:", a1, a2);
}

uint64_t EKUILabeledDisplayStringForContactWithStore(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0D0CD40], "CUIKLabeledDisplayStringForContact:label:", a2, a3);
}

id EKUIUserFriendlyStringForCLLocation(void *a1)
{
  id v1;
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v1 = a1;
  objc_msgSend(v1, "coordinate");
  CreateCoordinateComponentString(1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "coordinate");
  v6 = v5;
  v8 = v7;

  CreateCoordinateComponentString(0, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%@, %@"), &stru_1E601DFA8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v12, v4, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id CreateCoordinateComponentString(int a1, double a2, double a3)
{
  uint64_t v4;
  BOOL v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  if (!a1)
    a2 = a3;
  v4 = (uint64_t)(a2 * 3600.0);
  v5 = v4 < 0;
  if (v4 >= 0)
    v6 = CFSTR("N");
  else
    v6 = CFSTR("S");
  v7 = CFSTR("E");
  if (v5)
    v7 = CFSTR("W");
  if (a1)
    v8 = v6;
  else
    v8 = v7;
  EventKitUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (uint64_t)a2;
  v12 = fabs((a2 - (double)(uint64_t)a2) * 60.0);
  v13 = (uint64_t)v12;
  v14 = (double)(uint64_t)((v12 - (double)(uint64_t)v12) * 60.0);
  if (v11 >= 0)
    v15 = v11;
  else
    v15 = -v11;

  v16 = objc_retainAutorelease(v10);
  v17 = v16;
  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  EventKitUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("%ld°%ld'%.0f'' %@"), &stru_1E601DFA8, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithFormat:", v20, v15, v13, *(_QWORD *)&v14, v17, 0);

  return v21;
}

void sub_1AF8AFDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_1AF8B0324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CalWeekStartForDisplay()
{
  return CUIKZeroIndexedWeekStart();
}

void sub_1AF8B073C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF8B1F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
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

void sub_1AF8B2184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF8B2BB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1AF8B4B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
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

void sub_1AF8B4D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CalImageFromGlyph(void *a1)
{
  id v1;
  void *v2;
  CGSize v4;

  v1 = a1;
  objc_msgSend(v1, "size");
  UIGraphicsBeginImageContextWithOptions(v4, 0, 0.0);
  objc_msgSend(v1, "drawAtPoint:", 0.0, 0.0);

  UIGraphicsGetImageFromCurrentImageContext();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v2;
}

void sub_1AF8B7CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF8BB188(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF8BB29C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF8BB310(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF8BB3B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF8BBEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF8BC460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF8BC5B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1AF8BE754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF8BFA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, id *a12, id *a13, id *a14, uint64_t a15, uint64_t a16, uint64_t a17, id *a18, uint64_t a19, uint64_t a20,id *a21,uint64_t a22,id *a23,id *a24,id *a25,id *a26,id *a27)
{
  uint64_t v27;

  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a18);
  objc_destroyWeak(a21);
  objc_destroyWeak(a23);
  objc_destroyWeak(a24);
  objc_destroyWeak(a25);
  objc_destroyWeak(a26);
  objc_destroyWeak(a27);
  objc_destroyWeak((id *)(v27 - 112));
  _Unwind_Resume(a1);
}

void sub_1AF8C2478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 144));
  _Unwind_Resume(a1);
}

void sub_1AF8C2EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1AF8C56C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  uint64_t v0;

  return v0;
}

void sub_1AF8CC648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3(void *a1, const char *a2)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

uint64_t OUTLINED_FUNCTION_4()
{
  void *v0;

  return objc_msgSend(v0, "systemFontSize");
}

void sub_1AF8CF134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

id getCNComposeRecipientClass()
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
  v0 = (void *)getCNComposeRecipientClass_softClass;
  v7 = getCNComposeRecipientClass_softClass;
  if (!getCNComposeRecipientClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNComposeRecipientClass_block_invoke;
    v3[3] = &unk_1E6018EE8;
    v3[4] = &v4;
    __getCNComposeRecipientClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AF8D3B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNComposeRecipientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E601A160;
    v5 = 0;
    ContactsAutocompleteUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary)
    __getCNComposeRecipientClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CNComposeRecipient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNComposeRecipientClass_block_invoke_cold_2();
  getCNComposeRecipientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AF8D55C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1AF8D5A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  id *v12;
  id *v13;
  uint64_t v14;

  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 112));
  _Unwind_Resume(a1);
}

void sub_1AF8D9990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 232), 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
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

void sub_1AF8DA450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF8DB1A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1AF8DC240(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1AF8DCEC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;
  uint64_t v26;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(v24);
  objc_destroyWeak((id *)(v26 - 112));
  _Unwind_Resume(a1);
}

void sub_1AF8DDCA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(v17);
  objc_destroyWeak((id *)(v20 - 72));
  _Unwind_Resume(a1);
}

void sub_1AF8DE0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF8DF21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF8E0544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id logHandle()
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global_27);
  return (id)logHandle_handle;
}

void __logHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(EKUILogSubsystem, "EKUIAppReview");
  v1 = (void *)logHandle_handle;
  logHandle_handle = (uint64_t)v0;

}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1AF8E1FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMStreamsClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMStreamsClass_block_invoke_cold_1();
  getBMStreamsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void BiomeStreamsLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E601A810;
    v2 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
    BiomeStreamsLibrary_cold_1(&v0);
}

Class __getBMDiscoverabilitySignalEventClass_block_invoke(uint64_t a1)
{
  Class result;

  BiomeStreamsLibrary();
  result = objc_getClass("BMDiscoverabilitySignalEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1();
  getBMDiscoverabilitySignalEventClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AF8ECD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF8EFF48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
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

void _EKStringFactoryHandleSignificantTimeChange()
{
  id v0;

  +[EKStringFactory sharedInstance](EKStringFactory, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_invalidateFormatters");

}

void sub_1AF8F3760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
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

uint64_t ScaledCalendarColorDotImageForColor(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D0CDA0], "scaledCalendarColorDotImageForColor:font:", a1, a2);
}

uint64_t ScaledCalendarColorChooserDotImageForColor(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D0CDA0], "scaledCalendarColorChooserDotImageForColor:font:", a1, a2);
}

uint64_t ScaledCalendarColorDotImageForColor_SuggestedEvent(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D0CDA0], "scaledCalendarColorDotImageForColor_SuggestedEvent:font:", a1, a2);
}

uint64_t ScaledCalendarInvitationDot(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D0CDA0], "scaledCalendarInvitationDotForFont:", a1);
}

uint64_t CarImage_Occurrences()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("car.fill"));
}

uint64_t CarImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("car.fill"));
}

uint64_t WalkmanImage_Occurrences()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("figure.walk"));
}

uint64_t WalkmanImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("figure.walk"));
}

uint64_t BicycleImage_Occurrences()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bicycle"));
}

uint64_t BicycleImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bicycle"));
}

uint64_t TransitImage_Occurrences()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("tram.fill"));
}

uint64_t TransitImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("tram.fill"));
}

id BirthdayImage()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D0CDF8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "birthdayImageForFont:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t PendingImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("questionmark.circle"));
}

id ImageForAvailabilityType(uint64_t a1)
{
  int v1;
  void *v2;
  const __CFString *v3;

  if (a1)
  {
    v1 = objc_msgSend(MEMORY[0x1E0CA9FE8], "showTypeAsBusy:", a1);
    v2 = (void *)MEMORY[0x1E0DC3870];
    if (v1)
      v3 = CFSTR("xmark.circle");
    else
      v3 = CFSTR("checkmark.circle");
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0DC3870];
    v3 = CFSTR("questionmark.circle");
  }
  objc_msgSend(v2, "systemImageNamed:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t BusyImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle"));
}

uint64_t FreeImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
}

id AccessibilityLabelForAvailabilityType(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;

  if (a1)
  {
    v1 = objc_msgSend(MEMORY[0x1E0CA9FE8], "showTypeAsBusy:", a1);
    EventKitUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v1)
    {
      v4 = CFSTR("Busy - accessibility");
      v5 = CFSTR("Busy");
    }
    else
    {
      v4 = CFSTR("Free - accessibility");
      v5 = CFSTR("Free");
    }
  }
  else
  {
    EventKitUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("Pending - accessibility");
    v5 = CFSTR("Pending");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id TableViewCheckmarkImage(void *a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v1 = (void *)MEMORY[0x1E0DC1358];
  v2 = *MEMORY[0x1E0DC4A88];
  v3 = a1;
  objc_msgSend(v1, "preferredFontDescriptorWithTextStyle:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[EKUIConstrainedFontUtilities tableViewCellCappedSymbolImageScaleWithScale:traitCollection:](EKUIConstrainedFontUtilities, "tableViewCellCappedSymbolImageScaleWithScale:traitCollection:", 2, v3);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id TableViewDisclosureIndicatorImage(void *a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = (void *)MEMORY[0x1E0DC1358];
  v2 = *MEMORY[0x1E0DC4A88];
  v3 = a1;
  objc_msgSend(v1, "defaultFontDescriptorWithTextStyle:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[EKUIConstrainedFontUtilities tableViewCellCappedSymbolImageScaleWithScale:traitCollection:](EKUIConstrainedFontUtilities, "tableViewCellCappedSymbolImageScaleWithScale:traitCollection:", 1, v3);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.forward"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithTintColor:renderingMode:", v9, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id BadgeImageForHoliday(void *a1, uint64_t a2, void *a3, float64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CGContext *CurrentContext;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  CGSize v21;

  v7 = a1;
  v8 = a3;
  if (BadgeImageForHoliday_onceToken != -1)
    dispatch_once(&BadgeImageForHoliday_onceToken, &__block_literal_global_29);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _UniqueDotHashForColorAndRadiusAndInterfaceStyleAndLocale(v7, a2 == 1, v8, a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)BadgeImageForHoliday___CachedHolidayBadgeImages, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v21.width = a4;
    v21.height = a4;
    UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CUIKTextColorForCalendarColorForStyle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CGContextBeginPath(CurrentContext);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, a4, a4);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v13, "CGPath"));
    CGContextClip(CurrentContext);
    objc_msgSend(v12, "setFill");
    EventKitUIBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    FailProofLocale(v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:localization:", CFSTR("Holiday character glyph"), CFSTR("H"), 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", ceil(a4 * 0.75));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_legacy_sizeWithFont:", v17);
    CalRoundToScreenScale((a4 - v18) * 0.5);
    objc_msgSend(v16, "drawInRect:withFont:lineBreakMode:alignment:lineSpacing:", v17, 2, 1, 0, 0.0, v19, a4, a4);
    UIGraphicsGetImageFromCurrentImageContext();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend((id)BadgeImageForHoliday___CachedHolidayBadgeImages, "setObject:forKey:", v10, v9);

  }
  return v10;
}

unint64_t _UniqueDotHashForColorAndRadiusAndInterfaceStyleAndLocale(void *a1, int a2, void *a3, float64_t a4)
{
  id v6;
  unint64_t v7;
  float64x2_t v8;
  uint64_t v9;
  float64x2_t v10;
  int8x16_t v11;
  int8x16_t v12;
  uint64_t v13;
  int8x16_t v14;
  float64x2_t v16;
  float64x2_t v18;
  float64_t v19;
  float64_t v20;
  float64_t v21;
  double v22;

  v21 = 0.0;
  v22 = 0.0;
  v19 = 0.0;
  v20 = 0.0;
  v6 = a3;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v22, &v21, &v20, &v19);
  v7 = (unint64_t)(v22 * 100.0);
  v8.f64[0] = v20;
  v8.f64[1] = v19;
  v16 = v8;
  v8.f64[0] = a4;
  v8.f64[1] = v21;
  v18 = v8;
  v9 = objc_msgSend(v6, "hash");

  v10 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
  v11 = (int8x16_t)vshlq_u64(vcvtq_u64_f64(vmulq_f64(v18, v10)), (uint64x2_t)xmmword_1AFA134E0);
  v12 = (int8x16_t)vshlq_u64(vcvtq_u64_f64(vmulq_f64(v16, v10)), (uint64x2_t)xmmword_1AFA134F0);
  v13 = 0x800000000;
  if (!a2)
    v13 = 0;
  v14 = vorrq_s8(v11, v12);
  return (*(_QWORD *)&vorr_s8(*(int8x8_t *)v14.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL)) | v7 | v13) ^ v9;
}

id FailProofLocale(void *a1)
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
  id v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLocalizations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v7 = (void *)MEMORY[0x1E0CB34D0];
    v12[0] = v1;
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v6;
  }

  return v10;
}

id BadgeImageForAlternateWorkday(void *a1, uint64_t a2, void *a3, float64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CGContext *CurrentContext;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  CGSize v22;
  CGRect v23;

  v7 = a1;
  v8 = a3;
  if (BadgeImageForAlternateWorkday_onceToken != -1)
    dispatch_once(&BadgeImageForAlternateWorkday_onceToken, &__block_literal_global_51);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", _UniqueDotHashForColorAndRadiusAndInterfaceStyleAndLocale(v7, a2 == 1, v8, a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)BadgeImageForAlternateWorkday___CachedAlternateWorkdayBadgeImages, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v22.width = a4;
    v22.height = a4;
    UIGraphicsBeginImageContextWithOptions(v22, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CUIKTextColorForCalendarColorForStyle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CGContextBeginPath(CurrentContext);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.0, 0.0, a4, a4);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v13, "CGPath"));
    CGContextClip(CurrentContext);
    if (a2 == 2)
      CUIKColorDarkenedToPercentageWithFinalAlpha();
    else
      CUIKColorLightenedToPercentageWithFinalAlpha();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFill");
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = a4;
    v23.size.height = a4;
    CGContextFillEllipseInRect(CurrentContext, v23);
    objc_msgSend(v12, "setFill");
    EventKitUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    FailProofLocale(v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:localization:", CFSTR("Alternate workday character glyph"), CFSTR("W"), 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", ceil(a4 * 0.75));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_legacy_sizeWithFont:", v18);
    CalRoundToScreenScale((a4 - v19) * 0.5);
    objc_msgSend(v17, "drawInRect:withFont:lineBreakMode:alignment:lineSpacing:", v18, 2, 1, 0, 0.0, v20, a4, a4);
    UIGraphicsGetImageFromCurrentImageContext();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    objc_msgSend((id)BadgeImageForAlternateWorkday___CachedAlternateWorkdayBadgeImages, "setObject:forKey:", v10, v9);

  }
  return v10;
}

id ImageForAttributes(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CC17D0];
  v2 = a1;
  objc_msgSend(v1, "imageForStyle:size:forScale:format:", v2, 3, 0, EKUIScaleFactor());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ImageForMapItem(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CC17D0];
  v2 = a1;
  objc_msgSend(v1, "imageForMapItem:forScale:fallbackToBundleIcon:", v2, 0, EKUIScaleFactor());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    MapPinImage();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

id MapPinImage()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D270A8], "markerStyleAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC17D0], "imageForStyle:size:forScale:format:", v0, 4, 0, EKUIScaleFactor());
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1AF8FA1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF8FD36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF8FDCB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(v20);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_1AF9002F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

id getCNComposeRecipientClass_0()
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
  v0 = (void *)getCNComposeRecipientClass_softClass_0;
  v7 = getCNComposeRecipientClass_softClass_0;
  if (!getCNComposeRecipientClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNComposeRecipientClass_block_invoke_0;
    v3[3] = &unk_1E6018EE8;
    v3[4] = &v4;
    __getCNComposeRecipientClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AF901A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNComposeRecipientClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_1E601AC08;
    v5 = 0;
    ContactsAutocompleteUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary_0)
    __getCNComposeRecipientClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("CNComposeRecipient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNComposeRecipientClass_block_invoke_cold_2_0();
  getCNComposeRecipientClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AF903604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;
  id *v28;
  uint64_t v29;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v29 - 144));
  _Unwind_Resume(a1);
}

void sub_1AF905734(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_1AF905C68(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1AF906274(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1AF906AF8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 144));
  _Unwind_Resume(a1);
}

void sub_1AF906F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
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

void sub_1AF90CE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  id *v36;
  id *v37;

  objc_destroyWeak(v37);
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  objc_destroyWeak(a9);
  objc_destroyWeak(&a36);
  _Unwind_Resume(a1);
}

void sub_1AF911380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id a45)
{
  id *v45;
  id *v46;

  objc_destroyWeak(v46);
  objc_destroyWeak(v45);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a45);
  _Unwind_Resume(a1);
}

void sub_1AF916668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF917448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF919B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void locationAuthorizationsChanged()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("EKAlarmsViewModelTTLLocationAuthorizationStatusNeedsReloadNotification"), 0);

}

void sub_1AF91C5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id location;

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double LongTailSpringAnimaionGoodEnoughEndingTime()
{
  return springAnimationDuration() * 0.5;
}

void sub_1AF91F5D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AF91F8C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AF91FA48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void sub_1AF923A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1AF924ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF925E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF928514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  uint64_t v60;

  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose((const void *)(v60 - 232), 8);
  _Block_object_dispose((const void *)(v60 - 184), 8);
  _Block_object_dispose((const void *)(v60 - 136), 8);
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

void sub_1AF928D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF92A590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a32);
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

void sub_1AF930890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
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

void sub_1AF930C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t CompareEKAttachments(void *a1, const char *a2)
{
  return objc_msgSend(a1, "compareFileNames:", a2);
}

void sub_1AF93A0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  id *v27;

  objc_destroyWeak(location);
  objc_destroyWeak(v27);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_1AF93BA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a68;

  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Unwind_Resume(a1);
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

id CalDisplayedTitleForSourceAsCalendarTarget(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  int v8;

  v1 = a1;
  if (objc_msgSend(v1, "sourceType") == 4)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone")))
    {
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("On My iPhone");
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("iPad")))
    {
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("On My iPad");
    }
    else
    {
      v8 = objc_msgSend(v3, "isEqualToString:", CFSTR("iPod touch"));
      EventKitUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v8)
        v6 = CFSTR("On My iPod touch");
      else
        v6 = CFSTR("On My Device");
    }
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E601DFA8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CUIKDisplayedTitleForSource();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void CalAddInlineMenuItemArrayToArrayWithTitle(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0DC39D0];
    v6 = a1;
    objc_msgSend(v5, "menuWithTitle:image:identifier:options:children:", a3, 0, 0, 1, a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:");

  }
  else
  {
    v7 = a1;
    objc_msgSend(v7, "addObjectsFromArray:", a2);
  }

}

BOOL _CalEventIsOnOneDay(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;

  v3 = a2;
  v4 = a1;
  CUIKCalendar();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "components:fromDate:", 28, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "day");
  if (v8 == objc_msgSend(v7, "day") && (v9 = objc_msgSend(v6, "month"), v9 == objc_msgSend(v7, "month")))
  {
    v10 = objc_msgSend(v6, "year");
    v11 = v10 == objc_msgSend(v7, "year");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void _CalDetailStringsForDate(void *a1, void *a2, void *a3, void *a4, char a5, uint64_t a6, int a7, _QWORD *a8, _QWORD *a9, _QWORD *a10, _QWORD *a11)
{
  _QWORD *v17;
  id v18;
  id v19;
  _BOOL4 v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v60;
  id v61;

  v17 = a10;
  v61 = a1;
  v18 = a2;
  v60 = a3;
  v19 = a4;
  v20 = _CalEventIsOnOneDay(v61, v18);
  v21 = v20;
  if ((a5 & 1) != 0)
  {
    if (v20)
    {
      if (a7)
      {
        EventKitUIBundle();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("All day"), &stru_1E601DFA8, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0;
        v25 = 0;
        v26 = 0;
LABEL_20:
        v36 = a11;
LABEL_21:
        v37 = a9;
        goto LABEL_28;
      }
      CUIKLongDayStringForDate();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      EventKitUIBundle();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("All day"), &stru_1E601DFA8, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      CUIKStringForDateAndDayOfWeekInCalendarTimezone();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKStringForDateAndDayOfWeekInCalendarTimezone();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("All day from %@"), &stru_1E601DFA8, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringWithFormat:", v32, v28);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("to %@"), &stru_1E601DFA8, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringWithFormat:", v35, v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = a10;
    }
    v24 = 0;
    v25 = 0;
    goto LABEL_20;
  }
  if ((CUIKShouldShowTimezoneClarification() & 1) != 0)
    v27 = 1;
  else
    v27 = CUIKShouldShowTimezoneClarification();
  if (!v21)
  {
    v58 = v19;
    CUIKStringForTimeWithTZIfDivergent();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKStringForDateAndDayOfWeekInCalendarTimezone();
    v39 = objc_claimAutoreleasedReturnValue();
    CUIKStringForTimeWithTZIfDivergent();
    v40 = objc_claimAutoreleasedReturnValue();
    CUIKStringForDateAndDayOfWeekInCalendarTimezone();
    v41 = objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("from %@ %@"), &stru_1E601DFA8, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    EventKitUIBundle();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("to %@ %@"), &stru_1E601DFA8, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = (void *)v39;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v43, v38, v39);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)v41;
    v56 = (void *)v40;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v45, v40, v41);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v25 = 0;
    if (v27)
    {
      v46 = (void *)MEMORY[0x1E0CB3940];
      v54 = v38;
      CUIKStringForTimeWithTZ();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKStringForDateAndDayOfWeekInTimezone();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "localizedStringWithFormat:", v43, v47, v48);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = (void *)MEMORY[0x1E0CB3940];
      CUIKStringForTimeWithTZ();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      CUIKStringForDateAndDayOfWeekInTimezone();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v49;
      v38 = v54;
      objc_msgSend(v52, "localizedStringWithFormat:", v45, v50, v51);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v36 = a11;
    v17 = a10;
    v19 = v58;
    goto LABEL_21;
  }
  if (!a6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("CUIKDetailStringsForDate: unspecified size class"));
  if (a7)
  {
    CUIKDurationStringForDates();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = a9;
    v36 = a11;
    if (v27)
    {
      CUIKTimezoneClarificationStringForDates();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
    }
    else
    {
      v24 = 0;
      v25 = 0;
    }
    v26 = 0;
  }
  else
  {
    CUIKLongDayStringForDate();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKDurationStringForDates();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = a9;
    v36 = a11;
    if (v27)
    {
      CUIKTimezoneClarificationStringForDates();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
    }
    else
    {
      v24 = 0;
      v25 = 0;
    }
  }
  v17 = a10;
LABEL_28:
  if (a8)
    *a8 = objc_retainAutorelease(v26);
  if (v37)
    *v37 = objc_retainAutorelease(v23);
  if (v17)
    *v17 = objc_retainAutorelease(v25);
  if (v36)
    *v36 = objc_retainAutorelease(v24);

}

void CalDetailStringsForCalendarEvent(void *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, void *a7, int a8)
{
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;

  v25 = a1;
  v14 = a7;
  v15 = v14;
  if (v14)
  {
    v16 = v14;
    objc_msgSend(v25, "endDateUnadjustedForLegacyClients");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v18);
    v20 = v19;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v16, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startTimeZone");
  }
  else
  {
    objc_msgSend(v25, "startDate");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "endDateUnadjustedForLegacyClients");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "endTimeZone");
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "startTimeZone");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _CalDetailStringsForDate(v16, v21, v23, v22, objc_msgSend(v25, "isAllDay"), a2, a8, a3, a4, a5, a6);

}

uint64_t CalAddInlineMenuItemArrayToArray(void *a1, const char *a2)
{
  return objc_msgSend(a1, "addObjectsFromArray:", a2);
}

void sub_1AF94063C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

void sub_1AF9413F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

BOOL EKUIUsesLargeTextYearView(void *a1)
{
  NSString *v1;
  void *v2;
  _BOOL8 v3;

  if (a1)
  {
    objc_msgSend(a1, "preferredContentSizeCategory");
    v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredContentSizeCategoryOrOverride");
    v1 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  v3 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]) == NSOrderedDescending;

  return v3;
}

void sub_1AF941B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF943158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF944EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

double EKRoundWithScale(double a1, double a2)
{
  double v2;
  void *v4;
  double v5;

  v2 = a2;
  if (a2 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v2 = v5;

  }
  return round(v2 * a1) / v2;
}

void sub_1AF947794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF94855C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF948694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AF94A214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF94E254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

Class __getREMObjectIDClass_block_invoke_0(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_0();
  result = objc_getClass("REMObjectID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMObjectIDClass_block_invoke_cold_1_0();
  getREMObjectIDClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
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
    v1 = xmmword_1E601B8C0;
    v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_0)
    ReminderKitLibrary_cold_1_0(&v0);
}

Class __getREMStoreClass_block_invoke_0(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_0();
  result = objc_getClass("REMStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMStoreClass_block_invoke_cold_1_0();
  getREMStoreClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AF953978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

BOOL CalIsRectEffectivelyEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;

  v8 = a1;
  v9 = a5;
  if (vabds_f32(v8, v9) >= 0.00000011921)
    return 0;
  v10 = a2;
  v11 = a6;
  if (vabds_f32(v10, v11) >= 0.00000011921)
    return 0;
  v12 = a3;
  v13 = a7;
  if (vabds_f32(v12, v13) >= 0.00000011921)
    return 0;
  v14 = a4;
  v15 = a8;
  return vabds_f32(v14, v15) < 0.00000011921;
}

double CalRoundPointToScreenScale(double a1, double a2)
{
  double v3;
  double v4;

  v3 = a1;
  if (a1 != (double)(int)a1)
  {
    UIRoundToViewScale();
    v3 = v4;
  }
  if (a2 != (double)(int)a2)
    UIRoundToViewScale();
  return v3;
}

double EKUIPixelSizeInPoints()
{
  if (EKUIPixelSizeInPoints_onceToken != -1)
    dispatch_once(&EKUIPixelSizeInPoints_onceToken, &__block_literal_global_49);
  return *(double *)&EKUIPixelSizeInPoints_pixelSizeInPoints;
}

double EKUISeparatorLineThickness()
{
  uint64_t v0;

  v0 = CalOnePixelInPoints___scale;
  if (*(double *)&CalOnePixelInPoints___scale == -1.0)
  {
    *(double *)&v0 = _EKUIScaleFactor();
    CalOnePixelInPoints___scale = v0;
  }
  return 1.0 / *(double *)&v0;
}

void CalUpdateUserInterfaceDirection()
{
  id v0;

  +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _leftToRight = objc_msgSend(v0, "layoutDirectionOrOverride") == 0;

}

void _LocaleChanged()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  __calendarDirectionLeftToRight = objc_msgSend(v0, "_calendarDirection") == 0;

}

void sub_1AF954734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF955FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 168));
  _Unwind_Resume(a1);
}

void sub_1AF956D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF959D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_1AF95B298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF95BBB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  id *v32;

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF95C778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DarkenWhiteIfNeeded(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = v1;
  if (CUIKColorIsWhite())
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id CalendarTitleWithDotAttributedString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = a1;
  CUIKDisplayedTitleForCalendar();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKAdjustedColorForBackgroundColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[EKUICalendarMenu calendarCircleImageForColor:](EKUICalendarMenu, "calendarCircleImageForColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("%@ %@"));
  v13 = (void *)objc_msgSend(v11, "initWithFormat:options:locale:", v12, 0, 0, v10, v5);

  return v13;
}

void sub_1AF965FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _calendarPreferencesTableAdditionsDefaultFont()
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

id _calendarPreferencesTableAdditionsBoldFont()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v0, "symbolicTraits") | 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v1, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1AF969224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
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

void sub_1AF969478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF96C9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF96CB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF96CC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

id getQLPreviewControllerClass()
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
  v0 = (void *)getQLPreviewControllerClass_softClass;
  v7 = getQLPreviewControllerClass_softClass;
  if (!getQLPreviewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getQLPreviewControllerClass_block_invoke;
    v3[3] = &unk_1E6018EE8;
    v3[4] = &v4;
    __getQLPreviewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AF96ED78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getQLPreviewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!QuickLookLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E601C260;
    v5 = 0;
    QuickLookLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!QuickLookLibraryCore_frameworkLibrary)
    __getQLPreviewControllerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("QLPreviewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getQLPreviewControllerClass_block_invoke_cold_2();
  getQLPreviewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AF9703F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void PresentValidationAlert(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = a1;
  EventKitUIBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Cannot Save Event"), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PresentValidationAlertWithDefaultTitle(v4, v3, v5);

}

void PresentValidationAlertWithDefaultTitle(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  v9 = a1;
  objc_msgSend(v7, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D68]);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *MEMORY[0x1E0CA9F68];
    goto LABEL_10;
  }
  objc_msgSend(v7, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CA9F68];
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CA9F68]);

  if (v14)
  {
    v15 = objc_msgSend(v7, "code");
    if (v15 == 8)
    {
      EventKitUIBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("Alert Time");
LABEL_8:
      objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E601DFA8, 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_10;
      goto LABEL_9;
    }
    if (v15 == 7)
    {
      EventKitUIBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = CFSTR("Cannot Repeat Event");
      goto LABEL_8;
    }
  }
LABEL_9:
  v11 = v8;
LABEL_10:

  v27 = v7;
  objc_msgSend(v27, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", v12);

  if (v20)
  {
    objc_msgSend(v27, "localizedDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v11, v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E601DFA8, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v26);

  objc_msgSend(v9, "presentViewController:animated:completion:", v22, 1, 0);
}

void PresentJunkAlertControllerWithHandler(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  v6 = a1;
  EventKitUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("You can report this invitation as junk by sending it to Apple."), &stru_1E601DFA8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Delete and Report Junk"), &stru_1E601DFA8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, 0, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __PresentJunkAlertControllerWithHandler_block_invoke;
  v19[3] = &unk_1E601C010;
  v20 = v5;
  v13 = v5;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v10, 2, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Cancel - report as spam"), CFSTR("Cancel"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v18);

  objc_msgSend(v6, "presentViewController:animated:completion:", v11, 1, 0);
}

void PresentJunkAlertControllerForEvent(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PresentJunkAlertControllerForEvent_block_invoke;
  v5[3] = &unk_1E6018688;
  v6 = v3;
  v4 = v3;
  PresentJunkAlertControllerWithHandler(a2, 0, v5);

}

void PresentJunkAlertDialogForEvent(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PresentJunkAlertDialogForEvent_block_invoke;
  v5[3] = &unk_1E6018688;
  v6 = v3;
  v4 = v3;
  PresentJunkAlertControllerWithHandler(a2, 1, v5);

}

void PresentJunkAlertControllerForCalendar(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PresentJunkAlertControllerForCalendar_block_invoke;
  v5[3] = &unk_1E6018688;
  v6 = v3;
  v4 = v3;
  PresentJunkAlertControllerWithHandler(a2, 0, v5);

}

void PresentJunkAlertDialogForCalendar(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PresentJunkAlertDialogForCalendar_block_invoke;
  v5[3] = &unk_1E6018688;
  v6 = v3;
  v4 = v3;
  PresentJunkAlertControllerWithHandler(a2, 1, v5);

}

void sub_1AF971BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF972160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF97231C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF973FA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

Class __getREMRecurrenceRuleFormatterClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_1)
  {
    v4 = xmmword_1E601C2A0;
    v5 = 0;
    ReminderKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_1)
    __getREMRecurrenceRuleFormatterClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("REMRecurrenceRuleFormatter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMRecurrenceRuleFormatterClass_block_invoke_cold_2();
  getREMRecurrenceRuleFormatterClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

objc_class *__MessageUIClassFromString(void *a1)
{
  NSString *v1;
  void *v2;
  void *v3;
  id v4;
  char *v5;
  Class v6;
  objc_class *v7;

  v1 = a1;
  if (__MessageUIHandle_MessageUIHandle)
    goto LABEL_5;
  MEMORY[0x1B5DFE6A8]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("System/Library/Frameworks/MessageUI.framework/MessageUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_retainAutorelease(v3);
  __MessageUIHandle_MessageUIHandle = (uint64_t)dlopen((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 1);
  if (!__MessageUIHandle_MessageUIHandle)
  {
    v5 = dlerror();
    NSLog(CFSTR("Couldn't load MessageUI: %s"), v5);
  }

  if (__MessageUIHandle_MessageUIHandle)
LABEL_5:
    v6 = NSClassFromString(v1);
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

void sub_1AF9756EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF975D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF977560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id EKUILogSignpostHandle()
{
  if (EKUILogSignpostHandle_onceToken != -1)
    dispatch_once(&EKUILogSignpostHandle_onceToken, &__block_literal_global_6);
  return (id)EKUILogSignpostHandle_handle;
}

void sub_1AF97AD58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 256));
  _Unwind_Resume(a1);
}

uint64_t _EKUIAssert(uint64_t result, uint64_t a2)
{
  if ((result & 1) == 0)
    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("EKUIDeviceCapabilities assertion failed: %@"), a2);
  return result;
}

BOOL _floatLessThanOrEqual(double a1, double a2)
{
  return a2 - a1 > -0.001;
}

uint64_t EKUICatalyst()
{
  return 0;
}

BOOL EKUIUnscaledCatalyst()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  return v1 == 5;
}

double EKUIUnscaledCatalystTableRowHeightDefault()
{
  return 34.0;
}

uint64_t EKUIShouldUseUIKitLayoutMargins()
{
  void *v0;
  double v1;
  double v2;
  uint64_t v3;
  uint64_t v5;

  EKUIMainWindowForMultiwindowError();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ekui_size");
  v3 = 0;
  if (v0)
  {
    if (v1 > 1.0 && v2 > 1.0)
    {
      v5 = EKUIWindowSizeParadigmForWindowSize(v1, v2);
      v3 = 1;
      if (v5 <= 0x1FFFFFF)
      {
        if (v5 != 0x80000 && v5 != 0x800000)
          goto LABEL_13;
      }
      else if (v5 != 0x2000000 && v5 != 0x8000000 && v5 != 0x20000000)
      {
LABEL_13:
        v3 = 0;
      }
    }
  }

  return v3;
}

uint64_t EKUIIsCompactThickWidthRegularTallHeight()
{
  void *v0;
  double v1;
  double v2;
  uint64_t v3;
  uint64_t v5;

  EKUIMainWindowForMultiwindowError();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ekui_size");
  v3 = 0;
  if (v0)
  {
    if (v1 > 1.0 && v2 > 1.0)
    {
      v5 = EKUIWindowSizeParadigmForWindowSize(v1, v2);
      v3 = 1;
      if (v5 <= 0xFFFFFF)
      {
        if (v5 != 0x40000 && v5 != 0x400000)
          goto LABEL_13;
      }
      else if (v5 != 0x1000000 && v5 != 0x4000000 && v5 != 0x10000000)
      {
LABEL_13:
        v3 = 0;
      }
    }
  }

  return v3;
}

uint64_t _EKUIOverriddenTraitsPhonesBehaveLikeiPhoneSixPlus()
{
  return 0;
}

uint64_t EKUIIsExtended(void *a1)
{
  id v1;
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;

  v1 = a1;
  v2 = EKUICurrentWindowSizeParadigmForViewHierarchy(v1);
  if (_EKUIActiveWidthSizeClass(v1) == 1)
  {
    if (v2 == 0x20000)
      goto LABEL_6;
    v3 = EKUICurrentWindowWidthWithViewHierarchy(v1);
    v4 = EKUICurrentWindowHeightWithViewHierarchy(v1);
    if (v3 >= v4)
      v4 = v3;
    if (fabs(v4 + -812.0) < 2.22044605e-16)
    {
LABEL_6:
      v5 = 1;
      goto LABEL_22;
    }
  }
  v5 = 1;
  if (v2 > 0x1FFFFFF)
  {
    if (v2 <= 0x7FFFFFF)
    {
      if (v2 == 0x2000000)
        goto LABEL_22;
      v6 = 0x4000000;
      goto LABEL_21;
    }
    if (v2 != 0x8000000 && v2 != 0x10000000)
    {
      v6 = 0x20000000;
LABEL_21:
      if (v2 == v6)
        goto LABEL_22;
LABEL_23:
      v5 = 0;
    }
  }
  else if (v2 < 0x400000)
  {
    if (v2 != 0x40000 && v2 != 0x80000)
      goto LABEL_23;
  }
  else if (v2 != 0x400000 && v2 != 0x800000)
  {
    v6 = 0x1000000;
    goto LABEL_21;
  }
LABEL_22:

  return v5;
}

uint64_t EKUIIsSizeExtended(double a1, double a2)
{
  uint64_t v4;
  uint64_t result;
  double v6;
  double v7;

  v4 = EKUIWindowSizeParadigmForWindowSize(a1, a2);
  result = 1;
  if (v4 <= 0x1FFFFFF)
  {
    if (v4 == 0x80000 || v4 == 0x800000)
      return result;
  }
  else if (v4 == 0x2000000 || v4 == 0x8000000 || v4 == 0x20000000)
  {
    return result;
  }
  v6 = -(375.0 - a2);
  if (375.0 - a2 >= 0.0)
    v6 = 375.0 - a2;
  if (v6 >= 0.00001)
    return 0;
  v7 = 812.0 - a1;
  if (812.0 - a1 < 0.0)
    v7 = -(812.0 - a1);
  if (v7 >= 0.00001)
    return 0;
  return result;
}

double EKUIApplicationFrame(void *a1)
{
  id v1;

  v1 = a1;
  EKUICurrentWindowWidthWithViewHierarchy(v1);
  EKUICurrentWindowHeightWithViewHierarchy(v1);

  return 0.0;
}

double EKUIContainedControllerIdealWidth()
{
  void *v0;
  void *v1;
  double v2;

  +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "viewHierarchyOrOverride");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = fmin(EKUICurrentWindowWidthWithViewHierarchy(v1), 375.0);
  return v2;
}

double EKUIContainedControllerIdealHeight()
{
  void *v0;
  void *v1;
  double v2;

  +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "viewHierarchyOrOverride");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = fmin(EKUICurrentWindowHeightWithViewHierarchy(v1), 667.0);
  return v2;
}

double EKUIHeightForWindowSizeParadigm(uint64_t a1)
{
  double result;

  result = 320.0;
  if (a1 >= 0x20000)
  {
    if (a1 > 0xFFFFFF)
    {
      if (a1 <= 0x7FFFFFF)
      {
        switch(a1)
        {
          case 0x1000000:
            return 926.0;
          case 0x2000000:
            return 428.0;
          case 0x4000000:
            return 852.0;
        }
      }
      else if (a1 > 0x1FFFFFFF)
      {
        if (a1 == 0x20000000)
        {
          return 430.0;
        }
        else if (a1 == 0x40000000)
        {
          return 728.0;
        }
      }
      else if (a1 == 0x8000000)
      {
        return 393.0;
      }
      else if (a1 == 0x10000000)
      {
        return 932.0;
      }
      return result;
    }
    if (a1 >= 0x100000)
    {
      if (a1 >= 0x400000)
      {
        if (a1 == 0x400000)
          return 844.0;
        if (a1 == 0x800000)
          return 390.0;
        return result;
      }
      if (a1 == 0x100000)
        return 1194.0;
      if (a1 == 0x200000)
        return 834.0;
      return result;
    }
    if (a1 == 0x20000)
      return 812.0;
    if (a1 == 0x40000)
      return 896.0;
    if (a1 != 0x80000)
      return result;
    return 414.0;
  }
  if (a1 <= 1023)
  {
    if (a1 <= 15)
    {
      switch(a1)
      {
        case -1:
          if (_shouldAssertOnUnknownWindow_onceToken != -1)
            dispatch_once(&_shouldAssertOnUnknownWindow_onceToken, &__block_literal_global_39);
          if (_shouldAssertOnUnknownWindow_shouldAssert)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("EKUIDeviceCapabilities assertion failed: %@"), CFSTR("EKUIHeightForWindowSizeParadigm: Unable to find window height for paradigm"));
          return 1.84467441e19;
        case 2:
          return 480.0;
        case 4:
          result = 568.0;
          break;
        case 8:
          return 768.0;
        default:
          return result;
      }
      return result;
    }
    if (a1 <= 127)
    {
      if (a1 == 16)
        return 667.0;
      if (a1 == 32)
        return 736.0;
      return result;
    }
    if (a1 != 128 && a1 != 512)
      return result;
    return 768.0;
  }
  if (a1 < 0x2000)
  {
    if (a1 != 1024)
    {
      if (a1 != 2048)
      {
        if (a1 != 4096)
          return result;
        return 768.0;
      }
      return 1024.0;
    }
    return 414.0;
  }
  if (a1 < 0x8000)
  {
    if (a1 == 0x2000)
      return 1366.0;
    if (a1 != 0x4000)
      return result;
    return 1024.0;
  }
  if (a1 == 0x8000)
    return 1112.0;
  if (a1 == 0x10000)
    return 834.0;
  return result;
}

BOOL EKUICurrentHeightSizeClassIsRegular(void *a1)
{
  return _EKUIActiveHeightSizeClass(a1) == 2;
}

uint64_t EKUIInterfaceOrientationForViewHierarchy(void *a1)
{
  void *v1;
  uint64_t v2;

  _rootHierarchyForViewHierarchy(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ekui_interfaceOrientation");

  return v2;
}

double EKUIGoldenRatioPhi()
{
  return 1.61803399;
}

uint64_t EKUIGoldenRatioColumnWidthMinor(double a1)
{
  return CalRoundToScreenScale(a1 / 2.61803399);
}

uint64_t EKUIGoldenRatioColumnWidthMajor(double a1)
{
  double v1;

  CalRoundToScreenScale(a1 / 2.61803399);
  return CalRoundToScreenScale(v1 * 1.61803399);
}

BOOL EKUICurrentWidthSizeClassIsRegular()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  +[EKUIApplicationExtensionOverrides shared](EKUIApplicationExtensionOverrides, "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "viewHierarchyOrOverride");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = _EKUIActiveWidthSizeClass(v1) == 2;
  return v2;
}

void sub_1AF97C1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF97D0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF97ED38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF981FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1AF9826A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF986880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_1AF988EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
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

void sub_1AF9890B4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1AF98F410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF99470C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  id *v21;

  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getCNComposeRecipientTextViewClass()
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
  v0 = (void *)getCNComposeRecipientTextViewClass_softClass;
  v7 = getCNComposeRecipientTextViewClass_softClass;
  if (!getCNComposeRecipientTextViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNComposeRecipientTextViewClass_block_invoke;
    v3[3] = &unk_1E6018EE8;
    v3[4] = &v4;
    __getCNComposeRecipientTextViewClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AF99481C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF994D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

id getCNComposeRecipientClass_1()
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
  v0 = (void *)getCNComposeRecipientClass_softClass_1;
  v7 = getCNComposeRecipientClass_softClass_1;
  if (!getCNComposeRecipientClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNComposeRecipientClass_block_invoke_1;
    v3[3] = &unk_1E6018EE8;
    v3[4] = &v4;
    __getCNComposeRecipientClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AF994E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF995854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF996600(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF996B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF996D54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF996F60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF9975F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF9977B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getCNAutocompleteResultsTableViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsAutocompleteUILibrary();
  result = objc_getClass("CNAutocompleteResultsTableViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNAutocompleteResultsTableViewControllerClass_block_invoke_cold_1();
  getCNAutocompleteResultsTableViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ContactsAutocompleteUILibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary_1)
  {
    v1 = xmmword_1E601C6B8;
    v2 = 0;
    ContactsAutocompleteUILibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary_1)
    ContactsAutocompleteUILibrary_cold_1(&v0);
}

Class __getCNComposeRecipientTextViewClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsAutocompleteUILibrary();
  result = objc_getClass("CNComposeRecipientTextView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNComposeRecipientTextViewClass_block_invoke_cold_1();
  getCNComposeRecipientTextViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNComposeRecipientClass_block_invoke_1(uint64_t a1)
{
  Class result;

  ContactsAutocompleteUILibrary();
  result = objc_getClass("CNComposeRecipient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNComposeRecipientClass_block_invoke_cold_1_1();
  getCNComposeRecipientClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNComposeRecipientGroupClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsAutocompleteUILibrary();
  result = objc_getClass("CNComposeRecipientGroup");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNComposeRecipientGroupClass_block_invoke_cold_1();
  getCNComposeRecipientGroupClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNComposeRecipientOriginContextClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsAutocompleteUILibrary();
  result = objc_getClass("CNComposeRecipientOriginContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNComposeRecipientOriginContextClass_block_invoke_cold_1();
  getCNComposeRecipientOriginContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNAutocompleteSearchManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsAutocompleteUILibrary();
  result = objc_getClass("CNAutocompleteSearchManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNAutocompleteSearchManagerClass_block_invoke_cold_1();
  getCNAutocompleteSearchManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AF99AFB8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

id getPKScribbleInteractionClass()
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
  v0 = (void *)getPKScribbleInteractionClass_softClass;
  v7 = getPKScribbleInteractionClass_softClass;
  if (!getPKScribbleInteractionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPKScribbleInteractionClass_block_invoke;
    v3[3] = &unk_1E6018EE8;
    v3[4] = &v4;
    __getPKScribbleInteractionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AF99EF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKScribbleInteractionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!PencilKitLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E601C7D0;
    v5 = 0;
    PencilKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PencilKitLibraryCore_frameworkLibrary)
    __getPKScribbleInteractionClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PKScribbleInteraction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPKScribbleInteractionClass_block_invoke_cold_2();
  getPKScribbleInteractionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1AF9A2228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9A264C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9A3328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9A3D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9A5148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9A5840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9AD724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9AFF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double DraggedEventShadowOffset()
{
  return 0.0;
}

uint64_t DraggedEventShadowColor()
{
  id v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = objc_msgSend(v0, "CGColor");

  return v1;
}

double pinchDistanceForGestureRecognizer(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "locationOfTouch:inView:", 0, v3);
  v6 = v5;
  objc_msgSend(v4, "locationOfTouch:inView:", 1, v3);
  v8 = v7;

  return vabdd_f64(v6, v8);
}

void CalPlopView(void *a1)
{
  CalPlopViewWithScaleFactorAndCompletion(a1, 0, 1.0);
}

double CalSnapDateTo15MinuteOr5MinuteInterval(void *a1, int a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a1;
  v6 = v5;
  if (a2)
  {
    if (!v5 || (objc_msgSend(v5, "isNew") & 1) != 0)
      goto LABEL_8;
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v9 = a3 - v8;

    v10 = -v9;
    if (v9 >= 0.0)
      v10 = v9;
    if (v10 >= 149.0)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v6, "eventStore");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeZone");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTimeZone:", v17);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "components:fromDate:", 224, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v19, "minute");
      v21 = objc_msgSend(v19, "second") + 60 * v20;
      if (a2 != 3 && v21 >= 151 && v21 <= 449
        || a2 == 2 && v21 >= 1951 && v21 <= 2249
        || a2 == 3 && v21 >= 3151 && v21 <= 3449)
      {
        v13 = round(a3 / 300.0) * 300.0;
      }
      else
      {
        v13 = _CalSnapDateTo15MinuteIntervalWithMinimumMovementThreshold(v6, a3, 149.0);
      }

    }
    else
    {
      objc_msgSend(v6, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      v13 = v12;
    }

  }
  else
  {
    v13 = _CalSnapDateTo15MinuteIntervalWithMinimumMovementThreshold(v5, a3, 900.0);
  }

  return v13;
}

void CalPopViewIn(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v15, 0.1, 0.1);
  v14 = v15;
  objc_msgSend(v3, "setTransform:", &v14);
  v5 = (void *)MEMORY[0x1E0DC3F10];
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __CalPopViewIn_block_invoke;
  v12[3] = &unk_1E6018688;
  v13 = v3;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __CalPopViewIn_block_invoke_2;
  v9[3] = &unk_1E601CC90;
  v10 = v13;
  v11 = v4;
  v7 = v4;
  v8 = v13;
  objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 0x20000, v12, v9, 0.100000001, 0.0);

}

void CalScaleViewIn(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v11 = a1;
  v12 = a2;
  objc_msgSend(v11, "frame");
  v14 = dbl_1AFA13D50[a5 - v13 == 0.0];
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowOpacity"), a5 - v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDuration:", v14);
  LODWORD(v16) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v17);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "shadowOpacity");
  objc_msgSend(v18, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v20);

  objc_msgSend(v11, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAnimation:forKey:", v15, CFSTR("animateOpacity"));

  v22 = (void *)MEMORY[0x1E0DC3F10];
  v23 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __CalScaleViewIn_block_invoke;
  v29[3] = &unk_1E601AA08;
  v30 = v11;
  v31 = a3;
  v32 = a4;
  v33 = a5;
  v34 = a6;
  v26[0] = v23;
  v26[1] = 3221225472;
  v26[2] = __CalScaleViewIn_block_invoke_2;
  v26[3] = &unk_1E601CC90;
  v27 = v30;
  v28 = v12;
  v24 = v12;
  v25 = v30;
  objc_msgSend(v22, "animateWithDuration:delay:options:animations:completion:", 0x20000, v29, v26, v14, 0.0);

}

void CalSwitchViewToSuperview(void *a1, void *a2)
{
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
  id v14;

  v14 = a1;
  v3 = a2;
  objc_msgSend(v14, "superview");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v3)
  {
    if (v3)
    {
      objc_msgSend(v14, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      objc_msgSend(v5, "convertRect:toView:", v3);
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;

      objc_msgSend(v3, "addSubview:", v14);
      objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
    }
    else
    {
      objc_msgSend(v14, "removeFromSuperview");
    }
  }

}

void sub_1AF9BCA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF9BDA8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

double CalSnapDateTo15MinuteInterval(void *a1, double a2)
{
  return _CalSnapDateTo15MinuteIntervalWithMinimumMovementThreshold(a1, a2, 900.0);
}

double _CalSnapDateTo15MinuteIntervalWithMinimumMovementThreshold(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v5 = a1;
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "isNew") & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = a2 - v8;

  v10 = -v9;
  if (v9 >= 0.0)
    v10 = v9;
  if (v10 >= a3)
  {
LABEL_7:
    v13 = round(a2 / 900.0) * 900.0;
  }
  else
  {
    objc_msgSend(v6, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;

  }
  return v13;
}

void CalScaleViewOut(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v11 = a1;
  v12 = a2;
  objc_msgSend(v11, "frame");
  v14 = dbl_1AFA13D60[a5 - v13 == 0.0];
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("shadowOpacity"), a5 - v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDuration:", v14);
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "shadowOpacity");
  objc_msgSend(v16, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v18);

  LODWORD(v19) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v20);

  objc_msgSend(v11, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAnimation:forKey:", v15, CFSTR("animateOpacity"));

  v22 = (void *)MEMORY[0x1E0DC3F10];
  v23 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __CalScaleViewOut_block_invoke;
  v29[3] = &unk_1E601AA08;
  v30 = v11;
  v31 = a3;
  v32 = a4;
  v33 = a5;
  v34 = a6;
  v26[0] = v23;
  v26[1] = 3221225472;
  v26[2] = __CalScaleViewOut_block_invoke_2;
  v26[3] = &unk_1E601CC90;
  v27 = v30;
  v28 = v12;
  v24 = v12;
  v25 = v30;
  objc_msgSend(v22, "animateWithDuration:delay:options:animations:completion:", 131076, v29, v26, v14, 0.0);

}

void CalPlopViewWithScaleFactorAndCompletion(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  double v13;
  _QWORD v14[4];
  id v15;
  double v16;
  _QWORD v17[5];
  id v18;

  v5 = a1;
  v6 = a2;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__21;
  v17[4] = __Block_byref_object_dispose__21;
  v18 = (id)objc_msgSend(v6, "copy");
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke;
  v14[3] = &unk_1E6018FC8;
  v15 = v5;
  v16 = a3;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __CalPlopViewWithScaleFactorAndCompletion_block_invoke_2;
  v10[3] = &unk_1E601CCE0;
  v9 = v15;
  v13 = a3;
  v11 = v9;
  v12 = v17;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0x10000, v14, v10, 0.100000001, 0.0);

  _Block_object_dispose(v17, 8);
}

void sub_1AF9BF37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__21(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

uint64_t sub_1AF9C09CC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1AF9C09DC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

double sub_1AF9C09EC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;

  type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  sub_1AF9C212C(&qword_1EEE6B850, (uint64_t (*)(uint64_t))type metadata accessor for EKEventGenericDetailOOPHostViewModel, (uint64_t)&unk_1AFA14760);
  *(_QWORD *)a1 = sub_1AF9F79F8();
  *(_QWORD *)(a1 + 8) = v2;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_QWORD *)(a1 + 80) = 0;
  return result;
}

uint64_t sub_1AF9C0A60@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  void (*v9)(void);
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  char v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  char *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;

  v2 = (uint64_t)v1;
  v51 = a1;
  v48 = sub_1AF9F79EC();
  MEMORY[0x1E0C80A78]();
  v50 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1AF9F7CA4();
  v52 = *(_QWORD *)(v4 - 8);
  v53 = v4;
  MEMORY[0x1E0C80A78]();
  v49 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B858);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = *v1;
  v8 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v9 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v54 + 1)) + 0x80);
  v10 = *((id *)&v54 + 1);
  v9();
  sub_1AF9C0F90((uint64_t)&v54);
  type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(0);
  sub_1AF9C212C(&qword_1EEE6B860, type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration, (uint64_t)&unk_1AFA13E20);
  v44 = sub_1AF9F79F8();
  v47 = v11;
  v12 = swift_allocObject();
  v13 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v12 + 64) = v13;
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v12 + 96) = *(_QWORD *)(v2 + 80);
  v14 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v12 + 32) = v14;
  v15 = v12;
  v16 = swift_allocObject();
  v17 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v16 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v16 + 64) = v17;
  *(_OWORD *)(v16 + 80) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v16 + 96) = *(_QWORD *)(v2 + 80);
  v18 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v16 + 32) = v18;
  v19 = v16;
  v20 = swift_allocObject();
  v21 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v20 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v20 + 64) = v21;
  *(_OWORD *)(v20 + 80) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v20 + 96) = *(_QWORD *)(v2 + 80);
  v22 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v20 + 32) = v22;
  v23 = v20;
  v24 = swift_allocObject();
  v25 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v24 + 64) = v25;
  *(_OWORD *)(v24 + 80) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v24 + 96) = *(_QWORD *)(v2 + 80);
  v26 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v24 + 32) = v26;
  v45 = v24;
  v27 = *(uint64_t (**)(uint64_t))((*v8 & *v10) + 0xB0);
  sub_1AF9C2338(v2);
  sub_1AF9C2338(v2);
  sub_1AF9C2338(v2);
  sub_1AF9C23C4((uint64_t)&v54);
  v28 = sub_1AF9C2338(v2);
  v43 = v27(v28);
  sub_1AF9C0F90((uint64_t)&v54);
  v42 = sub_1AF9F7AA0();
  LOBYTE(v27) = sub_1AF9F7AAC();
  v29 = sub_1AF9F7AB8();
  v30 = sub_1AF9F7AD0();
  v31 = sub_1AF9F7AC4();
  sub_1AF9F7AC4();
  if (sub_1AF9F7AC4() != v27)
    v31 = sub_1AF9F7AC4();
  sub_1AF9F7AC4();
  if (sub_1AF9F7AC4() != v29)
    v31 = sub_1AF9F7AC4();
  sub_1AF9F7AC4();
  if (sub_1AF9F7AC4() != v30)
    v31 = sub_1AF9F7AC4();
  v41 = sub_1AF9F7A04();
  v32 = swift_allocObject();
  v33 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v32 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v32 + 64) = v33;
  *(_OWORD *)(v32 + 80) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v32 + 96) = *(_QWORD *)(v2 + 80);
  v34 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v32 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v32 + 32) = v34;
  sub_1AF9C2338(v2);
  v35 = v49;
  sub_1AF9F7C98();
  v36 = v50;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(&v50[*(int *)(v48 + 20)], v35, v53);
  *v36 = &unk_1EEE6B870;
  v36[1] = v32;
  sub_1AF9C24F0((uint64_t)v36, (uint64_t)&v7[*(int *)(v46 + 36)]);
  v37 = v45;
  v38 = v47;
  *(_QWORD *)v7 = v44;
  *((_QWORD *)v7 + 1) = v38;
  *((_QWORD *)v7 + 2) = sub_1AF9C2170;
  *((_QWORD *)v7 + 3) = v15;
  *((_QWORD *)v7 + 4) = sub_1AF9C2204;
  *((_QWORD *)v7 + 5) = v19;
  *((_QWORD *)v7 + 6) = sub_1AF9C227C;
  *((_QWORD *)v7 + 7) = v23;
  *((_QWORD *)v7 + 8) = sub_1AF9C22E0;
  *((_QWORD *)v7 + 9) = v37;
  *((_QWORD *)v7 + 10) = v43;
  v7[88] = v42;
  *((_QWORD *)v7 + 12) = v41;
  v7[104] = v31;
  swift_retain();
  sub_1AF9C09CC((uint64_t)sub_1AF9C2170);
  sub_1AF9C09CC((uint64_t)sub_1AF9C2204);
  sub_1AF9C09CC((uint64_t)sub_1AF9C227C);
  sub_1AF9C09CC((uint64_t)sub_1AF9C22E0);
  swift_retain();
  sub_1AF9C2534((uint64_t)v36);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v35, v53);
  swift_release();
  sub_1AF9C09DC((uint64_t)sub_1AF9C2170);
  sub_1AF9C09DC((uint64_t)sub_1AF9C2204);
  sub_1AF9C09DC((uint64_t)sub_1AF9C227C);
  sub_1AF9C09DC((uint64_t)sub_1AF9C22E0);
  swift_release();
  return sub_1AF9C2570((uint64_t)v7, v51);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5DFED98]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1AF9C0F90(uint64_t a1)
{

  return a1;
}

uint64_t sub_1AF9C0FB8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[5] = a1;
  v2 = sub_1AF9F7914();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v3 = sub_1AF9F792C();
  v1[9] = v3;
  v1[10] = *(_QWORD *)(v3 - 8);
  v1[11] = swift_task_alloc();
  v4 = sub_1AF9F7944();
  v1[12] = v4;
  v1[13] = *(_QWORD *)(v4 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = sub_1AF9F7C8C();
  v1[16] = sub_1AF9F7C80();
  v1[17] = sub_1AF9F7C68();
  v1[18] = v5;
  return swift_task_switch();
}

uint64_t sub_1AF9C10A0()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1AF9F543C();
  swift_bridgeObjectRetain();
  sub_1AF9F7908();
  sub_1AF9F7938();
  sub_1AF9F7920();
  *(_QWORD *)(v0 + 152) = sub_1AF9F7C80();
  sub_1AF9C212C((unint64_t *)&unk_1EEE6BA80, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAA400], MEMORY[0x1E0CAA408]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  *v1 = v0;
  v1[1] = sub_1AF9C1184;
  return sub_1AF9F7C74();
}

uint64_t sub_1AF9C1184()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 168) = v0;
  swift_task_dealloc();
  v3 = *(_QWORD *)(v2 + 152);
  if (v0)
  {
    if (v3)
      goto LABEL_5;
  }
  else if (v3)
  {
LABEL_5:
    swift_getObjectType();
    sub_1AF9F7C68();
  }
  return swift_task_switch();
}

uint64_t sub_1AF9C1248()
{
  uint64_t v0;

  swift_release();
  *(_QWORD *)(v0 + 176) = *(_QWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_1AF9C1288()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v0 + 176))
    return swift_task_switch();
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v6 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AF9C1354()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 184) = sub_1AF9F7C80();
  sub_1AF9F7C68();
  return swift_task_switch();
}

uint64_t sub_1AF9C13B4()
{
  uint64_t v0;
  uint64_t v1;
  __int128 *v2;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(__int128 **)(v0 + 40);
  swift_release();
  sub_1AF9C16D8(v1, v2);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1AF9C1404()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v5 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AF9C14A0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v0 + 168);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6C390);
  swift_willThrowTypedImpl();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AF9C1508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  LOBYTE(v1) = sub_1AF9F7CEC();
  v4 = *sub_1AF9CFC38();
  v5 = v1;
  if (os_log_type_enabled(v4, (os_log_type_t)v1))
  {
    v6 = *(void **)(v0 + 168);
    v7 = v6;
    v8 = v6;
    v9 = v4;
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v6;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 32) = v13;
    sub_1AF9F7D94();
    *v11 = v13;

    _os_log_impl(&dword_1AF84D000, v9, v5, "EKEventGenericDetailOOPHostView: Could not read extension query results. Error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE60);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v11, -1, -1);
    MEMORY[0x1B5DFEE1C](v10, -1, -1);

  }
  else
  {
    v6 = *(void **)(v0 + 168);
  }

  v15 = *(_QWORD *)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 112);
  v16 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1AF9C16D8(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, unint64_t, uint64_t);
  _QWORD *v17;
  void (*v18)(uint64_t);
  os_log_type_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  unint64_t v27;
  os_log_t v28;
  uint64_t v29;
  id v30;
  uint64_t (*v31)(void);
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t, _QWORD *);
  uint64_t v38;
  uint64_t v39;
  os_log_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1AF9F7968();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v38 - v12;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v38 - v14;
  if (!*(_QWORD *)(a1 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    goto LABEL_6;
  }
  v16 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
  v16(v5, a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_6:
    sub_1AF9C6BF4((uint64_t)v5, &qword_1EEE6B878);
    sub_1AF9F7CEC();
    v30 = (id)*sub_1AF9CFC38();
    sub_1AF9F7974();

    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v15, v5, v6);
  v44 = *a2;
  v17 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v18 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v44 + 1)) + 0x70);
  v41 = *((id *)&v44 + 1);
  v18(1);
  sub_1AF9C0F90((uint64_t)&v44);
  v19 = sub_1AF9F7CF8();
  v20 = *sub_1AF9CFC38();
  v16(v13, (unint64_t)v15, v6);
  v16(v10, (unint64_t)v15, v6);
  v21 = v19;
  if (os_log_type_enabled(v20, v19))
  {
    v40 = v20;
    v22 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v43 = v39;
    *(_DWORD *)v22 = 136315394;
    v23 = sub_1AF9F7950();
    v42 = sub_1AF9C4DD4(v23, v24, &v43);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(char *, uint64_t))(v7 + 8);
    v25(v13, v6);
    *(_WORD *)(v22 + 12) = 2080;
    v26 = sub_1AF9F795C();
    v42 = sub_1AF9C4DD4(v26, v27, &v43);
    v17 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    sub_1AF9F7D94();
    swift_bridgeObjectRelease();
    v25(v10, v6);
    v28 = v40;
    _os_log_impl(&dword_1AF84D000, v40, v21, "EKEventGenericDetailOOPHostView AppExtensionQuery Found %s (%s) RemoteUI Extension", (uint8_t *)v22, 0x16u);
    v29 = v39;
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v29, -1, -1);
    MEMORY[0x1B5DFEE1C](v22, -1, -1);

  }
  else
  {
    v25 = *(void (**)(char *, uint64_t))(v7 + 8);
    v25(v13, v6);
    v25(v10, v6);
  }
  v31 = *(uint64_t (**)(void))((*v17 & *v41) + 0x80);
  v32 = v41;
  v33 = v31();
  sub_1AF9C0F90((uint64_t)&v44);
  v34 = (uint64_t *)sub_1AF9F5470();
  v35 = *v34;
  v36 = v34[1];
  v37 = *(void (**)(char *, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v33 + 360);
  sub_1AF9C23C4((uint64_t)&v44);
  swift_bridgeObjectRetain();
  v37(v15, v35, v36, v32);
  sub_1AF9C0F90((uint64_t)&v44);
  swift_release();
  swift_bridgeObjectRelease();
  v25(v15, v6);
}

void sub_1AF9C1B1C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = *(void **)(v0 + 80);
  v2 = *(void **)(v0 + 8);
  if (v1)
  {
    v3 = v1;
    v7 = v2;
    v4 = MEMORY[0x1B5DFD7E4](v3);
    (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v7) + 0xB8))(v4);

  }
  else
  {
    v5 = (void *)objc_opt_self();
    v7 = v2;
    v6 = MEMORY[0x1B5DFD7E4](objc_msgSend(v5, sel_whiteColor));
    (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v7) + 0xB8))(v6);
  }

}

void sub_1AF9C1BF0(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v3 = *(void **)(v1 + 80);
  v4 = a1;

  *(_QWORD *)(v1 + 80) = a1;
  sub_1AF9C1B1C();

}

uint64_t sub_1AF9C1C38(uint64_t a1, unint64_t a2)
{
  __int128 *v2;
  os_log_type_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  id v11;
  uint64_t v12;
  __int128 v14;

  v5 = sub_1AF9F7CF8();
  v6 = *sub_1AF9CFC38();
  if (os_log_type_enabled(v6, v5))
  {
    swift_bridgeObjectRetain_n();
    v7 = v6;
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    *(_QWORD *)&v14 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_1AF9C4DD4(a1, a2, (uint64_t *)&v14);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AF84D000, v7, v5, "EKEventOOPHostView: rightBarButtonTapped. buttonAction <%s>", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v9, -1, -1);
    MEMORY[0x1B5DFEE1C](v8, -1, -1);

  }
  v14 = *v2;
  v10 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v14 + 1)) + 0x80);
  v11 = *((id *)&v14 + 1);
  v12 = v10();
  sub_1AF9C0F90((uint64_t)&v14);
  (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v12 + 288))(a1, a2);
  return swift_release();
}

uint64_t sub_1AF9C1DEC(uint64_t a1, unint64_t a2)
{
  __int128 *v2;
  os_log_type_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  id v11;
  uint64_t v12;
  __int128 v14;

  v5 = sub_1AF9F7CF8();
  v6 = *sub_1AF9CFC38();
  if (os_log_type_enabled(v6, v5))
  {
    swift_bridgeObjectRetain_n();
    v7 = v6;
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    *(_QWORD *)&v14 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_1AF9C4DD4(a1, a2, (uint64_t *)&v14);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AF84D000, v7, v5, "EKEventOOPHostView: rightBarButtonTapped. buttonAction <%s>", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v9, -1, -1);
    MEMORY[0x1B5DFEE1C](v8, -1, -1);

  }
  v14 = *v2;
  v10 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v14 + 1)) + 0x80);
  v11 = *((id *)&v14 + 1);
  v12 = v10();
  sub_1AF9C0F90((uint64_t)&v14);
  (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v12 + 320))(a1, a2);
  return swift_release();
}

uint64_t sub_1AF9C1FA0(uint64_t a1)
{
  __int128 *v1;
  os_log_type_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t *v6;
  uint64_t v7;
  __int128 v9;

  v3 = sub_1AF9F7CF8();
  v4 = *sub_1AF9CFC38();
  if (os_log_type_enabled(v4, v3))
  {
    v5 = v4;
    v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v6 = 134217984;
    *(_QWORD *)&v9 = a1;
    sub_1AF9F7D94();
    _os_log_impl(&dword_1AF84D000, v5, v3, "EKEventOOPHostView: bottomStatusButtonTapped. buttonAction <%ld>", v6, 0xCu);
    MEMORY[0x1B5DFEE1C](v6, -1, -1);

  }
  v9 = *v1;
  v7 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v9 + 1)) + 0x80))(*((id *)&v9 + 1));
  sub_1AF9C0F90((uint64_t)&v9);
  (*(void (**)(uint64_t))(*(_QWORD *)v7 + 352))(a1);
  return swift_release();
}

uint64_t sub_1AF9C20D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1AF9C0A60(a1);
}

uint64_t type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(uint64_t a1)
{
  return sub_1AF9C54B8(a1, (uint64_t *)&unk_1EEE6CE70);
}

uint64_t sub_1AF9C212C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1B5DFEDB0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AF9C2170(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;

  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 32);
  if (v6)
  {
    v11 = result;
    swift_retain();
    v6(v11, a2, a3, a4, a5);
    return sub_1AF9C09DC((uint64_t)v6);
  }
  return result;
}

uint64_t sub_1AF9C2204(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v4)
  {
    v7 = result;
    swift_retain();
    v4(v7, a2, a3);
    return sub_1AF9C09DC((uint64_t)v4);
  }
  return result;
}

uint64_t sub_1AF9C227C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v5;

  v3 = *(void (**)(uint64_t, uint64_t))(v2 + 64);
  if (v3)
  {
    v5 = result;
    swift_retain();
    v3(v5, a2);
    return sub_1AF9C09DC((uint64_t)v3);
  }
  return result;
}

uint64_t sub_1AF9C22E0(uint64_t result)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))(v1 + 80);
  if (v2)
  {
    v3 = result;
    swift_retain();
    v2(v3);
    return sub_1AF9C09DC((uint64_t)v2);
  }
  return result;
}

uint64_t sub_1AF9C2338(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(void **)(a1 + 80);
  v7 = *(id *)(a1 + 8);
  sub_1AF9C09CC(v2);
  sub_1AF9C09CC(v3);
  sub_1AF9C09CC(v4);
  sub_1AF9C09CC(v5);
  v8 = v6;
  return a1;
}

uint64_t sub_1AF9C23C4(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
    swift_release();
  if (*(_QWORD *)(v0 + 48))
    swift_release();
  if (*(_QWORD *)(v0 + 64))
    swift_release();
  if (*(_QWORD *)(v0 + 80))
    swift_release();

  return swift_deallocObject();
}

uint64_t sub_1AF9C245C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1AF9C24A8;
  return sub_1AF9C0FB8(v0 + 16);
}

uint64_t sub_1AF9C24A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AF9C24F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1AF9F79EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF9C2534(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1AF9F79EC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AF9C2570(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B858);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF9C25B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_identity;
  swift_beginAccess();
  return sub_1AF9C5414(v3, a1);
}

uint64_t sub_1AF9C2608(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_identity;
  swift_beginAccess();
  sub_1AF9C545C(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1AF9C2660())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9C26A4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_sceneID);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1AF9C26F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_sceneID);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AF9C2754())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9C2798()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_viewID);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1AF9C27EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_viewID);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AF9C2848())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9C288C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_1AF9C28D8(a1, a2);
  return v4;
}

uint64_t sub_1AF9C28D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _BYTE v18[16];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = v2 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_identity;
  v10 = sub_1AF9F7968();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (_QWORD *)(v2 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_sceneID);
  *v11 = 0;
  v11[1] = 0;
  v12 = v2
      + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration__customViewConfigurationChangedPublisher;
  v18[15] = 0;
  sub_1AF9F798C();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v6 + 32))(v12, v8, v5);
  v13 = (_QWORD *)(v2
                 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_leftBarButtonTappedCallback);
  *v13 = 0;
  v13[1] = 0;
  v14 = (_QWORD *)(v2
                 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_rightBarButtonTappedCallback);
  *v14 = 0;
  v14[1] = 0;
  v15 = (_QWORD *)(v2
                 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_bottomStatusButtonTappedCallback);
  *v15 = 0;
  v15[1] = 0;
  v16 = (_QWORD *)(v2 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_viewID);
  *v16 = a1;
  v16[1] = a2;
  return v2;
}

uint64_t sub_1AF9C2A10()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AF9F79BC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF9C2A80@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 216))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9C2AB4(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 224))(*a1);
}

uint64_t sub_1AF9C2AE0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1AF9F79C8();
}

void (*sub_1AF9C2B4C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9C2BC4;
}

void sub_1AF9C2BC4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_1AF9C2C10()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F7998();
  return swift_endAccess();
}

uint64_t sub_1AF9C2C70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F79A4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1AF9C2D44(_QWORD *a1))(uint64_t a1, char a2)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration__customViewConfigurationChangedPublisher;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9C2E0C;
}

void sub_1AF9C2E0C(uint64_t a1, char a2)
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
    sub_1AF9F79A4();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_1AF9F79A4();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t sub_1AF9C2F24()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_leftBarButtonTappedCallback, (void (*)(_QWORD, _QWORD))sub_1AF9C6C90);
}

uint64_t sub_1AF9C2F38(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_leftBarButtonTappedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C6C94);
}

uint64_t (*sub_1AF9C2F4C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9C2F90(uint64_t a1, uint64_t a2))(uint64_t, uint64_t)
{
  uint64_t v2;
  void (*result)(uint64_t, uint64_t);
  uint64_t v6;

  result = (void (*)(uint64_t, uint64_t))(*(uint64_t (**)(void))(*(_QWORD *)v2 + 264))();
  if (result)
  {
    v6 = (uint64_t)result;
    result(a1, a2);
    return (void (*)(uint64_t, uint64_t))sub_1AF9C09DC(v6);
  }
  return result;
}

uint64_t sub_1AF9C2FF4()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_rightBarButtonTappedCallback, (void (*)(_QWORD, _QWORD))sub_1AF9C6C90);
}

uint64_t sub_1AF9C3008(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_rightBarButtonTappedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C6C94);
}

uint64_t (*sub_1AF9C301C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9C3060(uint64_t a1, uint64_t a2))(uint64_t, uint64_t)
{
  uint64_t v2;
  void (*result)(uint64_t, uint64_t);
  uint64_t v6;

  result = (void (*)(uint64_t, uint64_t))(*(uint64_t (**)(void))(*(_QWORD *)v2 + 296))();
  if (result)
  {
    v6 = (uint64_t)result;
    result(a1, a2);
    return (void (*)(uint64_t, uint64_t))sub_1AF9C09DC(v6);
  }
  return result;
}

uint64_t sub_1AF9C30C4()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_bottomStatusButtonTappedCallback, (void (*)(_QWORD, _QWORD))sub_1AF9C6C90);
}

uint64_t sub_1AF9C30D8(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_1AF9C3138(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_bottomStatusButtonTappedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C6C94);
}

uint64_t sub_1AF9C314C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*sub_1AF9C31A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9C31EC(uint64_t a1))(uint64_t)
{
  uint64_t v1;
  void (*result)(uint64_t);
  uint64_t v4;

  result = (void (*)(uint64_t))(*(uint64_t (**)(void))(*(_QWORD *)v1 + 328))();
  if (result)
  {
    v4 = (uint64_t)result;
    result(a1);
    return (void (*)(uint64_t))sub_1AF9C09DC(v4);
  }
  return result;
}

uint64_t sub_1AF9C3248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t (*v13)(_BYTE *, _QWORD);
  BOOL *v14;
  _BYTE v16[32];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v7);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_1AF9F7968();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  (*(void (**)(_BYTE *))(*(_QWORD *)v3 + 144))(v9);
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 168);
  swift_bridgeObjectRetain();
  v12(a2, a3);
  v13 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v3 + 232))(v16);
  *v14 = !*v14;
  return v13(v16, 0);
}

uint64_t sub_1AF9C335C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1AF9C6BF4(v0 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_identity, &qword_1EEE6B878);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0
     + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration__customViewConfigurationChangedPublisher;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_leftBarButtonTappedCallback));
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_rightBarButtonTappedCallback));
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView13Configuration_bottomStatusButtonTappedCallback));
  return swift_deallocClassInstance();
}

uint64_t sub_1AF9C342C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(0);
  result = sub_1AF9F7980();
  *a1 = result;
  return result;
}

id sub_1AF9C3468(_OWORD *a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  objc_super v10;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_identity];
  v5 = sub_1AF9F7968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)&v3[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_conn] = 0;
  v6 = &v3[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent];
  v7 = a1[1];
  *(_OWORD *)v6 = *a1;
  *((_OWORD *)v6 + 1) = v7;
  v8 = a1[3];
  *((_OWORD *)v6 + 2) = a1[2];
  *((_OWORD *)v6 + 3) = v8;
  *((_OWORD *)v6 + 4) = a1[4];
  v10.receiver = v3;
  v10.super_class = v1;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t sub_1AF9C3514@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_identity;
  swift_beginAccess();
  return sub_1AF9C5414(v3, a1);
}

uint64_t sub_1AF9C3564(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_identity;
  swift_beginAccess();
  sub_1AF9C545C(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1AF9C35BC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9C3600()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_conn);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9C364C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_conn);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9C369C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1AF9C36E4(void *a1)
{
  _QWORD *v1;
  id v2;
  void *v3;
  void (*v4)(void *);
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  os_log_type_t v12;
  os_log_t *v13;
  os_log_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void (*v24)(_QWORD, uint64_t);
  uint64_t v25;
  void (*v26)(_QWORD, uint64_t);
  uint64_t v27;
  void (*v28)(id (*)(uint64_t), uint64_t);
  id v29;
  void *v30;
  os_log_type_t v31;
  NSObject *v32;
  id v33;
  id v34;
  NSObject *v35;
  uint8_t *v36;
  _QWORD *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id aBlock;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  void *v45;
  uint64_t (*v46)();
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  aBlock = 0;
  v2 = objc_msgSend(a1, sel_makeXPCConnectionWithError_, &aBlock);
  if (v2)
  {
    v3 = v2;
    v4 = *(void (**)(void *))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x90);
    v5 = aBlock;
    v6 = v3;
    v4(v3);
    objc_msgSend(v6, sel_setExportedInterface_, *sub_1AF9CE2D4());
    objc_msgSend(v6, sel_setRemoteObjectInterface_, *sub_1AF9CE38C());
    objc_msgSend(v6, sel_setExportedObject_, v1);
    v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v46 = sub_1AF9C5510;
    v47 = v7;
    v8 = (void *)MEMORY[0x1E0C809B0];
    aBlock = (id)MEMORY[0x1E0C809B0];
    v43 = 1107296256;
    v44 = sub_1AF9C3D10;
    v45 = &block_descriptor;
    v9 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v6, sel_setInterruptionHandler_, v9);
    _Block_release(v9);
    v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v46 = sub_1AF9C5510;
    v47 = v10;
    aBlock = v8;
    v43 = 1107296256;
    v44 = sub_1AF9C3D10;
    v45 = &block_descriptor_22;
    v11 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v6, sel_setInvalidationHandler_, v11);
    _Block_release(v11);
    objc_msgSend(v6, sel_resume);
    v12 = sub_1AF9F7CF8();
    v13 = (os_log_t *)sub_1AF9CFC38();
    v14 = *v13;
    if (os_log_type_enabled(*v13, v12))
    {
      v15 = v6;
      v16 = v14;
      v17 = swift_slowAlloc();
      *(_DWORD *)v17 = 67109376;
      LODWORD(aBlock) = objc_msgSend(v15, sel_processIdentifier);
      sub_1AF9F7D94();
      *(_WORD *)(v17 + 8) = 1024;
      LODWORD(aBlock) = objc_msgSend(v15, sel_effectiveUserIdentifier);
      sub_1AF9F7D94();

      _os_log_impl(&dword_1AF84D000, v16, v12, "_AppExtensionEventGenericDetailOOPHostView: Setting up XPC connection. processIdentifier: %d. effectiveUserIdentifier: %u.", (uint8_t *)v17, 0xEu);
      MEMORY[0x1B5DFEE1C](v17, -1, -1);

    }
    v18 = objc_msgSend(v6, sel_remoteObjectProxy);
    sub_1AF9F7DAC();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6B900);
    if (swift_dynamicCast())
    {
      v19 = *(_QWORD *)((char *)v1
                      + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                      + 8);
      v20 = *(void (**)(uint64_t))(*(_QWORD *)v19 + 184);
      v21 = swift_retain();
      v20(v21);
      v22 = (void *)sub_1AF9F7BCC();
      swift_bridgeObjectRelease();
      objc_msgSend(v41, sel_setupGenericViewContextWithViewID_, v22);

      v23 = swift_allocObject();
      *(_QWORD *)(v23 + 16) = v41;
      v24 = *(void (**)(_QWORD, uint64_t))(*(_QWORD *)v19 + 272);
      swift_unknownObjectRetain();
      v24(sub_1AF9C55D8, v23);
      v25 = swift_allocObject();
      *(_QWORD *)(v25 + 16) = v41;
      v26 = *(void (**)(_QWORD, uint64_t))(*(_QWORD *)v19 + 304);
      swift_unknownObjectRetain();
      v26(sub_1AF9C55E4, v25);
      v27 = swift_allocObject();
      *(_QWORD *)(v27 + 16) = v41;
      v28 = *(void (**)(id (*)(uint64_t), uint64_t))(*(_QWORD *)v19 + 336);
      swift_unknownObjectRetain();
      v28(sub_1AF9C5634, v27);

      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {
      sub_1AF9F7CEC();
      v40 = *v13;
      sub_1AF9F7974();

    }
  }
  else
  {
    v29 = aBlock;
    v30 = (void *)sub_1AF9F789C();

    swift_willThrow();
    v31 = sub_1AF9F7CEC();
    v32 = *sub_1AF9CFC38();
    if (os_log_type_enabled(v32, v31))
    {
      v33 = v30;
      v34 = v30;
      v35 = v32;
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v36 = 138412290;
      v38 = v30;
      v39 = (void *)_swift_stdlib_bridgeErrorToNSError();
      aBlock = v39;
      sub_1AF9F7D94();
      *v37 = v39;

      _os_log_impl(&dword_1AF84D000, v35, v31, "Error: _AppExtensionEventGenericDetailOOPHostView Setup: Cannot make XPC Connection. %@", v36, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE60);
      swift_arrayDestroy();
      MEMORY[0x1B5DFEE1C](v37, -1, -1);
      MEMORY[0x1B5DFEE1C](v36, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_1AF9C3D10(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1AF9C3D90()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;

  v1 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
  objc_msgSend(v2, sel_invalidate);

  return (*(uint64_t (**)(_QWORD))((*v1 & *v0) + 0x90))(0);
}

uint64_t sub_1AF9C3E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v29 = a5;
  v10 = sub_1AF9F7B3C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v5
                  + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                  + 16);
  if (v19)
  {
    v27 = v11;
    v28 = result;
    v20 = *(_QWORD *)(v5
                    + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                    + 24);
    v26 = v16;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v25 = sub_1AF9F7D04();
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = v19;
    v21[3] = v20;
    v21[4] = a1;
    v21[5] = a2;
    v21[6] = a3;
    v21[7] = a4;
    v21[8] = v29;
    aBlock[4] = sub_1AF9C567C;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_37;
    v22 = _Block_copy(aBlock);
    sub_1AF9C09CC(v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    sub_1AF9F7DB8();
    v23 = (void *)v25;
    MEMORY[0x1B5DFD9D0](0, v18, v13, v22);
    _Block_release(v22);

    sub_1AF9C09DC(v19);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v18, v28);
  }
  return result;
}

uint64_t sub_1AF9C4198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v7 = sub_1AF9F7B3C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(v3
                  + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                  + 32);
  if (v16)
  {
    v23 = v8;
    v24 = result;
    v17 = *(_QWORD *)(v3
                    + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                    + 40);
    v22 = v13;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v18 = (void *)sub_1AF9F7D04();
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = v16;
    v19[3] = v17;
    v19[4] = a1;
    v19[5] = a2;
    v19[6] = a3;
    aBlock[4] = sub_1AF9C571C;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_43;
    v20 = _Block_copy(aBlock);
    sub_1AF9C09CC(v16);
    swift_bridgeObjectRetain();
    swift_release();
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    sub_1AF9F7DB8();
    MEMORY[0x1B5DFD9D0](0, v15, v10, v20);
    _Block_release(v20);

    sub_1AF9C09DC(v16);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v15, v24);
  }
  return result;
}

uint64_t sub_1AF9C4460(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v5 = sub_1AF9F7B3C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v2
                  + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                  + 48);
  if (v14)
  {
    v15 = *(_QWORD *)(v2
                    + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                    + 56);
    v22 = v11;
    v23 = result;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v16 = (void *)sub_1AF9F7D04();
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = v14;
    v17[3] = v15;
    v17[4] = a1;
    v17[5] = a2;
    aBlock[4] = sub_1AF9C577C;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_49;
    v18 = _Block_copy(aBlock);
    v21 = v6;
    v19 = v18;
    sub_1AF9C09CC(v14);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    sub_1AF9F7DB8();
    MEMORY[0x1B5DFD9D0](0, v13, v8, v19);
    _Block_release(v19);

    sub_1AF9C09DC(v14);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v13, v23);
  }
  return result;
}

uint64_t sub_1AF9C4744(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v3 = sub_1AF9F7B3C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(v1
                  + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                  + 64);
  if (v12)
  {
    v13 = *(_QWORD *)(v1
                    + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                    + 72);
    v19 = v9;
    v20 = result;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v18 = sub_1AF9F7D04();
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = v12;
    v14[3] = v13;
    v14[4] = a1;
    aBlock[4] = sub_1AF9C57D0;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_55;
    v15 = _Block_copy(aBlock);
    sub_1AF9C09CC(v12);
    swift_bridgeObjectRetain();
    swift_release();
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    sub_1AF9F7DB8();
    v16 = (void *)v18;
    MEMORY[0x1B5DFD9D0](0, v11, v6, v15);
    _Block_release(v15);

    sub_1AF9C09DC(v12);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return result;
}

id sub_1AF9C4A2C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _AppExtensionEventGenericDetailHostView.HostCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1AF9C4B14()
{
  id v0;
  void *v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CAA600]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B928);
  sub_1AF9F7A94();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

void sub_1AF9C4B88(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1AF9C57F8(a1, a2, *(_QWORD *)(v2 + 8));
}

id sub_1AF9C4B98@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id result;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  objc_super v19;

  v2 = v1[1];
  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  v6 = v1[5];
  v7 = v1[6];
  v8 = v1[7];
  v9 = v1[9];
  v15 = v1[8];
  v16 = *v1;
  v17 = (objc_class *)type metadata accessor for _AppExtensionEventGenericDetailHostView.HostCoordinator(0);
  v10 = (char *)objc_allocWithZone(v17);
  v11 = &v10[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_identity];
  v12 = sub_1AF9F7968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_QWORD *)&v10[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_conn] = 0;
  v13 = &v10[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent];
  *(_QWORD *)v13 = v16;
  *((_QWORD *)v13 + 1) = v2;
  *((_QWORD *)v13 + 2) = v3;
  *((_QWORD *)v13 + 3) = v4;
  *((_QWORD *)v13 + 4) = v5;
  *((_QWORD *)v13 + 5) = v6;
  *((_QWORD *)v13 + 6) = v7;
  *((_QWORD *)v13 + 7) = v8;
  *((_QWORD *)v13 + 8) = v15;
  *((_QWORD *)v13 + 9) = v9;
  swift_retain();
  sub_1AF9C09CC(v3);
  sub_1AF9C09CC(v5);
  sub_1AF9C09CC(v7);
  sub_1AF9C09CC(v15);
  v19.receiver = v10;
  v19.super_class = v17;
  result = objc_msgSendSuper2(&v19, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_1AF9C4CC0()
{
  return sub_1AF9F7A4C();
}

uint64_t sub_1AF9C4CF8()
{
  sub_1AF9C6BB0();
  return sub_1AF9F7A88();
}

uint64_t sub_1AF9C4D48()
{
  sub_1AF9C6BB0();
  return sub_1AF9F7A58();
}

uint64_t sub_1AF9C4D98()
{
  return sub_1AF9F7B18();
}

void sub_1AF9C4DB0()
{
  sub_1AF9C6BB0();
  sub_1AF9F7A7C();
  __break(1u);
}

uint64_t sub_1AF9C4DD4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1AF9C4EA4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1AF9C6C50((uint64_t)v12, *a3);
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
      sub_1AF9C6C50((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1AF9C4EA4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1AF9F7DA0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1AF9C505C(a5, a6);
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
  v8 = sub_1AF9F7EA8();
  if (!v8)
  {
    sub_1AF9F7EE4();
    __break(1u);
LABEL_17:
    result = sub_1AF9F7F38();
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

uint64_t sub_1AF9C505C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1AF9C50F0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1AF9C52C8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1AF9C52C8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1AF9C50F0(uint64_t a1, unint64_t a2)
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
      v3 = sub_1AF9C5264(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1AF9F7E90();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1AF9F7EE4();
      __break(1u);
LABEL_10:
      v2 = sub_1AF9F7C08();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1AF9F7F38();
    __break(1u);
LABEL_14:
    result = sub_1AF9F7EE4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1AF9C5264(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BF90);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1AF9C52C8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BF90);
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
  result = sub_1AF9F7F38();
  __break(1u);
  return result;
}

uint64_t sub_1AF9C5414(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF9C545C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for _AppExtensionEventGenericDetailHostView.HostCoordinator(uint64_t a1)
{
  return sub_1AF9C54B8(a1, (uint64_t *)&unk_1EEE6CE80);
}

uint64_t sub_1AF9C54B8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1AF9C54EC()
{
  swift_unknownObjectWeakDestroy();
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

void sub_1AF9C552C()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  void *v3;

  swift_beginAccess();
  v1 = (_QWORD *)MEMORY[0x1B5DFEE88](v0 + 16);
  if (v1)
  {
    v2 = v1;
    v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x88))();

    if (v3)
    {
      objc_msgSend(v3, sel_setExportedObject_, 0);

    }
  }
}

uint64_t sub_1AF9C55B4()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_1AF9C55D8(uint64_t a1, uint64_t a2)
{
  sub_1AF9C55F0(a1, a2, (SEL *)&selRef_genericViewLeftBarButtonTapped_);
}

void sub_1AF9C55E4(uint64_t a1, uint64_t a2)
{
  sub_1AF9C55F0(a1, a2, (SEL *)&selRef_genericViewRightBarButtonTapped_);
}

void sub_1AF9C55F0(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  void *v5;
  id v6;

  v5 = *(void **)(v3 + 16);
  v6 = (id)sub_1AF9F7BCC();
  objc_msgSend(v5, *a3, v6);

}

id sub_1AF9C5634(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), sel_genericViewBottomStatusButtonTapped_, a1);
}

uint64_t sub_1AF9C5648()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF9C567C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5DFEDA4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1AF9C56F0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF9C571C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_1AF9C5748()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF9C577C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1AF9C57A4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF9C57D0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32));
}

void sub_1AF9C57F8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  char *v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  os_log_type_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  os_log_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint8_t *v38;
  uint64_t v39;
  os_log_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v5 = sub_1AF9F78F0();
  MEMORY[0x1E0C80A78](v5);
  v44 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1AF9F7968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v43 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v45 = (char *)&v38 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BA70);
  v16 = MEMORY[0x1E0C80A78](v15);
  v42 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v38 - v18;
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v20 = a1;
    sub_1AF9F7D34();
    v21 = sub_1AF9F7D28();
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v19, 1, v21) == 1)
    {
      sub_1AF9C6BF4((uint64_t)v19, (uint64_t *)&unk_1EEE6BA70);
      v23 = *(void (**)(uint64_t))(*(_QWORD *)a3 + 136);
      v24 = swift_retain();
      v23(v24);
      swift_release();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
      {

        sub_1AF9C6BF4((uint64_t)v9, &qword_1EEE6B878);
      }
      else
      {
        v25 = v45;
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v45, v9, v10);
        v26 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 160);
        v27 = swift_retain();
        v41 = v26(v27);
        v29 = v28;
        swift_release();
        if (v29)
        {
          v30 = sub_1AF9F7CF8();
          v31 = *sub_1AF9CFC38();
          v32 = v30;
          if (os_log_type_enabled(v31, v30))
          {
            swift_bridgeObjectRetain_n();
            v40 = v31;
            v33 = (uint8_t *)swift_slowAlloc();
            v39 = swift_slowAlloc();
            v47 = v39;
            *(_DWORD *)v33 = 136315138;
            v38 = v33 + 4;
            swift_bridgeObjectRetain();
            v46 = sub_1AF9C4DD4(v41, v29, &v47);
            sub_1AF9F7D94();
            swift_bridgeObjectRelease_n();
            v34 = v40;
            _os_log_impl(&dword_1AF84D000, v40, v32, "_AppExtensionEventGenericDetailOOPHostView: *** Setting up Remote UI Extension Configuration ***  sceneID: %s.", v33, 0xCu);
            v35 = v39;
            swift_arrayDestroy();
            MEMORY[0x1B5DFEE1C](v35, -1, -1);
            MEMORY[0x1B5DFEE1C](v33, -1, -1);

          }
          v36 = v45;
          (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v43, v45, v10);
          sub_1AF9F78FC();
          v37 = v42;
          sub_1AF9F7D1C();
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v37, 0, 1, v21);
          sub_1AF9F7D40();

          (*(void (**)(char *, uint64_t))(v11 + 8))(v36, v10);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v11 + 8))(v25, v10);

        }
      }
    }
    else
    {

      sub_1AF9C6BF4((uint64_t)v19, (uint64_t *)&unk_1EEE6BA70);
    }
  }
  else
  {
    sub_1AF9F7EF0();
    __break(1u);
  }
}

uint64_t sub_1AF9C5C90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1AF9C5CA0()
{
  return MEMORY[0x1E0C96020];
}

unint64_t sub_1AF9C5CB0()
{
  unint64_t result;

  result = qword_1EEE6B930;
  if (!qword_1EEE6B930)
  {
    result = MEMORY[0x1B5DFEDB0](&unk_1AFA13ED0, &type metadata for _AppExtensionEventGenericDetailHostView);
    atomic_store(result, (unint64_t *)&qword_1EEE6B930);
  }
  return result;
}

uint64_t sub_1AF9C5CF4()
{
  return MEMORY[0x1E0CE0780];
}

void destroy for EKEventGenericDetailOOPHostView(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 16))
    swift_release();
  if (*(_QWORD *)(a1 + 32))
    swift_release();
  if (*(_QWORD *)(a1 + 48))
    swift_release();
  if (*(_QWORD *)(a1 + 64))
    swift_release();

}

_QWORD *initializeWithCopy for EKEventGenericDetailOOPHostView(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  _OWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2 + 2;
  v5 = a2[2];
  v7 = v4;
  if (v5)
  {
    v8 = a2[3];
    a1[2] = v5;
    a1[3] = v8;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  v9 = a2[4];
  if (v9)
  {
    v10 = a2[5];
    a1[4] = v9;
    a1[5] = v10;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  v11 = a2[6];
  if (v11)
  {
    v12 = a2[7];
    a1[6] = v11;
    a1[7] = v12;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  v13 = a2[8];
  if (v13)
  {
    v14 = a2[9];
    a1[8] = v13;
    a1[9] = v14;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  v15 = (void *)a2[10];
  a1[10] = v15;
  v16 = v15;
  return a1;
}

_QWORD *assignWithCopy for EKEventGenericDetailOOPHostView(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
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
  void *v19;
  void *v20;
  id v21;

  *a1 = *a2;
  v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  v6 = v4;

  v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  v10 = a2[4];
  if (a1[4])
  {
    if (v10)
    {
      v11 = a2[5];
      a1[4] = v10;
      a1[5] = v11;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = a2[5];
    a1[4] = v10;
    a1[5] = v12;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  v13 = a2[6];
  if (a1[6])
  {
    if (v13)
    {
      v14 = a2[7];
      a1[6] = v13;
      a1[7] = v14;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v13)
  {
    v15 = a2[7];
    a1[6] = v13;
    a1[7] = v15;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  v16 = a2[8];
  if (!a1[8])
  {
    if (v16)
    {
      v18 = a2[9];
      a1[8] = v16;
      a1[9] = v18;
      swift_retain();
      goto LABEL_29;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    goto LABEL_29;
  }
  if (!v16)
  {
    swift_release();
    goto LABEL_28;
  }
  v17 = a2[9];
  a1[8] = v16;
  a1[9] = v17;
  swift_retain();
  swift_release();
LABEL_29:
  v19 = (void *)a1[10];
  v20 = (void *)a2[10];
  a1[10] = v20;
  v21 = v20;

  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

_QWORD *assignWithTake for EKEventGenericDetailOOPHostView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
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
  void *v18;

  v4 = a2[1];
  v5 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v4;

  v6 = a2[2];
  if (a1[2])
  {
    if (v6)
    {
      v7 = a2[3];
      a1[2] = v6;
      a1[3] = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    v8 = a2[3];
    a1[2] = v6;
    a1[3] = v8;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  v9 = a2[4];
  if (a1[4])
  {
    if (v9)
    {
      v10 = a2[5];
      a1[4] = v9;
      a1[5] = v10;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    v11 = a2[5];
    a1[4] = v9;
    a1[5] = v11;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  v12 = a2[6];
  if (a1[6])
  {
    if (v12)
    {
      v13 = a2[7];
      a1[6] = v12;
      a1[7] = v13;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v12)
  {
    v14 = a2[7];
    a1[6] = v12;
    a1[7] = v14;
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  v15 = a2[8];
  if (!a1[8])
  {
    if (v15)
    {
      v17 = a2[9];
      a1[8] = v15;
      a1[9] = v17;
      goto LABEL_29;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    goto LABEL_29;
  }
  if (!v15)
  {
    swift_release();
    goto LABEL_28;
  }
  v16 = a2[9];
  a1[8] = v15;
  a1[9] = v16;
  swift_release();
LABEL_29:
  v18 = (void *)a1[10];
  a1[10] = a2[10];

  return a1;
}

uint64_t getEnumTagSinglePayload for EKEventGenericDetailOOPHostView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EKEventGenericDetailOOPHostView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EKEventGenericDetailOOPHostView()
{
  return &type metadata for EKEventGenericDetailOOPHostView;
}

uint64_t initializeBufferWithCopyOfBuffer for _AppExtensionEventGenericDetailHostView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for _AppExtensionEventGenericDetailHostView(_QWORD *a1)
{
  uint64_t result;

  result = swift_release();
  if (a1[2])
    result = swift_release();
  if (a1[4])
    result = swift_release();
  if (a1[6])
    result = swift_release();
  if (a1[8])
    return swift_release();
  return result;
}

_QWORD *initializeWithCopy for _AppExtensionEventGenericDetailHostView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2 + 2;
  v5 = a2[2];
  swift_retain();
  if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  v8 = a2[4];
  if (v8)
  {
    v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  v10 = a2[6];
  if (v10)
  {
    v11 = a2[7];
    a1[6] = v10;
    a1[7] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  v12 = a2[8];
  if (v12)
  {
    v13 = a2[9];
    a1[8] = v12;
    a1[9] = v13;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  return a1;
}

_QWORD *assignWithCopy for _AppExtensionEventGenericDetailHostView(_QWORD *a1, _QWORD *a2)
{
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

  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  v7 = a2[4];
  if (a1[4])
  {
    if (v7)
    {
      v8 = a2[5];
      a1[4] = v7;
      a1[5] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[5];
    a1[4] = v7;
    a1[5] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  v10 = a2[6];
  if (a1[6])
  {
    if (v10)
    {
      v11 = a2[7];
      a1[6] = v10;
      a1[7] = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = a2[7];
    a1[6] = v10;
    a1[7] = v12;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  v13 = a2[8];
  if (!a1[8])
  {
    if (v13)
    {
      v15 = a2[9];
      a1[8] = v13;
      a1[9] = v15;
      swift_retain();
      return a1;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    return a1;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_28;
  }
  v14 = a2[9];
  a1[8] = v13;
  a1[9] = v14;
  swift_retain();
  swift_release();
  return a1;
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

_QWORD *assignWithTake for _AppExtensionEventGenericDetailHostView(_QWORD *a1, _QWORD *a2)
{
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

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  v8 = a2[4];
  if (a1[4])
  {
    if (v8)
    {
      v9 = a2[5];
      a1[4] = v8;
      a1[5] = v9;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v8)
  {
    v10 = a2[5];
    a1[4] = v8;
    a1[5] = v10;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  v11 = a2[6];
  if (a1[6])
  {
    if (v11)
    {
      v12 = a2[7];
      a1[6] = v11;
      a1[7] = v12;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v11)
  {
    v13 = a2[7];
    a1[6] = v11;
    a1[7] = v13;
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  v14 = a2[8];
  if (!a1[8])
  {
    if (v14)
    {
      v16 = a2[9];
      a1[8] = v14;
      a1[9] = v16;
      return a1;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_28;
  }
  v15 = a2[9];
  a1[8] = v14;
  a1[9] = v15;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AppExtensionEventGenericDetailHostView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AppExtensionEventGenericDetailHostView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _AppExtensionEventGenericDetailHostView()
{
  return &type metadata for _AppExtensionEventGenericDetailHostView;
}

uint64_t sub_1AF9C67A8()
{
  return type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(0);
}

void sub_1AF9C67B0()
{
  unint64_t v0;
  unint64_t v1;

  sub_1AF9C6868();
  if (v0 <= 0x3F)
  {
    sub_1AF9C6B34(319, (unint64_t *)&unk_1EEE6C2A0, MEMORY[0x1E0DEAFA0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0C96198]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_1AF9C6868()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEE6B940)
  {
    sub_1AF9F7968();
    v0 = sub_1AF9F7D88();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEE6B940);
  }
}

uint64_t sub_1AF9C68BC()
{
  return type metadata accessor for _AppExtensionEventGenericDetailHostView.HostCoordinator(0);
}

void sub_1AF9C68C4()
{
  unint64_t v0;

  sub_1AF9C6868();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

unint64_t sub_1AF9C6948()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEE6BA10;
  if (!qword_1EEE6BA10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE6B858);
    v2[0] = sub_1AF9C69CC();
    v2[1] = sub_1AF9C212C(&qword_1EEE6BE20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9170], MEMORY[0x1E0CD9160]);
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEE6BA10);
  }
  return result;
}

unint64_t sub_1AF9C69CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEE6BA18;
  if (!qword_1EEE6BA18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE6BA20);
    v2[0] = sub_1AF9C6A38();
    v2[1] = MEMORY[0x1E0CDCF98];
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEE6BA18);
  }
  return result;
}

unint64_t sub_1AF9C6A38()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEE6BA28;
  if (!qword_1EEE6BA28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE6BA30);
    v2[0] = sub_1AF9C5CB0();
    v2[1] = sub_1AF9C6ABC(&qword_1EEE6BA38, (uint64_t *)&unk_1EEE6BA40, MEMORY[0x1E0CDC6C8]);
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEE6BA28);
  }
  return result;
}

uint64_t sub_1AF9C6ABC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1B5DFEDB0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for EKEventStatusButtonsAction(uint64_t a1)
{
  sub_1AF9C6B34(a1, (unint64_t *)&unk_1EEE6BA50, (uint64_t)&unk_1E6017A08, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for EKRemoteViewPresentationStyle(uint64_t a1)
{
  sub_1AF9C6B34(a1, (unint64_t *)&unk_1EEE6BF50, (uint64_t)&unk_1E6017A70, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEEC78]);
}

void sub_1AF9C6B34(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

uint64_t sub_1AF9C6B78(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1AF9C6BB0()
{
  unint64_t result;

  result = qword_1EEE6BA68;
  if (!qword_1EEE6BA68)
  {
    result = MEMORY[0x1B5DFEDB0](&unk_1AFA13E58, &type metadata for _AppExtensionEventGenericDetailHostView);
    atomic_store(result, (unint64_t *)&qword_1EEE6BA68);
  }
  return result;
}

uint64_t sub_1AF9C6BF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t sub_1AF9C6C50(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id EKRemoteUIObjectSerializerWrapper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id EKRemoteUIObjectSerializerWrapper.init()()
{
  void *v0;
  id v1;
  char *v2;
  id v3;
  objc_super v5;

  v1 = objc_allocWithZone((Class)sub_1AF9F7B78());
  v2 = v0;
  v3 = objc_msgSend(v1, sel_init);
  *(_QWORD *)&v2[OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer] = v3;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for EKRemoteUIObjectSerializerWrapper();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for EKRemoteUIObjectSerializerWrapper()
{
  return objc_opt_self();
}

uint64_t sub_1AF9C6E00()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer);
  v2 = sub_1AF9F7B60();

  return v2;
}

uint64_t sub_1AF9C6EC8()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC10EventKitUI33EKRemoteUIObjectSerializerWrapper_serializer);
  v2 = sub_1AF9F7B6C();

  return v2;
}

id EKRemoteUIObjectSerializerWrapper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKRemoteUIObjectSerializerWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for EKRemoteUIObjectSerializerWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EKRemoteUIObjectSerializerWrapper.serializedRepresentation(ekObject:obfuscateKeyProperties:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of EKRemoteUIObjectSerializerWrapper.serializedRepresentation(ekObject:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

double sub_1AF9C6FF4(uint64_t a1)
{
  double result;

  *(_WORD *)(a1 + 144) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_1AF9C7014(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BB00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1AF9C705C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id EKCalendarChooserOOPImpl.__allocating_init(eventStore:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_1AF9CCA50(a1);

  return v4;
}

id EKCalendarChooserOOPImpl.init(eventStore:)(void *a1)
{
  id v2;

  v2 = sub_1AF9CCA50(a1);

  return v2;
}

uint64_t sub_1AF9C7160(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  id v3;
  double v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t (*v10)();
  uint64_t v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t (*v15)();
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)();
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)();
  uint64_t v22;
  char v23;
  uint64_t (*v24)();
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)();
  uint64_t v30;
  char v31;
  uint64_t (*v32)();
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)();
  uint64_t v36;
  char v37;
  uint64_t (*v38)();
  uint64_t v39;
  char v40;
  uint64_t (*v41)();
  uint64_t v42;
  void *v43;
  uint64_t (*v44)();
  uint64_t v45;
  char v46;
  uint64_t (*v47)();
  uint64_t v48;
  int v49;
  uint64_t (*v50)();
  uint64_t v51;
  char v52;
  uint64_t (*v53)();
  uint64_t v54;
  void *v55;
  uint64_t (*v56)();
  uint64_t v57;
  char v58;
  uint64_t v59;
  _BYTE v61[32];
  _BYTE v62[152];
  _BYTE v63[152];
  _BYTE v64[152];
  _BYTE v65[152];
  _BYTE v66[152];
  _BYTE v67[152];
  _BYTE v68[152];
  _BYTE v69[152];
  _BYTE v70[152];
  _BYTE v71[152];
  _BYTE v72[152];
  _BYTE v73[152];
  _BYTE v74[152];
  _BYTE v75[152];
  _BYTE v76[152];
  _BYTE v77[152];
  _BYTE v78[152];
  _BYTE v79[152];
  _BYTE v80[152];
  _BYTE v81[152];
  _BYTE v82[152];
  _BYTE v83[152];
  _BYTE v84[152];
  _BYTE v85[152];
  _BYTE v86[152];
  _BYTE v87[152];
  _BYTE v88[152];
  _BYTE v89[152];
  _BYTE v90[152];
  _BYTE v91[176];
  objc_super v92;
  _BYTE v93[152];
  _BYTE v94[152];
  _BYTE v95[152];
  _BYTE v96[152];

  MEMORY[0x1E0C80A78](a1);
  v2 = v1;
  v92.receiver = v1;
  v92.super_class = (Class)type metadata accessor for EKCalendarChooserOOPImpl();
  objc_msgSendSuper2(&v92, sel_viewDidLoad);
  v3 = *(id *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostViewModel);
  v4 = sub_1AF9EEFE0((uint64_t)v93);
  CGSizeMake(v93, v4);
  v5 = (uint64_t)v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView;
  swift_beginAccess();
  sub_1AF9C7014(v5, (uint64_t)v94);
  sub_1AF9C7014((uint64_t)v93, v5);
  sub_1AF9CCE18((uint64_t)v94, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_1AF9CCD70);
  v6 = sub_1AF9C705C();
  sub_1AF9C7014(v7, (uint64_t)v95);
  sub_1AF9C7014((uint64_t)v95, (uint64_t)v96);
  if (sub_1AF9CCE00((uint64_t)v96) != 1)
  {
    v8 = *(void **)((char *)v2 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore);
    v9 = v8;
    sub_1AF9EFF18(v8);
  }
  ((void (*)(_BYTE *, _QWORD))v6)(v91, 0);
  v10 = sub_1AF9C705C();
  sub_1AF9C7014(v11, (uint64_t)v90);
  sub_1AF9C7014((uint64_t)v90, (uint64_t)v91);
  v12 = sub_1AF9CCE00((uint64_t)v91);
  v13 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (v12 != 1)
  {
    v14 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x158))();
    sub_1AF9F012C(v14);
  }
  ((void (*)(_BYTE *, _QWORD))v10)(v89, 0);
  v15 = sub_1AF9C705C();
  sub_1AF9C7014(v16, (uint64_t)v88);
  sub_1AF9C7014((uint64_t)v88, (uint64_t)v89);
  if (sub_1AF9CCE00((uint64_t)v89) != 1)
  {
    v17 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x170))();
    sub_1AF9F02B0(v17);
  }
  ((void (*)(_BYTE *, _QWORD))v15)(v87, 0);
  v18 = sub_1AF9C705C();
  sub_1AF9C7014(v19, (uint64_t)v86);
  sub_1AF9C7014((uint64_t)v86, (uint64_t)v87);
  if (sub_1AF9CCE00((uint64_t)v87) != 1)
  {
    v20 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x188))();
    sub_1AF9F0438(v20);
  }
  ((void (*)(_BYTE *, _QWORD))v18)(v85, 0);
  v21 = sub_1AF9C705C();
  sub_1AF9C7014(v22, (uint64_t)v84);
  sub_1AF9C7014((uint64_t)v84, (uint64_t)v85);
  if (sub_1AF9CCE00((uint64_t)v85) != 1)
  {
    v23 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x1A0))();
    sub_1AF9F05B8(v23 & 1);
  }
  ((void (*)(_BYTE *, _QWORD))v21)(v83, 0);
  v24 = sub_1AF9C705C();
  sub_1AF9C7014(v25, (uint64_t)v82);
  sub_1AF9C7014((uint64_t)v82, (uint64_t)v83);
  if (sub_1AF9CCE00((uint64_t)v83) != 1)
  {
    v26 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x1B8))();
    sub_1AF9F0738(v26 & 1);
  }
  v27 = ((uint64_t (*)(_BYTE *, _QWORD))v24)(v81, 0);
  v28 = (*(uint64_t (**)(uint64_t))((*v13 & *v2) + 0x200))(v27);
  sub_1AF9C9A44(v28);
  swift_bridgeObjectRelease();
  v29 = sub_1AF9C705C();
  sub_1AF9C7014(v30, (uint64_t)v80);
  sub_1AF9C7014((uint64_t)v80, (uint64_t)v81);
  if (sub_1AF9CCE00((uint64_t)v81) != 1)
  {
    v31 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x220))();
    sub_1AF9F0A44(v31 & 1);
  }
  ((void (*)(_BYTE *, _QWORD))v29)(v79, 0);
  v32 = sub_1AF9C705C();
  sub_1AF9C7014(v33, (uint64_t)v78);
  sub_1AF9C7014((uint64_t)v78, (uint64_t)v79);
  if (sub_1AF9CCE00((uint64_t)v79) != 1)
  {
    v34 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x238))();
    sub_1AF9F0BC4(v34);
  }
  ((void (*)(_BYTE *, _QWORD))v32)(v77, 0);
  v35 = sub_1AF9C705C();
  sub_1AF9C7014(v36, (uint64_t)v76);
  sub_1AF9C7014((uint64_t)v76, (uint64_t)v77);
  if (sub_1AF9CCE00((uint64_t)v77) != 1)
  {
    v37 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x250))();
    sub_1AF9F0D44(v37 & 1);
  }
  ((void (*)(_BYTE *, _QWORD))v35)(v75, 0);
  v38 = sub_1AF9C705C();
  sub_1AF9C7014(v39, (uint64_t)v74);
  sub_1AF9C7014((uint64_t)v74, (uint64_t)v75);
  if (sub_1AF9CCE00((uint64_t)v75) != 1)
  {
    v40 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x268))();
    sub_1AF9F0EC4(v40 & 1);
  }
  ((void (*)(_BYTE *, _QWORD))v38)(v73, 0);
  v41 = sub_1AF9C705C();
  sub_1AF9C7014(v42, (uint64_t)v72);
  sub_1AF9C7014((uint64_t)v72, (uint64_t)v73);
  if (sub_1AF9CCE00((uint64_t)v73) != 1)
  {
    v43 = (void *)(*(uint64_t (**)(void))((*v13 & *v2) + 0x280))();
    sub_1AF9F1358(v43);
  }
  ((void (*)(_BYTE *, _QWORD))v41)(v71, 0);
  v44 = sub_1AF9C705C();
  sub_1AF9C7014(v45, (uint64_t)v70);
  sub_1AF9C7014((uint64_t)v70, (uint64_t)v71);
  if (sub_1AF9CCE00((uint64_t)v71) != 1)
  {
    v46 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x298))();
    sub_1AF9F1518(v46 & 1);
  }
  ((void (*)(_BYTE *, _QWORD))v44)(v69, 0);
  v47 = sub_1AF9C705C();
  sub_1AF9C7014(v48, (uint64_t)v68);
  sub_1AF9C7014((uint64_t)v68, (uint64_t)v69);
  if (sub_1AF9CCE00((uint64_t)v69) != 1)
  {
    v49 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x2C8))();
    sub_1AF9F1694(v49);
  }
  ((void (*)(_BYTE *, _QWORD))v47)(v67, 0);
  v50 = sub_1AF9C705C();
  sub_1AF9C7014(v51, (uint64_t)v66);
  sub_1AF9C7014((uint64_t)v66, (uint64_t)v67);
  if (sub_1AF9CCE00((uint64_t)v67) != 1)
  {
    v52 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x2E0))();
    sub_1AF9F1814(v52 & 1);
  }
  ((void (*)(_BYTE *, _QWORD))v50)(v65, 0);
  v53 = sub_1AF9C705C();
  sub_1AF9C7014(v54, (uint64_t)v64);
  sub_1AF9C7014((uint64_t)v64, (uint64_t)v65);
  if (sub_1AF9CCE00((uint64_t)v65) != 1)
  {
    v55 = (void *)(*(uint64_t (**)(void))((*v13 & *v2) + 0x2B0))();
    sub_1AF9F10C8(v55);
  }
  ((void (*)(_BYTE *, _QWORD))v53)(v63, 0);
  v56 = sub_1AF9C705C();
  sub_1AF9C7014(v57, (uint64_t)v62);
  sub_1AF9C7014((uint64_t)v62, (uint64_t)v63);
  if (sub_1AF9CCE00((uint64_t)v63) != 1)
  {
    v58 = (*(uint64_t (**)(void))((*v13 & *v2) + 0x2F8))();
    sub_1AF9F1994(v58 & 1);
  }
  v59 = ((uint64_t (*)(_BYTE *, _QWORD))v56)(v61, 0);
  return (*(uint64_t (**)(uint64_t))((*v13 & *v2) + 0x140))(v59);
}

uint64_t sub_1AF9C798C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  _QWORD *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  uint64_t result;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  id v100;
  uint64_t v101;
  id v102;
  char v103;
  char v104;
  int v105;
  char v106;
  char v107;
  char v108;
  uint64_t v109;
  char v110;
  char v111;
  char v112;
  uint64_t v113;
  __int128 v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int16 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[32];
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int16 v134;
  char v135;
  char v136;
  char v137;
  char v138;
  char v139;
  char v140;
  char v141;
  char v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int16 v152;
  _BYTE v153[152];
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _BYTE v157[32];
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int16 v162;

  v1 = v0;
  v2 = (uint64_t)&v0[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView];
  swift_beginAccess();
  sub_1AF9C7014(v2, (uint64_t)v153);
  sub_1AF9C7014((uint64_t)v153, (uint64_t)&v154);
  if (sub_1AF9CCE00((uint64_t)&v154) == 1)
    goto LABEL_29;
  v149 = v159;
  v150 = v160;
  v151 = v161;
  v152 = v162;
  v145 = v156;
  v146 = *(_OWORD *)v157;
  v147 = *(_OWORD *)&v157[16];
  v148 = v158;
  v143 = v154;
  v144 = v155;
  v3 = v154;
  v114 = *(_OWORD *)&v157[8];
  v4 = *(void **)v157;
  v113 = *(_QWORD *)&v157[24];
  v112 = v158;
  v111 = BYTE1(v158);
  v5 = (void *)*((_QWORD *)&v158 + 1);
  v110 = v159;
  v109 = *((_QWORD *)&v159 + 1);
  v108 = v160;
  v107 = BYTE1(v160);
  v6 = (void *)*((_QWORD *)&v160 + 1);
  v94 = *(_QWORD *)v157;
  v95 = *((_QWORD *)&v160 + 1);
  v7 = (void *)v161;
  v106 = BYTE8(v161);
  v105 = HIDWORD(v161);
  v104 = v162;
  v103 = HIBYTE(v162);
  v90 = *((_QWORD *)&v154 + 1);
  v91 = v154;
  v101 = v155;
  v98 = v156;
  v97 = v161;
  v88 = *(_QWORD *)&v157[8];
  v89 = *(_QWORD *)v157;
  v86 = *(_QWORD *)&v157[24];
  v87 = *(_QWORD *)&v157[16];
  v141 = BYTE1(v158);
  v142 = v158;
  v140 = v159;
  v84 = *((_QWORD *)&v159 + 1);
  v85 = *((_QWORD *)&v158 + 1);
  v138 = BYTE1(v160);
  v139 = v160;
  v137 = BYTE8(v161);
  v135 = HIBYTE(v162);
  v136 = v162;
  v81 = *((_QWORD *)&v160 + 1);
  v82 = v161;
  v83 = HIDWORD(v161);
  v8 = (void *)objc_opt_self();
  sub_1AF9CCE18((uint64_t)v153, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_1AF9CCE7C);
  sub_1AF9CCE18((uint64_t)v153, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_1AF9CCE7C);
  v102 = v7;
  v9 = *((id *)&v3 + 1);
  v96 = v5;
  v99 = v4;
  v100 = v6;
  v10 = objc_msgSend(v8, sel_shared);
  v11 = sub_1AF9D3D88();
  v12 = objc_msgSend(v10, sel_layoutDirectionOrOverride);
  v13 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v11) + 0xC8))(v12);

  v14 = sub_1AF9D3D88();
  (*(void (**)(id))((*v13 & *v14) + 0xE0))(objc_msgSend(v10, sel_preferredContentSizeCategoryOrOverride));

  v80 = v10;
  v15 = objc_msgSend(v10, sel_viewHierarchyOrOverride);
  v16 = EKUIContainedControllerIdealWidth();
  EKUIContainedControllerIdealHeight();
  v18 = CGSizeMake(v17, v16);
  v20 = v19;
  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel_systemBlueColor);
  v23 = sub_1AF9D3D88();
  sub_1AF9CCE18((uint64_t)v153, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_1AF9CCD70);
  v24 = objc_msgSend(v15, sel_ekui_verticalSizeClass);
  v25 = objc_msgSend(v15, sel_ekui_horizontalSizeClass);
  v26 = objc_msgSend(v15, sel_ekui_interfaceOrientation);
  v27 = v22;
  objc_msgSend(v15, sel_ekui_affineTransform);
  v92 = v127;
  v93 = v126;
  v28 = v128;
  v29 = objc_allocWithZone((Class)EKUIViewHierarchyFromComponents);
  v126 = v93;
  v127 = v92;
  v128 = v28;
  v30 = objc_msgSend(v29, sel_initWithSize_verticalSizeClass_horizontalSizeClass_interfaceOrientation_tintColor_affineTranform_, v24, v25, v26, v27, &v126, v18, v20);

  (*(void (**)(id))((*v13 & *v23) + 0xF8))(v30);
  v31 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1AF9C09DC(v98);
  v32 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1AF9C09DC(v101);
  *(_QWORD *)&v126 = v3;
  *((_QWORD *)&v126 + 1) = v9;
  *(_QWORD *)&v127 = sub_1AF9CCFD8;
  *((_QWORD *)&v127 + 1) = v32;
  *(_QWORD *)&v128 = sub_1AF9CCF2C;
  *((_QWORD *)&v128 + 1) = v31;
  *(_QWORD *)v129 = v94;
  *(_OWORD *)&v129[8] = v114;
  *(_QWORD *)&v129[24] = v113;
  LOBYTE(v130) = v112;
  BYTE1(v130) = v111;
  *((_QWORD *)&v130 + 1) = v96;
  LOBYTE(v131) = v110;
  *((_QWORD *)&v131 + 1) = v109;
  LOBYTE(v132) = v108;
  BYTE1(v132) = v107;
  *((_QWORD *)&v132 + 1) = v95;
  *(_QWORD *)&v133 = v97;
  BYTE8(v133) = v106;
  HIDWORD(v133) = v105;
  LOBYTE(v134) = v104;
  HIBYTE(v134) = v103;
  sub_1AF9CD05C((uint64_t)&v126);

  swift_release();
  swift_release();

  v122 = v131;
  v123 = v132;
  v124 = v133;
  v125 = v134;
  v118 = v128;
  v119 = *(_OWORD *)v129;
  v120 = *(_OWORD *)&v129[16];
  v121 = v130;
  v116 = v126;
  v117 = v127;
  v33 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BB20));
  v34 = (void *)sub_1AF9F7A1C();
  objc_msgSend(v1, sel_addChildViewController_, v34);
  v35 = objc_msgSend(v34, sel_view);
  if (!v35)
  {
    __break(1u);
    goto LABEL_17;
  }
  v36 = v35;
  objc_msgSend(v35, sel_setInsetsLayoutMarginsFromSafeArea_, 0);

  v37 = objc_msgSend(v34, sel_view);
  if (!v37)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v38 = v37;
  v39 = objc_msgSend(v21, sel_systemGroupedBackgroundColor);
  objc_msgSend(v38, sel_setBackgroundColor_, v39);

  v40 = objc_msgSend(v1, sel_view);
  if (!v40)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v41 = v40;
  v42 = objc_msgSend(v34, sel_view);
  if (!v42)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v43 = v42;
  objc_msgSend(v41, sel_addSubview_, v42);

  objc_msgSend(v34, sel_didMoveToParentViewController_, v1);
  v44 = *(void **)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostingController];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostingController] = v34;
  v45 = v34;

  v46 = objc_msgSend(v45, sel_view);
  if (!v46)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v47 = v46;
  objc_msgSend(v46, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BB30);
  v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_1AFA14080;
  v49 = objc_msgSend(v45, sel_view);
  if (!v49)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v50 = v49;
  v115 = v27;
  v51 = objc_msgSend(v49, sel_leadingAnchor);

  v52 = objc_msgSend(v1, sel_view);
  if (!v52)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v53 = v52;
  v54 = objc_msgSend(v52, sel_leadingAnchor);

  v55 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v54);
  *(_QWORD *)(v48 + 32) = v55;
  v56 = objc_msgSend(v45, sel_view);
  if (!v56)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v57 = v56;
  v58 = objc_msgSend(v56, sel_topAnchor);

  v59 = objc_msgSend(v1, sel_view);
  if (!v59)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v60 = v59;
  v61 = objc_msgSend(v59, sel_topAnchor);

  v62 = objc_msgSend(v58, sel_constraintEqualToAnchor_, v61);
  *(_QWORD *)(v48 + 40) = v62;
  v63 = objc_msgSend(v45, sel_view);
  if (!v63)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v64 = v63;
  v65 = objc_msgSend(v63, sel_trailingAnchor);

  v66 = objc_msgSend(v1, sel_view);
  if (!v66)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v67 = v66;
  v68 = objc_msgSend(v66, sel_trailingAnchor);

  v69 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v68);
  *(_QWORD *)(v48 + 48) = v69;
  v70 = objc_msgSend(v45, sel_view);
  if (v70)
  {
    v71 = v70;
    v72 = objc_msgSend(v70, sel_bottomAnchor);

    v73 = objc_msgSend(v1, sel_view);
    if (v73)
    {
      v74 = v73;
      v75 = (void *)objc_opt_self();
      v76 = objc_msgSend(v74, sel_bottomAnchor);

      v77 = objc_msgSend(v72, sel_constraintEqualToAnchor_, v76);
      *(_QWORD *)(v48 + 56) = v77;
      sub_1AF9F7C44();
      sub_1AF9C6B78(0, &qword_1EEE6C470);
      v78 = (void *)sub_1AF9F7C20();
      swift_bridgeObjectRelease();
      objc_msgSend(v75, sel_activateConstraints_, v78);

      swift_unknownObjectRelease();
      *(_QWORD *)&v116 = v91;
      *((_QWORD *)&v116 + 1) = v90;
      *(_QWORD *)&v117 = sub_1AF9CCFD8;
      *((_QWORD *)&v117 + 1) = v32;
      *(_QWORD *)&v118 = sub_1AF9CCF2C;
      *((_QWORD *)&v118 + 1) = v31;
      *(_QWORD *)&v119 = v89;
      *((_QWORD *)&v119 + 1) = v88;
      *(_QWORD *)&v120 = v87;
      *((_QWORD *)&v120 + 1) = v86;
      LOBYTE(v121) = v142;
      BYTE1(v121) = v141;
      *((_QWORD *)&v121 + 1) = v85;
      LOBYTE(v122) = v140;
      *((_QWORD *)&v122 + 1) = v84;
      LOBYTE(v123) = v139;
      BYTE1(v123) = v138;
      *((_QWORD *)&v123 + 1) = v81;
      *(_QWORD *)&v124 = v82;
      BYTE8(v124) = v137;
      HIDWORD(v124) = v83;
      LOBYTE(v125) = v136;
      HIBYTE(v125) = v135;
      return sub_1AF9CD0DC((uint64_t)&v116);
    }
    goto LABEL_28;
  }
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  result = sub_1AF9F7EF0();
  __break(1u);
  return result;
}

void sub_1AF9C8538(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  os_log_type_t v10;
  os_log_t *v11;
  os_log_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  os_log_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  os_log_type_t v26;
  NSObject *v27;
  os_log_type_t v28;
  NSObject *v29;
  uint8_t *v30;
  NSObject *log;
  uint64_t v32;
  uint64_t v34;

  v10 = sub_1AF9F7CF8();
  v11 = (os_log_t *)sub_1AF9CFC38();
  v12 = *v11;
  if (os_log_type_enabled(*v11, v10))
  {
    swift_bridgeObjectRetain_n();
    log = v12;
    v32 = a4;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v34 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_1AF9C4DD4(a1, a2, &v34);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AF84D000, log, v10, "EKCalendarChooserOOPImpl: Received remoteCalendarChooserRequestPresentView on the host app side. viewName: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v14, -1, -1);
    v15 = v13;
    a4 = v32;
    MEMORY[0x1B5DFEE1C](v15, -1, -1);

  }
  v16 = objc_msgSend(v5, sel_parentViewController);
  if (v16)
  {
    v17 = v16;
    v18 = objc_msgSend(v16, sel_parentViewController);

    if (v18)
    {
      objc_opt_self();
      v19 = swift_dynamicCastObjCClass();
      if (v19)
      {
        v20 = (void *)v19;
        if (!a1 && a2 == 0xE000000000000000 || (sub_1AF9F7F50() & 1) != 0)
        {
          v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F20]), sel_init);
          if (!v21)
          {

            return;
          }
        }
        else
        {
          sub_1AF9F7CEC();
          v23 = *v11;
          sub_1AF9F7974();

          type metadata accessor for EKEventGenericDetailViewControllerOOPImpl();
          swift_bridgeObjectRetain();
          v21 = EKEventGenericDetailViewControllerOOPImpl.__allocating_init(hostViewID:)(a3, a4);
        }
        v22 = (os_log_t)v21;
        v24 = objc_msgSend(v20, sel_navigationDelegate);
        if (!v24)
          goto LABEL_27;
        v25 = v24;
        if (!a5)
        {
          if ((objc_msgSend(v24, sel_respondsToSelector_, sel_pushViewController_animated_) & 1) == 0)
          {

            swift_unknownObjectRelease();
            return;
          }
          objc_msgSend(v25, sel_pushViewController_animated_, v22, 1);

          swift_unknownObjectRelease();
          goto LABEL_28;
        }
        if (a5 != 1)
        {
          if (a5 != 2)
          {
            v26 = sub_1AF9F7CEC();
            v27 = *v11;
            v28 = v26;
            if (os_log_type_enabled(v27, v26))
            {
              v29 = v27;
              v30 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)v30 = 134217984;
              v34 = a5;
              sub_1AF9F7D94();
              _os_log_impl(&dword_1AF84D000, v29, v28, "EKCalendarChooserOOPImpl: presentationStyle not recognized: %ld", v30, 0xCu);
              MEMORY[0x1B5DFEE1C](v30, -1, -1);
              swift_unknownObjectRelease();

LABEL_27:
LABEL_28:

              goto LABEL_13;
            }
LABEL_26:
            swift_unknownObjectRelease();
            goto LABEL_27;
          }
          -[NSObject setModalPresentationStyle:](v22, sel_setModalPresentationStyle_, 2);
        }
        objc_msgSend(v25, sel_presentViewController_animated_completion_, v22, 1, 0);
        goto LABEL_26;
      }

    }
  }
  sub_1AF9F7CEC();
  v22 = *v11;
  sub_1AF9F7974();
LABEL_13:

}

void sub_1AF9C89AC(unint64_t a1, char a2)
{
  void *v2;
  void *v3;
  uint64_t *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = v2;
  sub_1AF9F7CF8();
  v6 = sub_1AF9CFC38();
  v7 = (id)*v6;
  sub_1AF9F7974();

  v8 = objc_msgSend(v3, sel_parentViewController);
  if (!v8)
    goto LABEL_11;
  v9 = v8;
  v10 = objc_msgSend(v8, sel_parentViewController);

  if (!v10)
    goto LABEL_11;
  objc_opt_self();
  v11 = swift_dynamicCastObjCClass();
  if (!v11)
  {

LABEL_11:
    sub_1AF9F7CEC();
    v22 = (id)*v6;
    sub_1AF9F7974();
LABEL_12:

    return;
  }
  v12 = v11;
  v13 = objc_msgSend(v3, sel_parentViewController);
  if (!v13)
  {
LABEL_14:
    sub_1AF9F7CEC();
    v22 = (id)*v6;
    sub_1AF9F7974();
    goto LABEL_15;
  }
  v22 = v13;
  objc_opt_self();
  v14 = swift_dynamicCastObjCClass();
  if (!v14)
  {

    goto LABEL_14;
  }
  v15 = (void *)v14;
  v16 = v3;
  v17 = sub_1AF9CD15C(a1, v16);

  v18 = sub_1AF9CD2EC(v17);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v16[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars] = v18;
  swift_bridgeObjectRelease();
  sub_1AF9C6B78(0, &qword_1EEE6BB48);
  sub_1AF9CD444();
  swift_bridgeObjectRetain();
  v19 = (void *)sub_1AF9F7CB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_remoteCalendarChooserSelectionChanged_allSelected_, v19, a2 & 1);

  v20 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v16) + 0x1D0))();
  if (!v20)
  {
LABEL_15:

    goto LABEL_12;
  }
  v21 = v20;
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_calendarChooserSelectionDidChange_) & 1) != 0)
    objc_msgSend(v21, sel_calendarChooserSelectionDidChange_, v12);

  swift_unknownObjectRelease();
}

uint64_t sub_1AF9C8CD8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1AF9C8D30(uint64_t a1)
{
  return sub_1AF9CA0B0(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle, (void (*)(_QWORD))sub_1AF9F012C);
}

uint64_t sub_1AF9C8D44@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x158))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9C8D84(_QWORD *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x160))(*a1);
}

void (*sub_1AF9C8DC0(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9C8E18;
}

void sub_1AF9C8E18(_QWORD **a1, char a2)
{
  sub_1AF9CA248(a1, a2, (void (*)(_QWORD))sub_1AF9F012C);
}

uint64_t sub_1AF9C8E68()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1AF9C8EC0(uint64_t a1)
{
  return sub_1AF9CA0B0(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle, (void (*)(_QWORD))sub_1AF9F02B0);
}

uint64_t sub_1AF9C8ED4@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x170))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9C8F14(_QWORD *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x178))(*a1);
}

void (*sub_1AF9C8F50(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9C8FA8;
}

void sub_1AF9C8FA8(_QWORD **a1, char a2)
{
  sub_1AF9CA248(a1, a2, (void (*)(_QWORD))sub_1AF9F02B0);
}

uint64_t sub_1AF9C8FF8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1AF9C9050(uint64_t a1)
{
  return sub_1AF9CA0B0(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType, (void (*)(_QWORD))sub_1AF9F0438);
}

uint64_t sub_1AF9C9064@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x188))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9C90A4(_QWORD *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x190))(*a1);
}

void (*sub_1AF9C90E0(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9C9138;
}

void sub_1AF9C9138(_QWORD **a1, char a2)
{
  sub_1AF9CA248(a1, a2, (void (*)(_QWORD))sub_1AF9F0438);
}

id EKCalendarChooserOOPImpl.eventStore.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore);
}

uint64_t sub_1AF9C91A8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9C9200(char a1)
{
  return sub_1AF9CB45C(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser, (void (*)(_QWORD))sub_1AF9F05B8);
}

uint64_t sub_1AF9C9214@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1A0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9C9258(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1A8))(*a1);
}

void (*sub_1AF9C9294(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9C92EC;
}

void sub_1AF9C92EC(_QWORD **a1, char a2)
{
  sub_1AF9CB5F8(a1, a2, (void (*)(_QWORD))sub_1AF9F05B8);
}

uint64_t sub_1AF9C933C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9C9394(char a1)
{
  return sub_1AF9CB45C(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell, (void (*)(_QWORD))sub_1AF9F0738);
}

uint64_t sub_1AF9C93A8@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1B8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9C93EC(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1C0))(*a1);
}

void (*sub_1AF9C9428(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9C9480;
}

void sub_1AF9C9480(_QWORD **a1, char a2)
{
  sub_1AF9CB5F8(a1, a2, (void (*)(_QWORD))sub_1AF9F0738);
}

uint64_t sub_1AF9C94D4()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_1AF9C9580(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_delegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_1AF9C95D0@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1D0))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9C9610(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1D8);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1AF9C9650())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1AF9C9700()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id v6;
  uint64_t v7;

  v1 = MEMORY[0x1E0DEE9E8];
  v7 = MEMORY[0x1E0DEE9E8];
  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
  if (v3 == 1)
  {
    v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars);
    swift_bridgeObjectRetain();
  }
  else if (!v3)
  {
    v4 = (void *)(*(uint64_t (**)(void))((*v2 & *v0) + 0x280))();
    if (v4)
    {
      sub_1AF9CBA10(&v6, v4);

      return v7;
    }
  }
  return v1;
}

uint64_t sub_1AF9C9840(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars) = a1;
  swift_bridgeObjectRelease();
  v2 = swift_bridgeObjectRetain();
  sub_1AF9C9A44(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF9C9884@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x200))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9C98C4(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x208);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1AF9C9904(_QWORD *a1))(_QWORD *a1, char a2)
{
  _QWORD *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v8;
  uint64_t v9;

  a1[1] = v1;
  v3 = MEMORY[0x1E0DEE9E8];
  v9 = MEMORY[0x1E0DEE9E8];
  v4 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x158))();
  if (v5 == 1)
  {
    v3 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars);
    swift_bridgeObjectRetain();
  }
  else if (!v5)
  {
    v6 = (void *)(*(uint64_t (**)(void))((*v4 & *v1) + 0x280))();
    if (v6)
    {
      sub_1AF9CBA10(&v8, v6);

      v3 = v9;
    }
  }
  *a1 = v3;
  return sub_1AF9C99C4;
}

uint64_t sub_1AF9C99C4(_QWORD *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(a1[1] + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars) = *a1;
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v2 = swift_bridgeObjectRetain();
    sub_1AF9C9A44(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v3 = swift_bridgeObjectRetain();
    sub_1AF9C9A44(v3);
  }
  return swift_bridgeObjectRelease();
}

void sub_1AF9C9A44(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t (*v18)();
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  _BYTE v22[32];
  _QWORD v23[19];
  _QWORD v24[25];

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E20]), sel_init);
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1AF9F7DE8();
    sub_1AF9C6B78(0, &qword_1EEE6BB48);
    sub_1AF9CD444();
    sub_1AF9F7CE0();
    a1 = v24[19];
    v21 = v24[20];
    v3 = v24[21];
    v4 = v24[22];
    v5 = v24[23];
  }
  else
  {
    v6 = -1 << *(_BYTE *)(a1 + 32);
    v21 = a1 + 56;
    v3 = ~v6;
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v5 = v8 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v4 = 0;
  }
  v20 = (unint64_t)(v3 + 64) >> 6;
  while (a1 < 0)
  {
    v12 = sub_1AF9F7E3C();
    if (!v12)
      goto LABEL_32;
    v23[0] = v12;
    sub_1AF9C6B78(0, &qword_1EEE6BB48);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v13 = (id)v24[0];
    swift_unknownObjectRelease();
    v11 = v4;
    v9 = v5;
    if (!v24[0])
      goto LABEL_32;
LABEL_30:
    v17 = objc_msgSend(v13, sel_calendarIdentifier);
    if (!v17)
    {
      sub_1AF9F7BF0();
      v17 = (id)sub_1AF9F7BCC();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v2, sel_addObject_, v17);

    v4 = v11;
    v5 = v9;
  }
  if (v5)
  {
    v9 = (v5 - 1) & v5;
    v10 = __clz(__rbit64(v5)) | (v4 << 6);
    v11 = v4;
    goto LABEL_29;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    return;
  }
  if (v14 >= v20)
    goto LABEL_32;
  v15 = *(_QWORD *)(v21 + 8 * v14);
  v11 = v4 + 1;
  if (v15)
    goto LABEL_28;
  v11 = v4 + 2;
  if (v4 + 2 >= v20)
    goto LABEL_32;
  v15 = *(_QWORD *)(v21 + 8 * v11);
  if (v15)
    goto LABEL_28;
  v11 = v4 + 3;
  if (v4 + 3 >= v20)
    goto LABEL_32;
  v15 = *(_QWORD *)(v21 + 8 * v11);
  if (v15)
    goto LABEL_28;
  v11 = v4 + 4;
  if (v4 + 4 >= v20)
    goto LABEL_32;
  v15 = *(_QWORD *)(v21 + 8 * v11);
  if (v15)
  {
LABEL_28:
    v9 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v11 << 6);
LABEL_29:
    v13 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v10);
    if (!v13)
      goto LABEL_32;
    goto LABEL_30;
  }
  v16 = v4 + 5;
  while (v20 != v16)
  {
    v15 = *(_QWORD *)(v21 + 8 * v16++);
    if (v15)
    {
      v11 = v16 - 1;
      goto LABEL_28;
    }
  }
LABEL_32:
  sub_1AF9CDCFC();
  v18 = sub_1AF9C705C();
  sub_1AF9C7014(v19, (uint64_t)v23);
  sub_1AF9C7014((uint64_t)v23, (uint64_t)v24);
  if (sub_1AF9CCE00((uint64_t)v24) != 1)
    sub_1AF9F089C(v2);
  ((void (*)(_BYTE *, _QWORD))v18)(v22, 0);

}

uint64_t sub_1AF9C9DE4()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9C9E3C(char a1)
{
  return sub_1AF9CB45C(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories, (void (*)(_QWORD))sub_1AF9F0A44);
}

uint64_t sub_1AF9C9E50@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x220))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9C9E94(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x228))(*a1);
}

void (*sub_1AF9C9ED0(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9C9F28;
}

void sub_1AF9C9F28(_QWORD **a1, char a2)
{
  sub_1AF9CB5F8(a1, a2, (void (*)(_QWORD))sub_1AF9F0A44);
}

uint64_t sub_1AF9C9F78()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

void sub_1AF9C9FD0(char *a1, uint64_t a2, uint64_t a3, _QWORD *a4, void (*a5)(_QWORD))
{
  char *v8;
  char *v9;
  uint64_t (*v10)();
  uint64_t v11;
  char v12[32];
  _BYTE v13[152];
  _BYTE v14[152];

  v8 = &a1[*a4];
  swift_beginAccess();
  *(_QWORD *)v8 = a3;
  v9 = a1;
  v10 = sub_1AF9C705C();
  sub_1AF9C7014(v11, (uint64_t)v13);
  sub_1AF9C7014((uint64_t)v13, (uint64_t)v14);
  if (sub_1AF9CCE00((uint64_t)v14) != 1)
  {
    swift_beginAccess();
    a5(*(_QWORD *)v8);
  }
  ((void (*)(char *, _QWORD))v10)(v12, 0);

}

uint64_t sub_1AF9CA09C(uint64_t a1)
{
  return sub_1AF9CA0B0(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode, (void (*)(_QWORD))sub_1AF9F0BC4);
}

uint64_t sub_1AF9CA0B0(uint64_t a1, _QWORD *a2, void (*a3)(_QWORD))
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v7)();
  uint64_t v8;
  _BYTE v10[32];
  _BYTE v11[152];
  _BYTE v12[152];

  v6 = (_QWORD *)(v3 + *a2);
  swift_beginAccess();
  *v6 = a1;
  v7 = sub_1AF9C705C();
  sub_1AF9C7014(v8, (uint64_t)v11);
  sub_1AF9C7014((uint64_t)v11, (uint64_t)v12);
  if (sub_1AF9CCE00((uint64_t)v12) != 1)
  {
    swift_beginAccess();
    a3(*v6);
  }
  return ((uint64_t (*)(_BYTE *, _QWORD))v7)(v10, 0);
}

uint64_t sub_1AF9CA168@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x238))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9CA1A8(_QWORD *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x240))(*a1);
}

void (*sub_1AF9CA1E4(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9CA23C;
}

void sub_1AF9CA23C(_QWORD **a1, char a2)
{
  sub_1AF9CA248(a1, a2, (void (*)(_QWORD))sub_1AF9F0BC4);
}

void sub_1AF9CA248(_QWORD **a1, char a2, void (*a3)(_QWORD))
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v6)();
  uint64_t v7;
  _QWORD *v8;

  v3 = *a1;
  v4 = (uint64_t)(*a1 + 38);
  if ((a2 & 1) != 0)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    v6 = sub_1AF9C705C();
    sub_1AF9C7014(v7, (uint64_t)(v3 + 19));
    sub_1AF9C7014((uint64_t)(v3 + 19), (uint64_t)v3);
    if (sub_1AF9CCE00((uint64_t)v3) != 1)
    {
      v8 = (_QWORD *)(v3[45] + v3[46]);
      swift_beginAccess();
      a3(*v8);
    }
    ((void (*)(uint64_t, _QWORD))v6)(v4, 0);
  }
  free(v3);
}

uint64_t sub_1AF9CA34C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9CA3A4(char a1)
{
  return sub_1AF9CB45C(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus, (void (*)(_QWORD))sub_1AF9F0D44);
}

uint64_t sub_1AF9CA3B8@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x250))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9CA3FC(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x258))(*a1);
}

void (*sub_1AF9CA438(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9CA490;
}

void sub_1AF9CA490(_QWORD **a1, char a2)
{
  sub_1AF9CB5F8(a1, a2, (void (*)(_QWORD))sub_1AF9F0D44);
}

uint64_t sub_1AF9CA4E0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9CA538(char a1)
{
  return sub_1AF9CB45C(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh, (void (*)(_QWORD))sub_1AF9F0EC4);
}

uint64_t sub_1AF9CA54C@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x268))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9CA590(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x270))(*a1);
}

void (*sub_1AF9CA5CC(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9CA624;
}

void sub_1AF9CA624(_QWORD **a1, char a2)
{
  sub_1AF9CB5F8(a1, a2, (void (*)(_QWORD))sub_1AF9F0EC4);
}

uint64_t sub_1AF9CA684()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_1AF9CA7BC(v0);
  swift_bridgeObjectRelease();
  return v1;
}

void sub_1AF9CA70C(void *a1)
{
  sub_1AF9CD49C(a1);

}

uint64_t sub_1AF9CA730@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x280))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9CA770(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x288);
  v4 = *a1;
  return v3(v2);
}

uint64_t sub_1AF9CA7BC(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = sub_1AF9F7DDC();
    v5 = v4;
    v6 = sub_1AF9F7E48();
    v8 = MEMORY[0x1B5DFDAB4](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
LABEL_3:
      sub_1AF9CDCF0(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_1AF9CC760(v3, v5, v2 != 0, a1);
    v9 = v13;
    sub_1AF9CDCF0(v3, v5, v2 != 0);
    return v9;
  }
  result = sub_1AF9CC9C8(a1);
  if ((v12 & 1) == 0)
  {
    v5 = v11;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v11)
    {
      v3 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
        goto LABEL_3;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_1AF9CA8C8(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[1] = v1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_1AF9CA7BC(v3);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return sub_1AF9CA924;
}

void sub_1AF9CA924(void **a1, char a2)
{
  id v2;
  void *v3;
  id v4;

  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    v2 = v4;
    sub_1AF9CD49C(v4);

    v3 = v2;
  }
  else
  {
    sub_1AF9CD49C(*a1);
    v3 = v4;
  }

}

uint64_t sub_1AF9CA9C0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9CAA18(char a1)
{
  return sub_1AF9CB45C(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting, (void (*)(_QWORD))sub_1AF9F1518);
}

uint64_t sub_1AF9CAA2C@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x298))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9CAA70(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x2A0))(*a1);
}

void (*sub_1AF9CAAAC(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9CAB04;
}

void sub_1AF9CAB04(_QWORD **a1, char a2)
{
  sub_1AF9CB5F8(a1, a2, (void (*)(_QWORD))sub_1AF9F1518);
}

void *sub_1AF9CAB58()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9CABEC(void *a1)
{
  sub_1AF9CD5B8(a1);

}

uint64_t sub_1AF9CAC10@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x2B0))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9CAC50(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x2B8);
  v4 = *a1;
  return v3(v2);
}

void (*sub_1AF9CAC9C(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9CACF4;
}

void sub_1AF9CACF4(_QWORD **a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  void **v6;
  void *v7;
  id v8;

  v2 = *a1;
  v3 = (uint64_t)(*a1 + 38);
  if ((a2 & 1) != 0)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    v4 = sub_1AF9C705C();
    sub_1AF9C7014(v5, (uint64_t)(v2 + 19));
    sub_1AF9C7014((uint64_t)(v2 + 19), (uint64_t)v2);
    if (sub_1AF9CCE00((uint64_t)v2) != 1)
    {
      v6 = (void **)(v2[45] + v2[46]);
      swift_beginAccess();
      v7 = *v6;
      v8 = v7;
      sub_1AF9F10C8(v7);
    }
    ((void (*)(uint64_t, _QWORD))v4)(v3, 0);
  }
  free(v2);
}

uint64_t sub_1AF9CADFC()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9CAF0C(int a1)
{
  uint64_t v1;
  int *v3;
  uint64_t (*v4)();
  uint64_t v5;
  _BYTE v7[32];
  _BYTE v8[152];
  _BYTE v9[152];

  v3 = (int *)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode);
  swift_beginAccess();
  *v3 = a1;
  v4 = sub_1AF9C705C();
  sub_1AF9C7014(v5, (uint64_t)v8);
  sub_1AF9C7014((uint64_t)v8, (uint64_t)v9);
  if (sub_1AF9CCE00((uint64_t)v9) != 1)
  {
    swift_beginAccess();
    sub_1AF9F1694(*v3);
  }
  return ((uint64_t (*)(_BYTE *, _QWORD))v4)(v7, 0);
}

uint64_t sub_1AF9CAFBC@<X0>(_QWORD **a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x2C8))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9CAFFC(unsigned int *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x2D0))(*a1);
}

void (*sub_1AF9CB038(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9CB090;
}

void sub_1AF9CB090(_QWORD **a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  int *v6;

  v2 = *a1;
  v3 = (uint64_t)(*a1 + 38);
  if ((a2 & 1) != 0)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    v4 = sub_1AF9C705C();
    sub_1AF9C7014(v5, (uint64_t)(v2 + 19));
    sub_1AF9C7014((uint64_t)(v2 + 19), (uint64_t)v2);
    if (sub_1AF9CCE00((uint64_t)v2) != 1)
    {
      v6 = (int *)(v2[45] + v2[46]);
      swift_beginAccess();
      sub_1AF9F1694(*v6);
    }
    ((void (*)(uint64_t, _QWORD))v4)(v3, 0);
  }
  free(v2);
}

uint64_t sub_1AF9CB190()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9CB1E8(char a1)
{
  return sub_1AF9CB45C(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus, (void (*)(_QWORD))sub_1AF9F1814);
}

uint64_t sub_1AF9CB1FC@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x2E0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9CB240(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x2E8))(*a1);
}

void (*sub_1AF9CB27C(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9CB2D4;
}

void sub_1AF9CB2D4(_QWORD **a1, char a2)
{
  sub_1AF9CB5F8(a1, a2, (void (*)(_QWORD))sub_1AF9F1814);
}

uint64_t sub_1AF9CB324()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts);
  swift_beginAccess();
  return *v1;
}

void sub_1AF9CB37C(char *a1, uint64_t a2, char a3, _QWORD *a4, void (*a5)(_QWORD))
{
  char *v8;
  char *v9;
  uint64_t (*v10)();
  uint64_t v11;
  char v12[32];
  _BYTE v13[152];
  _BYTE v14[152];

  v8 = &a1[*a4];
  swift_beginAccess();
  *v8 = a3;
  v9 = a1;
  v10 = sub_1AF9C705C();
  sub_1AF9C7014(v11, (uint64_t)v13);
  sub_1AF9C7014((uint64_t)v13, (uint64_t)v14);
  if (sub_1AF9CCE00((uint64_t)v14) != 1)
  {
    swift_beginAccess();
    a5(*v8);
  }
  ((void (*)(char *, _QWORD))v10)(v12, 0);

}

uint64_t sub_1AF9CB448(char a1)
{
  return sub_1AF9CB45C(a1, &OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts, (void (*)(_QWORD))sub_1AF9F1994);
}

uint64_t sub_1AF9CB45C(char a1, _QWORD *a2, void (*a3)(_QWORD))
{
  uint64_t v3;
  _BYTE *v6;
  uint64_t (*v7)();
  uint64_t v8;
  _BYTE v10[32];
  _BYTE v11[152];
  _BYTE v12[152];

  v6 = (_BYTE *)(v3 + *a2);
  swift_beginAccess();
  *v6 = a1;
  v7 = sub_1AF9C705C();
  sub_1AF9C7014(v8, (uint64_t)v11);
  sub_1AF9C7014((uint64_t)v11, (uint64_t)v12);
  if (sub_1AF9CCE00((uint64_t)v12) != 1)
  {
    swift_beginAccess();
    a3(*v6);
  }
  return ((uint64_t (*)(_BYTE *, _QWORD))v7)(v10, 0);
}

uint64_t sub_1AF9CB514@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x2F8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9CB558(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x300))(*a1);
}

void (*sub_1AF9CB594(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x178uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts;
  v3[45] = v1;
  v3[46] = v4;
  swift_beginAccess();
  return sub_1AF9CB5EC;
}

void sub_1AF9CB5EC(_QWORD **a1, char a2)
{
  sub_1AF9CB5F8(a1, a2, (void (*)(_QWORD))sub_1AF9F1994);
}

void sub_1AF9CB5F8(_QWORD **a1, char a2, void (*a3)(_QWORD))
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v6)();
  uint64_t v7;
  unsigned __int8 *v8;

  v3 = *a1;
  v4 = (uint64_t)(*a1 + 38);
  if ((a2 & 1) != 0)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    v6 = sub_1AF9C705C();
    sub_1AF9C7014(v7, (uint64_t)(v3 + 19));
    sub_1AF9C7014((uint64_t)(v3 + 19), (uint64_t)v3);
    if (sub_1AF9CCE00((uint64_t)v3) != 1)
    {
      v8 = (unsigned __int8 *)(v3[45] + v3[46]);
      swift_beginAccess();
      a3(*v8);
    }
    ((void (*)(uint64_t, _QWORD))v6)(v4, 0);
  }
  free(v3);
}

uint64_t sub_1AF9CB6B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  _OWORD v3[9];
  __int16 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int16 v14;
  _BYTE v15[152];
  _BYTE v16[152];

  v1 = v0 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView;
  swift_beginAccess();
  sub_1AF9C7014(v1, (uint64_t)v15);
  sub_1AF9C7014((uint64_t)v15, (uint64_t)v16);
  result = sub_1AF9CCE00((uint64_t)v16);
  if ((_DWORD)result != 1)
  {
    sub_1AF9C7014((uint64_t)v15, (uint64_t)v3);
    v11 = v3[6];
    v12 = v3[7];
    v13 = v3[8];
    v14 = v4;
    v7 = v3[2];
    v8 = v3[3];
    v9 = v3[4];
    v10 = v3[5];
    v5 = v3[0];
    v6 = v3[1];
    sub_1AF9CD05C((uint64_t)v3);
    sub_1AF9F199C();
    return sub_1AF9CCE18((uint64_t)v15, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))sub_1AF9CCD70);
  }
  return result;
}

id EKCalendarChooserOOPImpl.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1AF9F7BCC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void EKCalendarChooserOOPImpl.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id EKCalendarChooserOOPImpl.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKCalendarChooserOOPImpl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AF9CBA10(_QWORD *a1, void *a2)
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
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

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
    v9 = sub_1AF9F7E24();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1AF9C6B78(0, &qword_1EEE6BB48);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_1AF9F7E18();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_1AF9CBCAC(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_1AF9CBEA0();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_1AF9CC13C((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_1AF9F7D64();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_1AF9C6B78(0, &qword_1EEE6BB48);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_1AF9F7D70();

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
        v18 = sub_1AF9F7D70();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_1AF9CC1BC((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_1AF9CBCAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC00);
    v2 = sub_1AF9F7E84();
    v14 = v2;
    sub_1AF9F7DE8();
    if (sub_1AF9F7E3C())
    {
      sub_1AF9C6B78(0, &qword_1EEE6BB48);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_1AF9CBEA0();
          v2 = v14;
        }
        result = sub_1AF9F7D64();
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
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_1AF9F7E3C());
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

uint64_t sub_1AF9CBEA0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC00);
  v3 = sub_1AF9F7E78();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_1AF9F7D64();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_1AF9CC13C(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_1AF9F7D64();
  result = sub_1AF9F7DD0();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_1AF9CC1BC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_1AF9CBEA0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1AF9CC340();
      goto LABEL_14;
    }
    sub_1AF9CC4E8();
  }
  v8 = *v3;
  v9 = sub_1AF9F7D64();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_1AF9C6B78(0, &qword_1EEE6BB48);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_1AF9F7D70();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_1AF9F7F5C();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_1AF9F7D70();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

id sub_1AF9CC340()
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC00);
  v2 = *v0;
  v3 = sub_1AF9F7E6C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1AF9CC4E8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC00);
  v3 = sub_1AF9F7E78();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_1AF9F7D64();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_1AF9CC760(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_1AF9F7E00() == *(_DWORD *)(a4 + 36))
      {
        sub_1AF9F7E0C();
        sub_1AF9C6B78(0, &qword_1EEE6BB48);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_1AF9F7D64();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_1AF9F7D70();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_1AF9F7D70();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x1B5DFDAF0](a1, a2, v7);
  sub_1AF9C6B78(0, &qword_1EEE6BB48);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_1AF9CC9C8(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
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

id sub_1AF9CCA50(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  objc_super v9;
  _BYTE v10[152];

  v2 = v1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostingController] = 0;
  v4 = (uint64_t)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView];
  sub_1AF9C6FF4((uint64_t)v10);
  sub_1AF9C7014((uint64_t)v10, v4);
  v5 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostViewModel;
  type metadata accessor for EKCalendarChooserOOPHostViewModel();
  v6 = v2;
  *(_QWORD *)&v2[v5] = sub_1AF9E18D0();
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_delegate] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars] = MEMORY[0x1E0DEE9E8];
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource] = 0;
  *(_DWORD *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus] = 0;
  v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore] = a1;
  v7 = a1;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for EKCalendarChooserOOPImpl();
  return objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, 0, 0);
}

void sub_1AF9CCBD4()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE v4[152];

  v1 = v0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostingController] = 0;
  v2 = (uint64_t)&v0[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostView];
  sub_1AF9C6FF4((uint64_t)v4);
  sub_1AF9C7014((uint64_t)v4, v2);
  v3 = OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_hostViewModel;
  type metadata accessor for EKCalendarChooserOOPHostViewModel();
  *(_QWORD *)&v1[v3] = sub_1AF9E18D0();
  *(_QWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_selectionStyle] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_displayStyle] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_entityType] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showIdentityChooser] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDelegateSetupCell] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_delegate] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars] = MEMORY[0x1E0DEE9E8];
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showDetailAccessories] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_chooserMode] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_disableCalendarsUnselectedByFocus] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_allowsPullToRefresh] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showsDeclinedEventsSetting] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource] = 0;
  *(_DWORD *)&v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_explanatoryTextMode] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_showAccountStatus] = 0;
  v1[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_onlyShowUnmanagedAccounts] = 0;

  sub_1AF9F7EF0();
  __break(1u);
}

uint64_t type metadata accessor for EKCalendarChooserOOPImpl()
{
  return objc_opt_self();
}

void sub_1AF9CCD70(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  if (a2)
  {

    sub_1AF9C09DC(a3);
    sub_1AF9C09DC(a5);

  }
}

uint64_t sub_1AF9CCE00(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_1AF9CCE18(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, __int16))
{
  __int16 v4;

  v4 = *(_WORD *)(a1 + 144);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), v4);
  return a1;
}

id sub_1AF9CCE7C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  id v20;
  id v21;
  id v22;
  id v23;
  id result;

  if (a2)
  {
    v20 = a2;
    sub_1AF9C09CC(a3);
    sub_1AF9C09CC(a5);
    v21 = a17;
    v22 = a7;
    v23 = a12;
    return a16;
  }
  return result;
}

uint64_t sub_1AF9CCF08()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AF9CCF2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  void *v12;

  swift_beginAccess();
  v11 = (_QWORD *)MEMORY[0x1B5DFEE88](v5 + 16);
  if (v11)
  {
    v12 = v11;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v11) + 0x148))(a1, a2, a3, a4, a5);

  }
}

void sub_1AF9CCFD8(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  void *v6;

  swift_beginAccess();
  v5 = (_QWORD *)MEMORY[0x1B5DFEE88](v2 + 16);
  if (v5)
  {
    v6 = v5;
    (*(void (**)(uint64_t, _QWORD))((*MEMORY[0x1E0DEEDD8] & *v5) + 0x150))(a1, a2 & 1);

  }
}

uint64_t sub_1AF9CD05C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 88);
  v6 = *(void **)(a1 + 120);
  v7 = *(void **)(a1 + 128);
  v8 = *(id *)(a1 + 8);
  sub_1AF9C09CC(v2);
  sub_1AF9C09CC(v3);
  v9 = v7;
  v10 = v4;
  v11 = v5;
  v12 = v6;
  return a1;
}

uint64_t sub_1AF9CD0DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 88);
  v6 = *(void **)(a1 + 120);
  v7 = *(void **)(a1 + 128);

  sub_1AF9C09DC(v2);
  sub_1AF9C09DC(v3);

  return a1;
}

uint64_t sub_1AF9CD15C(unint64_t a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  v11 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_15;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_1AF9F7EFC())
  {
    v5 = *(_QWORD *)&a2[OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_eventStore];
    for (i = 4; ; ++i)
    {
      v7 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1B5DFDB5C](i - 4, a1)
         : (char *)*(id *)(a1 + 8 * i);
      a2 = v7;
      v8 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v9 = objc_msgSend(v7, sel_calendarInEventStore_, v5);

      if (v9)
      {
        MEMORY[0x1B5DFD8D4]();
        if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1AF9F7C50();
        sub_1AF9F7C5C();
        sub_1AF9F7C44();
      }
      if (v8 == v4)
      {
        swift_bridgeObjectRelease();
        return v11;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1AF9CD2EC(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1AF9F7EFC();
    swift_bridgeObjectRelease();
  }
  sub_1AF9C6B78(0, &qword_1EEE6BB48);
  sub_1AF9CD444();
  result = sub_1AF9F7CD4();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1AF9F7EFC();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = (void *)MEMORY[0x1B5DFDB5C](i, a1);
        sub_1AF9CBA10(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_1AF9CBA10(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1AF9CD444()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE6BB50;
  if (!qword_1EEE6BB50)
  {
    v1 = sub_1AF9C6B78(255, &qword_1EEE6BB48);
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE6BB50);
  }
  return result;
}

uint64_t sub_1AF9CD49C(void *a1)
{
  uint64_t v1;
  uint64_t inited;
  id v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  id v8;
  _BYTE v10[32];
  _BYTE v11[152];
  unint64_t v12[19];

  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BB30);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AFA14090;
    *(_QWORD *)(inited + 32) = a1;
    v12[0] = inited;
    sub_1AF9F7C44();
    v4 = a1;
    v5 = sub_1AF9CD2EC(v12[0]);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars) = v5;

  }
  else
  {
    *(_QWORD *)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl__selectedCalendars) = MEMORY[0x1E0DEE9E8];
  }
  swift_bridgeObjectRelease();
  v6 = sub_1AF9C705C();
  sub_1AF9C7014(v7, (uint64_t)v11);
  sub_1AF9C7014((uint64_t)v11, (uint64_t)v12);
  if (sub_1AF9CCE00((uint64_t)v12) != 1)
  {
    v8 = a1;
    sub_1AF9F1358(a1);
  }
  return ((uint64_t (*)(_BYTE *, _QWORD))v6)(v10, 0);
}

uint64_t sub_1AF9CD5B8(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  uint64_t (*v6)();
  uint64_t v7;
  void *v8;
  id v9;
  _BYTE v11[32];
  _BYTE v12[152];
  _BYTE v13[152];

  v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI24EKCalendarChooserOOPImpl_limitedToSource);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = sub_1AF9C705C();
  sub_1AF9C7014(v7, (uint64_t)v12);
  sub_1AF9C7014((uint64_t)v12, (uint64_t)v13);
  if (sub_1AF9CCE00((uint64_t)v13) != 1)
  {
    swift_beginAccess();
    v8 = *v3;
    v9 = v8;
    sub_1AF9F10C8(v8);
  }
  return ((uint64_t (*)(_BYTE *, _QWORD))v6)(v11, 0);
}

uint64_t method lookup function for EKCalendarChooserOOPImpl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.__allocating_init(eventStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 312))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectionStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectionStyle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectionStyle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.displayStyle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.displayStyle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.displayStyle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.entityType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.entityType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.entityType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showIdentityChooser.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showIdentityChooser.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showIdentityChooser.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDelegateSetupCell.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDelegateSetupCell.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDelegateSetupCell.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendars.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendars.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendars.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDetailAccessories.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDetailAccessories.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x228))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showDetailAccessories.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.chooserMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.chooserMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x240))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.chooserMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.disableCalendarsUnselectedByFocus.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.disableCalendarsUnselectedByFocus.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.disableCalendarsUnselectedByFocus.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.allowsPullToRefresh.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.allowsPullToRefresh.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.allowsPullToRefresh.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendar.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendar.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.selectedCalendar.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showsDeclinedEventsSetting.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showsDeclinedEventsSetting.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showsDeclinedEventsSetting.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.limitedToSource.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.limitedToSource.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.limitedToSource.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.explanatoryTextMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.explanatoryTextMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.explanatoryTextMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showAccountStatus.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showAccountStatus.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.showAccountStatus.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.onlyShowUnmanagedAccounts.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.onlyShowUnmanagedAccounts.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x300))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.onlyShowUnmanagedAccounts.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x308))();
}

uint64_t dispatch thunk of EKCalendarChooserOOPImpl.toggleAllCalendars()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x310))();
}

void type metadata accessor for EKCalendarChooserExplanatoryTextMode(uint64_t a1)
{
  sub_1AF9CDCAC(a1, &qword_1EEE6BBD8);
}

void type metadata accessor for CUIKCalendarChooserMode(uint64_t a1)
{
  sub_1AF9CDCAC(a1, &qword_1EEE6BBE0);
}

void type metadata accessor for EKEntityType(uint64_t a1)
{
  sub_1AF9CDCAC(a1, &qword_1EEE6BBE8);
}

void type metadata accessor for EKCalendarChooserDisplayStyle(uint64_t a1)
{
  sub_1AF9CDCAC(a1, &qword_1EEE6BBF0);
}

void type metadata accessor for EKCalendarChooserSelectionStyle(uint64_t a1)
{
  sub_1AF9CDCAC(a1, &qword_1EEE6BBF8);
}

void sub_1AF9CDCAC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1AF9CDCF0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1AF9CDCFC()
{
  return swift_release();
}

id sub_1AF9CDD04(uint64_t a1)
{
  return sub_1AF9CE344(a1, &protocolRef_EKEventViewHostInterface, &qword_1EEE6CE98);
}

_QWORD *sub_1AF9CDD18()
{
  if (qword_1EEE6CE90 != -1)
    swift_once();
  return &qword_1EEE6CE98;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventViewHostInterface.getter()
{
  return sub_1AF9CE288(&qword_1EEE6CE90, (id *)&qword_1EEE6CE98);
}

void sub_1AF9CDD74()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v0 = objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EEF0A0D0), sel_classesForSelector_argumentIndex_ofReply_, sel_setupEventViewWithSerializedEventDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_eventOccurrenceDate_, 0, 0);
  sub_1AF9F7CC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC08);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1AFA14190;
  v2 = sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
  *(_QWORD *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC10);
  *(_QWORD *)(v1 + 32) = v2;
  v3 = sub_1AF9F7BA8();
  *(_QWORD *)(v1 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BD28);
  *(_QWORD *)(v1 + 64) = v3;
  v4 = sub_1AF9C6B78(0, &qword_1EEE6BC18);
  *(_QWORD *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC20);
  *(_QWORD *)(v1 + 96) = v4;
  v5 = sub_1AF9C6B78(0, &qword_1EEE6BC28);
  *(_QWORD *)(v1 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC30);
  *(_QWORD *)(v1 + 128) = v5;
  v6 = sub_1AF9C6B78(0, &qword_1EEE6BC38);
  *(_QWORD *)(v1 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC40);
  *(_QWORD *)(v1 + 160) = v6;
  v7 = objc_allocWithZone(MEMORY[0x1E0C99E60]);
  v8 = (void *)sub_1AF9F7C20();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_initWithArray_, v8);

  sub_1AF9F7CBC();
  __break(1u);
}

uint64_t sub_1AF9CE0A4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  _BYTE v17[40];
  _OWORD v18[2];
  uint64_t v19;
  uint64_t v20;

  v2 = result;
  v3 = 0;
  v5 = result + 56;
  v4 = *(_QWORD *)(result + 56);
  v20 = a2;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v4;
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v11 = v10 | (v3 << 6);
      goto LABEL_5;
    }
    v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v9)
      goto LABEL_23;
    v13 = *(_QWORD *)(v5 + 8 * v12);
    ++v3;
    if (!v13)
    {
      v3 = v12 + 1;
      if (v12 + 1 >= v9)
        goto LABEL_23;
      v13 = *(_QWORD *)(v5 + 8 * v3);
      if (!v13)
      {
        v3 = v12 + 2;
        if (v12 + 2 >= v9)
          goto LABEL_23;
        v13 = *(_QWORD *)(v5 + 8 * v3);
        if (!v13)
        {
          v3 = v12 + 3;
          if (v12 + 3 >= v9)
            goto LABEL_23;
          v13 = *(_QWORD *)(v5 + 8 * v3);
          if (!v13)
            break;
        }
      }
    }
LABEL_22:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v3 << 6);
LABEL_5:
    sub_1AF9CF164(*(_QWORD *)(v2 + 48) + 40 * v11, (uint64_t)v18);
    v15[0] = v18[0];
    v15[1] = v18[1];
    v16 = v19;
    sub_1AF9CF1A0((uint64_t)v17, (uint64_t)v15);
    result = sub_1AF9CF318((uint64_t)v17);
  }
  v14 = v12 + 4;
  if (v14 >= v9)
  {
LABEL_23:
    swift_release();
    return v20;
  }
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
  {
    v3 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v3 >= v9)
      goto LABEL_23;
    v13 = *(_QWORD *)(v5 + 8 * v3);
    ++v14;
    if (v13)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t *sub_1AF9CE22C()
{
  if (qword_1EEE6CEA0 != -1)
    swift_once();
  return &qword_1EEE6CEA8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventViewRemoteInterface.getter()
{
  return sub_1AF9CE288(&qword_1EEE6CEA0, (id *)&qword_1EEE6CEA8);
}

id sub_1AF9CE288(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

id sub_1AF9CE2C0(uint64_t a1)
{
  return sub_1AF9CE344(a1, &protocolRef_EKEventGenericDetailViewHostInterface, &qword_1EEE6CEB8);
}

_QWORD *sub_1AF9CE2D4()
{
  if (qword_1EEE6CEB0 != -1)
    swift_once();
  return &qword_1EEE6CEB8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventGenericDetailViewHostInterface.getter()
{
  return sub_1AF9CE288(&qword_1EEE6CEB0, (id *)&qword_1EEE6CEB8);
}

id sub_1AF9CE330(uint64_t a1)
{
  return sub_1AF9CE344(a1, &protocolRef_EKEventGenericDetailViewRemoteInterface, &qword_1EEE6CEC8);
}

id sub_1AF9CE344(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, *a2);
  *a3 = result;
  return result;
}

_QWORD *sub_1AF9CE38C()
{
  if (qword_1EEE6CEC0 != -1)
    swift_once();
  return &qword_1EEE6CEC8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventGenericDetailViewRemoteInterface.getter()
{
  return sub_1AF9CE288(&qword_1EEE6CEC0, (id *)&qword_1EEE6CEC8);
}

void sub_1AF9CE3E8()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v0 = objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EEEEC938), sel_classesForSelector_argumentIndex_ofReply_, sel_didCompleteWithAction_oldToNewObjectIDMap_waitUntilTimestamp_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_eventConstraints_, 1, 0);
  sub_1AF9F7CC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC08);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1AFA141A0;
  v2 = sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
  *(_QWORD *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC10);
  *(_QWORD *)(v1 + 32) = v2;
  v3 = sub_1AF9F7BA8();
  *(_QWORD *)(v1 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BD28);
  *(_QWORD *)(v1 + 64) = v3;
  v4 = sub_1AF9C6B78(0, &qword_1EEE6BC18);
  *(_QWORD *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC20);
  *(_QWORD *)(v1 + 96) = v4;
  v5 = sub_1AF9C6B78(0, &qword_1EEE6BC28);
  *(_QWORD *)(v1 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC30);
  *(_QWORD *)(v1 + 128) = v5;
  v6 = sub_1AF9C6B78(0, &qword_1EEE6BC38);
  *(_QWORD *)(v1 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC40);
  *(_QWORD *)(v1 + 160) = v6;
  v7 = sub_1AF9C6B78(0, &qword_1EEE6BD30);
  *(_QWORD *)(v1 + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BD38);
  *(_QWORD *)(v1 + 192) = v7;
  v8 = objc_allocWithZone(MEMORY[0x1E0C99E60]);
  v9 = (void *)sub_1AF9F7C20();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_initWithArray_, v9);

  sub_1AF9F7CBC();
  __break(1u);
}

uint64_t *sub_1AF9CE744()
{
  if (qword_1EEE6CED0 != -1)
    swift_once();
  return &qword_1EEE6CED8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventEditViewHostInterface.getter()
{
  return sub_1AF9CE288(&qword_1EEE6CED0, (id *)&qword_1EEE6CED8);
}

void sub_1AF9CE7A0()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v0 = objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EEF0A070), sel_classesForSelector_argumentIndex_ofReply_, sel_setupEventEditViewWithSerializedEventDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_eventOccurrenceDate_, 0, 0);
  sub_1AF9F7CC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC08);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1AFA141A0;
  v2 = sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
  *(_QWORD *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC10);
  *(_QWORD *)(v1 + 32) = v2;
  v3 = sub_1AF9F7BA8();
  *(_QWORD *)(v1 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BD28);
  *(_QWORD *)(v1 + 64) = v3;
  v4 = sub_1AF9C6B78(0, &qword_1EEE6BC18);
  *(_QWORD *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC20);
  *(_QWORD *)(v1 + 96) = v4;
  v5 = sub_1AF9C6B78(0, &qword_1EEE6BC28);
  *(_QWORD *)(v1 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC30);
  *(_QWORD *)(v1 + 128) = v5;
  v6 = sub_1AF9C6B78(0, &qword_1EEE6BC38);
  *(_QWORD *)(v1 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC40);
  *(_QWORD *)(v1 + 160) = v6;
  v7 = sub_1AF9C6B78(0, &qword_1EEE6BCB0);
  *(_QWORD *)(v1 + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BCB8);
  *(_QWORD *)(v1 + 192) = v7;
  v8 = objc_allocWithZone(MEMORY[0x1E0C99E60]);
  v9 = (void *)sub_1AF9F7C20();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_initWithArray_, v9);

  sub_1AF9F7CBC();
  __break(1u);
}

uint64_t *sub_1AF9CEB00()
{
  if (qword_1EEE6CEE0 != -1)
    swift_once();
  return &qword_1EEE6CEE8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKEventEditViewRemoteInterface.getter()
{
  return sub_1AF9CE288(&qword_1EEE6CEE0, (id *)&qword_1EEE6CEE8);
}

void sub_1AF9CEB5C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  v0 = objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EEEECA58), sel_classesForSelector_argumentIndex_ofReply_, sel_calendarSelectionChanged_allSelected_, 0, 0);
  sub_1AF9F7CC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC08);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1AFA141A0;
  v2 = sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
  *(_QWORD *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC10);
  *(_QWORD *)(v1 + 32) = v2;
  v3 = sub_1AF9C6B78(0, &qword_1EEE6BC18);
  *(_QWORD *)(v1 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC20);
  *(_QWORD *)(v1 + 64) = v3;
  v4 = sub_1AF9C6B78(0, &qword_1EEE6BC28);
  *(_QWORD *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC30);
  *(_QWORD *)(v1 + 96) = v4;
  v5 = sub_1AF9C6B78(0, &qword_1EEE6BC38);
  *(_QWORD *)(v1 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC40);
  *(_QWORD *)(v1 + 128) = v5;
  v6 = sub_1AF9C6B78(0, &qword_1EEE6BCB0);
  *(_QWORD *)(v1 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BCB8);
  *(_QWORD *)(v1 + 160) = v6;
  v7 = sub_1AF9C6B78(0, &qword_1EEE6C610);
  *(_QWORD *)(v1 + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BCC0);
  *(_QWORD *)(v1 + 192) = v7;
  v8 = objc_allocWithZone(MEMORY[0x1E0C99E60]);
  v9 = (void *)sub_1AF9F7C20();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_initWithArray_, v9);

  sub_1AF9F7CBC();
  __break(1u);
}

uint64_t *sub_1AF9CEE2C()
{
  if (qword_1EEE6CEF0 != -1)
    swift_once();
  return &qword_1EEE6CEF8;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKCalendarChooserViewHostInterface.getter()
{
  return sub_1AF9CE288(&qword_1EEE6CEF0, (id *)&qword_1EEE6CEF8);
}

void sub_1AF9CEE88()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;

  v0 = objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EEF0A010), sel_classesForSelector_argumentIndex_ofReply_, sel_updateCalendarChooserViewWithChangedViewConfigurationDictionary_, 0, 0);
  sub_1AF9F7CC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC08);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1AFA141B0;
  v2 = sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
  *(_QWORD *)(v1 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC10);
  *(_QWORD *)(v1 + 32) = v2;
  v3 = sub_1AF9C6B78(0, &qword_1EEE6BC18);
  *(_QWORD *)(v1 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC20);
  *(_QWORD *)(v1 + 64) = v3;
  v4 = sub_1AF9C6B78(0, &qword_1EEE6BC28);
  *(_QWORD *)(v1 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC30);
  *(_QWORD *)(v1 + 96) = v4;
  v5 = sub_1AF9C6B78(0, &qword_1EEE6BC38);
  *(_QWORD *)(v1 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC40);
  *(_QWORD *)(v1 + 128) = v5;
  v6 = objc_allocWithZone(MEMORY[0x1E0C99E60]);
  v7 = (void *)sub_1AF9F7C20();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_initWithArray_, v7);

  sub_1AF9F7CBC();
  __break(1u);
}

uint64_t *sub_1AF9CF0F8()
{
  if (qword_1EEE6CF00 != -1)
    swift_once();
  return &qword_1EEE6CF08;
}

id static EKUIRemoteUIXPCInterface.interfaceForEKCalendarChooserViewRemoteInterface.getter()
{
  return sub_1AF9CE288(&qword_1EEE6CF00, (id *)&qword_1EEE6CF08);
}

ValueMetadata *type metadata accessor for EKUIRemoteUIXPCInterface()
{
  return &type metadata for EKUIRemoteUIXPCInterface;
}

uint64_t sub_1AF9CF164(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1AF9CF1A0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  char isUniquelyReferenced_nonNull_native;
  __int128 v13;
  uint64_t v15;
  _BYTE v16[40];

  v3 = v2;
  v6 = *v2;
  swift_bridgeObjectRetain();
  v7 = sub_1AF9F7E54();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v10 = ~v8;
    while (1)
    {
      sub_1AF9CF164(*(_QWORD *)(v6 + 48) + 40 * v9, (uint64_t)v16);
      v11 = MEMORY[0x1B5DFDB20](v16, a2);
      sub_1AF9CF318((uint64_t)v16);
      if ((v11 & 1) != 0)
        break;
      v9 = (v9 + 1) & v10;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    sub_1AF9CF318(a2);
    sub_1AF9CF164(*(_QWORD *)(*v3 + 48) + 40 * v9, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1AF9CF164(a2, (uint64_t)v16);
    v15 = *v3;
    *v3 = 0x8000000000000000;
    sub_1AF9CF614((uint64_t)v16, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v15;
    swift_bridgeObjectRelease();
    v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_1AF9CF318(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1AF9CF34C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC48);
  v3 = sub_1AF9F7E78();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v15 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v16 = v15 | (v12 << 6);
      }
      else
      {
        v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v9)
          goto LABEL_33;
        v18 = v6[v17];
        ++v12;
        if (!v18)
        {
          v12 = v17 + 1;
          if (v17 + 1 >= v9)
            goto LABEL_33;
          v18 = v6[v12];
          if (!v18)
          {
            v12 = v17 + 2;
            if (v17 + 2 >= v9)
              goto LABEL_33;
            v18 = v6[v12];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v28 = 1 << *(_BYTE *)(v2 + 32);
                if (v28 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v28;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v18 = v6[v19];
              if (!v18)
              {
                while (1)
                {
                  v12 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v18 = v6[v12];
                  ++v19;
                  if (v18)
                    goto LABEL_23;
                }
              }
              v12 = v19;
            }
          }
        }
LABEL_23:
        v8 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      v20 = *(_QWORD *)(v2 + 48) + 40 * v16;
      v29 = *(_OWORD *)v20;
      v30 = *(_OWORD *)(v20 + 16);
      v31 = *(_QWORD *)(v20 + 32);
      result = sub_1AF9F7E54();
      v21 = -1 << *(_BYTE *)(v4 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = *(_QWORD *)(v4 + 48) + 40 * v13;
      *(_OWORD *)v14 = v29;
      *(_OWORD *)(v14 + 16) = v30;
      *(_QWORD *)(v14 + 32) = v31;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1AF9CF614(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  _BYTE v19[40];

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_1AF9CF34C();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_1AF9CF77C();
      goto LABEL_12;
    }
    sub_1AF9CF948();
  }
  v9 = *v3;
  result = sub_1AF9F7E54();
  v10 = -1 << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = ~v10;
    do
    {
      sub_1AF9CF164(*(_QWORD *)(v9 + 48) + 40 * a2, (uint64_t)v19);
      v12 = MEMORY[0x1B5DFDB20](v19, v6);
      result = sub_1AF9CF318((uint64_t)v19);
      if ((v12 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v11;
    }
    while (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v13 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v14 = *(_QWORD *)(v13 + 48) + 40 * a2;
  v15 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v6;
  *(_OWORD *)(v14 + 16) = v15;
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v6 + 32);
  v16 = *(_QWORD *)(v13 + 16);
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (!v17)
  {
    *(_QWORD *)(v13 + 16) = v18;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_1AF9F7F5C();
  __break(1u);
  return result;
}

void *sub_1AF9CF77C()
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
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  _OWORD v23[2];
  uint64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC48);
  v2 = *v0;
  v3 = sub_1AF9F7E6C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    result = (void *)sub_1AF9CF164(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    v17 = *(_QWORD *)(v4 + 48) + v16;
    v18 = v23[0];
    v19 = v23[1];
    *(_QWORD *)(v17 + 32) = v24;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1AF9CF948()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _OWORD v29[2];
  uint64_t v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BC48);
  v3 = sub_1AF9F7E78();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v17 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_24;
    }
    v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v9)
      goto LABEL_33;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      v12 = v19 + 1;
      if (v19 + 1 >= v9)
        goto LABEL_33;
      v20 = *(_QWORD *)(v6 + 8 * v12);
      if (!v20)
      {
        v12 = v19 + 2;
        if (v19 + 2 >= v9)
          goto LABEL_33;
        v20 = *(_QWORD *)(v6 + 8 * v12);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v8 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_24:
    sub_1AF9CF164(*(_QWORD *)(v2 + 48) + 40 * v18, (uint64_t)v29);
    result = sub_1AF9F7E54();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v10 + 8 * (v23 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v10 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v28 = *(_QWORD *)(v10 + 8 * v24);
      }
      while (v28 == -1);
      v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    v14 = *(_QWORD *)(v4 + 48) + 40 * v13;
    v15 = v29[0];
    v16 = v29[1];
    *(_QWORD *)(v14 + 32) = v30;
    *(_OWORD *)v14 = v15;
    *(_OWORD *)(v14 + 16) = v16;
    ++*(_QWORD *)(v4 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v12 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v20 = *(_QWORD *)(v6 + 8 * v12);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1AF9CFBD8()
{
  uint64_t result;

  sub_1AF9CFC88();
  result = sub_1AF9F7D7C();
  qword_1EEE6DCB8 = result;
  return result;
}

uint64_t *sub_1AF9CFC38()
{
  if (qword_1EEE6CF10 != -1)
    swift_once();
  return &qword_1EEE6DCB8;
}

ValueMetadata *type metadata accessor for EKUILog()
{
  return &type metadata for EKUILog;
}

unint64_t sub_1AF9CFC88()
{
  unint64_t result;

  result = qword_1EEE6BDA0;
  if (!qword_1EEE6BDA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEE6BDA0);
  }
  return result;
}

id EKEventGenericDetailViewControllerOOPImpl.__allocating_init(hostViewID:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  objc_class *v3;
  char *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v3 = v2;
  v6 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController] = 0;
  v7 = &v6[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView];
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  *((_QWORD *)v7 + 10) = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor] = 0;
  type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  v8 = v6;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostViewModel] = sub_1AF9E0C70(a1, a2);

  v10.receiver = v8;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_initWithNibName_bundle_, 0, 0);
}

id EKEventGenericDetailViewControllerOOPImpl.init(hostViewID:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v5;
  char *v6;
  objc_super v8;

  *(_QWORD *)&v2[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController] = 0;
  v5 = &v2[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *((_OWORD *)v5 + 4) = 0u;
  *((_QWORD *)v5 + 10) = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor] = 0;
  type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  v6 = v2;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostViewModel] = sub_1AF9E0C70(a1, a2);

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for EKEventGenericDetailViewControllerOOPImpl();
  return objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for EKEventGenericDetailViewControllerOOPImpl()
{
  return objc_opt_self();
}

void sub_1AF9CFFE0()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  __int128 v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[11];
  objc_super v29;

  v1 = v0;
  v29.receiver = v0;
  v29.super_class = (Class)type metadata accessor for EKEventGenericDetailViewControllerOOPImpl();
  objc_msgSendSuper2(&v29, sel_viewDidLoad);
  v2 = objc_retain(*(id *)((char *)v0
                         + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostViewModel));
  v3 = sub_1AF9C09EC((uint64_t)v28);
  v4 = (void *)(*(uint64_t (**)(double))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))(v3);
  sub_1AF9C1BF0(v4);
  v5 = (void *)v28[1];
  v6 = v28[2];
  v7 = v28[3];
  v8 = v28[4];
  v9 = v28[5];
  v10 = v28[6];
  v11 = v28[7];
  v12 = v28[8];
  v13 = v28[9];
  v14 = (void *)v28[10];
  v15 = (_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  v27 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  v26 = *(void **)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
  v25 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 16);
  v24 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 24);
  v23 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 32);
  v22 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 40);
  v21 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 48);
  v20 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 56);
  v17 = *(_OWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 64);
  v16 = *(void **)((char *)v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 80);
  *v15 = v28[0];
  v15[1] = v5;
  v15[2] = v6;
  v15[3] = v7;
  v15[4] = v8;
  v15[5] = v9;
  v15[6] = v10;
  v15[7] = v11;
  v15[8] = v12;
  v15[9] = v13;
  v15[10] = v14;
  v19 = v5;
  sub_1AF9C09CC(v6);
  sub_1AF9C09CC(v8);
  sub_1AF9C09CC(v10);
  sub_1AF9C09CC(v12);
  v18 = v14;
  sub_1AF9D01C8(v27, v26, v25, v24, v23, v22, v21, v20, v17, *((uint64_t *)&v17 + 1), v16);
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xC0))();

  sub_1AF9C09DC(v6);
  sub_1AF9C09DC(v8);
  sub_1AF9C09DC(v10);
  sub_1AF9C09DC(v12);

}

void sub_1AF9D01C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2)
  {

    sub_1AF9C09DC(a3);
    sub_1AF9C09DC(a5);
    sub_1AF9C09DC(a7);
    sub_1AF9C09DC(a9);

  }
}

void sub_1AF9D0298()
{
  char *v0;
  char *v1;
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;

  v1 = v0;
  v2 = (uint64_t *)&v0[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView];
  v3 = *(void **)&v0[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8];
  if (!v3)
    goto LABEL_27;
  v5 = v2[9];
  v4 = (void *)v2[10];
  v57 = v2[7];
  v6 = v2[5];
  v56 = v2[6];
  v8 = v2[3];
  v7 = v2[4];
  v9 = v2[2];
  v10 = *v2;
  v60 = v2[8];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v58 = v3;
  swift_retain();
  sub_1AF9D0A98(v10, v3, v9, v8, v7, v6, v56, v57, v60, v5, v4);
  v55 = v4;
  sub_1AF9C09DC(v9);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1AF9C09DC(v7);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1AF9C09DC(v56);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1AF9C09DC(v60);
  v11 = v58;
  sub_1AF9C09CC((uint64_t)sub_1AF9D09EC);
  sub_1AF9C09CC((uint64_t)sub_1AF9D0B34);
  sub_1AF9C09CC((uint64_t)sub_1AF9D0BC8);
  sub_1AF9C09CC((uint64_t)sub_1AF9D0C4C);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v59 = v11;
  v12 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BDC8));
  v13 = (void *)sub_1AF9F7A1C();
  objc_msgSend(v1, sel_addChildViewController_, v13);
  v14 = objc_msgSend(v13, sel_view);
  if (!v14)
  {
    __break(1u);
    goto LABEL_16;
  }
  v15 = v14;
  objc_msgSend(v14, sel_setInsetsLayoutMarginsFromSafeArea_, 0);

  v16 = objc_msgSend(v1, sel_view);
  if (!v16)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v17 = v16;
  v18 = objc_msgSend(v13, sel_view);
  if (!v18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v19 = v18;
  objc_msgSend(v17, sel_addSubview_, v18);

  objc_msgSend(v13, sel_didMoveToParentViewController_, v1);
  v20 = *(void **)&v1[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostingController] = v13;
  v21 = v13;

  v22 = objc_msgSend(v21, sel_view);
  if (!v22)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v23 = v22;
  objc_msgSend(v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BB30);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_1AFA14080;
  v25 = objc_msgSend(v21, sel_view);
  if (!v25)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v26 = v25;
  v27 = objc_msgSend(v25, sel_leadingAnchor);

  v28 = objc_msgSend(v1, sel_view);
  if (!v28)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v29 = v28;
  v30 = objc_msgSend(v28, sel_leadingAnchor);

  v31 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v30);
  *(_QWORD *)(v24 + 32) = v31;
  v32 = objc_msgSend(v21, sel_view);
  if (!v32)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v33 = v32;
  v34 = objc_msgSend(v32, sel_topAnchor);

  v35 = objc_msgSend(v1, sel_view);
  if (!v35)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v36 = v35;
  v37 = objc_msgSend(v35, sel_topAnchor);

  v38 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v37);
  *(_QWORD *)(v24 + 40) = v38;
  v39 = objc_msgSend(v21, sel_view);
  if (!v39)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v40 = v39;
  v41 = objc_msgSend(v39, sel_trailingAnchor);

  v42 = objc_msgSend(v1, sel_view);
  if (!v42)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v43 = v42;
  v44 = objc_msgSend(v42, sel_trailingAnchor);

  v45 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v44);
  *(_QWORD *)(v24 + 48) = v45;
  v46 = objc_msgSend(v21, sel_view);
  if (v46)
  {
    v47 = v46;
    v48 = objc_msgSend(v46, sel_bottomAnchor);

    v49 = objc_msgSend(v1, sel_view);
    if (v49)
    {
      v50 = v49;
      v51 = (void *)objc_opt_self();
      v52 = objc_msgSend(v50, sel_bottomAnchor);

      v53 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v52);
      *(_QWORD *)(v24 + 56) = v53;
      sub_1AF9F7C44();
      sub_1AF9C6B78(0, &qword_1EEE6C470);
      v54 = (void *)sub_1AF9F7C20();
      swift_bridgeObjectRelease();
      objc_msgSend(v51, sel_activateConstraints_, v54);

      sub_1AF9C09DC((uint64_t)sub_1AF9D09EC);
      sub_1AF9C09DC((uint64_t)sub_1AF9D0B34);
      sub_1AF9C09DC((uint64_t)sub_1AF9D0BC8);
      sub_1AF9C09DC((uint64_t)sub_1AF9D0C4C);

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  sub_1AF9F7EF0();
  __break(1u);
}

uint64_t sub_1AF9D09C8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AF9D09EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  void *v12;

  swift_beginAccess();
  v11 = (_QWORD *)MEMORY[0x1B5DFEE88](v5 + 16);
  if (v11)
  {
    v12 = v11;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v11) + 0xF8))(a1, a2, a3, a4, a5);

  }
}

id sub_1AF9D0A98(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  id v14;
  id result;

  if (a2)
  {
    v14 = a2;
    sub_1AF9C09CC(a3);
    sub_1AF9C09CC(a5);
    sub_1AF9C09CC(a7);
    sub_1AF9C09CC(a9);
    return a11;
  }
  return result;
}

void sub_1AF9D0B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  void *v8;

  swift_beginAccess();
  v7 = (_QWORD *)MEMORY[0x1B5DFEE88](v3 + 16);
  if (v7)
  {
    v8 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v7) + 0x100))(a1, a2, a3);

  }
}

void sub_1AF9D0BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  void *v6;

  swift_beginAccess();
  v5 = (_QWORD *)MEMORY[0x1B5DFEE88](v2 + 16);
  if (v5)
  {
    v6 = v5;
    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v5) + 0x108))(a1, a2);

  }
}

void sub_1AF9D0C4C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;

  swift_beginAccess();
  v3 = (_QWORD *)MEMORY[0x1B5DFEE88](v1 + 16);
  if (v3)
  {
    v4 = v3;
    (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x110))(a1);

  }
}

void *sub_1AF9D0D04()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9D0D98(void *a1)
{
  sub_1AF9D27FC(a1);

}

uint64_t sub_1AF9D0DBC@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xC8))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9D0DFC(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xD0);
  v4 = *a1;
  return v3(v2);
}

void (*sub_1AF9D0E48(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_1AF9D0EA0;
}

void sub_1AF9D0EA0(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = (uint64_t *)(v4 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
    v6 = *(void **)(v4 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
    if (v6)
    {
      v9 = *(void **)(v4 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
      v10 = v5[2];
      v11 = v5[4];
      v12 = v5[6];
      v13 = v5[8];
      v14 = (void *)v5[10];
      v7 = *(void **)(v4 + v3[4]);
      sub_1AF9D0A98(*v5, v6, v10, v5[3], v11, v5[5], v12, v5[7], v13, v5[9], v14);
      v8 = v7;
      sub_1AF9C1BF0(v7);

      sub_1AF9C09DC(v10);
      sub_1AF9C09DC(v11);
      sub_1AF9C09DC(v12);
      sub_1AF9C09DC(v13);

    }
  }
  free(v3);
}

void sub_1AF9D0FB0(uint64_t a1, uint64_t a2)
{
  sub_1AF9D0FD4(a1, a2, (void (*)(uint64_t, uint64_t))sub_1AF9C1C38);
}

void sub_1AF9D0FC8(uint64_t a1, uint64_t a2)
{
  sub_1AF9D0FD4(a1, a2, (void (*)(uint64_t, uint64_t))sub_1AF9C1DEC);
}

void sub_1AF9D0FD4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v17;
  uint64_t v20;

  v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  v5 = *(void **)(v3 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
  if (v5)
  {
    v7 = v4[9];
    v6 = (void *)v4[10];
    v8 = v4[8];
    v10 = v4[5];
    v9 = v4[6];
    v11 = v4[3];
    v12 = v4[4];
    v13 = v4[2];
    v20 = *v4;
    v17 = v4[7];
    v14 = v5;
    sub_1AF9C09CC(v13);
    sub_1AF9C09CC(v12);
    sub_1AF9C09CC(v9);
    sub_1AF9C09CC(v8);
    v15 = v6;
    a3(a1, a2);
    sub_1AF9D01C8(v20, v5, v13, v11, v12, v10, v9, v17, v8, v7, v6);
  }
}

uint64_t sub_1AF9D10E4(char *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;

  v6 = sub_1AF9F7BF0();
  v25 = v7;
  v8 = (uint64_t *)&a1[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView];
  v9 = *(void **)&a1[OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8];
  if (v9)
  {
    v24 = a4;
    v11 = v8[9];
    v10 = (void *)v8[10];
    v12 = v8[7];
    v13 = v8[8];
    v14 = v8[5];
    v15 = v8[6];
    v16 = v8[4];
    v19 = v8[2];
    v20 = v8[3];
    v17 = *v8;
    v21 = *v8;
    v22 = v6;
    v23 = a1;
    sub_1AF9D0A98(v17, v9, v19, v20, v16, v14, v15, v12, v13, v11, v10);
    v24(v22, v25);
    sub_1AF9D01C8(v21, v9, v19, v20, v16, v14, v15, v12, v13, v11, v10);

  }
  return swift_bridgeObjectRelease();
}

void sub_1AF9D120C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v2 = (uint64_t *)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
  if (v3)
  {
    v5 = v2[9];
    v4 = (void *)v2[10];
    v6 = v2[8];
    v8 = v2[5];
    v7 = v2[6];
    v10 = v2[3];
    v9 = v2[4];
    v11 = v2[2];
    v16 = *v2;
    v14 = v2[7];
    v12 = v3;
    sub_1AF9C09CC(v11);
    sub_1AF9C09CC(v9);
    sub_1AF9C09CC(v7);
    sub_1AF9C09CC(v6);
    v13 = v4;
    sub_1AF9C1FA0(a1);
    sub_1AF9D01C8(v16, v3, v11, v10, v9, v8, v7, v14, v6, v5, v4);
  }
}

void sub_1AF9D1424(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  os_log_type_t v8;
  os_log_t *v9;
  os_log_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  void *v41;
  _QWORD *v42;
  char v44;
  id v45;
  void *v46;
  NSBundle *v47;
  NSBundle *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  id v53;
  void *v54;
  os_log_type_t v55;
  os_log_t v56;
  os_log_type_t v57;
  NSObject *v58;
  uint8_t *v59;
  id v60;
  void *v61;
  os_log_t *v62;
  NSObject *loga;
  os_log_t log;
  void *v65;
  void *v67;
  uint64_t v68;

  v8 = sub_1AF9F7CF8();
  v9 = (os_log_t *)sub_1AF9CFC38();
  v10 = *v9;
  if (os_log_type_enabled(*v9, v8))
  {
    swift_bridgeObjectRetain_n();
    loga = v10;
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v68 = v12;
    *(_DWORD *)v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_1AF9C4DD4(a1, a2, &v68);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AF84D000, loga, v8, "EKEventGenericDetailViewControllerOOPImpl: Received remoteViewControllerRequestPresentView on the host app side. viewName: %s.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v12, -1, -1);
    MEMORY[0x1B5DFEE1C](v11, -1, -1);

  }
  v13 = objc_msgSend(v5, sel_parentViewController);
  if (!v13)
    goto LABEL_30;
  v14 = v13;
  objc_opt_self();
  v15 = swift_dynamicCastObjCClass();
  if (!v15)
  {

LABEL_30:
    sub_1AF9F7CEC();
    v20 = *v9;
    sub_1AF9F7974();
LABEL_53:

    return;
  }
  v16 = (void *)v15;
  v62 = v9;
  if ((a1 != 0xD000000000000018 || a2 != 0x80000001AFA20540) && (sub_1AF9F7F50() & 1) == 0)
  {
    if (a1 == 0xD000000000000016 && a2 == 0x80000001AFA20560 || (sub_1AF9F7F50() & 1) != 0)
    {
      v47 = EventKitUIBundle();
      if (!v47)
        goto LABEL_57;
      v48 = v47;
      sub_1AF9F7890();

      v49 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
      swift_bridgeObjectRetain();
      v50 = (void *)sub_1AF9F7BCC();
      swift_bridgeObjectRelease();
      v26 = (void *)sub_1AF9F7BCC();
      swift_bridgeObjectRelease();
      v20 = objc_msgSend(v49, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, v50, v26, 0, 0, 0x80000001AFA20580);

    }
    else
    {
      v60 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
      swift_bridgeObjectRetain();
      v26 = (void *)sub_1AF9F7BCC();
      swift_bridgeObjectRelease();
      v20 = objc_msgSend(v60, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, 0, v26, 0, 0);
    }
    goto LABEL_41;
  }
  v67 = v14;
  v17 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
  swift_bridgeObjectRetain();
  v18 = (void *)sub_1AF9F7BCC();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, 0, v18, 0, 0);

  v20 = v19;
  v21 = objc_msgSend(v5, sel_traitCollection);
  v22 = objc_msgSend(v21, sel_userInterfaceIdiom);

  if (v22 != (id)1)
  {
    v23 = objc_msgSend(v5, sel_traitCollection);
    v24 = objc_msgSend(v23, sel_userInterfaceIdiom);

    if (v24 != (id)5)
    {
      v51 = -[NSObject sheetPresentationController](v20, sel_sheetPresentationController);

      if (!v51)
      {
        if (a5 != 2)
        {
LABEL_42:
          if (a5 != 1)
          {
            if (!a5)
            {
              v53 = objc_msgSend(v16, sel_navigationController);
              if (v53)
              {
                v54 = v53;
                objc_msgSend(v53, sel_pushViewController_animated_, v20, 1);

              }
              goto LABEL_52;
            }
            v55 = sub_1AF9F7CEC();
            v56 = *v62;
            v57 = v55;
            if (os_log_type_enabled(*v62, v55))
            {
              v58 = v56;
              v59 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)v59 = 134217984;
              v68 = a5;
              sub_1AF9F7D94();
              _os_log_impl(&dword_1AF84D000, v58, v57, "EKEventGenericDetailViewControllerOOPImpl: presentationStyle not recognized: %ld", v59, 0xCu);
              MEMORY[0x1B5DFEE1C](v59, -1, -1);

              goto LABEL_53;
            }
LABEL_52:

            goto LABEL_53;
          }
LABEL_51:
          objc_msgSend(v16, sel_presentViewController_animated_completion_, v20, 1, 0);
          goto LABEL_52;
        }
LABEL_50:
        -[NSObject setModalPresentationStyle:](v20, sel_setModalPresentationStyle_, 2);
        goto LABEL_51;
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BB30);
      v52 = swift_allocObject();
      *(_OWORD *)(v52 + 16) = xmmword_1AFA14090;
      *(_QWORD *)(v52 + 32) = objc_msgSend((id)objc_opt_self(), sel_largeDetent);
      v68 = v52;
      sub_1AF9F7C44();
      sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6C480);
      v26 = (void *)sub_1AF9F7C20();
      swift_bridgeObjectRelease();
      objc_msgSend(v51, sel_setDetents_, v26);

LABEL_41:
      if (a5 != 2)
        goto LABEL_42;
      goto LABEL_50;
    }
  }
  -[NSObject setModalPresentationStyle:](v20, sel_setModalPresentationStyle_, 7);
  v25 = objc_msgSend(v5, sel_parentViewController);
  if (!v25)
  {
LABEL_40:
    v26 = v20;
    goto LABEL_41;
  }
  v26 = v25;
  objc_opt_self();
  v27 = (void *)swift_dynamicCastObjCClass();
  if (!v27)
  {

    goto LABEL_40;
  }
  v28 = v27;
  v65 = v16;
  v29 = objc_msgSend(v27, sel_rightBarButtonActions);
  v30 = sub_1AF9F7C2C();

  v31 = *(_QWORD *)(v30 + 16);
  swift_bridgeObjectRelease();
  if (!v31)
  {

    v14 = v67;
    goto LABEL_41;
  }
  v61 = v26;
  log = (os_log_t)a5;
  v32 = 0;
  v33 = 0;
  while (1)
  {
    v34 = objc_msgSend(v28, sel_rightBarButtonActions);
    v35 = sub_1AF9F7C2C();

    if (v33 >= *(_QWORD *)(v35 + 16))
      break;
    v37 = *(_QWORD *)(v35 + v32 + 32);
    v36 = *(_QWORD *)(v35 + v32 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v38 = objc_msgSend(v28, sel_rightBarButtonItems);
    sub_1AF9C6B78(0, &qword_1EEE6BDD0);
    v39 = sub_1AF9F7C2C();

    if ((v39 & 0xC000000000000001) != 0)
    {
      v40 = (id)MEMORY[0x1B5DFDB5C](v33, v39);
    }
    else
    {
      if (v33 >= *(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_56;
      v40 = *(id *)(v39 + 8 * v33 + 32);
    }
    v41 = v40;
    swift_bridgeObjectRelease();
    v42 = sub_1AF9F5530();
    if (v37 == *v42 && v36 == v42[1])
    {
      swift_bridgeObjectRelease();
LABEL_26:
      v45 = -[NSObject popoverPresentationController](v20, sel_popoverPresentationController);
      if (v45)
      {
        v46 = v45;
        objc_msgSend(v45, sel_setSourceItem_, v41);

      }
      goto LABEL_14;
    }
    v44 = sub_1AF9F7F50();
    swift_bridgeObjectRelease();
    if ((v44 & 1) != 0)
      goto LABEL_26;
LABEL_14:
    ++v33;

    v32 += 16;
    if (v31 == v33)
    {

      a5 = (uint64_t)log;
      v16 = v65;
      v14 = v67;
      v26 = v61;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
}

void sub_1AF9D1D44(uint64_t a1, unint64_t a2, uint64_t a3)
{
  void *v3;
  os_log_type_t v7;
  os_log_t *v8;
  os_log_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint8_t *v13;
  NSObject *v14;
  os_log_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  NSObject *v23;
  uint8_t *v24;
  NSObject *log;
  uint64_t v26;
  uint64_t v27;

  v7 = sub_1AF9F7CF8();
  v8 = (os_log_t *)sub_1AF9CFC38();
  v9 = *v8;
  if (os_log_type_enabled(*v8, v7))
  {
    swift_bridgeObjectRetain_n();
    log = v9;
    v26 = a3;
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v27 = v11;
    *(_DWORD *)v10 = 136315138;
    if (a2)
    {
      v12 = a2;
    }
    else
    {
      a1 = 7104878;
      v12 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_1AF9C4DD4(a1, v12, &v27);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AF84D000, log, v7, "EKEventGenericDetailViewControllerOOPImpl: Received remoteViewControllerRequestDismissView on the host app side. viewName: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v11, -1, -1);
    v13 = v10;
    a3 = v26;
    MEMORY[0x1B5DFEE1C](v13, -1, -1);

  }
  v14 = objc_msgSend(v3, sel_parentViewController, log);
  if (!v14)
    goto LABEL_11;
  v15 = v14;
  objc_opt_self();
  v16 = (void *)swift_dynamicCastObjCClass();
  if (!v16)
  {

LABEL_11:
    sub_1AF9F7CEC();
    v15 = *v8;
    sub_1AF9F7974();
    goto LABEL_12;
  }
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      v20 = sub_1AF9F7CEC();
      v21 = *v8;
      v22 = v20;
      if (os_log_type_enabled(v21, v20))
      {
        v23 = v21;
        v24 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v24 = 134217984;
        v27 = a3;
        sub_1AF9F7D94();
        _os_log_impl(&dword_1AF84D000, v23, v22, "EKEventGenericDetailViewControllerOOPImpl: presentationStyle not recognized: %ld", v24, 0xCu);
        MEMORY[0x1B5DFEE1C](v24, -1, -1);

        v15 = v23;
      }
    }
    else
    {
      v17 = objc_msgSend(v16, sel_navigationController);
      if (v17)
      {
        v18 = v17;
        v19 = objc_msgSend(v17, sel_popViewControllerAnimated_, 1);

      }
    }
  }
  else
  {
    objc_msgSend(v16, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
LABEL_12:

}

void sub_1AF9D206C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  os_log_type_t v11;
  id v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *log;
  NSObject *loga;
  os_log_t logb;
  uint64_t v34;

  sub_1AF9F7CF8();
  v5 = sub_1AF9CFC38();
  v6 = (id)*v5;
  sub_1AF9F7974();

  v7 = objc_msgSend(v2, sel_parentViewController);
  if (!v7)
    goto LABEL_13;
  v8 = v7;
  objc_opt_self();
  v9 = swift_dynamicCastObjCClass();
  if (!v9)
  {

LABEL_13:
    sub_1AF9F7CEC();
    logb = (os_log_t)(id)*v5;
    sub_1AF9F7974();

    return;
  }
  v10 = (void *)v9;
  if (a1)
  {
    v11 = sub_1AF9F7CF8();
    v12 = (id)*v5;
    v13 = v11;
    if (os_log_type_enabled((os_log_t)*v5, v11))
    {
      swift_bridgeObjectRetain_n();
      log = v12;
      v14 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v34 = v30;
      *(_DWORD *)v14 = 136315138;
      v15 = swift_bridgeObjectRetain();
      v16 = MEMORY[0x1B5DFD8F8](v15, MEMORY[0x1E0DEA968]);
      v18 = v17;
      swift_bridgeObjectRelease();
      sub_1AF9C4DD4(v16, v18, &v34);
      sub_1AF9F7D94();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AF84D000, log, v13, "Setting leftBarButtonIDs: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5DFEE1C](v30, -1, -1);
      MEMORY[0x1B5DFEE1C](v14, -1, -1);

    }
    v19 = (void *)sub_1AF9F7C20();
    objc_msgSend(v10, sel_setLeftBarButtonActions_, v19);

  }
  if (a2)
  {
    v20 = sub_1AF9F7CF8();
    v21 = *v5;
    v22 = v20;
    if (os_log_type_enabled(v21, v20))
    {
      swift_bridgeObjectRetain_n();
      loga = v21;
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v34 = v24;
      *(_DWORD *)v23 = 136315138;
      v25 = swift_bridgeObjectRetain();
      v26 = MEMORY[0x1B5DFD8F8](v25, MEMORY[0x1E0DEA968]);
      v28 = v27;
      swift_bridgeObjectRelease();
      sub_1AF9C4DD4(v26, v28, &v34);
      sub_1AF9F7D94();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AF84D000, loga, v22, "Setting rightBarButtonIDs: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5DFEE1C](v24, -1, -1);
      MEMORY[0x1B5DFEE1C](v23, -1, -1);

    }
    v29 = (void *)sub_1AF9F7C20();
    objc_msgSend(v10, sel_setRightBarButtonActions_, v29);

  }
}

void sub_1AF9D247C(uint64_t a1)
{
  void *v1;
  uint64_t *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;

  sub_1AF9F7CF8();
  v3 = sub_1AF9CFC38();
  v4 = (id)*v3;
  sub_1AF9F7974();

  v5 = objc_msgSend(v1, sel_parentViewController);
  if (!v5)
    goto LABEL_8;
  v20 = v5;
  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (!v6)
  {

LABEL_8:
    sub_1AF9F7CEC();
    v20 = (id)*v3;
    sub_1AF9F7974();
    goto LABEL_9;
  }
  if (!a1)
  {
LABEL_9:

    return;
  }
  v7 = (void *)v6;
  v8 = sub_1AF9F7CF8();
  v9 = *v3;
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    swift_bridgeObjectRetain_n();
    v11 = v9;
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v21 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = sub_1AF9C6B78(0, &qword_1EEE6BA60);
    v15 = swift_bridgeObjectRetain();
    v16 = MEMORY[0x1B5DFD8F8](v15, v14);
    v18 = v17;
    swift_bridgeObjectRelease();
    sub_1AF9C4DD4(v16, v18, &v21);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AF84D000, v11, v10, "Setting leftBarButtonIDs: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v13, -1, -1);
    MEMORY[0x1B5DFEE1C](v12, -1, -1);

  }
  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v19 = (void *)sub_1AF9F7C20();
  objc_msgSend(v7, sel_setBottomStatusButtonActions_, v19);

}

id EKEventGenericDetailViewControllerOOPImpl.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventGenericDetailViewControllerOOPImpl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1AF9D27FC(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_oopContentBackgroundColor);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView);
  v7 = *(void **)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
  if (v7)
  {
    v10 = *(void **)(v1 + OBJC_IVAR____TtC10EventKitUI41EKEventGenericDetailViewControllerOOPImpl_hostView + 8);
    v11 = v6[2];
    v12 = v6[4];
    v13 = v6[6];
    v14 = v6[8];
    v15 = (void *)v6[10];
    v8 = *v3;
    sub_1AF9D0A98(*v6, v7, v11, v6[3], v12, v6[5], v13, v6[7], v14, v6[9], v15);
    v9 = v8;
    sub_1AF9C1BF0(v8);

    sub_1AF9C09DC(v11);
    sub_1AF9C09DC(v12);
    sub_1AF9C09DC(v13);
    sub_1AF9C09DC(v14);

  }
}

uint64_t method lookup function for EKEventGenericDetailViewControllerOOPImpl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.__allocating_init(hostViewID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.oopContentBackgroundColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.oopContentBackgroundColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.oopContentBackgroundColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.leftBarButtonTapped(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.rightBarButtonTapped(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of EKEventGenericDetailViewControllerOOPImpl.bottomStatusButtonTapped(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF0))();
}

uint64_t static EKRemoteUIUtilities.combineHostWithRemoteObjectIDChangeMaps(hostTempToRemoteTempObjectIDMap:remoteEventStoreTempToPermanentObjectIDMap:)(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  unint64_t v22;
  char v23;
  id v24;
  id v25;
  uint64_t v26;
  os_log_type_t v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  _QWORD *v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  char v41;
  char v42;
  unint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  char isUniquelyReferenced_nonNull_native;
  char v57;
  unint64_t v58;
  uint64_t v59;
  _BOOL8 v60;
  uint64_t v61;
  char v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char **v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  id v80;
  id v81;
  int64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  id v90;
  id v91;
  char v92;
  char v93;
  unint64_t v94;
  uint64_t v95;
  _BOOL8 v96;
  uint64_t v97;
  char v98;
  unint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t result;
  int64_t v106;
  unint64_t v107;
  unint64_t v109;
  unint64_t v110;
  int64_t v111;
  uint64_t v112;
  unint64_t v113;
  void *v114;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v107 = 0;
    v2 = 0;
    v3 = 0;
    v4 = sub_1AF9F7EB4() | 0x8000000000000000;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v2 = ~v5;
    v107 = a1 + 64;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v3 = v7 & *(_QWORD *)(a1 + 64);
    v4 = a1;
  }
  swift_bridgeObjectRetain();
  v8 = 0;
  v106 = (unint64_t)(v2 + 64) >> 6;
  v109 = a2 & 0xC000000000000001;
  v9 = MEMORY[0x1E0DEE9E0];
  v110 = v4;
  while ((v4 & 0x8000000000000000) != 0)
  {
    if (!sub_1AF9F7ED8())
      goto LABEL_72;
    sub_1AF9D3D2C();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v13 = v114;
    swift_unknownObjectRelease();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v14 = v114;
    swift_unknownObjectRelease();
    v12 = v8;
    v112 = v3;
    if (!v114)
      goto LABEL_72;
LABEL_31:
    if (v109)
    {
      v20 = v14;
      if (!sub_1AF9F7ECC())
        goto LABEL_43;
      sub_1AF9D3D2C();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v21 = v114;
      swift_unknownObjectRelease();

      if (v114)
        goto LABEL_38;
    }
    else if (*(_QWORD *)(a2 + 16))
    {
      v22 = sub_1AF9D3560((uint64_t)v14);
      if ((v23 & 1) == 0)
      {
LABEL_43:

        goto LABEL_44;
      }
      v21 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v22);

      if (v21)
      {
LABEL_38:
        if ((v9 & 0xC000000000000001) != 0)
        {
          if (v9 >= 0)
            v9 &= 0xFFFFFFFFFFFFFF8uLL;
          v24 = v13;
          v25 = v21;
          v26 = sub_1AF9F7E18();
          if (__OFADD__(v26, 1))
            goto LABEL_126;
          v9 = sub_1AF9D3590(v9, v26 + 1);
        }
        else
        {
          v54 = v13;
          v55 = v21;
        }
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v114 = (void *)v9;
        v58 = sub_1AF9D3560((uint64_t)v13);
        v59 = *(_QWORD *)(v9 + 16);
        v60 = (v57 & 1) == 0;
        v61 = v59 + v60;
        if (__OFADD__(v59, v60))
          goto LABEL_123;
        v62 = v57;
        if (*(_QWORD *)(v9 + 24) >= v61)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_1AF9D3B88();
        }
        else
        {
          sub_1AF9D37B0(v61, isUniquelyReferenced_nonNull_native);
          v63 = sub_1AF9D3560((uint64_t)v13);
          if ((v62 & 1) != (v64 & 1))
            goto LABEL_131;
          v58 = v63;
        }
        if ((v62 & 1) != 0)
        {
          v65 = *(_QWORD *)(v9 + 56);

          *(_QWORD *)(v65 + 8 * v58) = v21;
        }
        else
        {
          *(_QWORD *)(v9 + 8 * (v58 >> 6) + 64) |= 1 << v58;
          *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v58) = v13;
          *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v58) = v21;
          v66 = *(_QWORD *)(v9 + 16);
          v51 = __OFADD__(v66, 1);
          v67 = v66 + 1;
          if (v51)
            goto LABEL_127;
          *(_QWORD *)(v9 + 16) = v67;
          v68 = v13;

        }
        goto LABEL_9;
      }
    }
LABEL_44:
    v27 = sub_1AF9F7CEC();
    v28 = *sub_1AF9CFC38();
    if (os_log_type_enabled(v28, v27))
    {
      v29 = v14;
      v30 = v13;
      v31 = v29;
      v32 = v30;
      v33 = v28;
      v34 = swift_slowAlloc();
      v35 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v34 = 138412546;
      *(_QWORD *)(v34 + 4) = v32;
      *v35 = v13;

      *(_WORD *)(v34 + 12) = 2112;
      *(_QWORD *)(v34 + 14) = v31;
      v35[1] = v14;

      _os_log_impl(&dword_1AF84D000, v33, v27, "EKRemoteUIUtilities Error while combining Host with Remote ObjectID change maps. Could not find permanent objectID for temporaryID [hostTempID: %@, remoteTempID: %@]", (uint8_t *)v34, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE60);
      swift_arrayDestroy();
      MEMORY[0x1B5DFEE1C](v35, -1, -1);
      MEMORY[0x1B5DFEE1C](v34, -1, -1);

    }
    if ((v9 & 0xC000000000000001) != 0)
    {
      if (v9 >= 0)
        v9 &= 0xFFFFFFFFFFFFFF8uLL;
      v36 = v14;
      v37 = v13;
      v38 = sub_1AF9F7E18();
      if (__OFADD__(v38, 1))
        goto LABEL_121;
      v9 = sub_1AF9D3590(v9, v38 + 1);
    }
    else
    {
      v39 = v14;
      v40 = v13;
    }
    v41 = swift_isUniquelyReferenced_nonNull_native();
    v114 = (void *)v9;
    v43 = sub_1AF9D3560((uint64_t)v13);
    v44 = *(_QWORD *)(v9 + 16);
    v45 = (v42 & 1) == 0;
    v46 = v44 + v45;
    if (__OFADD__(v44, v45))
    {
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
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
      sub_1AF9D3D2C();
      result = sub_1AF9F7F68();
      __break(1u);
      return result;
    }
    v47 = v42;
    if (*(_QWORD *)(v9 + 24) >= v46)
    {
      if ((v41 & 1) == 0)
        sub_1AF9D3B88();
    }
    else
    {
      sub_1AF9D37B0(v46, v41);
      v48 = sub_1AF9D3560((uint64_t)v13);
      if ((v47 & 1) != (v49 & 1))
        goto LABEL_131;
      v43 = v48;
    }
    if ((v47 & 1) != 0)
    {
      v10 = *(_QWORD *)(v9 + 56);

      *(_QWORD *)(v10 + 8 * v43) = v14;
    }
    else
    {
      *(_QWORD *)(v9 + 8 * (v43 >> 6) + 64) |= 1 << v43;
      *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v43) = v13;
      *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v43) = v14;
      v50 = *(_QWORD *)(v9 + 16);
      v51 = __OFADD__(v50, 1);
      v52 = v50 + 1;
      if (v51)
        goto LABEL_122;
      *(_QWORD *)(v9 + 16) = v52;
      v53 = v13;
    }
LABEL_9:

    swift_bridgeObjectRelease();
    v8 = v12;
    v4 = v110;
    v3 = v112;
  }
  if (v3)
  {
    v112 = (v3 - 1) & v3;
    v11 = __clz(__rbit64(v3)) | (v8 << 6);
    v12 = v8;
    goto LABEL_30;
  }
  v15 = v8 + 1;
  if (__OFADD__(v8, 1))
    goto LABEL_124;
  if (v15 < v106)
  {
    v16 = *(_QWORD *)(v107 + 8 * v15);
    v12 = v8 + 1;
    if (!v16)
    {
      v12 = v8 + 2;
      if (v8 + 2 >= v106)
        goto LABEL_72;
      v16 = *(_QWORD *)(v107 + 8 * v12);
      if (!v16)
      {
        v12 = v8 + 3;
        if (v8 + 3 >= v106)
          goto LABEL_72;
        v16 = *(_QWORD *)(v107 + 8 * v12);
        if (!v16)
        {
          v12 = v8 + 4;
          if (v8 + 4 >= v106)
            goto LABEL_72;
          v16 = *(_QWORD *)(v107 + 8 * v12);
          if (!v16)
          {
            v17 = v8 + 5;
            do
            {
              if (v106 == v17)
                goto LABEL_72;
              v16 = *(_QWORD *)(v107 + 8 * v17++);
            }
            while (!v16);
            v12 = v17 - 1;
            v4 = v110;
          }
        }
      }
    }
    v112 = (v16 - 1) & v16;
    v11 = __clz(__rbit64(v16)) + (v12 << 6);
LABEL_30:
    v18 = 8 * v11;
    v19 = *(void **)(*(_QWORD *)(v4 + 56) + v18);
    v13 = *(id *)(*(_QWORD *)(v4 + 48) + v18);
    v14 = v19;
    if (!v13)
      goto LABEL_72;
    goto LABEL_31;
  }
LABEL_72:
  sub_1AF9CDCFC();
  if (v109)
  {
    v113 = 0;
    v69 = 0;
    v70 = 0;
    v71 = sub_1AF9F7EB4() | 0x8000000000000000;
  }
  else
  {
    v72 = -1 << *(_BYTE *)(a2 + 32);
    v69 = ~v72;
    v113 = a2 + 64;
    v73 = -v72;
    if (v73 < 64)
      v74 = ~(-1 << v73);
    else
      v74 = -1;
    v70 = v74 & *(_QWORD *)(a2 + 64);
    v71 = a2;
  }
  swift_bridgeObjectRetain();
  v75 = 0;
  v111 = (unint64_t)(v69 + 64) >> 6;
  v76 = &selRef__allDayChanged_;
  while (1)
  {
    v77 = v75;
    if ((v71 & 0x8000000000000000) == 0)
      break;
    if (!sub_1AF9F7ED8())
      goto LABEL_119;
    sub_1AF9D3D2C();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v80 = v114;
    swift_unknownObjectRelease();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v81 = v114;
    swift_unknownObjectRelease();
    v76 = &selRef__allDayChanged_;
    if (!v114)
      goto LABEL_119;
LABEL_100:
    if (objc_msgSend(v80, v76[192]))
    {

    }
    else
    {
      if ((v9 & 0xC000000000000001) != 0)
      {
        if (v9 >= 0)
          v9 &= 0xFFFFFFFFFFFFFF8uLL;
        v87 = v80;
        v88 = v81;
        v89 = sub_1AF9F7E18();
        if (__OFADD__(v89, 1))
          goto LABEL_129;
        v9 = sub_1AF9D3590(v9, v89 + 1);
      }
      else
      {
        v90 = v80;
        v91 = v81;
      }
      v92 = swift_isUniquelyReferenced_nonNull_native();
      v114 = (void *)v9;
      v94 = sub_1AF9D3560((uint64_t)v80);
      v95 = *(_QWORD *)(v9 + 16);
      v96 = (v93 & 1) == 0;
      v97 = v95 + v96;
      if (__OFADD__(v95, v96))
        goto LABEL_128;
      v98 = v93;
      if (*(_QWORD *)(v9 + 24) >= v97)
      {
        if ((v92 & 1) == 0)
          sub_1AF9D3B88();
      }
      else
      {
        sub_1AF9D37B0(v97, v92);
        v99 = sub_1AF9D3560((uint64_t)v80);
        if ((v98 & 1) != (v100 & 1))
          goto LABEL_131;
        v94 = v99;
      }
      if ((v98 & 1) != 0)
      {
        v101 = *(_QWORD *)(v9 + 56);

        *(_QWORD *)(v101 + 8 * v94) = v81;
      }
      else
      {
        *(_QWORD *)(v9 + 8 * (v94 >> 6) + 64) |= 1 << v94;
        *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v94) = v80;
        *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v94) = v81;
        v102 = *(_QWORD *)(v9 + 16);
        v51 = __OFADD__(v102, 1);
        v103 = v102 + 1;
        if (v51)
          goto LABEL_130;
        *(_QWORD *)(v9 + 16) = v103;
        v104 = v80;
      }

      swift_bridgeObjectRelease();
      v76 = &selRef__allDayChanged_;
    }
  }
  if (v70)
  {
    v78 = __clz(__rbit64(v70));
    v70 &= v70 - 1;
    v79 = v78 | (v75 << 6);
    goto LABEL_99;
  }
  v82 = v75 + 1;
  if (__OFADD__(v75, 1))
    goto LABEL_125;
  if (v82 >= v111)
    goto LABEL_119;
  v83 = *(_QWORD *)(v113 + 8 * v82);
  ++v75;
  if (v83)
    goto LABEL_98;
  v75 = v77 + 2;
  if (v77 + 2 >= v111)
    goto LABEL_119;
  v83 = *(_QWORD *)(v113 + 8 * v75);
  if (v83)
    goto LABEL_98;
  v75 = v77 + 3;
  if (v77 + 3 >= v111)
    goto LABEL_119;
  v83 = *(_QWORD *)(v113 + 8 * v75);
  if (v83)
    goto LABEL_98;
  v75 = v77 + 4;
  if (v77 + 4 >= v111)
    goto LABEL_119;
  v83 = *(_QWORD *)(v113 + 8 * v75);
  if (v83)
  {
LABEL_98:
    v70 = (v83 - 1) & v83;
    v79 = __clz(__rbit64(v83)) + (v75 << 6);
LABEL_99:
    v85 = 8 * v79;
    v86 = *(void **)(*(_QWORD *)(v71 + 56) + v85);
    v80 = *(id *)(*(_QWORD *)(v71 + 48) + v85);
    v81 = v86;
    if (!v80)
      goto LABEL_119;
    goto LABEL_100;
  }
  v84 = v77 + 5;
  while (v111 != v84)
  {
    v83 = *(_QWORD *)(v113 + 8 * v84++);
    if (v83)
    {
      v75 = v84 - 1;
      goto LABEL_98;
    }
  }
LABEL_119:
  sub_1AF9CDCFC();
  return v9;
}

id EKRemoteUIUtilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id EKRemoteUIUtilities.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id EKRemoteUIUtilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1AF9D3560(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1AF9F7D64();
  return sub_1AF9D3A80(a1, v2);
}

uint64_t sub_1AF9D3590(uint64_t a1, uint64_t a2)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BDD8);
    v2 = sub_1AF9F7F20();
    v18 = v2;
    sub_1AF9F7EB4();
    v3 = sub_1AF9F7ED8();
    if (v3)
    {
      v4 = v3;
      sub_1AF9D3D2C();
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_1AF9D37B0(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_1AF9F7D64();
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
        v4 = sub_1AF9F7ED8();
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

uint64_t sub_1AF9D37B0(uint64_t a1, char a2)
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
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BDD8);
  v6 = sub_1AF9F7F14();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
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
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
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
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    result = sub_1AF9F7D64();
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
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1AF9D3A80(uint64_t a1, uint64_t a2)
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
    sub_1AF9D3D2C();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_1AF9F7D70();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_1AF9F7D70();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

id sub_1AF9D3B88()
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
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BDD8);
  v2 = *v0;
  v3 = sub_1AF9F7F08();
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
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
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

unint64_t sub_1AF9D3D2C()
{
  unint64_t result;

  result = qword_1EEE6BE70;
  if (!qword_1EEE6BE70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEE6BE70);
  }
  return result;
}

uint64_t type metadata accessor for EKRemoteUIUtilities()
{
  return objc_opt_self();
}

id sub_1AF9D3D88()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

double sub_1AF9D3D90@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;

  type metadata accessor for EKEventOOPHostViewModel();
  sub_1AF9C212C(&qword_1EEE6BDE0, (uint64_t (*)(uint64_t))type metadata accessor for EKEventOOPHostViewModel, (uint64_t)&unk_1AFA14D60);
  *(_QWORD *)a1 = sub_1AF9F79F8();
  *(_QWORD *)(a1 + 8) = v2;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_WORD *)(a1 + 80) = 0;
  return result;
}

NSBundle *sub_1AF9D3E04@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t (*v17)(void);
  _QWORD *v18;
  void *v19;
  void (*v20)(void);
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  unsigned __int8 v35;
  char v36;
  char v37;
  char v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  char *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSBundle *result;
  uint64_t v50;
  NSBundle *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  _OWORD v86[2];
  uint64_t v87;
  uint64_t v88;

  v2 = (uint64_t)v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BDE8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (uint64_t *)((char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_1AF9F79EC();
  MEMORY[0x1E0C80A78](v7);
  v81 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1AF9F7CA4();
  v79 = *(_QWORD *)(v9 - 8);
  v80 = v9;
  MEMORY[0x1E0C80A78](v9);
  v78 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BDF0);
  v11 = MEMORY[0x1E0C80A78](v85);
  v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v72 - v14;
  v86[0] = *v1;
  v16 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v17 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v86[0] + 1)) + 0xD0);
  v18 = *((id *)&v86[0] + 1);
  v19 = (void *)v17();
  sub_1AF9C0F90((uint64_t)v86);

  v83 = v6;
  v84 = a1;
  v82 = v4;
  if (v19)
  {
    v74 = v13;
    v76 = v7;
    v20 = *(void (**)(void))((*v16 & *v18) + 0xA0);
    v21 = v18;
    v20();
    sub_1AF9C0F90((uint64_t)v86);
    type metadata accessor for _AppExtensionEventHostView.Configuration(0);
    sub_1AF9C212C(&qword_1EEE6BE30, type metadata accessor for _AppExtensionEventHostView.Configuration, (uint64_t)&unk_1AFA14300);
    v73 = sub_1AF9F79F8();
    v23 = v22;
    v24 = swift_allocObject();
    v25 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v24 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v24 + 64) = v25;
    *(_OWORD *)(v24 + 80) = *(_OWORD *)(v2 + 64);
    *(_WORD *)(v24 + 96) = *(_WORD *)(v2 + 80);
    v26 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v24 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v24 + 32) = v26;
    v27 = v24;
    v28 = swift_allocObject();
    v29 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v28 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v28 + 64) = v29;
    *(_OWORD *)(v28 + 80) = *(_OWORD *)(v2 + 64);
    *(_WORD *)(v28 + 96) = *(_WORD *)(v2 + 80);
    v30 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v28 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v28 + 32) = v30;
    v31 = v28;
    v32 = swift_allocObject();
    v33 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v32 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v32 + 64) = v33;
    *(_OWORD *)(v32 + 80) = *(_OWORD *)(v2 + 64);
    *(_WORD *)(v32 + 96) = *(_WORD *)(v2 + 80);
    v34 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v32 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v32 + 32) = v34;
    sub_1AF9D6F98(v2);
    sub_1AF9D6F98(v2);
    sub_1AF9D6F98(v2);
    LOBYTE(v20) = sub_1AF9F7AAC();
    v35 = sub_1AF9F7AB8();
    v36 = sub_1AF9F7AD0();
    v37 = sub_1AF9F7AC4();
    sub_1AF9F7AC4();
    if (sub_1AF9F7AC4() != v20)
      v37 = sub_1AF9F7AC4();
    sub_1AF9F7AC4();
    if (sub_1AF9F7AC4() != v35)
      v37 = sub_1AF9F7AC4();
    sub_1AF9F7AC4();
    v38 = sub_1AF9F7AC4();
    v77 = v15;
    v75 = v23;
    if (v38 != v36)
      v37 = sub_1AF9F7AC4();
    v72 = sub_1AF9F7A04();
    v39 = swift_allocObject();
    v40 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v39 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v39 + 64) = v40;
    *(_OWORD *)(v39 + 80) = *(_OWORD *)(v2 + 64);
    *(_WORD *)(v39 + 96) = *(_WORD *)(v2 + 80);
    v41 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v39 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v39 + 32) = v41;
    sub_1AF9D6F98(v2);
    v42 = v78;
    sub_1AF9F7C98();
    v44 = v80;
    v43 = v81;
    v45 = v79;
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(&v81[*(int *)(v76 + 20)], v42, v80);
    *v43 = &unk_1EEE6BE40;
    v43[1] = v39;
    v46 = (uint64_t)v74;
    sub_1AF9C24F0((uint64_t)v43, (uint64_t)&v74[*(int *)(v85 + 36)]);
    v47 = v75;
    *(_QWORD *)v46 = v73;
    *(_QWORD *)(v46 + 8) = v47;
    *(_QWORD *)(v46 + 16) = sub_1AF9D6F40;
    *(_QWORD *)(v46 + 24) = v32;
    *(_QWORD *)(v46 + 32) = sub_1AF9D6E10;
    *(_QWORD *)(v46 + 40) = v27;
    *(_QWORD *)(v46 + 48) = sub_1AF9D6EC8;
    *(_QWORD *)(v46 + 56) = v31;
    *(_QWORD *)(v46 + 64) = v72;
    *(_BYTE *)(v46 + 72) = v37;
    swift_retain();
    sub_1AF9C09CC((uint64_t)sub_1AF9D6F40);
    sub_1AF9C09CC((uint64_t)sub_1AF9D6E10);
    sub_1AF9C09CC((uint64_t)sub_1AF9D6EC8);
    sub_1AF9C2534((uint64_t)v43);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v42, v44);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v48 = (uint64_t)v77;
    sub_1AF9D70AC(v46, (uint64_t)v77);
    sub_1AF9D714C(v48, (uint64_t)v83, &qword_1EEE6BDF0);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BDF8);
    sub_1AF9D4FF0();
    sub_1AF9C6ABC(&qword_1EEE6BE28, &qword_1EEE6BDF8, MEMORY[0x1E0CDFCB8]);
    sub_1AF9F7A28();
    return (NSBundle *)sub_1AF9C6BF4(v48, &qword_1EEE6BDF0);
  }
  else
  {
    v50 = sub_1AF9F7A10();
    result = EventKitUIBundle();
    if (result)
    {
      v51 = result;
      v52 = sub_1AF9F7890();
      v54 = v53;

      v87 = v52;
      v88 = v54;
      sub_1AF9DC9D0();
      v55 = sub_1AF9F7AF4();
      v57 = v56;
      v59 = v58 & 1;
      v87 = sub_1AF9F7B30();
      v60 = sub_1AF9F7ADC();
      v62 = v61;
      v64 = v63 & 1;
      sub_1AF9DCA14(v55, v57, v59);
      swift_bridgeObjectRelease();
      swift_release();
      v65 = sub_1AF9F7AE8();
      v67 = v66;
      LOBYTE(v54) = v68;
      v70 = v69;
      sub_1AF9DCA14(v60, v62, v64);
      swift_bridgeObjectRelease();
      v71 = v83;
      *v83 = v50;
      v71[1] = 0;
      *((_BYTE *)v71 + 16) = 1;
      v71[3] = v65;
      v71[4] = v67;
      *((_BYTE *)v71 + 40) = v54 & 1;
      v71[6] = v70;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BDF8);
      sub_1AF9D4FF0();
      sub_1AF9C6ABC(&qword_1EEE6BE28, &qword_1EEE6BDF8, MEMORY[0x1E0CDFCB8]);
      return (NSBundle *)sub_1AF9F7A28();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1AF9D4528(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[5] = a1;
  v2 = sub_1AF9F7914();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v3 = sub_1AF9F792C();
  v1[9] = v3;
  v1[10] = *(_QWORD *)(v3 - 8);
  v1[11] = swift_task_alloc();
  v4 = sub_1AF9F7944();
  v1[12] = v4;
  v1[13] = *(_QWORD *)(v4 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = sub_1AF9F7C8C();
  v1[16] = sub_1AF9F7C80();
  v1[17] = sub_1AF9F7C68();
  v1[18] = v5;
  return swift_task_switch();
}

uint64_t sub_1AF9D4610()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1AF9F543C();
  swift_bridgeObjectRetain();
  sub_1AF9F7908();
  sub_1AF9F7938();
  sub_1AF9F7920();
  *(_QWORD *)(v0 + 152) = sub_1AF9F7C80();
  sub_1AF9C212C((unint64_t *)&unk_1EEE6BA80, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAA400], MEMORY[0x1E0CAA408]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  *v1 = v0;
  v1[1] = sub_1AF9D46F4;
  return sub_1AF9F7C74();
}

uint64_t sub_1AF9D46F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 168) = v0;
  swift_task_dealloc();
  v3 = *(_QWORD *)(v2 + 152);
  if (v0)
  {
    if (v3)
      goto LABEL_5;
  }
  else if (v3)
  {
LABEL_5:
    swift_getObjectType();
    sub_1AF9F7C68();
  }
  return swift_task_switch();
}

uint64_t sub_1AF9D47B8()
{
  uint64_t v0;

  swift_release();
  *(_QWORD *)(v0 + 176) = *(_QWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_1AF9D47F8()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v0 + 176))
    return swift_task_switch();
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v6 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AF9D48C4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 184) = sub_1AF9F7C80();
  sub_1AF9F7C68();
  return swift_task_switch();
}

uint64_t sub_1AF9D4924()
{
  uint64_t v0;
  uint64_t v1;
  __int128 *v2;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(__int128 **)(v0 + 40);
  swift_release();
  sub_1AF9D4BAC(v1, v2);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1AF9D4974()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v0 + 168);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6C390);
  swift_willThrowTypedImpl();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AF9D49DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  LOBYTE(v1) = sub_1AF9F7CEC();
  v4 = *sub_1AF9CFC38();
  v5 = v1;
  if (os_log_type_enabled(v4, (os_log_type_t)v1))
  {
    v6 = *(void **)(v0 + 168);
    v7 = v6;
    v8 = v6;
    v9 = v4;
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v6;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 32) = v13;
    sub_1AF9F7D94();
    *v11 = v13;

    _os_log_impl(&dword_1AF84D000, v9, v5, "EKEventOOPHostView: Could not read extension query results. Error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE60);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v11, -1, -1);
    MEMORY[0x1B5DFEE1C](v10, -1, -1);

  }
  else
  {
    v6 = *(void **)(v0 + 168);
  }

  v15 = *(_QWORD *)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 112);
  v16 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1AF9D4BAC(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, unint64_t, uint64_t);
  _QWORD *v18;
  void (*v19)(uint64_t);
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  unint64_t v28;
  os_log_t v29;
  uint64_t v30;
  id v31;
  uint64_t (*v32)(void);
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t, _QWORD *);
  uint64_t v39;
  uint64_t v40;
  os_log_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1AF9F7968();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v39 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v39 - v15;
  if (!*(_QWORD *)(a1 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_6;
  }
  v17 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  v17(v6, a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_6:
    sub_1AF9C6BF4((uint64_t)v6, &qword_1EEE6B878);
    sub_1AF9F7CEC();
    v31 = (id)*sub_1AF9CFC38();
    sub_1AF9F7974();

    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v6, v7);
  v45 = *a2;
  v18 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v19 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v45 + 1)) + 0x90);
  v42 = *((id *)&v45 + 1);
  v19(1);
  sub_1AF9C0F90((uint64_t)&v45);
  v20 = sub_1AF9F7CF8();
  v21 = *sub_1AF9CFC38();
  v17(v14, (unint64_t)v16, v7);
  v17(v11, (unint64_t)v16, v7);
  v22 = v20;
  if (os_log_type_enabled(v21, v20))
  {
    v41 = v21;
    v23 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    v44 = v40;
    *(_DWORD *)v23 = 136315394;
    v24 = sub_1AF9F7950();
    v43 = sub_1AF9C4DD4(v24, v25, &v44);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease();
    v26 = *(void (**)(char *, uint64_t))(v8 + 8);
    v26(v14, v7);
    *(_WORD *)(v23 + 12) = 2080;
    v27 = sub_1AF9F795C();
    v43 = sub_1AF9C4DD4(v27, v28, &v44);
    v18 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    sub_1AF9F7D94();
    swift_bridgeObjectRelease();
    v26(v11, v7);
    v29 = v41;
    _os_log_impl(&dword_1AF84D000, v41, v22, "EventKitUI AppExtensionQuery Found %s (%s) RemoteUI Extension", (uint8_t *)v23, 0x16u);
    v30 = v40;
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v30, -1, -1);
    MEMORY[0x1B5DFEE1C](v23, -1, -1);

  }
  else
  {
    v26 = *(void (**)(char *, uint64_t))(v8 + 8);
    v26(v14, v7);
    v26(v11, v7);
  }
  v32 = *(uint64_t (**)(void))((*v18 & *v42) + 0xA0);
  v33 = v42;
  v34 = v32();
  sub_1AF9C0F90((uint64_t)&v45);
  v35 = (uint64_t *)sub_1AF9F5448();
  v36 = *v35;
  v37 = v35[1];
  v38 = *(void (**)(char *, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v34 + 520);
  sub_1AF9C23C4((uint64_t)&v45);
  swift_bridgeObjectRetain();
  v38(v16, v36, v37, v33);
  sub_1AF9C0F90((uint64_t)&v45);
  swift_release();
  swift_bridgeObjectRelease();
  v26(v16, v7);
}

unint64_t sub_1AF9D4FF0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEE6BE00;
  if (!qword_1EEE6BE00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE6BDF0);
    v2[0] = sub_1AF9D5074();
    v2[1] = sub_1AF9C212C(&qword_1EEE6BE20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9170], MEMORY[0x1E0CD9160]);
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEE6BE00);
  }
  return result;
}

unint64_t sub_1AF9D5074()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEE6BE08;
  if (!qword_1EEE6BE08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE6BE10);
    v2[0] = sub_1AF9D50E0();
    v2[1] = MEMORY[0x1E0CDCF98];
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEE6BE08);
  }
  return result;
}

unint64_t sub_1AF9D50E0()
{
  unint64_t result;

  result = qword_1EEE6BE18;
  if (!qword_1EEE6BE18)
  {
    result = MEMORY[0x1B5DFEDB0](&unk_1AFA143B0, &type metadata for _AppExtensionEventHostView);
    atomic_store(result, (unint64_t *)&qword_1EEE6BE18);
  }
  return result;
}

uint64_t sub_1AF9D5124()
{
  _OWORD *v0;
  _OWORD *v1;
  id v2;
  _QWORD *v3;
  uint64_t (*v4)(_QWORD *);
  _QWORD *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD);
  __int128 v10;

  v1 = v0;
  sub_1AF9F7CF8();
  v2 = (id)*sub_1AF9CFC38();
  sub_1AF9F7974();

  v10 = *v0;
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(_QWORD *))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v10 + 1)) + 0x88);
  v5 = *((id *)&v10 + 1);
  LOBYTE(v4) = v4(v5);
  result = sub_1AF9C0F90((uint64_t)&v10);
  if ((v4 & 1) != 0)
  {
    v7 = (*(uint64_t (**)(_QWORD *))((*v3 & *v5) + 0xA0))(v5);
    v8 = sub_1AF9C0F90((uint64_t)&v10);
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 440))(v8);
    return swift_release();
  }
  else
  {
    v9 = (void (*)(_QWORD))*((_QWORD *)v1 + 2);
    if (v9)
    {
      swift_retain();
      v9(0);
      return sub_1AF9C09DC((uint64_t)v9);
    }
  }
  return result;
}

uint64_t sub_1AF9D5240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  id v9;
  uint64_t v10;
  __int128 v12;

  sub_1AF9F7CF8();
  v9 = (id)*sub_1AF9CFC38();
  sub_1AF9F7974();

  v12 = *v4;
  v10 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v12 + 1)) + 0xA0))(*((id *)&v12 + 1));
  sub_1AF9C0F90((uint64_t)&v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 472))(a1, a2, a3, a4);
  return swift_release();
}

uint64_t sub_1AF9D5330(uint64_t a1)
{
  __int128 *v1;
  uint64_t v3;
  __int128 v5;

  v5 = *v1;
  v3 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v5 + 1)) + 0xA0))(*((id *)&v5 + 1));
  sub_1AF9C0F90((uint64_t)&v5);
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 504))(a1);
  return swift_release();
}

void sub_1AF9D53B0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void (*v4)(uint64_t);
  _QWORD *v5;

  v3 = *(_QWORD **)(v1 + 8);
  v4 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0xD8);
  v5 = v3;
  v4(a1);

}

uint64_t sub_1AF9D5414()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0x644573776F6C6C61, 0xED0000676E697469, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D5594(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 64) = a1;
  return sub_1AF9D5414();
}

uint64_t sub_1AF9D559C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000015, 0x80000001AFA20D40, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D5714(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 65) = a1;
  return sub_1AF9D559C();
}

uint64_t sub_1AF9D571C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD00000000000001ELL, 0x80000001AFA20D20, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D5894(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 66) = a1;
  return sub_1AF9D571C();
}

uint64_t sub_1AF9D589C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD00000000000002CLL, 0x80000001AFA20CF0, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D5A14(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 67) = a1;
  return sub_1AF9D589C();
}

uint64_t sub_1AF9D5A1C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0x6976657250736369, 0xEA00000000007765, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D5B94(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 68) = a1;
  return sub_1AF9D5A1C();
}

uint64_t sub_1AF9D5B9C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000015, 0x80000001AFA20CD0, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D5D14(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 69) = a1;
  return sub_1AF9D5B9C();
}

uint64_t sub_1AF9D5D1C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD00000000000001FLL, 0x80000001AFA20CB0, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D5E94(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 70) = a1;
  return sub_1AF9D5D1C();
}

uint64_t sub_1AF9D5E9C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000020, 0x80000001AFA20C80, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D6014(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 71) = a1;
  return sub_1AF9D5E9C();
}

uint64_t sub_1AF9D601C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000018, 0x80000001AFA20C60, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D6194(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 72) = a1;
  return sub_1AF9D601C();
}

uint64_t sub_1AF9D619C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0x755373776F6C6C61, 0xEE00736D65746962, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D631C(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 73) = a1;
  return sub_1AF9D619C();
}

uint64_t sub_1AF9D6324()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000015, 0x80000001AFA20C40, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D649C(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 75) = a1;
  return sub_1AF9D6324();
}

uint64_t sub_1AF9D64A4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000015, 0x80000001AFA20C20, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D661C(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 76) = a1;
  return sub_1AF9D64A4();
}

uint64_t sub_1AF9D6624()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000014, 0x80000001AFA20C00, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D679C(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 77) = a1;
  return sub_1AF9D6624();
}

uint64_t sub_1AF9D67A4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD00000000000001BLL, 0x80000001AFA20BE0, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D691C(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 78) = a1;
  return sub_1AF9D67A4();
}

uint64_t sub_1AF9D6924()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0x4D6C616D696E696DLL, 0xEB0000000065646FLL, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D6AA0(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 79) = a1;
  return sub_1AF9D6924();
}

uint64_t sub_1AF9D6AA8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000019, 0x80000001AFA20BC0, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D6C20(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 80) = a1;
  return sub_1AF9D6AA8();
}

uint64_t sub_1AF9D6C28()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 360))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0x44656772614C7369, 0xEE00776569567961, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0xA0);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 384))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9D6DA8(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 81) = a1;
  return sub_1AF9D6C28();
}

NSBundle *sub_1AF9D6DB0@<X0>(uint64_t a1@<X8>)
{
  return sub_1AF9D3E04(a1);
}

uint64_t type metadata accessor for _AppExtensionEventHostView.Configuration(uint64_t a1)
{
  return sub_1AF9C54B8(a1, (uint64_t *)&unk_1EEE6D140);
}

uint64_t sub_1AF9D6E10(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;

  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (v9)
  {
    v17 = result;
    swift_retain();
    v9(v17, a2, a3, a4, a5, a6, a7, a8);
    return sub_1AF9C09DC((uint64_t)v9);
  }
  return result;
}

uint64_t sub_1AF9D6EC8(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 64);
  if (v4)
  {
    v7 = result;
    swift_retain();
    v4(v7, a2, a3);
    return sub_1AF9C09DC((uint64_t)v4);
  }
  return result;
}

uint64_t sub_1AF9D6F40(uint64_t result)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))(v1 + 32);
  if (v2)
  {
    v3 = result;
    swift_retain();
    v2(v3);
    return sub_1AF9C09DC((uint64_t)v2);
  }
  return result;
}

uint64_t sub_1AF9D6F98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 8);
  sub_1AF9C09CC(v2);
  sub_1AF9C09CC(v3);
  sub_1AF9C09CC(v4);
  return a1;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
    swift_release();
  if (*(_QWORD *)(v0 + 48))
    swift_release();
  if (*(_QWORD *)(v0 + 64))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF9D7060()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1AF9C24A8;
  return sub_1AF9D4528(v0 + 16);
}

uint64_t sub_1AF9D70AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF9D70F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_identity;
  swift_beginAccess();
  return sub_1AF9D714C(v3, a1, &qword_1EEE6B878);
}

uint64_t sub_1AF9D714C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AF9D7190(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_identity;
  swift_beginAccess();
  sub_1AF9C545C(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1AF9D71E8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9D722C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sceneID);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1AF9D7280(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sceneID);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AF9D72DC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9D7320()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_event);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9D736C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_event);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9D73BC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9D7400()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_layoutDirection;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1AF9D7444(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_layoutDirection);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9D748C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AF9D74D0()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sizeCategory);
  swift_beginAccess();
  return *v1;
}

void sub_1AF9D7514(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sizeCategory);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9D7564())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9D75A8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9D75F4(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9D7644())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9D7688()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_hasInProcessNavBar);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9D76CC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_hasInProcessNavBar);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9D7714())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9D7758()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AF9D77A0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1
                + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_changedCustomViewConfigurationDictionary);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AF9D77F0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9D7834()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AF9F79BC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF9D78A4@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 368))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9D78D8(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 376))(*a1);
}

uint64_t sub_1AF9D7904()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1AF9F79C8();
}

void (*sub_1AF9D7970(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9C2BC4;
}

uint64_t sub_1AF9D79E8()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F7998();
  return swift_endAccess();
}

uint64_t sub_1AF9D7A48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F79A4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1AF9D7B1C(_QWORD *a1))(uint64_t a1, char a2)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration__customViewConfigurationChangedPublisher;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9C2E0C;
}

uint64_t sub_1AF9D7BE4()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_navigationDoneButtonTappedCallback, (void (*)(_QWORD, _QWORD))sub_1AF9C09CC);
}

uint64_t sub_1AF9D7BF8(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_navigationDoneButtonTappedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C09DC);
}

uint64_t (*sub_1AF9D7C0C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9D7C50())(void)
{
  uint64_t v0;
  void (*result)(void);
  uint64_t v2;

  result = (void (*)(void))(*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
  if (result)
  {
    v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1AF9C09DC(v2);
  }
  return result;
}

uint64_t sub_1AF9D7C98()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewCompletedCallback, (void (*)(_QWORD, _QWORD))sub_1AF9C6C90);
}

uint64_t sub_1AF9D7CAC(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewCompletedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C6C94);
}

uint64_t (*sub_1AF9D7CC0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9D7D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t, uint64_t, uint64_t, uint64_t)
{
  uint64_t v4;
  void (*result)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  result = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(uint64_t (**)(void))(*(_QWORD *)v4 + 448))();
  if (result)
  {
    v10 = (uint64_t)result;
    result(a1, a2, a3, a4);
    return (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1AF9C09DC(v10);
  }
  return result;
}

uint64_t sub_1AF9D7D84()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewPresentedCallback, (void (*)(_QWORD, _QWORD))sub_1AF9C6C90);
}

uint64_t sub_1AF9D7D98(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewPresentedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C6C94);
}

uint64_t (*sub_1AF9D7DAC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9D7DF0(char a1))(_QWORD)
{
  uint64_t v1;
  void (*result)(_QWORD);
  uint64_t v4;

  result = (void (*)(_QWORD))(*(uint64_t (**)(void))(*(_QWORD *)v1 + 480))();
  if (result)
  {
    v4 = (uint64_t)result;
    result(a1 & 1);
    return (void (*)(_QWORD))sub_1AF9C09DC(v4);
  }
  return result;
}

uint64_t sub_1AF9D7E4C()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_1AF9D7E80();
  return v0;
}

uint64_t sub_1AF9D7E80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  _BYTE v15[16];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_identity;
  v6 = sub_1AF9F7968();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sceneID);
  *v7 = 0;
  v7[1] = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_event) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_viewHierarchy) = 0;
  *(_BYTE *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_hasInProcessNavBar) = 0;
  *(_QWORD *)(v0
            + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_changedCustomViewConfigurationDictionary) = MEMORY[0x1E0DEE9E0];
  v8 = v0
     + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration__customViewConfigurationChangedPublisher;
  v15[15] = 0;
  sub_1AF9F798C();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v2 + 32))(v8, v4, v1);
  v9 = (_QWORD *)(v0
                + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_navigationDoneButtonTappedCallback);
  *v9 = 0;
  v9[1] = 0;
  v10 = (_QWORD *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewCompletedCallback);
  *v10 = 0;
  v10[1] = 0;
  v11 = (_QWORD *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewPresentedCallback);
  *v11 = 0;
  v11[1] = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_layoutDirection) = 0;
  v12 = (void *)*MEMORY[0x1E0DC4938];
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_sizeCategory) = *MEMORY[0x1E0DC4938];
  v13 = v12;
  return v0;
}

uint64_t sub_1AF9D7FF8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t (*v27)(_BYTE *, _QWORD);
  BOOL *v28;
  _BYTE v30[32];

  v5 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v10);
  v12 = &v30[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_1AF9F7968();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16))(v12, a1, v13);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(_BYTE *))(*(_QWORD *)v5 + 184))(v12);
  v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 208);
  swift_bridgeObjectRetain();
  v16 = v15(a2, a3);
  v17 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v18 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *a4) + 0xD0))(v16);
  v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 232))(v18);
  v20 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x100))(v19);
  v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 256))(v20);
  v22 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x118))(v21);
  v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 280))(v22);
  v24 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x130))(v23);
  v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 304))(v24);
  v26 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x148))(v25);
  (*(void (**)(_QWORD))(*(_QWORD *)v5 + 328))(v26 & 1);
  v27 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v5 + 384))(v30);
  *v28 = !*v28;
  return v27(v30, 0);
}

uint64_t sub_1AF9D81EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1AF9C6BF4(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_identity, &qword_1EEE6B878);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v1 = v0
     + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration__customViewConfigurationChangedPublisher;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_navigationDoneButtonTappedCallback));
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewCompletedCallback));
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView13Configuration_eventEditViewPresentedCallback));
  return v0;
}

uint64_t sub_1AF9D82DC()
{
  sub_1AF9D81EC();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF9D8300@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for _AppExtensionEventHostView.Configuration(0);
  result = sub_1AF9F7980();
  *a1 = result;
  return result;
}

id sub_1AF9D833C(_OWORD *a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  __int128 v8;
  objc_super v10;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_identity];
  v5 = sub_1AF9F7968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)&v3[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_conn] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  v6 = &v3[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent];
  v7 = a1[1];
  *(_OWORD *)v6 = *a1;
  *((_OWORD *)v6 + 1) = v7;
  v8 = a1[3];
  *((_OWORD *)v6 + 2) = a1[2];
  *((_OWORD *)v6 + 3) = v8;
  v10.receiver = v3;
  v10.super_class = v1;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t type metadata accessor for _AppExtensionEventHostView.HostCoordinator(uint64_t a1)
{
  return sub_1AF9C54B8(a1, qword_1EEE6D150);
}

uint64_t sub_1AF9D8400@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_identity;
  swift_beginAccess();
  return sub_1AF9D714C(v3, a1, &qword_1EEE6B878);
}

uint64_t sub_1AF9D8458(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_identity;
  swift_beginAccess();
  sub_1AF9C545C(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1AF9D84B0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9D84F4()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_conn);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9D8540(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_conn);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9D8590())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9D85D4()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_1AF9D861C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1
                + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_configurationChangedPublisherSink);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1AF9D866C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1AF9D86B0(void *a1)
{
  _QWORD *v1;
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
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  void (*v18)(void *);
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  os_log_type_t v26;
  os_log_t v27;
  _BOOL4 v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  os_log_t v52;
  os_log_type_t v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  uint8_t *v58;
  _QWORD *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  char *v67;
  void (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(void (*)(), uint64_t);
  uint64_t v84;
  void (*v85)(void (*)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t);
  uint64_t v86;
  void (*v87)(id (*)(char), uint64_t);
  id v88;
  uint64_t v89;
  unsigned int v90;
  id v91;
  id v92;
  uint64_t v93;
  id v94;
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  char *v100;
  os_log_t *v101;
  void *v102;
  id aBlock;
  uint64_t v104;
  uint64_t (*v105)(uint64_t);
  void *v106;
  void (*v107)();
  uint64_t v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE58);
  MEMORY[0x1E0C80A78](v7);
  v100 = (char *)&v88 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1AF9F78E4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v88 - v14;
  aBlock = 0;
  v16 = objc_msgSend(a1, sel_makeXPCConnectionWithError_, &aBlock);
  if (!v16)
  {
    v51 = aBlock;
    v52 = (os_log_t)sub_1AF9F789C();

    swift_willThrow();
    v53 = sub_1AF9F7CEC();
    v54 = *sub_1AF9CFC38();
    if (os_log_type_enabled(v54, v53))
    {
      v55 = v52;
      v56 = v52;
      v57 = v54;
      v58 = (uint8_t *)swift_slowAlloc();
      v59 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v58 = 138412290;
      v60 = v52;
      v61 = (void *)_swift_stdlib_bridgeErrorToNSError();
      aBlock = v61;
      sub_1AF9F7D94();
      *v59 = v61;

      _os_log_impl(&dword_1AF84D000, v57, v53, "Error: _AppExtensionEventHostView Setup: Cannot make XPC Connection. %@", v58, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE60);
      swift_arrayDestroy();
      MEMORY[0x1B5DFEE1C](v59, -1, -1);
      MEMORY[0x1B5DFEE1C](v58, -1, -1);

      return;
    }
    goto LABEL_21;
  }
  v17 = v16;
  v96 = v6;
  v97 = v4;
  v98 = v3;
  v18 = *(void (**)(void *))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x98);
  v19 = aBlock;
  v20 = v17;
  v18(v17);
  objc_msgSend(v20, sel_setExportedInterface_, *sub_1AF9CDD18());
  objc_msgSend(v20, sel_setRemoteObjectInterface_, *sub_1AF9CE22C());
  objc_msgSend(v20, sel_setExportedObject_, v1);
  v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v107 = sub_1AF9DABA4;
  v108 = v21;
  v22 = (void *)MEMORY[0x1E0C809B0];
  aBlock = (id)MEMORY[0x1E0C809B0];
  v104 = 1107296256;
  v105 = sub_1AF9C3D10;
  v106 = &block_descriptor_0;
  v23 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v20, sel_setInterruptionHandler_, v23);
  _Block_release(v23);
  v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v107 = sub_1AF9DAC94;
  v108 = v24;
  aBlock = v22;
  v104 = 1107296256;
  v105 = sub_1AF9C3D10;
  v106 = &block_descriptor_19;
  v25 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v20, sel_setInvalidationHandler_, v25);
  _Block_release(v25);
  objc_msgSend(v20, sel_resume);
  v26 = sub_1AF9F7CF8();
  v101 = (os_log_t *)sub_1AF9CFC38();
  v27 = *v101;
  v28 = os_log_type_enabled(*v101, v26);
  v99 = v1;
  v95 = v13;
  if (v28)
  {
    v29 = v20;
    v30 = v27;
    v31 = swift_slowAlloc();
    *(_DWORD *)v31 = 67109376;
    LODWORD(aBlock) = objc_msgSend(v29, sel_processIdentifier);
    sub_1AF9F7D94();
    *(_WORD *)(v31 + 8) = 1024;
    LODWORD(aBlock) = objc_msgSend(v29, sel_effectiveUserIdentifier);
    sub_1AF9F7D94();

    _os_log_impl(&dword_1AF84D000, v30, v26, "_AppExtensionEventHostView: Setting up XPC connection. processIdentifier: %d. effectiveUserIdentifier: %u.", (uint8_t *)v31, 0xEu);
    MEMORY[0x1B5DFEE1C](v31, -1, -1);

    v1 = v99;
  }
  v32 = objc_msgSend(v20, sel_remoteObjectProxy);
  sub_1AF9F7DAC();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE68);
  if (!swift_dynamicCast())
  {
    sub_1AF9F7CEC();
    v52 = *v101;
    sub_1AF9F7974();

LABEL_21:
    return;
  }
  v33 = v102;
  v34 = *(_QWORD *)((char *)v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 8);
  v35 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v34 + 224);
  v36 = swift_retain();
  v37 = v35(v36);
  if (!v37)
  {
LABEL_20:
    sub_1AF9F7CEC();
    v52 = *v101;
    sub_1AF9F7974();

    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_21;
  }
  v38 = (void *)v37;
  v94 = (id)(*(uint64_t (**)(void))(*(_QWORD *)v34 + 296))();
  if (!v94)
  {

    goto LABEL_20;
  }
  v101 = (os_log_t *)v38;
  v92 = (id)(*(uint64_t (**)(void))(*(_QWORD *)v34 + 248))();
  v39 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v34 + 272))();
  v91 = (id)sub_1AF9F7BF0();

  v40 = swift_retain();
  v41 = (void *)v35(v40);
  swift_release();
  v93 = v9;
  if (!v41)
  {
    v42 = 0;
    goto LABEL_23;
  }
  v42 = objc_msgSend(v41, sel_eventStore);

  if (!v42)
  {
LABEL_23:
    v90 = 0;
LABEL_24:
    v62 = (void *)sub_1AF9F7BCC();
    swift_bridgeObjectRelease();
    if (v42)
    {
      v63 = (void *)sub_1AF9F7BCC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v63 = 0;
    }
    v91 = v33;
    objc_msgSend(v33, sel_setupViewContextWithViewHierarchy_layoutDirection_sizeCategory_sourceAccountManagement_sourceBundleID_, v94, v92, v62, v90, v63);

    v64 = objc_msgSend(objc_allocWithZone((Class)sub_1AF9F7B78()), sel_init);
    sub_1AF9F78D8();
    v65 = -[os_log_t occurrenceDate](v101, sel_occurrenceDate);
    v89 = v10;
    if (v65)
    {
      v66 = v65;
      v67 = v95;
      sub_1AF9F78CC();

      v68 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
      v69 = (uint64_t)v100;
      v68(v100, v67, v9);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(v69, 0, 1, v9);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v69, 1, v9) != 1)
      {
        (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
        v68(v15, (char *)v69, v9);
LABEL_32:
        v92 = v64;
        v70 = (void *)sub_1AF9F7B6C();
        sub_1AF9F7B84();
        v71 = (void *)sub_1AF9F7BB4();
        swift_bridgeObjectRelease();
        sub_1AF9F7B90();
        sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE78);
        sub_1AF9DAC9C();
        v72 = (void *)sub_1AF9F7BB4();
        swift_bridgeObjectRelease();
        sub_1AF9F7B9C();
        v73 = (void *)sub_1AF9F7BB4();
        swift_bridgeObjectRelease();
        v74 = (void *)sub_1AF9F78C0();
        v75 = v91;
        objc_msgSend(v91, sel_setupEventViewWithSerializedEventDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_eventOccurrenceDate_, v71, v72, v73, v74);

        v76 = objc_msgSend(v75, sel_setupEventViewContextWithNavBarExistence_, (*(uint64_t (**)(void))(*(_QWORD *)v34 + 320))() & 1);
        v77 = v96;
        (*(void (**)(id))(*(_QWORD *)v34 + 392))(v76);
        v78 = swift_allocObject();
        *(_QWORD *)(v78 + 16) = v75;
        *(_QWORD *)(v78 + 24) = v34;
        sub_1AF9C6ABC(&qword_1EEE6BE88, &qword_1EEE6B888, MEMORY[0x1E0C96190]);
        swift_retain();
        swift_unknownObjectRetain();
        v79 = v98;
        v80 = sub_1AF9F79E0();
        swift_release();
        (*(void (**)(char *, uint64_t))(v97 + 8))(v77, v79);
        (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v99) + 0xB0))(v80);
        v81 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v82 = swift_allocObject();
        *(_QWORD *)(v82 + 16) = v81;
        *(_QWORD *)(v82 + 24) = v75;
        v83 = *(void (**)(void (*)(), uint64_t))(*(_QWORD *)v34 + 424);
        swift_unknownObjectRetain();
        swift_retain();
        v83(sub_1AF9DAE24, v82);
        swift_release();
        v84 = swift_allocObject();
        *(_QWORD *)(v84 + 16) = v75;
        v85 = *(void (**)(void (*)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t))(*(_QWORD *)v34 + 456);
        swift_unknownObjectRetain();
        v85(sub_1AF9DAF24, v84);
        v86 = swift_allocObject();
        *(_QWORD *)(v86 + 16) = v75;
        v87 = *(void (**)(id (*)(char), uint64_t))(*(_QWORD *)v34 + 488);
        swift_unknownObjectRetain();
        v87(sub_1AF9DAF88, v86);

        swift_unknownObjectRelease();
        swift_release();

        (*(void (**)(char *, uint64_t))(v89 + 8))(v15, v93);
        return;
      }
    }
    else
    {
      v69 = (uint64_t)v100;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v100, 1, 1, v9);
    }
    sub_1AF9C6BF4(v69, &qword_1EEE6BE58);
    goto LABEL_32;
  }
  v88 = v42;
  v43 = objc_msgSend(v42, sel_connection);
  if (!v43)
  {
    __break(1u);
    goto LABEL_35;
  }
  v44 = v43;
  v45 = objc_msgSend(v43, sel_initializationOptions);

  if (!v45)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v90 = objc_msgSend(v45, sel_management);

  v46 = objc_msgSend(v88, sel_connection);
  if (!v46)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v47 = v46;
  v48 = objc_msgSend(v46, sel_initializationOptions);

  if (v48)
  {
    v49 = objc_msgSend(v48, sel_managementBundleIdentifier);

    v9 = v93;
    if (v49)
    {
      sub_1AF9F7BF0();
      v42 = v50;

    }
    else
    {

      v42 = 0;
    }
    goto LABEL_24;
  }
LABEL_37:
  __break(1u);
}

void sub_1AF9D93C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v2 = sub_1AF9F7B3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1AF9F7B54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1 + 16;
  sub_1AF9F7CF8();
  v11 = (id)*sub_1AF9CFC38();
  v12 = MEMORY[0x1E0DEE9D8];
  sub_1AF9F7974();

  swift_beginAccess();
  v13 = (_QWORD *)MEMORY[0x1B5DFEE88](a1 + 16);
  if (v13)
  {
    v14 = v13;
    v15 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v13) + 0x90))();

    if (v15)
    {
      objc_msgSend(v15, sel_setExportedObject_, 0);

    }
  }
  swift_beginAccess();
  v16 = MEMORY[0x1B5DFEE88](v10);
  if (v16)
  {
    v17 = (void *)v16;
    v18 = *(_QWORD *)(v16 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 16);
    v19 = *(_QWORD *)(v16 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 24);
    sub_1AF9C09CC(v18);

    if (v18)
    {
      sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
      v27 = sub_1AF9F7D04();
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = v18;
      *(_QWORD *)(v20 + 24) = v19;
      aBlock[4] = sub_1AF9DC9AC;
      aBlock[5] = v20;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1AF9C3D10;
      aBlock[3] = &block_descriptor_58;
      v21 = _Block_copy(aBlock);
      v26 = v7;
      v22 = v21;
      swift_retain();
      swift_release();
      sub_1AF9F7B48();
      aBlock[0] = v12;
      sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
      v25 = v6;
      sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
      sub_1AF9F7DB8();
      v23 = (void *)v27;
      MEMORY[0x1B5DFD9D0](0, v9, v5, v22);
      _Block_release(v22);

      sub_1AF9C09DC(v18);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v25);
    }
  }
}

unint64_t sub_1AF9D96E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _OWORD *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t *v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6C380);
    v2 = (_QWORD *)sub_1AF9F7F2C();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v32 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v37;
  v7 = &v39;
  result = swift_bridgeObjectRetain();
  i = 0;
  v10 = MEMORY[0x1E0DEE9B0] + 8;
  v11 = MEMORY[0x1E0DEE9B8] + 8;
  if (v5)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v31)
    goto LABEL_32;
  v21 = *(_QWORD *)(v32 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v31)
      goto LABEL_32;
    v21 = *(_QWORD *)(v32 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v31)
        goto LABEL_32;
      v21 = *(_QWORD *)(v32 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v31)
          goto LABEL_32;
        v21 = *(_QWORD *)(v32 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v31)
          {
            v21 = *(_QWORD *)(v32 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v31)
                break;
              v21 = *(_QWORD *)(v32 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_1AF9CDCFC();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v34 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v35 = *v24;
    v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    sub_1AF9DC978(v6, v7);
    sub_1AF9DC978(v7, v40);
    sub_1AF9DC978(v40, &v38);
    result = sub_1AF9DB070(v35, v36);
    v25 = result;
    if ((v26 & 1) != 0)
    {
      v33 = i;
      v12 = v7;
      v13 = v6;
      v14 = v1;
      v15 = v11;
      v16 = v10;
      v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v17 = v35;
      v17[1] = v36;
      v10 = v16;
      v11 = v15;
      v1 = v14;
      v6 = v13;
      v7 = v12;
      i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      result = (unint64_t)sub_1AF9DC978(&v38, v18);
      v5 = v34;
      if (!v34)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    *v27 = v35;
    v27[1] = v36;
    result = (unint64_t)sub_1AF9DC978(&v38, (_OWORD *)(v2[7] + 32 * result));
    v28 = v2[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_34;
    v2[2] = v30;
    v5 = v34;
    if (!v34)
      goto LABEL_11;
LABEL_10:
    v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1AF9D9A9C()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;

  v1 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
  objc_msgSend(v2, sel_invalidate);

  return (*(uint64_t (**)(_QWORD))((*v1 & *v0) + 0x98))(0);
}

uint64_t sub_1AF9D9BA4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  char *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  const void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _QWORD aBlock[6];

  v41 = a8;
  v42 = a7;
  v39 = a3;
  v40 = a5;
  v13 = sub_1AF9F7B3C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(_QWORD *)(v8 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 32);
  if (v22)
  {
    v37 = v14;
    v38 = result;
    v23 = *(_QWORD *)(v8 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 40);
    v36 = v19;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v35 = sub_1AF9F7D04();
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = v22;
    v24[3] = v23;
    v24[4] = a1;
    v24[5] = a2;
    v24[6] = v39;
    v24[7] = a4;
    v25 = v41;
    v24[8] = v40;
    v24[9] = a6;
    v40 = v13;
    v26 = v16;
    v27 = a6;
    v28 = v42;
    v24[10] = v42;
    v24[11] = v25;
    aBlock[4] = sub_1AF9DAFEC;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_38;
    v39 = _Block_copy(aBlock);
    sub_1AF9C09CC(v22);
    v29 = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30 = v27;
    v31 = v28;
    swift_release();
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    v32 = v40;
    sub_1AF9F7DB8();
    v33 = v39;
    v34 = (void *)v35;
    MEMORY[0x1B5DFD9D0](0, v21, v26, v39);
    _Block_release(v33);

    sub_1AF9C09DC(v22);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v32);
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v21, v38);
  }
  return result;
}

uint64_t sub_1AF9D9F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v7 = sub_1AF9F7B3C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(v3 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 48);
  if (v16)
  {
    v23 = v8;
    v24 = result;
    v17 = *(_QWORD *)(v3 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 56);
    v22 = v13;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v18 = (void *)sub_1AF9F7D04();
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = v16;
    v19[3] = v17;
    v19[4] = a1;
    v19[5] = a2;
    v19[6] = a3;
    aBlock[4] = sub_1AF9C571C;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_44;
    v20 = _Block_copy(aBlock);
    sub_1AF9C09CC(v16);
    swift_bridgeObjectRetain();
    swift_release();
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    sub_1AF9F7DB8();
    MEMORY[0x1B5DFD9D0](0, v15, v10, v20);
    _Block_release(v20);

    sub_1AF9C09DC(v16);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v15, v24);
  }
  return result;
}

uint64_t sub_1AF9DA1F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v3 = sub_1AF9F7B3C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 16);
  if (v12)
  {
    v13 = *(_QWORD *)(v1 + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 24);
    v19 = v9;
    v20 = result;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v18 = sub_1AF9F7D04();
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = v12;
    v14[3] = v13;
    v14[4] = a1;
    aBlock[4] = sub_1AF9C57D0;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_50;
    v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    sub_1AF9F7DB8();
    v16 = (void *)v18;
    MEMORY[0x1B5DFD9D0](0, v11, v6, v15);
    _Block_release(v15);

    sub_1AF9C09DC(v12);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return result;
}

id sub_1AF9DA498()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _AppExtensionEventHostView.HostCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1AF9DA578()
{
  id v0;
  void *v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CAA600]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEB0);
  sub_1AF9F7A94();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

void sub_1AF9DA5EC(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1AF9DB7D8(a1, a2, *(_QWORD *)(v2 + 8));
}

id sub_1AF9DA5F4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id result;
  uint64_t v15;
  objc_super v17;

  v2 = v1[1];
  v15 = *v1;
  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  v6 = v1[5];
  v8 = v1[6];
  v7 = v1[7];
  v9 = (objc_class *)type metadata accessor for _AppExtensionEventHostView.HostCoordinator(0);
  v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_identity];
  v12 = sub_1AF9F7968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_QWORD *)&v10[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_conn] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  v13 = &v10[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent];
  *(_QWORD *)v13 = v15;
  *((_QWORD *)v13 + 1) = v2;
  *((_QWORD *)v13 + 2) = v3;
  *((_QWORD *)v13 + 3) = v4;
  *((_QWORD *)v13 + 4) = v5;
  *((_QWORD *)v13 + 5) = v6;
  *((_QWORD *)v13 + 6) = v8;
  *((_QWORD *)v13 + 7) = v7;
  swift_retain();
  sub_1AF9C09CC(v3);
  sub_1AF9C09CC(v5);
  sub_1AF9C09CC(v8);
  v17.receiver = v10;
  v17.super_class = v9;
  result = objc_msgSendSuper2(&v17, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_1AF9DA710()
{
  sub_1AF9DC934();
  return sub_1AF9F7A88();
}

uint64_t sub_1AF9DA760()
{
  sub_1AF9DC934();
  return sub_1AF9F7A58();
}

void sub_1AF9DA7B0()
{
  sub_1AF9DC934();
  sub_1AF9F7A7C();
  __break(1u);
}

uint64_t sub_1AF9DA7D4(uint64_t a1, uint64_t a2)
{
  return sub_1AF9DAA0C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1AF9DA7E0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1AF9F7BD8();
  *a2 = 0;
  return result;
}

uint64_t sub_1AF9DA854(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1AF9F7BE4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1AF9DA8D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1AF9F7BF0();
  v2 = sub_1AF9F7BCC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1AF9DA910@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1AF9F7BCC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1AF9DA954@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1AF9F7BF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1AF9DA97C()
{
  sub_1AF9C212C((unint64_t *)&unk_1EEE6BF70, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1AFA145F0);
  sub_1AF9C212C(&qword_1EEE6C370, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1AFA145B0);
  return sub_1AF9F7F44();
}

uint64_t sub_1AF9DAA00(uint64_t a1, uint64_t a2)
{
  return sub_1AF9DAA0C(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1AF9DAA0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1AF9F7BF0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1AF9DAA48()
{
  sub_1AF9F7BF0();
  sub_1AF9F7BFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF9DAA88()
{
  uint64_t v0;

  sub_1AF9F7BF0();
  sub_1AF9F7F74();
  sub_1AF9F7BFC();
  v0 = sub_1AF9F7F80();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1AF9DAAF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1AF9F7BF0();
  v2 = v1;
  if (v0 == sub_1AF9F7BF0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1AF9F7F50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1AF9DAB80()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AF9DABA4()
{
  uint64_t v0;
  id v1;
  _QWORD *v2;
  void *v3;
  void *v4;

  sub_1AF9F7CF8();
  v1 = (id)*sub_1AF9CFC38();
  sub_1AF9F7974();

  swift_beginAccess();
  v2 = (_QWORD *)MEMORY[0x1B5DFEE88](v0 + 16);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90))();

    if (v4)
    {
      objc_msgSend(v4, sel_setExportedObject_, 0);

    }
  }
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

void sub_1AF9DAC94()
{
  uint64_t v0;

  sub_1AF9D93C8(v0);
}

unint64_t sub_1AF9DAC9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE6BE80;
  if (!qword_1EEE6BE80)
  {
    v1 = sub_1AF9C6B78(255, (unint64_t *)&qword_1EEE6BE70);
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE6BE80);
  }
  return result;
}

uint64_t sub_1AF9DACF4()
{
  return objectdestroy_21Tm((void (*)(_QWORD))MEMORY[0x1E0DEEEC0], (void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_1AF9DAD08()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t (*v5)(_BYTE *, _QWORD);
  _QWORD *v6;
  _QWORD *v7;
  _BYTE v9[32];

  v1 = *(void **)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 344))();
  sub_1AF9D96E4(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1AF9F7BB4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_updateEventViewWithChangedViewConfigurationDictionary_, v4);

  v5 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v2 + 360))(v9);
  v7 = v6;
  swift_bridgeObjectRelease();
  *v7 = MEMORY[0x1E0DEE9E0];
  return v5(v9, 0);
}

uint64_t sub_1AF9DADD4()
{
  return objectdestroy_21Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30], (void (*)(_QWORD))MEMORY[0x1E0DEEEC0]);
}

uint64_t objectdestroy_21Tm(void (*a1)(_QWORD), void (*a2)(_QWORD))
{
  uint64_t v2;

  a1(*(_QWORD *)(v2 + 16));
  a2(*(_QWORD *)(v2 + 24));
  return swift_deallocObject();
}

void sub_1AF9DAE24()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  void *v8;

  v1 = *(void **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16) + 16;
  swift_beginAccess();
  v3 = (_QWORD *)MEMORY[0x1B5DFEE88](v2);
  if (v3
    && (v4 = v3,
        v5 = (_QWORD *)MEMORY[0x1E0DEEDD8],
        v6 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x90))(),
        v4,
        v6,
        v6))
  {
    swift_beginAccess();
    v7 = (_QWORD *)MEMORY[0x1B5DFEE88](v2);
    if (v7)
    {
      v8 = v7;
      (*(void (**)(_QWORD))((*v5 & *v7) + 0xE0))(0);

    }
  }
  else
  {
    objc_msgSend(v1, sel_eventViewNavigationDoneButtonTapped);
  }
}

uint64_t sub_1AF9DAF00()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_1AF9DAF24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v7;
  id v8;

  v7 = *(void **)(v4 + 16);
  v8 = (id)sub_1AF9F7BCC();
  objc_msgSend(v7, sel_eventViewEventEditViewCompletedWithAction_eventID_waitUntilTimestamp_, a1, v8, a4);

}

id sub_1AF9DAF88(char a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), sel_eventViewEventEditViewPresented_, a1 & 1);
}

uint64_t sub_1AF9DAFA0()
{
  id *v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1AF9DAFEC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
}

uint64_t sub_1AF9DB020()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF9DB04C()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1AF9DB070(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1AF9F7F74();
  sub_1AF9F7BFC();
  v4 = sub_1AF9F7F80();
  return sub_1AF9DB544(a1, a2, v4);
}

uint64_t sub_1AF9DB0D4(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C620);
  v36 = a2;
  v6 = sub_1AF9F7F14();
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
      swift_unknownObjectRetain();
    }
    sub_1AF9F7F74();
    sub_1AF9F7BFC();
    result = sub_1AF9F7F80();
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

uint64_t sub_1AF9DB3E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_1AF9DB070(a2, a3);
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
    sub_1AF9DB624();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_unknownObjectRelease();
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
  sub_1AF9DB0D4(v15, a4 & 1);
  v21 = sub_1AF9DB070(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1AF9F7F68();
  __break(1u);
  return result;
}

unint64_t sub_1AF9DB544(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1AF9F7F50() & 1) == 0)
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
      while (!v14 && (sub_1AF9F7F50() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1AF9DB624()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C620);
  v2 = *v0;
  v3 = sub_1AF9F7F08();
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
    result = (void *)swift_unknownObjectRetain();
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

void sub_1AF9DB7D8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  char *v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  os_log_type_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  os_log_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint8_t *v38;
  uint64_t v39;
  os_log_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v5 = sub_1AF9F78F0();
  MEMORY[0x1E0C80A78](v5);
  v44 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1AF9F7968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v43 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v45 = (char *)&v38 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BA70);
  v16 = MEMORY[0x1E0C80A78](v15);
  v42 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v38 - v18;
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v20 = a1;
    sub_1AF9F7D34();
    v21 = sub_1AF9F7D28();
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v19, 1, v21) == 1)
    {
      sub_1AF9C6BF4((uint64_t)v19, (uint64_t *)&unk_1EEE6BA70);
      v23 = *(void (**)(uint64_t))(*(_QWORD *)a3 + 176);
      v24 = swift_retain();
      v23(v24);
      swift_release();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
      {

        sub_1AF9C6BF4((uint64_t)v9, &qword_1EEE6B878);
      }
      else
      {
        v25 = v45;
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v45, v9, v10);
        v26 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 200);
        v27 = swift_retain();
        v41 = v26(v27);
        v29 = v28;
        swift_release();
        if (v29)
        {
          v30 = sub_1AF9F7CF8();
          v31 = *sub_1AF9CFC38();
          v32 = v30;
          if (os_log_type_enabled(v31, v30))
          {
            swift_bridgeObjectRetain_n();
            v40 = v31;
            v33 = (uint8_t *)swift_slowAlloc();
            v39 = swift_slowAlloc();
            v47 = v39;
            *(_DWORD *)v33 = 136315138;
            v38 = v33 + 4;
            swift_bridgeObjectRetain();
            v46 = sub_1AF9C4DD4(v41, v29, &v47);
            sub_1AF9F7D94();
            swift_bridgeObjectRelease_n();
            v34 = v40;
            _os_log_impl(&dword_1AF84D000, v40, v32, "_AppExtensionEventHostView: *** Setting up Remote UI Extension Configuration ***  sceneID: %s.", v33, 0xCu);
            v35 = v39;
            swift_arrayDestroy();
            MEMORY[0x1B5DFEE1C](v35, -1, -1);
            MEMORY[0x1B5DFEE1C](v33, -1, -1);

          }
          v36 = v45;
          (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v43, v45, v10);
          sub_1AF9F78FC();
          v37 = v42;
          sub_1AF9F7D1C();
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v37, 0, 1, v21);
          sub_1AF9F7D40();

          (*(void (**)(char *, uint64_t))(v11 + 8))(v36, v10);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v11 + 8))(v25, v10);

        }
      }
    }
    else
    {

      sub_1AF9C6BF4((uint64_t)v19, (uint64_t *)&unk_1EEE6BA70);
    }
  }
  else
  {
    sub_1AF9F7EF0();
    __break(1u);
  }
}

uint64_t sub_1AF9DBC70()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for EKEventOOPHostView(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 16))
    swift_release();
  if (*(_QWORD *)(a1 + 32))
    swift_release();
  if (*(_QWORD *)(a1 + 48))
    swift_release();
}

uint64_t initializeWithCopy for EKEventOOPHostView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _OWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = (_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  v7 = v4;
  if (v5)
  {
    v8 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  v9 = *(_QWORD *)(a2 + 32);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  v11 = *(_QWORD *)(a2 + 48);
  if (v11)
  {
    v12 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 48) = v11;
    *(_QWORD *)(a1 + 56) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  }
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  return a1;
}

uint64_t assignWithCopy for EKEventOOPHostView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
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
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v10 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v10)
    {
      v11 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = v10;
      *(_QWORD *)(a1 + 40) = v11;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v10;
    *(_QWORD *)(a1 + 40) = v12;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_15:
  v13 = *(_QWORD *)(a2 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    if (v13)
    {
      v15 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 48) = v13;
      *(_QWORD *)(a1 + 56) = v15;
      swift_retain();
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    goto LABEL_22;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_21;
  }
  v14 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v13;
  *(_QWORD *)(a1 + 56) = v14;
  swift_retain();
  swift_release();
LABEL_22:
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_BYTE *)(a1 + 66) = *(_BYTE *)(a2 + 66);
  *(_BYTE *)(a1 + 67) = *(_BYTE *)(a2 + 67);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_BYTE *)(a1 + 69) = *(_BYTE *)(a2 + 69);
  *(_BYTE *)(a1 + 70) = *(_BYTE *)(a2 + 70);
  *(_BYTE *)(a1 + 71) = *(_BYTE *)(a2 + 71);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_BYTE *)(a1 + 75) = *(_BYTE *)(a2 + 75);
  *(_BYTE *)(a1 + 76) = *(_BYTE *)(a2 + 76);
  *(_BYTE *)(a1 + 77) = *(_BYTE *)(a2 + 77);
  *(_BYTE *)(a1 + 78) = *(_BYTE *)(a2 + 78);
  *(_BYTE *)(a1 + 79) = *(_BYTE *)(a2 + 79);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  return a1;
}

__n128 __swift_memcpy82_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for EKEventOOPHostView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  v6 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 24) = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    v8 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 24) = v8;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v9 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = v9;
      *(_QWORD *)(a1 + 40) = v10;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    v11 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v11;
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_15:
  v12 = *(_QWORD *)(a2 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    if (v12)
    {
      v14 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 48) = v12;
      *(_QWORD *)(a1 + 56) = v14;
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    goto LABEL_22;
  }
  if (!v12)
  {
    swift_release();
    goto LABEL_21;
  }
  v13 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v12;
  *(_QWORD *)(a1 + 56) = v13;
  swift_release();
LABEL_22:
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_BYTE *)(a1 + 66) = *(_BYTE *)(a2 + 66);
  *(_BYTE *)(a1 + 67) = *(_BYTE *)(a2 + 67);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_BYTE *)(a1 + 69) = *(_BYTE *)(a2 + 69);
  *(_BYTE *)(a1 + 70) = *(_BYTE *)(a2 + 70);
  *(_BYTE *)(a1 + 71) = *(_BYTE *)(a2 + 71);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_BYTE *)(a1 + 75) = *(_BYTE *)(a2 + 75);
  *(_BYTE *)(a1 + 76) = *(_BYTE *)(a2 + 76);
  *(_BYTE *)(a1 + 77) = *(_BYTE *)(a2 + 77);
  *(_BYTE *)(a1 + 78) = *(_BYTE *)(a2 + 78);
  *(_BYTE *)(a1 + 79) = *(_BYTE *)(a2 + 79);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  return a1;
}

uint64_t getEnumTagSinglePayload for EKEventOOPHostView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 82))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EKEventOOPHostView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 80) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 82) = 1;
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
    *(_BYTE *)(result + 82) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EKEventOOPHostView()
{
  return &type metadata for EKEventOOPHostView;
}

uint64_t destroy for _AppExtensionEventHostView(_QWORD *a1)
{
  uint64_t result;

  result = swift_release();
  if (a1[2])
    result = swift_release();
  if (a1[4])
    result = swift_release();
  if (a1[6])
    return swift_release();
  return result;
}

_QWORD *initializeWithCopy for _AppExtensionEventHostView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2 + 2;
  v5 = a2[2];
  swift_retain();
  if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  v8 = a2[4];
  if (v8)
  {
    v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  v10 = a2[6];
  if (v10)
  {
    v11 = a2[7];
    a1[6] = v10;
    a1[7] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  return a1;
}

_QWORD *assignWithCopy for _AppExtensionEventHostView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  v7 = a2[4];
  if (a1[4])
  {
    if (v7)
    {
      v8 = a2[5];
      a1[4] = v7;
      a1[5] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[5];
    a1[4] = v7;
    a1[5] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  v10 = a2[6];
  if (!a1[6])
  {
    if (v10)
    {
      v12 = a2[7];
      a1[6] = v10;
      a1[7] = v12;
      swift_retain();
      return a1;
    }
LABEL_21:
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_21;
  }
  v11 = a2[7];
  a1[6] = v10;
  a1[7] = v11;
  swift_retain();
  swift_release();
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

_QWORD *assignWithTake for _AppExtensionEventHostView(_QWORD *a1, _QWORD *a2)
{
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

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  v8 = a2[4];
  if (a1[4])
  {
    if (v8)
    {
      v9 = a2[5];
      a1[4] = v8;
      a1[5] = v9;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v8)
  {
    v10 = a2[5];
    a1[4] = v8;
    a1[5] = v10;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  v11 = a2[6];
  if (!a1[6])
  {
    if (v11)
    {
      v13 = a2[7];
      a1[6] = v11;
      a1[7] = v13;
      return a1;
    }
LABEL_21:
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    return a1;
  }
  if (!v11)
  {
    swift_release();
    goto LABEL_21;
  }
  v12 = a2[7];
  a1[6] = v11;
  a1[7] = v12;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AppExtensionEventHostView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for _AppExtensionEventHostView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for _AppExtensionEventHostView()
{
  return &type metadata for _AppExtensionEventHostView;
}

uint64_t sub_1AF9DC640()
{
  return type metadata accessor for _AppExtensionEventHostView.Configuration(0);
}

void sub_1AF9DC648()
{
  unint64_t v0;
  unint64_t v1;

  sub_1AF9C6868();
  if (v0 <= 0x3F)
  {
    sub_1AF9C6B34(319, (unint64_t *)&unk_1EEE6C2A0, MEMORY[0x1E0DEAFA0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0C96198]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t sub_1AF9DC72C()
{
  return type metadata accessor for _AppExtensionEventHostView.HostCoordinator(0);
}

void sub_1AF9DC734()
{
  unint64_t v0;

  sub_1AF9C6868();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

unint64_t sub_1AF9DC7BC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEE6BF20;
  if (!qword_1EEE6BF20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE6BF28);
    v2[0] = sub_1AF9D4FF0();
    v2[1] = sub_1AF9C6ABC(&qword_1EEE6BE28, &qword_1EEE6BDF8, MEMORY[0x1E0CDFCB8]);
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0CDB8A8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEE6BF20);
  }
  return result;
}

void type metadata accessor for EKEventEditViewAction(uint64_t a1)
{
  sub_1AF9C6B34(a1, (unint64_t *)&unk_1EEE6BF30, (uint64_t)&unk_1E6017980, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for UIContentSizeCategory(uint64_t a1)
{
  sub_1AF9C6B34(a1, (unint64_t *)&unk_1EEE6C330, (uint64_t)&unk_1E60179A0, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for UIUserInterfaceLayoutDirection(uint64_t a1)
{
  sub_1AF9C6B34(a1, &qword_1EEE6BF40, (uint64_t)&unk_1E6017A90, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for EKEventRemoteViewAction(uint64_t a1)
{
  sub_1AF9C6B34(a1, &qword_1EEE6BF48, (uint64_t)&unk_1E60179E8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEEC78]);
}

uint64_t sub_1AF9DC8B0()
{
  return sub_1AF9C212C((unint64_t *)&unk_1EEE6C350, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1AFA148C8);
}

uint64_t sub_1AF9DC8DC()
{
  return sub_1AF9C212C((unint64_t *)&unk_1EEE6BF60, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1AFA14578);
}

uint64_t sub_1AF9DC908()
{
  return sub_1AF9C212C((unint64_t *)&unk_1EEE6C360, (uint64_t (*)(uint64_t))type metadata accessor for UIContentSizeCategory, (uint64_t)&unk_1AFA14908);
}

unint64_t sub_1AF9DC934()
{
  unint64_t result;

  result = qword_1EEE6BF80;
  if (!qword_1EEE6BF80)
  {
    result = MEMORY[0x1B5DFEDB0](&unk_1AFA14338, &type metadata for _AppExtensionEventHostView);
    atomic_store(result, (unint64_t *)&qword_1EEE6BF80);
  }
  return result;
}

_OWORD *sub_1AF9DC978(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1AF9DC988()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF9DC9AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
}

unint64_t sub_1AF9DC9D0()
{
  unint64_t result;

  result = qword_1EEE6BFA0;
  if (!qword_1EEE6BFA0)
  {
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EEE6BFA0);
  }
  return result;
}

uint64_t sub_1AF9DCA14(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AF9DCA50())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AF9DCA94(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  objc_super v12;

  *(_QWORD *)&v3[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostingController] = 0;
  v6 = &v3[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView];
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  *((_QWORD *)v6 + 14) = 0;
  v7 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostViewModel;
  type metadata accessor for EKEventEditOOPHostViewModel();
  v8 = v3;
  *(_QWORD *)&v3[v7] = sub_1AF9E18D0();
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitInsertedObjectIDs] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editViewDelegate] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor] = 0;

  if (a2)
  {
    v9 = (void *)sub_1AF9F7BCC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for EKEventEditViewControllerOOPImpl();
  v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, v9, a3);

  return v10;
}

uint64_t type metadata accessor for EKEventEditViewControllerOOPImpl()
{
  return objc_opt_self();
}

void sub_1AF9DCC88()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  _QWORD *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  _QWORD v54[8];
  void *v55;
  void *v56;
  unsigned __int8 v57;
  uint64_t v58;
  uint64_t v59;
  unsigned __int8 v60;
  uint64_t v61;
  objc_super v62;

  v1 = v0;
  v62.receiver = v0;
  v62.super_class = (Class)type metadata accessor for EKEventEditViewControllerOOPImpl();
  v2 = objc_msgSendSuper2(&v62, sel_viewDidLoad);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = (void *)(*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))(v2);
  if (v4)
  {
    v5 = v4;
    v6 = v4;
LABEL_3:
    v7 = v4;
    v8 = objc_msgSend(v5, sel_insertedObjectIDs);
    if (v8)
    {
      v9 = v8;
      sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
      sub_1AF9DAC9C();
      v10 = sub_1AF9F7CC8();

    }
    else
    {
      v10 = 0;
    }
    *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitInsertedObjectIDs) = v10;
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v5, sel_updatedObjectIDs);
    if (v13)
    {
      v14 = v13;
      sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
      sub_1AF9DAC9C();
      v15 = sub_1AF9F7CC8();

    }
    else
    {
      v15 = 0;
    }
    *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs) = v15;
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v5, sel_deletedObjectIDs);
    if (v16)
    {
      v17 = v16;
      sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
      sub_1AF9DAC9C();
      v18 = sub_1AF9F7CC8();

    }
    else
    {
      v18 = 0;
    }
    *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs) = v18;

    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v11 = (void *)(*(uint64_t (**)(void))((*v3 & *v0) + 0x168))();
  if (!v11)
  {
    v6 = 0;
    goto LABEL_16;
  }
  v12 = v11;
  v6 = objc_msgSend(v11, sel_eventStore);

  if (v6)
  {
    v5 = v6;
    v4 = 0;
    goto LABEL_3;
  }
LABEL_16:
  v19 = *(id *)((char *)v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostViewModel);
  v20 = sub_1AF9E1C84((uint64_t)v54);
  v21 = (*(uint64_t (**)(double))((*v3 & *v1) + 0x168))(v20);
  sub_1AF9D53B0(v21);
  v53 = v6;
  sub_1AF9E2C10((uint64_t)v6);
  v22 = (void *)(*(uint64_t (**)(void))((*v3 & *v1) + 0x1B8))();
  sub_1AF9E307C(v22);
  v23 = (void *)v54[1];
  v43 = v54[0];
  v24 = v54[2];
  v25 = v54[3];
  v27 = v54[4];
  v26 = v54[5];
  v28 = v54[6];
  v29 = v55;
  v38 = v56;
  v39 = v54[7];
  v40 = v57;
  v30 = v59;
  v36 = v60;
  v37 = v58;
  v31 = (char *)v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView;
  v34 = v55;
  v35 = v61;
  swift_beginAccess();
  v51 = (void *)*((_QWORD *)v31 + 1);
  v52 = *(_QWORD *)v31;
  v49 = *((_QWORD *)v31 + 3);
  v50 = *((_QWORD *)v31 + 2);
  v47 = *((_QWORD *)v31 + 5);
  v48 = *((_QWORD *)v31 + 4);
  v45 = *((_QWORD *)v31 + 7);
  v46 = *((_QWORD *)v31 + 6);
  v42 = *((_OWORD *)v31 + 4);
  *(_QWORD *)v31 = v43;
  *((_QWORD *)v31 + 1) = v23;
  *((_QWORD *)v31 + 2) = v24;
  *((_QWORD *)v31 + 3) = v25;
  *((_QWORD *)v31 + 4) = v27;
  *((_QWORD *)v31 + 5) = v26;
  *((_QWORD *)v31 + 6) = v28;
  *((_QWORD *)v31 + 7) = v39;
  *((_QWORD *)v31 + 8) = v29;
  *((_QWORD *)v31 + 9) = v38;
  *((_QWORD *)v31 + 10) = v40;
  *((_QWORD *)v31 + 11) = v37;
  *((_QWORD *)v31 + 12) = v30;
  *((_QWORD *)v31 + 13) = v36;
  *((_QWORD *)v31 + 14) = v35;
  v41 = v23;
  sub_1AF9C09CC(v24);
  sub_1AF9C09CC(v27);
  sub_1AF9C09CC(v28);
  swift_bridgeObjectRetain();
  v44 = v34;
  v32 = v38;
  v33 = sub_1AF9DFE0C(v52, v51, v50, v49, v48, v47, v46, v45, (void *)v42, *((void **)&v42 + 1));
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x138))(v33);

  sub_1AF9C09DC(v24);
  sub_1AF9C09DC(v27);
  sub_1AF9C09DC(v28);
  swift_bridgeObjectRelease();

}

void sub_1AF9DD134()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  _QWORD *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void (*v30)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  __int128 v87;
  id v88;
  char v89;
  char v90;
  void *v91;
  id v92[2];
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  void (*v109)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  char v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  char v133;
  uint64_t v134;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView);
  swift_beginAccess();
  v2 = (void *)v1[1];
  if (!v2)
    goto LABEL_31;
  v103 = v1[2];
  v3 = v1[5];
  v101 = v1[4];
  v102 = v1[3];
  v94 = v1[7];
  v95 = v1[6];
  v4 = (void *)v1[8];
  v5 = (void *)v1[9];
  v7 = v1[10];
  v6 = v1[11];
  v8 = v1[12];
  v9 = v1[13];
  v10 = v1[14];
  v120 = *v1;
  v104 = v120;
  v121 = v2;
  v122 = v103;
  v123 = v102;
  v124 = v101;
  v125 = v3;
  v100 = v3;
  v126 = v95;
  v127 = v94;
  v128 = v4;
  v129 = v5;
  v98 = v5;
  v90 = v7 & 1;
  v130 = v7 & 1;
  v131 = v6;
  v132 = v8;
  v106 = v8;
  v89 = v9 & 1;
  v133 = v9 & 1;
  v134 = v10;
  v91 = (void *)objc_opt_self();
  sub_1AF9DFEA0(v120, v2, v103, v102, v101, v3, v95, v94, v4, v5);
  v96 = v10;
  v97 = v6;
  v11 = v5;
  sub_1AF9DFEA0(v120, v2, v103, v102, v101, v3, v95, v94, v4, v5);
  v88 = v2;
  sub_1AF9C09CC(v95);
  swift_bridgeObjectRetain();
  v85 = v4;
  v84 = v5;
  v12 = objc_msgSend(v91, sel_shared);
  v13 = sub_1AF9D3D88();
  v14 = objc_msgSend(v12, sel_layoutDirectionOrOverride);
  v15 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v13) + 0x108))(v14);

  v16 = sub_1AF9D3D88();
  (*(void (**)(id))((*v15 & *v16) + 0x120))(objc_msgSend(v12, sel_preferredContentSizeCategoryOrOverride));

  v83 = v12;
  v17 = objc_msgSend(v12, sel_viewHierarchyOrOverride);
  v18 = objc_msgSend(v99, sel_view);
  if (!v18)
  {
    __break(1u);
    goto LABEL_18;
  }
  v19 = v18;
  objc_msgSend(v18, sel_bounds);
  v21 = v20;
  v23 = v22;

  v86 = (id)objc_opt_self();
  v24 = objc_msgSend(v86, sel_systemBlueColor);
  v25 = sub_1AF9D3D88();
  sub_1AF9DFE0C(v120, v2, v103, v102, v101, v100, v95, v94, v4, v11);
  v26 = objc_msgSend(v17, sel_ekui_verticalSizeClass);
  v27 = objc_msgSend(v17, sel_ekui_horizontalSizeClass);
  v28 = objc_msgSend(v17, sel_ekui_interfaceOrientation);
  v29 = v24;
  objc_msgSend(v17, sel_ekui_affineTransform);
  *(_OWORD *)v92 = v107;
  v87 = v108;
  v30 = v109;
  v31 = v110;
  v32 = objc_allocWithZone((Class)EKUIViewHierarchyFromComponents);
  v107 = *(_OWORD *)v92;
  v108 = v87;
  v109 = v30;
  v110 = v31;
  v33 = objc_msgSend(v32, sel_initWithSize_verticalSizeClass_horizontalSizeClass_interfaceOrientation_tintColor_affineTranform_, v26, v27, v28, v29, &v107, v21, v23);
  v93 = v29;

  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v25) + 0x138))(v33);
  v34 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1AF9C09DC(v101);
  v35 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1AF9C09DC(v103);
  v36 = v88;
  sub_1AF9C09CC((uint64_t)sub_1AF9E0010);
  sub_1AF9C09CC((uint64_t)sub_1AF9DFF64);
  sub_1AF9C09CC(v95);
  sub_1AF9C09DC(v95);

  swift_release();
  swift_release();
  *(_QWORD *)&v107 = v104;
  *((_QWORD *)&v107 + 1) = v36;
  v105 = v36;
  *(_QWORD *)&v108 = sub_1AF9E0010;
  *((_QWORD *)&v108 + 1) = v35;
  v109 = sub_1AF9DFF64;
  v110 = v34;
  v111 = v95;
  v112 = v94;
  v113 = v4;
  v114 = v98;
  v115 = v90;
  v116 = v97;
  v117 = v106;
  v118 = v89;
  v119 = v96;
  v37 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C008));
  v38 = (void *)sub_1AF9F7A1C();
  objc_msgSend(v99, sel_addChildViewController_, v38);
  v39 = objc_msgSend(v38, sel_view);
  if (!v39)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v40 = v39;
  objc_msgSend(v39, sel_setInsetsLayoutMarginsFromSafeArea_, 0);

  v41 = objc_msgSend(v38, sel_view);
  if (!v41)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v42 = v41;
  v43 = objc_msgSend(v86, sel_systemGroupedBackgroundColor);
  objc_msgSend(v42, sel_setBackgroundColor_, v43);

  v44 = objc_msgSend(v99, sel_view);
  if (!v44)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v45 = v44;
  v46 = objc_msgSend(v38, sel_view);
  if (!v46)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v47 = v46;
  objc_msgSend(v45, sel_addSubview_, v46);

  objc_msgSend(v38, sel_didMoveToParentViewController_, v99);
  v48 = *(void **)&v99[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostingController];
  *(_QWORD *)&v99[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostingController] = v38;
  v49 = v38;

  v50 = objc_msgSend(v49, sel_view);
  if (!v50)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v51 = v50;
  objc_msgSend(v50, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BB30);
  v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_1AFA14080;
  v53 = objc_msgSend(v49, sel_view);
  if (!v53)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v54 = v53;
  v55 = objc_msgSend(v53, sel_leadingAnchor);

  v56 = objc_msgSend(v99, sel_view);
  if (!v56)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v57 = v56;
  v58 = objc_msgSend(v56, sel_leadingAnchor);

  v59 = objc_msgSend(v55, sel_constraintEqualToAnchor_, v58);
  *(_QWORD *)(v52 + 32) = v59;
  v60 = objc_msgSend(v49, sel_view);
  if (!v60)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v61 = v60;
  v62 = objc_msgSend(v60, sel_topAnchor);

  v63 = objc_msgSend(v99, sel_view);
  if (!v63)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v64 = v63;
  v65 = objc_msgSend(v63, sel_topAnchor);

  v66 = objc_msgSend(v62, sel_constraintEqualToAnchor_, v65);
  *(_QWORD *)(v52 + 40) = v66;
  v67 = objc_msgSend(v49, sel_view);
  if (!v67)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v68 = v67;
  v69 = objc_msgSend(v67, sel_trailingAnchor);

  v70 = objc_msgSend(v99, sel_view);
  if (!v70)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v71 = v70;
  v72 = objc_msgSend(v70, sel_trailingAnchor);

  v73 = objc_msgSend(v69, sel_constraintEqualToAnchor_, v72);
  *(_QWORD *)(v52 + 48) = v73;
  v74 = objc_msgSend(v49, sel_view);
  if (v74)
  {
    v75 = v74;
    v76 = objc_msgSend(v74, sel_bottomAnchor);

    v77 = objc_msgSend(v99, sel_view);
    if (v77)
    {
      v78 = v77;
      v79 = (void *)objc_opt_self();
      v80 = objc_msgSend(v78, sel_bottomAnchor);

      v81 = objc_msgSend(v76, sel_constraintEqualToAnchor_, v80);
      *(_QWORD *)(v52 + 56) = v81;
      *(_QWORD *)&v107 = v52;
      sub_1AF9F7C44();
      sub_1AF9C6B78(0, &qword_1EEE6C470);
      v82 = (void *)sub_1AF9F7C20();
      swift_bridgeObjectRelease();
      objc_msgSend(v79, sel_activateConstraints_, v82);

      swift_unknownObjectRelease();
      sub_1AF9C09DC((uint64_t)sub_1AF9E0010);
      sub_1AF9C09DC((uint64_t)sub_1AF9DFF64);
      sub_1AF9C09DC(v95);
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_30;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  sub_1AF9F7EF0();
  __break(1u);
}

void sub_1AF9DDC14(uint64_t a1, unint64_t a2)
{
  void *v2;
  os_log_type_t v5;
  os_log_t *v6;
  os_log_t v7;
  NSObject *v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = sub_1AF9F7CF8();
  v6 = (os_log_t *)sub_1AF9CFC38();
  v7 = *v6;
  if (os_log_type_enabled(*v6, v5))
  {
    swift_bridgeObjectRetain_n();
    v8 = v7;
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v17 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    v16 = sub_1AF9C4DD4(a1, a2, &v17);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AF84D000, v8, v5, "EKEventEditViewControllerOOPImpl: Received remoteEventEditViewControllerRequestPresentView on the host app side. viewName: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v10, -1, -1);
    MEMORY[0x1B5DFEE1C](v9, -1, -1);

  }
  v11 = objc_msgSend(v2, sel_parentViewController, v16, v17);
  if (!v11
    || (v12 = v11,
        v13 = objc_msgSend(v11, sel_parentViewController),
        v12,
        !v13)
    || (objc_opt_self(), v14 = swift_dynamicCastObjCClass(), v13, !v14))
  {
    sub_1AF9F7CEC();
    v15 = *v6;
    sub_1AF9F7974();

  }
}

void sub_1AF9DDE18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t *v15;
  id v16;
  _QWORD *v17;
  id v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  void (*v41)(_QWORD);
  id v42;
  uint64_t (*v43)();
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  os_log_type_t v49;
  NSObject *v50;
  _QWORD *v51;
  _QWORD *v52;
  NSObject *v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  unsigned __int8 v68;
  _QWORD *v69;
  void *v70;
  id v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  os_log_type_t v79;
  NSObject *v80;
  _QWORD *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  id v92;
  uint64_t (*v93)();
  uint64_t v94;
  id v95;
  void *v96;
  void *v97;
  uint64_t v98;
  id v99;
  void *v100;
  uint64_t v101;
  NSObject *loga;
  id v106;
  uint64_t aBlock[7];

  v9 = v8;
  aBlock[6] = *MEMORY[0x1E0C80C00];
  sub_1AF9F7CF8();
  v15 = sub_1AF9CFC38();
  v16 = (id)*v15;
  sub_1AF9F7974();

  v17 = v9;
  v18 = objc_msgSend(v9, sel_parentViewController);
  if (!v18)
    goto LABEL_18;
  v19 = v18;
  v106 = objc_msgSend(v18, sel_parentViewController);

  if (!v106)
    goto LABEL_18;
  objc_opt_self();
  v20 = swift_dynamicCastObjCClass();
  if (!v20)
  {

LABEL_18:
    sub_1AF9F7CEC();
    v106 = (id)*v15;
    sub_1AF9F7974();
LABEL_19:

    return;
  }
  v101 = a1;
  v98 = v20;
  v21 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v22 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v9) + 0x150))();
  v23 = (void *)v22;
  if (v22)
  {
    v99 = (id)v22;
    v24 = (id)v22;
    goto LABEL_6;
  }
  v38 = (void *)(*(uint64_t (**)(void))((*v21 & *v9) + 0x168))();
  if (!v38
    || (v39 = v38, v24 = objc_msgSend(v38, sel_eventStore), v39, !v24))
  {
    sub_1AF9F7CF8();
    v46 = (id)*v15;
    sub_1AF9F7974();

    v47 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v9) + 0x180))();
    if (v47)
    {
      objc_msgSend(v47, sel_eventEditViewController_didCompleteWithAction_, v98, v101);
      swift_unknownObjectRelease();
    }
    goto LABEL_19;
  }
  v99 = v24;
LABEL_6:
  v100 = v24;
  if (v101 != 2)
  {
    if (v101 == 1)
    {
      if (a2)
      {
        v25 = (*(uint64_t (**)(void *))((*MEMORY[0x1E0DEEDD8] & *v9) + 0x168))(v23);
        if (v25)
        {
          v26 = (void *)v25;
          if (a4 && a5 && a6)
          {
            sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
            sub_1AF9DAC9C();
            v27 = v26;
            v96 = (void *)sub_1AF9F7BB4();
            v28 = (void *)sub_1AF9F7BB4();
            v29 = (void *)sub_1AF9F7BB4();
            v30 = (void *)sub_1AF9F7BB4();
            v31 = v99;
            v32 = objc_msgSend(v99, sel_redactedMimicSaveEvent_oldToNewObjectIDMap_serializedDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_, v27, v96, v28, v29, v30);

            v97 = v32;
            if (!v32)
            {
LABEL_89:

              __break(1u);
              goto LABEL_90;
            }

            if (a8 >> 60 != 15)
            {
              v33 = objc_allocWithZone(MEMORY[0x1E0CAA148]);
              v34 = v97;
              sub_1AF9E0134(a7, a8);
              v35 = (void *)sub_1AF9F78A8();
              v36 = objc_msgSend(v33, sel_initWithData_, v35);

              if (v36)
              {
                v37 = objc_msgSend(v34, sel_CADObjectID);

                objc_msgSend(v99, sel_cacheConstraints_forObjectWithCADObjectID_, v36, v37);
                sub_1AF9E018C(a7, a8);
                v97 = v34;
                goto LABEL_84;
              }

              sub_1AF9E018C(a7, a8);
            }
            sub_1AF9F7CEC();
            v92 = (id)*v15;
            sub_1AF9F7974();

            goto LABEL_84;
          }
          v97 = (void *)v25;
          v72 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitInsertedObjectIDs;
          if (*(_QWORD *)((char *)v9
                         + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitInsertedObjectIDs)
            && *(_QWORD *)((char *)v9
                         + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs)
            && *(_QWORD *)((char *)v9
                         + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs))
          {
            sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
            sub_1AF9DAC9C();
            v73 = v97;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v74 = (void *)sub_1AF9F7BB4();
            v75 = (void *)sub_1AF9F7CB0();
            swift_bridgeObjectRelease();
            v76 = (void *)sub_1AF9F7CB0();
            swift_bridgeObjectRelease();
            v77 = (void *)sub_1AF9F7CB0();
            swift_bridgeObjectRelease();
            v31 = v99;
            v78 = objc_msgSend(v99, sel_mimicSaveAndCommitEvent_oldToNewObjectIDMap_insertedObjectIDs_updatedObjectIDs_deletedObjectIDs_, v73, v74, v75, v76, v77);

            v40 = (_QWORD *)MEMORY[0x1E0DEEDD8];
            v97 = v78;
            if (!v78)
            {
LABEL_90:

              __break(1u);
              return;
            }

            goto LABEL_85;
          }
          v79 = sub_1AF9F7CEC();
          v80 = *v15;
          v81 = v9;
          if (os_log_type_enabled(v80, v79))
          {
            v82 = v81;
            loga = v80;
            v83 = swift_slowAlloc();
            v84 = swift_slowAlloc();
            aBlock[0] = v84;
            v85 = *(_QWORD *)((char *)v9 + v72);
            *(_DWORD *)v83 = 136315650;
            if (v85)
              v86 = 20302;
            else
              v86 = 5457241;
            if (v85)
              v87 = 0xE200000000000000;
            else
              v87 = 0xE300000000000000;
            sub_1AF9C4DD4(v86, v87, aBlock);
            sub_1AF9F7D94();

            swift_bridgeObjectRelease();
            *(_WORD *)(v83 + 12) = 2080;
            if (*(_QWORD *)&v82[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs])
              v88 = 20302;
            else
              v88 = 5457241;
            if (*(_QWORD *)&v82[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs])
              v89 = 0xE200000000000000;
            else
              v89 = 0xE300000000000000;
            sub_1AF9C4DD4(v88, v89, aBlock);
            sub_1AF9F7D94();

            swift_bridgeObjectRelease();
            *(_WORD *)(v83 + 22) = 2080;
            if (*(_QWORD *)&v82[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs])
              v90 = 20302;
            else
              v90 = 5457241;
            if (*(_QWORD *)&v82[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs])
              v91 = 0xE200000000000000;
            else
              v91 = 0xE300000000000000;
            sub_1AF9C4DD4(v90, v91, aBlock);
            sub_1AF9F7D94();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1AF84D000, loga, v79, "EKEventEditViewControllerOOPImpl remoteEventEditViewControllerDidComplete: some or all preCommit ObjectIDs are nil. nil states: [%s, %s, %s]", (uint8_t *)v83, 0x20u);
            swift_arrayDestroy();
            MEMORY[0x1B5DFEE1C](v84, -1, -1);
            MEMORY[0x1B5DFEE1C](v83, -1, -1);

          }
          else
          {

          }
          v31 = v99;
LABEL_84:
          v40 = (_QWORD *)MEMORY[0x1E0DEEDD8];
LABEL_85:
          v93 = sub_1AF9DCA50();
          if (*(_QWORD *)(v94 + 8))
          {
            v95 = v97;
            sub_1AF9D53B0((uint64_t)v97);
            ((void (*)(uint64_t *, _QWORD))v93)(aBlock, 0);

          }
          else
          {
            ((void (*)(uint64_t *, _QWORD))v93)(aBlock, 0);

          }
          goto LABEL_35;
        }
      }
      else
      {
        v48 = v23;
      }
      v49 = sub_1AF9F7CF8();
      v50 = *v15;
      v51 = v9;
      if (os_log_type_enabled(v50, v49))
      {
        v52 = v51;
        v53 = v50;
        v54 = swift_slowAlloc();
        v55 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v54 = 138412546;
        aBlock[0] = (uint64_t)v52;
        v56 = v52;
        sub_1AF9F7D94();
        *v55 = v52;

        *(_WORD *)(v54 + 12) = 2112;
        v40 = (_QWORD *)MEMORY[0x1E0DEEDD8];
        v57 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v56) + 0x168))();
        v58 = v57;
        if (v57)
          aBlock[0] = v57;
        else
          aBlock[0] = 0;
        sub_1AF9F7D94();
        v55[1] = v58;

        _os_log_impl(&dword_1AF84D000, v53, v49, "EKEventEditViewControllerOOPImpl: vc might have disappeared after the waiting for the database update. self: %@, event: %@", (uint8_t *)v54, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE60);
        swift_arrayDestroy();
        MEMORY[0x1B5DFEE1C](v55, -1, -1);
        MEMORY[0x1B5DFEE1C](v54, -1, -1);

        v31 = v99;
        goto LABEL_35;
      }

    }
    else
    {
      v45 = v23;
    }
    v31 = v99;
    v40 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    goto LABEL_35;
  }
  v40 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v41 = *(void (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & *v17) + 0x170);
  v42 = v23;
  v41(0);
  v43 = sub_1AF9DCA50();
  if (*(_QWORD *)(v44 + 8))
    sub_1AF9D53B0(0);
  v45 = (id)((uint64_t (*)(uint64_t *, _QWORD))v43)(aBlock, 0);
  v31 = v99;
LABEL_35:
  v59 = (void *)(*(uint64_t (**)(id))((*v40 & *v17) + 0x180))(v45);
  if (v59)
  {
    v60 = v59;
    if ((objc_msgSend(v59, sel_respondsToSelector_, sel_eventEditViewController_didCompleteWithAction_waitUntil_) & 1) != 0)
    {
      if ((objc_msgSend(v60, sel_respondsToSelector_, sel_eventEditViewController_didCompleteWithAction_waitUntil_) & 1) != 0)
      {
        v61 = v106;
        objc_msgSend(v60, sel_eventEditViewController_didCompleteWithAction_waitUntil_, v98, v101, a3);

        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
      }
      goto LABEL_56;
    }
    v62 = (void *)(*(uint64_t (**)(void))((*v40 & *v17) + 0x168))();
    if (!v62)
      goto LABEL_54;
    v63 = v62;
    v64 = objc_msgSend(v62, sel_calendar);
    if (!v64)
    {
      v65 = v63;
      goto LABEL_53;
    }
    v65 = v64;
    if (objc_msgSend((id)objc_opt_self(), sel_realAuthorizationStatusForEntityType_, 0) != (id)3)
    {
LABEL_46:

LABEL_53:
LABEL_54:
      objc_msgSend(v60, sel_eventEditViewController_didCompleteWithAction_, v98, v101);
      swift_unknownObjectRelease();
      goto LABEL_55;
    }
    v66 = objc_msgSend(v65, sel_source);
    if (v66)
    {
      v67 = v66;
      v68 = objc_msgSend(v66, sel_isReadable);

      if ((v68 & 1) != 0)
      {
        v69 = (_QWORD *)swift_allocObject();
        v69[2] = v60;
        v69[3] = v98;
        v69[4] = v101;
        aBlock[4] = (uint64_t)sub_1AF9E0108;
        aBlock[5] = (uint64_t)v69;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1AF9C3D10;
        aBlock[3] = (uint64_t)&block_descriptor_1;
        v70 = _Block_copy(aBlock);
        v71 = v106;
        swift_unknownObjectRetain();
        swift_release();
        objc_msgSend(v31, sel_waitUntilDatabaseUpdatedToTimestamp_callback_, a3, v70);

        _Block_release(v70);
        swift_unknownObjectRelease();

        return;
      }
      goto LABEL_46;
    }

    __break(1u);
    goto LABEL_89;
  }
LABEL_55:

LABEL_56:
}

void *sub_1AF9DEB74()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9DEC18(void *a1)
{
  sub_1AF9E01E4(a1, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore, (void (*)(void *))sub_1AF9E2C10);

}

uint64_t sub_1AF9DEC4C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x150))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9DEC8C(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x158);
  v4 = *a1;
  return v3(v2);
}

void (*sub_1AF9DECD8(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9DED30;
}

void sub_1AF9DED30(_QWORD **a1, char a2)
{
  sub_1AF9DF51C(a1, a2, (void (*)(void *))sub_1AF9E2C10);
}

void *sub_1AF9DED48()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9DEDEC(void *a1)
{
  sub_1AF9E01E4(a1, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event, (void (*)(void *))sub_1AF9D53B0);

}

uint64_t sub_1AF9DEE20@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x168))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9DEE60(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x170);
  v4 = *a1;
  return v3(v2);
}

void (*sub_1AF9DEEAC(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9DEF04;
}

void sub_1AF9DEF04(_QWORD **a1, char a2)
{
  sub_1AF9DF51C(a1, a2, (void (*)(void *))sub_1AF9D53B0);
}

uint64_t sub_1AF9DEF58()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_1AF9DF004(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editViewDelegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_1AF9DF054@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x180))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9DF094(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x188);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1AF9DF0D4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1AF9DF118()
{
  return sub_1AF9DF8D0((void (*)(void *))sub_1AF9E2C74);
}

void *sub_1AF9DF13C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9DF1E0(void *a1)
{
  sub_1AF9E01E4(a1, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar, sub_1AF9E2EB0);

}

uint64_t sub_1AF9DF214@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1A0))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9DF254(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1A8);
  v4 = *a1;
  return v3(v2);
}

void (*sub_1AF9DF2A0(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9DF2F8;
}

void sub_1AF9DF2F8(_QWORD **a1, char a2)
{
  sub_1AF9DF51C(a1, a2, sub_1AF9E2EB0);
}

id sub_1AF9DF310(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id *v3;

  v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *sub_1AF9DF354()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9DF3F8(void *a1)
{
  sub_1AF9E01E4(a1, &OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor, sub_1AF9E307C);

}

uint64_t sub_1AF9DF42C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1B8))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9DF46C(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1C0);
  v4 = *a1;
  return v3(v2);
}

void (*sub_1AF9DF4B8(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9DF510;
}

void sub_1AF9DF510(_QWORD **a1, char a2)
{
  sub_1AF9DF51C(a1, a2, sub_1AF9E307C);
}

void sub_1AF9DF51C(_QWORD **a1, char a2, void (*a3)(void *))
{
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t v7;
  void **v8;
  void *v9;
  id v10;

  v5 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v6 = sub_1AF9DCA50();
    if (*(_QWORD *)(v7 + 8))
    {
      v8 = (void **)(v5[7] + v5[8]);
      swift_beginAccess();
      v9 = *v8;
      v10 = v9;
      a3(v9);
    }
    ((void (*)(_QWORD *, _QWORD))v6)(v5, 0);
  }
  free(v5);
}

uint64_t sub_1AF9DF5B4()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  char v13;
  uint64_t v15;
  uint64_t v16;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView);
  swift_beginAccess();
  v2 = (void *)v1[1];
  if (v2)
  {
    v3 = (void *)v1[9];
    v4 = (void *)v1[8];
    v6 = v1[5];
    v5 = v1[6];
    v8 = v1[3];
    v7 = v1[4];
    v9 = v1[2];
    v16 = *v1;
    v15 = v1[7];
    v10 = v2;
    sub_1AF9C09CC(v9);
    sub_1AF9C09CC(v7);
    sub_1AF9C09CC(v5);
    swift_bridgeObjectRetain();
    v11 = v4;
    v12 = v3;
    v13 = sub_1AF9E30C4();
    sub_1AF9DFE0C(v16, v2, v9, v8, v7, v6, v5, v15, v4, v3);
  }
  else
  {
    v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_1AF9DF894()
{
  return sub_1AF9DF8D0((void (*)(void *))sub_1AF9E3118);
}

uint64_t sub_1AF9DF8AC()
{
  return sub_1AF9DF8D0((void (*)(void *))sub_1AF9E3188);
}

uint64_t sub_1AF9DF8C4()
{
  return sub_1AF9DF8D0((void (*)(void *))sub_1AF9E31F8);
}

uint64_t sub_1AF9DF8D0(void (*a1)(void *))
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t result;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void (*v16)(void *);
  uint64_t v17;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView);
  result = swift_beginAccess();
  v5 = (void *)v3[1];
  if (v5)
  {
    v6 = (void *)v3[9];
    v16 = a1;
    v7 = (void *)v3[8];
    v9 = v3[5];
    v8 = v3[6];
    v11 = v3[3];
    v10 = v3[4];
    v12 = v3[2];
    v17 = *v3;
    v13 = v3[7];
    v14 = v5;
    sub_1AF9C09CC(v12);
    sub_1AF9C09CC(v10);
    sub_1AF9C09CC(v8);
    swift_bridgeObjectRetain();
    v15 = v7;
    v16(v6);
    return sub_1AF9DFE0C(v17, v5, v12, v11, v10, v9, v8, v13, v7, v6);
  }
  return result;
}

void sub_1AF9DFA30(char *a1, uint64_t a2, void (*a3)(id))
{
  uint64_t *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(id);

  v5 = (uint64_t *)&a1[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView];
  swift_beginAccess();
  v6 = (void *)v5[1];
  if (v6)
  {
    v18 = a3;
    v7 = (void *)v5[9];
    v9 = v5[7];
    v8 = (void *)v5[8];
    v15 = v5[5];
    v16 = v5[6];
    v13 = v5[3];
    v14 = v5[4];
    v11 = *v5;
    v12 = v5[2];
    v17 = a1;
    v10 = sub_1AF9DFEA0(v11, v6, v12, v13, v14, v15, v16, v9, v8, v7);
    v18(v10);
    sub_1AF9DFE0C(v11, v6, v12, v13, v14, v15, v16, v9, v8, v7);

  }
}

id EKEventEditViewControllerOOPImpl.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventEditViewControllerOOPImpl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

_QWORD *sub_1AF9DFCDC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1AF9DFCEC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_1AF9DFCF8()
{
  char *v0;
  char *v1;
  uint64_t v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostingController] = 0;
  v1 = &v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostView];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_OWORD *)v1 + 5) = 0u;
  *((_OWORD *)v1 + 6) = 0u;
  *((_QWORD *)v1 + 14) = 0;
  v2 = OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_hostViewModel;
  type metadata accessor for EKEventEditOOPHostViewModel();
  *(_QWORD *)&v0[v2] = sub_1AF9E18D0();
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitInsertedObjectIDs] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitUpdatedObjectIDs] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_preCommitDeletedObjectIDs] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_eventStore] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_event] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editViewDelegate] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_defaultCalendar] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI32EKEventEditViewControllerOOPImpl_editorBackgroundColor] = 0;

  sub_1AF9F7EF0();
  __break(1u);
}

uint64_t sub_1AF9DFE0C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  uint64_t result;

  if (a2)
  {

    sub_1AF9C09DC(a3);
    sub_1AF9C09DC(a5);
    sub_1AF9C09DC(a7);

    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_1AF9DFEA0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  id v13;
  id v14;
  id result;

  if (a2)
  {
    v13 = a2;
    sub_1AF9C09CC(a3);
    sub_1AF9C09CC(a5);
    sub_1AF9C09CC(a7);
    swift_bridgeObjectRetain();
    v14 = a9;
    return a10;
  }
  return result;
}

uint64_t sub_1AF9DFF40()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AF9DFF64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  void *v12;

  swift_beginAccess();
  v11 = (_QWORD *)MEMORY[0x1B5DFEE88](v5 + 16);
  if (v11)
  {
    v12 = v11;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v11) + 0x140))(a1, a2, a3, a4, a5);

  }
}

void sub_1AF9E0010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v17;
  void *v18;

  swift_beginAccess();
  v17 = (_QWORD *)MEMORY[0x1B5DFEE88](v8 + 16);
  if (v17)
  {
    v18 = v17;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v17) + 0x148))(a1, a2, a3, a4, a5, a6, a7, a8);

  }
}

uint64_t sub_1AF9E00DC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

id sub_1AF9E0108()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_eventEditViewController_didCompleteWithAction_, *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
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

uint64_t sub_1AF9E0134(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1AF9E0148(a1, a2);
  return a1;
}

uint64_t sub_1AF9E0148(uint64_t a1, unint64_t a2)
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

uint64_t sub_1AF9E018C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1AF9E01A0(a1, a2);
  return a1;
}

uint64_t sub_1AF9E01A0(uint64_t a1, unint64_t a2)
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

uint64_t sub_1AF9E01E4(void *a1, _QWORD *a2, void (*a3)(void *))
{
  uint64_t v3;
  void **v6;
  void *v7;
  id v8;
  uint64_t (*v9)();
  uint64_t v10;
  void *v11;
  id v12;
  _BYTE v14[32];

  v6 = (void **)(v3 + *a2);
  swift_beginAccess();
  v7 = *v6;
  *v6 = a1;
  v8 = a1;

  v9 = sub_1AF9DCA50();
  if (*(_QWORD *)(v10 + 8))
  {
    swift_beginAccess();
    v11 = *v6;
    v12 = v11;
    a3(v11);
  }
  return ((uint64_t (*)(_BYTE *, _QWORD))v9)(v14, 0);
}

uint64_t method lookup function for EKEventEditViewControllerOOPImpl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.eventStore.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.eventStore.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.eventStore.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.event.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.event.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.event.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editViewDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editViewDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editViewDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.cancelEditing()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.defaultCalendar.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.defaultCalendar.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.defaultCalendar.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editorBackgroundColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editorBackgroundColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.editorBackgroundColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.hasUnsavedChanges()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.focusAndSelectTitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.focusAndSelectStartDate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of EKEventEditViewControllerOOPImpl.focusTitle()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E8))();
}

uint64_t sub_1AF9E04CC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel_remoteUIConfigured);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9E0510(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel_remoteUIConfigured);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9E0558())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1AF9E059C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AF9F79BC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF9E060C@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x80))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9E064C(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x88);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1AF9E068C()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_1AF9F79C8();
}

void (*sub_1AF9E06F4(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9E076C;
}

uint64_t sub_1AF9E0770()
{
  return sub_1AF9E0A50((uint64_t)&OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__configuration, &qword_1EEE6C1F8);
}

uint64_t sub_1AF9E0784(uint64_t a1)
{
  return sub_1AF9E0AD0(a1, &qword_1EEE6C200, (uint64_t)&OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__configuration, &qword_1EEE6C1F8);
}

void (*sub_1AF9E07A0(_QWORD *a1))(uint64_t, char)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C200);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__configuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C1F8);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9E0868;
}

uint64_t sub_1AF9E086C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AF9F79BC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF9E08DC@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xB0))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9E091C(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xB8);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1AF9E095C()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_1AF9F79C8();
}

void (*sub_1AF9E09C4(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9E076C;
}

uint64_t sub_1AF9E0A3C()
{
  return sub_1AF9E0A50((uint64_t)&OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__backgroundColor, &qword_1EEE6C208);
}

uint64_t sub_1AF9E0A50(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_1AF9F7998();
  return swift_endAccess();
}

uint64_t sub_1AF9E0AB4(uint64_t a1)
{
  return sub_1AF9E0AD0(a1, &qword_1EEE6C210, (uint64_t)&OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__backgroundColor, &qword_1EEE6C208);
}

uint64_t sub_1AF9E0AD0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_1AF9F79A4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

void (*sub_1AF9E0BA8(_QWORD *a1))(uint64_t, char)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C210);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel__backgroundColor;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C208);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9E0868;
}

id sub_1AF9E0C70(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_1AF9E0CB0(a1, a2);
}

id sub_1AF9E0CB0(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  _BYTE *v5;
  id v6;
  uint64_t v7;
  objc_super v9;
  uint64_t v10;

  v2[OBJC_IVAR____TtC10EventKitUI36EKEventGenericDetailOOPHostViewModel_remoteUIConfigured] = 0;
  type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(0);
  v5 = v2;
  sub_1AF9C288C(a1, a2);
  swift_beginAccess();
  sub_1AF9F798C();
  swift_endAccess();
  v6 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  v7 = MEMORY[0x1B5DFD7E4](v6);
  swift_beginAccess();
  v10 = v7;
  sub_1AF9F798C();
  swift_endAccess();

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for EKEventGenericDetailOOPHostViewModel()
{
  uint64_t result;

  result = qword_1EEE6D410;
  if (!qword_1EEE6D410)
    return swift_getSingletonMetadata();
  return result;
}

id sub_1AF9E0E48()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AF9E0EEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for EKEventGenericDetailOOPHostViewModel();
  result = sub_1AF9F7980();
  *a1 = result;
  return result;
}

uint64_t sub_1AF9E0F28()
{
  return type metadata accessor for EKEventGenericDetailOOPHostViewModel();
}

void sub_1AF9E0F30()
{
  unint64_t v0;
  unint64_t v1;

  sub_1AF9E0FC4();
  if (v0 <= 0x3F)
  {
    sub_1AF9E1018();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_1AF9E0FC4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEE6C218)
  {
    type metadata accessor for _AppExtensionEventGenericDetailHostView.Configuration(255);
    v0 = sub_1AF9F79D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEE6C218);
  }
}

void sub_1AF9E1018()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEE6C220)
  {
    v0 = sub_1AF9F79D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEE6C220);
  }
}

uint64_t sub_1AF9E106C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_remoteUIConfigured);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9E10B0(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_remoteUIConfigured);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9E10F8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9E113C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AF9F79BC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF9E11AC@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xA0))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9E11EC(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xA8);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1AF9E122C()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_1AF9F79C8();
}

void (*sub_1AF9E1294(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9C2BC4;
}

uint64_t sub_1AF9E130C()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C230);
  sub_1AF9F7998();
  return swift_endAccess();
}

uint64_t sub_1AF9E136C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C238);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C230);
  sub_1AF9F79A4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1AF9E1440(_QWORD *a1))(uint64_t a1, char a2)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C238);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel__configuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C230);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9C2E0C;
}

void *sub_1AF9E1508()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_event);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9E1554(void *a1)
{
  sub_1AF9E1840(a1, &OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_event);
}

uint64_t (*sub_1AF9E1560())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9E15A4()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_eventStore);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9E15F0(void *a1)
{
  sub_1AF9E1840(a1, &OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_eventStore);
}

uint64_t (*sub_1AF9E15FC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1AF9E1640()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_layoutDirection;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1AF9E1684(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_layoutDirection);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9E16CC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AF9E1710()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  return *v1;
}

void sub_1AF9E1754(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9E17A4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9E17E8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_viewHierarchy);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9E1834(void *a1)
{
  sub_1AF9E1840(a1, &OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_viewHierarchy);
}

void sub_1AF9E1840(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

uint64_t (*sub_1AF9E188C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AF9E18D0()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_1AF9E18F0()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  void *v7;
  id v8;
  objc_class *v9;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C230);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_remoteUIConfigured] = 0;
  v5 = &v0[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel__configuration];
  type metadata accessor for _AppExtensionEventEditHostView.Configuration(0);
  v6 = v0;
  v13 = sub_1AF9E46A0();
  sub_1AF9F798C();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_event] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_eventStore] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_layoutDirection] = 0;
  v7 = (void *)*MEMORY[0x1E0DC4938];
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_sizeCategory] = *MEMORY[0x1E0DC4938];
  *(_QWORD *)&v6[OBJC_IVAR____TtC10EventKitUI27EKEventEditOOPHostViewModel_viewHierarchy] = 0;
  v8 = v7;

  v9 = (objc_class *)type metadata accessor for EKEventEditOOPHostViewModel();
  v12.receiver = v6;
  v12.super_class = v9;
  return objc_msgSendSuper2(&v12, sel_init);
}

uint64_t type metadata accessor for EKEventEditOOPHostViewModel()
{
  uint64_t result;

  result = qword_1EEE6D4C0;
  if (!qword_1EEE6D4C0)
    return swift_getSingletonMetadata();
  return result;
}

id sub_1AF9E1A88()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventEditOOPHostViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AF9E1B40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for EKEventEditOOPHostViewModel();
  result = sub_1AF9F7980();
  *a1 = result;
  return result;
}

uint64_t sub_1AF9E1B7C()
{
  return type metadata accessor for EKEventEditOOPHostViewModel();
}

void sub_1AF9E1B84()
{
  unint64_t v0;

  sub_1AF9E1C20();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_1AF9E1C20()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEE6C240)
  {
    type metadata accessor for _AppExtensionEventEditHostView.Configuration(255);
    v0 = sub_1AF9F79D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEE6C240);
  }
}

UIColor_optional __swiftcall UIViewController.EKUI_oopContentBackgroundColor()()
{
  objc_class *v0;
  UIColor_optional result;

  v0 = 0;
  result.value.super.isa = v0;
  return result;
}

id sub_1AF9E1C7C()
{
  return 0;
}

double sub_1AF9E1C84@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;

  type metadata accessor for EKEventEditOOPHostViewModel();
  sub_1AF9C212C(&qword_1EEE6C250, (uint64_t (*)(uint64_t))type metadata accessor for EKEventEditOOPHostViewModel, (uint64_t)&unk_1AFA14828);
  *(_QWORD *)a1 = sub_1AF9F79F8();
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 112) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_BYTE *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 104) = 0;
  return result;
}

uint64_t sub_1AF9E1D04@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(void);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void (*v26)(uint64_t (*)(), uint64_t);
  unsigned __int8 v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;

  v2 = (uint64_t)v1;
  v48 = a1;
  v44 = sub_1AF9F79EC();
  MEMORY[0x1E0C80A78](v44);
  v45 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1AF9F7CA4();
  v46 = *(_QWORD *)(v4 - 8);
  v47 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C258);
  MEMORY[0x1E0C80A78](v43);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = *v1;
  v9 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v49 + 1)) + 0xA0);
  v10 = *((id *)&v49 + 1);
  v9();
  sub_1AF9C0F90((uint64_t)&v49);
  type metadata accessor for _AppExtensionEventEditHostView.Configuration(0);
  sub_1AF9C212C(&qword_1EEE6C260, type metadata accessor for _AppExtensionEventEditHostView.Configuration, (uint64_t)&unk_1AFA14A78);
  v41 = sub_1AF9F79F8();
  v12 = v11;
  v13 = swift_allocObject();
  v14 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v13 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v13 + 96) = v14;
  *(_OWORD *)(v13 + 112) = *(_OWORD *)(v2 + 96);
  *(_QWORD *)(v13 + 128) = *(_QWORD *)(v2 + 112);
  v15 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v13 + 32) = v15;
  v16 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v13 + 64) = v16;
  v17 = swift_allocObject();
  v18 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v17 + 96) = v18;
  *(_OWORD *)(v17 + 112) = *(_OWORD *)(v2 + 96);
  *(_QWORD *)(v17 + 128) = *(_QWORD *)(v2 + 112);
  v19 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v17 + 32) = v19;
  v20 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v17 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v17 + 64) = v20;
  v21 = swift_allocObject();
  v22 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v21 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v21 + 64) = v22;
  v23 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v21 + 32) = v23;
  *(_QWORD *)(v21 + 128) = *(_QWORD *)(v2 + 112);
  v24 = *(_OWORD *)(v2 + 96);
  v25 = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v21 + 96) = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v21 + 112) = v24;
  *(_OWORD *)(v21 + 80) = v25;
  v26 = *(void (**)(uint64_t (*)(), uint64_t))(*(_QWORD *)v12 + 536);
  sub_1AF9E34C4(v2);
  sub_1AF9E34C4(v2);
  sub_1AF9E34C4(v2);
  swift_retain();
  swift_retain();
  v26(sub_1AF9E341C, v21);
  swift_retain();
  swift_release();
  v42 = v12;
  swift_release();
  swift_release();
  v27 = sub_1AF9F7AAC();
  v28 = sub_1AF9F7AB8();
  v29 = sub_1AF9F7AD0();
  v30 = sub_1AF9F7AC4();
  sub_1AF9F7AC4();
  if (sub_1AF9F7AC4() != v27)
    v30 = sub_1AF9F7AC4();
  sub_1AF9F7AC4();
  if (sub_1AF9F7AC4() != v28)
    v30 = sub_1AF9F7AC4();
  sub_1AF9F7AC4();
  if (sub_1AF9F7AC4() != v29)
    v30 = sub_1AF9F7AC4();
  v31 = sub_1AF9F7A04();
  v32 = swift_allocObject();
  v33 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v32 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v32 + 96) = v33;
  *(_OWORD *)(v32 + 112) = *(_OWORD *)(v2 + 96);
  *(_QWORD *)(v32 + 128) = *(_QWORD *)(v2 + 112);
  v34 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v32 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v32 + 32) = v34;
  v35 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v32 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v32 + 64) = v35;
  sub_1AF9E34C4(v2);
  sub_1AF9F7C98();
  v36 = v45;
  v38 = v46;
  v37 = v47;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(&v45[*(int *)(v44 + 20)], v6, v47);
  *v36 = &unk_1EEE6C270;
  v36[1] = v32;
  sub_1AF9C24F0((uint64_t)v36, (uint64_t)&v8[*(int *)(v43 + 36)]);
  v39 = v42;
  *(_QWORD *)v8 = v41;
  *((_QWORD *)v8 + 1) = v39;
  *((_QWORD *)v8 + 2) = sub_1AF9E3364;
  *((_QWORD *)v8 + 3) = v17;
  *((_QWORD *)v8 + 4) = sub_1AF9E32D0;
  *((_QWORD *)v8 + 5) = v13;
  *((_QWORD *)v8 + 6) = v31;
  v8[56] = v30;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1AF9C2534((uint64_t)v36);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v37);
  swift_release();
  swift_release();
  swift_release();
  return sub_1AF9E3610((uint64_t)v8, v48);
}

uint64_t sub_1AF9E2148(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[5] = a1;
  v2 = sub_1AF9F7914();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v3 = sub_1AF9F792C();
  v1[9] = v3;
  v1[10] = *(_QWORD *)(v3 - 8);
  v1[11] = swift_task_alloc();
  v4 = sub_1AF9F7944();
  v1[12] = v4;
  v1[13] = *(_QWORD *)(v4 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = sub_1AF9F7C8C();
  v1[16] = sub_1AF9F7C80();
  v1[17] = sub_1AF9F7C68();
  v1[18] = v5;
  return swift_task_switch();
}

uint64_t sub_1AF9E2230()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1AF9F543C();
  swift_bridgeObjectRetain();
  sub_1AF9F7908();
  sub_1AF9F7938();
  sub_1AF9F7920();
  *(_QWORD *)(v0 + 152) = sub_1AF9F7C80();
  sub_1AF9C212C((unint64_t *)&unk_1EEE6BA80, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAA400], MEMORY[0x1E0CAA408]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  *v1 = v0;
  v1[1] = sub_1AF9E2314;
  return sub_1AF9F7C74();
}

uint64_t sub_1AF9E2314()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 168) = v0;
  swift_task_dealloc();
  v3 = *(_QWORD *)(v2 + 152);
  if (v0)
  {
    if (v3)
      goto LABEL_5;
  }
  else if (v3)
  {
LABEL_5:
    swift_getObjectType();
    sub_1AF9F7C68();
  }
  return swift_task_switch();
}

uint64_t sub_1AF9E23D8()
{
  uint64_t v0;

  swift_release();
  *(_QWORD *)(v0 + 176) = *(_QWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_1AF9E2418()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v0 + 176))
    return swift_task_switch();
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v6 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AF9E24E4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 184) = sub_1AF9F7C80();
  sub_1AF9F7C68();
  return swift_task_switch();
}

uint64_t sub_1AF9E2544()
{
  uint64_t v0;
  uint64_t v1;
  __int128 *v2;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(__int128 **)(v0 + 40);
  swift_release();
  sub_1AF9E27CC(v1, v2);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1AF9E2594()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v0 + 168);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6C390);
  swift_willThrowTypedImpl();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AF9E25FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  LOBYTE(v1) = sub_1AF9F7CEC();
  v4 = *sub_1AF9CFC38();
  v5 = v1;
  if (os_log_type_enabled(v4, (os_log_type_t)v1))
  {
    v6 = *(void **)(v0 + 168);
    v7 = v6;
    v8 = v6;
    v9 = v4;
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v6;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 32) = v13;
    sub_1AF9F7D94();
    *v11 = v13;

    _os_log_impl(&dword_1AF84D000, v9, v5, "EKEventEditOOPHostView: Could not read extension query results. Error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE60);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v11, -1, -1);
    MEMORY[0x1B5DFEE1C](v10, -1, -1);

  }
  else
  {
    v6 = *(void **)(v0 + 168);
  }

  v15 = *(_QWORD *)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 112);
  v16 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1AF9E27CC(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, unint64_t, uint64_t);
  _QWORD *v18;
  void (*v19)(uint64_t);
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  unint64_t v28;
  os_log_t v29;
  uint64_t v30;
  id v31;
  uint64_t (*v32)(void);
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t, _QWORD *);
  uint64_t v39;
  uint64_t v40;
  os_log_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1AF9F7968();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v39 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v39 - v15;
  if (!*(_QWORD *)(a1 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_6;
  }
  v17 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  v17(v6, a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_6:
    sub_1AF9C6BF4((uint64_t)v6, &qword_1EEE6B878);
    sub_1AF9F7CEC();
    v31 = (id)*sub_1AF9CFC38();
    sub_1AF9F7974();

    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v6, v7);
  v45 = *a2;
  v18 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v19 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v45 + 1)) + 0x90);
  v42 = *((id *)&v45 + 1);
  v19(1);
  sub_1AF9C0F90((uint64_t)&v45);
  v20 = sub_1AF9F7CF8();
  v21 = *sub_1AF9CFC38();
  v17(v14, (unint64_t)v16, v7);
  v17(v11, (unint64_t)v16, v7);
  v22 = v20;
  if (os_log_type_enabled(v21, v20))
  {
    v41 = v21;
    v23 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    v44 = v40;
    *(_DWORD *)v23 = 136315394;
    v24 = sub_1AF9F7950();
    v43 = sub_1AF9C4DD4(v24, v25, &v44);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease();
    v26 = *(void (**)(char *, uint64_t))(v8 + 8);
    v26(v14, v7);
    *(_WORD *)(v23 + 12) = 2080;
    v27 = sub_1AF9F795C();
    v43 = sub_1AF9C4DD4(v27, v28, &v44);
    v18 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    sub_1AF9F7D94();
    swift_bridgeObjectRelease();
    v26(v11, v7);
    v29 = v41;
    _os_log_impl(&dword_1AF84D000, v41, v22, "EventKitUI AppExtensionQuery Found %s (%s) RemoteUI Extension", (uint8_t *)v23, 0x16u);
    v30 = v40;
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v30, -1, -1);
    MEMORY[0x1B5DFEE1C](v23, -1, -1);

  }
  else
  {
    v26 = *(void (**)(char *, uint64_t))(v8 + 8);
    v26(v14, v7);
    v26(v11, v7);
  }
  v32 = *(uint64_t (**)(void))((*v18 & *v42) + 0xA0);
  v33 = v42;
  v34 = v32();
  sub_1AF9C0F90((uint64_t)&v45);
  v35 = (uint64_t *)sub_1AF9F5498();
  v36 = *v35;
  v37 = v35[1];
  v38 = *(void (**)(char *, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v34 + 656);
  sub_1AF9C23C4((uint64_t)&v45);
  swift_bridgeObjectRetain();
  v38(v16, v36, v37, v33);
  sub_1AF9C0F90((uint64_t)&v45);
  swift_release();
  swift_bridgeObjectRelease();
  v26(v16, v7);
}

void sub_1AF9E2C10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void (*v4)(uint64_t);
  _QWORD *v5;

  v3 = *(_QWORD **)(v1 + 8);
  v4 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0xF0);
  v5 = v3;
  v4(a1);

}

uint64_t sub_1AF9E2C74()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;

  v4 = *v0;
  v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v4 + 1)) + 0xA0))(*((id *)&v4 + 1));
  v2 = sub_1AF9C0F90((uint64_t)&v4);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 520))(v2);
  return swift_release();
}

uint64_t sub_1AF9E2CE4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v8)(void);
  _QWORD *v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *);
  void (*v12)(_BYTE *, _QWORD);
  uint64_t *v13;
  uint64_t *v14;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v16;
  uint64_t (*v17)(void);
  _QWORD *v18;
  uint64_t v19;
  void (*v20)(_BYTE *, _QWORD);
  BOOL *v21;
  uint64_t v23;
  _BYTE v24[32];

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
  v3 = *(void **)(v0 + 64);
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_calendarIdentifier);
    sub_1AF9F7BF0();

    v5 = sub_1AF9F7BCC();
    swift_bridgeObjectRelease();

    v2 = (id)v5;
  }
  v6 = *(_QWORD **)(v1 + 8);
  v7 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v8 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v6) + 0xA0);
  v9 = v6;
  v10 = v8();

  v11 = *(uint64_t (**)(_BYTE *))(*(_QWORD *)v10 + 384);
  swift_unknownObjectRetain();
  v12 = (void (*)(_BYTE *, _QWORD))v11(v24);
  v14 = v13;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v23 = *v14;
  *v14 = 0x8000000000000000;
  sub_1AF9DB3E8((uint64_t)v2, 0xD000000000000011, 0x80000001AFA21830, isUniquelyReferenced_nonNull_native);
  *v14 = v23;
  swift_bridgeObjectRelease();
  v12(v24, 0);
  swift_release();
  v16 = *(_QWORD **)(v1 + 8);
  v17 = *(uint64_t (**)(void))((*v7 & *v16) + 0xA0);
  v18 = v16;
  v19 = v17();

  v20 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v19 + 408))(v24);
  *v21 = !*v21;
  v20(v24, 0);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_1AF9E2EB0(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v3 = *(void **)(v1 + 64);
  v4 = a1;

  *(_QWORD *)(v1 + 64) = a1;
  sub_1AF9E2CE4();

}

uint64_t sub_1AF9E2EF8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t (*v9)(_BYTE *);
  id v10;
  void (*v11)(_BYTE *, _QWORD);
  uint64_t *v12;
  uint64_t *v13;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v15;
  uint64_t (*v16)(void);
  _QWORD *v17;
  uint64_t v18;
  void (*v19)(_BYTE *, _QWORD);
  BOOL *v20;
  uint64_t v22;
  _BYTE v23[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xA0);
  v5 = v2;
  v6 = v4();

  v7 = *(void **)(v1 + 72);
  if (v7)
  {
    v8 = *(id *)(v1 + 72);
  }
  else
  {
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
    v7 = 0;
  }
  v9 = *(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 384);
  v10 = v7;
  v11 = (void (*)(_BYTE *, _QWORD))v9(v23);
  v13 = v12;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22 = *v13;
  *v13 = 0x8000000000000000;
  sub_1AF9DB3E8((uint64_t)v8, 0xD000000000000015, 0x80000001AFA211F0, isUniquelyReferenced_nonNull_native);
  *v13 = v22;
  swift_bridgeObjectRelease();
  v11(v23, 0);
  swift_release();
  v15 = *(_QWORD **)(v1 + 8);
  v16 = *(uint64_t (**)(void))((*v3 & *v15) + 0xA0);
  v17 = v15;
  v18 = v16();

  v19 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v18 + 408))(v23);
  *v20 = !*v20;
  v19(v23, 0);
  return swift_release();
}

void sub_1AF9E307C(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v3 = *(void **)(v1 + 72);
  v4 = a1;

  *(_QWORD *)(v1 + 72) = a1;
  sub_1AF9E2EF8();

}

uint64_t sub_1AF9E30C4()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  char v3;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 48);
  if (!v1)
    return 0;
  v2 = swift_retain();
  v3 = v1(v2);
  sub_1AF9C09DC((uint64_t)v1);
  return v3 & 1;
}

uint64_t sub_1AF9E3118()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;

  v4 = *v0;
  v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v4 + 1)) + 0xA0))(*((id *)&v4 + 1));
  v2 = sub_1AF9C0F90((uint64_t)&v4);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 576))(v2);
  return swift_release();
}

uint64_t sub_1AF9E3188()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;

  v4 = *v0;
  v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v4 + 1)) + 0xA0))(*((id *)&v4 + 1));
  v2 = sub_1AF9C0F90((uint64_t)&v4);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 608))(v2);
  return swift_release();
}

uint64_t sub_1AF9E31F8()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;

  v4 = *v0;
  v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v4 + 1)) + 0xA0))(*((id *)&v4 + 1));
  v2 = sub_1AF9C0F90((uint64_t)&v4);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 640))(v2);
  return swift_release();
}

uint64_t sub_1AF9E3268@<X0>(uint64_t a1@<X8>)
{
  return sub_1AF9E1D04(a1);
}

uint64_t type metadata accessor for _AppExtensionEventEditHostView.Configuration(uint64_t a1)
{
  return sub_1AF9C54B8(a1, (uint64_t *)&unk_1EEE6D880);
}

uint64_t sub_1AF9E32D0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;

  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v6)
  {
    v11 = result;
    swift_retain();
    v6(v11, a2, a3, a4, a5);
    return sub_1AF9C09DC((uint64_t)v6);
  }
  return result;
}

uint64_t sub_1AF9E3364(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;

  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 32);
  if (v9)
  {
    v17 = result;
    swift_retain();
    v9(v17, a2, a3, a4, a5, a6, a7, a8);
    return sub_1AF9C09DC((uint64_t)v9);
  }
  return result;
}

uint64_t sub_1AF9E341C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char v5;
  __int128 v7;

  v7 = *(_OWORD *)(v0 + 16);
  v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v7 + 1)) + 0xA0))(*((id *)&v7 + 1));
  v2 = sub_1AF9C0F90((uint64_t)&v7);
  v3 = (uint64_t (*)(uint64_t))(*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 528))(v2);
  v4 = swift_release();
  if (v3)
  {
    v5 = v3(v4);
    sub_1AF9C09DC((uint64_t)v3);
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_1AF9E34C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 64);
  v6 = *(void **)(a1 + 72);
  v7 = *(id *)(a1 + 8);
  sub_1AF9C09CC(v2);
  sub_1AF9C09CC(v3);
  sub_1AF9C09CC(v4);
  swift_bridgeObjectRetain();
  v8 = v5;
  v9 = v6;
  return a1;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
    swift_release();
  if (*(_QWORD *)(v0 + 48))
    swift_release();
  if (*(_QWORD *)(v0 + 64))
    swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF9E35C4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1AF9C24A8;
  return sub_1AF9E2148(v0 + 16);
}

uint64_t sub_1AF9E3610(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C258);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF9E3658@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_identity;
  swift_beginAccess();
  return sub_1AF9C5414(v3, a1);
}

uint64_t sub_1AF9E36A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_identity;
  swift_beginAccess();
  sub_1AF9C545C(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1AF9E3700())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9E3744()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sceneID);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1AF9E3798(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sceneID);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AF9E37F4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9E3838()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_event);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9E3884(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_event);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9E38D4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9E3918()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_eventStore);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9E3964(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_eventStore);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9E39B4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9E39F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_layoutDirection;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1AF9E3A3C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_layoutDirection);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9E3A84())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AF9E3AC8()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sizeCategory);
  swift_beginAccess();
  return *v1;
}

void sub_1AF9E3B0C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sizeCategory);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9E3B5C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9E3BA0()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9E3BEC(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9E3C3C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9E3C80()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AF9E3CC8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1
                + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_changedCustomViewConfigurationDictionary);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AF9E3D18())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9E3D5C()
{
  return sub_1AF9E3F50();
}

uint64_t sub_1AF9E3D70@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 392))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9E3DA4(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 400))(*a1);
}

uint64_t sub_1AF9E3DD0()
{
  return sub_1AF9E402C();
}

void (*sub_1AF9E3DE4(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9E076C;
}

uint64_t sub_1AF9E3E5C()
{
  return sub_1AF9E4118();
}

uint64_t sub_1AF9E3E68(uint64_t a1)
{
  return sub_1AF9E4180(a1);
}

void (*sub_1AF9E3E74(_QWORD *a1))(uint64_t, char)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__customViewConfigurationChangedPublisher;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9E0868;
}

uint64_t sub_1AF9E3F3C()
{
  return sub_1AF9E3F50();
}

uint64_t sub_1AF9E3F50()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AF9F79BC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF9E3FB8@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 440))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9E3FEC(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 448))(*a1);
}

uint64_t sub_1AF9E4018()
{
  return sub_1AF9E402C();
}

uint64_t sub_1AF9E402C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1AF9F79C8();
}

void (*sub_1AF9E4094(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9E076C;
}

uint64_t sub_1AF9E410C()
{
  return sub_1AF9E4118();
}

uint64_t sub_1AF9E4118()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F7998();
  return swift_endAccess();
}

uint64_t sub_1AF9E4174(uint64_t a1)
{
  return sub_1AF9E4180(a1);
}

uint64_t sub_1AF9E4180(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F79A4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1AF9E4254(_QWORD *a1))(uint64_t, char)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__navigationDoneButtonTapPublisher;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9E0868;
}

uint64_t sub_1AF9E431C()
{
  uint64_t v0;
  uint64_t (*v1)(_BYTE *, _QWORD);
  BOOL *v2;
  _BYTE v4[32];

  v1 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v0 + 456))(v4);
  *v2 = !*v2;
  return v1(v4, 0);
}

uint64_t sub_1AF9E4364()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_cancelEditingCallback, (void (*)(_QWORD, _QWORD))sub_1AF9C09CC);
}

uint64_t sub_1AF9E4378(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_cancelEditingCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C09DC);
}

uint64_t (*sub_1AF9E438C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9E43D0())(void)
{
  uint64_t v0;
  void (*result)(void);
  uint64_t v2;

  result = (void (*)(void))(*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
  if (result)
  {
    v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1AF9C09DC(v2);
  }
  return result;
}

uint64_t sub_1AF9E4418()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_getHasUnsavedChangesAction, (void (*)(_QWORD, _QWORD))sub_1AF9C6C90);
}

uint64_t sub_1AF9E442C(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_getHasUnsavedChangesAction, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C6C94);
}

uint64_t (*sub_1AF9E4440())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9E4484()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectTitleCallback, (void (*)(_QWORD, _QWORD))sub_1AF9C09CC);
}

uint64_t sub_1AF9E4498(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectTitleCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C09DC);
}

uint64_t (*sub_1AF9E44AC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9E44F0())(void)
{
  uint64_t v0;
  void (*result)(void);
  uint64_t v2;

  result = (void (*)(void))(*(uint64_t (**)(void))(*(_QWORD *)v0 + 552))();
  if (result)
  {
    v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1AF9C09DC(v2);
  }
  return result;
}

uint64_t sub_1AF9E4538()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectStartDateCallback, (void (*)(_QWORD, _QWORD))sub_1AF9C09CC);
}

uint64_t sub_1AF9E454C(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectStartDateCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C09DC);
}

uint64_t (*sub_1AF9E4560())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9E45A4())(void)
{
  uint64_t v0;
  void (*result)(void);
  uint64_t v2;

  result = (void (*)(void))(*(uint64_t (**)(void))(*(_QWORD *)v0 + 584))();
  if (result)
  {
    v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1AF9C09DC(v2);
  }
  return result;
}

uint64_t sub_1AF9E45EC()
{
  return sub_1AF9C30D8(&OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusTitleCallback, (void (*)(_QWORD, _QWORD))sub_1AF9C09CC);
}

uint64_t sub_1AF9E4600(uint64_t a1, uint64_t a2)
{
  return sub_1AF9C314C(a1, a2, &OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusTitleCallback, (uint64_t (*)(uint64_t, uint64_t))sub_1AF9C09DC);
}

uint64_t (*sub_1AF9E4614())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9E4658())(void)
{
  uint64_t v0;
  void (*result)(void);
  uint64_t v2;

  result = (void (*)(void))(*(uint64_t (**)(void))(*(_QWORD *)v0 + 616))();
  if (result)
  {
    v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1AF9C09DC(v2);
  }
  return result;
}

uint64_t sub_1AF9E46A0()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_1AF9E46D4();
  return v0;
}

uint64_t sub_1AF9E46D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void (*v9)(uint64_t, _BYTE *, uint64_t);
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  _BYTE v19[16];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_identity;
  v6 = sub_1AF9F7968();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sceneID);
  *v7 = 0;
  v7[1] = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_event) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_eventStore) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_viewHierarchy) = 0;
  *(_QWORD *)(v0
            + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_changedCustomViewConfigurationDictionary) = MEMORY[0x1E0DEE9E0];
  v8 = v0
     + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__customViewConfigurationChangedPublisher;
  v19[15] = 0;
  sub_1AF9F798C();
  v9 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v2 + 32);
  v9(v8, v4, v1);
  v10 = v0
      + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__navigationDoneButtonTapPublisher;
  v19[14] = 0;
  sub_1AF9F798C();
  v9(v10, v4, v1);
  v11 = (_QWORD *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_cancelEditingCallback);
  *v11 = 0;
  v11[1] = 0;
  v12 = (_QWORD *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_getHasUnsavedChangesAction);
  *v12 = 0;
  v12[1] = 0;
  v13 = (_QWORD *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectTitleCallback);
  *v13 = 0;
  v13[1] = 0;
  v14 = (_QWORD *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectStartDateCallback);
  *v14 = 0;
  v14[1] = 0;
  v15 = (_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusTitleCallback);
  *v15 = 0;
  v15[1] = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_layoutDirection) = 0;
  v16 = (void *)*MEMORY[0x1E0DC4938];
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_sizeCategory) = *MEMORY[0x1E0DC4938];
  v17 = v16;
  return v0;
}

uint64_t sub_1AF9E48A0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(_BYTE *, _QWORD);
  BOOL *v28;
  _BYTE v30[32];

  v5 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v10);
  v12 = &v30[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_1AF9F7968();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16))(v12, a1, v13);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(_BYTE *))(*(_QWORD *)v5 + 208))(v12);
  v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 232);
  swift_bridgeObjectRetain();
  v16 = v15(a2, a3);
  v17 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v18 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *a4) + 0xD0))(v16);
  v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 256))(v18);
  v20 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0xE8))(v19);
  v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 280))(v20);
  v22 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x100))(v21);
  v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 304))(v22);
  v24 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x118))(v23);
  v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 328))(v24);
  v26 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0x130))(v25);
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 352))(v26);
  v27 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v5 + 408))(v30);
  *v28 = !*v28;
  return v27(v30, 0);
}

uint64_t sub_1AF9E4A90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  sub_1AF9C6BF4(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_identity, &qword_1EEE6B878);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v1 = v0
     + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__customViewConfigurationChangedPublisher;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration__navigationDoneButtonTapPublisher, v2);
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_cancelEditingCallback));
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_getHasUnsavedChangesAction));
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectTitleCallback));
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusAndSelectStartDateCallback));
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView13Configuration_focusTitleCallback));
  return v0;
}

uint64_t sub_1AF9E4BD8()
{
  sub_1AF9E4A90();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF9E4BFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for _AppExtensionEventEditHostView.Configuration(0);
  result = sub_1AF9F7980();
  *a1 = result;
  return result;
}

id sub_1AF9E4C38(_OWORD *a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  objc_super v9;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_identity];
  v5 = sub_1AF9F7968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)&v3[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_conn] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  v6 = &v3[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent];
  v7 = a1[1];
  *(_OWORD *)v6 = *a1;
  *((_OWORD *)v6 + 1) = v7;
  *((_OWORD *)v6 + 2) = a1[2];
  v9.receiver = v3;
  v9.super_class = v1;
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for _AppExtensionEventEditHostView.HostCoordinator(uint64_t a1)
{
  return sub_1AF9C54B8(a1, qword_1EEE6D890);
}

uint64_t sub_1AF9E4CFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_identity;
  swift_beginAccess();
  return sub_1AF9C5414(v3, a1);
}

uint64_t sub_1AF9E4D4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_identity;
  swift_beginAccess();
  sub_1AF9C545C(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1AF9E4DA4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9E4DE8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_conn);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9E4E34(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_conn);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9E4E84())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9E4EC8()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_1AF9E4F10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1
                + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_configurationChangedPublisherSink);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1AF9E4F60())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1AF9E4FA4(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  void (*v19)(void *);
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  os_log_type_t v27;
  uint64_t *v28;
  os_log_t v29;
  id v30;
  char *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  _DWORD *v35;
  _QWORD *v36;
  char *v37;
  _DWORD *v38;
  _DWORD *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t (*v48)(void);
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  void *v63;
  os_log_type_t v64;
  NSObject *v65;
  id v66;
  id v67;
  NSObject *v68;
  uint8_t *v69;
  _QWORD *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id *v76;
  void *v77;
  void *v78;
  id *v79;
  id v80;
  char *v81;
  char *v82;
  uint64_t v83;
  id v84;
  void *v85;
  id v86;
  void (*v87)(id, id, uint64_t);
  void (*v88)(char *, uint64_t);
  id v89;
  char *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  char *v95;
  void *v96;
  id v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(id (*)(), uint64_t);
  uint64_t v104;
  void (*v105)(id (*)(), uint64_t);
  uint64_t v106;
  void (*v107)(id (*)(), uint64_t);
  uint64_t v108;
  void (*v109)(id (*)(), uint64_t);
  uint64_t v110;
  void (*v111)(id (*)(), uint64_t);
  uint64_t v112;
  char *v113;
  unsigned int v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t (*v118)(void);
  id v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  id *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  char *v127;
  void *v128;
  id aBlock;
  uint64_t v130;
  uint64_t (*v131)(uint64_t);
  void *v132;
  void (*v133)();
  uint64_t v134;
  uint64_t v135;

  v2 = v1;
  v135 = *MEMORY[0x1E0C80C00];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v112 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE58);
  MEMORY[0x1E0C80A78](v8);
  v127 = (char *)&v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1AF9F78E4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v112 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v112 - v15;
  aBlock = 0;
  v17 = objc_msgSend(a1, sel_makeXPCConnectionWithError_, &aBlock);
  if (!v17)
  {
    v62 = aBlock;
    v63 = (void *)sub_1AF9F789C();

    swift_willThrow();
    v64 = sub_1AF9F7CEC();
    v65 = *sub_1AF9CFC38();
    if (!os_log_type_enabled(v65, v64))
    {

      return;
    }
    v66 = v63;
    v67 = v63;
    v68 = v65;
    v69 = (uint8_t *)swift_slowAlloc();
    v70 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v69 = 138412290;
    v71 = v63;
    v72 = (void *)_swift_stdlib_bridgeErrorToNSError();
    aBlock = v72;
    sub_1AF9F7D94();
    *v70 = v72;

    _os_log_impl(&dword_1AF84D000, v68, v64, "Error: _AppExtensionEventEditHostView Setup: Cannot make XPC Connection. %@", v69, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE60);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v70, -1, -1);
    MEMORY[0x1B5DFEE1C](v69, -1, -1);

    goto LABEL_19;
  }
  v18 = v17;
  v122 = v4;
  v125 = v10;
  v126 = v16;
  v124 = v11;
  v19 = *(void (**)(void *))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x98);
  v20 = aBlock;
  v21 = v18;
  v19(v18);
  objc_msgSend(v21, sel_setExportedInterface_, *sub_1AF9CE744());
  objc_msgSend(v21, sel_setRemoteObjectInterface_, *sub_1AF9CEB00());
  objc_msgSend(v21, sel_setExportedObject_, v1);
  v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v133 = sub_1AF9E6CE4;
  v134 = v22;
  v23 = (void *)MEMORY[0x1E0C809B0];
  aBlock = (id)MEMORY[0x1E0C809B0];
  v130 = 1107296256;
  v131 = sub_1AF9C3D10;
  v132 = &block_descriptor_2;
  v24 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v21, sel_setInterruptionHandler_, v24);
  _Block_release(v24);
  v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v133 = sub_1AF9E6DD4;
  v134 = v25;
  aBlock = v23;
  v130 = 1107296256;
  v131 = sub_1AF9C3D10;
  v132 = &block_descriptor_23;
  v26 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v21, sel_setInvalidationHandler_, v26);
  _Block_release(v26);
  objc_msgSend(v21, sel_resume);
  v27 = sub_1AF9F7CF8();
  v28 = sub_1AF9CFC38();
  v29 = (os_log_t)*v28;
  if (os_log_type_enabled((os_log_t)*v28, v27))
  {
    v30 = v21;
    v123 = (id *)v28;
    v31 = v7;
    v32 = v5;
    v33 = v30;
    v34 = v29;
    v35 = (_DWORD *)swift_slowAlloc();
    v121 = v21;
    v36 = v2;
    v37 = v14;
    v38 = v35;
    *v35 = 67109376;
    LODWORD(aBlock) = objc_msgSend(v33, sel_processIdentifier);
    sub_1AF9F7D94();
    *((_WORD *)v38 + 4) = 1024;
    LODWORD(aBlock) = objc_msgSend(v33, sel_effectiveUserIdentifier);
    sub_1AF9F7D94();

    v5 = v32;
    v7 = v31;
    v28 = (uint64_t *)v123;
    _os_log_impl(&dword_1AF84D000, v34, v27, "_AppExtensionEventEditHostView: Setting up XPC connection. processIdentifier: %d. effectiveUserIdentifier: %u.", (uint8_t *)v38, 0xEu);
    v39 = v38;
    v14 = v37;
    v2 = v36;
    v21 = v121;
    MEMORY[0x1B5DFEE1C](v39, -1, -1);

  }
  v40 = objc_msgSend(v21, sel_remoteObjectProxy);
  sub_1AF9F7DAC();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C288);
  if (!swift_dynamicCast())
  {
    sub_1AF9F7CEC();
    v68 = (id)*v28;
    sub_1AF9F7974();

LABEL_19:
    return;
  }
  v117 = v14;
  v120 = v5;
  v41 = v128;
  v42 = *(_QWORD *)((char *)v2
                  + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent
                  + 8);
  v43 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v42 + 344);
  v44 = swift_retain();
  v45 = v43(v44);
  if (!v45)
  {
    sub_1AF9F7CEC();
    v68 = (id)*v28;
    sub_1AF9F7974();

    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_19;
  }
  v46 = (id)v45;
  v121 = v41;
  v123 = (id *)v28;
  v116 = (*(uint64_t (**)(void))(*(_QWORD *)v42 + 296))();
  v47 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v42 + 320))();
  v115 = sub_1AF9F7BF0();

  v48 = *(uint64_t (**)(void))(*(_QWORD *)v42 + 248);
  v49 = swift_retain();
  v118 = v48;
  v50 = (void *)((uint64_t (*)(uint64_t))v48)(v49);
  swift_release();
  v119 = v46;
  if (!v50)
  {
    v61 = 0;
    v114 = 0;
    v52 = v127;
    goto LABEL_24;
  }
  v51 = objc_msgSend(v50, sel_eventStore);

  v52 = v127;
  if (!v51)
  {
    v61 = 0;
    v114 = 0;
    goto LABEL_24;
  }
  v53 = objc_msgSend(v51, sel_connection);
  if (!v53)
  {
    __break(1u);
    goto LABEL_41;
  }
  v54 = v53;
  v55 = objc_msgSend(v53, sel_initializationOptions);

  if (!v55)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v114 = objc_msgSend(v55, sel_management);

  v56 = objc_msgSend(v51, sel_connection);
  if (!v56)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v57 = v56;
  v58 = objc_msgSend(v56, sel_initializationOptions);

  if (v58)
  {
    v59 = objc_msgSend(v58, sel_managementBundleIdentifier);

    if (v59)
    {
      sub_1AF9F7BF0();
      v61 = v60;

    }
    else
    {

      v61 = 0;
    }
    v46 = v119;
LABEL_24:
    v73 = (void *)sub_1AF9F7BCC();
    swift_bridgeObjectRelease();
    if (v61)
    {
      v74 = (void *)sub_1AF9F7BCC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v74 = 0;
    }
    v75 = v124;
    objc_msgSend(v121, sel_setupViewContextWithViewHierarchy_layoutDirection_sizeCategory_sourceAccountManagement_sourceBundleID_, v46, v116, v73, v114, v74);

    v76 = (id *)(*(uint64_t (**)(void))(*(_QWORD *)v42 + 272))();
    if (!v76)
    {
      v77 = (void *)v118();
      if (v77)
      {
        v78 = v77;
        v79 = (id *)objc_msgSend(v77, sel_eventStore);

        if (v79)
          goto LABEL_32;
      }
      sub_1AF9F7CF8();
      v80 = *v123;
      sub_1AF9F7974();

      v76 = (id *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CAA078]), sel_init);
    }
    v79 = v76;
LABEL_32:
    v81 = (char *)v118();
    if (!v81)
      v81 = (char *)objc_msgSend((id)objc_opt_self(), sel_eventWithEventStore_, v79);
    v82 = v81;
    v83 = v125;
    v123 = v79;
    sub_1AF9F78D8();
    v127 = v82;
    v84 = objc_msgSend(v82, sel_occurrenceDate);
    v113 = v7;
    if (v84)
    {
      v85 = v84;
      v86 = v117;
      sub_1AF9F78CC();

      v87 = *(void (**)(id, id, uint64_t))(v75 + 32);
      v87(v52, v86, v83);
      (*(void (**)(id, _QWORD, uint64_t, uint64_t))(v75 + 56))(v52, 0, 1, v83);
      if ((*(unsigned int (**)(id, uint64_t, uint64_t))(v75 + 48))(v52, 1, v83) != 1)
      {
        v88 = *(void (**)(char *, uint64_t))(v75 + 8);
        v89 = v52;
        v90 = v126;
        v88(v126, v83);
        v87(v90, v89, v83);
LABEL_39:
        v118 = (uint64_t (*)(void))objc_msgSend(objc_allocWithZone((Class)sub_1AF9F7B78()), sel_init);
        v91 = (void *)sub_1AF9F7B6C();
        sub_1AF9F7B84();
        v92 = (void *)sub_1AF9F7BB4();
        swift_bridgeObjectRelease();
        v117 = v91;
        sub_1AF9F7B90();
        sub_1AF9C6B78(0, (unint64_t *)&qword_1EEE6BE70);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE78);
        sub_1AF9DAC9C();
        v93 = (void *)sub_1AF9F7BB4();
        swift_bridgeObjectRelease();
        sub_1AF9F7B9C();
        v94 = (void *)sub_1AF9F7BB4();
        swift_bridgeObjectRelease();
        v95 = v126;
        v96 = (void *)sub_1AF9F78C0();
        v97 = v121;
        objc_msgSend(v121, sel_setupEventEditViewWithSerializedEventDictionary_objectIDToChangeSetDictionaryMap_objectIDToPersistentDictionaryMap_eventOccurrenceDate_, v92, v93, v94, v96);

        v98 = v113;
        (*(void (**)(void))(*(_QWORD *)v42 + 416))();
        v99 = swift_allocObject();
        *(_QWORD *)(v99 + 16) = v97;
        *(_QWORD *)(v99 + 24) = v42;
        sub_1AF9C6ABC(&qword_1EEE6BE88, &qword_1EEE6B888, MEMORY[0x1E0C96190]);
        swift_retain();
        swift_unknownObjectRetain();
        v100 = v122;
        v101 = sub_1AF9F79E0();
        swift_release();
        (*(void (**)(char *, uint64_t))(v120 + 8))(v98, v100);
        (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xB0))(v101);
        v102 = swift_allocObject();
        *(_QWORD *)(v102 + 16) = v97;
        v103 = *(void (**)(id (*)(), uint64_t))(*(_QWORD *)v42 + 504);
        swift_unknownObjectRetain();
        v103(sub_1AF9E6EF8, v102);
        v104 = swift_allocObject();
        *(_QWORD *)(v104 + 16) = v97;
        v105 = *(void (**)(id (*)(), uint64_t))(*(_QWORD *)v42 + 536);
        swift_unknownObjectRetain();
        v105(sub_1AF9E6F08, v104);
        v106 = swift_allocObject();
        *(_QWORD *)(v106 + 16) = v97;
        v107 = *(void (**)(id (*)(), uint64_t))(*(_QWORD *)v42 + 560);
        swift_unknownObjectRetain();
        v107(sub_1AF9E6F28, v106);
        v108 = swift_allocObject();
        *(_QWORD *)(v108 + 16) = v97;
        v109 = *(void (**)(id (*)(), uint64_t))(*(_QWORD *)v42 + 592);
        swift_unknownObjectRetain();
        v109(sub_1AF9E6F38, v108);
        v110 = swift_allocObject();
        *(_QWORD *)(v110 + 16) = v97;
        v111 = *(void (**)(id (*)(), uint64_t))(*(_QWORD *)v42 + 624);
        swift_unknownObjectRetain();
        v111(sub_1AF9E80F4, v110);

        swift_unknownObjectRelease();
        swift_release();

        (*(void (**)(char *, uint64_t))(v124 + 8))(v95, v125);
        return;
      }
    }
    else
    {
      (*(void (**)(id, uint64_t, uint64_t, uint64_t))(v75 + 56))(v52, 1, 1, v83);
    }
    sub_1AF9C6BF4((uint64_t)v52, &qword_1EEE6BE58);
    goto LABEL_39;
  }
LABEL_43:
  __break(1u);
}

void sub_1AF9E5DE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v2 = sub_1AF9F7B3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1AF9F7B54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1 + 16;
  sub_1AF9F7CF8();
  v11 = (id)*sub_1AF9CFC38();
  sub_1AF9F7974();

  swift_beginAccess();
  v12 = MEMORY[0x1B5DFEE88](a1 + 16);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = *(_QWORD *)(v12 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 16);
    v15 = *(_QWORD *)(v12 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 24);
    sub_1AF9C09CC(v14);

    if (v14)
    {
      sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
      v27 = sub_1AF9F7D04();
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = v14;
      *(_QWORD *)(v16 + 24) = v15;
      aBlock[4] = sub_1AF9E8094;
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1AF9C3D10;
      aBlock[3] = &block_descriptor_61;
      v17 = _Block_copy(aBlock);
      v26 = v6;
      v18 = v17;
      swift_retain();
      swift_release();
      sub_1AF9F7B48();
      aBlock[0] = MEMORY[0x1E0DEE9D8];
      sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
      v25 = v7;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
      v24 = v3;
      sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
      sub_1AF9F7DB8();
      v19 = (void *)v27;
      MEMORY[0x1B5DFD9D0](0, v9, v5, v18);
      _Block_release(v18);

      sub_1AF9C09DC(v14);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v26);
    }
  }
  swift_beginAccess();
  v20 = (_QWORD *)MEMORY[0x1B5DFEE88](v10);
  if (v20)
  {
    v21 = v20;
    v22 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v20) + 0x90))();

    if (v22)
    {
      objc_msgSend(v22, sel_setExportedObject_, 0);

    }
  }
}

uint64_t sub_1AF9E61F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v29 = a5;
  v10 = sub_1AF9F7B3C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v5 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 32);
  if (v19)
  {
    v27 = v11;
    v28 = result;
    v20 = *(_QWORD *)(v5 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 40);
    v26 = v16;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v25 = sub_1AF9F7D04();
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = v19;
    v21[3] = v20;
    v21[4] = a1;
    v21[5] = a2;
    v21[6] = a3;
    v21[7] = a4;
    v21[8] = v29;
    aBlock[4] = sub_1AF9C567C;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_47;
    v22 = _Block_copy(aBlock);
    sub_1AF9C09CC(v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    sub_1AF9F7DB8();
    v23 = (void *)v25;
    MEMORY[0x1B5DFD9D0](0, v18, v13, v22);
    _Block_release(v22);

    sub_1AF9C09DC(v19);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v18, v28);
  }
  return result;
}

uint64_t sub_1AF9E64F8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  char *v29;
  char *v30;
  uint64_t v31;
  const void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unint64_t v45;
  _QWORD aBlock[6];

  v44 = a3;
  v45 = a8;
  v42 = a6;
  v43 = a2;
  v13 = sub_1AF9F7B3C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v17);
  v21 = *(_QWORD *)(v8 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 16);
  if (v21)
  {
    v40 = v14;
    v41 = result;
    v22 = *(_QWORD *)(v8 + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent + 24);
    v36 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    v39 = v20;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v38 = sub_1AF9F7D04();
    v23 = (_QWORD *)swift_allocObject();
    v23[2] = v21;
    v23[3] = v22;
    v23[4] = a1;
    v24 = v42;
    v37 = v16;
    v25 = v44;
    v23[5] = v43;
    v23[6] = v25;
    v23[7] = a4;
    v23[8] = a5;
    v23[9] = v24;
    v23[10] = a7;
    v35 = v13;
    v26 = a7;
    v27 = v45;
    v23[11] = v45;
    aBlock[4] = sub_1AF9DAFEC;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_53;
    v34 = _Block_copy(aBlock);
    sub_1AF9C09CC(v21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28 = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1AF9E0134(v26, v27);
    swift_release();
    v29 = v36;
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    v30 = v37;
    v31 = v35;
    sub_1AF9F7DB8();
    v32 = v34;
    v33 = (void *)v38;
    MEMORY[0x1B5DFD9D0](0, v29, v30, v34);
    _Block_release(v32);

    sub_1AF9C09DC(v21);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v30, v31);
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v29, v41);
  }
  return result;
}

id sub_1AF9E69BC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _AppExtensionEventEditHostView.HostCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1AF9E6A84()
{
  id v0;
  void *v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CAA600]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C290);
  sub_1AF9F7A94();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

void sub_1AF9E6AF8(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1AF9E6FE0(a1, a2, *(_QWORD *)(v2 + 8));
}

id sub_1AF9E6B00@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id result;
  objc_super v15;

  v4 = *v1;
  v3 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v8 = v1[4];
  v7 = v1[5];
  v9 = (objc_class *)type metadata accessor for _AppExtensionEventEditHostView.HostCoordinator(0);
  v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_identity];
  v12 = sub_1AF9F7968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_QWORD *)&v10[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_conn] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  v13 = &v10[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent];
  *(_QWORD *)v13 = v4;
  *((_QWORD *)v13 + 1) = v3;
  *((_QWORD *)v13 + 2) = v5;
  *((_QWORD *)v13 + 3) = v6;
  *((_QWORD *)v13 + 4) = v8;
  *((_QWORD *)v13 + 5) = v7;
  swift_retain();
  sub_1AF9C09CC(v5);
  sub_1AF9C09CC(v8);
  v15.receiver = v10;
  v15.super_class = v9;
  result = objc_msgSendSuper2(&v15, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_1AF9E6BFC()
{
  sub_1AF9E802C();
  return sub_1AF9F7A88();
}

uint64_t sub_1AF9E6C4C()
{
  sub_1AF9E802C();
  return sub_1AF9F7A58();
}

void sub_1AF9E6C9C()
{
  sub_1AF9E802C();
  sub_1AF9F7A7C();
  __break(1u);
}

uint64_t sub_1AF9E6CC0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AF9E6CE4()
{
  uint64_t v0;
  id v1;
  _QWORD *v2;
  void *v3;
  void *v4;

  sub_1AF9F7CF8();
  v1 = (id)*sub_1AF9CFC38();
  sub_1AF9F7974();

  swift_beginAccess();
  v2 = (_QWORD *)MEMORY[0x1B5DFEE88](v0 + 16);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90))();

    if (v4)
    {
      objc_msgSend(v4, sel_setExportedObject_, 0);

    }
  }
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

void sub_1AF9E6DD4()
{
  uint64_t v0;

  sub_1AF9E5DE0(v0);
}

uint64_t sub_1AF9E6DDC()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF9E6E08()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t (*v5)(_BYTE *, _QWORD);
  _QWORD *v6;
  _QWORD *v7;
  _BYTE v9[32];

  v1 = *(void **)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 368))();
  sub_1AF9D96E4(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1AF9F7BB4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_updateEventEditViewWithChangedViewConfigurationDictionary_, v4);

  v5 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v2 + 384))(v9);
  v7 = v6;
  swift_bridgeObjectRelease();
  *v7 = MEMORY[0x1E0DEE9E0];
  return v5(v9, 0);
}

uint64_t sub_1AF9E6ED4()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id sub_1AF9E6EF8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_cancelEditing);
}

id sub_1AF9E6F08()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_hasUnsavedChanges);
}

id sub_1AF9E6F28()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_focusAndSelectTitle);
}

id sub_1AF9E6F38()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_focusAndSelectStartDate);
}

uint64_t sub_1AF9E6F48()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF9E6F7C()
{
  uint64_t v0;
  unint64_t v1;

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = *(_QWORD *)(v0 + 88);
  if (v1 >> 60 != 15)
    sub_1AF9E01A0(*(_QWORD *)(v0 + 80), v1);
  return swift_deallocObject();
}

void sub_1AF9E6FE0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  os_log_type_t v36;
  NSObject *v37;
  uint8_t *v38;
  os_log_t v39;
  uint64_t v40;
  char *v41;
  uint8_t *v42;
  uint64_t v43;
  os_log_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;

  v5 = sub_1AF9F78F0();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1AF9F7968();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v48 = (char *)&v42 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BA70);
  v18 = MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v42 - v21;
  objc_opt_self();
  v23 = swift_dynamicCastObjCClass();
  if (v23)
  {
    v24 = (void *)v23;
    v46 = v15;
    v47 = v7;
    v49 = a1;
    v25 = objc_msgSend(v24, sel_navigationController);
    if (v25)
    {
      v26 = v25;
      objc_msgSend(v25, sel_setNavigationBarHidden_, 1);

    }
    sub_1AF9F7D34();
    v27 = sub_1AF9F7D28();
    v28 = *(_QWORD *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v22, 1, v27) == 1)
    {
      sub_1AF9C6BF4((uint64_t)v22, (uint64_t *)&unk_1EEE6BA70);
      v29 = *(void (**)(uint64_t))(*(_QWORD *)a3 + 200);
      v30 = swift_retain();
      v29(v30);
      swift_release();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
      {

        sub_1AF9C6BF4((uint64_t)v10, &qword_1EEE6B878);
      }
      else
      {
        v31 = v48;
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v48, v10, v11);
        v32 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 224);
        v33 = swift_retain();
        v45 = v32(v33);
        v35 = v34;
        swift_release();
        if (v35)
        {
          v36 = sub_1AF9F7CF8();
          v37 = *sub_1AF9CFC38();
          if (os_log_type_enabled(v37, v36))
          {
            swift_bridgeObjectRetain_n();
            v44 = v37;
            v38 = (uint8_t *)swift_slowAlloc();
            v43 = swift_slowAlloc();
            v51 = v43;
            *(_DWORD *)v38 = 136315138;
            v42 = v38 + 4;
            swift_bridgeObjectRetain();
            v50 = sub_1AF9C4DD4(v45, v35, &v51);
            sub_1AF9F7D94();
            swift_bridgeObjectRelease_n();
            v39 = v44;
            _os_log_impl(&dword_1AF84D000, v44, v36, "_AppExtensionEventEditHostView: *** Setting up Remote UI Extension Configuration ***  sceneID: %s.", v38, 0xCu);
            v40 = v43;
            swift_arrayDestroy();
            MEMORY[0x1B5DFEE1C](v40, -1, -1);
            MEMORY[0x1B5DFEE1C](v38, -1, -1);

          }
          v41 = v48;
          (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v46, v48, v11);
          sub_1AF9F78FC();
          sub_1AF9F7D1C();
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v20, 0, 1, v27);
          sub_1AF9F7D40();

          (*(void (**)(char *, uint64_t))(v12 + 8))(v41, v11);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v12 + 8))(v31, v11);

        }
      }
    }
    else
    {

      sub_1AF9C6BF4((uint64_t)v22, (uint64_t *)&unk_1EEE6BA70);
    }
  }
  else
  {
    sub_1AF9F7EF0();
    __break(1u);
  }
}

uint64_t sub_1AF9E74B0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1AF9E74C4()
{
  unint64_t result;

  result = qword_1EEE6C298;
  if (!qword_1EEE6C298)
  {
    result = MEMORY[0x1B5DFEDB0](&unk_1AFA14B28, &type metadata for _AppExtensionEventEditHostView);
    atomic_store(result, (unint64_t *)&qword_1EEE6C298);
  }
  return result;
}

uint64_t destroy for EKEventEditOOPHostView(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 16))
    swift_release();
  if (*(_QWORD *)(a1 + 32))
    swift_release();
  if (*(_QWORD *)(a1 + 48))
    swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EKEventEditOOPHostView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _OWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = (_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  v7 = v4;
  if (v5)
  {
    v8 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  v9 = *(_QWORD *)(a2 + 32);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  v11 = *(_QWORD *)(a2 + 48);
  if (v11)
  {
    v12 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 48) = v11;
    *(_QWORD *)(a1 + 56) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  }
  v13 = *(void **)(a2 + 64);
  v14 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v13;
  *(_QWORD *)(a1 + 72) = v14;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v15;
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v16 = v13;
  v17 = v14;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EKEventEditOOPHostView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v10 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v10)
    {
      v11 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = v10;
      *(_QWORD *)(a1 + 40) = v11;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v10;
    *(_QWORD *)(a1 + 40) = v12;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_15:
  v13 = *(_QWORD *)(a2 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    if (v13)
    {
      v15 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 48) = v13;
      *(_QWORD *)(a1 + 56) = v15;
      swift_retain();
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    goto LABEL_22;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_21;
  }
  v14 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v13;
  *(_QWORD *)(a1 + 56) = v14;
  swift_retain();
  swift_release();
LABEL_22:
  v16 = *(void **)(a1 + 64);
  v17 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v17;
  v18 = v17;

  v19 = *(void **)(a1 + 72);
  v20 = *(void **)(a2 + 72);
  *(_QWORD *)(a1 + 72) = v20;
  v21 = v20;

  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
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

uint64_t assignWithTake for EKEventEditOOPHostView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  v6 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 24) = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    v8 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 24) = v8;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v9 = *(_QWORD *)(a2 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = v9;
      *(_QWORD *)(a1 + 40) = v10;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    v11 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v11;
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_15:
  v12 = *(_QWORD *)(a2 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    if (v12)
    {
      v14 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 48) = v12;
      *(_QWORD *)(a1 + 56) = v14;
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    goto LABEL_22;
  }
  if (!v12)
  {
    swift_release();
    goto LABEL_21;
  }
  v13 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v12;
  *(_QWORD *)(a1 + 56) = v13;
  swift_release();
LABEL_22:

  v15 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v16 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v16;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for EKEventEditOOPHostView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EKEventEditOOPHostView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EKEventEditOOPHostView()
{
  return &type metadata for EKEventEditOOPHostView;
}

uint64_t destroy for _AppExtensionEventEditHostView(uint64_t a1)
{
  uint64_t result;

  result = swift_release();
  if (*(_QWORD *)(a1 + 16))
    result = swift_release();
  if (*(_QWORD *)(a1 + 32))
    return swift_release();
  return result;
}

_QWORD *initializeWithCopy for _AppExtensionEventEditHostView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2 + 2;
  v5 = a2[2];
  swift_retain();
  if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  v8 = a2[4];
  if (v8)
  {
    v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  return a1;
}

_QWORD *assignWithCopy for _AppExtensionEventEditHostView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  v7 = a2[4];
  if (!a1[4])
  {
    if (v7)
    {
      v9 = a2[5];
      a1[4] = v7;
      a1[5] = v9;
      swift_retain();
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  v8 = a2[5];
  a1[4] = v7;
  a1[5] = v8;
  swift_retain();
  swift_release();
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

_QWORD *assignWithTake for _AppExtensionEventEditHostView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  v8 = a2[4];
  if (!a1[4])
  {
    if (v8)
    {
      v10 = a2[5];
      a1[4] = v8;
      a1[5] = v10;
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  v9 = a2[5];
  a1[4] = v8;
  a1[5] = v9;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AppExtensionEventEditHostView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AppExtensionEventEditHostView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _AppExtensionEventEditHostView()
{
  return &type metadata for _AppExtensionEventEditHostView;
}

uint64_t sub_1AF9E7DA4()
{
  return type metadata accessor for _AppExtensionEventEditHostView.Configuration(0);
}

void sub_1AF9E7DAC()
{
  unint64_t v0;
  unint64_t v1;

  sub_1AF9C6868();
  if (v0 <= 0x3F)
  {
    sub_1AF9C6B34(319, (unint64_t *)&unk_1EEE6C2A0, MEMORY[0x1E0DEAFA0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0C96198]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t sub_1AF9E7E90()
{
  return type metadata accessor for _AppExtensionEventEditHostView.HostCoordinator(0);
}

void sub_1AF9E7E98()
{
  unint64_t v0;

  sub_1AF9C6868();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

unint64_t sub_1AF9E7F20()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEE6C310;
  if (!qword_1EEE6C310)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE6C258);
    v2[0] = sub_1AF9E7FA4();
    v2[1] = sub_1AF9C212C(&qword_1EEE6BE20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9170], MEMORY[0x1E0CD9160]);
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEE6C310);
  }
  return result;
}

unint64_t sub_1AF9E7FA4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEE6C318;
  if (!qword_1EEE6C318)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EEE6C320);
    v2[0] = sub_1AF9E74C4();
    v2[1] = MEMORY[0x1E0CDCF98];
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEE6C318);
  }
  return result;
}

void type metadata accessor for EKEventEditRemoteViewAction(uint64_t a1)
{
  sub_1AF9C6B34(a1, (unint64_t *)&unk_1EEE6C340, (uint64_t)&unk_1E6017A30, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEEC78]);
}

unint64_t sub_1AF9E802C()
{
  unint64_t result;

  result = qword_1EEE6C378;
  if (!qword_1EEE6C378)
  {
    result = MEMORY[0x1B5DFEDB0](&unk_1AFA14AB0, &type metadata for _AppExtensionEventEditHostView);
    atomic_store(result, (unint64_t *)&qword_1EEE6C378);
  }
  return result;
}

uint64_t sub_1AF9E8070()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF9E8094()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, unint64_t))(v0 + 16))(0, 0, 0, 0, 0, 0, 0, 0xF000000000000000);
}

uint64_t sub_1AF9E814C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9E81D8(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_1AF9E8220@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x110))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9E8264(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x118))(*a1);
}

uint64_t (*sub_1AF9E82A0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_1AF9E82E4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_1AF9E8328(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *v3;
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  void *v9;
  id v10;
  objc_super v12;

  v3[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostingController] = 0;
  v6 = &v3[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView];
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_WORD *)v6 + 40) = 0;
  v7 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostViewModel;
  type metadata accessor for EKEventOOPHostViewModel();
  v8 = v3;
  *(_QWORD *)&v3[v7] = sub_1AF9E18D0();
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_delegate] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview] = 1;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton] = 1;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode] = 0;
  v8[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView] = 0;

  if (a2)
  {
    v9 = (void *)sub_1AF9F7BCC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for EKEventViewControllerOOPImpl();
  v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, v9, a3);

  return v10;
}

uint64_t type metadata accessor for EKEventViewControllerOOPImpl()
{
  return objc_opt_self();
}

uint64_t sub_1AF9E85B8()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  double v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
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
  uint64_t v65;
  uint64_t v66;
  __int16 v67;
  __int16 v68;
  char *v69;
  id v70;
  uint64_t v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  _QWORD v84[8];
  unsigned __int8 v85;
  char v86;
  char v87;
  char v88;
  char v89;
  char v90;
  char v91;
  char v92;
  unsigned __int8 v93;
  char v94;
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  unsigned __int8 v101;
  char v102;
  objc_super v103;

  v1 = v0;
  v103.receiver = v0;
  v103.super_class = (Class)type metadata accessor for EKEventViewControllerOOPImpl();
  objc_msgSendSuper2(&v103, sel_viewDidLoad);
  v2 = *(id *)((char *)v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostViewModel);
  v3 = sub_1AF9D3D90((uint64_t)v84);
  v4 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v5 = (*(uint64_t (**)(double))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))(v3);
  sub_1AF9D53B0(v5);
  v6 = (*(uint64_t (**)(void))((*v4 & *v0) + 0x1C0))();
  v7 = sub_1AF9D5594(v6 & 1);
  v8 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x1F0))(v7);
  v9 = sub_1AF9D5714(v8 & 1);
  v10 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x220))(v9);
  v11 = sub_1AF9D5894(v10 & 1);
  v12 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x238))(v11);
  v13 = sub_1AF9D5A14(v12 & 1);
  v14 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x250))(v13);
  v15 = sub_1AF9D5B94(v14 & 1);
  v16 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x268))(v15);
  v17 = sub_1AF9D5D14(v16 & 1);
  v18 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x280))(v17);
  v19 = sub_1AF9D5E94(v18 & 1);
  v20 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x298))(v19);
  v21 = sub_1AF9D6014(v20 & 1);
  v22 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x2B0))(v21);
  v23 = sub_1AF9D6194(v22 & 1);
  v24 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x2C8))(v23);
  v25 = sub_1AF9D631C(v24 & 1);
  v26 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x2E0))(v25);
  v27 = sub_1AF9D649C(v26 & 1);
  v28 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x2F8))(v27);
  v29 = sub_1AF9D661C(v28 & 1);
  v30 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x310))(v29);
  v31 = sub_1AF9D679C(v30 & 1);
  v32 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x328))(v31);
  v33 = sub_1AF9D691C(v32 & 1);
  v34 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x340))(v33);
  v35 = sub_1AF9D6AA0(v34 & 1);
  v36 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x358))(v35);
  v37 = sub_1AF9D6C20(v36 & 1);
  v38 = (*(uint64_t (**)(uint64_t))((*v4 & *v0) + 0x370))(v37);
  sub_1AF9D6DA8(v38 & 1);
  v39 = v84[2];
  v82 = (void *)v84[1];
  v83 = v84[0];
  v40 = v84[3];
  v41 = v84[4];
  v42 = v84[5];
  v43 = v84[6];
  v44 = v84[7];
  if (v86)
    v45 = 256;
  else
    v45 = 0;
  v46 = v45 | v85;
  v47 = 0x10000;
  if (v87)
    v48 = 0x10000;
  else
    v48 = 0;
  v49 = 0x1000000;
  if (v88)
    v50 = 0x1000000;
  else
    v50 = 0;
  v51 = v46 | v48 | v50;
  if (v89)
    v52 = 0x100000000;
  else
    v52 = 0;
  if (v90)
    v53 = 0x10000000000;
  else
    v53 = 0;
  v54 = v52 | v53;
  if (v91)
    v55 = 0x1000000000000;
  else
    v55 = 0;
  v56 = v51 | v54 | v55;
  if (v92)
    v57 = 0x100000000000000;
  else
    v57 = 0;
  v81 = v56 | v57;
  if (v94)
    v58 = 256;
  else
    v58 = 0;
  v59 = v58 | v93;
  if (!v95)
    v47 = 0;
  if (!v96)
    v49 = 0;
  v60 = v59 | v47 | v49;
  if (v97)
    v61 = 0x100000000;
  else
    v61 = 0;
  if (v98)
    v62 = 0x10000000000;
  else
    v62 = 0;
  v63 = v61 | v62;
  if (v99)
    v64 = 0x1000000000000;
  else
    v64 = 0;
  v65 = v60 | v63 | v64;
  if (v100)
    v66 = 0x100000000000000;
  else
    v66 = 0;
  v73 = v65 | v66;
  if (v102)
    v67 = 256;
  else
    v67 = 0;
  v68 = v67 | v101;
  v69 = (char *)v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView;
  swift_beginAccess();
  v79 = (void *)*((_QWORD *)v69 + 1);
  v80 = *(_QWORD *)v69;
  v77 = *((_QWORD *)v69 + 3);
  v78 = *((_QWORD *)v69 + 2);
  v75 = *((_QWORD *)v69 + 5);
  v76 = *((_QWORD *)v69 + 4);
  v74 = *((_QWORD *)v69 + 6);
  *(_QWORD *)v69 = v83;
  *((_QWORD *)v69 + 1) = v82;
  *((_QWORD *)v69 + 2) = v39;
  *((_QWORD *)v69 + 3) = v40;
  *((_QWORD *)v69 + 4) = v41;
  *((_QWORD *)v69 + 5) = v42;
  *((_QWORD *)v69 + 6) = v43;
  *((_QWORD *)v69 + 7) = v44;
  *((_QWORD *)v69 + 8) = v81;
  *((_QWORD *)v69 + 9) = v73;
  *((_WORD *)v69 + 40) = v68;
  v70 = v82;
  sub_1AF9C09CC(v39);
  sub_1AF9C09CC(v41);
  sub_1AF9C09CC(v43);
  v71 = sub_1AF9ED76C(v80, v79, v78, v77, v76, v75, v74);
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x170))(v71);

  sub_1AF9C09DC(v39);
  sub_1AF9C09DC(v41);
  return sub_1AF9C09DC(v43);
}

uint64_t sub_1AF9E8B40()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  id v13;
  _QWORD *v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  _QWORD *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void (*v31)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  id v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  uint64_t result;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  __int128 v94;
  __int16 v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  char v119;
  void *v120;
  id v121[2];
  void *v122;
  _QWORD *v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  void (*v127)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v128;
  void (*v129)(uint64_t, uint64_t, uint64_t);
  uint64_t v130;
  char v131;
  char v132;
  char v133;
  char v134;
  char v135;
  char v136;
  char v137;
  char v138;
  char v139;
  char v140;
  char v141;
  char v142;
  char v143;
  char v144;
  char v145;
  char v146;
  char v147;
  char v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  __int16 v157;
  char v158;
  char v159;
  char v160;
  char v161;
  char v162;
  char v163;
  __int16 v164;
  char v165;
  char v166;
  char v167;
  char v168;
  char v169;
  char v170;
  __int16 v171;

  v1 = v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView;
  swift_beginAccess();
  v2 = *(void **)(v1 + 8);
  if (!v2)
    goto LABEL_31;
  v3 = *(_QWORD *)v1;
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v9 = *(_QWORD *)(v1 + 48);
  v8 = *(_QWORD *)(v1 + 56);
  v11 = *(_QWORD *)(v1 + 64);
  v10 = *(_QWORD *)(v1 + 72);
  v12 = *(unsigned __int16 *)(v1 + 80);
  v149 = v3;
  v150 = v2;
  v151 = v4;
  v152 = v5;
  v153 = v6;
  v154 = v7;
  v155 = v9;
  v156 = v8;
  v119 = v11 & 1;
  v157 = v11 & 0x101;
  v118 = (v11 >> 8) & 1;
  v117 = WORD1(v11) & 1;
  v158 = BYTE2(v11) & 1;
  v116 = BYTE3(v11) & 1;
  v159 = BYTE3(v11) & 1;
  v115 = HIDWORD(v11) & 1;
  v160 = BYTE4(v11) & 1;
  v114 = (v11 >> 40) & 1;
  v161 = BYTE5(v11) & 1;
  v113 = HIWORD(v11) & 1;
  v162 = BYTE6(v11) & 1;
  v112 = HIBYTE(v11) & 1;
  v163 = HIBYTE(v11) & 1;
  v111 = v10 & 1;
  v164 = v10 & 0x101;
  v110 = (v10 >> 8) & 1;
  v109 = WORD1(v10) & 1;
  v165 = BYTE2(v10) & 1;
  v108 = BYTE3(v10) & 1;
  v166 = BYTE3(v10) & 1;
  v107 = HIDWORD(v10) & 1;
  v167 = BYTE4(v10) & 1;
  v106 = (v10 >> 40) & 1;
  v168 = BYTE5(v10) & 1;
  v105 = HIWORD(v10) & 1;
  v169 = BYTE6(v10) & 1;
  v104 = HIBYTE(v10) & 1;
  v170 = HIBYTE(v10) & 1;
  v103 = v12 & 1;
  v171 = v12 & 0x101;
  v102 = (v12 >> 8) & 1;
  v92 = v2;
  v120 = (void *)objc_opt_self();
  sub_1AF9ED7D8(v3, v2, v4, v5, v6, v7, v9);
  v95 = v12;
  LOWORD(v89) = v12;
  v96 = v10;
  v97 = v11;
  v124 = v3;
  v101 = v4;
  v99 = v7;
  v100 = v9;
  sub_1AF9ED7D8(v3, v2, v4, v5, v6, v7, v9);
  v98 = v2;
  v13 = objc_msgSend(v120, sel_shared, v11, v10, v89);
  v14 = sub_1AF9D3D88();
  v15 = objc_msgSend(v13, sel_layoutDirectionOrOverride);
  v16 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v14) + 0x108))(v15);

  v17 = sub_1AF9D3D88();
  (*(void (**)(id))((*v16 & *v17) + 0x120))(objc_msgSend(v13, sel_preferredContentSizeCategoryOrOverride));

  v91 = v13;
  v18 = objc_msgSend(v13, sel_viewHierarchyOrOverride);
  v19 = objc_msgSend(v123, sel_view);
  if (!v19)
  {
    __break(1u);
    goto LABEL_18;
  }
  v20 = v19;
  objc_msgSend(v19, sel_bounds);
  v22 = v21;
  v24 = v23;

  v93 = (id)objc_opt_self();
  v25 = objc_msgSend(v93, sel_systemBlueColor);
  v26 = sub_1AF9D3D88();
  v27 = objc_msgSend(v18, sel_ekui_verticalSizeClass);
  v28 = objc_msgSend(v18, sel_ekui_horizontalSizeClass);
  v29 = objc_msgSend(v18, sel_ekui_interfaceOrientation);
  v30 = v25;
  objc_msgSend(v18, sel_ekui_affineTransform);
  *(_OWORD *)v121 = v125;
  v94 = v126;
  v31 = v127;
  v32 = v128;
  v33 = objc_allocWithZone((Class)EKUIViewHierarchyFromComponents);
  v125 = *(_OWORD *)v121;
  v126 = v94;
  v127 = v31;
  v128 = v32;
  v34 = objc_msgSend(v33, sel_initWithSize_verticalSizeClass_horizontalSizeClass_interfaceOrientation_tintColor_affineTranform_, v27, v28, v29, v30, &v125, v22, v24);
  v122 = v30;

  (*(void (**)(id))((*v16 & *v26) + 0x138))(v34);
  v35 = sub_1AF9D3D88();
  LOWORD(v90) = v95;
  v36 = sub_1AF9ED76C(v124, v2, v101, v5, v6, v99, v100);
  v37 = (*(uint64_t (**)(uint64_t))((*v16 & *v123) + 0x110))(v36);
  (*(void (**)(_QWORD))((*v16 & *v35) + 0x150))(v37 & 1);

  v38 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1AF9C09DC(v6);
  v39 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1AF9C09DC(v100);
  v40 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1AF9C09DC(v101);
  v41 = v98;
  sub_1AF9C09CC((uint64_t)sub_1AF9ED9C8);
  sub_1AF9C09CC((uint64_t)sub_1AF9ED868);
  sub_1AF9C09CC((uint64_t)sub_1AF9ED934);

  swift_release();
  swift_release();
  swift_release();
  *(_QWORD *)&v125 = v124;
  *((_QWORD *)&v125 + 1) = v41;
  *(_QWORD *)&v126 = sub_1AF9ED9C8;
  *((_QWORD *)&v126 + 1) = v40;
  v127 = sub_1AF9ED868;
  v128 = v38;
  v129 = sub_1AF9ED934;
  v130 = v39;
  v131 = v119;
  v132 = v118;
  v133 = v117;
  v134 = v116;
  v135 = v115;
  v136 = v114;
  v137 = v113;
  v138 = v112;
  v139 = v111;
  v140 = v110;
  v141 = v109;
  v142 = v108;
  v143 = v107;
  v144 = v106;
  v145 = v105;
  v146 = v104;
  v147 = v103;
  v148 = v102;
  v42 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6C460));
  v43 = (void *)sub_1AF9F7A1C();
  objc_msgSend(v123, sel_addChildViewController_, v43, v97, v96, v90);
  v44 = objc_msgSend(v43, sel_view);
  if (!v44)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v45 = v44;
  objc_msgSend(v44, sel_setInsetsLayoutMarginsFromSafeArea_, 0);

  v46 = objc_msgSend(v43, sel_view);
  if (!v46)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v47 = v46;
  v48 = objc_msgSend(v93, sel_systemBackgroundColor);
  objc_msgSend(v47, sel_setBackgroundColor_, v48);

  v49 = objc_msgSend(v123, sel_view);
  if (!v49)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v50 = v49;
  v51 = objc_msgSend(v43, sel_view);
  if (!v51)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v52 = v51;
  objc_msgSend(v50, sel_addSubview_, v51);

  objc_msgSend(v43, sel_didMoveToParentViewController_, v123);
  v53 = *(void **)((char *)v123 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostingController);
  *(_QWORD *)((char *)v123 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostingController) = v43;
  v54 = v43;

  v55 = objc_msgSend(v54, sel_view);
  if (!v55)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v56 = v55;
  objc_msgSend(v55, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BB30);
  v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_1AFA14080;
  v58 = objc_msgSend(v54, sel_view);
  if (!v58)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v59 = v58;
  v60 = objc_msgSend(v58, sel_leadingAnchor);

  v61 = objc_msgSend(v123, sel_view);
  if (!v61)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v62 = v61;
  v63 = objc_msgSend(v61, sel_leadingAnchor);

  v64 = objc_msgSend(v60, sel_constraintEqualToAnchor_, v63);
  *(_QWORD *)(v57 + 32) = v64;
  v65 = objc_msgSend(v54, sel_view);
  if (!v65)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v66 = v65;
  v67 = objc_msgSend(v65, sel_topAnchor);

  v68 = objc_msgSend(v123, sel_view);
  if (!v68)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v69 = v68;
  v70 = objc_msgSend(v68, sel_topAnchor);

  v71 = objc_msgSend(v67, (SEL)&selRef_dataSource + 6, v70);
  *(_QWORD *)(v57 + 40) = v71;
  v72 = objc_msgSend(v54, sel_view);
  if (!v72)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v73 = v72;
  v74 = objc_msgSend(v72, sel_trailingAnchor);

  v75 = objc_msgSend(v123, sel_view);
  if (!v75)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v76 = v75;
  v77 = objc_msgSend(v75, sel_trailingAnchor);

  v78 = objc_msgSend(v74, (SEL)&selRef_dataSource + 6, v77);
  *(_QWORD *)(v57 + 48) = v78;
  v79 = objc_msgSend(v54, sel_view);
  if (v79)
  {
    v80 = v79;
    v81 = objc_msgSend(v79, sel_bottomAnchor);

    v82 = objc_msgSend(v123, sel_view);
    if (v82)
    {
      v83 = v82;
      v84 = (void *)objc_opt_self();
      v85 = objc_msgSend(v83, sel_bottomAnchor);

      v86 = objc_msgSend(v81, (SEL)&selRef_dataSource + 6, v85);
      *(_QWORD *)(v57 + 56) = v86;
      *(_QWORD *)&v125 = v57;
      sub_1AF9F7C44();
      sub_1AF9C6B78(0, &qword_1EEE6C470);
      v87 = (void *)sub_1AF9F7C20();
      swift_bridgeObjectRelease();
      objc_msgSend(v84, sel_activateConstraints_, v87);

      swift_unknownObjectRelease();
      sub_1AF9C09DC((uint64_t)sub_1AF9ED9C8);
      sub_1AF9C09DC((uint64_t)sub_1AF9ED868);
      return sub_1AF9C09DC((uint64_t)sub_1AF9ED934);
    }
    goto LABEL_30;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  result = sub_1AF9F7EF0();
  __break(1u);
  return result;
}

void sub_1AF9E9710(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8)
{
  _QWORD *v8;
  os_log_type_t v11;
  os_log_t *v12;
  os_log_t v13;
  os_log_type_t v14;
  NSObject *v15;
  uint8_t *v16;
  os_log_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSBundle *v27;
  NSBundle *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  os_log_type_t v60;
  os_log_t v61;
  os_log_type_t v62;
  NSObject *v63;
  uint8_t *v64;
  NSBundle *v65;
  NSBundle *v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t);
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  _BOOL4 IsRegularInViewHierarchy;
  id v83;
  _BOOL4 IsRegular;
  NSBundle *v85;
  NSBundle *v86;
  NSBundle *v87;
  NSBundle *v88;
  id v89;
  void *v90;
  id v91;
  unint64_t v92;
  _QWORD *v93;
  void *v98;
  uint64_t v99;

  v11 = sub_1AF9F7CF8();
  v12 = (os_log_t *)sub_1AF9CFC38();
  v13 = *v12;
  v14 = v11;
  if (os_log_type_enabled(*v12, v11))
  {
    swift_bridgeObjectRetain_n();
    v15 = v13;
    v16 = (uint8_t *)swift_slowAlloc();
    v93 = v8;
    v17 = v12;
    v18 = a5;
    v19 = swift_slowAlloc();
    v99 = v19;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    sub_1AF9C4DD4(a1, a2, &v99);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AF84D000, v15, v14, "EKEventViewControllerOOPImpl: Received remoteEventViewControllerRequestPresentView on the host app side. viewName: %s", v16, 0xCu);
    swift_arrayDestroy();
    v20 = v19;
    a5 = v18;
    v12 = v17;
    v8 = v93;
    MEMORY[0x1B5DFEE1C](v20, -1, -1);
    MEMORY[0x1B5DFEE1C](v16, -1, -1);

  }
  v21 = objc_msgSend(v8, sel_parentViewController);
  if (!v21)
    goto LABEL_20;
  v22 = v21;
  v23 = objc_msgSend(v21, sel_parentViewController);

  if (!v23)
    goto LABEL_20;
  objc_opt_self();
  v24 = swift_dynamicCastObjCClass();
  if (!v24)
  {

LABEL_20:
    sub_1AF9F7CEC();
    v39 = *v12;
    sub_1AF9F7974();
    goto LABEL_34;
  }
  v25 = (void *)v24;
  if (a1 == 0xD000000000000027 && a2 == 0x80000001AFA21930 || (sub_1AF9F7F50() & 1) != 0)
  {
    v26 = v25;
    v27 = EventKitUIBundle();
    if (v27)
    {
      v28 = v27;
      sub_1AF9F7890();

      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C478);
      v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_1AFA14C60;
      v30 = sub_1AF9F5530();
      v31 = v30[1];
      *(_QWORD *)(v29 + 32) = *v30;
      *(_QWORD *)(v29 + 40) = v31;
      v32 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v33 = (void *)sub_1AF9F7BCC();
      swift_bridgeObjectRelease();
      v34 = (void *)sub_1AF9F7BCC();
      swift_bridgeObjectRelease();
      v35 = (id)sub_1AF9F7C20();
      swift_bridgeObjectRelease();
      v36 = objc_msgSend(v32, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, v33, v34, 0, v35, 0x80000001AFA21B10);

LABEL_11:
      v38 = a8;
      v37 = a7;
      v25 = v26;
LABEL_12:

      goto LABEL_13;
    }
    __break(1u);
    goto LABEL_73;
  }
  if ((a1 != 0xD000000000000018 || a2 != 0x80000001AFA20540) && (sub_1AF9F7F50() & 1) == 0)
  {
    if (a1 == 0xD00000000000001FLL && a2 == 0x80000001AFA21960 || (sub_1AF9F7F50() & 1) != 0)
    {
      v98 = v25;
      v65 = EventKitUIBundle();
      if (v65)
      {
        v66 = v65;
        sub_1AF9F7890();

        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C478);
        v67 = swift_allocObject();
        *(_OWORD *)(v67 + 16) = xmmword_1AFA14C60;
        v68 = sub_1AF9F5584();
        v69 = v68[1];
        *(_QWORD *)(v67 + 32) = *v68;
        *(_QWORD *)(v67 + 40) = v69;
        v70 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v8) + 0x1A8);
        swift_bridgeObjectRetain();
        v71 = swift_bridgeObjectRetain();
        v35 = (id)v70(v71);
        v72 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
        v73 = (void *)sub_1AF9F7BCC();
        swift_bridgeObjectRelease();
        v74 = (void *)sub_1AF9F7BCC();
        swift_bridgeObjectRelease();
        v75 = (void *)sub_1AF9F7C20();
        swift_bridgeObjectRelease();
        v36 = objc_msgSend(v72, sel_initWithTitle_viewID_event_leftBarButtonActions_rightBarButtonActions_, v73, v74, v35, 0, v75, 0x80000001AFA21AC0);

        v38 = a8;
        v37 = a7;
        v25 = v98;
        goto LABEL_12;
      }
LABEL_73:
      __break(1u);
      goto LABEL_74;
    }
    if (a1 == 0xD000000000000022 && a2 == 0x80000001AFA21980 || (sub_1AF9F7F50() & 1) != 0)
    {
      v78 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
      swift_bridgeObjectRetain();
      v79 = (void *)sub_1AF9F7BCC();
      swift_bridgeObjectRelease();
      v80 = objc_msgSend(v78, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, 0, v79, 0, 0);

      v35 = v80;
      v81 = objc_msgSend(v35, sel_view);
      IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v81);

      if (IsRegularInViewHierarchy)
      {
        v83 = objc_msgSend(v35, sel_view);
        IsRegular = EKUICurrentHeightSizeClassIsRegular(v83);

        if (IsRegular)
          objc_msgSend(v35, sel_setModalPresentationStyle_, 3);
      }
      v36 = v35;
      goto LABEL_70;
    }
    if (a1 == 0xD000000000000023 && a2 == 0x80000001AFA219B0 || (sub_1AF9F7F50() & 1) != 0)
    {
      v85 = EventKitUIBundle();
      if (!v85)
      {
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      v86 = v85;
      v92 = 0x80000001AFA21A60;
    }
    else if (a1 == 0xD000000000000023 && a2 == 0x80000001AFA219E0 || (sub_1AF9F7F50() & 1) != 0)
    {
      v87 = EventKitUIBundle();
      if (!v87)
      {
LABEL_75:
        __break(1u);
        goto LABEL_76;
      }
      v86 = v87;
      v92 = 0x80000001AFA21A10;
    }
    else
    {
      if ((a1 != 0xD000000000000016 || a2 != 0x80000001AFA20560) && (sub_1AF9F7F50() & 1) == 0)
      {
        v91 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
        swift_bridgeObjectRetain();
        v35 = (id)sub_1AF9F7BCC();
        swift_bridgeObjectRelease();
        v36 = objc_msgSend(v91, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, 0, v35, 0, 0);
        goto LABEL_70;
      }
      v88 = EventKitUIBundle();
      if (!v88)
      {
LABEL_76:
        __break(1u);
        return;
      }
      v86 = v88;
      v92 = 0x80000001AFA20580;
    }
    sub_1AF9F7890();

    v89 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
    swift_bridgeObjectRetain();
    v90 = (void *)sub_1AF9F7BCC();
    swift_bridgeObjectRelease();
    v35 = (id)sub_1AF9F7BCC();
    swift_bridgeObjectRelease();
    v36 = objc_msgSend(v89, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, v90, v35, 0, 0, v92);

LABEL_70:
    v38 = a8;
    v37 = a7;
    goto LABEL_12;
  }
  v26 = v25;
  v42 = objc_allocWithZone((Class)EKEventGenericDetailViewControllerOOPWrapperImpl);
  swift_bridgeObjectRetain();
  v43 = (void *)sub_1AF9F7BCC();
  swift_bridgeObjectRelease();
  v44 = objc_msgSend(v42, sel_initWithTitle_viewID_leftBarButtonActions_rightBarButtonActions_, 0, v43, 0, 0);

  v36 = v44;
  v45 = objc_msgSend(v8, sel_traitCollection);
  v46 = objc_msgSend(v45, sel_userInterfaceIdiom);

  if (v46 == (id)1
    || (v47 = objc_msgSend(v8, sel_traitCollection),
        v48 = objc_msgSend(v47, sel_userInterfaceIdiom),
        v47,
        v48 == (id)5))
  {
    objc_msgSend(v36, sel_setModalPresentationStyle_, 7);
    v49 = objc_msgSend(v36, sel_popoverPresentationController);
    if (v49)
    {
      v50 = v49;
      v51 = objc_msgSend(v8, sel_view);
      objc_msgSend(v50, sel_setSourceView_, v51);

    }
    objc_msgSend(a6, sel_CGRectValue);
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v59 = v58;
    v35 = objc_msgSend(v36, sel_popoverPresentationController);

    v38 = a8;
    if (v35)
    {
      objc_msgSend(v35, sel_setSourceRect_, v53 + v57 * 0.5, v55 + v59 * 0.5 + 64.0, 0.0, 0.0);
      v37 = a7;
      goto LABEL_12;
    }
    v37 = a7;
  }
  else
  {
    v76 = objc_msgSend(v36, sel_sheetPresentationController);

    if (v76)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BB30);
      v77 = swift_allocObject();
      *(_OWORD *)(v77 + 16) = xmmword_1AFA14090;
      *(_QWORD *)(v77 + 32) = objc_msgSend((id)objc_opt_self(), sel_largeDetent);
      v99 = v77;
      sub_1AF9F7C44();
      sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6C480);
      v35 = (id)sub_1AF9F7C20();
      swift_bridgeObjectRelease();
      objc_msgSend(v76, sel_setDetents_, v35);

      goto LABEL_11;
    }
    v38 = a8;
    v37 = a7;
  }
LABEL_13:
  objc_msgSend(v36, sel_setOopContentBackgroundColor_, v38);
  v39 = v36;
  objc_msgSend(v37, sel_CGSizeValue);
  -[NSObject setPreferredContentSize:](v39, sel_setPreferredContentSize_);

  v40 = objc_msgSend(v25, sel_navigationDelegate);
  if (!v40)
  {
LABEL_33:

    goto LABEL_34;
  }
  v41 = v40;
  if (a5 == 2)
  {
    -[NSObject setModalPresentationStyle:](v39, sel_setModalPresentationStyle_, 2);
    goto LABEL_31;
  }
  if (a5 == 1)
  {
LABEL_31:
    objc_msgSend(v41, sel_presentViewController_animated_completion_, v39, 1, 0);
LABEL_32:
    swift_unknownObjectRelease();
    goto LABEL_33;
  }
  if (a5)
  {
    v60 = sub_1AF9F7CEC();
    v61 = *v12;
    v62 = v60;
    if (os_log_type_enabled(*v12, v60))
    {
      v63 = v61;
      v64 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v64 = 134217984;
      v99 = a5;
      sub_1AF9F7D94();
      _os_log_impl(&dword_1AF84D000, v63, v62, "EKEventViewControllerOOPImpl: presentationStyle not recognized: %ld", v64, 0xCu);
      MEMORY[0x1B5DFEE1C](v64, -1, -1);
      swift_unknownObjectRelease();

      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if ((objc_msgSend(v40, sel_respondsToSelector_, sel_pushViewController_animated_) & 1) != 0)
  {
    objc_msgSend(v41, sel_pushViewController_animated_, v39, 1);

    swift_unknownObjectRelease();
LABEL_34:

    return;
  }

  swift_unknownObjectRelease();
}

void sub_1AF9EA554(uint64_t a1, unint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  os_log_type_t v8;
  os_log_t *v9;
  os_log_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint8_t *v14;
  id v15;
  void *v16;
  os_log_t v17;
  id v18;
  void *v19;
  id v20;
  os_log_type_t v21;
  NSObject *v22;
  os_log_type_t v23;
  NSObject *v24;
  uint8_t *v25;
  NSObject *log;
  uint64_t v27;
  uint64_t v28;

  v4 = v3;
  v8 = sub_1AF9F7CF8();
  v9 = (os_log_t *)sub_1AF9CFC38();
  v10 = *v9;
  if (os_log_type_enabled(*v9, v8))
  {
    swift_bridgeObjectRetain_n();
    log = v10;
    v27 = a3;
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v28 = v12;
    *(_DWORD *)v11 = 136315138;
    if (a2)
    {
      v13 = a2;
    }
    else
    {
      a1 = 7104878;
      v13 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    sub_1AF9C4DD4(a1, v13, &v28);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AF84D000, log, v8, "EKEventViewControllerOOPImpl: Received remoteViewControllerRequestDismissView on the host app side. viewName: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v12, -1, -1);
    v14 = v11;
    a3 = v27;
    MEMORY[0x1B5DFEE1C](v14, -1, -1);

  }
  v15 = objc_msgSend(v4, sel_parentViewController, log);
  if (v15
    && (v16 = v15,
        v17 = (os_log_t)objc_msgSend(v15, sel_parentViewController),
        v16,
        v17))
  {
    if ((unint64_t)(a3 - 1) >= 2)
    {
      if (a3)
      {
        v21 = sub_1AF9F7CEC();
        v22 = *v9;
        v23 = v21;
        if (os_log_type_enabled(v22, v21))
        {
          v24 = v22;
          v25 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v25 = 134217984;
          v28 = a3;
          sub_1AF9F7D94();
          _os_log_impl(&dword_1AF84D000, v24, v23, "EKEventViewControllerOOPImpl: presentationStyle not recognized: %ld", v25, 0xCu);
          MEMORY[0x1B5DFEE1C](v25, -1, -1);

        }
      }
      else
      {
        v18 = -[NSObject navigationController](v17, sel_navigationController);
        if (v18)
        {
          v19 = v18;
          v20 = objc_msgSend(v18, sel_popViewControllerAnimated_, 1);

        }
      }
    }
    else
    {
      -[NSObject dismissViewControllerAnimated:completion:](v17, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }
  }
  else
  {
    sub_1AF9F7CEC();
    v17 = *v9;
    sub_1AF9F7974();
  }

}

void sub_1AF9EA880(uint64_t a1)
{
  _QWORD *v1;
  uint64_t *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  sub_1AF9F7CF8();
  v3 = sub_1AF9CFC38();
  v4 = (id)*v3;
  sub_1AF9F7974();

  v5 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x1D8))();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(v1, sel_parentViewController);
    if (v7)
    {
      v8 = v7;
      v10 = objc_msgSend(v7, sel_parentViewController);

      if (v10)
      {
        objc_opt_self();
        v9 = swift_dynamicCastObjCClass();
        if (v9)
        {
          objc_msgSend(v6, sel_eventViewController_didCompleteWithAction_, v9, a1);
LABEL_9:
          swift_unknownObjectRelease();

          return;
        }

      }
    }
    sub_1AF9F7CEC();
    v10 = (id)*v3;
    sub_1AF9F7974();
    goto LABEL_9;
  }
}

uint64_t sub_1AF9EAA08()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  result = swift_beginAccess();
  v3 = (void *)v1[1];
  if (v3)
  {
    v5 = v1[4];
    v4 = v1[5];
    v6 = v1[2];
    v7 = v1[3];
    v10 = *v1;
    v8 = v1[6];
    v9 = v3;
    sub_1AF9C09CC(v6);
    sub_1AF9C09CC(v5);
    sub_1AF9C09CC(v8);
    sub_1AF9D5124();
    return sub_1AF9ED76C(v10, v3, v6, v7, v5, v4, v8);
  }
  return result;
}

uint64_t sub_1AF9EAD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  result = swift_beginAccess();
  v11 = (void *)v9[1];
  if (v11)
  {
    v20 = a1;
    v12 = v9[6];
    v13 = v9[4];
    v14 = v9[5];
    v18 = a4;
    v16 = v9[2];
    v15 = v9[3];
    v19 = *v9;
    v17 = v11;
    sub_1AF9C09CC(v16);
    sub_1AF9C09CC(v13);
    sub_1AF9C09CC(v12);
    sub_1AF9D5240(v20, a2, a3, v18);
    return sub_1AF9ED76C(v19, v11, v16, v15, v13, v14, v12);
  }
  return result;
}

uint64_t sub_1AF9EB168(char a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char v13;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView);
  result = swift_beginAccess();
  v5 = (void *)v3[1];
  if (v5)
  {
    v13 = a1;
    v6 = v3[4];
    v7 = v3[5];
    v8 = v3[2];
    v9 = v3[3];
    v12 = *v3;
    v10 = v3[6];
    v11 = v5;
    sub_1AF9C09CC(v8);
    sub_1AF9C09CC(v6);
    sub_1AF9C09CC(v10);
    sub_1AF9D5330(v13 & 1);
    return sub_1AF9ED76C(v12, v5, v8, v9, v6, v7, v10);
  }
  return result;
}

void *sub_1AF9EB550()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9EB5E4(void *a1)
{
  sub_1AF9EDA38(a1);

}

uint64_t sub_1AF9EB608@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1A8))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9EB648(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1B0);
  v4 = *a1;
  return v3(v2);
}

void (*sub_1AF9EB694(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EB6EC;
}

void sub_1AF9EB6EC(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t (*v4)();
  uint64_t v5;
  void **v6;
  void *v7;
  id v8;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = sub_1AF9E82E4();
    if (*(_QWORD *)(v5 + 8))
    {
      v6 = (void **)(v3[7] + v3[8]);
      swift_beginAccess();
      v7 = *v6;
      v8 = v7;
      sub_1AF9D53B0((uint64_t)v7);
    }
    ((void (*)(_QWORD *, _QWORD))v4)(v3, 0);
  }
  free(v3);
}

uint64_t sub_1AF9EB7BC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EB814(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing, (void (*)(_QWORD))sub_1AF9D5594);
}

uint64_t sub_1AF9EB828@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1C0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9EB86C(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1C8))(*a1);
}

void (*sub_1AF9EB8A8(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EB900;
}

void sub_1AF9EB900(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D5594);
}

uint64_t sub_1AF9EB954()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_1AF9EBA00(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_delegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_1AF9EBA50@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1D8))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9EBA90(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1E0);
  v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1AF9EBAD0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9EBB58()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EBBB0(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview, (void (*)(_QWORD))sub_1AF9D5714);
}

uint64_t sub_1AF9EBBC4@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x1F0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9EBC08(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x1F8))(*a1);
}

void (*sub_1AF9EBC44(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EBC9C;
}

void sub_1AF9EBC9C(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D5714);
}

uint64_t sub_1AF9EBCEC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EBD78(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_1AF9EBDC0@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x208))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9EBE04(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x210))(*a1);
}

uint64_t (*sub_1AF9EBE40())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9EBEC8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EBF20(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView, (void (*)(_QWORD))sub_1AF9D5894);
}

void (*sub_1AF9EBF34(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EBF8C;
}

void sub_1AF9EBF8C(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D5894);
}

uint64_t sub_1AF9EBFDC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EC034(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter, (void (*)(_QWORD))sub_1AF9D5A14);
}

uint64_t sub_1AF9EC048@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x238))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9EC08C(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x240))(*a1);
}

void (*sub_1AF9EC0C8(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EC120;
}

void sub_1AF9EC120(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D5A14);
}

uint64_t sub_1AF9EC170()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EC1C8(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview, (void (*)(_QWORD))sub_1AF9D5B94);
}

void (*sub_1AF9EC1DC(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EC234;
}

void sub_1AF9EC234(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D5B94);
}

uint64_t sub_1AF9EC284()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EC2DC(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses, (void (*)(_QWORD))sub_1AF9D5D14);
}

void (*sub_1AF9EC2F0(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EC348;
}

void sub_1AF9EC348(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D5D14);
}

uint64_t sub_1AF9EC398()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EC3F0(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview, (void (*)(_QWORD))sub_1AF9D5E94);
}

uint64_t sub_1AF9EC404@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x280))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9EC448(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x288))(*a1);
}

void (*sub_1AF9EC484(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EC4DC;
}

void sub_1AF9EC4DC(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D5E94);
}

uint64_t sub_1AF9EC52C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EC584(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview, (void (*)(_QWORD))sub_1AF9D6014);
}

void (*sub_1AF9EC598(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EC5F0;
}

void sub_1AF9EC5F0(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D6014);
}

uint64_t sub_1AF9EC640()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EC698(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview, (void (*)(_QWORD))sub_1AF9D6194);
}

uint64_t sub_1AF9EC6AC@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x2B0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9EC6F0(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x2B8))(*a1);
}

void (*sub_1AF9EC72C(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EC784;
}

void sub_1AF9EC784(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D6194);
}

uint64_t sub_1AF9EC7D4()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EC82C(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems, (void (*)(_QWORD))sub_1AF9D631C);
}

uint64_t sub_1AF9EC840@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x2C8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9EC884(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x2D0))(*a1);
}

void (*sub_1AF9EC8C0(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9EC918;
}

void sub_1AF9EC918(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D631C);
}

uint64_t sub_1AF9EC968()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EC9C0(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage, (void (*)(_QWORD))sub_1AF9D649C);
}

void (*sub_1AF9EC9D4(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9ECA2C;
}

void sub_1AF9ECA2C(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D649C);
}

uint64_t sub_1AF9ECA7C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9ECAD4(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage, (void (*)(_QWORD))sub_1AF9D661C);
}

void (*sub_1AF9ECAE8(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9ECB40;
}

void sub_1AF9ECB40(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D661C);
}

uint64_t sub_1AF9ECB90()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9ECBE8(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage, (void (*)(_QWORD))sub_1AF9D679C);
}

uint64_t sub_1AF9ECBFC@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x310))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9ECC40(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x318))(*a1);
}

void (*sub_1AF9ECC7C(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9ECCD4;
}

void sub_1AF9ECCD4(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D679C);
}

uint64_t sub_1AF9ECD24()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9ECD7C(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem, (void (*)(_QWORD))sub_1AF9D691C);
}

uint64_t sub_1AF9ECD90@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x328))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9ECDD4(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x330))(*a1);
}

void (*sub_1AF9ECE10(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9ECE68;
}

void sub_1AF9ECE68(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D691C);
}

uint64_t sub_1AF9ECEB8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9ECF10(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode, (void (*)(_QWORD))sub_1AF9D6AA0);
}

uint64_t sub_1AF9ECF24@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x340))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9ECF68(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x348))(*a1);
}

void (*sub_1AF9ECFA4(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9ECFFC;
}

void sub_1AF9ECFFC(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D6AA0);
}

uint64_t sub_1AF9ED04C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9ED0A4(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode, (void (*)(_QWORD))sub_1AF9D6C20);
}

uint64_t sub_1AF9ED0B8@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x358))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9ED0FC(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x360))(*a1);
}

void (*sub_1AF9ED138(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9ED190;
}

void sub_1AF9ED190(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D6C20);
}

uint64_t sub_1AF9ED1E0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView);
  swift_beginAccess();
  return *v1;
}

void sub_1AF9ED238(char *a1, uint64_t a2, char a3, _QWORD *a4, void (*a5)(_QWORD))
{
  char *v8;
  char *v9;
  uint64_t (*v10)();
  uint64_t v11;
  char v12[32];

  v8 = &a1[*a4];
  swift_beginAccess();
  *v8 = a3;
  v9 = a1;
  v10 = sub_1AF9E82E4();
  if (*(_QWORD *)(v11 + 8))
  {
    swift_beginAccess();
    a5(*v8);
  }
  ((void (*)(char *, _QWORD))v10)(v12, 0);

}

uint64_t sub_1AF9ED2E4(char a1)
{
  return sub_1AF9ED2F8(a1, &OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView, (void (*)(_QWORD))sub_1AF9D6DA8);
}

uint64_t sub_1AF9ED2F8(char a1, _QWORD *a2, void (*a3)(_QWORD))
{
  uint64_t v3;
  _BYTE *v6;
  uint64_t (*v7)();
  uint64_t v8;
  _BYTE v10[32];

  v6 = (_BYTE *)(v3 + *a2);
  swift_beginAccess();
  *v6 = a1;
  v7 = sub_1AF9E82E4();
  if (*(_QWORD *)(v8 + 8))
  {
    swift_beginAccess();
    a3(*v6);
  }
  return ((uint64_t (*)(_BYTE *, _QWORD))v7)(v10, 0);
}

uint64_t sub_1AF9ED388@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x370))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9ED3CC(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x378))(*a1);
}

void (*sub_1AF9ED408(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView;
  v3[7] = v1;
  v3[8] = v4;
  swift_beginAccess();
  return sub_1AF9ED460;
}

void sub_1AF9ED460(_QWORD **a1, char a2)
{
  sub_1AF9ED46C(a1, a2, (void (*)(_QWORD))sub_1AF9D6DA8);
}

void sub_1AF9ED46C(_QWORD **a1, char a2, void (*a3)(_QWORD))
{
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t v7;
  unsigned __int8 *v8;

  v5 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v6 = sub_1AF9E82E4();
    if (*(_QWORD *)(v7 + 8))
    {
      v8 = (unsigned __int8 *)(v5[7] + v5[8]);
      swift_beginAccess();
      a3(*v8);
    }
    ((void (*)(_QWORD *, _QWORD))v6)(v5, 0);
  }
  free(v5);
}

id EKEventViewControllerOOPImpl.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventViewControllerOOPImpl();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1AF9ED5BC()
{
  _BYTE *v0;
  char *v1;
  uint64_t v2;

  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hasInProcessNavBar] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostingController] = 0;
  v1 = &v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostView];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_WORD *)v1 + 40) = 0;
  v2 = OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_hostViewModel;
  type metadata accessor for EKEventOOPHostViewModel();
  *(_QWORD *)&v0[v2] = sub_1AF9E18D0();
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsEditing] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_delegate] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsCalendarPreview] = 1;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDoneButton] = 1;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_calendarPreviewIsInlineDayView] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_inlineDayViewRespectsSelectedCalendarsFilter] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_ICSPreview] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsInviteResponses] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsAddToCalendarForICSPreview] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsUpdateCalendarForICSPreview] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDeleteForICSPreview] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_allowsSubitems] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsOutOfDateMessage] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegatorMessage] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDelegateMessage] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_showsDetectedConferenceItem] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_minimalMode] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_noninteractivePlatterMode] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_isLargeDayView] = 0;

  sub_1AF9F7EF0();
  __break(1u);
}

uint64_t sub_1AF9ED76C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;

  if (a2)
  {

    sub_1AF9C09DC(a3);
    sub_1AF9C09DC(a5);
    return sub_1AF9C09DC(a7);
  }
  return result;
}

uint64_t sub_1AF9ED7D8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v10;
  uint64_t result;

  if (a2)
  {
    v10 = a2;
    sub_1AF9C09CC(a3);
    sub_1AF9C09CC(a5);
    return sub_1AF9C09CC(a7);
  }
  return result;
}

uint64_t sub_1AF9ED844()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AF9ED868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v17;
  void *v18;

  swift_beginAccess();
  v17 = (_QWORD *)MEMORY[0x1B5DFEE88](v8 + 16);
  if (v17)
  {
    v18 = v17;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v17) + 0x178))(a1, a2, a3, a4, a5, a6, a7, a8);

  }
}

void sub_1AF9ED934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  void *v8;

  swift_beginAccess();
  v7 = (_QWORD *)MEMORY[0x1B5DFEE88](v3 + 16);
  if (v7)
  {
    v8 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v7) + 0x180))(a1, a2, a3);

  }
}

void sub_1AF9ED9C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;

  swift_beginAccess();
  v3 = (_QWORD *)MEMORY[0x1B5DFEE88](v1 + 16);
  if (v3)
  {
    v4 = v3;
    (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v3) + 0x188))(a1);

  }
}

uint64_t sub_1AF9EDA38(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  uint64_t (*v6)();
  uint64_t v7;
  void *v8;
  id v9;
  _BYTE v11[32];

  v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI28EKEventViewControllerOOPImpl_event);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = sub_1AF9E82E4();
  if (*(_QWORD *)(v7 + 8))
  {
    swift_beginAccess();
    v8 = *v3;
    v9 = v8;
    sub_1AF9D53B0((uint64_t)v8);
  }
  return ((uint64_t (*)(_BYTE *, _QWORD))v6)(v11, 0);
}

uint64_t method lookup function for EKEventViewControllerOOPImpl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.hasInProcessNavBar.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.hasInProcessNavBar.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.hasInProcessNavBar.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.doneButtonTapped()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.eventEditViewCompleted(with:eventID:waitUntil:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.eventEditViewPresented(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.event.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.event.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.event.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsEditing.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsEditing.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsEditing.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsCalendarPreview.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsCalendarPreview.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsCalendarPreview.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDoneButton.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDoneButton.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDoneButton.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x218))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.calendarPreviewIsInlineDayView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.calendarPreviewIsInlineDayView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x228))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.calendarPreviewIsInlineDayView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.inlineDayViewRespectsSelectedCalendarsFilter.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.inlineDayViewRespectsSelectedCalendarsFilter.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x240))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.inlineDayViewRespectsSelectedCalendarsFilter.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.ICSPreview.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.ICSPreview.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.ICSPreview.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsInviteResponses.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsInviteResponses.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsInviteResponses.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsAddToCalendarForICSPreview.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsAddToCalendarForICSPreview.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsAddToCalendarForICSPreview.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsUpdateCalendarForICSPreview.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsUpdateCalendarForICSPreview.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsUpdateCalendarForICSPreview.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDeleteForICSPreview.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDeleteForICSPreview.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDeleteForICSPreview.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsSubitems.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsSubitems.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.allowsSubitems.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsOutOfDateMessage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsOutOfDateMessage.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsOutOfDateMessage.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegatorMessage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegatorMessage.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x300))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegatorMessage.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x308))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegateMessage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x310))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegateMessage.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x318))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDelegateMessage.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x320))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDetectedConferenceItem.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x328))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDetectedConferenceItem.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x330))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.showsDetectedConferenceItem.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x338))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.minimalMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x340))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.minimalMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x348))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.minimalMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x350))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.noninteractivePlatterMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x358))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.noninteractivePlatterMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x360))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.noninteractivePlatterMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x368))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.isLargeDayView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x370))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.isLargeDayView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x378))();
}

uint64_t dispatch thunk of EKEventViewControllerOOPImpl.isLargeDayView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x380))();
}

uint64_t sub_1AF9EE220()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_remoteUIConfigured);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EE264(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_remoteUIConfigured);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9EE2AC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9EE2F0()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AF9F79BC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF9EE360()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_1AF9F79C8();
}

void (*sub_1AF9EE3C8(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9E076C;
}

uint64_t sub_1AF9EE440()
{
  return sub_1AF9E0A50((uint64_t)&OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__configuration, &qword_1EEE6C4F8);
}

uint64_t sub_1AF9EE454(uint64_t a1)
{
  return sub_1AF9E0AD0(a1, &qword_1EEE6C500, (uint64_t)&OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__configuration, &qword_1EEE6C4F8);
}

void (*sub_1AF9EE470(_QWORD *a1))(uint64_t, char)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C500);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__configuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C4F8);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9E0868;
}

uint64_t sub_1AF9EE538()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AF9F79BC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF9EE5A8@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xD0))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9EE5E8(id *a1, _QWORD **a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xD8);
  v4 = *a1;
  return v3(v2);
}

uint64_t sub_1AF9EE634()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_1AF9F79C8();
}

void (*sub_1AF9EE69C(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9E076C;
}

uint64_t sub_1AF9EE714()
{
  return sub_1AF9E0A50((uint64_t)&OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__event, &qword_1EEE6C510);
}

uint64_t sub_1AF9EE728(uint64_t a1)
{
  return sub_1AF9E0AD0(a1, &qword_1EEE6C518, (uint64_t)&OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__event, &qword_1EEE6C510);
}

void (*sub_1AF9EE744(_QWORD *a1))(uint64_t, char)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C518);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__event;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C510);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9E0868;
}

uint64_t sub_1AF9EE80C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_layoutDirection;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1AF9EE850(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_layoutDirection);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9EE898())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AF9EE8DC()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  return *v1;
}

void sub_1AF9EE920(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9EE970())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_1AF9EE9B4()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_viewHierarchy);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9EEA00(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_viewHierarchy);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9EEA50())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9EEA94()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_hasInProcessNavBar);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9EEAD8(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_hasInProcessNavBar);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9EEB20())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AF9EEB64()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  _BYTE *v10;
  char *v11;
  void *v12;
  id v13;
  objc_class *v14;
  uint64_t v16;
  objc_super v17;
  uint64_t v18;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C510);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C4F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_remoteUIConfigured] = 0;
  v9 = &v0[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__configuration];
  type metadata accessor for _AppExtensionEventHostView.Configuration(0);
  v10 = v0;
  v18 = sub_1AF9D7E4C();
  sub_1AF9F798C();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  v11 = &v10[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel__event];
  v18 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C508);
  sub_1AF9F798C();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v11, v4, v1);
  *(_QWORD *)&v10[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_layoutDirection] = 0;
  v12 = (void *)*MEMORY[0x1E0DC4938];
  *(_QWORD *)&v10[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_sizeCategory] = *MEMORY[0x1E0DC4938];
  *(_QWORD *)&v10[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_viewHierarchy] = 0;
  v10[OBJC_IVAR____TtC10EventKitUI23EKEventOOPHostViewModel_hasInProcessNavBar] = 0;
  v13 = v12;

  v14 = (objc_class *)type metadata accessor for EKEventOOPHostViewModel();
  v17.receiver = v10;
  v17.super_class = v14;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t type metadata accessor for EKEventOOPHostViewModel()
{
  uint64_t result;

  result = qword_1EEE6D950;
  if (!qword_1EEE6D950)
    return swift_getSingletonMetadata();
  return result;
}

id sub_1AF9EED74()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKEventOOPHostViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AF9EEE38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for EKEventOOPHostViewModel();
  result = sub_1AF9F7980();
  *a1 = result;
  return result;
}

uint64_t sub_1AF9EEE74()
{
  return type metadata accessor for EKEventOOPHostViewModel();
}

void sub_1AF9EEE7C()
{
  unint64_t v0;
  unint64_t v1;

  sub_1AF9EEF34();
  if (v0 <= 0x3F)
  {
    sub_1AF9EEF88();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_1AF9EEF34()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEE6C520)
  {
    type metadata accessor for _AppExtensionEventHostView.Configuration(255);
    v0 = sub_1AF9F79D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEE6C520);
  }
}

void sub_1AF9EEF88()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEE6C528)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE6C508);
    v0 = sub_1AF9F79D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEE6C528);
  }
}

double sub_1AF9EEFE0@<D0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t v3;
  double result;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E60]), sel_init);
  type metadata accessor for EKCalendarChooserOOPHostViewModel();
  sub_1AF9C212C(&qword_1EEE6C530, (uint64_t (*)(uint64_t))type metadata accessor for EKCalendarChooserOOPHostViewModel, (uint64_t)&unk_1AFA150E8);
  *(_QWORD *)a1 = sub_1AF9F79F8();
  *(_QWORD *)(a1 + 8) = v3;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_WORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v2;
  *(_BYTE *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_WORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 140) = 0;
  *(_WORD *)(a1 + 144) = 0;
  return result;
}

uint64_t sub_1AF9EF090@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(void);
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;

  v2 = v1;
  v44 = a1;
  v41 = sub_1AF9F79EC();
  MEMORY[0x1E0C80A78](v41);
  v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1AF9F7CA4();
  v42 = *(_QWORD *)(v5 - 8);
  v43 = v5;
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C538);
  MEMORY[0x1E0C80A78](v40);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = *(_OWORD *)v1;
  v10 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v45 + 1)) + 0x90);
  v11 = *((id *)&v45 + 1);
  v10();
  sub_1AF9C0F90((uint64_t)&v45);
  type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(0);
  sub_1AF9C212C(&qword_1EEE6C540, type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration, (uint64_t)&unk_1AFA14EA0);
  v38 = sub_1AF9F79F8();
  v39 = v12;
  v13 = swift_allocObject();
  v14 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v13 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v13 + 128) = v14;
  *(_OWORD *)(v13 + 144) = *(_OWORD *)(v1 + 128);
  *(_WORD *)(v13 + 160) = *(_WORD *)(v1 + 144);
  v15 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v13 + 64) = v15;
  v16 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v13 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v13 + 96) = v16;
  v17 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v13 + 32) = v17;
  v18 = swift_allocObject();
  v19 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v18 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v18 + 128) = v19;
  *(_OWORD *)(v18 + 144) = *(_OWORD *)(v1 + 128);
  *(_WORD *)(v18 + 160) = *(_WORD *)(v1 + 144);
  v20 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v18 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v18 + 64) = v20;
  v21 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v18 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v18 + 96) = v21;
  v22 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v18 + 32) = v22;
  sub_1AF9CD05C(v1);
  sub_1AF9CD05C(v1);
  v23 = sub_1AF9F7AAC();
  v24 = sub_1AF9F7AB8();
  v25 = sub_1AF9F7AD0();
  v26 = sub_1AF9F7AC4();
  sub_1AF9F7AC4();
  if (sub_1AF9F7AC4() != v23)
    v26 = sub_1AF9F7AC4();
  sub_1AF9F7AC4();
  if (sub_1AF9F7AC4() != v24)
    v26 = sub_1AF9F7AC4();
  sub_1AF9F7AC4();
  if (sub_1AF9F7AC4() != v25)
    v26 = sub_1AF9F7AC4();
  v27 = sub_1AF9F7A04();
  v28 = swift_allocObject();
  v29 = *(_OWORD *)(v2 + 112);
  *(_OWORD *)(v28 + 112) = *(_OWORD *)(v2 + 96);
  *(_OWORD *)(v28 + 128) = v29;
  *(_OWORD *)(v28 + 144) = *(_OWORD *)(v2 + 128);
  *(_WORD *)(v28 + 160) = *(_WORD *)(v2 + 144);
  v30 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v28 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v28 + 64) = v30;
  v31 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v28 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v28 + 96) = v31;
  v32 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v28 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v28 + 32) = v32;
  sub_1AF9CD05C(v2);
  sub_1AF9F7C98();
  v33 = v42;
  v34 = v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(&v4[*(int *)(v41 + 20)], v7, v43);
  *(_QWORD *)v4 = &unk_1EEE6C550;
  *((_QWORD *)v4 + 1) = v28;
  sub_1AF9C24F0((uint64_t)v4, (uint64_t)&v9[*(int *)(v40 + 36)]);
  v35 = v39;
  *(_QWORD *)v9 = v38;
  *((_QWORD *)v9 + 1) = v35;
  *((_QWORD *)v9 + 2) = sub_1AF9F1A80;
  *((_QWORD *)v9 + 3) = v18;
  *((_QWORD *)v9 + 4) = sub_1AF9E32D0;
  *((_QWORD *)v9 + 5) = v13;
  *((_QWORD *)v9 + 6) = v27;
  v9[56] = v26;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1AF9C2534((uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v7, v34);
  swift_release();
  swift_release();
  swift_release();
  return sub_1AF9F1B94((uint64_t)v9, v44);
}

uint64_t sub_1AF9EF450(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[5] = a1;
  v2 = sub_1AF9F7914();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v3 = sub_1AF9F792C();
  v1[9] = v3;
  v1[10] = *(_QWORD *)(v3 - 8);
  v1[11] = swift_task_alloc();
  v4 = sub_1AF9F7944();
  v1[12] = v4;
  v1[13] = *(_QWORD *)(v4 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = sub_1AF9F7C8C();
  v1[16] = sub_1AF9F7C80();
  v1[17] = sub_1AF9F7C68();
  v1[18] = v5;
  return swift_task_switch();
}

uint64_t sub_1AF9EF538()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1AF9F543C();
  swift_bridgeObjectRetain();
  sub_1AF9F7908();
  sub_1AF9F7938();
  sub_1AF9F7920();
  *(_QWORD *)(v0 + 152) = sub_1AF9F7C80();
  sub_1AF9C212C((unint64_t *)&unk_1EEE6BA80, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAA400], MEMORY[0x1E0CAA408]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  *v1 = v0;
  v1[1] = sub_1AF9EF61C;
  return sub_1AF9F7C74();
}

uint64_t sub_1AF9EF61C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 168) = v0;
  swift_task_dealloc();
  v3 = *(_QWORD *)(v2 + 152);
  if (v0)
  {
    if (v3)
      goto LABEL_5;
  }
  else if (v3)
  {
LABEL_5:
    swift_getObjectType();
    sub_1AF9F7C68();
  }
  return swift_task_switch();
}

uint64_t sub_1AF9EF6E0()
{
  uint64_t v0;

  swift_release();
  *(_QWORD *)(v0 + 176) = *(_QWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_1AF9EF720()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v0 + 176))
    return swift_task_switch();
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v6 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AF9EF7EC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 184) = sub_1AF9F7C80();
  sub_1AF9F7C68();
  return swift_task_switch();
}

uint64_t sub_1AF9EF84C()
{
  uint64_t v0;
  uint64_t v1;
  __int128 *v2;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(__int128 **)(v0 + 40);
  swift_release();
  sub_1AF9EFAD4(v1, v2);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1AF9EF89C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v0 + 168);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6C390);
  swift_willThrowTypedImpl();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1AF9EF904()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  LOBYTE(v1) = sub_1AF9F7CEC();
  v4 = *sub_1AF9CFC38();
  v5 = v1;
  if (os_log_type_enabled(v4, (os_log_type_t)v1))
  {
    v6 = *(void **)(v0 + 168);
    v7 = v6;
    v8 = v6;
    v9 = v4;
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v6;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 32) = v13;
    sub_1AF9F7D94();
    *v11 = v13;

    _os_log_impl(&dword_1AF84D000, v9, v5, "EKCalendarChooserOOPHostView: Could not read extension query results. Error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE60);
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v11, -1, -1);
    MEMORY[0x1B5DFEE1C](v10, -1, -1);

  }
  else
  {
    v6 = *(void **)(v0 + 168);
  }

  v15 = *(_QWORD *)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 112);
  v16 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1AF9EFAD4(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, unint64_t, uint64_t);
  _QWORD *v18;
  void (*v19)(uint64_t);
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  unint64_t v28;
  os_log_t v29;
  uint64_t v30;
  id v31;
  uint64_t (*v32)(void);
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t, _QWORD *);
  uint64_t v39;
  uint64_t v40;
  os_log_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1AF9F7968();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v39 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v39 - v15;
  if (!*(_QWORD *)(a1 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_6;
  }
  v17 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  v17(v6, a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_6:
    sub_1AF9C6BF4((uint64_t)v6, &qword_1EEE6B878);
    sub_1AF9F7CEC();
    v31 = (id)*sub_1AF9CFC38();
    sub_1AF9F7974();

    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v6, v7);
  v45 = *a2;
  v18 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v19 = *(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v45 + 1)) + 0x80);
  v42 = *((id *)&v45 + 1);
  v19(1);
  sub_1AF9C0F90((uint64_t)&v45);
  v20 = sub_1AF9F7CF8();
  v21 = *sub_1AF9CFC38();
  v17(v14, (unint64_t)v16, v7);
  v17(v11, (unint64_t)v16, v7);
  v22 = v20;
  if (os_log_type_enabled(v21, v20))
  {
    v41 = v21;
    v23 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    v44 = v40;
    *(_DWORD *)v23 = 136315394;
    v24 = sub_1AF9F7950();
    v43 = sub_1AF9C4DD4(v24, v25, &v44);
    sub_1AF9F7D94();
    swift_bridgeObjectRelease();
    v26 = *(void (**)(char *, uint64_t))(v8 + 8);
    v26(v14, v7);
    *(_WORD *)(v23 + 12) = 2080;
    v27 = sub_1AF9F795C();
    v43 = sub_1AF9C4DD4(v27, v28, &v44);
    v18 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    sub_1AF9F7D94();
    swift_bridgeObjectRelease();
    v26(v11, v7);
    v29 = v41;
    _os_log_impl(&dword_1AF84D000, v41, v22, "EKCalendarChooserOOPHostView: EventKitUI AppExtensionQuery Found: %s (%s) RemoteUI Extension", (uint8_t *)v23, 0x16u);
    v30 = v40;
    swift_arrayDestroy();
    MEMORY[0x1B5DFEE1C](v30, -1, -1);
    MEMORY[0x1B5DFEE1C](v23, -1, -1);

  }
  else
  {
    v26 = *(void (**)(char *, uint64_t))(v8 + 8);
    v26(v14, v7);
    v26(v11, v7);
  }
  v32 = *(uint64_t (**)(void))((*v18 & *v42) + 0x90);
  v33 = v42;
  v34 = v32();
  sub_1AF9C0F90((uint64_t)&v45);
  v35 = (uint64_t *)sub_1AF9F54C0();
  v36 = *v35;
  v37 = v35[1];
  v38 = *(void (**)(char *, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v34 + 408);
  sub_1AF9C23C4((uint64_t)&v45);
  swift_bridgeObjectRetain();
  v38(v16, v36, v37, v33);
  sub_1AF9C0F90((uint64_t)&v45);
  swift_release();
  swift_bridgeObjectRelease();
  v26(v16, v7);
}

uint64_t sub_1AF9EFF18(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  _QWORD *v5;
  uint64_t (*v6)(void);
  _QWORD *v7;
  uint64_t v8;
  void (*v9)(void *);
  id v10;

  v3 = *(void **)(v1 + 48);
  v4 = a1;

  *(_QWORD *)(v1 + 48) = a1;
  v5 = *(_QWORD **)(v1 + 8);
  v6 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v5) + 0x90);
  v7 = v5;
  v8 = v6();

  v9 = *(void (**)(void *))(*(_QWORD *)v8 + 208);
  v10 = v4;
  v9(a1);

  return swift_release();
}

uint64_t sub_1AF9EFFAC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D58();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0x6F697463656C6573, 0xEE00656C7974536ELL, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F012C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = a1;
  return sub_1AF9EFFAC();
}

uint64_t sub_1AF9F0134()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D58();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0x5379616C70736964, 0xEC000000656C7974, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F02B0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = a1;
  return sub_1AF9F0134();
}

uint64_t sub_1AF9F02B8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  void (*v9)(_BYTE *, _QWORD);
  uint64_t *v10;
  uint64_t *v11;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v13;
  uint64_t (*v14)(void);
  _QWORD *v15;
  uint64_t v16;
  void (*v17)(_BYTE *, _QWORD);
  BOOL *v18;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  result = *(_QWORD *)(v1 + 72);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v8 = sub_1AF9F7D58();
    v9 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
    v11 = v10;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *v11;
    *v11 = 0x8000000000000000;
    sub_1AF9DB3E8(v8, 0x7954797469746E65, 0xEA00000000006570, isUniquelyReferenced_nonNull_native);
    *v11 = v19;
    swift_bridgeObjectRelease();
    v9(v20, 0);
    swift_release();
    v13 = *(_QWORD **)(v1 + 8);
    v14 = *(uint64_t (**)(void))((*v3 & *v13) + 0x90);
    v15 = v13;
    v16 = v14();

    v17 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v16 + 336))(v20);
    *v18 = !*v18;
    v17(v20, 0);
    return swift_release();
  }
  return result;
}

uint64_t sub_1AF9F0438(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = a1;
  return sub_1AF9F02B8();
}

uint64_t sub_1AF9F0440()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000013, 0x80000001AFA1FF60, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F05B8(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 80) = a1;
  return sub_1AF9F0440();
}

uint64_t sub_1AF9F05C0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000015, 0x80000001AFA1FF80, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F0738(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 81) = a1;
  return sub_1AF9F05C0();
}

uint64_t sub_1AF9F0740()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t (*v7)(_BYTE *);
  id v8;
  void (*v9)(_BYTE *, _QWORD);
  uint64_t *v10;
  uint64_t *v11;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v13;
  uint64_t (*v14)(void);
  _QWORD *v15;
  uint64_t v16;
  void (*v17)(_BYTE *, _QWORD);
  BOOL *v18;
  uint64_t v20;
  _BYTE v21[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  v7 = *(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312);
  v8 = *(id *)(v1 + 88);
  v9 = (void (*)(_BYTE *, _QWORD))v7(v21);
  v11 = v10;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v20 = *v11;
  *v11 = 0x8000000000000000;
  sub_1AF9DB3E8((uint64_t)v8, 0xD000000000000013, 0x80000001AFA222C0, isUniquelyReferenced_nonNull_native);
  *v11 = v20;
  swift_bridgeObjectRelease();
  v9(v21, 0);
  swift_release();
  v13 = *(_QWORD **)(v1 + 8);
  v14 = *(uint64_t (**)(void))((*v3 & *v13) + 0x90);
  v15 = v13;
  v16 = v14();

  v17 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v16 + 336))(v21);
  *v18 = !*v18;
  v17(v21, 0);
  return swift_release();
}

void sub_1AF9F089C(id obj)
{
  uint64_t v1;

  objc_storeStrong((id *)(v1 + 88), obj);
  sub_1AF9F0740();

}

uint64_t sub_1AF9F08CC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000015, 0x80000001AFA1FFC0, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F0A44(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 96) = a1;
  return sub_1AF9F08CC();
}

uint64_t sub_1AF9F0A4C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  id v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, *(_QWORD *)(v1 + 104));
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8((uint64_t)v7, 0x4D7265736F6F6863, 0xEB0000000065646FLL, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F0BC4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 104) = a1;
  return sub_1AF9F0A4C();
}

uint64_t sub_1AF9F0BCC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000021, 0x80000001AFA1FFF0, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F0D44(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 112) = a1;
  return sub_1AF9F0BCC();
}

uint64_t sub_1AF9F0D4C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000013, 0x80000001AFA20020, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F0EC4(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 113) = a1;
  return sub_1AF9F0D4C();
}

id sub_1AF9F0ECC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  _QWORD *v6;
  id v7;
  uint64_t v8;
  id result;
  uint64_t v10;
  void (*v11)(_BYTE *, _QWORD);
  uint64_t *v12;
  uint64_t *v13;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v15;
  uint64_t (*v16)(void);
  _QWORD *v17;
  uint64_t v18;
  void (*v19)(_BYTE *, _QWORD);
  _QWORD *v20;
  uint64_t (*v21)(void);
  _QWORD *v22;
  uint64_t v23;
  void (*v24)(_BYTE *, _QWORD);
  BOOL *v25;
  uint64_t v26;
  _BYTE v27[32];

  v1 = v0;
  v2 = *(void **)(v0 + 120);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (!v2)
  {
    v15 = *(_QWORD **)(v0 + 8);
    v16 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v15) + 0x90);
    v17 = v15;
    v18 = v16();

    v19 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v18 + 312))(v27);
    sub_1AF9F4470(0xD000000000000011, 0x80000001AFA222A0);
    swift_unknownObjectRelease();
    v19(v27, 0);
    goto LABEL_5;
  }
  v4 = *(_QWORD **)(v0 + 8);
  v5 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v4) + 0x90);
  v6 = v4;
  v7 = v2;
  v8 = v5();

  result = objc_msgSend(v7, sel_sourceIdentifier);
  if (result)
  {
    v10 = (uint64_t)result;
    v11 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v8 + 312))(v27);
    v13 = v12;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v26 = *v13;
    *v13 = 0x8000000000000000;
    sub_1AF9DB3E8(v10, 0xD000000000000011, 0x80000001AFA222A0, isUniquelyReferenced_nonNull_native);
    *v13 = v26;
    swift_bridgeObjectRelease();
    v11(v27, 0);

LABEL_5:
    swift_release();
    v20 = *(_QWORD **)(v1 + 8);
    v21 = *(uint64_t (**)(void))((*v3 & *v20) + 0x90);
    v22 = v20;
    v23 = v21();

    v24 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v23 + 336))(v27);
    *v25 = !*v25;
    v24(v27, 0);
    return (id)swift_release();
  }
  __break(1u);
  return result;
}

void sub_1AF9F10C8(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v3 = *(void **)(v1 + 120);
  v4 = a1;

  *(_QWORD *)(v1 + 120) = a1;
  sub_1AF9F0ECC();

}

id sub_1AF9F1110()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v5)(void);
  _QWORD *v6;
  id v7;
  uint64_t v8;
  id result;
  uint64_t v10;
  void (*v11)(_BYTE *, _QWORD);
  uint64_t *v12;
  uint64_t *v13;
  char v14;
  _QWORD *v15;
  uint64_t (*v16)(void);
  _QWORD *v17;
  uint64_t v18;
  id v19;
  void (*v20)(_BYTE *, _QWORD);
  uint64_t *v21;
  uint64_t *v22;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v24;
  uint64_t (*v25)(void);
  _QWORD *v26;
  uint64_t v27;
  void (*v28)(_BYTE *, _QWORD);
  BOOL *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[32];

  v1 = v0;
  v2 = *(void **)(v0 + 128);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (!v2)
  {
    v15 = *(_QWORD **)(v0 + 8);
    v16 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v15) + 0x90);
    v17 = v15;
    v18 = v16();

    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
    v20 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v18 + 312))(v32);
    v22 = v21;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v31 = *v22;
    *v22 = 0x8000000000000000;
    sub_1AF9DB3E8((uint64_t)v19, 0xD000000000000010, 0x80000001AFA202B0, isUniquelyReferenced_nonNull_native);
    *v22 = v31;
    swift_bridgeObjectRelease();
    v20(v32, 0);
    goto LABEL_5;
  }
  v4 = *(_QWORD **)(v0 + 8);
  v5 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v4) + 0x90);
  v6 = v4;
  v7 = v2;
  v8 = v5();

  result = objc_msgSend(v7, sel_calendarIdentifier);
  if (result)
  {
    v10 = (uint64_t)result;
    v11 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v8 + 312))(v32);
    v13 = v12;
    v14 = swift_isUniquelyReferenced_nonNull_native();
    v30 = *v13;
    *v13 = 0x8000000000000000;
    sub_1AF9DB3E8(v10, 0xD000000000000010, 0x80000001AFA202B0, v14);
    *v13 = v30;
    swift_bridgeObjectRelease();
    v11(v32, 0);

LABEL_5:
    swift_release();
    v24 = *(_QWORD **)(v1 + 8);
    v25 = *(uint64_t (**)(void))((*v3 & *v24) + 0x90);
    v26 = v24;
    v27 = v25();

    v28 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v27 + 336))(v32);
    *v29 = !*v29;
    v28(v32, 0);
    return (id)swift_release();
  }
  __break(1u);
  return result;
}

void sub_1AF9F1358(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v3 = *(void **)(v1 + 128);
  v4 = a1;

  *(_QWORD *)(v1 + 128) = a1;
  sub_1AF9F1110();

}

uint64_t sub_1AF9F13A0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD00000000000001ALL, 0x80000001AFA20040, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F1518(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 136) = a1;
  return sub_1AF9F13A0();
}

uint64_t sub_1AF9F1520()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  id v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithUnsignedInt_, *(unsigned int *)(v1 + 140));
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8((uint64_t)v7, 0xD000000000000013, 0x80000001AFA20070, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F1694(int a1)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 140) = a1;
  return sub_1AF9F1520();
}

uint64_t sub_1AF9F169C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000011, 0x80000001AFA20090, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F1814(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 144) = a1;
  return sub_1AF9F169C();
}

uint64_t sub_1AF9F181C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v4)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t *v9;
  uint64_t *v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  uint64_t (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  BOOL *v17;
  uint64_t v19;
  _BYTE v20[32];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 8);
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v5 = v2;
  v6 = v4();

  sub_1AF9C6B78(0, &qword_1EEE6BA60);
  v7 = sub_1AF9F7D4C();
  v8 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v6 + 312))(v20);
  v10 = v9;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *v10;
  *v10 = 0x8000000000000000;
  sub_1AF9DB3E8(v7, 0xD000000000000019, 0x80000001AFA200B0, isUniquelyReferenced_nonNull_native);
  *v10 = v19;
  swift_bridgeObjectRelease();
  v8(v20, 0);
  swift_release();
  v12 = *(_QWORD **)(v1 + 8);
  v13 = *(uint64_t (**)(void))((*v3 & *v12) + 0x90);
  v14 = v12;
  v15 = v13();

  v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v15 + 336))(v20);
  *v17 = !*v17;
  v16(v20, 0);
  return swift_release();
}

uint64_t sub_1AF9F1994(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 145) = a1;
  return sub_1AF9F181C();
}

uint64_t sub_1AF9F199C()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;

  v4 = *v0;
  v1 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & **((_QWORD **)&v4 + 1)) + 0x90))(*((id *)&v4 + 1));
  v2 = sub_1AF9C0F90((uint64_t)&v4);
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 392))(v2);
  return swift_release();
}

uint64_t sub_1AF9F1A0C@<X0>(uint64_t a1@<X8>)
{
  return sub_1AF9EF090(a1);
}

uint64_t type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(uint64_t a1)
{
  return sub_1AF9C54B8(a1, (uint64_t *)&unk_1EEE6DB80);
}

uint64_t sub_1AF9F1A80(uint64_t result, char a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD);
  uint64_t v5;

  v3 = *(void (**)(uint64_t, _QWORD))(v2 + 32);
  if (v3)
  {
    v5 = result;
    swift_retain();
    v3(v5, a2 & 1);
    return sub_1AF9C09DC((uint64_t)v3);
  }
  return result;
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
    swift_release();
  if (*(_QWORD *)(v0 + 48))
    swift_release();

  return swift_deallocObject();
}

uint64_t sub_1AF9F1B48()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1AF9C24A8;
  return sub_1AF9EF450(v0 + 16);
}

uint64_t sub_1AF9F1B94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C538);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF9F1BDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_identity;
  swift_beginAccess();
  return sub_1AF9C5414(v3, a1);
}

uint64_t sub_1AF9F1C2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_identity;
  swift_beginAccess();
  sub_1AF9C545C(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1AF9F1C84())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9F1CC8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sceneID);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1AF9F1D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sceneID);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AF9F1D78())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9F1DBC()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_eventStore);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9F1E08(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_eventStore);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9F1E58())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9F1E9C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_layoutDirection;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1AF9F1EE0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_layoutDirection);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9F1F28())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AF9F1F6C()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sizeCategory);
  swift_beginAccess();
  return *v1;
}

void sub_1AF9F1FB0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sizeCategory);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9F2000())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9F2044()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9F2090(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_viewHierarchy);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9F20E0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9F2124()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AF9F216C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1
                + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_changedCustomViewConfigurationDictionary);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AF9F21BC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9F2200()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AF9F79BC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF9F2270@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 320))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1AF9F22A4(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 328))(*a1);
}

uint64_t sub_1AF9F22D0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1AF9F79C8();
}

void (*sub_1AF9F233C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9C2BC4;
}

uint64_t sub_1AF9F23B4()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F7998();
  return swift_endAccess();
}

uint64_t sub_1AF9F2414(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F79A4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1AF9F24E8(_QWORD *a1))(uint64_t a1, char a2)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration__customViewConfigurationChangedPublisher;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9C2E0C;
}

uint64_t sub_1AF9F25B0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_toggleAllCalendarsCallback);
  swift_beginAccess();
  v2 = *v1;
  sub_1AF9C09CC(*v1);
  return v2;
}

uint64_t sub_1AF9F2608(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2
                 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_toggleAllCalendarsCallback);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_1AF9C09DC(v6);
}

uint64_t (*sub_1AF9F2664())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void (*sub_1AF9F26A8())(void)
{
  uint64_t v0;
  void (*result)(void);
  uint64_t v2;

  result = (void (*)(void))(*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
  if (result)
  {
    v2 = (uint64_t)result;
    result();
    return (void (*)(void))sub_1AF9C09DC(v2);
  }
  return result;
}

uint64_t sub_1AF9F26F0()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_1AF9F2724();
  return v0;
}

uint64_t sub_1AF9F2724()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  _BYTE v13[16];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_identity;
  v6 = sub_1AF9F7968();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sceneID);
  *v7 = 0;
  v7[1] = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_eventStore) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_viewHierarchy) = 0;
  *(_QWORD *)(v0
            + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_changedCustomViewConfigurationDictionary) = MEMORY[0x1E0DEE9E0];
  v8 = v0
     + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration__customViewConfigurationChangedPublisher;
  v13[15] = 0;
  sub_1AF9F798C();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v2 + 32))(v8, v4, v1);
  v9 = (_QWORD *)(v0
                + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_toggleAllCalendarsCallback);
  *v9 = 0;
  v9[1] = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_layoutDirection) = 0;
  v10 = (void *)*MEMORY[0x1E0DC4938];
  *(_QWORD *)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sizeCategory) = *MEMORY[0x1E0DC4938];
  v11 = v10;
  return v0;
}

uint64_t sub_1AF9F2870(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(_BYTE *, _QWORD);
  BOOL *v24;
  _BYTE v26[32];

  v5 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v10);
  v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_1AF9F7968();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16))(v12, a1, v13);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  (*(void (**)(_BYTE *))(*(_QWORD *)v5 + 160))(v12);
  v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 184);
  swift_bridgeObjectRetain();
  v16 = v15(a2, a3);
  v17 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v18 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *a4) + 0xC0))(v16);
  v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 232))(v18);
  v20 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0xD8))(v19);
  v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 256))(v20);
  v22 = (*(uint64_t (**)(uint64_t))((*v17 & *a4) + 0xF0))(v21);
  (*(void (**)(uint64_t))(*(_QWORD *)v5 + 280))(v22);
  v23 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v5 + 336))(v26);
  *v24 = !*v24;
  return v23(v26, 0);
}

uint64_t sub_1AF9F2A10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1AF9C6BF4(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_identity, &qword_1EEE6B878);
  swift_bridgeObjectRelease();

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_sizeCategory));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_viewHierarchy));
  swift_bridgeObjectRelease();
  v1 = v0
     + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration__customViewConfigurationChangedPublisher;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B880);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_1AF9C09DC(*(_QWORD *)(v0
                          + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView13Configuration_toggleAllCalendarsCallback));
  return v0;
}

uint64_t sub_1AF9F2AD8()
{
  sub_1AF9F2A10();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF9F2AFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(0);
  result = sub_1AF9F7980();
  *a1 = result;
  return result;
}

id sub_1AF9F2B38(_OWORD *a1)
{
  objc_class *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  __int128 v7;
  objc_super v9;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = &v3[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_identity];
  v5 = sub_1AF9F7968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(_QWORD *)&v3[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_conn] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  v6 = &v3[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent];
  v7 = a1[1];
  *(_OWORD *)v6 = *a1;
  *((_OWORD *)v6 + 1) = v7;
  *((_OWORD *)v6 + 2) = a1[2];
  v9.receiver = v3;
  v9.super_class = v1;
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for _AppExtensionCalendarChooserHostView.HostCoordinator(uint64_t a1)
{
  return sub_1AF9C54B8(a1, qword_1EEE6DB90);
}

uint64_t sub_1AF9F2BFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_identity;
  swift_beginAccess();
  return sub_1AF9C5414(v3, a1);
}

uint64_t sub_1AF9F2C4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_identity;
  swift_beginAccess();
  sub_1AF9C545C(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_1AF9F2CA4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1AF9F2CE8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_conn);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9F2D34(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_conn);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9F2D84())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9F2DC8()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_1AF9F2E10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1
                + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_configurationChangedPublisherSink);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1AF9F2E60())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1AF9F2EA4(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  void (*v10)(void *);
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  os_log_type_t v18;
  os_log_t *v19;
  os_log_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  os_log_type_t v47;
  NSObject *v48;
  id v49;
  id v50;
  NSObject *v51;
  uint8_t *v52;
  _QWORD *v53;
  id v54;
  void *v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(id (*)(), uint64_t);
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id aBlock;
  uint64_t v77;
  uint64_t (*v78)(uint64_t);
  void *v79;
  void (*v80)();
  uint64_t v81;
  uint64_t v82;

  v2 = v1;
  v82 = *MEMORY[0x1E0C80C00];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B888);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock = 0;
  v8 = objc_msgSend(a1, sel_makeXPCConnectionWithError_, &aBlock);
  if (!v8)
  {
    v45 = aBlock;
    v46 = (void *)sub_1AF9F789C();

    swift_willThrow();
    v47 = sub_1AF9F7CEC();
    v48 = *sub_1AF9CFC38();
    if (os_log_type_enabled(v48, v47))
    {
      v49 = v46;
      v50 = v46;
      v51 = v48;
      v52 = (uint8_t *)swift_slowAlloc();
      v53 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v52 = 138412290;
      v54 = v46;
      v55 = (void *)_swift_stdlib_bridgeErrorToNSError();
      aBlock = v55;
      sub_1AF9F7D94();
      *v53 = v55;

      _os_log_impl(&dword_1AF84D000, v51, v47, "Error: _AppExtensionCalendarChooserHostView Setup: Cannot make XPC Connection. %@", v52, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6BE60);
      swift_arrayDestroy();
      MEMORY[0x1B5DFEE1C](v53, -1, -1);
      MEMORY[0x1B5DFEE1C](v52, -1, -1);

    }
    else
    {

    }
    return;
  }
  v9 = v8;
  v73 = v5;
  v74 = v4;
  v10 = *(void (**)(void *))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x98);
  v11 = aBlock;
  v12 = v9;
  v10(v9);
  objc_msgSend(v12, sel_setExportedInterface_, *sub_1AF9CEE2C());
  objc_msgSend(v12, sel_setRemoteObjectInterface_, *sub_1AF9CF0F8());
  objc_msgSend(v12, sel_setExportedObject_, v2);
  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v80 = sub_1AF9F41B0;
  v81 = v13;
  v14 = (void *)MEMORY[0x1E0C809B0];
  aBlock = (id)MEMORY[0x1E0C809B0];
  v77 = 1107296256;
  v78 = sub_1AF9C3D10;
  v79 = &block_descriptor_3;
  v15 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v12, sel_setInterruptionHandler_, v15);
  _Block_release(v15);
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v80 = sub_1AF9F41D4;
  v81 = v16;
  aBlock = v14;
  v77 = 1107296256;
  v78 = sub_1AF9C3D10;
  v79 = &block_descriptor_16;
  v17 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v12, sel_setInvalidationHandler_, v17);
  _Block_release(v17);
  objc_msgSend(v12, sel_resume);
  v18 = sub_1AF9F7CF8();
  v19 = (os_log_t *)sub_1AF9CFC38();
  v20 = *v19;
  if (os_log_type_enabled(*v19, v18))
  {
    v21 = v12;
    v22 = v20;
    v23 = swift_slowAlloc();
    *(_DWORD *)v23 = 67109376;
    LODWORD(aBlock) = objc_msgSend(v21, sel_processIdentifier);
    sub_1AF9F7D94();
    *(_WORD *)(v23 + 8) = 1024;
    LODWORD(aBlock) = objc_msgSend(v21, sel_effectiveUserIdentifier);
    sub_1AF9F7D94();

    _os_log_impl(&dword_1AF84D000, v22, v18, "_AppExtensionCalendarChooserHostView: Setting up XPC connection. processIdentifier: %d. effectiveUserIdentifier: %u.", (uint8_t *)v23, 0xEu);
    MEMORY[0x1B5DFEE1C](v23, -1, -1);

  }
  v24 = objc_msgSend(v12, sel_remoteObjectProxy);
  sub_1AF9F7DAC();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6C5D0);
  if (!swift_dynamicCast())
  {
    sub_1AF9F7CEC();
    v56 = *v19;
    sub_1AF9F7974();

LABEL_18:
    return;
  }
  v72 = v7;
  v25 = v75;
  v26 = *(_QWORD *)((char *)v2
                  + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent
                  + 8);
  v27 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 272);
  v28 = swift_retain();
  v29 = v27(v28);
  if (!v29)
  {
    sub_1AF9F7CEC();
    v56 = *v19;
    sub_1AF9F7974();

    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_18;
  }
  v69 = v25;
  v70 = (void *)v29;
  v71 = (*(uint64_t (**)(void))(*(_QWORD *)v26 + 224))();
  v30 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)v26 + 248))();
  v31 = sub_1AF9F7BF0();

  v32 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 200);
  v33 = swift_retain();
  v34 = (void *)v32(v33);
  swift_release();
  if (!v34)
  {
    v44 = 0;
    v38 = 0;
    goto LABEL_21;
  }
  v35 = objc_msgSend(v34, sel_connection, v31);
  if (!v35)
  {
    __break(1u);
    goto LABEL_26;
  }
  v36 = v35;
  v37 = objc_msgSend(v35, sel_initializationOptions);

  if (!v37)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v38 = objc_msgSend(v37, sel_management);

  v39 = objc_msgSend(v34, sel_connection);
  if (!v39)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v40 = v39;
  v41 = objc_msgSend(v39, sel_initializationOptions);

  if (!v41)
  {
LABEL_28:
    __break(1u);
    return;
  }
  v42 = objc_msgSend(v41, sel_managementBundleIdentifier);

  if (v42)
  {
    sub_1AF9F7BF0();
    v44 = v43;

  }
  else
  {

    v44 = 0;
  }
LABEL_21:
  v57 = objc_msgSend((id)objc_opt_self(), sel_isLegacyEKUIClient);
  v58 = (void *)sub_1AF9F7BCC();
  swift_bridgeObjectRelease();
  if (v44)
  {
    v59 = (void *)sub_1AF9F7BCC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v59 = 0;
  }
  v60 = v69;
  v61 = v70;
  objc_msgSend(v69, sel_setupViewContextWithViewHierarchy_layoutDirection_sizeCategory_sourceAccountManagement_sourceBundleID_isLegacyClient_, v70, v71, v58, v38, v59, v57);

  v62 = v72;
  (*(void (**)(void))(*(_QWORD *)v26 + 344))();
  v63 = swift_allocObject();
  *(_QWORD *)(v63 + 16) = v60;
  *(_QWORD *)(v63 + 24) = v26;
  sub_1AF9C6ABC(&qword_1EEE6BE88, &qword_1EEE6B888, MEMORY[0x1E0C96190]);
  swift_retain();
  swift_unknownObjectRetain();
  v64 = v74;
  v65 = sub_1AF9F79E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v62, v64);
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xB0))(v65);
  v66 = swift_allocObject();
  *(_QWORD *)(v66 + 16) = v60;
  v67 = *(void (**)(id (*)(), uint64_t))(*(_QWORD *)v26 + 376);
  swift_unknownObjectRetain();
  v67(sub_1AF9F43D4, v66);
  swift_unknownObjectRelease();

  swift_release();
}

uint64_t sub_1AF9F3898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v29 = a5;
  v10 = sub_1AF9F7B3C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v5 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent + 32);
  if (v19)
  {
    v27 = v11;
    v28 = result;
    v20 = *(_QWORD *)(v5
                    + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent
                    + 40);
    v26 = v16;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v25 = sub_1AF9F7D04();
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = v19;
    v21[3] = v20;
    v21[4] = a1;
    v21[5] = a2;
    v21[6] = a3;
    v21[7] = a4;
    v21[8] = v29;
    aBlock[4] = sub_1AF9C567C;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_28;
    v22 = _Block_copy(aBlock);
    sub_1AF9C09CC(v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    sub_1AF9F7DB8();
    v23 = (void *)v25;
    MEMORY[0x1B5DFD9D0](0, v18, v13, v22);
    _Block_release(v22);

    sub_1AF9C09DC(v19);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v18, v28);
  }
  return result;
}

uint64_t sub_1AF9F3B98(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v5 = sub_1AF9F7B3C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1AF9F7B54();
  result = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v2 + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent + 16);
  if (v14)
  {
    v15 = *(_QWORD *)(v2
                    + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent
                    + 24);
    v21 = v11;
    v22 = result;
    sub_1AF9C6B78(0, (unint64_t *)&unk_1EEE6BE90);
    swift_retain();
    v20 = sub_1AF9F7D04();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v14;
    *(_QWORD *)(v16 + 24) = v15;
    *(_QWORD *)(v16 + 32) = a1;
    *(_BYTE *)(v16 + 40) = a2 & 1;
    aBlock[4] = sub_1AF9F4444;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1AF9C3D10;
    aBlock[3] = &block_descriptor_34;
    v17 = _Block_copy(aBlock);
    sub_1AF9C09CC(v14);
    swift_bridgeObjectRetain();
    swift_release();
    sub_1AF9F7B48();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF9C212C((unint64_t *)&unk_1EEE6B910, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BEA0);
    sub_1AF9C6ABC(&qword_1EEE6B920, (uint64_t *)&unk_1EEE6BEA0, MEMORY[0x1E0DEAF38]);
    sub_1AF9F7DB8();
    v18 = (void *)v20;
    MEMORY[0x1B5DFD9D0](0, v13, v8, v17);
    _Block_release(v17);

    sub_1AF9C09DC(v14);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v13, v22);
  }
  return result;
}

id sub_1AF9F3E88()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _AppExtensionCalendarChooserHostView.HostCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1AF9F3F50()
{
  id v0;
  void *v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CAA600]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C5E0);
  sub_1AF9F7A94();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

void sub_1AF9F3FC4(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1AF9F4710(a1, a2, *(_QWORD *)(v2 + 8));
}

id sub_1AF9F3FCC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id result;
  objc_super v15;

  v4 = *v1;
  v3 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v8 = v1[4];
  v7 = v1[5];
  v9 = (objc_class *)type metadata accessor for _AppExtensionCalendarChooserHostView.HostCoordinator(0);
  v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_identity];
  v12 = sub_1AF9F7968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_QWORD *)&v10[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_conn] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_configurationChangedPublisherSink] = 0;
  v13 = &v10[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent];
  *(_QWORD *)v13 = v4;
  *((_QWORD *)v13 + 1) = v3;
  *((_QWORD *)v13 + 2) = v5;
  *((_QWORD *)v13 + 3) = v6;
  *((_QWORD *)v13 + 4) = v8;
  *((_QWORD *)v13 + 5) = v7;
  swift_retain();
  sub_1AF9C09CC(v5);
  sub_1AF9C09CC(v8);
  v15.receiver = v10;
  v15.super_class = v9;
  result = objc_msgSendSuper2(&v15, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_1AF9F40C8()
{
  sub_1AF9F53E0();
  return sub_1AF9F7A88();
}

uint64_t sub_1AF9F4118()
{
  sub_1AF9F53E0();
  return sub_1AF9F7A58();
}

void sub_1AF9F4168()
{
  sub_1AF9F53E0();
  sub_1AF9F7A7C();
  __break(1u);
}

uint64_t sub_1AF9F418C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1AF9F41B0()
{
  sub_1AF9F41E0();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_1AF9F41D4()
{
  sub_1AF9F41E0();
}

void sub_1AF9F41E0()
{
  uint64_t v0;
  id v1;
  _QWORD *v2;
  void *v3;
  void *v4;

  sub_1AF9F7CF8();
  v1 = (id)*sub_1AF9CFC38();
  sub_1AF9F7974();

  swift_beginAccess();
  v2 = (_QWORD *)MEMORY[0x1B5DFEE88](v0 + 16);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90))();

    if (v4)
    {
      objc_msgSend(v4, sel_setExportedObject_, 0);

    }
  }
}

uint64_t sub_1AF9F42B8()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF9F42E4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t (*v5)(_BYTE *, _QWORD);
  _QWORD *v6;
  _QWORD *v7;
  _BYTE v9[32];

  v1 = *(void **)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 296))();
  sub_1AF9D96E4(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1AF9F7BB4();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_updateCalendarChooserViewWithChangedViewConfigurationDictionary_, v4);

  v5 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v2 + 312))(v9);
  v7 = v6;
  swift_bridgeObjectRelease();
  *v7 = MEMORY[0x1E0DEE9E0];
  return v5(v9, 0);
}

uint64_t sub_1AF9F43B0()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id sub_1AF9F43D4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_toggleAllCalendars);
}

uint64_t sub_1AF9F43E4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF9F4418()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF9F4444()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), *(unsigned __int8 *)(v0 + 40));
}

uint64_t sub_1AF9F4470(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1AF9DB070(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1AF9DB624();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_1AF9F453C(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_1AF9F453C(unint64_t result, uint64_t a2)
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
    result = sub_1AF9F7DC4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1AF9F7F74();
        swift_bridgeObjectRetain();
        sub_1AF9F7BFC();
        v9 = sub_1AF9F7F80();
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

void sub_1AF9F4710(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  char *v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  os_log_type_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  os_log_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint8_t *v38;
  uint64_t v39;
  os_log_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v5 = sub_1AF9F78F0();
  MEMORY[0x1E0C80A78](v5);
  v44 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6B878);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1AF9F7968();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v43 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v45 = (char *)&v38 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE6BA70);
  v16 = MEMORY[0x1E0C80A78](v15);
  v42 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v38 - v18;
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v20 = a1;
    sub_1AF9F7D34();
    v21 = sub_1AF9F7D28();
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v19, 1, v21) == 1)
    {
      sub_1AF9C6BF4((uint64_t)v19, (uint64_t *)&unk_1EEE6BA70);
      v23 = *(void (**)(uint64_t))(*(_QWORD *)a3 + 152);
      v24 = swift_retain();
      v23(v24);
      swift_release();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
      {

        sub_1AF9C6BF4((uint64_t)v9, &qword_1EEE6B878);
      }
      else
      {
        v25 = v45;
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v45, v9, v10);
        v26 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 176);
        v27 = swift_retain();
        v41 = v26(v27);
        v29 = v28;
        swift_release();
        if (v29)
        {
          v30 = sub_1AF9F7CF8();
          v31 = *sub_1AF9CFC38();
          v32 = v30;
          if (os_log_type_enabled(v31, v30))
          {
            swift_bridgeObjectRetain_n();
            v40 = v31;
            v33 = (uint8_t *)swift_slowAlloc();
            v39 = swift_slowAlloc();
            v47 = v39;
            *(_DWORD *)v33 = 136315138;
            v38 = v33 + 4;
            swift_bridgeObjectRetain();
            v46 = sub_1AF9C4DD4(v41, v29, &v47);
            sub_1AF9F7D94();
            swift_bridgeObjectRelease_n();
            v34 = v40;
            _os_log_impl(&dword_1AF84D000, v40, v32, "_AppExtensionCalendarChooserHostView: *** Setting up Remote UI Extension Configuration ***  sceneID: %s.", v33, 0xCu);
            v35 = v39;
            swift_arrayDestroy();
            MEMORY[0x1B5DFEE1C](v35, -1, -1);
            MEMORY[0x1B5DFEE1C](v33, -1, -1);

          }
          v36 = v45;
          (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v43, v45, v10);
          sub_1AF9F78FC();
          v37 = v42;
          sub_1AF9F7D1C();
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v37, 0, 1, v21);
          sub_1AF9F7D40();

          (*(void (**)(char *, uint64_t))(v11 + 8))(v36, v10);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v11 + 8))(v25, v10);

        }
      }
    }
    else
    {

      sub_1AF9C6BF4((uint64_t)v19, (uint64_t *)&unk_1EEE6BA70);
    }
  }
  else
  {
    sub_1AF9F7EF0();
    __break(1u);
  }
}

uint64_t sub_1AF9F4BA8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1AF9F4BBC()
{
  unint64_t result;

  result = qword_1EEE6C5E8;
  if (!qword_1EEE6C5E8)
  {
    result = MEMORY[0x1B5DFEDB0](&unk_1AFA14F50, &type metadata for _AppExtensionCalendarChooserHostView);
    atomic_store(result, (unint64_t *)&qword_1EEE6C5E8);
  }
  return result;
}

void destroy for EKCalendarChooserOOPHostView(uint64_t a1)
{

  if (*(_QWORD *)(a1 + 16))
    swift_release();
  if (*(_QWORD *)(a1 + 32))
    swift_release();

}

uint64_t initializeWithCopy for EKCalendarChooserOOPHostView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _OWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = (_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  v7 = v4;
  if (v5)
  {
    v8 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v5;
    *(_QWORD *)(a1 + 24) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v6;
  }
  v9 = *(_QWORD *)(a2 + 32);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  v11 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v11;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  v12 = *(void **)(a2 + 88);
  *(_QWORD *)(a1 + 88) = v12;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_WORD *)(a1 + 112) = *(_WORD *)(a2 + 112);
  v13 = *(void **)(a2 + 120);
  v14 = *(void **)(a2 + 128);
  *(_QWORD *)(a1 + 120) = v13;
  *(_QWORD *)(a1 + 128) = v14;
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 140);
  *(_WORD *)(a1 + 144) = *(_WORD *)(a2 + 144);
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  return a1;
}

uint64_t assignWithCopy for EKCalendarChooserOOPHostView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v10 = *(_QWORD *)(a2 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    if (v10)
    {
      v12 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = v10;
      *(_QWORD *)(a1 + 40) = v12;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_15;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_14;
  }
  v11 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  swift_retain();
  swift_release();
LABEL_15:
  v13 = *(void **)(a1 + 48);
  v14 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v14;
  v15 = v14;

  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  v16 = *(void **)(a2 + 88);
  v17 = *(void **)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v16;
  v18 = v16;

  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_BYTE *)(a1 + 113) = *(_BYTE *)(a2 + 113);
  v19 = *(void **)(a1 + 120);
  v20 = *(void **)(a2 + 120);
  *(_QWORD *)(a1 + 120) = v20;
  v21 = v20;

  v22 = *(void **)(a1 + 128);
  v23 = *(void **)(a2 + 128);
  *(_QWORD *)(a1 + 128) = v23;
  v24 = v23;

  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 140);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_BYTE *)(a1 + 145) = *(_BYTE *)(a2 + 145);
  return a1;
}

__n128 __swift_memcpy146_8(uint64_t a1, uint64_t a2)
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
  *(_WORD *)(a1 + 144) = *(_WORD *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for EKCalendarChooserOOPHostView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  v6 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 24) = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    v8 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 24) = v8;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
LABEL_8:
  v9 = *(_QWORD *)(a2 + 32);
  if (!*(_QWORD *)(a1 + 32))
  {
    if (v9)
    {
      v11 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = v9;
      *(_QWORD *)(a1 + 40) = v11;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_15;
  }
  if (!v9)
  {
    swift_release();
    goto LABEL_14;
  }
  v10 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v10;
  swift_release();
LABEL_15:
  v12 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  v13 = *(void **)(a1 + 88);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);

  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_BYTE *)(a1 + 113) = *(_BYTE *)(a2 + 113);

  v14 = *(void **)(a1 + 128);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);

  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 140);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_BYTE *)(a1 + 145) = *(_BYTE *)(a2 + 145);
  return a1;
}

uint64_t getEnumTagSinglePayload for EKCalendarChooserOOPHostView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 146))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EKCalendarChooserOOPHostView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 144) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 146) = 1;
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
    *(_BYTE *)(result + 146) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EKCalendarChooserOOPHostView()
{
  return &type metadata for EKCalendarChooserOOPHostView;
}

ValueMetadata *type metadata accessor for _AppExtensionCalendarChooserHostView()
{
  return &type metadata for _AppExtensionCalendarChooserHostView;
}

uint64_t sub_1AF9F5180()
{
  return type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(0);
}

void sub_1AF9F5188()
{
  unint64_t v0;
  unint64_t v1;

  sub_1AF9C6868();
  if (v0 <= 0x3F)
  {
    sub_1AF9C6B34(319, (unint64_t *)&unk_1EEE6C2A0, MEMORY[0x1E0DEAFA0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0C96198]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t sub_1AF9F5260()
{
  return type metadata accessor for _AppExtensionCalendarChooserHostView.HostCoordinator(0);
}

void sub_1AF9F5268()
{
  unint64_t v0;

  sub_1AF9C6868();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

unint64_t sub_1AF9F52F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEE6C5F8;
  if (!qword_1EEE6C5F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE6C538);
    v2[0] = sub_1AF9F5374();
    v2[1] = sub_1AF9C212C(&qword_1EEE6BE20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9170], MEMORY[0x1E0CD9160]);
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEE6C5F8);
  }
  return result;
}

unint64_t sub_1AF9F5374()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EEE6C600;
  if (!qword_1EEE6C600)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE6C608);
    v2[0] = sub_1AF9F4BBC();
    v2[1] = MEMORY[0x1E0CDCF98];
    result = MEMORY[0x1B5DFEDB0](MEMORY[0x1E0CD9C18], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EEE6C600);
  }
  return result;
}

unint64_t sub_1AF9F53E0()
{
  unint64_t result;

  result = qword_1EEE6C618;
  if (!qword_1EEE6C618)
  {
    result = MEMORY[0x1B5DFEDB0](&unk_1AFA14ED8, &type metadata for _AppExtensionCalendarChooserHostView);
    atomic_store(result, (unint64_t *)&qword_1EEE6C618);
  }
  return result;
}

void *sub_1AF9F543C()
{
  return &unk_1E601DEB8;
}

void *sub_1AF9F5448()
{
  return &unk_1E601DEC8;
}

unint64_t EKEventViewSceneID.getter()
{
  return 0xD000000000000010;
}

void *sub_1AF9F5470()
{
  return &unk_1E601DED8;
}

unint64_t EKEventGenericDetailViewSceneID.getter()
{
  return 0xD00000000000001DLL;
}

void *sub_1AF9F5498()
{
  return &unk_1E601DEE8;
}

unint64_t EKEventEditViewSceneID.getter()
{
  return 0xD000000000000014;
}

void *sub_1AF9F54C0()
{
  return &unk_1E601DEF8;
}

unint64_t EKCalendarChooserViewSceneID.getter()
{
  return 0xD00000000000001CLL;
}

unint64_t static EKRemoteUIButtonAction.Done.getter()
{
  return 0xD00000000000001ALL;
}

void *sub_1AF9F5530()
{
  return &unk_1E601DF08;
}

unint64_t static EKRemoteUIButtonAction.PresentShareSheet.getter()
{
  return 0xD000000000000027;
}

void *sub_1AF9F5584()
{
  return &unk_1E601DF18;
}

unint64_t static EKRemoteUIButtonAction.PresentEmailCompose.getter()
{
  return 0xD000000000000029;
}

id EKRemoteUIButtonAction.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id EKRemoteUIButtonAction.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKRemoteUIButtonAction();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for EKRemoteUIButtonAction()
{
  return objc_opt_self();
}

id EKRemoteUIButtonAction.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKRemoteUIButtonAction();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AF9F56B8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_remoteUIConfigured);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF9F56FC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_remoteUIConfigured);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9F5744())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF9F5788()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1AF9F79BC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1AF9F57F8@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0x90))();
  *a2 = result;
  return result;
}

uint64_t sub_1AF9F5838(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & **a2) + 0x98);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1AF9F5878()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_1AF9F79C8();
}

void (*sub_1AF9F58E0(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1AF9F79B0();
  return sub_1AF9C2BC4;
}

uint64_t sub_1AF9F5958()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C630);
  sub_1AF9F7998();
  return swift_endAccess();
}

uint64_t sub_1AF9F59B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C638);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C630);
  sub_1AF9F79A4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1AF9F5A8C(_QWORD *a1))(uint64_t a1, char a2)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C638);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel__configuration;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE6C630);
  sub_1AF9F7998();
  swift_endAccess();
  return sub_1AF9C2E0C;
}

uint64_t sub_1AF9F5B54()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_layoutDirection;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_1AF9F5B98(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_layoutDirection);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF9F5BE0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AF9F5C24()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  return *v1;
}

void sub_1AF9F5C68(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_sizeCategory);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9F5CB8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *sub_1AF9F5CFC()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_viewHierarchy);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1AF9F5D48(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_viewHierarchy);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_1AF9F5D98())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1AF9F5DDC()
{
  _BYTE *v0;
  void *v1;
  _BYTE *v2;
  id v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;

  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_layoutDirection] = 0;
  v1 = (void *)*MEMORY[0x1E0DC4938];
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_sizeCategory] = *MEMORY[0x1E0DC4938];
  *(_QWORD *)&v0[OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_viewHierarchy] = 0;
  v0[OBJC_IVAR____TtC10EventKitUI33EKCalendarChooserOOPHostViewModel_remoteUIConfigured] = 0;
  type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(0);
  v2 = v0;
  v3 = v1;
  v4 = sub_1AF9F26F0();
  swift_beginAccess();
  v7 = v4;
  sub_1AF9F798C();
  swift_endAccess();

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for EKCalendarChooserOOPHostViewModel();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for EKCalendarChooserOOPHostViewModel()
{
  uint64_t result;

  result = qword_1EEE6DC40;
  if (!qword_1EEE6DC40)
    return swift_getSingletonMetadata();
  return result;
}

id sub_1AF9F5F1C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EKCalendarChooserOOPHostViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AF9F5FB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for EKCalendarChooserOOPHostViewModel();
  result = sub_1AF9F7980();
  *a1 = result;
  return result;
}

uint64_t sub_1AF9F5FF0()
{
  return type metadata accessor for EKCalendarChooserOOPHostViewModel();
}

void sub_1AF9F5FF8()
{
  unint64_t v0;

  sub_1AF9F6090();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_1AF9F6090()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEE6C640)
  {
    type metadata accessor for _AppExtensionCalendarChooserHostView.Configuration(255);
    v0 = sub_1AF9F79D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEE6C640);
  }
}

uint64_t sub_1AF9F60E4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void __getREMObjectIDClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMObjectIDClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKExpandedReminderStackViewController.m"), 40, CFSTR("Unable to find class %s"), "REMObjectID");

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
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKExpandedReminderStackViewController.m"), 37, CFSTR("%s"), *a1);

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
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKExpandedReminderStackViewController.m"), 38, CFSTR("Unable to find class %s"), "REMStore");

  __break(1u);
}

void __getREMRecurrenceRuleFormatterClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMRecurrenceRuleFormatterClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKExpandedReminderStackViewController.m"), 41, CFSTR("Unable to find class %s"), "REMRecurrenceRuleFormatter");

  __break(1u);
}

void __getCNComposeRecipientClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ContactsAutocompleteUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKEventAttendeesEditViewController.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCNComposeRecipientClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNComposeRecipientClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEventAttendeesEditViewController.m"), 25, CFSTR("Unable to find class %s"), "CNComposeRecipient");

  __break(1u);
}

void __getBMStreamsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMStreamsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKUIDiscoverabilityUtilities.m"), 22, CFSTR("Unable to find class %s"), "BMStreams");

  __break(1u);
}

void BiomeStreamsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiomeStreamsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKUIDiscoverabilityUtilities.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBMDiscoverabilitySignalEventClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBMDiscoverabilitySignalEventClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKUIDiscoverabilityUtilities.m"), 23, CFSTR("Unable to find class %s"), "BMDiscoverabilitySignalEvent");

  __break(1u);
}

void __getCNComposeRecipientClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ContactsAutocompleteUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKShareePickerViewController.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCNComposeRecipientClass_block_invoke_cold_2_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNComposeRecipientClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKShareePickerViewController.m"), 30, CFSTR("Unable to find class %s"), "CNComposeRecipient");

  __break(1u);
}

void __getREMObjectIDClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMObjectIDClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEventViewControllerDefaultImpl.m"), 94, CFSTR("Unable to find class %s"), "REMObjectID");

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
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKEventViewControllerDefaultImpl.m"), 91, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMStoreClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEventViewControllerDefaultImpl.m"), 92, CFSTR("Unable to find class %s"), "REMStore");

  __break(1u);
}

void __getQLPreviewControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QuickLookLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKEventAttachmentCellController.m"), 28, CFSTR("%s"), *a1);

  __break(1u);
}

void __getQLPreviewControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getQLPreviewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEventAttachmentCellController.m"), 29, CFSTR("Unable to find class %s"), "QLPreviewController");

  __break(1u);
}

void __getREMRecurrenceRuleFormatterClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKReminderTitleDetailCell.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMRecurrenceRuleFormatterClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMRecurrenceRuleFormatterClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKReminderTitleDetailCell.m"), 20, CFSTR("Unable to find class %s"), "REMRecurrenceRuleFormatter");

  __break(1u);
}

void __getCNAutocompleteResultsTableViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNAutocompleteResultsTableViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEventAttendeePicker.m"), 64, CFSTR("Unable to find class %s"), "CNAutocompleteResultsTableViewController");

  __break(1u);
}

void ContactsAutocompleteUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ContactsAutocompleteUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKEventAttendeePicker.m"), 60, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCNComposeRecipientTextViewClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNComposeRecipientTextViewClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEventAttendeePicker.m"), 61, CFSTR("Unable to find class %s"), "CNComposeRecipientTextView");

  __break(1u);
}

void __getCNComposeRecipientClass_block_invoke_cold_1_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNComposeRecipientClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEventAttendeePicker.m"), 63, CFSTR("Unable to find class %s"), "CNComposeRecipient");

  __break(1u);
}

void __getCNComposeRecipientGroupClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNComposeRecipientGroupClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEventAttendeePicker.m"), 65, CFSTR("Unable to find class %s"), "CNComposeRecipientGroup");

  __break(1u);
}

void __getCNComposeRecipientOriginContextClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNComposeRecipientOriginContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEventAttendeePicker.m"), 68, CFSTR("Unable to find class %s"), "CNComposeRecipientOriginContext");

  __break(1u);
}

void __getCNAutocompleteSearchManagerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNAutocompleteSearchManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEventAttendeePicker.m"), 62, CFSTR("Unable to find class %s"), "CNAutocompleteSearchManager");

  __break(1u);
}

void __getPKScribbleInteractionClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PencilKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKCalendarItemLocationInlineEditItem.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPKScribbleInteractionClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPKScribbleInteractionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKCalendarItemLocationInlineEditItem.m"), 22, CFSTR("Unable to find class %s"), "PKScribbleInteraction");

  __break(1u);
}

uint64_t sub_1AF9F7890()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1AF9F789C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1AF9F78A8()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1AF9F78B4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1AF9F78C0()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1AF9F78CC()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1AF9F78D8()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1AF9F78E4()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1AF9F78F0()
{
  return MEMORY[0x1E0CAA5B8]();
}

uint64_t sub_1AF9F78FC()
{
  return MEMORY[0x1E0CAA5C8]();
}

uint64_t sub_1AF9F7908()
{
  return MEMORY[0x1E0CAA3F8]();
}

uint64_t sub_1AF9F7914()
{
  return MEMORY[0x1E0CAA400]();
}

uint64_t sub_1AF9F7920()
{
  return MEMORY[0x1E0CAA410]();
}

uint64_t sub_1AF9F792C()
{
  return MEMORY[0x1E0CAA418]();
}

uint64_t sub_1AF9F7938()
{
  return MEMORY[0x1E0CAA428]();
}

uint64_t sub_1AF9F7944()
{
  return MEMORY[0x1E0CAA430]();
}

uint64_t sub_1AF9F7950()
{
  return MEMORY[0x1E0CAA4D0]();
}

uint64_t sub_1AF9F795C()
{
  return MEMORY[0x1E0CAA4D8]();
}

uint64_t sub_1AF9F7968()
{
  return MEMORY[0x1E0CAA508]();
}

uint64_t sub_1AF9F7974()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1AF9F7980()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1AF9F798C()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1AF9F7998()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1AF9F79A4()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1AF9F79B0()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1AF9F79BC()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1AF9F79C8()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1AF9F79D4()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1AF9F79E0()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1AF9F79EC()
{
  return MEMORY[0x1E0CD9170]();
}

uint64_t sub_1AF9F79F8()
{
  return MEMORY[0x1E0CD94E0]();
}

uint64_t sub_1AF9F7A04()
{
  return MEMORY[0x1E0CD9C98]();
}

uint64_t sub_1AF9F7A10()
{
  return MEMORY[0x1E0CDB418]();
}

uint64_t sub_1AF9F7A1C()
{
  return MEMORY[0x1E0CDB600]();
}

uint64_t sub_1AF9F7A28()
{
  return MEMORY[0x1E0CDB868]();
}

uint64_t sub_1AF9F7A34()
{
  return MEMORY[0x1E0CDCE50]();
}

uint64_t sub_1AF9F7A40()
{
  return MEMORY[0x1E0CDCE58]();
}

uint64_t sub_1AF9F7A4C()
{
  return MEMORY[0x1E0CDCE70]();
}

uint64_t sub_1AF9F7A58()
{
  return MEMORY[0x1E0CDCE80]();
}

uint64_t sub_1AF9F7A64()
{
  return MEMORY[0x1E0CDCE88]();
}

uint64_t sub_1AF9F7A70()
{
  return MEMORY[0x1E0CDCE98]();
}

uint64_t sub_1AF9F7A7C()
{
  return MEMORY[0x1E0CDCEA8]();
}

uint64_t sub_1AF9F7A88()
{
  return MEMORY[0x1E0CDCEC0]();
}

uint64_t sub_1AF9F7A94()
{
  return MEMORY[0x1E0CDD220]();
}

uint64_t sub_1AF9F7AA0()
{
  return MEMORY[0x1E0CDD360]();
}

uint64_t sub_1AF9F7AAC()
{
  return MEMORY[0x1E0CDD378]();
}

uint64_t sub_1AF9F7AB8()
{
  return MEMORY[0x1E0CDD388]();
}

uint64_t sub_1AF9F7AC4()
{
  return MEMORY[0x1E0CDD398]();
}

uint64_t sub_1AF9F7AD0()
{
  return MEMORY[0x1E0CDD3A8]();
}

uint64_t sub_1AF9F7ADC()
{
  return MEMORY[0x1E0CDDB90]();
}

uint64_t sub_1AF9F7AE8()
{
  return MEMORY[0x1E0CDDC30]();
}

uint64_t sub_1AF9F7AF4()
{
  return MEMORY[0x1E0CDDDD8]();
}

uint64_t sub_1AF9F7B00()
{
  return MEMORY[0x1E0CDDE50]();
}

uint64_t sub_1AF9F7B0C()
{
  return MEMORY[0x1E0CDDE60]();
}

uint64_t sub_1AF9F7B18()
{
  return MEMORY[0x1E0CDE378]();
}

uint64_t sub_1AF9F7B24()
{
  return MEMORY[0x1E0CDF3B8]();
}

uint64_t sub_1AF9F7B30()
{
  return MEMORY[0x1E0CDF590]();
}

uint64_t sub_1AF9F7B3C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1AF9F7B48()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1AF9F7B54()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1AF9F7B60()
{
  return MEMORY[0x1E0CA9E10]();
}

uint64_t sub_1AF9F7B6C()
{
  return MEMORY[0x1E0CA9E18]();
}

uint64_t sub_1AF9F7B78()
{
  return MEMORY[0x1E0CA9E20]();
}

uint64_t sub_1AF9F7B84()
{
  return MEMORY[0x1E0CA9E30]();
}

uint64_t sub_1AF9F7B90()
{
  return MEMORY[0x1E0CA9E38]();
}

uint64_t sub_1AF9F7B9C()
{
  return MEMORY[0x1E0CA9E40]();
}

uint64_t sub_1AF9F7BA8()
{
  return MEMORY[0x1E0CA9E48]();
}

uint64_t sub_1AF9F7BB4()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1AF9F7BC0()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1AF9F7BCC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1AF9F7BD8()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1AF9F7BE4()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1AF9F7BF0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1AF9F7BFC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1AF9F7C08()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1AF9F7C14()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1AF9F7C20()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1AF9F7C2C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1AF9F7C38()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1AF9F7C44()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1AF9F7C50()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1AF9F7C5C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1AF9F7C68()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1AF9F7C74()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1AF9F7C80()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1AF9F7C8C()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1AF9F7C98()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1AF9F7CA4()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1AF9F7CB0()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1AF9F7CBC()
{
  return MEMORY[0x1E0CB1BB8]();
}

uint64_t sub_1AF9F7CC8()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1AF9F7CD4()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1AF9F7CE0()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1AF9F7CEC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1AF9F7CF8()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1AF9F7D04()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1AF9F7D10()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1AF9F7D1C()
{
  return MEMORY[0x1E0CAA5D8]();
}

uint64_t sub_1AF9F7D28()
{
  return MEMORY[0x1E0CAA5E0]();
}

uint64_t sub_1AF9F7D34()
{
  return MEMORY[0x1E0CAA5F0]();
}

uint64_t sub_1AF9F7D40()
{
  return MEMORY[0x1E0CAA5F8]();
}

uint64_t sub_1AF9F7D4C()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1AF9F7D58()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1AF9F7D64()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1AF9F7D70()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1AF9F7D7C()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1AF9F7D88()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1AF9F7D94()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1AF9F7DA0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1AF9F7DAC()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1AF9F7DB8()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1AF9F7DC4()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1AF9F7DD0()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1AF9F7DDC()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1AF9F7DE8()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1AF9F7DF4()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1AF9F7E00()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1AF9F7E0C()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1AF9F7E18()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1AF9F7E24()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1AF9F7E30()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1AF9F7E3C()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1AF9F7E48()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1AF9F7E54()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1AF9F7E60()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1AF9F7E6C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1AF9F7E78()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1AF9F7E84()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1AF9F7E90()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1AF9F7E9C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1AF9F7EA8()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1AF9F7EB4()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1AF9F7EC0()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1AF9F7ECC()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1AF9F7ED8()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1AF9F7EE4()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1AF9F7EF0()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1AF9F7EFC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1AF9F7F08()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1AF9F7F14()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1AF9F7F20()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1AF9F7F2C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1AF9F7F38()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1AF9F7F44()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1AF9F7F50()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1AF9F7F5C()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1AF9F7F68()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1AF9F7F74()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1AF9F7F80()
{
  return MEMORY[0x1E0DEDF40]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2668](retstr, t, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98460](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1E0C98488](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C210](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFlush(CGContextRef c)
{
  MEMORY[0x1E0C9C230](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x1E0C9C3E8]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x1E0C9C470](c, lengths, count, phase);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x1E0C9C478](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

void CGPathAddLines(CGMutablePathRef path, const CGAffineTransform *m, const CGPoint *points, size_t count)
{
  MEMORY[0x1E0C9D2B0](path, m, points, count);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
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

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPDateFormatStringForFormatType()
{
  return MEMORY[0x1E0CFA260]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1E0CA7C10]();
}

uint64_t CUIKAbbreviatedEmDashDayStringForDate()
{
  return MEMORY[0x1E0D0C8C8]();
}

uint64_t CUIKAdjustedColorForBackgroundColor()
{
  return MEMORY[0x1E0D0C8D0]();
}

uint64_t CUIKAdjustedColorForColor()
{
  return MEMORY[0x1E0D0C8D8]();
}

uint64_t CUIKAllDayBackgroundColor()
{
  return MEMORY[0x1E0D0C8E0]();
}

uint64_t CUIKAppTintColor()
{
  return MEMORY[0x1E0D0C8F0]();
}

uint64_t CUIKBackgroundColorForCalendarColorWithOpaqueForStyle()
{
  return MEMORY[0x1E0D0C8F8]();
}

uint64_t CUIKBlendColorsSourceOver()
{
  return MEMORY[0x1E0D0C908]();
}

uint64_t CUIKBundle()
{
  return MEMORY[0x1E0D0C910]();
}

uint64_t CUIKCalendar()
{
  return MEMORY[0x1E0D0C918]();
}

uint64_t CUIKCheckEventStartDateAgainstOccurrenceCacheBounds()
{
  return MEMORY[0x1E0D0C928]();
}

uint64_t CUIKColorBarColor()
{
  return MEMORY[0x1E0D0C930]();
}

uint64_t CUIKColorDarkenedToPercentageWithFinalAlpha()
{
  return MEMORY[0x1E0D0C938]();
}

uint64_t CUIKColorIsWhite()
{
  return MEMORY[0x1E0D0C940]();
}

uint64_t CUIKColorLightenedToPercentageWithFinalAlpha()
{
  return MEMORY[0x1E0D0C948]();
}

uint64_t CUIKCompareEKCalendars()
{
  return MEMORY[0x1E0D0C950]();
}

uint64_t CUIKCreateStripedUIImage()
{
  return MEMORY[0x1E0D0C970]();
}

uint64_t CUIKCurrentLocaleRequiresUnabbrevatedMonthNames()
{
  return MEMORY[0x1E0D0C978]();
}

uint64_t CUIKDecomposedAttendeeName()
{
  return MEMORY[0x1E0D0C988]();
}

uint64_t CUIKDescriptorForRequiredKeysForLabeledDisplayString()
{
  return MEMORY[0x1E0D0C990]();
}

uint64_t CUIKDetermineWeekStart()
{
  return MEMORY[0x1E0D0C998]();
}

uint64_t CUIKDisplayStringForAvailability()
{
  return MEMORY[0x1E0D0C9A0]();
}

uint64_t CUIKDisplayStringForNotificationIdentity()
{
  return MEMORY[0x1E0D0C9A8]();
}

uint64_t CUIKDisplayStringForTravelTimeUsingShortFormat()
{
  return MEMORY[0x1E0D0C9B0]();
}

uint64_t CUIKDisplayStringTravelTimeAndDuration()
{
  return MEMORY[0x1E0D0C9B8]();
}

uint64_t CUIKDisplayedTitleForCalendar()
{
  return MEMORY[0x1E0D0C9C0]();
}

uint64_t CUIKDisplayedTitleForEvent()
{
  return MEMORY[0x1E0D0C9C8]();
}

uint64_t CUIKDisplayedTitleForSource()
{
  return MEMORY[0x1E0D0C9D0]();
}

uint64_t CUIKDurationStringForDates()
{
  return MEMORY[0x1E0D0C9D8]();
}

uint64_t CUIKDurationStringForTimeInterval()
{
  return MEMORY[0x1E0D0C9E0]();
}

uint64_t CUIKEventDisplaysAsDeclined()
{
  return MEMORY[0x1E0D0C9F0]();
}

uint64_t CUIKEventDisplaysAsNeedsReply()
{
  return MEMORY[0x1E0D0C9F8]();
}

uint64_t CUIKEventDisplaysAsTentative()
{
  return MEMORY[0x1E0D0CA00]();
}

uint64_t CUIKGetAttributedStringForEventDetailWithURL()
{
  return MEMORY[0x1E0D0CA08]();
}

uint64_t CUIKGetDefaultStartAndEndTimeForDate()
{
  return MEMORY[0x1E0D0CA10]();
}

uint64_t CUIKGetOverlayCalendar()
{
  return MEMORY[0x1E0D0CA18]();
}

uint64_t CUIKGetTypeAndEndDateForRecurrenceRules()
{
  return MEMORY[0x1E0D0CA20]();
}

uint64_t CUIKGregorianUnitsForRecurrenceTypeAndInterval()
{
  return MEMORY[0x1E0D0CA28]();
}

uint64_t CUIKIntervalForRepeatType()
{
  return MEMORY[0x1E0D0CA40]();
}

uint64_t CUIKInvalidateToday()
{
  return MEMORY[0x1E0D0CA48]();
}

uint64_t CUIKInvitationTitleColor()
{
  return MEMORY[0x1E0D0CA50]();
}

uint64_t CUIKIsWeekdayNameFirst()
{
  return MEMORY[0x1E0D0CA58]();
}

uint64_t CUIKLocaleIsRightToLeft()
{
  return MEMORY[0x1E0D0CA78]();
}

uint64_t CUIKLocalizedStringForInteger()
{
  return MEMORY[0x1E0D0CA80]();
}

uint64_t CUIKLocalizedStringForIntegerWithMinimumTwoDigits()
{
  return MEMORY[0x1E0D0CA88]();
}

uint64_t CUIKLongDayStringForDate()
{
  return MEMORY[0x1E0D0CA90]();
}

uint64_t CUIKLongDayStringForDateNoYear()
{
  return MEMORY[0x1E0D0CA98]();
}

uint64_t CUIKLongEmDashDayStringForDate()
{
  return MEMORY[0x1E0D0CAA0]();
}

uint64_t CUIKLongStringForDateAndTime()
{
  return MEMORY[0x1E0D0CAA8]();
}

uint64_t CUIKLongStringForDateWithCommaAndYear()
{
  return MEMORY[0x1E0D0CAB0]();
}

uint64_t CUIKLongStringForMonth()
{
  return MEMORY[0x1E0D0CAB8]();
}

uint64_t CUIKLongStringForWeekday()
{
  return MEMORY[0x1E0D0CAC0]();
}

uint64_t CUIKLuminance()
{
  return MEMORY[0x1E0D0CAC8]();
}

uint64_t CUIKMessageStringForEventInvitationNotification()
{
  return MEMORY[0x1E0D0CAD0]();
}

uint64_t CUIKNSDateIsToday()
{
  return MEMORY[0x1E0D0CAD8]();
}

uint64_t CUIKNotesFieldHasInlineExchangeAttachments()
{
  return MEMORY[0x1E0D0CAF0]();
}

uint64_t CUIKNowComponents()
{
  return MEMORY[0x1E0D0CAF8]();
}

uint64_t CUIKNowComponentsSystemTime()
{
  return MEMORY[0x1E0D0CB00]();
}

uint64_t CUIKNowDate()
{
  return MEMORY[0x1E0D0CB08]();
}

uint64_t CUIKNumberOfSecondsForCurrentTime()
{
  return MEMORY[0x1E0D0CB10]();
}

uint64_t CUIKOccurrenceLeadingIconAlphaScale()
{
  return MEMORY[0x1E0D0CB30]();
}

uint64_t CUIKOccurrenceSecondaryTextColor()
{
  return MEMORY[0x1E0D0CB38]();
}

uint64_t CUIKOneIndexedWeekStart()
{
  return MEMORY[0x1E0D0CB48]();
}

uint64_t CUIKRecurrenceDateMatchesAnyDaySpecifiedInByDayList()
{
  return MEMORY[0x1E0D0CB60]();
}

uint64_t CUIKRecurrenceDateMatchesAnyDaySpecifiedInByMonthDayList()
{
  return MEMORY[0x1E0D0CB68]();
}

uint64_t CUIKRecurrenceFrequencyForRepeatType()
{
  return MEMORY[0x1E0D0CB70]();
}

uint64_t CUIKRecurrenceMonthMatchesAnyMonthSpecifiedInByMonthList()
{
  return MEMORY[0x1E0D0CB78]();
}

uint64_t CUIKRoundToScreenScale()
{
  return MEMORY[0x1E0D0CB80]();
}

uint64_t CUIKSecondaryTextColorForCalendarColorForStyle()
{
  return MEMORY[0x1E0D0CB88]();
}

uint64_t CUIKShortStringForDateWithMonthAndYear()
{
  return MEMORY[0x1E0D0CB90]();
}

uint64_t CUIKShortStringForDay()
{
  return MEMORY[0x1E0D0CB98]();
}

uint64_t CUIKShortTZString()
{
  return MEMORY[0x1E0D0CBA0]();
}

uint64_t CUIKShouldDisplayNotes()
{
  return MEMORY[0x1E0D0CBA8]();
}

uint64_t CUIKShouldShowTimezoneClarification()
{
  return MEMORY[0x1E0D0CBB0]();
}

uint64_t CUIKShow24Hours()
{
  return MEMORY[0x1E0D0CBB8]();
}

uint64_t CUIKStringAbbreviationForDayOfWeek()
{
  return MEMORY[0x1E0D0CBD8]();
}

uint64_t CUIKStringAbbreviationForMonth()
{
  return MEMORY[0x1E0D0CBE0]();
}

uint64_t CUIKStringForDate()
{
  return MEMORY[0x1E0D0CBE8]();
}

uint64_t CUIKStringForDateAndDayOfWeekInCalendarTimezone()
{
  return MEMORY[0x1E0D0CBF0]();
}

uint64_t CUIKStringForDateAndDayOfWeekInCalendarTimezoneWithFormattingContext()
{
  return MEMORY[0x1E0D0CBF8]();
}

uint64_t CUIKStringForDateAndDayOfWeekInTimezone()
{
  return MEMORY[0x1E0D0CC00]();
}

uint64_t CUIKStringForDateAndDayOfWeekSystemTime()
{
  return MEMORY[0x1E0D0CC08]();
}

uint64_t CUIKStringForDateAndTime()
{
  return MEMORY[0x1E0D0CC10]();
}

uint64_t CUIKStringForDateWithCommaAndYear()
{
  return MEMORY[0x1E0D0CC18]();
}

uint64_t CUIKStringForDayOfWeek()
{
  return MEMORY[0x1E0D0CC20]();
}

uint64_t CUIKStringForDayOfWeekNotStandalone()
{
  return MEMORY[0x1E0D0CC28]();
}

uint64_t CUIKStringForGMTTime()
{
  return MEMORY[0x1E0D0CC30]();
}

uint64_t CUIKStringForHour()
{
  return MEMORY[0x1E0D0CC38]();
}

uint64_t CUIKStringForHourWithoutDesignator()
{
  return MEMORY[0x1E0D0CC40]();
}

uint64_t CUIKStringForMonth()
{
  return MEMORY[0x1E0D0CC48]();
}

uint64_t CUIKStringForMonthNumber()
{
  return MEMORY[0x1E0D0CC50]();
}

uint64_t CUIKStringForMonthYear()
{
  return MEMORY[0x1E0D0CC58]();
}

uint64_t CUIKStringForRecurrenceRule()
{
  return MEMORY[0x1E0D0CC60]();
}

uint64_t CUIKStringForRecurrenceRuleAndDate()
{
  return MEMORY[0x1E0D0CC68]();
}

uint64_t CUIKStringForRepeatType()
{
  return MEMORY[0x1E0D0CC70]();
}

uint64_t CUIKStringForRepeatTypeDetail()
{
  return MEMORY[0x1E0D0CC78]();
}

uint64_t CUIKStringForTime()
{
  return MEMORY[0x1E0D0CC80]();
}

uint64_t CUIKStringForTimeWithTZ()
{
  return MEMORY[0x1E0D0CC88]();
}

uint64_t CUIKStringForTimeWithTZIfDivergent()
{
  return MEMORY[0x1E0D0CC90]();
}

uint64_t CUIKStringForWeekdayNoYear()
{
  return MEMORY[0x1E0D0CC98]();
}

uint64_t CUIKStringForYear()
{
  return MEMORY[0x1E0D0CCA0]();
}

uint64_t CUIKStringMonthDayYearTime()
{
  return MEMORY[0x1E0D0CCA8]();
}

uint64_t CUIKStringMonthDayYearWithComma()
{
  return MEMORY[0x1E0D0CCB0]();
}

uint64_t CUIKStripInlineExchangeAttachmentsFromNotes()
{
  return MEMORY[0x1E0D0CCB8]();
}

uint64_t CUIKTextColorForCalendarColorForStyle()
{
  return MEMORY[0x1E0D0CCC0]();
}

uint64_t CUIKTimeIntervalStringForDates()
{
  return MEMORY[0x1E0D0CCC8]();
}

uint64_t CUIKTimezoneClarificationStringForDates()
{
  return MEMORY[0x1E0D0CCD0]();
}

uint64_t CUIKTimezonesDivergeAtDate()
{
  return MEMORY[0x1E0D0CCD8]();
}

uint64_t CUIKTodayComponents()
{
  return MEMORY[0x1E0D0CCE0]();
}

uint64_t CUIKTodayDate()
{
  return MEMORY[0x1E0D0CCE8]();
}

uint64_t CUIKWeekdayVeryShortAbbreviations()
{
  return MEMORY[0x1E0D0CCF0]();
}

uint64_t CUIKZeroIndexedWeekStart()
{
  return MEMORY[0x1E0D0CCF8]();
}

uint64_t CalAbsoluteTimeAddGregorianUnits()
{
  return MEMORY[0x1E0D0BF50]();
}

uint64_t CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone()
{
  return MEMORY[0x1E0D0BF88]();
}

uint64_t CalAnalyticsSendEvent()
{
  return MEMORY[0x1E0D0BFB8]();
}

uint64_t CalAnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D0BFC0]();
}

uint64_t CalBooleanAsString()
{
  return MEMORY[0x1E0D0BFD8]();
}

uint64_t CalCopyCalendar()
{
  return MEMORY[0x1E0D0BFF8]();
}

uint64_t CalCopySystemTimeZone()
{
  return MEMORY[0x1E0D0C008]();
}

uint64_t CalCopyTimeZone()
{
  return MEMORY[0x1E0D0C010]();
}

uint64_t CalDateTimeGetGregorianDate()
{
  return MEMORY[0x1E0D0C020]();
}

uint64_t CalEqualStrings()
{
  return MEMORY[0x1E0D0C0C8]();
}

uint64_t CalGenerateQualifiedIdentifierWithClassAndSubdomain()
{
  return MEMORY[0x1E0D0C0D0]();
}

uint64_t CalGregorianDateGetAbsoluteTime()
{
  return MEMORY[0x1E0D0C0F8]();
}

uint64_t CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone()
{
  return MEMORY[0x1E0D0C100]();
}

uint64_t CalTimeZoneCopyCFTimeZone()
{
  return MEMORY[0x1E0D0C198]();
}

uint64_t CalendarFoundationPerformBlockOnSharedContactStore()
{
  return MEMORY[0x1E0D0C1A0]();
}

uint64_t EKAvailabilitySpanTypeAsString()
{
  return MEMORY[0x1E0CA9E58]();
}

uint64_t EKSymbolicColorToRGBMapping()
{
  return MEMORY[0x1E0D0C208]();
}

uint64_t EKUtils_AdjustedAttendeeAddress()
{
  return MEMORY[0x1E0CA9FB0]();
}

uint64_t EKWeakLinkClass()
{
  return MEMORY[0x1E0D0C210]();
}

uint64_t EKWeakLinkStringConstant()
{
  return MEMORY[0x1E0D0C218]();
}

uint64_t EKWeakLinkSymbol()
{
  return MEMORY[0x1E0D0C220]();
}

uint64_t ICSRedactString()
{
  return MEMORY[0x1E0DDB780]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0DC4500]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0DC4728]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0DC48E0](lhs, rhs);
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

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x1E0DC4E50]();
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x1E0DC4F88]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t UISetColor()
{
  return MEMORY[0x1E0DC5370]();
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x1E0DC53C8]();
}

uint64_t UnzipArchive()
{
  return MEMORY[0x1E0D0C438]();
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

uint64_t _UIContentSizeCategoryCompareToContentSizeCategory()
{
  return MEMORY[0x1E0DC57A8]();
}

uint64_t _UIDragInteractionDefaultLiftDelay()
{
  return MEMORY[0x1E0DC57E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _bitmaskContainsOption()
{
  return MEMORY[0x1E0CAA1C0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

uint64_t attributedStatusGlyph()
{
  return MEMORY[0x1E0D0CE50]();
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
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

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

