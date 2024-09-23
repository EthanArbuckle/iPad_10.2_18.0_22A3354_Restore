BOOL AXColorsProbablyEqual(void *a1, void *a2)
{
  _BOOL8 result;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  result = 0;
  if (a1 && a2)
  {
    v11 = 0.0;
    v12 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    v4 = a2;
    objc_msgSend(a1, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);
    objc_msgSend(v4, "getRed:green:blue:alpha:", &v8, &v7, &v6, &v5);

    return vabdd_f64(v12, v8) < 0.001
        && vabdd_f64(v11, v7) < 0.001
        && vabdd_f64(v10, v6) < 0.001
        && vabdd_f64(v9, v5) < 0.001;
  }
  return result;
}

void sub_1BD894E2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD894FBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BD89505C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1BD8952B8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 120));
  _Unwind_Resume(a1);
}

void sub_1BD895324()
{
  JUMPOUT(0x1BD895314);
}

id getBFFStyleClass()
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
  v0 = (void *)getBFFStyleClass_softClass;
  v7 = getBFFStyleClass_softClass;
  if (!getBFFStyleClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBFFStyleClass_block_invoke;
    v3[3] = &unk_1E76AB358;
    v3[4] = &v4;
    __getBFFStyleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD897D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD89845C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;

  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

Class __getBFFStyleClass_block_invoke(uint64_t a1)
{
  Class result;
  OS_os_log *v3;

  if (!SetupAssistantUILibraryCore_frameworkLibrary)
  {
    SetupAssistantUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SetupAssistantUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BFFStyle");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = __getBFFStyleClass_block_invoke_cold_1();
    free(v3);
  }
  getBFFStyleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getSBSIsReachabilityEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SBSIsReachabilityEnabled");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBSIsReachabilityEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL AXInvertColorsIsSystemWideDarkModeEnabled()
{
  void *v0;
  uint64_t v1;
  _BOOL8 v2;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC5C68]), "initWithDelegate:", 0);
  objc_msgSend(v0, "modeValue");
  if (UISUserInterfaceStyleModeValueIsAutomatic())
    v1 = objc_msgSend(v0, "override");
  else
    v1 = objc_msgSend(v0, "modeValue");
  v2 = v1 == 2;

  return v2;
}

void AXInvertColorsSetSystemWideDarkModeEnabled(int a1)
{
  id v1;

  if (AXInvertColorsIsSystemWideDarkModeEnabled() != a1)
  {
    objc_msgSend(MEMORY[0x1E0DC3EF8], "sharedInstance");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "toggleCurrentStyle");

  }
}

const __CFString *AXInvertColorsUserInterfaceStyleDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("?");
  else
    return off_1E76AB3D0[a1];
}

uint64_t _systemAppDidBecomeReady(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_systemAppDidBecomeReady");
}

void sub_1BD899F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return NSRequestConcreteImplementation();
}

id sharedBFFStyle()
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
  v0 = (void *)getBFFStyleClass_softClass_0;
  v7 = getBFFStyleClass_softClass_0;
  if (!getBFFStyleClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBFFStyleClass_block_invoke_0;
    v3[3] = &unk_1E76AB358;
    v3[4] = &v4;
    __getBFFStyleClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  objc_msgSend(v1, "sharedStyle");
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1BD89A7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBFFStyleClass_block_invoke_0(uint64_t a1)
{
  Class result;
  OS_os_log *v3;

  if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
  {
    SetupAssistantUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!SetupAssistantUILibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BFFStyle");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = __getBFFStyleClass_block_invoke_cold_1();
    free(v3);
  }
  getBFFStyleClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_13(id *a1)
{
  return objc_msgSend(*a1, "pidForDrag");
}

uint64_t OUTLINED_FUNCTION_14(void *a1, const char *a2)
{
  return objc_msgSend(a1, "processIdentifier");
}

void OUTLINED_FUNCTION_15(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

CGFloat AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside()
{
  double v0;
  CGFloat v1;
  double v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect slice;
  CGRect remainder;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v0 = AXUIKeyboardScreenFrame();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  remainder.origin.x = v0;
  remainder.origin.y = v1;
  remainder.size.width = v3;
  remainder.size.height = v5;
  objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "inputAccessoryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v35.origin.x = v0;
    v35.origin.y = v2;
    v35.size.width = v4;
    v35.size.height = v6;
    if (!CGRectIsEmpty(v35))
    {
      objc_msgSend(v9, "accessibilityFrame");
      v39.origin.x = v10;
      v39.origin.y = v11;
      v39.size.width = v12;
      v39.size.height = v13;
      v36.origin.x = v0;
      v36.origin.y = v2;
      v36.size.width = v4;
      v36.size.height = v6;
      v14 = CGRectContainsRect(v36, v39);
      LOBYTE(slice.origin.x) = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        v17 = v14;
      else
        v17 = 1;
      v18 = v15;
      if ((v17 & 1) == 0)
      {
        v19 = v15;
        do
        {
          v14 = v19 == v9;
          objc_msgSend(v19, "superview");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            break;
          v20 = v19 == v9;
          v19 = v18;
        }
        while (!v20);
      }
      if (v14)
      {
        objc_msgSend(v9, "window");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "frame");
        objc_msgSend(v9, "convertRect:toView:", 0);
        objc_msgSend(v21, "convertRect:toWindow:", 0);
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;

        v37.origin.x = v23;
        v37.origin.y = v25;
        v37.size.width = v27;
        v37.size.height = v29;
        v40.origin.x = v0;
        v40.origin.y = v2;
        v40.size.width = v4;
        v40.size.height = v6;
        if (CGRectIntersectsRect(v37, v40))
        {
          v30 = v29 + v25 - v2;
          if (v30 < 0.0)
            _AXAssert();
          memset(&slice, 0, sizeof(slice));
          if (v30 >= 0.0)
            v31 = v30;
          else
            v31 = 0.0;
          v38.origin.x = v0;
          v38.origin.y = v2;
          v38.size.width = v4;
          v38.size.height = v6;
          CGRectDivide(v38, &slice, &remainder, v31, CGRectMinYEdge);
        }
        else
        {
          _AXLogWithFacility();
        }
      }

    }
  }

  return remainder.origin.x;
}

double AXUIKeyboardScreenFrame()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  UIView *v14;
  CGRect v16;

  AXUIKeyboardWindow();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "rootViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("UIInputWindowController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "safeCGRectForKey:", CFSTR("visibleFrame"));
      v4 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
      v14 = (UIView *)objc_claimAutoreleasedReturnValue();
      v16.origin.x = v7;
      v16.origin.y = v9;
      v16.size.width = v11;
      v16.size.height = v13;
      *(_QWORD *)&v4 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v16, v14);

    }
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
  }

  return v4;
}

id AXUIKeyboardWindow()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;
  int v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (AXUIKeyboardIsOOP())
  {
    objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "window");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v1)
    {
LABEL_6:
      AXUIFirstTextEffectsWindow();
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentInputMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isExtensionInputMode");

    v5 = -[objc_class safeBoolForKey:](NSClassFromString(CFSTR("_UIRemoteKeyboards")), "safeBoolForKey:", CFSTR("enabled"));
    if ((v4 & 1) == 0 && !v5)
      goto LABEL_6;
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("_UIRemoteKeyboards")), "safeValueForKey:", CFSTR("sharedRemoteKeyboards"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("inputViews"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "safeValueForKey:", CFSTR("inputView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = 0;
    if (objc_msgSend(v7, "safeBoolForKey:", CFSTR("keyboardVisible")) && v11)
    {
      if ((objc_msgSend(v10, "safeBoolForKey:", CFSTR("isInputViewPlaceholder")) & 1) != 0)
      {
        v1 = 0;
      }
      else
      {
        objc_msgSend(v7, "safeValueForKey:", CFSTR("keyboardWindow"));
        v1 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  return v1;
}

double AXUIKeyboardVisibleInputScreenFrame()
{
  void *v0;
  void *v1;
  void *v2;
  double v3;
  double v4;

  AXUIKeyboardWindow();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "rootViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safeCGRectForKey:", CFSTR("visibleInputViewFrame"));
    v4 = v3;

  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
  }

  return v4;
}

id AXUIFirstTextEffectsWindow()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "connectedScenes", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v10;
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v10 != v3)
          objc_enumerationMutation(v0);
        v5 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0DC3DB0], "activeTextEffectsWindowForWindowScene:", v5);
          v6 = objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            v7 = (void *)v6;
            goto LABEL_12;
          }
        }
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v2)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_12:

  return v7;
}

uint64_t AXUIKeyboardIsOOP()
{
  void *v1;
  void *v2;
  uint64_t v3;

  if ((objc_msgSend(MEMORY[0x1E0DC3938], "safeBoolForKey:", CFSTR("usesInputSystemUI")) & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CF38D8]);

  return v3;
}

id AXUIAllKeyboardWindows()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "connectedScenes", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v18;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v18 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0DC3DB0], "activeTextEffectsWindowForWindowScene:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v0, "axSafelyAddObject:", v7);

        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v3);
  }

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isExtensionInputMode");

  v11 = -[objc_class safeBoolForKey:](NSClassFromString(CFSTR("_UIRemoteKeyboards")), "safeBoolForKey:", CFSTR("enabled"));
  if ((v10 & 1) != 0 || v11)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("_UIRemoteKeyboards")), "safeValueForKey:", CFSTR("sharedRemoteKeyboards"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("keyboardWindow"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "axSafelyAddObject:", v13);

  }
  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && (objc_msgSend(v0, "containsObject:", v15) & 1) == 0)
    objc_msgSend(v0, "addObject:", v15);

  return v0;
}

id AXUISentenceTextRangeForInput(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  NSUInteger v27;
  void *v28;
  char v29;
  void *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  os_log_type_t type;
  void *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;
  NSRange v47;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v6)
    goto LABEL_25;
  if (!v7)
    v8 = v5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v5, "beginningOfDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endOfDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "textInRange:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF39D8], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "ignoreLogging");

    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CF39D8], "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v17 = objc_claimAutoreleasedReturnValue();

      v18 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v17, v18))
      {
        AXColorizeFormatLog();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v12;
        v40 = v13;
        _AXStringForArgs();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, v18))
        {
          *(_DWORD *)buf = 138543362;
          v45 = v20;
          _os_log_impl(&dword_1BD892000, v17, v18, "%{public}@", buf, 0xCu);
        }

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "start");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v9, v21);

      v23 = objc_msgSend(v13, "ax_sentenceFromPosition:inDirection:", v22, v22 != 0, v38, v40);
      v25 = v24;
      v43 = v12;
      if (v23 + v24 <= v22)
      {
        v26 = objc_msgSend(v13, "ax_sentenceFromPosition:inDirection:", v22, 0);
        if (v23 != 0x7FFFFFFF)
        {
          v23 = v26;
          v25 = v27;
        }
      }
      objc_msgSend(MEMORY[0x1E0CF39D8], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "ignoreLogging");

      if ((v29 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CF39D8], "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v31 = objc_claimAutoreleasedReturnValue();

        v32 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v31, v32))
        {
          AXColorizeFormatLog();
          type = v32;
          v33 = objc_claimAutoreleasedReturnValue();
          v47.location = v23;
          v47.length = v25;
          NSStringFromRange(v47);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)v33;
          _AXStringForArgs();
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v31, type))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v34;
            _os_log_impl(&dword_1BD892000, v31, type, "%{public}@", buf, 0xCu);
          }

        }
      }
      v12 = v43;
      if (v23 != 0x7FFFFFFF)
      {
        objc_msgSend(v5, "positionFromPosition:offset:", v9, v23);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "positionFromPosition:offset:", v9, v25 + v23);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "textRangeFromPosition:toPosition:", v36, v37);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
    }

LABEL_25:
    v10 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v6, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rangeEnclosingPosition:withGranularity:inDirection:", v9, 2, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_26:
  return v10;
}

id AXUIRepresentedKeyboardElement()
{
  if (AXUIRepresentedKeyboardElement_onceToken != -1)
    dispatch_once(&AXUIRepresentedKeyboardElement_onceToken, &__block_literal_global_1);
  return (id)AXUIRepresentedKeyboardElement_RepresentedKeyboardElement;
}

