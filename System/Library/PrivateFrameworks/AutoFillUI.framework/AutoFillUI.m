uint64_t AFTextContentTypeIsInCellularSet(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("esim-eid")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("esim-imei"));

  return v2;
}

id _AFUIApplicationClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUIApplicationClass;
}

uint64_t AFTextContentTypeIsInContactSet(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B300]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B3A0]) & 1) != 0
    || (AFTextContentTypeIsInNameSet(v1) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B320]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B368]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B398]) & 1) != 0
    || (AFTextContentTypeIsInAddressSet(v1) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = AFTextContentTypeIsInBirthdaySet(v1);
  }

  return v2;
}

uint64_t AFTextContentTypeIsInBirthdaySet(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B2D0]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B2D8]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B2E0]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B2E8]);
  }

  return v2;
}

uint64_t AFTextContentTypeIsInNameSet(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B330]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B318]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B308]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B328]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B338]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B340]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B350]);
  }

  return v2;
}

uint64_t AFTextContentTypeIsInAddressSet(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B310]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B380]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B388]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B2B8]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B2C8]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B2C0]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B390]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B2F0]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B378]);
  }

  return v2;
}

id _AFUITraitsClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUITraitsClass;
}

id _AFUISecureTextFieldClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUISecureTextFieldClass;
}

void sub_236DB1264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AFUIServiceDelegateOSLogFacility()
{
  if (AFUIServiceDelegateOSLogFacility_onceToken != -1)
    dispatch_once(&AFUIServiceDelegateOSLogFacility_onceToken, &__block_literal_global_4);
  return (id)AFUIServiceDelegateOSLogFacility_logFacility;
}

uint64_t AFUITextSignalsFoundInKeywordsList(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a1;
  v4 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __AFUITextSignalsFoundInKeywordsList_block_invoke;
  v8[3] = &unk_250856C78;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_236DB229C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AFUIResponderIsExemptFromDetectionHints(Class aClass)
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (AFUIResponderIsExemptFromDetectionHints_onceToken == -1)
  {
    if (aClass)
    {
LABEL_3:
      v2 = (void *)AFUIResponderIsExemptFromDetectionHints__exemptClasses;
      NSStringFromClass(aClass);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v2, "containsObject:", v3);

      return v4;
    }
  }
  else
  {
    dispatch_once(&AFUIResponderIsExemptFromDetectionHints_onceToken, &__block_literal_global_41);
    if (aClass)
      goto LABEL_3;
  }
  return 0;
}

id _AFUIUIAppLocalizedStringWithDefaultValue(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "bundleForClass:", _AFUIApplicationClass());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, v4, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id _AFUITraitsProtocol()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUITraitsProtocol;
}

id _AFUITextViewClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUITextViewClass;
}

uint64_t _AFUITaskHasEntitlement(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  CFTypeID v4;
  uint64_t v5;

  (*(void (**)(uint64_t))(a2 + 16))(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (v4 = CFGetTypeID(v2), v4 == CFBooleanGetTypeID()))
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

id _AFUIResponderClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUIResponderClass;
}

id _AFUICopyValueForEntitlementUsingTaskCreationBlock(void *a1, uint64_t a2)
{
  uint64_t (*v3)(uint64_t);
  __CFString *v4;
  __SecTask *v5;
  __SecTask *v6;
  void *v7;
  CFErrorRef error;

  v3 = *(uint64_t (**)(uint64_t))(a2 + 16);
  v4 = a1;
  v5 = (__SecTask *)v3(a2);
  if (v5)
  {
    v6 = v5;
    error = 0;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, v4, &error);

    if (error)
    {
      NSLog(CFSTR("Unable to get entitlements for client task. Error: %@"), error);
      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    NSLog(CFSTR("Unable to create security task for checking entitlement %@"), v4);

    v7 = 0;
  }
  return v7;
}

uint64_t AFUISelfTaskHasEntitlement(void *a1)
{
  id v1;
  id v2;
  uint64_t HasEntitlement;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __AFUISelfTaskHasEntitlement_block_invoke;
  v5[3] = &unk_250856E90;
  v6 = v1;
  v2 = v1;
  HasEntitlement = _AFUITaskHasEntitlement((uint64_t)v2, (uint64_t)v5);

  return HasEntitlement;
}

