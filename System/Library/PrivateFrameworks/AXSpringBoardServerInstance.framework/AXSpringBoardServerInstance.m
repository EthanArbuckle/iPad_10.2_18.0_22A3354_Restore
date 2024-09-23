id AXSBApplicationControllerInstance()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)AXSBApplicationControllerInstance_AX_SBApplicationController;
  if (!AXSBApplicationControllerInstance_AX_SBApplicationController)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBApplicationController")), "safeValueForKey:", CFSTR("sharedInstance"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)AXSBApplicationControllerInstance_AX_SBApplicationController;
    AXSBApplicationControllerInstance_AX_SBApplicationController = v1;

    v0 = (void *)AXSBApplicationControllerInstance_AX_SBApplicationController;
  }
  return v0;
}

void _appTransitionOccurred()
{
  id v0;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "springBoardActionOccurred:", 3);

}

void sub_21AC7AF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id AXSBApplicationWithIdentifier(void *a1)
{
  id v1;
  id v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  v3 = a1;
  AXPerformSafeBlock();
  v1 = (id)v5[5];

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21AC7B074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC7B50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t screenDidDim(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    return AXPerformSafeBlock();
  return result;
}

uint64_t __screenDidDim_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lockStateChanged");
}

id SBAXLocalizedString(void *a1)
{
  return SBAXLocalizedStringWithTable(a1, CFSTR("Accessibility"));
}

id SBAXLocalizedStringWithTable(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  v3 = SBAXLocalizedStringWithTable_onceToken;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&SBAXLocalizedStringWithTable_onceToken, &__block_literal_global_0);
  objc_msgSend((id)SBAXLocalizedStringWithTable_AXBundle, "localizedStringForKey:value:table:", v5, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL AXSpringBoardIsReadyToBeProbed()
{
  void *v0;
  _BOOL8 v1;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBMainWorkspace")), "safeValueForKey:", CFSTR("_instanceIfExists"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0 != 0;

  return v1;
}

id SBAXBacklightControllerInstance()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)SBAXBacklightControllerInstance_SharedInstance;
  if (!SBAXBacklightControllerInstance_SharedInstance)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBBacklightController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)SBAXBacklightControllerInstance_SharedInstance;
    SBAXBacklightControllerInstance_SharedInstance = v1;

    v0 = (void *)SBAXBacklightControllerInstance_SharedInstance;
  }
  return v0;
}

uint64_t AXSpringBoardGlueSBLockScreenControllerInstance()
{
  Class v0;

  v0 = (Class)AXSpringBoardGlueSBLockScreenControllerInstance_class;
  if (!AXSpringBoardGlueSBLockScreenControllerInstance_class)
  {
    v0 = NSClassFromString(CFSTR("SBLockScreenManager"));
    AXSpringBoardGlueSBLockScreenControllerInstance_class = (uint64_t)v0;
  }
  return -[objc_class safeValueForKey:](v0, "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
}

id AXSBUIControllerSharedInstance()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
  if (!AXSBUIControllerSharedInstance_SharedInstance)
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBUIController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
    AXSBUIControllerSharedInstance_SharedInstance = v1;

    v0 = (void *)AXSBUIControllerSharedInstance_SharedInstance;
  }
  return v0;
}

id AXSBLockScreenEnvironment()
{
  Class v0;
  void *v1;
  void *v2;

  v0 = (Class)AXSpringBoardGlueSBLockScreenControllerInstance_class;
  if (!AXSpringBoardGlueSBLockScreenControllerInstance_class)
  {
    v0 = NSClassFromString(CFSTR("SBLockScreenManager"));
    AXSpringBoardGlueSBLockScreenControllerInstance_class = (uint64_t)v0;
  }
  -[objc_class safeValueForKey:](v0, "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("_lockScreenEnvironment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
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

id AXSBLockScreenViewController()
{
  void *v0;
  void *v1;

  AXSBLockScreenEnvironment();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("rootViewController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_21AC7E5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AC815E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21AC8257C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC82744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC829F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC82B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC83300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC83430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC83ADC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21AC83EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC840D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC841B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC84264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SBAXIsViewVisible(void *a1)
{
  id v1;
  uint64_t v2;
  double v3;
  _BOOL4 v4;
  double v5;

  v1 = a1;
  if ((objc_msgSend(v1, "isHidden") & 1) != 0 || (objc_msgSend(v1, "isHiddenOrHasHiddenAncestor") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_msgSend(v1, "window"), v2 = objc_claimAutoreleasedReturnValue(), (id)v2, v2))
    {
      objc_msgSend(v1, "frame");
      v4 = fabs(v3) >= 0.001;
      v2 = fabs(v5) >= 0.001 && v4;
    }
  }

  return v2;
}

void sub_21AC844A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC84580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC84704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC849E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC84C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC84E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC85018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8511C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8557C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC856F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC85850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC85990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC85A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC85C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC85EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC860B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC861E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC86334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC86498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC86B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC86CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC86DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC86F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC877D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC87ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC884E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC885C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_21AC886F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC887E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC888F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC88A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC88B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC88C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC88DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHUComfortSoundsSettingsClass()
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
  v0 = (void *)getHUComfortSoundsSettingsClass_softClass;
  v7 = getHUComfortSoundsSettingsClass_softClass;
  if (!getHUComfortSoundsSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getHUComfortSoundsSettingsClass_block_invoke;
    v3[3] = &unk_24DDE5AC8;
    v3[4] = &v4;
    __getHUComfortSoundsSettingsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21AC88FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC898CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC89DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8A764(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21AC8AE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8AF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8B27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8B5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8C5C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21AC8CC18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21AC8D450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8D570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8D68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8D790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8D8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8D9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8DB48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8DCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8E3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8E4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8E5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8E700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8E824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC8EA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSiriSimpleActivationSourceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SiriActivationLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24DDE6330;
    v5 = 0;
    SiriActivationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SiriActivationLibraryCore_frameworkLibrary)
    __getSiriSimpleActivationSourceClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SiriSimpleActivationSource");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSiriSimpleActivationSourceClass_block_invoke_cold_2();
  getSiriSimpleActivationSourceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24DDE6348;
    v5 = 0;
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PassKitCoreLibraryCore_frameworkLibrary)
    __getPKPassLibraryClass_block_invoke_cold_1(&v3);
  result = objc_getClass("PKPassLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPKPassLibraryClass_block_invoke_cold_2();
  getPKPassLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHUComfortSoundsSettingsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!HearingUtilitiesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24DDE6360;
    v5 = 0;
    HearingUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HearingUtilitiesLibraryCore_frameworkLibrary)
    __getHUComfortSoundsSettingsClass_block_invoke_cold_1(&v3);
  result = objc_getClass("HUComfortSoundsSettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHUComfortSoundsSettingsClass_block_invoke_cold_2();
  getHUComfortSoundsSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSOSManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SOSLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24DDE6378;
    v5 = 0;
    SOSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SOSLibraryCore_frameworkLibrary)
    __getSOSManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SOSManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSOSManagerClass_block_invoke_cold_2();
  getSOSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXRemoteViewServiceAdaptorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!AccessibilityRemoteUIServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24DDE6390;
    v5 = 0;
    AccessibilityRemoteUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityRemoteUIServicesLibraryCore_frameworkLibrary)
    __getAXRemoteViewServiceAdaptorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AXRemoteViewServiceAdaptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXRemoteViewServiceAdaptorClass_block_invoke_cold_2();
  getAXRemoteViewServiceAdaptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXPISystemActionHelperClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24DDE63A8;
    v5 = 0;
    AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
    __getAXPISystemActionHelperClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AXPISystemActionHelper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXPISystemActionHelperClass_block_invoke_cold_2();
  getAXPISystemActionHelperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
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

void sub_21AC945A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
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

void sub_21AC94D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  uint64_t v61;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose((const void *)(v61 - 224), 8);
  _Block_object_dispose((const void *)(v61 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21AC953FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void callStateChanged(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = a2;
    v3 = v4;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

void incomingCallStateChanged(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = a2;
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "callAudioRoutingAutoAnswerEnabled");

    if (UIAccessibilityIsVoiceOverRunning())
    {
      objc_msgSend(v3, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isRingerMutedWithServerInstance:", v3);

      if ((v7 & 1) == 0)
        AXPerformBlockOnMainThread();
    }
    if (!v5)
      goto LABEL_19;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__2;
    v40 = __Block_byref_object_dispose__2;
    v41 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__2;
    v34 = __Block_byref_object_dispose__2;
    v35 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    AXPerformBlockSynchronouslyOnMainThread();
    v8 = (void *)v37[5];
    if ((v8 || (v8 = (void *)v31[5]) != 0) && v27[3] == 1)
    {
      v9 = v8;
      if (objc_msgSend(v3, "shouldAllowActiveWatchToAutoAnswer")
        && (objc_msgSend(v9, "isVideo") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "ignoreLogging");

        if ((v19 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v21 = objc_claimAutoreleasedReturnValue();

          v22 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v21, v22))
          {
            AXColorizeFormatLog();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            _AXStringForArgs();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, v22))
            {
              *(_DWORD *)buf = 138543362;
              v43 = v24;
              _os_log_impl(&dword_21AC77000, v21, v22, "%{public}@", buf, 0xCu);
            }

          }
        }

        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(&v30, 8);

        _Block_object_dispose(&v36, 8);
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "callAudioRoutingAutoAnswerDelay");

      v25 = v9;
      AXPerformBlockOnMainThreadAfterDelay();

    }
    objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ignoreLogging");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        AXColorizeFormatLog();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138543362;
          v43 = v17;
          _os_log_impl(&dword_21AC77000, v14, v15, "%{public}@", buf, 0xCu);
        }

      }
    }
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
LABEL_19:

  }
}

