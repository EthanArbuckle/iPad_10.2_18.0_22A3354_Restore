void updateGizmoAccessibilitySettings()
{
  NSObject *v0;

  dispatch_get_global_queue(0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_378);

}

void sub_232457C04(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  id *v6;
  id *v7;
  uint64_t v8;

  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v8 - 104));
  _Unwind_Resume(a1);
}

void unsetCaptureMode(int a1)
{
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  AXLogSystemApp();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_DEFAULT, "Un-setting capture mode: %u", (uint8_t *)v3, 8u);
  }

  _SBAXCaptureMode &= ~a1;
  updateEventTapForNewCaptureMode();
}

void AXBSendEventRepresentationUntapped(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BE00638];
  v2 = a1;
  objc_msgSend(v1, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _EventTapIdentifier;
  v6[0] = *MEMORY[0x24BE00068];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendEvent:afterTap:useGSEvent:namedTaps:options:", v2, v4, 0, v5, 0);

}

void sub_232458364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void copyKeysToArray(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  if (a2)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a2);
    objc_msgSend(a3, "addObject:", v4);

  }
}

void sub_232458D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void setCaptureMode(int a1)
{
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  AXLogSystemApp();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl(&dword_232455000, v2, OS_LOG_TYPE_DEFAULT, "Setting capture mode: %u", (uint8_t *)v3, 8u);
  }

  _SBAXCaptureMode |= a1;
  updateEventTapForNewCaptureMode();
}

double AXConvertFromContextHostedPoint(uint64_t a1, uint64_t a2, double a3, double a4)
{
  void *v8;

  +[AXBEventManager sharedManager](AXBEventManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromContextId:displayId:", a1, a2, a3, a4);

  return AXRotateFromScreen();
}

void BKPostAXEvent(void *a1, int a2)
{
  id v3;

  v3 = a1;
  if (a2)
    objc_msgSend(v3, "setAdditionalFlags:", objc_msgSend(v3, "additionalFlags") | 0x1000000);
  objc_msgSend(v3, "dataRepresentation");
  AXPushNotificationToSystemForBroadcast();

}

void __updateGizmoAccessibilitySettings_block_invoke()
{
  id v0;
  id v1;

  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.Accessibility"));
  v0 = (id)objc_msgSend(v1, "synchronize");
  objc_msgSend(v1, "BOOLForKey:", CFSTR("ApplicationAccessibilityEnabled"));
  AXPerformBlockOnMainThread();

}

void __updateGizmoAccessibilitySettings_block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setGizmoApplicationAccessibilityEnabled:", 1);

}

void __updateGizmoAccessibilitySettings_block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setGizmoApplicationAccessibilityEnabled:", 0);

}

void updateEventTapForNewCaptureMode()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (_SBAXCaptureMode)
  {
    if (!_EventTapIdentifier)
    {
      objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "installEventTap:identifier:type:", &__block_literal_global_388, CFSTR("BB-AX"), 0);
      v0 = objc_claimAutoreleasedReturnValue();
      v1 = (void *)_EventTapIdentifier;
      _EventTapIdentifier = v0;

    }
  }
  else if (_EventTapIdentifier)
  {
    objc_msgSend(MEMORY[0x24BE00638], "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeEventTap:", _EventTapIdentifier);

    v3 = (void *)_EventTapIdentifier;
    _EventTapIdentifier = 0;

  }
}

uint64_t __updateEventTapForNewCaptureMode_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  +[AXBAccessibilityManager sharedManager](AXBAccessibilityManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityEventTapCallback:", v2);

  return v4;
}

void sub_23245C168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _updateBackTap()
{
  return AXPerformBlockAsynchronouslyOnMainThread();
}

void sub_23245C250(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23245C338(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23245CB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t ___updateBackTap_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_backTapSettingsDidUpdate");
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void _toggleAXSetting(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2870]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a3, "isEqualToString:", v4);

  if (v5)
  {
    _AXSInvertColorsEnabled();
    _AXSInvertColorsSetEnabled();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2780]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a3, "isEqualToString:", v6);

    if (v7)
    {
      _AXSGrayscaleEnabled();
      _AXSGrayscaleSetEnabled();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED28D8]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(a3, "isEqualToString:", v8);

      if (v9)
      {
        _AXSRedGreenFilterEnabled();
        _AXSRedGreenFilterSetEnabled();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2788]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(a3, "isEqualToString:", v10);

        if (v11)
        {
          _AXSGreenRedFilterEnabled();
          _AXSGreenRedFilterSetEnabled();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2710]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(a3, "isEqualToString:", v12);

          if (v13)
          {
            _AXSBlueYellowFilterEnabled();
            _AXSBlueYellowFilterSetEnabled();
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2930]);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(a3, "isEqualToString:", v14);

            if (v15)
            {
              _AXSColorTintFilterEnabled();
              _AXSColorTintSetEnabled();
            }
          }
        }
      }
    }
  }
}