void sub_236DB5000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236DB5454(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_236DB5638(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_236DB5A08(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_236DB5B28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_236DB7504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_236DB76C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236DB7898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236DB7BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

uint64_t _AFUIShouldDisableDetectingNonInteractiveFields()
{
  if (_AFUIShouldDisableDetectingNonInteractiveFields_onceToken != -1)
    dispatch_once(&_AFUIShouldDisableDetectingNonInteractiveFields_onceToken, &__block_literal_global_3);
  return _AFUIShouldDisableDetectingNonInteractiveFields_disableDetectingNonInteractiveFields;
}

id AFUIPanelOSLogFacility()
{
  if (AFUIPanelOSLogFacility_onceToken != -1)
    dispatch_once(&AFUIPanelOSLogFacility_onceToken, &__block_literal_global_3);
  return (id)AFUIPanelOSLogFacility_logFacility;
}

id AFUIAutoFillPopoverControllerOSLogFacility()
{
  if (AFUIAutoFillPopoverControllerOSLogFacility_onceToken != -1)
    dispatch_once(&AFUIAutoFillPopoverControllerOSLogFacility_onceToken, &__block_literal_global_5);
  return (id)AFUIAutoFillPopoverControllerOSLogFacility_logFacility;
}

uint64_t AFKeyboardTypeIsNumberPad(unsigned int a1)
{
  return (a1 < 0xE) & (0x2930u >> a1);
}

uint64_t AFTextContentTypeExpectsNumberPads(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("one-time-code")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B398]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B378]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B2F8]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-csc")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-exp")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-exp-month")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("cc-exp-year"));
  }

  return v2;
}

void sub_236DB9264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_236DBA024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236DBA140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236DBA5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  uint64_t v56;

  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose((const void *)(v56 - 136), 8);
  _Unwind_Resume(a1);
}

id get_SFAppPasswordSavingViewControllerClass()
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
  v0 = (void *)get_SFAppPasswordSavingViewControllerClass_softClass;
  v7 = get_SFAppPasswordSavingViewControllerClass_softClass;
  if (!get_SFAppPasswordSavingViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_SFAppPasswordSavingViewControllerClass_block_invoke;
    v3[3] = &unk_250856CE0;
    v3[4] = &v4;
    __get_SFAppPasswordSavingViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236DBADD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_SFAppAutoFillPasswordViewControllerClass()
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
  v0 = (void *)get_SFAppAutoFillPasswordViewControllerClass_softClass;
  v7 = get_SFAppAutoFillPasswordViewControllerClass_softClass;
  if (!get_SFAppAutoFillPasswordViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_SFAppAutoFillPasswordViewControllerClass_block_invoke;
    v3[3] = &unk_250856CE0;
    v3[4] = &v4;
    __get_SFAppAutoFillPasswordViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236DBB760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236DBBC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AFUIIsAppleApp()
{
  if (AFUIIsAppleApp_onceToken != -1)
    dispatch_once(&AFUIIsAppleApp_onceToken, &__block_literal_global_6);
  return AFUIIsAppleApp_isAppleApp;
}

BOOL AFUICanDisplayAllSuggestions()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if ((v1 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0;
  objc_msgSend(MEMORY[0x24BEBDB58], "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass") != 1;

  return v4;
}

uint64_t AFUICopyValueForEntitlementFromSelf(void *a1)
{
  _AFUICopyValueForEntitlementUsingTaskCreationBlock(a1, (uint64_t)&__block_literal_global_55);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t AFTextContentTypeIsInPhoneSet(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B398]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("tel-national")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("tel-country-code")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("tel-area-code")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("tel-local")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("tel-extension"));
  }

  return v2;
}

uint64_t AFTextContentTypeIsInCreditCardSet(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B2F8]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-name")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-given-name")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-additional-name")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-family-name")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-csc")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-exp")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-exp-month")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("cc-exp-year")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("cc-type"));
  }

  return v2;
}