void sub_21AC96034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void hidDeviceCallback(void *a1, uint64_t a2, uint64_t a3, __IOHIDDevice *a4)
{
  NSObject *v6;
  uint64_t v7;
  __IOHIDDevice *v8;
  NSObject *v9;
  __IOHIDDevice *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSObject *v21;
  void *context;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  __IOHIDDevice *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  AXLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = a4;
    _os_log_impl(&dword_21AC77000, v6, OS_LOG_TYPE_DEFAULT, "Received assistive device callback: %@", buf, 0xCu);
  }

  if (a4)
  {
    buf[0] = 0;
    objc_opt_class();
    IOHIDDeviceGetProperty(a4, CFSTR("DeviceUsagePairs"));
    __UIAccessibilityCastAsClass();
    v7 = objc_claimAutoreleasedReturnValue();
    if (buf[0])
      abort();
    v8 = (__IOHIDDevice *)v7;
    context = a1;
    AXLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v8;
      _os_log_impl(&dword_21AC77000, v9, OS_LOG_TYPE_DEFAULT, "Usage pairs: %@", buf, 0xCu);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v8;
    v11 = -[__IOHIDDevice countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKey:", CFSTR("DeviceUsage"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "intValue");

          objc_msgSend(v15, "objectForKey:", CFSTR("DeviceUsagePage"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "intValue");

          if (v19 == 9)
          {
            if (objc_msgSend((id)IOHIDDeviceGetProperty(a4, CFSTR("IAPHIDAccessoryCategory")), "intValue") == 7)goto LABEL_26;
          }
          else if (v19 == 1 && v17 == 10)
          {
LABEL_26:

            if (!_AXSAssistiveTouchScannerEnabled())
              _AXSAssistiveTouchScannerSetEnabled();
            if (IOHIDDeviceOpen(a4, 0))
              _AXLogWithFacility();
            IOHIDDeviceRegisterInputValueCallback(a4, (IOHIDValueCallback)inputValueCallback, context);
            goto LABEL_31;
          }
        }
        v12 = -[__IOHIDDevice countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v12)
          continue;
        break;
      }
    }

    if (IOHIDDeviceConformsTo(a4, 1u, 0xBu) || IOHIDDeviceConformsTo(a4, 0x41u, 1u))
    {
      _AXSVoiceOverTouchSetEnabledAndAutoConfirmUsage();
      _AXSVoiceOverTouchSetUIEnabled();
      AXLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AC77000, v21, OS_LOG_TYPE_DEFAULT, "Enabling VoiceOver for a braille display", buf, 2u);
      }

    }
LABEL_31:

  }
}

uint64_t inputValueCallback()
{
  uint64_t result;

  result = _AXSAssistiveTouchScannerEnabled();
  if (!(_DWORD)result)
    return _AXSAssistiveTouchScannerSetEnabled();
  return result;
}

void sub_21AC99598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21AC99784(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_21AC9D718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_21AC9EE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t liveTranscriptionStateChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handleLiveTranscriptionStatusChange");
}

void sub_21ACA0350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ACA0620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __callStateChanged_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = _AXSDefaultRouteForCall();
  if (objc_msgSend(*(id *)(a1 + 32), "hasActiveOrPendingCallOrFaceTime"))
  {
    if ((_DWORD)v2
      || (objc_msgSend(MEMORY[0x24BE4BE70], "sharedInstance"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "pairedHearingAids"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v3,
          v4))
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Switching to default route"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "void callStateChanged(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)_block_invoke", 526, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)*MEMORY[0x24BE4BD78];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_retainAutorelease(v6);
        v9 = v7;
        *(_DWORD *)buf = 136446210;
        v17 = objc_msgSend(v8, "UTF8String");
        _os_log_impl(&dword_21AC77000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_setCallRoute:ifCurrentlyRoutedTo:rampUp:", v2, 0, 0);
    }
  }
  else if (AXPreviousCallRoute)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Call no longer active, switching to previous route"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %@"), "void callStateChanged(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)_block_invoke", 531, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x24BE4BD78];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE4BD78], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v11);
      v14 = v12;
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v13, "UTF8String");
      _os_log_impl(&dword_21AC77000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_setAVCallRoute:rampUp:", AXPreviousCallRoute, 0);
    v15 = (void *)AXPreviousCallRoute;
    AXPreviousCallRoute = 0;

  }
}

void __incomingCallStateChanged_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "incomingCall");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentVideoCall");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v3, "status") == 4)
  {
    v5 = v3;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

void __incomingCallStateChanged_block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id argument;

  v1 = (void *)MEMORY[0x24BDFEA60];
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "axAttributedStringWithString:", v2);
  argument = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(argument, "setAttribute:forKey:", &unk_24DDF50A8, *MEMORY[0x24BDFEAD8]);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBDDB0], argument);

}

void __incomingCallStateChanged_block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incomingCall");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[4] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "incomingVideoCall");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v10, "currentAudioAndVideoCallCount");

}

void __incomingCallStateChanged_block_invoke_1172(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "status") == 4)
  {
    objc_msgSend(MEMORY[0x24BDFE4A8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "ignoreLogging");

    if ((v3 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4A8], "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v5 = objc_claimAutoreleasedReturnValue();

      v6 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v5, v6))
      {
        AXColorizeFormatLog();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 32);
        v11 = objc_msgSend(v10, "status");
        _AXStringForArgs();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, v6))
        {
          *(_DWORD *)buf = 138543362;
          v13 = v8;
          _os_log_impl(&dword_21AC77000, v5, v6, "%{public}@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance", v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "answerCall:", *(_QWORD *)(a1 + 32));

  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void AXSBPrepareWindowForTripleClickSpeaking(void *a1)
{
  void *v1;
  id v2;

  v2 = a1;
  v1 = (void *)_AXSTripleClickCopyOptions();
  if (objc_msgSend(v1, "containsObject:", &unk_24DDF5138) && !UIAccessibilityIsVoiceOverRunning())
    objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("TripleClickAskWindow"));

}

void sub_21ACA3A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_21ACA4298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ACA46F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ACA4A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Block_object_dispose((const void *)(v33 - 96), 8);
  _Block_object_dispose((const void *)(v33 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21ACA57A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ACA593C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21ACA5DA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_21ACA609C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SpringBoardHomeLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!SpringBoardHomeLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24DDE6C80;
    v3 = 0;
    SpringBoardHomeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardHomeLibraryCore_frameworkLibrary)
    SpringBoardHomeLibrary_cold_1(&v1);
  return SpringBoardHomeLibraryCore_frameworkLibrary;
}

void _UIAXLoadVisualAlertsBundle()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  if ((_UIAXLoadVisualAlertsBundle_didLoad & 1) == 0)
  {
    v0 = (void *)MEMORY[0x24BDD1488];
    AXSystemRootDirectory();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("/System/Library/AccessibilityBundles/VisualAlerts.bundle"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "bundleWithPath:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v3, "isLoaded") & 1) == 0)
    {
      objc_msgSend(v3, "load");
      _UIAXLoadVisualAlertsBundle_didLoad = 1;
    }

  }
}

uint64_t _accessibilityiTunesSettings()
{
  return +[AXSBSettingsLoader checkAccessibilityOptions](AXSBSettingsLoader, "checkAccessibilityOptions");
}

uint64_t _accessibilityCheckContrast()
{
  return +[AXSBSettingsLoader checkScreenContrast](AXSBSettingsLoader, "checkScreenContrast");
}

void _accessibilityVisualAlertChanged()
{
  if (_AXSVisualAlertEnabled())
  {
    if (_accessibilityHasCameraFlash())
      _UIAXLoadVisualAlertsBundle();
  }
}

void _accessibilityEnhanceTextLegibilityChanged()
{
  if (_accessibilityEnhanceTextLegibilityChanged_onceToken != -1)
    dispatch_once(&_accessibilityEnhanceTextLegibilityChanged_onceToken, &__block_literal_global_528);
  dispatch_async((dispatch_queue_t)_accessibilityEnhanceTextLegibilityChanged_KeyboardPurgeQueue, &__block_literal_global_530);
}

BOOL _accessibilityHasCameraFlash()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;
  _BOOL8 v3;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (!v0)
    return 0;
  v1 = v0;
  v2 = CFGetTypeID(v0);
  v3 = v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  return v3;
}

id _accessibilityInitializeSpeakTypingServer()
{
  id result;

  if (_AXSWordFeedbackEnabled())
    return (id)objc_msgSend(MEMORY[0x24BEAFEA0], "sharedInstance");
  if (_AXSLetterFeedbackEnabled())
    return (id)objc_msgSend(MEMORY[0x24BEAFEA0], "sharedInstance");
  result = (id)_AXSPhoneticFeedbackEnabled();
  if ((_DWORD)result)
    return (id)objc_msgSend(MEMORY[0x24BEAFEA0], "sharedInstance");
  return result;
}

uint64_t _accessibilityTripleHomeEnabled()
{
  return objc_msgSend((id)_AXSettingsLoaderDelegate, "_updateAXSettings");
}

void sub_21ACA82D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id deviceUsagePairs(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;
  id *v11;
  id v12;
  id *v14;

  v9 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id *)&a9;
  if (v9)
  {
    do
    {
      objc_msgSend(v10, "addObject:", v9);
      v11 = v14++;
      v12 = *v11;

      v9 = v12;
    }
    while (v12);
  }
  return v10;
}

void _homeButtonBreakageMessageHandler(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ignoreLogging");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v7, v8))
    {
      AXColorizeFormatLog();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v10;
        _os_log_impl(&dword_21AC77000, v7, v8, "%{public}@", buf, 0xCu);
      }

    }
  }
  if (a3 == -536870608)
  {
    objc_msgSend(MEMORY[0x24BDFE4B0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "ignoreLogging");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFE4B0], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        AXColorizeFormatLog();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138543362;
          v19 = v17;
          _os_log_impl(&dword_21AC77000, v14, v15, "%{public}@", buf, 0xCu);
        }

      }
    }
    objc_msgSend((id)objc_opt_class(), "_checkForHomeButtonBreakage:", 0);
  }
}

uint64_t _voiceOverVibrateEnable(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_showVibrationVoiceOverEnablerView");
}

uint64_t _voiceOverSwipeEnable(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_showSwipeDetectionEnablerView");
}

void ___accessibilityEnhanceTextLegibilityChanged_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("AXKeyboardPurgeQueue", 0);
  v1 = (void *)_accessibilityEnhanceTextLegibilityChanged_KeyboardPurgeQueue;
  _accessibilityEnhanceTextLegibilityChanged_KeyboardPurgeQueue = (uint64_t)v0;

}

void *sub_21ACAB080()
{
  return &unk_255114E30;
}

uint64_t static HearingActivityContentState.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_21ACAB0AC()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_21ACAB0E8()
{
  return 1;
}

uint64_t sub_21ACAB100()
{
  return 0;
}

uint64_t sub_21ACAB10C()
{
  return sub_21ACB3360();
}

uint64_t sub_21ACAB134()
{
  return sub_21ACAB10C();
}

uint64_t sub_21ACAB148@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21ACAB0AC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21ACAB178()
{
  return sub_21ACAB100();
}

uint64_t sub_21ACAB190@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21ACAB0E8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21ACAB1C0()
{
  sub_21ACABC1C();
  return sub_21ACB3474();
}

uint64_t sub_21ACAB1EC()
{
  sub_21ACABC1C();
  return sub_21ACB3480();
}

uint64_t HearingActivityContentState.encode(to:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;

  v3 = a1;
  v10 = 0;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255114E90);
  v7 = *(_QWORD *)(v9 - 8);
  v4 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (char *)&v2 - v4;
  v10 = (_QWORD *)MEMORY[0x24BDAC7A8](v3);
  v5 = v10[3];
  v6 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v5);
  sub_21ACABC1C();
  sub_21ACB3468();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v8, v9);
}