void _displayFiltersChanged()
{
  void *v0;
  id v1;

  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_repostNotificationIfNeeded");

  +[AXBDisplayFilterManager sharedInstance](AXBDisplayFilterManager, "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateSettings");

}

double AXRotateToScreen()
{
  double v0;
  uint64_t v2;
  double *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = 0;
  v3 = (double *)&v2;
  v4 = 0x3010000000;
  v6 = 0;
  v7 = 0;
  v5 = "";
  AXPerformSafeBlock();
  v0 = v3[4];
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_23245F840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2324601C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

double AXRotateFromScreen()
{
  double v0;
  uint64_t v2;
  double *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = 0;
  v3 = (double *)&v2;
  v4 = 0x3010000000;
  v6 = 0;
  v7 = 0;
  v5 = "";
  AXPerformSafeBlock();
  v0 = v3[4];
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_23246094C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_250188E30, CFSTR("Accessibility"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_232461FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23246216C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_232462E8C(_Unwind_Exception *a1)
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
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

uint64_t _updateSoundDetection()
{
  return AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t ___updateSoundDetection_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_soundDetectionSettingsDidUpdate");
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void _toggleAXSetting_0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  int v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2870]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a3, "isEqualToString:", v4);

  if (v5)
  {
    _AXSInvertColorsEnabled();
    _AXSInvertColorsSetEnabled();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-toggle-testing"), *MEMORY[0x24BED2780]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a3, "isEqualToString:", v6);

    if (v7)
    {
      _AXSGrayscaleEnabled();
      _AXSGrayscaleSetEnabled();
    }
  }
}

id getLiveSpeechServicesObjcClass()
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
  v0 = (void *)getLiveSpeechServicesObjcClass_softClass;
  v7 = getLiveSpeechServicesObjcClass_softClass;
  if (!getLiveSpeechServicesObjcClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLiveSpeechServicesObjcClass_block_invoke;
    v3[3] = &unk_250187F98;
    v3[4] = &v4;
    __getLiveSpeechServicesObjcClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_232463ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLiveSpeechServicesObjcClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!LiveSpeechServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_250187FB8;
    v5 = 0;
    LiveSpeechServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LiveSpeechServicesLibraryCore_frameworkLibrary)
    __getLiveSpeechServicesObjcClass_block_invoke_cold_1(&v3);
  result = objc_getClass("LiveSpeechServicesObjc");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLiveSpeechServicesObjcClass_block_invoke_cold_2();
  getLiveSpeechServicesObjcClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2324642C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *__getAXMotionCuesManagerSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!AXMotionCuesServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_250188090;
    v5 = 0;
    AXMotionCuesServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AXMotionCuesServicesLibraryCore_frameworkLibrary)
    __getAXMotionCuesManagerSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)AXMotionCuesServicesLibraryCore_frameworkLibrary, "AXMotionCuesManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXMotionCuesManagerSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2324648B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void _handleContinuityDisplayStateChanged(uint64_t a1, void *a2)
{
  NSObject *v3;
  _QWORD block[5];

  if (a2)
  {
    objc_msgSend(a2, "springboardContinuityCheckQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___handleContinuityDisplayStateChanged_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a2;
    dispatch_async(v3, block);

  }
}

uint64_t ___handleContinuityDisplayStateChanged_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForContinuityStateChange");
}