uint64_t AFTextContentTypeIsInJobSet(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B368]) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE0B320]);

  return v2;
}

id AFUIPreferredSubtitleOrder()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[16];

  v8[15] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE0B318];
  v8[0] = *MEMORY[0x24BE0B330];
  v8[1] = v0;
  v1 = *MEMORY[0x24BE0B308];
  v8[2] = *MEMORY[0x24BE0B328];
  v8[3] = v1;
  v2 = *MEMORY[0x24BE0B380];
  v8[4] = *MEMORY[0x24BE0B310];
  v8[5] = v2;
  v3 = *MEMORY[0x24BE0B2B8];
  v8[6] = *MEMORY[0x24BE0B388];
  v8[7] = v3;
  v4 = *MEMORY[0x24BE0B2C0];
  v8[8] = *MEMORY[0x24BE0B2C8];
  v8[9] = v4;
  v5 = *MEMORY[0x24BE0B2F0];
  v8[10] = *MEMORY[0x24BE0B390];
  v8[11] = v5;
  v6 = *MEMORY[0x24BE0B398];
  v8[12] = *MEMORY[0x24BE0B378];
  v8[13] = v6;
  v8[14] = *MEMORY[0x24BE0B300];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 15);
  return (id)objc_claimAutoreleasedReturnValue();
}

void _AFUICacheRuntimeObjects()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
}

id _AFUIColorClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUIColorClass;
}

id _AFUIFontClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUIFontClass;
}

id _AFUIViewClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUIViewClass;
}

id _AFUIViewControllerClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUIViewControllerClass;
}

id _AFUINavigationControllerClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUINavigationControllerClass;
}

id _AFUITextFieldClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUITextFieldClass;
}

id _AFUIButtonClass()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUIButtonClass;
}

id _AFUITextInputProtocol()
{
  if (_AFUICacheRuntimeObjects_onceToken != -1)
    dispatch_once(&_AFUICacheRuntimeObjects_onceToken, &__block_literal_global_7);
  return (id)__AFUITextInputProtocol;
}

void sub_236DBE344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236DBE8F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236DBEFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFSafariCreditCardStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SafariFoundationLibraryCore_frameworkLibrary)
  {
    SafariFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SafariFoundationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFSafariCreditCardStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSFSafariCreditCardStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getSFSafariCreditCardStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_236DBF7F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
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

void __isAutoFillPanelAlwaysBlockedForBundleID_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.SafariViewService"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isAutoFillPanelAlwaysBlockedForBundleID_blockedBundleIDs;
  isAutoFillPanelAlwaysBlockedForBundleID_blockedBundleIDs = v0;

}

void __isAutoFillPanelAlwaysAllowedForBundleID_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.quicklook"), CFSTR("com.apple.quicklook.extension.previewUI"), CFSTR("com.apple.quicklook.UIExtension"), CFSTR("com.apple.mobilenotes"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isAutoFillPanelAlwaysAllowedForBundleID_allowedBundleIDs;
  isAutoFillPanelAlwaysAllowedForBundleID_allowedBundleIDs = v0;

}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  NSObject *v5;

  _os_log_debug_impl(a1, v5, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_8(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0xCu);
}

void sub_236DC42AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236DC471C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_236DC48E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_236DC6730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_236DC6CC0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_236DC6E78(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_236DC73FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236DC7B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_0_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0xCu);
}

uint64_t __getSFSafariCreditCardStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AFUIServiceDelegate _queueTextOperations:forSecureAppID:processID:completionHandler:].cold.1(v0);
}

uint64_t BKSHIDServicesGetCALayerTransform()
{
  return MEMORY[0x24BE0B5B8]();
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x24BDE54E0]();
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x24BDE55A8](retstr, t);
}

uint64_t CA_CGRectApplyTransform()
{
  return MEMORY[0x24BDE5618]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x24BDD11B8](namestr);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

uint64_t UIPointIsDiscrete()
{
  return MEMORY[0x24BEBE608]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x24BEBE6B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x24BDBD090]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