uint64_t HearingActivityContentState.hashValue.getter()
{
  sub_21ACABD48();
  return sub_21ACB3420();
}

uint64_t HearingActivityContentState.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_21ACAB35C()
{
  return HearingActivityContentState.hashValue.getter();
}

void sub_21ACAB370()
{
  HearingActivityContentState.hash(into:)();
}

uint64_t sub_21ACAB384()
{
  return sub_21ACB3348();
}

uint64_t sub_21ACAB398(uint64_t a1)
{
  return HearingActivityContentState.init(from:)(a1);
}

uint64_t sub_21ACAB3EC(uint64_t a1)
{
  return HearingActivityContentState.encode(to:)(a1);
}

uint64_t sub_21ACAB434()
{
  return static HearingActivityContentState.== infix(_:_:)() & 1;
}

uint64_t sub_21ACAB44C()
{
  return sub_21ACB3228();
}

uint64_t sub_21ACAB468(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;

  v3 = a1;
  v10 = 0;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255115188);
  v7 = *(_QWORD *)(v9 - 8);
  v4 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (char *)&v2 - v4;
  v10 = (_QWORD *)MEMORY[0x24BDAC7A8](v3);
  v5 = v10[3];
  v6 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v5);
  sub_21ACABE1C();
  sub_21ACB3468();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v8, v9);
}

uint64_t sub_21ACAB548(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_21ACAB578()
{
  sub_21ACABE1C();
  return sub_21ACB3474();
}

uint64_t sub_21ACAB5A4()
{
  sub_21ACABE1C();
  return sub_21ACB3480();
}

uint64_t sub_21ACAB5D0(uint64_t a1)
{
  return sub_21ACAB548(a1);
}

uint64_t sub_21ACAB624(uint64_t a1)
{
  return sub_21ACAB468(a1);
}

uint64_t sub_21ACAB678()
{
  swift_allocObject();
  return sub_21ACAB6B0();
}

uint64_t sub_21ACAB6B0()
{
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255114EA8);
  *(_QWORD *)(v1 + 16) = sub_21ACB32F4();
  sub_21ACB3240();
  sub_21ACB3324();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255114EB0);
  sub_21ACABE88();
  sub_21ACB33C0();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255114EC0);
    sub_21ACB3444();
    if (!v2)
      break;
    sub_21ACAB984();
    swift_release();
  }
  sub_21ACABF6C();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_21ACAB7DC()
{
  uint64_t result;

  type metadata accessor for ActivityStore();
  result = sub_21ACAB678();
  qword_255114E40 = result;
  return result;
}

uint64_t *sub_21ACAB80C()
{
  if (qword_255114E38 != -1)
    swift_once();
  return &qword_255114E40;
}

uint64_t sub_21ACAB860()
{
  uint64_t v0;
  uint64_t v2;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 16);
  sub_21ACB3324();
  swift_endAccess();
  return v2;
}

uint64_t sub_21ACAB8AC(uint64_t a1)
{
  uint64_t v1;

  sub_21ACB3324();
  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21ACAB908())()
{
  swift_beginAccess();
  return sub_21ACAB948;
}

uint64_t sub_21ACAB948()
{
  return swift_endAccess();
}

uint64_t sub_21ACAB984()
{
  sub_21ACB324C();
  swift_retain();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255114EC8);
  sub_21ACB333C();
  return swift_endAccess();
}

uint64_t sub_21ACABA4C()
{
  uint64_t v1;

  sub_21ACABF6C();
  return v1;
}

uint64_t sub_21ACABA7C()
{
  sub_21ACABA4C();
  return swift_deallocClassInstance();
}

uint64_t sub_21ACABAB8()
{
  uint64_t result;

  type metadata accessor for HearingActivityGateway();
  result = sub_21ACABAE8();
  qword_255115AC0 = result;
  return result;
}

uint64_t sub_21ACABAE8()
{
  swift_allocObject();
  return sub_21ACAC01C();
}

uint64_t *sub_21ACABB20()
{
  if (qword_255114E48 != -1)
    swift_once();
  return &qword_255115AC0;
}

uint64_t sub_21ACABB74()
{
  uint64_t v0;
  uint64_t v2;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 16);
  swift_retain();
  swift_endAccess();
  return v2;
}

uint64_t sub_21ACABBC0(uint64_t a1)
{
  uint64_t v1;

  swift_retain();
  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

unint64_t sub_21ACABC1C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255114E88;
  if (!qword_255114E88)
  {
    v0 = MEMORY[0x220756100](&unk_21ACB6F48, &unk_24DDE71F8);
    atomic_store(v0, (unint64_t *)&qword_255114E88);
    return v0;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x2207560E8]((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(*(_QWORD *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0)
    return (_QWORD *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  return result;
}

unint64_t sub_21ACABD48()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255114E98;
  if (!qword_255114E98)
  {
    v0 = MEMORY[0x220756100](&protocol conformance descriptor for HearingActivityContentState, &type metadata for HearingActivityContentState);
    atomic_store(v0, (unint64_t *)&qword_255114E98);
    return v0;
  }
  return v2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

unint64_t sub_21ACABE1C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255114EA0;
  if (!qword_255114EA0)
  {
    v0 = MEMORY[0x220756100](&unk_21ACB6EF8, &unk_24DDE7238);
    atomic_store(v0, (unint64_t *)&qword_255114EA0);
    return v0;
  }
  return v2;
}

unint64_t sub_21ACABE88()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_255114EB8;
  if (!qword_255114EB8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255114EB0);
    v1 = MEMORY[0x220756100](MEMORY[0x24BEE12E0], v0);
    atomic_store(v1, (unint64_t *)&qword_255114EB8);
    return v1;
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x2207560F4](255, (char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21ACABF6C()
{
  swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ActivityStore()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for HearingActivityGateway()
{
  uint64_t v1;

  v1 = qword_255115068;
  if (!qword_255115068)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_21ACAC01C()
{
  uint64_t v0;
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

  v7 = 0;
  v8 = 0;
  v12 = v0;
  *(_QWORD *)(v0 + 16) = 0;
  sub_21ACB3360();
  sub_21ACB3360();
  sub_21ACB32DC();
  sub_21ACAB80C();
  swift_retain();
  swift_beginAccess();
  sub_21ACB3324();
  swift_endAccess();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255114EA8);
  sub_21ACB3324();
  swift_bridgeObjectRelease();
  v5 = sub_21ACB330C();
  swift_bridgeObjectRelease();
  if (v5 > 0)
  {
    sub_21ACAB80C();
    swift_retain();
    swift_beginAccess();
    sub_21ACB3324();
    swift_endAccess();
    swift_release();
    v3 = sub_21ACB3324();
    swift_bridgeObjectRelease();
    sub_21ACB3324();
    v9 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255114ED0);
    sub_21ACAC3BC();
    sub_21ACB33B4();
    sub_21ACABF6C();
    if (v11)
    {
      v7 = v10;
      v8 = v11;
      swift_bridgeObjectRelease();
      sub_21ACAB80C();
      swift_retain();
      sub_21ACB3324();
      swift_beginAccess();
      sub_21ACB3324();
      swift_endAccess();
      MEMORY[0x220755098](&v6);
      sub_21ACAC42C();
      v2 = v6;
      swift_beginAccess();
      *(_QWORD *)(v4 + 16) = v2;
      swift_release();
      swift_endAccess();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return v4;
}

unint64_t sub_21ACAC3BC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_255114ED8;
  if (!qword_255114ED8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255114ED0);
    v1 = MEMORY[0x220756100](MEMORY[0x24BEE0318], v0);
    atomic_store(v1, (unint64_t *)&qword_255114ED8);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21ACAC42C()
{
  swift_bridgeObjectRelease();
}

uint64_t sub_21ACAC454()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[15] = v0;
  v1[8] = v1;
  v1[9] = 0;
  v1[11] = 0;
  v1[13] = 0;
  v2 = sub_21ACB32E8();
  v1[16] = v2;
  v1[17] = *(_QWORD *)(v2 - 8);
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255114EE8);
  v1[20] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255114EF0);
  v1[21] = v3;
  v1[22] = *(_QWORD *)(v3 - 8);
  v1[23] = swift_task_alloc();
  v4 = sub_21ACB32A0();
  v1[24] = v4;
  v1[25] = *(_QWORD *)(v4 - 8);
  v1[26] = swift_task_alloc();
  v1[9] = v0;
  return swift_task_switch();
}

uint64_t sub_21ACAC590()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
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
  uint8_t *buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint32_t size;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  NSObject *oslog;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;

  v40 = v0[15];
  v0[8] = v0;
  swift_beginAccess();
  v41 = *(_QWORD *)(v40 + 16);
  swift_retain();
  swift_endAccess();
  v0[10] = v41;
  if (v0[10])
  {
    sub_21ACAE104();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v39 + 216) = v6;
    *v6 = *(_QWORD *)(v39 + 64);
    v6[1] = sub_21ACAD378;
    return sub_21ACAE3A8();
  }
  else
  {
    sub_21ACAE104();
    v35 = *(_QWORD *)(v39 + 160);
    v34 = sub_21ACB3288();
    sub_21ACB3450();
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v34 - 8) + 104))(v1, *MEMORY[0x24BDB4840]);
    sub_21ACAE12C();
    sub_21ACB3294();
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255114EA8);
    v3 = nullsub_1(v2);
    nullsub_1(v3);
    sub_21ACAB44C();
    v4 = sub_21ACB3234();
    (*(void (**)(uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v35);
    sub_21ACAE180();
    sub_21ACAE1EC();
    sub_21ACABD48();
    sub_21ACAE16C();
    sub_21ACB32AC();
    v36 = sub_21ACB3360();
    v37 = v5;
    sub_21ACB3264();
    sub_21ACB3450();
    v38 = sub_21ACB3258();
    v21 = *(_QWORD *)(v39 + 184);
    v20 = *(_QWORD *)(v39 + 176);
    v22 = *(_QWORD *)(v39 + 168);
    v8 = *(_QWORD *)(v39 + 152);
    v24 = *(_QWORD *)(v39 + 136);
    v25 = *(_QWORD *)(v39 + 128);
    v23 = *(_QWORD *)(v39 + 120);
    swift_bridgeObjectRelease();
    sub_21ACAE258(v36, v37);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    *(_QWORD *)(v39 + 104) = v38;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v8, v23 + OBJC_IVAR____TtC27AXSpringBoardServerInstance22HearingActivityGateway_logger, v25);
    swift_retain();
    oslog = sub_21ACB32D0();
    v33 = sub_21ACB33D8();
    *(_QWORD *)(v39 + 112) = 12;
    sub_21ACAF3B4();
    sub_21ACAF41C();
    sub_21ACAF484();
    sub_21ACB3378();
    size = *(_DWORD *)(v39 + 228);
    v28 = swift_allocObject();
    *(_BYTE *)(v28 + 16) = 32;
    v29 = swift_allocObject();
    *(_BYTE *)(v29 + 16) = 8;
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = sub_21ACB0A44;
    *(_QWORD *)(v27 + 24) = v38;
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = sub_21ACB09F0;
    *(_QWORD *)(v30 + 24) = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255114F20);
    sub_21ACB3450();
    v31 = v9;
    swift_retain();
    *v31 = sub_21ACB0984;
    v31[1] = v28;
    swift_retain();
    v31[2] = sub_21ACB0984;
    v31[3] = v29;
    swift_retain();
    v31[4] = sub_21ACB0A38;
    v31[5] = v30;
    sub_21ACAE12C();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v33))
    {
      buf = (uint8_t *)sub_21ACB33FC();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255114F28);
      v18 = sub_21ACAF4EC(0);
      v19 = sub_21ACAF4EC(1);
      v42 = buf;
      v43 = v18;
      v44 = v19;
      sub_21ACAF544(2, &v42);
      sub_21ACAF544(1, &v42);
      v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21ACB0984;
      v46 = v28;
      sub_21ACAF558(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
      v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21ACB0984;
      v46 = v29;
      sub_21ACAF558(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
      v45 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21ACB0A38;
      v46 = v30;
      sub_21ACAF558(&v45, (uint64_t)&v42, (uint64_t)&v43, (uint64_t)&v44);
      _os_log_impl(&dword_21AC77000, oslog, v33, "Requested activity (%s) successfully.", buf, size);
      sub_21ACAF59C(v18);
      sub_21ACAF59C(v19);
      sub_21ACB33E4();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    v15 = *(_QWORD *)(v39 + 208);
    v14 = *(_QWORD *)(v39 + 200);
    v16 = *(_QWORD *)(v39 + 192);
    v11 = *(_QWORD *)(v39 + 152);
    v10 = *(_QWORD *)(v39 + 136);
    v12 = *(_QWORD *)(v39 + 128);
    v13 = *(_QWORD *)(v39 + 120);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    swift_retain();
    swift_retain();
    swift_beginAccess();
    *(_QWORD *)(v13 + 16) = v38;
    swift_release();
    swift_endAccess();
    swift_release();
    sub_21ACAB80C();
    swift_retain();
    sub_21ACAB984();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v39 + 64) + 8))();
  }
}