id getLiveCaptionsServicesClass()
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
  v0 = (void *)getLiveCaptionsServicesClass_softClass;
  v7 = getLiveCaptionsServicesClass_softClass;
  if (!getLiveCaptionsServicesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLiveCaptionsServicesClass_block_invoke;
    v3[3] = &unk_250187F98;
    v3[4] = &v4;
    __getLiveCaptionsServicesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_232465C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLiveCaptionsServicesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!LiveSpeechServicesLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_250188218;
    v5 = 0;
    LiveSpeechServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!LiveSpeechServicesLibraryCore_frameworkLibrary_0)
    __getLiveCaptionsServicesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("LiveCaptionsServices");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLiveCaptionsServicesClass_block_invoke_cold_2();
  getLiveCaptionsServicesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _isBuddyRunning()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if ((AXInPreboardScenario() & 1) != 0)
    return 0;
  v1 = objc_alloc(MEMORY[0x24BE0B660]);
  objc_msgSend(MEMORY[0x24BDFE4F0], "setupProcessName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v1, "initWithBundleIDs:states:", v3, *MEMORY[0x24BE0B4E8]);

  objc_msgSend(MEMORY[0x24BDFE4F0], "setupProcessName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "applicationStateForApplication:", v5);

  if (v6 == 8 || v6 == 4)
    v0 = AXIsBuddyCompleted() ^ 1;
  else
    v0 = 0;
  objc_msgSend(v4, "invalidate");

  return v0;
}

void sub_2324672D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _postHomeButtonPress(int a1, int a2, void *a3)
{
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (AXDeviceHasHomeButton())
    v5 = 1001;
  else
    v5 = 1011;
  if (AXDeviceHasHomeButton())
    v6 = 1000;
  else
    v6 = 1010;
  if (a1)
    v7 = v5;
  else
    v7 = v6;
  objc_msgSend(MEMORY[0x24BE00630], "buttonRepresentationWithType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdditionalFlags:", objc_msgSend(v8, "additionalFlags") | 0x1000000);
  objc_msgSend(v13, "clientId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientId:", v9);

  objc_msgSend(v13, "HIDAttributeData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHIDAttributeData:", v10);

  if (a1 && a2)
    objc_msgSend(v8, "setAdditionalFlags:", objc_msgSend(v8, "additionalFlags") | 0x880000);
  objc_msgSend(v8, "setHIDTime:", objc_msgSend(v13, "HIDTime"));
  objc_msgSend(v8, "setUseOriginalHIDTime:", 1);
  objc_msgSend(MEMORY[0x24BE00638], "sharedManager", CFAbsoluteTimeGetCurrent());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_Controller, "_eventTapIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:afterTap:useGSEvent:namedTaps:options:", v8, v12, 0, 0, 0);

}

void _accessibilityTripleHomeStatusChange()
{
  void *v0;
  id v1;

  +[AXBHomeClickController controller](AXBHomeClickController, "controller");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_updateTripleHomeSettings:", 0);

  +[AXBHomeClickController controller](AXBHomeClickController, "controller");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_writeNoteToNewUserSession");

}

uint64_t _accessibilityTripleHomeFired()
{
  return AXPerformBlockAsynchronouslyOnMainThread();
}

void _accessibilityHomeClickEnabled()
{
  id v0;

  +[AXBHomeClickController controller](AXBHomeClickController, "controller");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_updateHomeClickEnabled");

}

void _accessibilityHomeClickSpeedChanged()
{
  id v0;

  +[AXBHomeClickController controller](AXBHomeClickController, "controller");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_updateHomeClickSpeed");

}

void _appTransitionOccurred()
{
  id v0;

  +[AXBHomeClickController controller](AXBHomeClickController, "controller");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_triggerAppTransition");

}

uint64_t _handleInPreBoardModeUpdate()
{
  uint64_t result;

  result = AXInPreboardScenario();
  if ((_DWORD)result)
  {
    _AXSVoiceOverTouchEnabled();
    _AXSVoiceOverTouchSetEnabled();
    _AXSAssistiveTouchScannerEnabled();
    _AXSAssistiveTouchScannerSetEnabled();
    _AXSAssistiveTouchEnabled();
    _AXSAssistiveTouchSetEnabled();
    _AXSCommandAndControlEnabled();
    _AXSCommandAndControlSetEnabled();
    _AXSFullKeyboardAccessEnabled();
    return _AXSFullKeyboardAccessSetEnabled();
  }
  return result;
}

uint64_t _handleInCheckerBoardModeUpdate()
{
  uint64_t result;

  result = AXInCheckerBoardScenario();
  if ((_DWORD)result)
  {
    _AXSVoiceOverTouchEnabled();
    _AXSVoiceOverTouchSetEnabled();
    _AXSAssistiveTouchScannerEnabled();
    _AXSAssistiveTouchScannerSetEnabled();
    _AXSAssistiveTouchEnabled();
    return _AXSAssistiveTouchSetEnabled();
  }
  return result;
}

void _handleSessionIsLoginSessionUpdate()
{
  id v0;

  +[AXBHomeClickController controller](AXBHomeClickController, "controller");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_triggerAppTransition");

}