uint64_t AXUIKeyboardIsOnScreen()
{
  UIView *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  double x;
  double v17;
  CGFloat y;
  double v19;
  CGFloat width;
  double v21;
  CGFloat height;
  uint64_t v23;
  void *v24;
  void *v25;
  _BOOL4 IsEmpty;
  _BOOL4 v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  _BOOL4 v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v0 = (UIView *)objc_claimAutoreleasedReturnValue();
  if (!AXUIKeyboardIsOOP()
    || !objc_msgSend(MEMORY[0x1E0DC3938], "serviceRole")
    || !-[UIView isAutomatic](v0, "isAutomatic"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    AXUIAllKeyboardWindows();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v36 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          NSClassFromString(CFSTR("UIRemoteKeyboardWindow"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "rootViewController");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "safeValueForKey:", CFSTR("inputViewSet"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "safeValueForKey:", CFSTR("inputView"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {

              v2 = 1;
              goto LABEL_30;
            }
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v5)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentInputMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isExtensionInputMode");

    v15 = -[objc_class safeBoolForKey:](NSClassFromString(CFSTR("_UIRemoteKeyboards")), "safeBoolForKey:", CFSTR("enabled"));
    x = AXUIKeyboardScreenFrame();
    y = v17;
    width = v19;
    height = v21;
    -[UIView window](v0, "window");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      AXUIKeyboardWindow();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {

      }
      else
      {
        v41.origin.x = x;
        v41.origin.y = y;
        v41.size.width = width;
        v41.size.height = height;
        IsEmpty = CGRectIsEmpty(v41);

        if (IsEmpty)
        {
          -[UIView bounds](v0, "bounds");
          v43 = UIAccessibilityConvertFrameToScreenCoordinates(v42, v0);
          x = v43.origin.x;
          y = v43.origin.y;
          width = v43.size.width;
          height = v43.size.height;
        }
      }
    }
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v27 = CGRectIsEmpty(v44);
    if (v0)
    {
      v28 = v27;
      if (-[UIView isActive](v0, "isActive"))
      {
        -[UIView window](v0, "window");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
          v31 = 1;
        else
          v31 = v14;
        if (((v31 | v15) ^ 1 | v28) == 1)
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "bounds");
          v46.origin.x = x;
          v46.origin.y = y;
          v46.size.width = width;
          v46.size.height = height;
          v33 = CGRectIntersectsRect(v45, v46);

          if (v33)
          {
            v2 = -[UIView isMinimized](v0, "isMinimized") ^ 1;
            goto LABEL_30;
          }
        }
      }
    }
    v2 = 0;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "keyboardVisible");

LABEL_30:
  return v2;
}

uint64_t UIKeyboardCacheVersion()
{
  if (UIKeyboardCacheVersion_onceToken != -1)
    dispatch_once(&UIKeyboardCacheVersion_onceToken, &__block_literal_global_229);
  return UIKeyboardCacheVersion_buildVersion;
}

id UIKeyboardCachePath()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("Caches"), CFSTR("com.apple.keyboards"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void AXUIPurgeKeyboardCache()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc(MEMORY[0x1E0CFA988]);
  UIKeyboardCachePath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIKeyboardCacheVersion_onceToken != -1)
    dispatch_once(&UIKeyboardCacheVersion_onceToken, &__block_literal_global_229);
  v2 = (id)objc_msgSend(v0, "initWithPath:version:", v1, UIKeyboardCacheVersion_buildVersion);

  objc_msgSend(v2, "purge");
}

void sub_1BD89F054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD89F1C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD8A1260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

id AXColorStringForColor(void *a1, char a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  double Luma;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      AXColorStringForColor_cold_3((uint64_t)v3, v7, v13, v14, v15, v16, v17, v18);
    goto LABEL_16;
  }
  v4 = objc_retainAutorelease(v3);
  if (!objc_msgSend(v4, "CGColor"))
  {
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      AXColorStringForColor_cold_1((uint64_t)v4, v7, v19, v20, v21, v22, v23, v24);
    goto LABEL_16;
  }
  v5 = objc_retainAutorelease(v4);
  AXNameFromColor((CGColorRef)objc_msgSend(v5, "CGColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mutableCopy");

  if ((a2 & 1) != 0)
  {
    if (AXColorStringForColor_onceToken != -1)
      dispatch_once(&AXColorStringForColor_onceToken, &__block_literal_global_2);
    Luma = AXColorGetLuma(v5);
    v9 = (void *)AXColorStringForColor__lumaNumberFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", vcvtad_u64_f64(Luma * 100.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromNumber:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject appendFormat:](v7, "appendFormat:", CFSTR(" %@"), v11);
  }
  if (!v7)
  {
    AXLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      AXColorStringForColor_cold_2((uint64_t)v5, v25, v26, v27, v28, v29, v30, v31);

LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v12;
}

double AXColorGetLuma(void *a1)
{
  double result;
  double v2;
  double v3;
  double v4;
  double v5;

  v5 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v2 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  result = fmax(v2 * (v4 * 0.715200007 + v5 * 0.212599993 + v3 * 0.0722000003), 0.0);
  if (result > 1.0)
    return 1.0;
  return result;
}

id AXSlightlyDarkerColorForColor(void *a1)
{
  id v1;
  CGColor *v2;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  id v5;
  void *v6;
  const CGFloat *Components;

  v1 = objc_retainAutorelease(a1);
  v2 = (CGColor *)objc_msgSend(v1, "CGColor");
  ColorSpace = CGColorGetColorSpace(v2);
  Model = CGColorSpaceGetModel(ColorSpace);
  v5 = v1;
  v6 = v5;
  if (Model == kCGColorSpaceModelRGB)
  {
    Components = CGColorGetComponents(v2);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", *Components + -0.25, Components[1] + -0.25, Components[2] + -0.25, Components[3]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id AXSlightlyBrighterColorForColor(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v1 = a1;
  v13 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v10 = 0.0;
  if ((objc_msgSend(v1, "getRed:green:blue:alpha:", &v13, &v12, &v11, &v10) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v13, v12, v11, v10);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0.0;
    v9 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    if ((objc_msgSend(v2, "getHue:saturation:brightness:alpha:", &v9, &v8, &v7, &v6) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v9, v8, v7 * 1.5, v6);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = v1;
    }
    v4 = v3;

  }
  else
  {
    v4 = v1;
  }

  return v4;
}

id _AXInvertColorForColor(void *a1, int a2)
{
  id v3;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  void *v6;
  double v7;
  uint64_t v8;
  const CGFloat *Components;
  double v10;
  void *v11;
  double v13;
  double v14;

  v3 = objc_retainAutorelease(a1);
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v3, "CGColor"));
  Model = CGColorSpaceGetModel(ColorSpace);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (Model == kCGColorSpaceModelRGB)
  {
    Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v3), "CGColor"));
    v10 = Components[3];
    if (!a2)
      v10 = 1.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0 - *Components, 1.0 - Components[1], 1.0 - Components[2], v10);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (Model == kCGColorSpaceModelMonochrome)
  {
    v13 = 1.0;
    v14 = 1.0;
    objc_msgSend(v3, "getWhite:alpha:", &v14, &v13);
    v7 = 1.0;
    if (a2)
      v7 = v13;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0 - v14, v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v11 = (void *)v8;

    v6 = v11;
  }

  return v6;
}

id AXInvertColorForColor(void *a1)
{
  return _AXInvertColorForColor(a1, 0);
}

id AXInvertColorForColorPreservingAlpha(void *a1)
{
  return _AXInvertColorForColor(a1, 1);
}

AXUISettingsWelcomeController *AXUISettingsCreateWelcomeController(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  AXUISettingsWelcomeController *v7;
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
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  AXUISettingsWelcomeController *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  AXUISettingsWelcomeController *v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[5];

  v55[4] = *MEMORY[0x1E0C80C00];
  v51 = a1;
  v5 = a2;
  v6 = a3;
  v7 = -[AXUISettingsWelcomeController initWithTitle:detailText:icon:contentLayout:]([AXUISettingsWelcomeController alloc], "initWithTitle:detailText:icon:contentLayout:", v6, 0, 0, 3);

  v49 = v5;
  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsWelcomeController addChildViewController:](v7, "addChildViewController:", v5);
  -[AXUISettingsWelcomeController contentView](v7, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AXUISettingsWelcomeController contentView](v7, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v7;
  -[AXUISettingsWelcomeController view](v7, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  objc_msgSend(v8, "setFrame:");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v45;
  objc_msgSend(v8, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v14;
  objc_msgSend(v8, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v17;
  v50 = v8;
  objc_msgSend(v8, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v10;
  objc_msgSend(v10, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v21);

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v49, "ax_handlesOwnScrollingInSetup"))
  {
    objc_msgSend(v53, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      AXLogSettings();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        AXUISettingsCreateWelcomeController_cold_1((uint64_t)v52, v24);

    }
    objc_msgSend(v22, "heightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v26;
    objc_msgSend(v53, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v12;
    objc_msgSend(v12, "addObjectsFromArray:", v30);

    v32 = v52;
    -[AXUISettingsWelcomeController setScrollingDisabled:](v52, "setScrollingDisabled:", 1);
    v34 = v50;
    v33 = v51;
  }
  else
  {
    objc_msgSend(v49, "table");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v50;
    objc_msgSend(v50, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contentSize");
    objc_msgSend(v35, "constraintGreaterThanOrEqualToConstant:", v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v51;
    v31 = v12;
    if (v22 && v23)
    {
      objc_msgSend(v51, "ax_buddyObservedTableViews");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "ax_setBuddyObservedTableViews:", v38);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "ax_setBuddyDynamicHeightConstraints:", v39);

      }
      objc_msgSend(v51, "ax_buddyObservedTableViews");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addObject:", v22);

      objc_msgSend(v51, "ax_buddyDynamicHeightConstraints");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v23);

      NSStringFromSelector(sel_contentSize);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObserver:forKeyPath:options:context:", v51, v42, 0, 0);

      objc_msgSend(v22, "setScrollEnabled:", 0);
    }
    objc_msgSend(v12, "addObject:", v23);
    v32 = v52;
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v31);
  objc_msgSend(v49, "didMoveToParentViewController:", v32);

  return v32;
}

uint64_t AXUISettingsHandleWelcomeControllerTableViewUpdate(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;

  v5 = a1;
  v6 = a3;
  v7 = a2;
  NSStringFromSelector(sel_contentSize);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((_DWORD)v9)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = v6;
    objc_msgSend(v5, "ax_buddyObservedTableViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfObject:", v8);

    v9 = v12 != 0x7FFFFFFFFFFFFFFFLL;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v5, "ax_buddyDynamicHeightConstraints");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "contentSize");
      objc_msgSend(v14, "setConstant:", v15);

      v9 = 1;
    }
  }

LABEL_7:
  return v9;
}

void AXUISettingsCleanUpWelcomeControllerTableViewObservations(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v1, "ax_buddyObservedTableViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        NSStringFromSelector(sel_contentSize);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObserver:forKeyPath:", v1, v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void sub_1BD8A2794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD8A4808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD8A9140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id *a9, id *a10, id *location, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id a65;

  objc_destroyWeak(location);
  objc_destroyWeak(a9);
  objc_destroyWeak(a12);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a65);
  _Unwind_Resume(a1);
}