uint64_t sub_21ACAD378()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 64) = *(_QWORD *)v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21ACAD3E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *buf;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  NSObject *oslog;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;

  *(_QWORD *)(v0 + 64) = v0;
  v34 = *(_QWORD *)(v0 + 160);
  v33 = sub_21ACB3288();
  sub_21ACB3450();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v33 - 8) + 104))(v1, *MEMORY[0x24BDB4840]);
  sub_21ACAE12C();
  sub_21ACB3294();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255114EA8);
  v2 = ((uint64_t (*)(void))nullsub_1)();
  nullsub_1(v2);
  sub_21ACAB44C();
  v3 = sub_21ACB3234();
  (*(void (**)(uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v34);
  sub_21ACAE180();
  sub_21ACAE1EC();
  sub_21ACABD48();
  sub_21ACAE16C();
  sub_21ACB32AC();
  v35 = sub_21ACB3360();
  v36 = v4;
  sub_21ACB3264();
  sub_21ACB3450();
  v37 = sub_21ACB3258();
  v19 = *(_QWORD *)(v32 + 184);
  v18 = *(_QWORD *)(v32 + 176);
  v20 = *(_QWORD *)(v32 + 168);
  v5 = *(_QWORD *)(v32 + 152);
  v22 = *(_QWORD *)(v32 + 136);
  v23 = *(_QWORD *)(v32 + 128);
  v21 = *(_QWORD *)(v32 + 120);
  swift_bridgeObjectRelease();
  sub_21ACAE258(v35, v36);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v20);
  *(_QWORD *)(v32 + 104) = v37;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v5, v21 + OBJC_IVAR____TtC27AXSpringBoardServerInstance22HearingActivityGateway_logger, v23);
  swift_retain();
  oslog = sub_21ACB32D0();
  v31 = sub_21ACB33D8();
  *(_QWORD *)(v32 + 112) = 12;
  sub_21ACAF3B4();
  sub_21ACAF41C();
  sub_21ACAF484();
  sub_21ACB3378();
  size = *(_DWORD *)(v32 + 228);
  v26 = swift_allocObject();
  *(_BYTE *)(v26 + 16) = 32;
  v27 = swift_allocObject();
  *(_BYTE *)(v27 + 16) = 8;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = sub_21ACB0A44;
  *(_QWORD *)(v25 + 24) = v37;
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = sub_21ACB09F0;
  *(_QWORD *)(v28 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255114F20);
  sub_21ACB3450();
  v29 = v6;
  swift_retain();
  *v29 = sub_21ACB0984;
  v29[1] = v26;
  swift_retain();
  v29[2] = sub_21ACB0984;
  v29[3] = v27;
  swift_retain();
  v29[4] = sub_21ACB0A38;
  v29[5] = v28;
  sub_21ACAE12C();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v31))
  {
    buf = (uint8_t *)sub_21ACB33FC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255114F28);
    v16 = sub_21ACAF4EC(0);
    v17 = sub_21ACAF4EC(1);
    v38 = buf;
    v39 = v16;
    v40 = v17;
    sub_21ACAF544(2, &v38);
    sub_21ACAF544(1, &v38);
    v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21ACB0984;
    v42 = v26;
    sub_21ACAF558(&v41, (uint64_t)&v38, (uint64_t)&v39, (uint64_t)&v40);
    v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21ACB0984;
    v42 = v27;
    sub_21ACAF558(&v41, (uint64_t)&v38, (uint64_t)&v39, (uint64_t)&v40);
    v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21ACB0A38;
    v42 = v28;
    sub_21ACAF558(&v41, (uint64_t)&v38, (uint64_t)&v39, (uint64_t)&v40);
    _os_log_impl(&dword_21AC77000, oslog, v31, "Requested activity (%s) successfully.", buf, size);
    sub_21ACAF59C(v16);
    sub_21ACAF59C(v17);
    sub_21ACB33E4();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  v13 = *(_QWORD *)(v32 + 208);
  v12 = *(_QWORD *)(v32 + 200);
  v14 = *(_QWORD *)(v32 + 192);
  v9 = *(_QWORD *)(v32 + 152);
  v8 = *(_QWORD *)(v32 + 136);
  v10 = *(_QWORD *)(v32 + 128);
  v11 = *(_QWORD *)(v32 + 120);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_retain();
  swift_retain();
  swift_beginAccess();
  *(_QWORD *)(v11 + 16) = v37;
  swift_release();
  swift_endAccess();
  swift_release();
  sub_21ACAB80C();
  swift_retain();
  sub_21ACAB984();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v32 + 64) + 8))();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21ACAE104()
{
  swift_release();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21ACAE12C()
{
  sub_21ACB3384();
  sub_21ACAF608();
}

double sub_21ACAE16C()
{
  return 0.0;
}

unint64_t sub_21ACAE180()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255114EF8;
  if (!qword_255114EF8)
  {
    v0 = MEMORY[0x220756100](&protocol conformance descriptor for HearingActivityContentState, &type metadata for HearingActivityContentState);
    atomic_store(v0, (unint64_t *)&qword_255114EF8);
    return v0;
  }
  return v2;
}

unint64_t sub_21ACAE1EC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255114F00;
  if (!qword_255114F00)
  {
    v0 = MEMORY[0x220756100](&protocol conformance descriptor for HearingActivityContentState, &type metadata for HearingActivityContentState);
    atomic_store(v0, (unint64_t *)&qword_255114F00);
    return v0;
  }
  return v2;
}

uint64_t sub_21ACAE258(uint64_t a1, unint64_t a2)
{
  return sub_21ACAE2A0(a1, a2);
}

uint64_t sub_21ACAE2A0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 > 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_21ACAE2DC()
{
  uint64_t v1;

  sub_21ACB324C();
  v1 = sub_21ACB3354();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_21ACAE328()
{
  swift_getErrorValue();
  return sub_21ACB345C();
}

uint64_t sub_21ACAE364()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21ACAE3A0()
{
  return sub_21ACAE328();
}

uint64_t sub_21ACAE3A8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[24] = v1;
  v1[25] = 0;
  memset(v1 + 7, 0, 0x28uLL);
  v1[20] = 0;
  v1[21] = 0;
  v2 = sub_21ACB327C();
  v1[27] = v2;
  v1[28] = *(_QWORD *)(v2 - 8);
  v1[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255114EE8);
  v1[30] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255114F38);
  v1[31] = swift_task_alloc();
  v1[25] = v0;
  return swift_task_switch();
}

uint64_t sub_21ACAE494()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v0[24] = v0;
  sub_21ACAB80C();
  swift_retain();
  swift_beginAccess();
  sub_21ACB3324();
  swift_endAccess();
  swift_release();
  v0[32] = __swift_instantiateConcreteTypeFromMangledName(&qword_255114EA8);
  sub_21ACB3324();
  swift_bridgeObjectRelease();
  sub_21ACB3300();
  memcpy(v0 + 7, v0 + 2, 0x28uLL);
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255114F40);
    sub_21ACB3318();
    v10 = v12[18];
    v11 = v12[19];
    v12[33] = v11;
    if (!v11)
      break;
    v12[20] = v10;
    v12[21] = v11;
    v9 = *sub_21ACAB80C();
    swift_retain();
    sub_21ACB3324();
    swift_beginAccess();
    v12[34] = *(_QWORD *)(v9 + 16);
    sub_21ACB3324();
    swift_endAccess();
    v12[22] = v10;
    v12[23] = v11;
    MEMORY[0x220755098]();
    sub_21ACAC42C();
    if (v12[26])
    {
      v7 = v12[31];
      v6 = v12[30];
      v12[35] = v12[26];
      swift_retain();
      sub_21ACAE104();
      v1 = swift_release();
      nullsub_1(v1);
      sub_21ACAB44C();
      v2 = sub_21ACB3234();
      (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v6);
      sub_21ACAE180();
      sub_21ACAE1EC();
      sub_21ACABD48();
      sub_21ACAE16C();
      sub_21ACB32AC();
      v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255114EF0);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v7, 0, 1);
      sub_21ACB3270();
      v8 = (uint64_t (*)(_QWORD, _QWORD))(MEMORY[0x24BDB4738] + (int)*MEMORY[0x24BDB4738]);
      v4 = (_QWORD *)swift_task_alloc();
      v12[36] = v4;
      *v4 = v12[24];
      v4[1] = sub_21ACAE8A4;
      return v8(v12[31], v12[29]);
    }
    sub_21ACAE104();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  sub_21ACB0B14();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v12[24] + 8))();
}