void ___accessibilityTripleHomeFired_block_invoke()
{
  _BOOL4 v0;
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)_AXSTripleClickCopyOptions();
  v0 = objc_msgSend(v3, "count") == 2
    && _AXSTripleClickContainsOption()
    && _AXSTripleClickContainsOption() != 0;
  if (objc_msgSend(v3, "count") == 1 || v0)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v2, "intValue");

  }
  else if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v1 = 0;
  }
  else
  {
    v1 = 3;
  }
  if ((AXInPreboardScenario() & 1) != 0 || AXInCheckerBoardScenario())
  {
    if (_AXSAssistiveTouchScannerEnabled())
    {
LABEL_14:
      v1 = 9;
LABEL_15:
      objc_msgSend(MEMORY[0x24BE00738], "toggleTripleClickOption:", v1);
      goto LABEL_34;
    }
    if (!_AXSVoiceOverTouchEnabled() && (objc_msgSend(v3, "containsObject:", &unk_25018EE08) & 1) == 0)
    {
      if ((objc_msgSend(v3, "containsObject:", &unk_25018EE38) & 1) == 0)
      {
        if ((objc_msgSend(v3, "containsObject:", &unk_25018EE50) & 1) != 0)
        {
          v1 = 4;
        }
        else if ((objc_msgSend(v3, "containsObject:", &unk_25018EE68) & 1) != 0)
        {
          v1 = 27;
        }
        else if ((objc_msgSend(v3, "containsObject:", &unk_25018EE80) & 1) != 0)
        {
          v1 = 40;
        }
        else if ((objc_msgSend(v3, "containsObject:", &unk_25018EE98) & 1) != 0)
        {
          v1 = 2;
        }
        else if (objc_msgSend(v3, "containsObject:", &unk_25018EEB0))
        {
          v1 = 34;
        }
        else
        {
          v1 = 0;
        }
        goto LABEL_15;
      }
      goto LABEL_14;
    }
LABEL_33:
    objc_msgSend((id)_Controller, "_startVoiceOverSequence");
    goto LABEL_34;
  }
  if (+[AXBGuidedAccessManager inGuidedAccess](AXBGuidedAccessManager, "inGuidedAccess"))
  {
    if (!+[AXBGuidedAccessManager allowsTripleClickSheet](AXBGuidedAccessManager, "allowsTripleClickSheet"))
    {
      v1 = 7;
      goto LABEL_15;
    }
  }
  else if (_AXSAssistiveTouchScannerEnabled()
         && (objc_msgSend(MEMORY[0x24BE00738], "switchControlRendersDeviceUnusable") & 1) != 0)
  {
    goto LABEL_14;
  }
  if ((int)v1 > 11)
  {
    switch((_DWORD)v1)
    {
      case 0xC:
        objc_msgSend((id)_Controller, "_toggleMagnifier");
        goto LABEL_34;
      case 0x10:
        objc_msgSend((id)_Controller, "_showLookingGlassMenu");
        goto LABEL_34;
      case 0x16:
        objc_msgSend((id)_Controller, "_toggleDetectionMode");
        goto LABEL_34;
    }
    goto LABEL_15;
  }
  if ((_DWORD)v1 == 1)
    goto LABEL_33;
  if ((_DWORD)v1 == 3)
  {
    objc_msgSend((id)_Controller, "_toggleDisplayAskSheet");
    goto LABEL_34;
  }
  if ((_DWORD)v1 != 5)
    goto LABEL_15;
  if (_isBuddyRunning() && !AXIsBuddyCompleted() || AXSessionIsLoginSession())
    goto LABEL_33;
LABEL_34:

}

id getLookingGlassServicesClass()
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
  v0 = (void *)getLookingGlassServicesClass_softClass;
  v7 = getLookingGlassServicesClass_softClass;
  if (!getLookingGlassServicesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLookingGlassServicesClass_block_invoke;
    v3[3] = &unk_250187F98;
    v3[4] = &v4;
    __getLookingGlassServicesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_232469080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLookingGlassServicesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!LookingGlassServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_2501883E0;
    v5 = 0;
    LookingGlassServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LookingGlassServicesLibraryCore_frameworkLibrary)
    __getLookingGlassServicesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("LookingGlassServices");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLookingGlassServicesClass_block_invoke_cold_2();
  getLookingGlassServicesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void _AXBValidateMethods()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_16, &__block_literal_global_278, 0);

}

void sub_232469AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getSpeakThisServicesClass()
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
  v0 = (void *)getSpeakThisServicesClass_softClass;
  v7 = getSpeakThisServicesClass_softClass;
  if (!getSpeakThisServicesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSpeakThisServicesClass_block_invoke;
    v3[3] = &unk_250187F98;
    v3[4] = &v4;
    __getSpeakThisServicesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_232469E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23246A038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getSpeakThisServicesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SpeakThisServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_250188518;
    v5 = 0;
    SpeakThisServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpeakThisServicesLibraryCore_frameworkLibrary)
    __getSpeakThisServicesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SpeakThisServices");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSpeakThisServicesClass_block_invoke_cold_2();
  getSpeakThisServicesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23246A99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getHoverTextObjcSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!HoverTextServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_250188590;
    v5 = 0;
    HoverTextServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HoverTextServicesLibraryCore_frameworkLibrary)
    __getHoverTextObjcSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)HoverTextServicesLibraryCore_frameworkLibrary, "HoverTextObjc");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getHoverTextObjcSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23246B5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AXWatchRemoteScreenServicesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_250188628;
    v3 = 0;
    AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary)
    AXWatchRemoteScreenServicesLibrary_cold_1(&v1);
  return AXWatchRemoteScreenServicesLibraryCore_frameworkLibrary;
}