void sub_1BD8A9580(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void AXIteratePixelDataDeviceRGBWithBlock(void *a1, void *a2)
{
  void (**v3)(id, uint64_t, uint64_t, char *, double, double, double, double);
  CGImage *v4;
  unint64_t Width;
  unint64_t Height;
  CGColorSpace *DeviceRGB;
  char *v8;
  CGContext *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  double v18;
  char v19;
  CGRect v20;

  v3 = a2;
  v4 = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  Width = CGImageGetWidth(v4);
  Height = CGImageGetHeight(v4);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v8 = (char *)malloc_type_calloc(4 * Width * Height, 1uLL, 0x100004077774924uLL);
  v9 = CGBitmapContextCreate(v8, Width, Height, 8uLL, 4 * Width, DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  v20.size.width = (double)Width;
  v20.size.height = (double)Height;
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  CGContextDrawImage(v9, v20, v4);
  CGContextRelease(v9);
  v19 = 0;
  if (Height)
  {
    v13 = 0;
    v14 = v8 + 3;
    while (!Width)
    {
LABEL_7:
      ++v13;
      v14 += 4 * Width;
      if (v13 == Height)
        goto LABEL_8;
    }
    v15 = 0;
    v16 = v14;
    while (1)
    {
      LOBYTE(v10) = *v16;
      *(double *)&v17 = (double)v10;
      v18 = *(double *)&v17 / 255.0;
      LOBYTE(v17) = *(v16 - 3);
      LOBYTE(v11) = *(v16 - 2);
      LOBYTE(v12) = *(v16 - 1);
      v3[2](v3, v13, v15, &v19, (double)v17 / 255.0, (double)v11 / 255.0, (double)v12 / 255.0, v18);
      if (v19)
        break;
      v16 += 4;
      if (Width == ++v15)
        goto LABEL_7;
    }
  }
LABEL_8:
  free(v8);

}

id AXResizeImageWithSize(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  double v13;
  double v14;

  v5 = a1;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a2, a3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __AXResizeImageWithSize_block_invoke;
  v11[3] = &unk_1E76AB928;
  v12 = v5;
  v13 = a2;
  v14 = a3;
  v7 = v5;
  objc_msgSend(v6, "imageWithActions:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithRenderingMode:", objc_msgSend(v7, "renderingMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id _AXUIMakeTouch(double a1, double a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = 0;
    objc_msgSend(v6, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "convertPoint:fromView:", v7, a1, a2);
      v12 = v9;
      v13 = v7;
      AXPerformSafeBlock();
      v10 = (id)v15[5];

    }
    else
    {
      _AXLogWithFacility();
      v10 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1BD8AA870(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
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

id AXUIMakeTouchForTouchesBeganAtLocation(void *a1, double a2, double a3)
{
  return _AXUIMakeTouch(a2, a3, 0, a1);
}

id AXUIMakeTouchForTouchesMovedAtLocation(void *a1, double a2, double a3)
{
  return _AXUIMakeTouch(a2, a3, 1, a1);
}

id AXUIMakeTouchForTouchesEndedAtLocation(void *a1, double a2, double a3)
{
  return _AXUIMakeTouch(a2, a3, 3, a1);
}

id AXUIMakeTouchForTouchesCancelledAtLocation(void *a1, double a2, double a3)
{
  return _AXUIMakeTouch(a2, a3, 4, a1);
}

id AXUIMakeTouchForTouchesBegan(void *a1)
{
  id v1;
  double MidX;
  double MidY;
  void *v4;
  CGRect v6;
  CGRect v7;

  v1 = a1;
  objc_msgSend(v1, "bounds");
  MidX = CGRectGetMidX(v6);
  objc_msgSend(v1, "bounds");
  MidY = CGRectGetMidY(v7);
  _AXUIMakeTouch(MidX, MidY, 0, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AXUIMakeTouchForTouchesMoved(void *a1)
{
  id v1;
  double MidX;
  double MidY;
  void *v4;
  CGRect v6;
  CGRect v7;

  v1 = a1;
  objc_msgSend(v1, "bounds");
  MidX = CGRectGetMidX(v6);
  objc_msgSend(v1, "bounds");
  MidY = CGRectGetMidY(v7);
  _AXUIMakeTouch(MidX, MidY, 1, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AXUIMakeTouchForTouchesEnded(void *a1)
{
  id v1;
  double MidX;
  double MidY;
  void *v4;
  CGRect v6;
  CGRect v7;

  v1 = a1;
  objc_msgSend(v1, "bounds");
  MidX = CGRectGetMidX(v6);
  objc_msgSend(v1, "bounds");
  MidY = CGRectGetMidY(v7);
  _AXUIMakeTouch(MidX, MidY, 3, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AXUIMakeTouchForTouchesCancelled(void *a1)
{
  id v1;
  double MidX;
  double MidY;
  void *v4;
  CGRect v6;
  CGRect v7;

  v1 = a1;
  objc_msgSend(v1, "bounds");
  MidX = CGRectGetMidX(v6);
  objc_msgSend(v1, "bounds");
  MidY = CGRectGetMidY(v7);
  _AXUIMakeTouch(MidX, MidY, 4, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id getAXUIDisplayManagerClass()
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
  v0 = (void *)getAXUIDisplayManagerClass_softClass;
  v7 = getAXUIDisplayManagerClass_softClass;
  if (!getAXUIDisplayManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAXUIDisplayManagerClass_block_invoke;
    v3[3] = &unk_1E76AB358;
    v3[4] = &v4;
    __getAXUIDisplayManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD8AB58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXUIDisplayManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AccessibilityUIServiceLibraryCore_frameworkLibrary)
  {
    AccessibilityUIServiceLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccessibilityUIServiceLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXUIDisplayManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAXUIDisplayManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getAXUIDisplayManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BD8AD24C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

Class __getTTSPerVoiceSettingsViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!TextToSpeechVoiceBankingUILibraryCore_frameworkLibrary)
  {
    TextToSpeechVoiceBankingUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TextToSpeechVoiceBankingUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("TTSPerVoiceSettingsViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getTTSPerVoiceSettingsViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getTTSPerVoiceSettingsViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BD8AD774(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id getAVTAnimojiClass()
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
  v0 = (void *)getAVTAnimojiClass_softClass;
  v7 = getAVTAnimojiClass_softClass;
  if (!getAVTAnimojiClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAVTAnimojiClass_block_invoke;
    v3[3] = &unk_1E76AB358;
    v3[4] = &v4;
    __getAVTAnimojiClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD8AD82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVTPresetClass()
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
  v0 = (void *)getAVTPresetClass_softClass;
  v7 = getAVTPresetClass_softClass;
  if (!getAVTPresetClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAVTPresetClass_block_invoke;
    v3[3] = &unk_1E76AB358;
    v3[4] = &v4;
    __getAVTPresetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD8AD8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVTColorPresetClass()
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
  v0 = (void *)getAVTColorPresetClass_softClass;
  v7 = getAVTColorPresetClass_softClass;
  if (!getAVTColorPresetClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAVTColorPresetClass_block_invoke;
    v3[3] = &unk_1E76AB358;
    v3[4] = &v4;
    __getAVTColorPresetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD8AD99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVTMemojiClass()
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
  v0 = (void *)getAVTMemojiClass_softClass;
  v7 = getAVTMemojiClass_softClass;
  if (!getAVTMemojiClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAVTMemojiClass_block_invoke;
    v3[3] = &unk_1E76AB358;
    v3[4] = &v4;
    __getAVTMemojiClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD8ADDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVTAnimojiClass_block_invoke(uint64_t a1)
{
  AvatarKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTAnimoji");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTAnimojiClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAVTAnimojiClass_block_invoke_cold_1();
    AvatarKitLibrary();
  }
}

void AvatarKitLibrary()
{
  void *v0;

  if (!AvatarKitLibraryCore_frameworkLibrary)
    AvatarKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AvatarKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getAVTPresetClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AvatarKitLibrary();
  result = objc_getClass("AVTPreset");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTPresetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAVTPresetClass_block_invoke_cold_1();
    return (Class)__getAVTColorPresetClass_block_invoke(v3);
  }
  return result;
}

Class __getAVTColorPresetClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AvatarKitLibrary();
  result = objc_getClass("AVTColorPreset");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTColorPresetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAVTColorPresetClass_block_invoke_cold_1();
    return (Class)__getAVTAvatarPuppetRecordClass_block_invoke(v3);
  }
  return result;
}

Class __getAVTAvatarPuppetRecordClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AvatarUILibraryCore_frameworkLibrary)
  {
    AvatarUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AvatarUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AVTAvatarPuppetRecord");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAVTAvatarPuppetRecordClass_block_invoke_cold_1();
    free(v3);
  }
  getAVTAvatarPuppetRecordClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAVTMemojiClass_block_invoke(uint64_t a1)
{
  AXDynamicTypeImageView *v2;
  SEL v3;

  AvatarKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVTMemoji");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVTMemojiClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (AXDynamicTypeImageView *)__getAVTMemojiClass_block_invoke_cold_1();
    -[AXDynamicTypeImageView _commonInit](v2, v3);
  }
}

void sub_1BD8AEB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getIKListItemLockupElementClass()
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
  v0 = (void *)getIKListItemLockupElementClass_softClass;
  v7 = getIKListItemLockupElementClass_softClass;
  if (!getIKListItemLockupElementClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getIKListItemLockupElementClass_block_invoke;
    v3[3] = &unk_1E76AB358;
    v3[4] = &v4;
    __getIKListItemLockupElementClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD8AF568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8AF7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getIKListItemLockupElementClass_block_invoke(uint64_t a1)
{
  ITMLKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("IKListItemLockupElement");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIKListItemLockupElementClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getIKListItemLockupElementClass_block_invoke_cold_1();
    ITMLKitLibrary();
  }
}

void ITMLKitLibrary()
{
  void *v0;

  if (!ITMLKitLibraryCore_frameworkLibrary)
    ITMLKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ITMLKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getIKViewElementClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ITMLKitLibrary();
  result = objc_getClass("IKViewElement");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIKViewElementClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getIKViewElementClass_block_invoke_cold_1();
    return (Class)__getIKListTemplateClass_block_invoke(v3);
  }
  return result;
}

Class __getIKListTemplateClass_block_invoke(uint64_t a1)
{
  Class result;
  double v3;

  ITMLKitLibrary();
  result = objc_getClass("IKListTemplate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIKListTemplateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getIKListTemplateClass_block_invoke_cold_1();
    return (Class)AXUIIconImageWithBackgroundForImage(v3);
  }
  return result;
}

id AXUIIconImageWithBackgroundForImage(void *a1, void *a2, double a3, double a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  double v26;
  double v27;
  double v28;

  v7 = (void *)MEMORY[0x1E0DC3658];
  v8 = a2;
  v9 = a1;
  objc_msgSend(v7, "systemWhiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithTintColor:renderingMode:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0.0;
  objc_msgSend(MEMORY[0x1E0DC3870], "_iconVariantForUIApplicationIconFormat:scale:", 0, &v28);
  v12 = (const void *)LICreateDefaultIcon();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageWithTintColor:renderingMode:", v8, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(v12);
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");

  objc_msgSend(v16, "setScale:", v28);
  v17 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(v14, "size");
  v18 = (void *)objc_msgSend(v17, "initWithSize:format:", v16);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __AXUIIconImageWithBackgroundForImage_block_invoke;
  v23[3] = &unk_1E76ABBA0;
  v24 = v14;
  v25 = v11;
  v26 = a3;
  v27 = a4;
  v19 = v11;
  v20 = v14;
  objc_msgSend(v18, "imageWithActions:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E76AC698, CFSTR("Accessibility"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id AXLocalizedTimeSummary(int a1, double a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialectForCurrentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specificLanguageID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("ja"));

  v9 = 5;
  if (!v8)
    v9 = 1;
  if (a1)
    v10 = 3;
  else
    v10 = v9;
  objc_msgSend(v4, "setUnitsStyle:", v10);
  v11 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v11, "setSecond:", (uint64_t)a2);
  objc_msgSend(v11, "setNanosecond:", (uint64_t)((a2 - (double)objc_msgSend(v11, "second")) * 1000000000.0));
  objc_msgSend(v4, "stringFromDateComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a1)
  {
    v13 = a2 - (double)objc_msgSend(v11, "second");
    v14 = (void *)MEMORY[0x1E0CB3940];
    accessibilityLocalizedString(CFSTR("SUB_SECOND_ABBREVIATION"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 <= 0.0)
      AXFormatInteger();
    else
      AXFormatFloat();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v17;
  }

  return v12;
}

double AXUINormalizedSafeAreaInsetsForOrientation(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0DC5B80], "safeValueForKey:", CFSTR("defaultDisplayEdgeInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeAreaInsetsPortrait");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  v6 = v5;

  objc_msgSend(v3, "homeAffordanceOverlayAllowance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11)
    goto LABEL_2;
  if (a1 != 2)
  {
    if (a1 == 3)
    {
      if (v9 > 0.0)
        goto LABEL_11;
      v14 = v3;
      objc_msgSend(v14, "safeAreaInsetsLandscapeRight");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v14;
      if (v20)
      {
LABEL_18:
        objc_msgSend(v16, "safeAreaInsetsLandscapeRight");
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_24:
        v25 = (void *)v21;
        UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
        v6 = v26;

        goto LABEL_2;
      }
      objc_msgSend(v14, "safeAreaInsetsLandscapeLeft");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v14;
      if (!v24)
      {
LABEL_23:
        objc_msgSend(v16, "safeAreaInsetsPortrait");
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    else
    {
      if (a1 != 4)
        goto LABEL_2;
      if (v9 > 0.0)
      {
LABEL_11:
        UIEdgeInsetsRotate();
        v6 = v13;
        goto LABEL_2;
      }
      v14 = v3;
      objc_msgSend(v14, "safeAreaInsetsLandscapeLeft");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v14;
      if (!v15)
      {
        objc_msgSend(v14, "safeAreaInsetsLandscapeRight");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v14;
        if (!v17)
          goto LABEL_23;
        goto LABEL_18;
      }
    }
    objc_msgSend(v16, "safeAreaInsetsLandscapeLeft");
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (v9 > 0.0)
    goto LABEL_11;
  v18 = v3;
  objc_msgSend(v18, "safeAreaInsetsPortraitUpsideDown");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v18, "safeAreaInsetsPortraitUpsideDown");
  else
    objc_msgSend(v18, "safeAreaInsetsPortrait");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  v6 = v23;

LABEL_2:
  return v6;
}

double AXUIConvertPointFromScreenToContextSpace(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a1;
  objc_opt_class();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_transformLayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertPoint:toLayer:", 0, a2, a3);
  v9 = v8;

  return v9;
}

double AXUIConvertRectFromScreenToContextSpace(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v9 = a1;
  objc_opt_class();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("_transformLayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "convertRect:toLayer:", 0, a2, a3, a4, a5);
  v13 = v12;

  return v13;
}

double AXUIConvertPointFromContextToScreenSpace(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a1;
  objc_opt_class();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_transformLayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertPoint:fromLayer:", 0, a2, a3);
  v9 = v8;

  return v9;
}

double AXUIConvertRectFromContextToScreenSpace(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v9 = a1;
  objc_opt_class();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("_transformLayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "convertRect:fromLayer:", 0, a2, a3, a4, a5);
  v13 = v12;

  return v13;
}

id AXUIApplicationWindows()
{
  void *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  v1 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "connectedScenes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "windows");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v0, "axSafelyAddObjectsFromArray:", v8);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  if (!objc_msgSend(v0, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*v1, "_accessibilityAllWindowsOnlyVisibleWindows:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "axSafelyAddObjectsFromArray:", v9);

  }
  return v0;
}

void sub_1BD8B21B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

uint64_t HardwareKeyboardAvailabilityChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateKeyboardHardwareState");
}

id getSUUIItemOfferButtonClass()
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
  v0 = (void *)getSUUIItemOfferButtonClass_softClass;
  v7 = getSUUIItemOfferButtonClass_softClass;
  if (!getSUUIItemOfferButtonClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSUUIItemOfferButtonClass_block_invoke;
    v3[3] = &unk_1E76AB358;
    v3[4] = &v4;
    __getSUUIItemOfferButtonClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BD8BA278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8BBF2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

Class __getSUUIItemOfferButtonClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MobileStoreUILibraryCore_frameworkLibrary)
  {
    MobileStoreUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MobileStoreUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SUUIItemOfferButton");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSUUIItemOfferButtonClass_block_invoke_cold_1();
    free(v3);
  }
  getSUUIItemOfferButtonClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BD8BCF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _accessibilityiTunesSettings(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performSelector:withObject:afterDelay:", sel_reloadSpecifiers, 0, 0.5);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1BD8C3294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXUICreateFloatingShadowImageWithRadius(void *a1, double a2)
{
  double v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  CGContext *CurrentContext;
  id v10;
  CGColor *v11;
  void *v12;
  void *v13;
  void *v14;
  CGSize v16;

  v3 = a2 + 10.0;
  v4 = (void *)MEMORY[0x1E0DC3BF8];
  v5 = a1;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;
  v16.width = v3 + v3;
  v16.height = v3 + v3;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v8);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v10 = objc_retainAutorelease(v5);
  v11 = (CGColor *)objc_msgSend(v10, "CGColor");
  CGContextSetShadowWithColor(CurrentContext, *MEMORY[0x1E0C9D820], 10.0, v11);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 10.0, 10.0, a2 + a2, a2 + a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "set");

  objc_msgSend(v12, "fill");
  CGContextRestoreGState(CurrentContext);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceOut);
  objc_msgSend(v12, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resizableImageWithCapInsets:", v3, v3, v3, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  return v14;
}

void sub_1BD8C6550(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

BOOL AXGestureRecorderTypeIsForRealTimeGesture(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

void sub_1BD8C8E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXNamesForDrags(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  AXUILocalizedStringForKey(CFSTR("UNNAMED_DRAG"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXUILocalizedStringForKey(CFSTR("UNNAMED_DRAG_ORDINAL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AXNamesForDragAndDropItems(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id _AXNamesForDragAndDropItems(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v30;
  uint64_t v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v32 = a2;
  v30 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v39;
    v11 = (uint64_t *)MEMORY[0x1E0CF3FA0];
    v12 = *MEMORY[0x1E0CF3FA0];
    v13 = *MEMORY[0x1E0CF3FB8];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v13);

        v9 += v16;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v8);
  }
  else
  {
    v11 = (uint64_t *)MEMORY[0x1E0CF3FA0];
    v9 = 0;
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  v18 = (void *)v31;
  if (v17)
  {
    v19 = v17;
    v20 = 0;
    v21 = *(_QWORD *)v35;
    v22 = *v11;
    v23 = *MEMORY[0x1E0CF3FB8];
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "isEqualToString:", v23))
        {
          ++v20;
          if (v9 == 1)
          {
            v26 = v32;
          }
          else
          {
            v27 = (void *)MEMORY[0x1E0CB3940];
            AXFormatInteger();
            v28 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "localizedStringWithFormat:", v30, v28);
            v26 = (id)objc_claimAutoreleasedReturnValue();

            v25 = (void *)v28;
            v18 = (void *)v31;
          }

          v25 = v26;
        }
        objc_msgSend(v18, "addObject:", v25);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v19);
  }

  return v18;
}

id AXNamesForDrops(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  AXUILocalizedStringForKey(CFSTR("UNNAMED_DROP"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXUILocalizedStringForKey(CFSTR("UNNAMED_DROP_ORDINAL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AXNamesForDragAndDropItems(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AXUIContentSizeCategoryMin(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  char v6;
  void *v7;
  char v8;
  NSComparisonResult v9;

  v3 = a1;
  v4 = a2;
  v5 = (id)*MEMORY[0x1E0DC4938];
  v6 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0DC4938]);
  v7 = v4;
  if ((v6 & 1) != 0)
    goto LABEL_6;
  v8 = objc_msgSend(v4, "isEqual:", v5);
  v7 = v3;
  if ((v8 & 1) != 0)
    goto LABEL_6;
  v9 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v3, (UIContentSizeCategory)v4);
  v7 = v3;
  if ((unint64_t)(v9 + 1) < 2)
    goto LABEL_6;
  if (v9 == NSOrderedDescending)
  {
    v7 = v4;
LABEL_6:
    v5 = v7;
  }

  return v5;
}

id AXUIContentSizeCategoryMax(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  char v6;
  void *v7;
  char v8;
  NSComparisonResult v9;

  v3 = a1;
  v4 = a2;
  v5 = (id)*MEMORY[0x1E0DC4938];
  v6 = objc_msgSend(v3, "isEqual:", *MEMORY[0x1E0DC4938]);
  v7 = v4;
  if ((v6 & 1) != 0
    || (v8 = objc_msgSend(v4, "isEqual:", v5), v7 = v3, (v8 & 1) != 0)
    || (v9 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v3, (UIContentSizeCategory)v4),
        v7 = v4,
        v9 == NSOrderedAscending)
    || (v7 = v3, (unint64_t)v9 <= NSOrderedDescending))
  {
    v5 = v7;
  }

  return v5;
}

void QSInstallSharedSafeCategoriesIfNeeded()
{
  if (QSInstallSharedSafeCategoriesIfNeeded_onceToken != -1)
    dispatch_once(&QSInstallSharedSafeCategoriesIfNeeded_onceToken, &__block_literal_global_12);
}

void QSUnionRectsWithRect(void *a1, CGFloat a2, double a3, CGFloat a4, CGFloat a5)
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  id v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = v9;
  if (v9)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        objc_msgSend(v16, "rectValue", (_QWORD)v25);
        if (vabdd_f64(a3, v17) < 0.001)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v13)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v18 = v16;
      v19 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v18, "rectValue");
      v33.origin.x = v20;
      v33.origin.y = v21;
      v33.size.width = v22;
      v33.size.height = v23;
      v31.origin.x = a2;
      v31.origin.y = a3;
      v31.size.width = a4;
      v31.size.height = a5;
      v32 = CGRectUnion(v31, v33);
      objc_msgSend(v19, "valueWithRect:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        goto LABEL_13;
      objc_msgSend(v11, "replaceObjectAtIndex:withObject:", objc_msgSend(v11, "indexOfObject:", v18), v24);
    }
    else
    {
LABEL_10:

      v18 = 0;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", a2, a3, a4, a5, (_QWORD)v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v24);
    }

  }
}

void sub_1BD8D379C(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  if (a2 == 1)
  {
    v4 = objc_begin_catch(exception_object);
    objc_msgSend(*(id *)(v3 + 2752), "_accessibilitySetUseQuickSpeakPasteBoard:", v2);

    objc_end_catch();
    JUMPOUT(0x1BD8D3748);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BD8D4568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1BD8D471C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getIKViewElementClass_block_invoke_0(uint64_t a1)
{
  ITMLKitLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("IKViewElement");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIKViewElementClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getIKViewElementClass_block_invoke_cold_1();
    ITMLKitLibrary_0();
  }
}

void ITMLKitLibrary_0()
{
  void *v0;

  if (!ITMLKitLibraryCore_frameworkLibrary_0)
    ITMLKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!ITMLKitLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getIKImageElementClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ITMLKitLibrary_0();
  result = objc_getClass("IKImageElement");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIKImageElementClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getIKImageElementClass_block_invoke_cold_1();
    return (Class)__getIKTextElementClass_block_invoke(v3);
  }
  return result;
}

Class __getIKTextElementClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ITMLKitLibrary_0();
  result = objc_getClass("IKTextElement");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIKTextElementClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getIKTextElementClass_block_invoke_cold_1();
    return (Class)AXUIToggleIncomingCall(v3);
  }
  return result;
}

uint64_t AXUIToggleIncomingCall()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  char v5;

  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v5 = 0;
  AXPerformBlockSynchronouslyOnMainThread();
  v0 = *((unsigned __int8 *)v3 + 24);
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_1BD8D4BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AXSortedDialectsForDisplay(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(a1, "dialects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __AXSortedDialectsForDisplay_block_invoke;
  v8[3] = &unk_1E76ABFB8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void AXAddVoiceFootprintsToArrayForDialect(void *a1, void *a2, void *a3, int a4, int a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v9 = (void *)MEMORY[0x1E0DBEF08];
  v10 = a3;
  v11 = a2;
  v12 = a1;
  objc_msgSend(v9, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resourcesWithType:subType:", 1, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  AXAddVoiceFootprintsToArrayForDialectWithResources(v12, v11, v14, v10, a4, a5);
}

void AXAddVoiceFootprintsToArrayForDialectWithResources(void *a1, void *a2, void *a3, void *a4, int a5, int a6)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t j;
  uint64_t v71;
  AXSettingsVoiceResourceFootprintSpecifierData *v72;
  void *v73;
  void *v74;
  char v75;
  void *v76;
  NSObject *v77;
  os_log_type_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  void *v89;
  int v90;
  void *v91;
  uint64_t v92;
  void *v94;
  id v95;
  id obj;
  uint64_t v98;
  uint64_t v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[5];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  _BYTE v131[128];
  void *v132;
  uint8_t buf[4];
  void *v134;
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v100 = a1;
  v108 = a2;
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v137, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(id *)v127;
    v101 = *(id *)v127;
    do
    {
      v15 = 0;
      v103 = v13;
      do
      {
        if (*(id *)v127 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v15);
        objc_msgSend(v16, "voiceId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v11, "containsObject:", v17);

        if ((v18 & 1) == 0)
        {
          objc_msgSend(v16, "primaryLanguage");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "specificLanguageID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqualToString:", v20);

          if ((v21 & 1) != 0)
            goto LABEL_26;
          v124 = 0u;
          v125 = 0u;
          v122 = 0u;
          v123 = 0u;
          objc_msgSend(v108, "langMap");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "alternateLanguageIDs");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v122, v136, 16);
          if (!v24)
          {

            goto LABEL_7;
          }
          v25 = v24;
          v106 = v15;
          v26 = 0;
          v27 = *(_QWORD *)v123;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v123 != v27)
                objc_enumerationMutation(v23);
              v29 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i);
              objc_msgSend(v16, "primaryLanguage");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v30, "isEqualToString:", v29))
              {
                objc_msgSend(v16, "voiceId");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v26 |= objc_msgSend(v11, "containsObject:", v31) ^ 1;

              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v122, v136, 16);
          }
          while (v25);

          v14 = v101;
          v13 = v103;
          v15 = v106;
          if ((v26 & 1) != 0)
          {
LABEL_26:
            if ((objc_msgSend(v16, "type") != 3 || objc_msgSend(v16, "subtype") != 6 || a5)
              && (objc_msgSend(v16, "type") != 3 || objc_msgSend(v16, "subtype") != 7 || a6)
              && (objc_msgSend(v16, "shouldFilterResourceFromUI") & 1) == 0)
            {
              objc_msgSend(v16, "voiceId");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v32);

              objc_msgSend(v94, "addObject:", v16);
            }
          }
        }
LABEL_7:
        ++v15;
      }
      while (v15 != v13);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v126, v137, 16);
      v13 = v33;
    }
    while (v33);
  }

  objc_msgSend(v94, "sortUsingComparator:", &__block_literal_global_14);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v102 = v94;
  v35 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v118, v135, 16);
  v107 = v34;
  if (!v35)
    goto LABEL_75;
  v36 = v35;
  v104 = *(_QWORD *)v119;
  do
  {
    v37 = 0;
    v98 = v36;
    do
    {
      if (*(_QWORD *)v119 != v104)
        objc_enumerationMutation(v102);
      v38 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v37);
      v39 = objc_msgSend(v38, "type");
      if (v39 != 3)
        goto LABEL_42;
      if (objc_msgSend(v38, "subtype") == 7)
        goto LABEL_42;
      v117[0] = MEMORY[0x1E0C809B0];
      v117[1] = 3221225472;
      v117[2] = __AXAddVoiceFootprintsToArrayForDialectWithResources_block_invoke_2;
      v117[3] = &unk_1E76AC000;
      v117[4] = v38;
      objc_msgSend(v102, "ax_filteredArrayUsingBlock:", v117);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

      if (!v41)
      {
LABEL_42:
        if (objc_msgSend(v38, "type") == 10 && objc_msgSend(v38, "footprint") == 4)
        {
          objc_msgSend(v38, "name");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "isEqualToString:", CFSTR("Yu-shu")))
          {

          }
          else
          {
            objc_msgSend(v38, "name");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("Nicky"));

            if (!v45)
              goto LABEL_70;
          }
        }
        objc_msgSend(v38, "localizedName");
        v46 = objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          v47 = (void *)v46;
          if (objc_msgSend(v38, "footprint") == 3
            && objc_msgSend(v38, "type") == 4
            && (objc_msgSend(v38, "speechVoice"),
                v48 = (void *)objc_claimAutoreleasedReturnValue(),
                v49 = objc_msgSend(v48, "isDefault"),
                v48,
                (v49 & 1) == 0))
          {
            objc_msgSend(v38, "voiceId");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "stringByReplacingOccurrencesOfString:withString:", CFSTR("compact"), CFSTR("super-compact"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "resourceWithVoiceId:", v64);
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v66)
            {
LABEL_54:
              objc_msgSend(v38, "speechVoice");
              v51 = objc_claimAutoreleasedReturnValue();
              -[NSObject synthesisProviderVoice](v51, "synthesisProviderVoice");
              v54 = (void *)objc_claimAutoreleasedReturnValue();

              if (v54)
              {
                -[NSObject synthesisProviderVoice](v51, "synthesisProviderVoice");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "groupName");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = v56;
                if (v56)
                {
                  v58 = v56;
                }
                else
                {
                  AXLocalizedString();
                  v58 = (id)objc_claimAutoreleasedReturnValue();
                }
                v59 = v58;

                v47 = v59;
                v34 = v107;
              }
              if (v39 == 3)
              {
                AXLocalizedString();
                v60 = objc_claimAutoreleasedReturnValue();

                v47 = (void *)v60;
              }
              objc_msgSend(v34, "objectForKey:", v47);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = (void *)objc_msgSend(v61, "mutableCopy");

              if (v53)
              {
                objc_msgSend(v53, "addObject:", v38);
                objc_msgSend(v34, "setObject:forKey:", v53, v47);
              }
              else
              {
                v132 = v38;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v132, 1);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setObject:forKey:", v62, v47);

              }
              goto LABEL_67;
            }
            v36 = v98;
          }
          else
          {
            if (objc_msgSend(v38, "footprint") != 2)
              goto LABEL_54;
            objc_msgSend(v38, "voiceId");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "stringByReplacingOccurrencesOfString:withString:", CFSTR("super-compact"), CFSTR("compact"));
            v51 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "resourceWithVoiceId:", v51);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v53 || (objc_msgSend(v53, "isInstalled") & 1) == 0)
            {

              goto LABEL_54;
            }