uint64_t sub_21ACAE8A4()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)v0 + 248);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 232);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 224);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 216);
  *(_QWORD *)(*(_QWORD *)v0 + 192) = *(_QWORD *)v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  sub_21ACB0B90(v5);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21ACAE96C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v0[24] = v0;
  while (1)
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255114F40);
    sub_21ACB3318();
    v11 = v0[18];
    v9 = v0[19];
    v0[33] = v9;
    if (!v9)
      break;
    v0[20] = v11;
    v0[21] = v9;
    v10 = *sub_21ACAB80C();
    swift_retain();
    sub_21ACB3324();
    swift_beginAccess();
    v0[34] = *(_QWORD *)(v10 + 16);
    sub_21ACB3324();
    swift_endAccess();
    v0[22] = v11;
    v0[23] = v9;
    MEMORY[0x220755098]();
    sub_21ACAC42C();
    if (v0[26])
    {
      v7 = v0[31];
      v6 = v0[30];
      v0[35] = v0[26];
      swift_retain();
      sub_21ACAE104();
      v1 = swift_release();
      nullsub_1(v1);
      sub_21ACAB44C();
      v2 = sub_21ACB3234();
      (*(void (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v6);
      sub_21ACAE180();
      sub_21ACAE1EC();
      sub_21ACABD48();
      sub_21ACAE16C();
      sub_21ACB32AC();
      v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255114EF0);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v7, 0, 1);
      sub_21ACB3270();
      v8 = (uint64_t (*)(_QWORD, _QWORD))(MEMORY[0x24BDB4738] + (int)*MEMORY[0x24BDB4738]);
      v4 = (_QWORD *)swift_task_alloc();
      v0[36] = v4;
      *v4 = v0[24];
      v4[1] = sub_21ACAE8A4;
      return v8(v0[31], v0[29]);
    }
    sub_21ACAE104();
    swift_bridgeObjectRelease();
    swift_release();
  }
  sub_21ACB0B14();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0[24] + 8))();
}

uint64_t sub_21ACAECA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_21ACAE104();
  v3 = OBJC_IVAR____TtC27AXSpringBoardServerInstance22HearingActivityGateway_logger;
  v1 = sub_21ACB32E8();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3);
  return v4;
}

uint64_t sub_21ACAED08()
{
  sub_21ACAECA8();
  return swift_deallocClassInstance();
}

uint64_t sub_21ACAED48()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_21ACAED74()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 32) = *sub_21ACABB20();
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 40) = v1;
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_21ACAEDF0;
  return sub_21ACAC454();
}

uint64_t sub_21ACAEDF0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_21ACAEED4(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;
  uint64_t v7;

  v2[3] = a2;
  v2[2] = v2;
  v2[4] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 40) = v5;
  *v5 = *(_QWORD *)(v7 + 16);
  v5[1] = sub_21ACAEF58;
  return sub_21ACAED48();
}

uint64_t sub_21ACAEF58()
{
  uint64_t *v0;
  void *v2;
  void (**aBlock)(void);
  uint64_t v4;

  v4 = *v0;
  aBlock = *(void (***)(void))(*v0 + 32);
  v2 = *(void **)(*v0 + 24);
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();

  aBlock[2]();
  _Block_release(aBlock);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v4 + 16) + 8))();
}

uint64_t sub_21ACAEFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  char *v23;

  v17 = a1;
  v16 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255115190);
  v15 = (*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v2);
  v23 = (char *)&v14 - v15;
  v3 = sub_21ACB33A8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v23, 1);
  v18 = 48;
  v19 = 7;
  v4 = swift_allocObject();
  v5 = v16;
  v6 = (_QWORD *)v4;
  v7 = v17;
  v22 = v6;
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v7;
  v6[5] = v5;
  v20 = v6[2];
  v21 = v6[3];
  swift_unknownObjectRetain();
  v8 = swift_allocObject();
  v9 = v21;
  v10 = v22;
  v11 = (_QWORD *)v8;
  v12 = (uint64_t)v23;
  v11[2] = v20;
  v11[3] = v9;
  v11[4] = &unk_2551151A0;
  v11[5] = v10;
  sub_21ACAF76C(v12, (uint64_t)&unk_2551151B0, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_21ACAF11C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_21ACAF148()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 32) = *sub_21ACABB20();
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 40) = v1;
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_21ACAEDF0;
  return sub_21ACAE3A8();
}

uint64_t sub_21ACAF238(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;
  uint64_t v7;

  v2[3] = a2;
  v2[2] = v2;
  v2[4] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 40) = v5;
  *v5 = *(_QWORD *)(v7 + 16);
  v5[1] = sub_21ACAEF58;
  return sub_21ACAF11C();
}

id HearingActivityProxy.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HearingActivityProxy.init()()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for HearingActivityProxy();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

id HearingActivityProxy.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HearingActivityProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_21ACAF3B4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255114F08;
  if (!qword_255114F08)
  {
    v0 = MEMORY[0x220756100](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&qword_255114F08);
    return v0;
  }
  return v2;
}

unint64_t sub_21ACAF41C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255114F10;
  if (!qword_255114F10)
  {
    v0 = MEMORY[0x220756100](MEMORY[0x24BEE4518], MEMORY[0x24BEE44F0]);
    atomic_store(v0, (unint64_t *)&qword_255114F10);
    return v0;
  }
  return v2;
}

unint64_t sub_21ACAF484()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255114F18;
  if (!qword_255114F18)
  {
    v0 = MEMORY[0x220756100](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(v0, (unint64_t *)&qword_255114F18);
    return v0;
  }
  return v2;
}

uint64_t sub_21ACAF4EC(uint64_t a1)
{
  if (a1)
    return sub_21ACB33FC();
  else
    return 0;
}