void sub_23246F0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23246FD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_232471480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void _prefChangedCallback()
{
  id v0;

  +[AXBOpaqueTouchSettingsManager sharedInstance](AXBOpaqueTouchSettingsManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_resendPreferencesToServices");

}

uint64_t _deviceMatchedCallback(void *a1, uint64_t a2, uint64_t a3)
{
  _AXSSetAccessibilityHasNoticedOpaqueTouchDevice();
  return objc_msgSend(a1, "deviceServiceAppeared:", a3);
}

void __getLiveSpeechServicesObjcClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *LiveSpeechServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXBLiveSpeechManager.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLiveSpeechServicesObjcClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLiveSpeechServicesObjcClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXBLiveSpeechManager.m"), 25, CFSTR("Unable to find class %s"), "LiveSpeechServicesObjc");

  __break(1u);
}

void __getAXMotionCuesManagerSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AXMotionCuesServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXBMotionCuesManager.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLiveCaptionsServicesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *LiveSpeechServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXBLiveCaptionsManager.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLiveCaptionsServicesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLiveCaptionsServicesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXBLiveCaptionsManager.m"), 18, CFSTR("Unable to find class %s"), "LiveCaptionsServices");

  __break(1u);
}

void __getLookingGlassServicesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *LookingGlassServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXBLookingGlassManager.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getLookingGlassServicesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getLookingGlassServicesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXBLookingGlassManager.m"), 18, CFSTR("Unable to find class %s"), "LookingGlassServices");

  __break(1u);
}

void __getSpeakThisServicesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpeakThisServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXBSpeakThisManager.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSpeakThisServicesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSpeakThisServicesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXBSpeakThisManager.m"), 17, CFSTR("Unable to find class %s"), "SpeakThisServices");

  __break(1u);
}

void __getHoverTextObjcSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HoverTextServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXBHoverTextManager.m"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void AXWatchRemoteScreenServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AXWatchRemoteScreenServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXBTwiceRemoteScreenManager.m"), 15, CFSTR("%s"), *a1);

  __break(1u);
}

uint64_t AXBeginListeningToUserDefaultsChanges()
{
  return MEMORY[0x24BED1FD0]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x24BDFDF98]();
}

uint64_t AXDeviceGetMainScreenBounds()
{
  return MEMORY[0x24BDFFF28]();
}

uint64_t AXDeviceHasHomeButton()
{
  return MEMORY[0x24BDFFF60]();
}

uint64_t AXDeviceIsJ5XX()
{
  return MEMORY[0x24BDFFF88]();
}

uint64_t AXDeviceIsMultiUser()
{
  return MEMORY[0x24BDFDFF0]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFE000]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x24BDFE008]();
}

uint64_t AXDeviceSupportsCameraButton()
{
  return MEMORY[0x24BDFFFE0]();
}

uint64_t AXDeviceSupportsHapticMusic()
{
  return MEMORY[0x24BDFFFF8]();
}

uint64_t AXDeviceSupportsMotionCues()
{
  return MEMORY[0x24BE00018]();
}

uint64_t AXEventTypeIsKeyboardKey()
{
  return MEMORY[0x24BE00078]();
}

uint64_t AXEventTypeShouldLetBackboardProcess()
{
  return MEMORY[0x24BE00080]();
}

uint64_t AXHasCapability()
{
  return MEMORY[0x24BE00130]();
}

uint64_t AXInCheckerBoardScenario()
{
  return MEMORY[0x24BE00148]();
}

uint64_t AXInPreboardScenario()
{
  return MEMORY[0x24BE00168]();
}

uint64_t AXIsBuddyCompleted()
{
  return MEMORY[0x24BDFE080]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x24BDFE088]();
}

uint64_t AXIsLookingGlassAvailable()
{
  return MEMORY[0x24BDFE090]();
}

uint64_t AXLogAVS()
{
  return MEMORY[0x24BDFE098]();
}

uint64_t AXLogAccessories()
{
  return MEMORY[0x24BDFE0A0]();
}

uint64_t AXLogBackTap()
{
  return MEMORY[0x24BDFE0D0]();
}