LABEL_67:

            v36 = v98;
LABEL_68:

          }
          goto LABEL_70;
        }
        AXLogSpeechAssetDownload();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v134 = v38;
          _os_log_error_impl(&dword_1BD892000, v51, OS_LOG_TYPE_ERROR, "This resource had no name!: %{public}@", buf, 0xCu);
        }
        v47 = 0;
        goto LABEL_68;
      }
      AXLogSpeechAssetDownload();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BD892000, v42, OS_LOG_TYPE_INFO, "Excluding siri voice because a higher priority siri voice is available (gryphon -> neural -> neuralAX)", buf, 2u);
      }

LABEL_70:
      ++v37;
    }
    while (v36 != v37);
    v67 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v118, v135, 16);
    v36 = v67;
  }
  while (v67);
LABEL_75:

  objc_msgSend(v34, "allKeys");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "sortedArrayUsingComparator:", &__block_literal_global_233_0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v95 = v69;
  v105 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v113, v131, 16);
  if (v105)
  {
    v99 = *(_QWORD *)v114;
    do
    {
      for (j = 0; j != v105; ++j)
      {
        if (*(_QWORD *)v114 != v99)
          objc_enumerationMutation(v95);
        v71 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * j);
        v72 = objc_alloc_init(AXSettingsVoiceResourceFootprintSpecifierData);
        -[AXSettingsVoiceResourceFootprintSpecifierData setName:](v72, "setName:", v71);
        -[AXSettingsVoiceResourceFootprintSpecifierData setDialect:](v72, "setDialect:", v108);
        objc_msgSend(v34, "objectForKey:", v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSettingsVoiceResourceFootprintSpecifierData setResources:](v72, "setResources:", v73);
        objc_msgSend(MEMORY[0x1E0CF39E8], "sharedInstance");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "ignoreLogging");

        if ((v75 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CF39E8], "identifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v77 = objc_claimAutoreleasedReturnValue();

          v78 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v77, v78))
          {
            AXColorizeFormatLog();
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = v73;
            v92 = v71;
            _AXStringForArgs();
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, v78))
            {
              *(_DWORD *)buf = 138543362;
              v134 = v80;
              _os_log_impl(&dword_1BD892000, v77, v78, "%{public}@", buf, 0xCu);
            }

            v34 = v107;
          }

        }
        if (_AXSInUnitTestMode() && !objc_msgSend(v73, "count"))
        {
          v81 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No voices? %@\n languageResources: %@\n resources:%@"), v34, v102, v73);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "exceptionWithName:reason:userInfo:", CFSTR("SpeechTest"), v82, 0);
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v83, "raise");
        }
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        v84 = v73;
        v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v109, v130, 16);
        if (v85)
        {
          v86 = v85;
          v87 = *(_QWORD *)v110;
          do
          {
            for (k = 0; k != v86; ++k)
            {
              if (*(_QWORD *)v110 != v87)
                objc_enumerationMutation(v84);
              objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * k), "voiceId", v91, v92);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = objc_msgSend(v10, "isEqualToString:", v89);

              if (v90)
                -[AXSettingsVoiceResourceFootprintSpecifierData setIsSelected:](v72, "setIsSelected:", 1);
            }
            v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v109, v130, 16);
          }
          while (v86);
        }

        objc_msgSend(v100, "addObject:", v72);
        v34 = v107;
      }
      v105 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v113, v131, 16);
    }
    while (v105);
  }

}