uint64_t sub_21ACAF544(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21ACAF558(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21ACAF59C(uint64_t result)
{
  if (result)
  {
    sub_21ACB33F0();
    return sub_21ACB33E4();
  }
  return result;
}

void sub_21ACAF608()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t sub_21ACAF614(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  *(_QWORD *)(v3 + 16) = v3;
  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = sub_21ACAF690;
  return v6();
}

uint64_t sub_21ACAF690()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_21ACAF6F0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  *(_QWORD *)(v4 + 16) = v4;
  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v5;
  *v5 = *(_QWORD *)(v4 + 16);
  v5[1] = sub_21ACAF690;
  return v7();
}

uint64_t sub_21ACAF76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;

  v9 = sub_21ACB33A8();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 48))(a1, 1) == 1)
  {
    sub_21ACB1614(a1);
  }
  else
  {
    sub_21ACB339C();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  v5 = *(_QWORD *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v5)
  {
    swift_getObjectType();
    sub_21ACB3390();
    swift_unknownObjectRelease();
  }
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  *(_QWORD *)(v4 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21ACAF98C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_21ACAFA10;
  return v5(a1);
}

uint64_t sub_21ACAFA10()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_21ACAFA74(uint64_t (*a1)(void))
{
  return a1();
}

_QWORD *sub_21ACAFA94(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v8;

  v4 = a4();
  sub_21ACAFB10(v4, v5, a3);
  v8 = *a1;
  sub_21ACB3408();
  swift_bridgeObjectRelease();
  result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t sub_21ACAFB10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  __int16 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v14 = sub_21ACAFC80((uint64_t)&v17, 0, 0, 1, a1, a2);
  v15 = v3;
  v16 = v4;
  v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    v6 = *a3;
    if (*a3)
    {
      sub_21ACB1768((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x24BEE2520];
    v13[0] = a1;
    v13[1] = a2;
    v7 = *a3;
    if (*a3)
    {
      sub_21ACB1768((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    sub_21ACB3324();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  return v11;
}

uint64_t sub_21ACAFC80(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  char v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  _QWORD v21[4];
  char v22;
  char v23;
  uint64_t v24;

  v17 = (_QWORD *)result;
  v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3)
          __break(1u);
        v16 = a3 - (_QWORD)a2;
      }
      else
      {
        v16 = 0;
      }
      v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_21ACAFFF4(v21, v15, a2);
          sub_21ACB3414();
          *v17 = a2;
          v11 = 0;
          v12 = v15;
          v13 = 1;
          v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          v22 = v13 & 1;
          v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    v6 = sub_21ACB0030(a5, a6);
    *v17 = v7;
    v11 = v6;
    v12 = v8;
    v13 = 0;
    v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  result = sub_21ACB3438();
  if (!result)
    goto LABEL_29;
  v10 = result;
LABEL_21:
  *v17 = v10;
  if (a6 < 0)
  {
    v9 = 0;
LABEL_25:
    v11 = (_QWORD *)v9;
    v12 = a5 & 0xFFFFFFFFFFFFLL;
    v13 = 0;
    v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_21ACAFFF4(const void *a1, size_t a2, void *__dst)
{
  memcpy(__dst, a1, a2);
  return __dst;
}

_QWORD *sub_21ACB0030(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v6 = sub_21ACB00E0(a1, a2);
  sub_21ACB0258();
  v4 = v6[2];
  sub_21ACB02CC(v4);
  sub_21ACB034C(v4, 0);
  sub_21ACAF608();
  swift_retain();
  v5 = sub_21ACB03B8((uint64_t)v6);
  swift_bridgeObjectRelease();
  result = (_QWORD *)v5;
  if (!__OFSUB__(v5, 1))
    return v6;
  __break(1u);
  return result;
}

_QWORD *sub_21ACB00E0(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  char v3;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    v7 = sub_21ACB336C();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
    return (_QWORD *)sub_21ACB0534();
  v5 = sub_21ACB03CC(v7, 0);
  swift_retain();
  swift_release();
  result = (_QWORD *)sub_21ACB342C();
  v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_21ACB3324();
    result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_21ACAC42C();
    if (v6 == (_QWORD *)v7)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_21ACB0258()
{
  uint64_t *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v4;
  if ((result & 1) == 0)
  {
    v2 = sub_21ACB03B8(*v3);
    result = sub_21ACB0560(0, v2 + 1, 1, *v3);
    *v3 = result;
  }
  return result;
}

uint64_t sub_21ACB02CC(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 < result + 1)
  {
    result = sub_21ACB0560(*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *v2 = result;
  }
  return result;
}

uint64_t sub_21ACB034C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + 1;
  v4 = *v2;
  sub_21ACB3324();
  *(_QWORD *)(v4 + 16) = v5;
  swift_release();
  v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release();
}

uint64_t sub_21ACB03B8(uint64_t a1)
{
  return sub_21ACB085C(a1);
}

_QWORD *sub_21ACB03CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  size_t v4;
  _QWORD *v6;
  uint64_t v7;

  if (a2 < a1)
    v7 = a1;
  else
    v7 = a2;
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2551151C8);
    v6 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (_QWORD)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    v3 = MEMORY[0x24BEE4AF8];
    swift_retain();
    return (_QWORD *)v3;
  }
}

uint64_t sub_21ACB0534()
{
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  swift_retain();
  return v1;
}

uint64_t sub_21ACB0560(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result;
  char *v5;
  size_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v16;

  swift_retain();
  result = swift_retain();
  v16 = *(_QWORD *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2)
        v11 = a2;
      else
        v11 = 2 * v16;
    }
    else
    {
      v11 = *(_QWORD *)(a4 + 24) >> 1;
    }
  }
  else
  {
    v11 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v11 < v10)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v11;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2551151C8);
    v8 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * (v6 - (_QWORD)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * v9;
    }
    swift_release();
    v7 = (char *)v8;
  }
  else
  {
    v5 = (char *)MEMORY[0x24BEE4AF8];
    swift_retain();
    v7 = v5;
  }
  if ((a1 & 1) != 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_21ACB0898((char *)(a4 + 32), v10, v7 + 32);
    *(_QWORD *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    sub_21ACB0864((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t sub_21ACB085C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void *sub_21ACB0864(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_21ACB0898(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result)
    return (char *)memmove(a3, result, a2);
  return result;
}

_BYTE **sub_21ACB0948(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_21ACB095C()
{
  return swift_deallocObject();
}

_BYTE **sub_21ACB0984(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_21ACB0948(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_21ACB098C()
{
  return swift_deallocObject();
}

uint64_t sub_21ACB09B4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21ACB09F0()
{
  uint64_t v0;

  return sub_21ACAFA74(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_21ACB09FC()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_21ACB0A38(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_21ACAFA94(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_21ACB0A44()
{
  return sub_21ACAE2DC();
}

uint64_t sub_21ACB0A4C()
{
  return swift_deallocObject();
}

uint64_t sub_21ACB0A74()
{
  return swift_deallocObject();
}

uint64_t sub_21ACB0A9C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21ACB0AD8()
{
  swift_release();
  return swift_deallocObject();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21ACB0B14()
{
  sub_21ACB0B50();
}

uint64_t sub_21ACB0B50()
{
  return swift_release();
}

uint64_t sub_21ACB0B90(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255114EF0);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_21ACB0C04()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_21ACB0C48()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v4;
  const void *v5;

  *(_QWORD *)(v1 + 16) = v1;
  v5 = *(const void **)(v0 + 16);
  v4 = *(void **)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_21ACAF690;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_255114F50 + dword_255114F50))(v5, v4);
}

uint64_t sub_21ACB0CE8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_21ACB0D2C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v4;
  const void *v5;

  *(_QWORD *)(v1 + 16) = v1;
  v5 = *(const void **)(v0 + 16);
  v4 = *(void **)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_21ACAF690;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_255114F68 + dword_255114F68))(v5, v4);
}

uint64_t type metadata accessor for HearingActivityProxy()
{
  return objc_opt_self();
}

unint64_t sub_21ACB0DF0()
{
  return sub_21ACB0E04();
}

unint64_t sub_21ACB0E04()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255114F78;
  if (!qword_255114F78)
  {
    v0 = MEMORY[0x220756100](&protocol conformance descriptor for HearingActivityContentState, &type metadata for HearingActivityContentState);
    atomic_store(v0, (unint64_t *)&qword_255114F78);
    return v0;
  }
  return v2;
}

ValueMetadata *type metadata accessor for HearingActivityContentState()
{
  return &type metadata for HearingActivityContentState;
}

void *type metadata accessor for HearingActivityContentState.CodingKeys()
{
  return &unk_24DDE71F8;
}

void *type metadata accessor for HearingActivityAttributes()
{
  return &unk_24DDE7218;
}

void *type metadata accessor for HearingActivityAttributes.CodingKeys()
{
  return &unk_24DDE7238;
}

uint64_t sub_21ACB0EC0()
{
  return type metadata accessor for HearingActivityGateway();
}

uint64_t sub_21ACB0ED8()
{
  unint64_t v0;
  uint64_t updated;

  updated = sub_21ACB32E8();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

uint64_t method lookup function for HearingActivityProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HearingActivityProxy.start()()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  *(_QWORD *)(v1 + 16) = v1;
  v4 = (uint64_t (*)(void))(*(_QWORD *)((*v0 & *MEMORY[0x24BEE4EA0]) + 0x50)
                         + **(int **)((*v0 & *MEMORY[0x24BEE4EA0]) + 0x50));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_21ACAF690;
  return v4();
}

uint64_t dispatch thunk of HearingActivityProxy.finish()()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  *(_QWORD *)(v1 + 16) = v1;
  v4 = (uint64_t (*)(void))(*(_QWORD *)((*v0 & *MEMORY[0x24BEE4EA0]) + 0x58)
                         + **(int **)((*v0 & *MEMORY[0x24BEE4EA0]) + 0x58));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_21ACAF690;
  return v4();
}

unint64_t sub_21ACB10D8()
{
  return sub_21ACB10EC();
}

unint64_t sub_21ACB10EC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255115158;
  if (!qword_255115158)
  {
    v0 = MEMORY[0x220756100](&unk_21ACB6E30, &unk_24DDE7218);
    atomic_store(v0, (unint64_t *)&qword_255115158);
    return v0;
  }
  return v2;
}

unint64_t sub_21ACB1158()
{
  return sub_21ACB116C();
}

unint64_t sub_21ACB116C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255115160;
  if (!qword_255115160)
  {
    v0 = MEMORY[0x220756100](&unk_21ACB6E08, &unk_24DDE7218);
    atomic_store(v0, (unint64_t *)&qword_255115160);
    return v0;
  }
  return v2;
}

unint64_t sub_21ACB11D8()
{
  return sub_21ACAE180();
}

unint64_t sub_21ACB11EC()
{
  return sub_21ACAE1EC();
}

unint64_t sub_21ACB1200()
{
  return sub_21ACABD48();
}

unint64_t sub_21ACB1214()
{
  return sub_21ACB1228();
}

unint64_t sub_21ACB1228()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255115168;
  if (!qword_255115168)
  {
    v0 = MEMORY[0x220756100](&unk_21ACB6DB8, &unk_24DDE7238);
    atomic_store(v0, (unint64_t *)&qword_255115168);
    return v0;
  }
  return v2;
}

unint64_t sub_21ACB1294()
{
  return sub_21ACB12A8();
}

unint64_t sub_21ACB12A8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255115170;
  if (!qword_255115170)
  {
    v0 = MEMORY[0x220756100](&unk_21ACB6DE0, &unk_24DDE7238);
    atomic_store(v0, (unint64_t *)&qword_255115170);
    return v0;
  }
  return v2;
}

unint64_t sub_21ACB1314()
{
  return sub_21ACB1328();
}

unint64_t sub_21ACB1328()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255115178;
  if (!qword_255115178)
  {
    v0 = MEMORY[0x220756100](&unk_21ACB6EA8, &unk_24DDE71F8);
    atomic_store(v0, (unint64_t *)&qword_255115178);
    return v0;
  }
  return v2;
}

unint64_t sub_21ACB1394()
{
  return sub_21ACB13A8();
}

unint64_t sub_21ACB13A8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_255115180;
  if (!qword_255115180)
  {
    v0 = MEMORY[0x220756100](&unk_21ACB6ED0, &unk_24DDE71F8);
    atomic_store(v0, (unint64_t *)&qword_255115180);
    return v0;
  }
  return v2;
}

uint64_t sub_21ACB1414()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21ACB1458()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  int *v5;
  uint64_t v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = v0[2];
  v4 = v0[3];
  v5 = (int *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_21ACAF690;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_255115198 + dword_255115198))(v6, v4, v5);
}

uint64_t sub_21ACB1510()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21ACB1554(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  int *v7;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = v1[2];
  v6 = v1[3];
  v7 = (int *)v1[4];
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_21ACAF690;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2551151A8 + dword_2551151A8))(a1, v5, v6, v7);
}

uint64_t sub_21ACB1614(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_21ACB33A8();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_21ACB1684()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21ACB16C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int *v5;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(int **)(v1 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_21ACAF690;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2551151B8 + dword_2551151B8))(a1, v5);
}

uint64_t sub_21ACB1768(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

uint64_t sub_21ACB17DC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_21ACB1800()
{
  sub_21ACB17DC();
  return swift_deallocClassInstance();
}

uint64_t sub_21ACB183C()
{
  swift_allocObject();
  return sub_21ACB17DC();
}

id sub_21ACB1874()
{
  id result;

  sub_21ACB1FAC();
  type metadata accessor for ResourceBundleClass();
  result = sub_21ACB18B8();
  qword_2551151D0 = (uint64_t)result;
  return result;
}

id sub_21ACB18B8()
{
  uint64_t ObjCClassFromMetadata;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);
}

uint64_t *sub_21ACB18FC()
{
  if (qword_255114E50 != -1)
    swift_once();
  return &qword_2551151D0;
}

uint64_t sub_21ACB1950()
{
  id v0;
  uint64_t v2;

  v2 = sub_21ACB32C4();
  __swift_allocate_value_buffer(v2, qword_255115AD0);
  __swift_project_value_buffer(v2, (uint64_t)qword_255115AD0);
  sub_21ACB3360();
  v0 = (id)*sub_21ACB18FC();
  return sub_21ACB32B8();
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v5;

  v5 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
    return *(_QWORD *)a2;
  return v3;
}

uint64_t sub_21ACB1A8C()
{
  uint64_t v0;

  if (qword_255114E58 != -1)
    swift_once();
  v0 = sub_21ACB32C4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_255115AD0);
}

uint64_t sub_21ACB1AEC()
{
  id v0;
  uint64_t v2;

  v2 = sub_21ACB32C4();
  __swift_allocate_value_buffer(v2, qword_255115AE8);
  __swift_project_value_buffer(v2, (uint64_t)qword_255115AE8);
  sub_21ACB3360();
  v0 = (id)*sub_21ACB18FC();
  return sub_21ACB32B8();
}

uint64_t sub_21ACB1B78()
{
  uint64_t v0;

  if (qword_255114E60 != -1)
    swift_once();
  v0 = sub_21ACB32C4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_255115AE8);
}