uint64_t AXLogBackboardServer()
{
  return MEMORY[0x24BDFE0D8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

uint64_t AXLogDisplayFilters()
{
  return MEMORY[0x24BDFE0F8]();
}

uint64_t AXLogHapticMusic()
{
  return MEMORY[0x24BDFE118]();
}

uint64_t AXLogLiveTranscription()
{
  return MEMORY[0x24BDFE130]();
}

uint64_t AXLogLookingGlass()
{
  return MEMORY[0x24BDFE140]();
}

uint64_t AXLogLookingGlassUI()
{
  return MEMORY[0x24BDFE148]();
}

uint64_t AXLogMotionCues()
{
  return MEMORY[0x24BDFE150]();
}

uint64_t AXLogSoundActions()
{
  return MEMORY[0x24BDFE180]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x24BDFE188]();
}

uint64_t AXLogSystemApp()
{
  return MEMORY[0x24BDFE1B0]();
}

uint64_t AXLogTouchAccommodations()
{
  return MEMORY[0x24BDFE1C8]();
}

uint64_t AXLogTwiceRemoteScreen()
{
  return MEMORY[0x24BDFE1D8]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x24BDFE1F8]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x24BDFE210]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x24BDFE238]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BDFE240]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BDFE248]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BDFE278]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

uint64_t AXPushNotificationToSystemForBroadcast()
{
  return MEMORY[0x24BDFE938]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x24BDFE948]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

uint64_t AXSessionIsLoginSession()
{
  return MEMORY[0x24BE00380]();
}

uint64_t AX_CGPathCopyDataRepresentation()
{
  return MEMORY[0x24BE004A0]();
}

uint64_t BKSHIDDigitizerEventIsFirstTouchDown()
{
  return MEMORY[0x24BE0B538]();
}

uint64_t BKSHIDEventGetDigitizerAttributes()
{
  return MEMORY[0x24BE0B548]();
}

uint64_t BKSHIDEventSetAttributes()
{
  return MEMORY[0x24BE0B568]();
}

uint64_t BKSHIDEventSetDigitizerInfo()
{
  return MEMORY[0x24BE0B570]();
}

uint64_t BKSHIDEventSetDigitizerInfoWithSubEventInfos()
{
  return MEMORY[0x24BE0B578]();
}

uint64_t BKSHIDEventSetSimpleInfo()
{
  return MEMORY[0x24BE0B588]();
}

uint64_t BKSHIDServicesCancelTouchesOnMainDisplay()
{
  return MEMORY[0x24BE0B5A0]();
}

uint64_t BKSHIDServicesSetDeviceOrientationForAutomation()
{
  return MEMORY[0x24BE0B620]();
}

uint64_t BKSHIDServicesSetPersistentServiceProperties()
{
  return MEMORY[0x24BE0B628]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
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

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
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

uint64_t CLFLogCommon()
{
  return MEMORY[0x24BDFE448]();
}

uint64_t FKALogCommon()
{
  return MEMORY[0x24BDFE450]();
}

uint64_t GAXLogCommon()
{
  return MEMORY[0x24BDFE458]();
}

uint64_t GSGetPurpleSystemEventPort()
{
  return MEMORY[0x24BE3D5C0]();
}

uint64_t GSSendEvent()
{
  return MEMORY[0x24BE3D628]();
}

uint64_t HTLogCommon()
{
  return MEMORY[0x24BDFE460]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x24BDD82B8]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x24BDD82C0]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x24BDD8340]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x24BDD8360](client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x24BDD8368]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingCallback()
{
  return MEMORY[0x24BDD8388]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x24BDD83C0]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x24BDD83D8]();
}

uint64_t IOHIDEventSystemClientUnscheduleWithRunLoop()
{
  return MEMORY[0x24BDD8418]();
}

uint64_t IOHIDEventSystemConnectionDispatchEvent()
{
  return MEMORY[0x24BDD8420]();
}

uint64_t IOHIDEventSystemConnectionGetAttribute()
{
  return MEMORY[0x24BDD8428]();
}

uint64_t IOHIDServiceClientRegisterRemovalCallback()
{
  return MEMORY[0x24BDD8548]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x24BDD8558](service, key, property);
}

uint64_t LiveSpeechLogCommon()
{
  return MEMORY[0x24BDFE468]();
}

uint64_t MADisplayFilterCopySystemFilter()
{
  return MEMORY[0x24BDDB8F8]();
}

uint64_t MADisplayFilterCreateIdentity()
{
  return MEMORY[0x24BDDB900]();
}

uint64_t MADisplayFilterGetGain()
{
  return MEMORY[0x24BDDB908]();
}