id AXSortTTSAXResourcesForSiriVoicesIfNeeded(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if (v3 == 3)
  {
    objc_msgSend(v1, "sortedArrayUsingComparator:", &__block_literal_global_243);
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v4;
  }
  return v1;
}

id AXLocalizedVoiceVariantNameForResource(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "type") != 3
    || (objc_msgSend(v1, "voiceId"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        AXSiriDisplayNameForIdentifier(),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        !v3))
  {
    objc_msgSend(v1, "localizedNameWithFootprint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t AXSortedVoiceVariantsForDisplay(void *a1, const char *a2)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_244_0);
}

id AXLocalizedTileForResourceDownloadSizeRequired(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)objc_msgSend(a1, "assetSize");
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    AXUILocalizedStringForKey(CFSTR("DOWNLOADED_VOICE_REQUIRES"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", v3, v4);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

id AXLocalizedTileForResourceOnDiskSizeUsed(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = (void *)objc_msgSend(v1, "assetSize");
  if (v2
    || (objc_msgSend(v1, "axAsset"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "computedOnDiskSize"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v2 = (void *)objc_msgSend(v4, "unsignedLongLongValue"),
        v4,
        v3,
        v2))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    AXUILocalizedStringForKey(CFSTR("DOWNLOADED_VOICE_USING"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id AXLanguagesAvailableForPronuncationEditor()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF4E80], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x1E0DBEF08], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcesWithType:subType:", 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "primaryLanguage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        AXCLanguageConvertToCanonicalForm();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v0, "containsObject:", v9) & 1) == 0)
        {
          objc_msgSend(v1, "dialectForLanguageID:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "languageNameAndLocaleInCurrentLocale");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11)
            v13 = v9 == 0;
          else
            v13 = 1;
          if (!v13)
          {
            v21[0] = v9;
            v21[1] = v11;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v14);

            objc_msgSend(v0, "addObject:", v9);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_253);
  return v16;
}

void _AXCheckForCatalogUpdate()
{
  if (_AXCheckForCatalogUpdate_onceToken != -1)
    dispatch_once(&_AXCheckForCatalogUpdate_onceToken, &__block_literal_global_255);
}

void sub_1BD8D7E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD8D83F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsVoiceAssetManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AXSpeechAssetServicesLibraryCore_frameworkLibrary)
  {
    AXSpeechAssetServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AXSpeechAssetServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXSettingsVoiceAssetManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getAXSettingsVoiceAssetManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getAXSettingsVoiceAssetManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1BD8D92A8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_1BD8DB018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _AXUISettingsAccessibilityBundle()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  AXSystemRootDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("/System/Library/PreferenceBundles/AccessibilitySettings.bundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXUILocalizedStringForKey(void *a1)
{
  return AXUILocalizedStringForKeyWithTable(a1, CFSTR("AXUILocalizedStrings"));
}

id AXUILocalizedStringForKeyWithTable(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = (void *)AXUILocalizedStringForKeyWithTable_Bundle;
  if (!AXUILocalizedStringForKeyWithTable_Bundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityUIUtilities"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)AXUILocalizedStringForKeyWithTable_Bundle;
    AXUILocalizedStringForKeyWithTable_Bundle = v6;

    v5 = (void *)AXUILocalizedStringForKeyWithTable_Bundle;
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v3, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id AXUILocalizedTitleForZoomLensEffect(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3898]))
  {
    v2 = CFSTR("ZOOM_LENS_EFFECT_NONE");
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3870]))
  {
    v2 = CFSTR("ZOOM_LENS_EFFECT_BLACK_AND_WHITE");
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3890]))
  {
    v2 = CFSTR("ZOOM_LENS_EFFECT_LOW_LIGHT");
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3878]))
  {
    v2 = CFSTR("ZOOM_LENS_EFFECT_BLACK_AND_WHITE_INVERTED");
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3888]))
  {
    v2 = CFSTR("ZOOM_LENS_EFFECT_INVERTED");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3880]))
    {
      _AXAssert();
      v3 = 0;
      goto LABEL_14;
    }
    v2 = CFSTR("ZOOM_LENS_EFFECT_HUE_ADJUST");
  }
  AXUILocalizedStringForKeyWithTable(v2, CFSTR("AXUILocalizedStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v3;
}

id AXUILocalizedTitleForZoomLensMode(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF38A0]))
  {
    v2 = CFSTR("ZOOM_LENS_MODE_FULLSCREEN");
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF38A8]))
  {
    v2 = CFSTR("ZOOM_LENS_MODE_WINDOW");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF38B0]))
    {
      _AXAssert();
      v3 = 0;
      goto LABEL_8;
    }
    v2 = CFSTR("ZOOM_LENS_MODE_DOCKED");
  }
  AXUILocalizedStringForKeyWithTable(v2, CFSTR("AXUILocalizedStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v3;
}

id AXUILocalizedTitleForDockPosition(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3868]))
  {
    v2 = CFSTR("DOCK_POSITION_TOP");
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3858]))
  {
    v2 = CFSTR("DOCK_POSITION_LEFT");
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3860]))
  {
    v2 = CFSTR("DOCK_POSITION_RIGHT");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3850]))
    {
      _AXAssert();
      v3 = 0;
      goto LABEL_10;
    }
    v2 = CFSTR("DOCK_POSITION_BOTTOM");
  }
  AXUILocalizedStringForKeyWithTable(v2, CFSTR("AXUILocalizedStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v3;
}

id AXAssistiveTouchBundle()
{
  if (AXAssistiveTouchBundle_onceToken != -1)
    dispatch_once(&AXAssistiveTouchBundle_onceToken, &__block_literal_global_15);
  return (id)AXAssistiveTouchBundle_ASTBundle;
}

id AXUIAssistiveTouchStringForName(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  v3 = a1;
  if (AXUIAssistiveTouchStringForName_onceToken != -1)
    dispatch_once(&AXUIAssistiveTouchStringForName_onceToken, &__block_literal_global_223);
  if (!objc_msgSend(v3, "hasPrefix:", CFSTR("CustomGesture-")))
  {
    v7 = *MEMORY[0x1E0CF4990];
    if (objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0CF4990]))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v3, "rangeOfString:", v8);
      objc_msgSend(v3, "substringFromIndex:", v9 + v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CF4EA0], "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "shortcutForIdentifier:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shortcutName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
        goto LABEL_40;
      }
    }
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF4B30]))
    {
      _AXUISettingsAccessibilityBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FORCE_TOUCH"), 0, CFSTR("Accessibility"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_40;
    }
    if (a2)
    {
      objc_msgSend((id)AXUIAssistiveTouchStringForName_ASTMapping, "objectForKeyedSubscript:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("_FULL_WIDTH"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (AXDeviceHasStaccato()
        && objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF4A10]))
      {
        AXAssistiveTouchBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = CFSTR("LocalizedStrings-Staccato");
      }
      else if (AXDeviceSupportsCameraButton()
             && ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF4A50]) & 1) != 0
              || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF4A60]) & 1) != 0
              || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF4A58])))
      {
        AXAssistiveTouchBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = CFSTR("LocalizedStrings-D94");
      }
      else
      {
        AXAssistiveTouchBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = CFSTR("LocalizedStrings");
      }
      objc_msgSend(v16, "localizedStringForKey:value:table:", v11, v11, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 && !objc_msgSend(v6, "isEqualToString:", v11))
        goto LABEL_39;

    }
    objc_msgSend((id)AXUIAssistiveTouchStringForName_ASTMapping, "objectForKeyedSubscript:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (AXDeviceHasStaccato() && objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF4A10]))
    {
      AXAssistiveTouchBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("LocalizedStrings-Staccato");
    }
    else if (AXDeviceSupportsCameraButton()
           && ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF4A50]) & 1) != 0
            || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF4A60]) & 1) != 0
            || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CF4A58])))
    {
      AXAssistiveTouchBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("LocalizedStrings-D94");
    }
    else
    {
      AXAssistiveTouchBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("LocalizedStrings");
    }
    objc_msgSend(v19, "localizedStringForKey:value:table:", v11, v11, v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isEqualToString:", v6))
    {
      objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "laserEnabled");

      if (v23)
      {
        AXAssistiveTouchBundle();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", v11, v11, CFSTR("LocalizedStrings-hello"));
        v25 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v25;
      }
      if (objc_msgSend(v11, "isEqualToString:", v6))
      {
        if (a2)
        {
          objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("_FULL_WIDTH"));
          v26 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v26;
        }
        AXAssistiveTouchBundle();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringForKey:value:table:", v11, v11, CFSTR("LocalizedStrings-DetectionMode"));
        v28 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v28;
      }
    }
    goto LABEL_39;
  }
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("CustomGesture-"));
  objc_msgSend(v3, "substringFromIndex:", v4 + v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v6;
}