uint64_t sub_21ACB1BD8()
{
  id v0;
  uint64_t v2;

  v2 = sub_21ACB32C4();
  __swift_allocate_value_buffer(v2, qword_255115B00);
  __swift_project_value_buffer(v2, (uint64_t)qword_255115B00);
  sub_21ACB3360();
  v0 = (id)*sub_21ACB18FC();
  return sub_21ACB32B8();
}

uint64_t sub_21ACB1C64()
{
  uint64_t v0;

  if (qword_255114E68 != -1)
    swift_once();
  v0 = sub_21ACB32C4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_255115B00);
}

uint64_t sub_21ACB1CC4()
{
  id v0;
  uint64_t v2;

  v2 = sub_21ACB32C4();
  __swift_allocate_value_buffer(v2, qword_255115B18);
  __swift_project_value_buffer(v2, (uint64_t)qword_255115B18);
  sub_21ACB3360();
  v0 = (id)*sub_21ACB18FC();
  return sub_21ACB32B8();
}

uint64_t sub_21ACB1D50()
{
  uint64_t v0;

  if (qword_255114E70 != -1)
    swift_once();
  v0 = sub_21ACB32C4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_255115B18);
}

uint64_t sub_21ACB1DB0()
{
  id v0;
  uint64_t v2;

  v2 = sub_21ACB32C4();
  __swift_allocate_value_buffer(v2, qword_255115B30);
  __swift_project_value_buffer(v2, (uint64_t)qword_255115B30);
  sub_21ACB3360();
  v0 = (id)*sub_21ACB18FC();
  return sub_21ACB32B8();
}

uint64_t sub_21ACB1E3C()
{
  uint64_t v0;

  if (qword_255114E78 != -1)
    swift_once();
  v0 = sub_21ACB32C4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_255115B30);
}

uint64_t sub_21ACB1E9C()
{
  id v0;
  uint64_t v2;

  v2 = sub_21ACB32C4();
  __swift_allocate_value_buffer(v2, qword_255115B48);
  __swift_project_value_buffer(v2, (uint64_t)qword_255115B48);
  sub_21ACB3360();
  v0 = (id)*sub_21ACB18FC();
  return sub_21ACB32B8();
}

uint64_t sub_21ACB1F28()
{
  uint64_t v0;

  if (qword_255114E80 != -1)
    swift_once();
  v0 = sub_21ACB32C4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_255115B48);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

unint64_t sub_21ACB1FAC()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_255115270;
  if (!qword_255115270)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_255115270);
    return ObjCClassMetadata;
  }
  return v2;
}

void __getSiriSimpleActivationSourceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SiriActivationLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSpringBoardServerHelper.m"), 123, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSiriSimpleActivationSourceClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSiriSimpleActivationSourceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSpringBoardServerHelper.m"), 124, CFSTR("Unable to find class %s"), "SiriSimpleActivationSource");

  __break(1u);
}

void __getPKPassLibraryClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PassKitCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSpringBoardServerHelper.m"), 91, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPKPassLibraryClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPKPassLibraryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSpringBoardServerHelper.m"), 92, CFSTR("Unable to find class %s"), "PKPassLibrary");

  __break(1u);
}

void __getHUComfortSoundsSettingsClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HearingUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSpringBoardServerHelper.m"), 84, CFSTR("%s"), *a1);

  __break(1u);
}

void __getHUComfortSoundsSettingsClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getHUComfortSoundsSettingsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSpringBoardServerHelper.m"), 85, CFSTR("Unable to find class %s"), "HUComfortSoundsSettings");

  __break(1u);
}

void __getSOSManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SOSLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSpringBoardServerHelper.m"), 102, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSOSManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSOSManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSpringBoardServerHelper.m"), 103, CFSTR("Unable to find class %s"), "SOSManager");

  __break(1u);
}

void __getAXRemoteViewServiceAdaptorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AccessibilityRemoteUIServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSpringBoardServerHelper.m"), 109, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXRemoteViewServiceAdaptorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXRemoteViewServiceAdaptorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSpringBoardServerHelper.m"), 110, CFSTR("Unable to find class %s"), "AXRemoteViewServiceAdaptor");

  __break(1u);
}

void __getAXPISystemActionHelperClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AccessibilityPhysicalInteractionLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSpringBoardServerHelper.m"), 97, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXPISystemActionHelperClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXPISystemActionHelperClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSpringBoardServerHelper.m"), 98, CFSTR("Unable to find class %s"), "AXPISystemActionHelper");

  __break(1u);
}

void SpringBoardHomeLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardHomeLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSpringBoardServerSideAppManager.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

uint64_t sub_21ACB3228()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_21ACB3234()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21ACB3240()
{
  return MEMORY[0x24BDB46D8]();
}

uint64_t sub_21ACB324C()
{
  return MEMORY[0x24BDB4728]();
}

uint64_t sub_21ACB3258()
{
  return MEMORY[0x24BDB4768]();
}

uint64_t sub_21ACB3264()
{
  return MEMORY[0x24BDB47C8]();
}

uint64_t sub_21ACB3270()
{
  return MEMORY[0x24BDB4830]();
}

uint64_t sub_21ACB327C()
{
  return MEMORY[0x24BDB4838]();
}

uint64_t sub_21ACB3288()
{
  return MEMORY[0x24BDB4850]();
}

uint64_t sub_21ACB3294()
{
  return MEMORY[0x24BDB4858]();
}

uint64_t sub_21ACB32A0()
{
  return MEMORY[0x24BDB4870]();
}

uint64_t sub_21ACB32AC()
{
  return MEMORY[0x24BDB48F8]();
}

uint64_t sub_21ACB32B8()
{
  return MEMORY[0x24BDC6D30]();
}

uint64_t sub_21ACB32C4()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t sub_21ACB32D0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21ACB32DC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21ACB32E8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21ACB32F4()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_21ACB3300()
{
  return MEMORY[0x24BEE02C8]();
}

uint64_t sub_21ACB330C()
{
  return MEMORY[0x24BEE02D8]();
}

uint64_t sub_21ACB3318()
{
  return MEMORY[0x24BEE02E8]();
}

uint64_t sub_21ACB3324()
{
  return MEMORY[0x24BEE0328]();
}

uint64_t sub_21ACB3330()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_21ACB333C()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_21ACB3348()
{
  return MEMORY[0x24BEE0630]();
}

uint64_t sub_21ACB3354()
{
  return MEMORY[0x24BEE0A28]();
}

uint64_t sub_21ACB3360()
{
  return MEMORY[0x24BEE0AF8]();
}

uint64_t sub_21ACB336C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21ACB3378()
{
  return MEMORY[0x24BEE0F48]();
}

uint64_t sub_21ACB3384()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21ACB3390()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21ACB339C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21ACB33A8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21ACB33B4()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_21ACB33C0()
{
  return MEMORY[0x24BEE1A10]();
}

uint64_t sub_21ACB33CC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21ACB33D8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21ACB33E4()
{
  return MEMORY[0x24BEE1BE0]();
}

uint64_t sub_21ACB33F0()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_21ACB33FC()
{
  return MEMORY[0x24BEE1C20]();
}

uint64_t sub_21ACB3408()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21ACB3414()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21ACB3420()
{
  return MEMORY[0x24BEE2380]();
}

uint64_t sub_21ACB342C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21ACB3438()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21ACB3444()
{
  return MEMORY[0x24BEE2BF8]();
}

uint64_t sub_21ACB3450()
{
  return MEMORY[0x24BEE3A18]();
}

uint64_t sub_21ACB345C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21ACB3468()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21ACB3474()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21ACB3480()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t ASTLogCommon()
{
  return MEMORY[0x24BDFDF50]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x24BDFDF98]();
}

uint64_t AXCurrentProcessExistsInLoginSessionSBOnly()
{
  return MEMORY[0x24BDFDFA0]();
}

uint64_t AXDeviceHasJindo()
{
  return MEMORY[0x24BDFDFC8]();
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

uint64_t AXDeviceIsPod()
{
  return MEMORY[0x24BDFE018]();
}

uint64_t AXDeviceIsUnlocked()
{
  return MEMORY[0x24BDFFFC0]();
}

uint64_t AXDeviceSupportsSideApp()
{
  return MEMORY[0x24BE00030]();
}

uint64_t AXFrontBoardFocusedAppPID()
{
  return MEMORY[0x24BDFE640]();
}

uint64_t AXFrontBoardFocusedAppProcess()
{
  return MEMORY[0x24BDFE660]();
}

uint64_t AXFrontBoardFocusedAppProcessesForGuidedAccess()
{
  return MEMORY[0x24BDFE670]();
}

uint64_t AXFrontBoardFocusedApps()
{
  return MEMORY[0x24BDFE680]();
}

uint64_t AXFrontBoardIsSystemAppShowingAlert()
{
  return MEMORY[0x24BDFE688]();
}

uint64_t AXFrontBoardPurpleBuddyPID()
{
  return MEMORY[0x24BDFE6A0]();
}

uint64_t AXFrontBoardRebootDevice()
{
  return MEMORY[0x24BDFE6A8]();
}

uint64_t AXFrontBoardRunningAppPIDs()
{
  return MEMORY[0x24BDFE6B8]();
}

uint64_t AXFrontBoardRunningAppProcesses()
{
  return MEMORY[0x24BDFE6C0]();
}

uint64_t AXFrontBoardSystemAppAlertWindow()
{
  return MEMORY[0x24BDFE6D8]();
}

uint64_t AXFrontBoardSystemAppProcess()
{
  return MEMORY[0x24BDFE6E0]();
}

uint64_t AXHACHearingAidComplianceEnabled()
{
  return MEMORY[0x24BE4BDF0]();
}

uint64_t AXHACHearingAidComplianceSetEnabled()
{
  return MEMORY[0x24BE4BDF8]();
}

uint64_t AXHasCapability()
{
  return MEMORY[0x24BE00130]();
}

uint64_t AXInPreboardScenario()
{
  return MEMORY[0x24BE00168]();
}

uint64_t AXIncrefSendRight()
{
  return MEMORY[0x24BE00178]();
}

uint64_t AXInvertColorsIsSystemWideDarkModeEnabled()
{
  return MEMORY[0x24BDFF9D0]();
}

uint64_t AXIsBuddyCompleted()
{
  return MEMORY[0x24BDFE080]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x24BDFE088]();
}

uint64_t AXIsPurpleBuddyFrontmost()
{
  return MEMORY[0x24BDFE6E8]();
}

uint64_t AXLocStringKeyForHomeButton()
{
  return MEMORY[0x24BE001B8]();
}

uint64_t AXLocStringKeyForHomeButtonAndExclusiveModel()
{
  return MEMORY[0x24BE001C0]();
}

uint64_t AXLocStringKeyForModel()
{
  return MEMORY[0x24BE001C8]();
}