uint64_t MADisplayFilterGetMatrix()
{
  return MEMORY[0x24BDDB910]();
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return MEMORY[0x24BDDB918]();
}

uint64_t MADisplayFilterPrefGetReduceWhitePointIntensity()
{
  return MEMORY[0x24BDDB920]();
}

uint64_t MAPreferencesSetDomainOverride()
{
  return MEMORY[0x24BDDB950]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MobileStorageCopyDevices()
{
  return MEMORY[0x24BE67690]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSPoint NSPointFromString(NSString *aString)
{
  double v1;
  double v2;
  NSPoint result;

  MEMORY[0x24BDD1148](aString);
  result.y = v2;
  result.x = v1;
  return result;
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x24BDD11D8](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x24BDD1248]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x24BDD1260]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t VOTLogLifeCycle()
{
  return MEMORY[0x24BDFE518]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BDFE528]();
}

uint64_t _AXBroadcastEventProcessNotification()
{
  return MEMORY[0x24BDFECF0]();
}

uint64_t _AXElementForAXUIElementUniqueId()
{
  return MEMORY[0x24BDFED00]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BDFE538]();
}

uint64_t _AXSAccessibilityEnabled()
{
  return MEMORY[0x24BED2000]();
}

uint64_t _AXSAccessibilitySetiTunesPreference()
{
  return MEMORY[0x24BED2020]();
}

uint64_t _AXSAllowOpaqueTouchGestures()
{
  return MEMORY[0x24BED2028]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x24BED2040]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x24BED2048]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x24BED2050]();
}

uint64_t _AXSAssistiveTouchKickstart()
{
  return MEMORY[0x24BED2060]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x24BED2070]();
}

uint64_t _AXSAssistiveTouchScannerSetEnabled()
{
  return MEMORY[0x24BED2078]();
}

uint64_t _AXSAssistiveTouchSetEnabled()
{
  return MEMORY[0x24BED2080]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x24BED20C0]();
}

uint64_t _AXSBlueYellowFilterEnabled()
{
  return MEMORY[0x24BED20F0]();
}

uint64_t _AXSBlueYellowFilterSetEnabled()
{
  return MEMORY[0x24BED20F8]();
}

uint64_t _AXSCachedValueForBrightnessFilter()
{
  return MEMORY[0x24BED2108]();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return MEMORY[0x24BED2110]();
}

uint64_t _AXSClarityBoardEnabled()
{
  return MEMORY[0x24BED2120]();
}

uint64_t _AXSColorTintFilterEnabled()
{
  return MEMORY[0x24BED2150]();
}

uint64_t _AXSColorTintSetEnabled()
{
  return MEMORY[0x24BED2158]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSCommandAndControlSetEnabled()
{
  return MEMORY[0x24BED2178]();
}

uint64_t _AXSCopyPreferenceValueWithDomain()
{
  return MEMORY[0x24BED2188]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BED21F0]();
}

uint64_t _AXSFullKeyboardAccessSetEnabled()
{
  return MEMORY[0x24BED2208]();
}

uint64_t _AXSGrayscaleEnabled()
{
  return MEMORY[0x24BED2218]();
}

uint64_t _AXSGrayscaleSetEnabled()
{
  return MEMORY[0x24BED2220]();
}

uint64_t _AXSGreenRedFilterEnabled()
{
  return MEMORY[0x24BED2228]();
}

uint64_t _AXSGreenRedFilterSetEnabled()
{
  return MEMORY[0x24BED2230]();
}

uint64_t _AXSGuidedAccessEnabled()
{
  return MEMORY[0x24BED2238]();
}

uint64_t _AXSGuidedAccessRequiresApplicationAccessibility()
{
  return MEMORY[0x24BED2248]();
}

uint64_t _AXSHapticMusicEnabled()
{
  return MEMORY[0x24BED2268]();
}

uint64_t _AXSHomeClickEnabled()
{
  return MEMORY[0x24BED22B0]();
}

uint64_t _AXSHomeClickSpeed()
{
  return MEMORY[0x24BED22B8]();
}

uint64_t _AXSHoverTextEnabled()
{
  return MEMORY[0x24BED22C0]();
}

uint64_t _AXSHoverTextTypingEnabled()
{
  return MEMORY[0x24BED22C8]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x24BED22E0]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x24BED22F8]();
}

uint64_t _AXSLiveSpeechEnabled()
{
  return MEMORY[0x24BED2310]();
}

uint64_t _AXSLiveSpeechSetEnabled()
{
  return MEMORY[0x24BED2318]();
}

uint64_t _AXSLiveTranscriptionEnabled()
{
  return MEMORY[0x24BED2320]();
}