id AXUIAssistiveTouchDeviceImageNameForImageName(void *a1)
{
  id v1;
  void *v2;
  const __CFString *v3;
  int IsPad;
  void *v5;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0CB3940];
  if ((AXDeviceHasJindo() & 1) != 0)
  {
    v3 = CFSTR("_DI");
  }
  else if ((AXDeviceHasHomeButton() & 1) != 0)
  {
    v3 = &stru_1E76AC698;
  }
  else
  {
    IsPad = AXDeviceIsPad();
    v3 = CFSTR("_NHB");
    if (IsPad)
      v3 = CFSTR("_NHB_IPAD");
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), v1, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t AXUIAssistiveTouchIconRequiresRTLFlipping(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = AXUIAssistiveTouchIconRequiresRTLFlipping_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&AXUIAssistiveTouchIconRequiresRTLFlipping_onceToken, &__block_literal_global_448);
  v3 = objc_msgSend((id)AXUIAssistiveTouchIconRequiresRTLFlipping_ImageNamesToFlip, "containsObject:", v2);

  return v3;
}

id AXUIAssistiveTouchImageNameForName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  if (AXUIAssistiveTouchImageNameForName_onceToken[0] != -1)
    dispatch_once(AXUIAssistiveTouchImageNameForName_onceToken, &__block_literal_global_484);
  objc_msgSend((id)AXUIAssistiveTouchImageNameForName_ASTMapping, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("CustomGesture-")))
  {
    objc_msgSend((id)AXUIAssistiveTouchImageNameForName_ASTMapping, "objectForKeyedSubscript:", *MEMORY[0x1E0CF4AA0]);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  if (objc_msgSend(v1, "hasPrefix:", *MEMORY[0x1E0CF4990]))
  {
    objc_msgSend((id)AXUIAssistiveTouchImageNameForName_ASTMapping, "objectForKeyedSubscript:", *MEMORY[0x1E0CF4C78]);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }

  return v2;
}

id AXUIAssistiveTouchImageForName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v1 = a1;
  AXUIAssistiveTouchImageNameForName(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && AXDeviceIsPhone()
    && (objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "_referenceBounds"),
        v5 = v4,
        v3,
        v5 > 480.0))
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v2, "stringByAppendingString:", CFSTR("-tall"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXAssistiveTouchBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_deviceSpecificImageNamed:inBundle:", v7, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("system-image-")) & 1) != 0
    || objc_msgSend(v1, "hasPrefix:", CFSTR("system-image-")))
  {
    if (v2)
      v10 = v2;
    else
      v10 = v1;
    v11 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("system-image-"), &stru_1E76AC698);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 30.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemImageNamed:withConfiguration:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v14;
  }
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("internal-system-image-")) & 1) != 0
    || objc_msgSend(v1, "hasPrefix:", CFSTR("internal-system-image-")))
  {
    if (v2)
      v15 = v2;
    else
      v15 = v1;
    v16 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("internal-system-image-"), &stru_1E76AC698);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 30.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_systemImageNamed:withConfiguration:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v19;
  }
  if (!v9)
  {
    v20 = AXUIAssistiveTouchRequiresSystemImageForName(v1);
    v21 = (void *)MEMORY[0x1E0DC3870];
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      AXAssistiveTouchBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_deviceSpecificImageNamed:inBundle:", v2, v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v22, "imageByPreparingThumbnailOfSize:", 60.0, 60.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v9 = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 30.0);
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageByApplyingSymbolConfiguration:", v26);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v22 = (void *)v26;
    }

  }
  return v9;
}

uint64_t AXUIAssistiveTouchRequiresSystemImageForName(void *a1)
{
  id v1;
  int v2;
  uint64_t v3;

  v1 = a1;
  if (AXDeviceHasStaccato())
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF4A10]);
  else
    v2 = 0;
  if (AXDeviceSupportsOnDeviceEyeTracking())
  {
    if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF4BC8]) & 1) != 0)
      v2 = 1;
    else
      v2 |= objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF4A40]);
  }
  v3 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF4CD8]) | v2;

  return v3;
}

BOOL AXPreferredContentSizeCategoryIsAccessibilityCategory()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC48D8]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC48D0]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC48C8]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC48C0]) & 1) != 0
    || objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DC48B8]);

  return v2;
}

uint64_t AXUISettingsSpeakingRateSlowImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("tortoise.fill"));
}

uint64_t AXUISettingsSpeakingRateFastImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("hare.fill"));
}

uint64_t AXUIZoomControllerColor(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;

  switch(a1)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  v2 = objc_retainAutorelease(v1);
  v3 = objc_msgSend(v2, "CGColor");

  return v3;
}

double AXUIRectForZoomFocusChangeNotification(void *a1)
{
  id v1;
  void *v2;
  NSString *v3;
  double x;
  double y;
  double width;
  double height;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSRect v17;

  v1 = a1;
  objc_msgSend(v1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("frame"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v17 = NSRectFromString(v3);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;

  objc_msgSend(v1, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "zoomShouldFollowFocus");

    if (v11)
    {
      objc_msgSend(v9, "convertRect:toWindow:", 0, x, y, width, height);
      x = AXUIConvertRectFromScreenToContextSpace(v9, v12, v13, v14, v15);
    }
  }

  return x;
}

uint64_t AXSpeakerMaxImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("speaker.wave.2"));
}

uint64_t AXSpeakerMuteImage()
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("speaker"));
}

id AXAppNameForBundleId(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF3900]))
  {
    v2 = CFSTR("HOME_SCREEN");
LABEL_7:
    AXUILocalizedStringForKeyWithTable(v2, CFSTR("AXUILocalizedStrings"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF38E0]))
  {
    v2 = CFSTR("LIVE_TRANSCRIPTION_TITLE");
    goto LABEL_7;
  }
  if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CF38F0]))
  {
    v2 = CFSTR("WALLET_TITLE");
    goto LABEL_7;
  }
  v8 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v1, 0, &v8);
  v6 = v8;
  if (v6)
  {
    AXLogSettings();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      AXAppNameForBundleId_cold_1(v6, v7);

  }
  objc_msgSend(v5, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v3;
}