uint64_t AXLogAssertions()
{
  return MEMORY[0x24BDFE0B8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

uint64_t AXLogIPC()
{
  return MEMORY[0x24BDFE128]();
}

uint64_t AXLogLiveTranscription()
{
  return MEMORY[0x24BDFE130]();
}

uint64_t AXLogSpringboardServer()
{
  return MEMORY[0x24BDFE1A0]();
}

uint64_t AXLogSystemApp()
{
  return MEMORY[0x24BDFE1B0]();
}

uint64_t AXLogUI()
{
  return MEMORY[0x24BDFE1E0]();
}

uint64_t AXLogUIViewService()
{
  return MEMORY[0x24BDFE1F0]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x24BDFE1F8]();
}

uint64_t AXLogValidations()
{
  return MEMORY[0x24BDFE208]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x24BDFE210]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x24BDFE238]();
}

uint64_t AXParameterizedLocalizedString()
{
  return MEMORY[0x24BE00288]();
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

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x24BDFE268]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BDFE278]();
}

uint64_t AXPerformValidationChecks()
{
  return MEMORY[0x24BDFE280]();
}

uint64_t AXPidSuspend()
{
  return MEMORY[0x24BDFE928]();
}

uint64_t AXPidUnsuspend()
{
  return MEMORY[0x24BDFE930]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x24BDFE2E0]();
}

uint64_t AXRuntimeCheck_HasANE()
{
  return MEMORY[0x24BDFE300]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

uint64_t AXSessionIsLoginSession()
{
  return MEMORY[0x24BE00380]();
}

uint64_t AXSystemRootDirectory()
{
  return MEMORY[0x24BDFE3B8]();
}

uint64_t AXUIApplicationWindows()
{
  return MEMORY[0x24BDFF9F0]();
}

uint64_t AXUILocalizedStringForKey()
{
  return MEMORY[0x24BDFFA20]();
}

uint64_t AXUIPurgeKeyboardCache()
{
  return MEMORY[0x24BDFFA30]();
}

uint64_t AXUIToggleIncomingCall()
{
  return MEMORY[0x24BDFFA48]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x24BDB6960](inFileURL, outSystemSoundID);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x24BDB6990]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
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

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
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

uint64_t GAXLogCommon()
{
  return MEMORY[0x24BDFE458]();
}

uint64_t HAInitializeLogging()
{
  return MEMORY[0x24BE4BD80]();
}

Boolean IOHIDDeviceConformsTo(IOHIDDeviceRef device, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x24BDD8020](device, *(_QWORD *)&usagePage, *(_QWORD *)&usage);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8040](device, key);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x24BDD8060](device, *(_QWORD *)&options);
}

void IOHIDDeviceRegisterInputValueCallback(IOHIDDeviceRef device, IOHIDValueCallback callback, void *context)
{
  MEMORY[0x24BDD8078](device, callback, context);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x24BDD8488](allocator, *(_QWORD *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
  MEMORY[0x24BDD84A8](manager, callback, context);
}

void IOHIDManagerRegisterInputValueCallback(IOHIDManagerRef manager, IOHIDValueCallback callback, void *context)
{
  MEMORY[0x24BDD84C8](manager, callback, context);
}

void IOHIDManagerScheduleWithRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x24BDD84D0](manager, runLoop, runLoopMode);
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
  MEMORY[0x24BDD84F0](manager, multiple);
}

void IOHIDManagerUnscheduleFromRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x24BDD84F8](manager, runLoop, runLoopMode);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x24BE65148]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPID()
{
  return MEMORY[0x24BE65160]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x24BE65168]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin()
{
  return MEMORY[0x24BE65170]();
}

uint64_t MRMediaRemoteGetNowPlayingClientForOrigin()
{
  return MEMORY[0x24BE65188]();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return MEMORY[0x24BE65230]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x24BE652A0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t RBSTaskStateIsRunning()
{
  return MEMORY[0x24BE80E90]();
}

uint64_t SBSCopyInfoForApplicationWithProcessID()
{
  return MEMORY[0x24BEB0BE8]();
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return MEMORY[0x24BEB0D20]();
}

BOOL UIAccessibilityIsGuidedAccessEnabled(void)
{
  return MEMORY[0x24BEBDE28]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BEBDE70]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BEBDE80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

uint64_t UIIntegralTransform()
{
  return MEMORY[0x24BEBE340]();
}

uint64_t UISystemFontBoldForSize()
{
  return MEMORY[0x24BEBE760]();
}

uint64_t VOTLogCommon()
{
  return MEMORY[0x24BDFE508]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BDFE528]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BDFE538]();
}

uint64_t _AXSAccessibilityEnabled()
{
  return MEMORY[0x24BED2000]();
}

uint64_t _AXSAccessibilityGetBooleaniTunesPreference()
{
  return MEMORY[0x24BED2008]();
}

uint64_t _AXSAccessibilitySetiTunesPreference()
{
  return MEMORY[0x24BED2020]();
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

uint64_t _AXSAssistiveTouchRepairIncarnationModeEnabled()
{
  return MEMORY[0x24BED2068]();
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

uint64_t _AXSAssistiveTouchSetHardwareEnabled()
{
  return MEMORY[0x24BED2088]();
}

uint64_t _AXSAssistiveTouchSetRepairIncarnationModeEnabled()
{
  return MEMORY[0x24BED2090]();
}

uint64_t _AXSAssistiveTouchSetUIEnabled()
{
  return MEMORY[0x24BED2098]();
}

uint64_t _AXSBackTapEnabled()
{
  return MEMORY[0x24BED20E0]();
}

uint64_t _AXSBackTapSetEnabled()
{
  return MEMORY[0x24BED20E8]();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return MEMORY[0x24BED2110]();
}

uint64_t _AXSClosedCaptionsSetEnabled()
{
  return MEMORY[0x24BED2148]();
}

uint64_t _AXSCommandAndControlCarPlayEnabled()
{
  return MEMORY[0x24BED2160]();
}

uint64_t _AXSCommandAndControlCarPlaySetEnabled()
{
  return MEMORY[0x24BED2168]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSCommandAndControlSetEnabled()
{
  return MEMORY[0x24BED2178]();
}

uint64_t _AXSCopyPreferredContentSizeCategoryNameGlobal()
{
  return MEMORY[0x24BED21A0]();
}

uint64_t _AXSDefaultRouteForCall()
{
  return MEMORY[0x24BED21B8]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BED21F0]();
}

uint64_t _AXSFullKeyboardAccessSetEnabled()
{
  return MEMORY[0x24BED2208]();
}

uint64_t _AXSGuidedAccessEnabledByManagedConfiguration()
{
  return MEMORY[0x24BED2240]();
}

uint64_t _AXSGuidedAccessSetEnabledByManagedConfiguration()
{
  return MEMORY[0x24BED2250]();
}

uint64_t _AXSHomeButtonRestingUnlock()
{
  return MEMORY[0x24BED2298]();
}

uint64_t _AXSHomeButtonRestingUnlockEverSet()
{
  return MEMORY[0x24BED22A0]();
}

uint64_t _AXSHomeButtonSetRestingUnlock()
{
  return MEMORY[0x24BED22A8]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x24BED22E0]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x24BED22F8]();
}

uint64_t _AXSLetterFeedbackEnabled()
{
  return MEMORY[0x24BED2308]();
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

uint64_t _AXSLiveTranscriptionSetEnabled()
{
  return MEMORY[0x24BED2328]();
}

uint64_t _AXSMonoAudioEnabled()
{
  return MEMORY[0x24BED2330]();
}

uint64_t _AXSMonoAudioSetEnabled()
{
  return MEMORY[0x24BED2338]();
}

uint64_t _AXSPearlRestingUnlock()
{
  return MEMORY[0x24BED2378]();
}

uint64_t _AXSPhoneticFeedbackEnabled()
{
  return MEMORY[0x24BED2388]();
}

uint64_t _AXSScreenContrast()
{
  return MEMORY[0x24BED23F8]();
}

uint64_t _AXSSetLetterFeedbackEnabled()
{
  return MEMORY[0x24BED2480]();
}

uint64_t _AXSSetPhoneticFeedbackEnabled()
{
  return MEMORY[0x24BED2490]();
}

uint64_t _AXSSetSpeakThisEnabled()
{
  return MEMORY[0x24BED24C0]();
}

uint64_t _AXSSetTripleClickOptions()
{
  return MEMORY[0x24BED24C8]();
}

uint64_t _AXSSetWordFeedbackEnabled()
{
  return MEMORY[0x24BED24D8]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x24BED2518]();
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

uint64_t _AXSVisualAlertEnabled()
{
  return MEMORY[0x24BED2590]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x24BED25B8]();
}

uint64_t _AXSVoiceOverTouchSetEnabledAndAutoConfirmUsage()
{
  return MEMORY[0x24BED25C0]();
}

uint64_t _AXSVoiceOverTouchSetUIEnabled()
{
  return MEMORY[0x24BED25E8]();
}

uint64_t _AXSVoiceOverTouchSetUsageConfirmed()
{
  return MEMORY[0x24BED25F0]();
}

uint64_t _AXSVoiceOverTouchShouldRouteToSpeakerWithProximity()
{
  return MEMORY[0x24BED25F8]();
}

uint64_t _AXSVoiceOverTouchSpeakingRate()
{
  return MEMORY[0x24BED2600]();
}

uint64_t _AXSVoiceOverTouchVolume()
{
  return MEMORY[0x24BED2620]();
}

uint64_t _AXSWordFeedbackEnabled()
{
  return MEMORY[0x24BED2648]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x24BED2650]();
}

uint64_t _AXSZoomTouchSetEnabled()
{
  return MEMORY[0x24BED2658]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x24BDFE548]();
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

uint64_t _UIAccessibilityFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BEBEA08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x24BDFEDA0]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BDFE550]();
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x24BDFE560]();
}

uint64_t __UIAccessibilityGetAssociatedBool()
{
  return MEMORY[0x24BDFE570]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x24BDFE5A8]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BDFE5C0]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x24BDFE5C8]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x24BDFE608]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

uint64_t hearingDeamonShouldBeRunning()
{
  return MEMORY[0x24BE4BEC0]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x24BEDCF90](superclass, name, extraBytes);
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

void objc_registerClassPair(Class cls)
{
  MEMORY[0x24BEDD170](cls);
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

uint64_t paBluetoothDeviceSupportsSSL()
{
  return MEMORY[0x24BE71AA8]();
}

uint64_t paCurrentBluetoothDeviceSupportingTransparencyAccommodations()
{
  return MEMORY[0x24BE71AB0]();
}

uint64_t paCurrentRouteSupportsTransparencyAccommodations()
{
  return MEMORY[0x24BE71AC0]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