uint64_t _AXSMotionCuesEnabled()
{
  return MEMORY[0x24BED2350]();
}

uint64_t _AXSMotionCuesMode()
{
  return MEMORY[0x24BED2358]();
}

uint64_t _AXSOnDeviceEyeTrackingEnabled()
{
  return MEMORY[0x24BED2360]();
}

uint64_t _AXSOpaqueTouchTapSpeed()
{
  return MEMORY[0x24BED2368]();
}

uint64_t _AXSRedGreenFilterEnabled()
{
  return MEMORY[0x24BED23D8]();
}

uint64_t _AXSRedGreenFilterSetEnabled()
{
  return MEMORY[0x24BED23E0]();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return MEMORY[0x24BED23F0]();
}

uint64_t _AXSScreenFilterApplied()
{
  return MEMORY[0x24BED2400]();
}

uint64_t _AXSScreenFilterSetShowInitialAlert()
{
  return MEMORY[0x24BED2408]();
}

uint64_t _AXSSetAccessibilityHasNoticedOpaqueTouchDevice()
{
  return MEMORY[0x24BED2410]();
}

uint64_t _AXSSetAutomationEnabled()
{
  return MEMORY[0x24BED2430]();
}

uint64_t _AXSSetCacheForBrightnessFilter()
{
  return MEMORY[0x24BED2440]();
}

uint64_t _AXSSetReduceWhitePointEnabled()
{
  return MEMORY[0x24BED24B0]();
}

uint64_t _AXSSetTripleClickOptions()
{
  return MEMORY[0x24BED24C8]();
}

uint64_t _AXSSetWriteableClient()
{
  return MEMORY[0x24BED24E0]();
}

uint64_t _AXSSlowKeysAcceptanceDelay()
{
  return MEMORY[0x24BED24F8]();
}

uint64_t _AXSSlowKeysEnabled()
{
  return MEMORY[0x24BED2500]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x24BED2518]();
}

uint64_t _AXSSpeakThisSetHighlightVisible()
{
  return MEMORY[0x24BED2528]();
}

uint64_t _AXSSpeechSettingsSetDisabledByManagedConfiguration()
{
  return MEMORY[0x24BED2530]();
}

uint64_t _AXSTripleClickAddOption()
{
  return MEMORY[0x24BED2548]();
}

uint64_t _AXSTripleClickContainsOption()
{
  return MEMORY[0x24BED2550]();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return MEMORY[0x24BED2558]();
}

uint64_t _AXSTripleClickRemoveOption()
{
  return MEMORY[0x24BED2560]();
}

uint64_t _AXSTwiceRemoteScreenEnabled()
{
  return MEMORY[0x24BED2568]();
}

uint64_t _AXSTwiceRemoteScreenSetEnabled()
{
  return MEMORY[0x24BED2578]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x24BED25B8]();
}

uint64_t _AXSVoiceOverTouchSetUIEnabled()
{
  return MEMORY[0x24BED25E8]();
}

uint64_t _AXSVoiceOverTouchSetUsageConfirmed()
{
  return MEMORY[0x24BED25F0]();
}

uint64_t _AXSVoiceOverTouchUsageConfirmed()
{
  return MEMORY[0x24BED2618]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x24BED2650]();
}

uint64_t _AXSZoomTouchSetEnabled()
{
  return MEMORY[0x24BED2658]();
}

uint64_t _AXSetPreferenceWithNotification()
{
  return MEMORY[0x24BED2660]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x24BDFE548]();
}

uint64_t _AXUIElementRegisterSystemWideServerBroadcastRelayerCallback()
{
  return MEMORY[0x24BDFED70]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BDFE550]();
}

uint64_t __UIAccessibilityCastAsProtocol()
{
  return MEMORY[0x24BDFE558]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BDFE5C0]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2E0](*(_QWORD *)&bp, service_name, sp);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

void launch_data_dict_iterate(const launch_data_t ldict, launch_data_dict_iterator_t iterator, void *ctx)
{
  MEMORY[0x24BDAE9B8](ldict, iterator, ctx);
}

void launch_data_free(launch_data_t ld)
{
  MEMORY[0x24BDAE9C0](ld);
}

launch_data_type_t launch_data_get_type(const launch_data_t ld)
{
  return MEMORY[0x24BDAE9F0](ld);
}

launch_data_t launch_data_new_string(const char *val)
{
  return (launch_data_t)MEMORY[0x24BDAE9F8](val);
}

launch_data_t launch_msg(const launch_data_t request)
{
  return (launch_data_t)MEMORY[0x24BDAEA00](request);
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
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

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