float AXTextSizePercentage(void *a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0DC3E88];
  v2 = *MEMORY[0x1E0DC4918];
  v3 = a1;
  objc_msgSend(v1, "traitCollectionWithPreferredContentSizeCategory:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:compatibleWithTraitCollection:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pointSize");
  v10 = v9;
  objc_msgSend(v7, "pointSize");
  v12 = v10 / v11 * 100.0;
  v13 = (5 * ((int)v12 / 5));
  AXLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "pointSize");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "pointSize");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138413058;
    v23 = v16;
    v24 = 2112;
    v25 = v18;
    v26 = 2112;
    v27 = v19;
    v28 = 2112;
    v29 = v20;
    _os_log_impl(&dword_1BD892000, v14, OS_LOG_TYPE_INFO, "Text size: %@/%@=%@ => %@", (uint8_t *)&v22, 0x2Au);

  }
  return (float)(int)v13 / 100.0;
}

void type metadata accessor for CVBuffer()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF505990)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF505990);
  }
}

void sub_1BD8DE958()
{
  char *v0;
  char **v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;

  v1 = &selRef_ax_addedConstraintForLayoutAttribute_asEqualToLayoutAttribute_ofView_withOffset_;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8B108]), sel_init);
  v3 = OBJC_IVAR___AXCameraManager_session;
  v4 = *(void **)&v0[OBJC_IVAR___AXCameraManager_session];
  *(_QWORD *)&v0[OBJC_IVAR___AXCameraManager_session] = v2;

  objc_msgSend(*(id *)&v0[v3], sel_beginConfiguration);
  v5 = *(void **)&v0[v3];
  if (v5)
    objc_msgSend(v5, sel_setSessionPreset_, *MEMORY[0x1E0C8A198]);
  v6 = (id)AXLogCommon();
  if (!v6)
    __break(1u);
  v7 = v6;
  v8 = v0;
  v9 = sub_1BD8E1754();
  if (os_log_type_enabled(v7, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = *(void **)&v0[v3];
    if (v12)
    {
      v13 = v12;
      v1 = &selRef_ax_addedConstraintForLayoutAttribute_asEqualToLayoutAttribute_ofView_withOffset_;
    }
    sub_1BD8E1790();
    *v11 = v12;

    _os_log_impl(&dword_1BD892000, v7, v9, "Initialize camera capture session %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF505A70);
    swift_arrayDestroy();
    MEMORY[0x1C3B778F8](v11, -1, -1);
    MEMORY[0x1C3B778F8](v10, -1, -1);
  }
  else
  {

  }
  v14 = *(void **)&v0[v3];
  if (v14)
  {
    v15 = (void *)objc_opt_self();
    v16 = v14;
    v17 = objc_msgSend(v15, sel_systemPreferredCamera);
    v18 = sub_1BD8DF604(v17, v16);

    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8B168]), v1[447]);
    objc_msgSend(v19, sel_setSampleBufferDelegate_queue_, v8, *(_QWORD *)&v8[OBJC_IVAR___AXCameraManager_queue]);
    if (objc_msgSend(v16, sel_canAddOutput_, v19))
      objc_msgSend(v16, sel_addOutput_, v19);
    objc_msgSend(v16, sel_commitConfiguration);
    objc_msgSend(v16, sel_startRunning);

  }
}

uint64_t sub_1BD8DEC30()
{
  char *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  _QWORD v14[2];
  _QWORD aBlock[6];

  v1 = sub_1BD8E1718();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BD8E1730();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = *(_QWORD *)&v0[OBJC_IVAR___AXCameraManager_queue];
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v0;
  aBlock[4] = sub_1BD8DFAE0;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BD8DEF38;
  aBlock[3] = &block_descriptor;
  v11 = _Block_copy(aBlock);
  v12 = v0;
  sub_1BD8E1724();
  v14[1] = MEMORY[0x1E0DEE9D8];
  sub_1BD8DFB00(&qword_1EF505A78, v2, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF505A80);
  sub_1BD8DFB40(&qword_1EF505A88, &qword_1EF505A80);
  sub_1BD8E179C();
  MEMORY[0x1C3B76BB4](0, v9, v5, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_release();
}

void sub_1BD8DEE14(_BYTE *a1)
{
  os_log_type_t v2;
  NSObject *v3;
  _BYTE *v4;
  uint8_t *v5;
  NSObject *log;

  if ((a1[OBJC_IVAR___AXCameraManager_shouldPublish] & 1) == 0)
  {
    a1[OBJC_IVAR___AXCameraManager_shouldPublish] = 1;
    sub_1BD8DE958();
    v2 = sub_1BD8E173C();
    v3 = (id)AXLogCommon();
    if (v3)
    {
      log = v3;
      if (os_log_type_enabled(v3, v2))
      {
        v4 = a1;
        v5 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v5 = 67109120;
        sub_1BD8E1790();

        _os_log_impl(&dword_1BD892000, log, v2, "Roya: Started capture %{BOOL}d", v5, 8u);
        MEMORY[0x1C3B778F8](v5, -1, -1);

      }
      else
      {

      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_1BD8DEF38(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1BD8DEF64()
{
  _BYTE *v0;
  os_log_type_t v1;
  NSObject *v2;
  _BYTE *v3;
  uint8_t *v4;
  NSObject *log;

  if (v0[OBJC_IVAR___AXCameraManager_shouldPublish] == 1)
  {
    v0[OBJC_IVAR___AXCameraManager_shouldPublish] = 0;
    objc_msgSend(*(id *)&v0[OBJC_IVAR___AXCameraManager_session], sel_stopRunning);
    v1 = sub_1BD8E173C();
    v2 = (id)AXLogCommon();
    if (v2)
    {
      log = v2;
      if (os_log_type_enabled(v2, v1))
      {
        v3 = v0;
        v4 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v4 = 67109120;
        sub_1BD8E1790();

        _os_log_impl(&dword_1BD892000, log, v1, "Roya: Stopped capture %{BOOL}d", v4, 8u);
        MEMORY[0x1C3B778F8](v4, -1, -1);

      }
      else
      {

      }
    }
    else
    {
      __break(1u);
    }
  }
}

id AccessibilityCameraManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AccessibilityCameraManager.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  _BYTE *v5;
  _QWORD *v6;
  objc_class *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;

  v11 = sub_1BD8E176C();
  v1 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD8E1760();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78]();
  sub_1BD8E1730();
  MEMORY[0x1E0C80A78]();
  v10 = OBJC_IVAR___AXCameraManager_queue;
  v9[1] = sub_1BD8DF2E0();
  v5 = v0;
  sub_1BD8E1724();
  v13 = MEMORY[0x1E0DEE9D8];
  sub_1BD8DFB00(&qword_1EF5059B0, v4, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF5059B8);
  sub_1BD8DFB40(&qword_1EF5059C0, &qword_1EF5059B8);
  sub_1BD8E179C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v11);
  *(_QWORD *)(v9[2] + v10) = sub_1BD8E1784();
  v5[OBJC_IVAR___AXCameraManager_shouldPublish] = 0;
  v5[OBJC_IVAR___AXCameraManager_isInitialized] = 0;
  v6 = &v5[OBJC_IVAR___AXCameraManager_frameHandler];
  *v6 = 0;
  v6[1] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___AXCameraManager_session] = 0;

  v7 = (objc_class *)type metadata accessor for AccessibilityCameraManager();
  v12.receiver = v5;
  v12.super_class = v7;
  return objc_msgSendSuper2(&v12, sel_init);
}

unint64_t sub_1BD8DF2E0()
{
  unint64_t result;

  result = qword_1EF5059A8;
  if (!qword_1EF5059A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF5059A8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3B778A4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3B778B0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for AccessibilityCameraManager()
{
  return objc_opt_self();
}

uint64_t sub_1BD8DF3E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + OBJC_IVAR___AXCameraManager_frameHandler);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___AXCameraManager_frameHandler);
  *v3 = a1;
  v3[1] = a2;
  swift_retain();
  sub_1BD8DF428(v4);
  return sub_1BD8DEC30();
}

uint64_t sub_1BD8DF428(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

id AccessibilityCameraManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessibilityCameraManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1BD8DF548@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AccessibilityCameraManager();
  result = sub_1BD8E170C();
  *a1 = result;
  return result;
}

Swift::Void __swiftcall AccessibilityCameraManager.captureOutput(_:didOutput:from:)(AVCaptureOutput _, CMSampleBufferRef didOutput, AVCaptureConnection from)
{
  sub_1BD8DF88C(_._outputInternal);
}

NSObject *sub_1BD8DF604(void *a1, void *a2)
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *result;
  id v13;
  id v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  id v18;
  void *v19;
  id v20[2];

  v20[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_allocWithZone(MEMORY[0x1E0C8B0B0]);
  v20[0] = 0;
  v5 = a1;
  v6 = objc_msgSend(v4, sel_initWithDevice_error_, v5, v20);
  if (v6)
  {
    v7 = v6;
    v8 = v20[0];
    v9 = v7;
    if ((objc_msgSend(a2, sel_canAddInput_, v9) & 1) != 0)
    {
      objc_msgSend(a2, sel_addInput_, v9);

LABEL_12:
      return v7;
    }

LABEL_10:
    v7 = 0;
    goto LABEL_12;
  }
  v10 = v20[0];
  v11 = (void *)sub_1BD8E16F4();

  swift_willThrow();
  result = (id)AXLogCommon();
  if (result)
  {
    v9 = result;
    v13 = v11;
    v14 = v11;
    v15 = sub_1BD8E1754();
    if (!os_log_type_enabled(v9, v15))
    {

      v7 = 0;
      v9 = v5;
      goto LABEL_12;
    }
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v16 = 138412290;
    v18 = v11;
    v19 = (void *)_swift_stdlib_bridgeErrorToNSError();
    v20[0] = v19;
    sub_1BD8E1790();
    *v17 = v19;

    _os_log_impl(&dword_1BD892000, v9, v15, "Couldn't get input device: %@", v16, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF505A70);
    swift_arrayDestroy();
    MEMORY[0x1C3B778F8](v17, -1, -1);
    MEMORY[0x1C3B778F8](v16, -1, -1);

    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void sub_1BD8DF88C(opaqueCMSampleBuffer *a1)
{
  void *v1;
  NSObject *v3;
  NSObject *v4;
  char *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  __CVBuffer *v9;
  __CVBuffer *v10;
  void (*v11)(__CVBuffer *);
  __CVBuffer *v12;

  v3 = (id)AXLogCommon();
  if (!v3)
  {
    __break(1u);
    goto LABEL_15;
  }
  v4 = v3;
  v5 = v1;
  v6 = sub_1BD8E1754();
  if (os_log_type_enabled(v4, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_1BD8E1790();

    _os_log_impl(&dword_1BD892000, v4, v6, "Video capture session didProduce %{BOOL}d", v7, 8u);
    MEMORY[0x1C3B778F8](v7, -1, -1);
  }
  else
  {

  }
  if (v5[OBJC_IVAR___AXCameraManager_shouldPublish] == 1)
  {
    v8 = (void *)MEMORY[0x1C3B773F4]();
    v9 = CMSampleBufferGetImageBuffer(a1);
    if (v9)
    {
      v10 = v9;
      sub_1BD8DEF64();
      v11 = *(void (**)(__CVBuffer *))&v5[OBJC_IVAR___AXCameraManager_frameHandler];
      if (v11)
      {
        swift_retain();
        v11(v10);

        sub_1BD8DF428((uint64_t)v11);
LABEL_12:
        objc_autoreleasePoolPop(v8);
        return;
      }
LABEL_11:

      goto LABEL_12;
    }
    sub_1BD8E1748();
    v12 = (__CVBuffer *)(id)AXLogCommon();
    if (v12)
    {
      v10 = v12;
      sub_1BD8E1700();
      goto LABEL_11;
    }
LABEL_15:
    __break(1u);
  }
}

uint64_t sub_1BD8DFA54()
{
  return MEMORY[0x1E0C96020];
}

uint64_t method lookup function for AccessibilityCameraManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccessibilityCameraManager.fetchCurrentCameraSceneBuffer(handler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xF8))();
}

uint64_t sub_1BD8DFA88()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1BD8DFAAC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1BD8DFABC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1BD8DFAE0()
{
  uint64_t v0;

  sub_1BD8DEE14(*(_BYTE **)(v0 + 16));
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

uint64_t sub_1BD8DFB00(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1C3B778BC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BD8DFB40(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1C3B778BC](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

void AXColorStringForColor_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, a2, a3, "UIColor %@ has no CGColor", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void AXColorStringForColor_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, a2, a3, "No known color description for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void AXColorStringForColor_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BD892000, a2, a3, "Color was not of class UIColor, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void AXUISettingsCreateWelcomeController_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1BD892000, a2, OS_LOG_TYPE_FAULT, "Unexpected view hierarchy for welcome controller: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __getAXUIDisplayManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getTTSPerVoiceSettingsViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getTTSPerVoiceSettingsViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAVTAnimojiClass_block_invoke_cold_1(v0);
}

uint64_t __getAVTAnimojiClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAVTPresetClass_block_invoke_cold_1(v0);
}

uint64_t __getAVTPresetClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAVTColorPresetClass_block_invoke_cold_1(v0);
}

uint64_t __getAVTColorPresetClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAVTAvatarPuppetRecordClass_block_invoke_cold_1(v0);
}

uint64_t __getAVTAvatarPuppetRecordClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAVTMemojiClass_block_invoke_cold_1(v0);
}

uint64_t __getAVTMemojiClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getIKListItemLockupElementClass_block_invoke_cold_1(v0);
}

uint64_t __getIKListItemLockupElementClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getIKViewElementClass_block_invoke_cold_1(v0);
}

uint64_t __getIKViewElementClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getIKListTemplateClass_block_invoke_cold_1(v0);
}

double __getIKListTemplateClass_block_invoke_cold_1()
{
  void *v0;
  SEL v1;

  v0 = (void *)abort_report_np();
  return +[AXUIDaemonApplication preferredWindowLevel](v0, v1);
}

uint64_t __getSUUIItemOfferButtonClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXElementNamesView setItems:].cold.1(v0);
}

uint64_t __getIKImageElementClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getIKTextElementClass_block_invoke_cold_1(v0);
}

uint64_t __getIKTextElementClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXSpeechSettingsModelController isResourceUserDeletable:].cold.1(v0);
}

void __getAXSettingsVoiceAssetManagerClass_block_invoke_cold_1()
{
  void *v0;
  NSObject *v1;

  v0 = (void *)abort_report_np();
  AXAppNameForBundleId_cold_1(v0, v1);
}

void AXAppNameForBundleId_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1BD892000, a2, OS_LOG_TYPE_ERROR, "Error in getting app name: %@", (uint8_t *)&v4, 0xCu);

}

uint64_t sub_1BD8E16F4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1BD8E1700()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1BD8E170C()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1BD8E1718()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BD8E1724()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BD8E1730()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BD8E173C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1BD8E1748()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BD8E1754()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BD8E1760()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1BD8E176C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1BD8E1778()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1BD8E1784()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1BD8E1790()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BD8E179C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t ASTLogCommon()
{
  return MEMORY[0x1E0CF3030]();
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x1E0CF3040]();
}

uint64_t AXAirPodsB494LocalizedStringForKey()
{
  return MEMORY[0x1E0CF49A0]();
}

uint64_t AXAirPodsB698LocalizedStringForKey()
{
  return MEMORY[0x1E0CF49A8]();
}

uint64_t AXAirPodsLocalizedStringForKey()
{
  return MEMORY[0x1E0CF49B0]();
}

uint64_t AXAssistiveTouchLocationsForLayout()
{
  return MEMORY[0x1E0CF4D18]();
}

uint64_t AXAssistiveTouchNamedLayout()
{
  return MEMORY[0x1E0CF4D20]();
}

uint64_t AXAssitiveTouchPosition()
{
  return MEMORY[0x1E0CF4D28]();
}

uint64_t AXBeats463LocalizedStringForKey()
{
  return MEMORY[0x1E0CF4D30]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x1E0CF3058]();
}

uint64_t AXCLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x1E0CF3060]();
}

uint64_t AXCLanguageConvertToCanonicalForm()
{
  return MEMORY[0x1E0CF3070]();
}

uint64_t AXCRemapLanguageCodeToFallbackIfNeccessary()
{
  return MEMORY[0x1E0CF3078]();
}

uint64_t AXClientsForSiriResource()
{
  return MEMORY[0x1E0CF4D38]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x1E0CF30B0]();
}

uint64_t AXDeviceGetMainScreenBounds()
{
  return MEMORY[0x1E0CF4D40]();
}

uint64_t AXDeviceHasHomeButton()
{
  return MEMORY[0x1E0CF4D48]();
}

uint64_t AXDeviceHasJindo()
{
  return MEMORY[0x1E0CF30B8]();
}

uint64_t AXDeviceHasStaccato()
{
  return MEMORY[0x1E0CF30C0]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x1E0CF3100]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x1E0CF3108]();
}

uint64_t AXDeviceSupportsCameraButton()
{
  return MEMORY[0x1E0CF4D58]();
}

uint64_t AXDeviceSupportsOnDeviceEyeTracking()
{
  return MEMORY[0x1E0CF3140]();
}

uint64_t AXDeviceSupportsVoiceBankingSpeech()
{
  return MEMORY[0x1E0CF3148]();
}

uint64_t AXFormatFloat()
{
  return MEMORY[0x1E0CF3158]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x1E0CF3160]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x1E0CF3168]();
}

uint64_t AXFormatMagnificationFactor()
{
  return MEMORY[0x1E0CF3170]();
}

uint64_t AXFormatNumberWithOptions()
{
  return MEMORY[0x1E0CF3178]();
}

uint64_t AXHomeClickHapticsSupported()
{
  return MEMORY[0x1E0CF4D90]();
}

uint64_t AXLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x1E0CF4D98]();
}

uint64_t AXLanguageConvertToCanonicalForm()
{
  return MEMORY[0x1E0CF4DA0]();
}

uint64_t AXLocStringForDeviceVariant()
{
  return MEMORY[0x1E0CF4DA8]();
}

uint64_t AXLocStringKeyForHomeButton()
{
  return MEMORY[0x1E0CF4DB0]();
}

uint64_t AXLocStringKeyForModel()
{
  return MEMORY[0x1E0CF4DB8]();
}

uint64_t AXLocalizedString()
{
  return MEMORY[0x1E0CF4DC0]();
}

uint64_t AXLogAirPodSettings()
{
  return MEMORY[0x1E0CF31B0]();
}

uint64_t AXLogBrailleHW()
{
  return MEMORY[0x1E0CF31E8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1E0CF31F8]();
}

uint64_t AXLogDragging()
{
  return MEMORY[0x1E0CF3208]();
}

uint64_t AXLogSettings()
{
  return MEMORY[0x1E0CF3290]();
}

uint64_t AXLogSpeakSelection()
{
  return MEMORY[0x1E0CF32B0]();
}

uint64_t AXLogSpeechAssetDownload()
{
  return MEMORY[0x1E0CF32B8]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x1E0CF3320]();
}

NSString *__cdecl AXNameFromColor(CGColorRef color)
{
  return (NSString *)MEMORY[0x1E0C8EDA0](color);
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x1E0CF33D0]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x1E0CF33D8]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x1E0CF33E8]();
}

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x1E0CF33F0]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x1E0CF33F8]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x1E0CF3400]();
}

uint64_t AXProcessIsAXUIServer()
{
  return MEMORY[0x1E0CF3410]();
}

uint64_t AXProcessIsSetup()
{
  return MEMORY[0x1E0CF3460]();
}

uint64_t AXResourceActivelyUsed()
{
  return MEMORY[0x1E0CF4DC8]();
}

uint64_t AXRuntimeCheck_PerVoiceSettings()
{
  return MEMORY[0x1E0CF34A0]();
}

uint64_t AXSBTitleForMedusaGesture()
{
  return MEMORY[0x1E0CF4DD0]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x1E0CF37B0]();
}

uint64_t AXSiriDisplayNameForIdentifier()
{
  return MEMORY[0x1E0CF4DD8]();
}

uint64_t AXSystemRootDirectory()
{
  return MEMORY[0x1E0CF37F8]();
}

uint64_t AXTTSLogCommon()
{
  return MEMORY[0x1E0CF3800]();
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  return MEMORY[0x1E0CF40A0](value, *(_QWORD *)&theType, valuePtr);
}

uint64_t AXVoiceNameForVoiceId()
{
  return MEMORY[0x1E0CF4DE8]();
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x1E0CF4E38]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
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

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CGPoint CGPointFromString(NSString *string)
{
  double v1;
  double v2;
  CGPoint result;

  MEMORY[0x1E0DC3270](string);
  result.y = v2;
  result.x = v1;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
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

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t CLFLogCommon()
{
  return MEMORY[0x1E0CF3910]();
}

uint64_t CLFSortedCommunicationLimits()
{
  return MEMORY[0x1E0D10748]();
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t GSEventCreateWithEventRecord()
{
  return MEMORY[0x1E0D27AF0]();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return MEMORY[0x1E0D27B50]();
}

uint64_t GSEventSetHardwareKeyboardAttached()
{
  return MEMORY[0x1E0D27B90]();
}

uint64_t LICreateDefaultIcon()
{
  return MEMORY[0x1E0D4E3D0]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x1E0CB3150](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PSRoundToPixel()
{
  return MEMORY[0x1E0D808E8]();
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return MEMORY[0x1E0DC44D8]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0DC44E8](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1E0DC4530]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1E0DC4570]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x1E0DC4598](*(_QWORD *)&notification, argument);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0DC48E0](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper()
{
  return MEMORY[0x1E0DC49A8]();
}

uint64_t UIEdgeInsetsRotate()
{
  return MEMORY[0x1E0DC49D8]();
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

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0DC4C00]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0DC4C08](context);
}

uint64_t UISUserInterfaceStyleModeValueIsAutomatic()
{
  return MEMORY[0x1E0DC5D68]();
}

uint64_t VOTLogCommon()
{
  return MEMORY[0x1E0CF3A20]();
}

uint64_t VOTLogKeyboard()
{
  return MEMORY[0x1E0CF3A28]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x1E0CF3A38]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x1E0CF3A48]();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x1E0DDD710]();
}

uint64_t _AXSGetUSBRMDisablers()
{
  return MEMORY[0x1E0DDD780]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x1E0DDD980]();
}

uint64_t _AXSQuickSpeakCopyPreferredLocalesForLanguages()
{
  return MEMORY[0x1E0DDDAE8]();
}

uint64_t _AXSSetSpatialAudioHeadTracking()
{
  return MEMORY[0x1E0DDDCA0]();
}

uint64_t _AXSSetUSBRMDisablers()
{
  return MEMORY[0x1E0DDDCB8]();
}

uint64_t _AXSSpatialAudioHeadTracking()
{
  return MEMORY[0x1E0DDDD00]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x1E0CF3A50]();
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

uint64_t _DUINewClientSessionAccessibilityInterface()
{
  return MEMORY[0x1E0DC5678]();
}

uint64_t _DUINewServerSessionAccessibilityInterface()
{
  return MEMORY[0x1E0DC5680]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x1E0CF43D0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x1E0CF3A58]();
}

uint64_t __UIAccessibilityGetAssociatedNonRetainedObject()
{
  return MEMORY[0x1E0CF3A80]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x1E0CF3A88]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x1E0CF3A98]();
}

uint64_t __UIAccessibilitySetAssociatedNonRetainedObject()
{
  return MEMORY[0x1E0CF3AC0]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x1E0CF3AC8]();
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

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
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

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x1E0C85B88]();
}

