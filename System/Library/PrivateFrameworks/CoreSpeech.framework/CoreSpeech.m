void sub_1C2618E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a30);
  _Unwind_Resume(a1);
}

void sub_1C26194C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1C261F6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1C2621AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26275CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t _SiriInCallEnabledDidChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_siriInCallEnabledDidChangeEnabledDidChange");
}

id getCMWakeGestureManagerClass()
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
  v0 = (void *)getCMWakeGestureManagerClass_softClass;
  v7 = getCMWakeGestureManagerClass_softClass;
  if (!getCMWakeGestureManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCMWakeGestureManagerClass_block_invoke;
    v3[3] = &unk_1E7C287B8;
    v3[4] = &v4;
    __getCMWakeGestureManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C262923C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCMWakeGestureManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreMotionLibraryCore_frameworkLibrary)
    CoreMotionLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreMotionLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreMotionLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CSGestureMonitorPhone.m"), 14, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CMWakeGestureManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCMWakeGestureManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CSGestureMonitorPhone.m"), 15, CFSTR("Unable to find class %s"), "CMWakeGestureManager");

LABEL_8:
    __break(1u);
  }
  getCMWakeGestureManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C262C47C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C262CAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1C262CE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *MobileTimerLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MobileTimerLibraryCore_frameworkLibrary)
    MobileTimerLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)MobileTimerLibraryCore_frameworkLibrary;
  if (!MobileTimerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileTimerLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("CSTimerMonitor.m"), 20, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void getMTTimerManagerTimerFired()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMTTimerManagerTimerFiredSymbolLoc_ptr;
  v8 = getMTTimerManagerTimerFiredSymbolLoc_ptr;
  if (!getMTTimerManagerTimerFiredSymbolLoc_ptr)
  {
    v1 = MobileTimerLibrary();
    v0 = (id *)dlsym(v1, "MTTimerManagerTimerFired");
    v6[3] = (uint64_t)v0;
    getMTTimerManagerTimerFiredSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMTTimerManagerTimerFired(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CSTimerMonitor.m"), 22, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1C262D564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getMTTimerManagerFiringTimerDismissed()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMTTimerManagerFiringTimerDismissedSymbolLoc_ptr;
  v8 = getMTTimerManagerFiringTimerDismissedSymbolLoc_ptr;
  if (!getMTTimerManagerFiringTimerDismissedSymbolLoc_ptr)
  {
    v1 = MobileTimerLibrary();
    v0 = (id *)dlsym(v1, "MTTimerManagerFiringTimerDismissed");
    v6[3] = (uint64_t)v0;
    getMTTimerManagerFiringTimerDismissedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMTTimerManagerFiringTimerDismissed(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CSTimerMonitor.m"), 23, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1C262D65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getMTTimerManagerStateReset()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMTTimerManagerStateResetSymbolLoc_ptr;
  v8 = getMTTimerManagerStateResetSymbolLoc_ptr;
  if (!getMTTimerManagerStateResetSymbolLoc_ptr)
  {
    v1 = MobileTimerLibrary();
    v0 = (id *)dlsym(v1, "MTTimerManagerStateReset");
    v6[3] = (uint64_t)v0;
    getMTTimerManagerStateResetSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMTTimerManagerStateReset(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CSTimerMonitor.m"), 24, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1C262D754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMTTimerManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MobileTimerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MTTimerManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMTTimerManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTTimerManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CSTimerMonitor.m"), 21, CFSTR("Unable to find class %s"), "MTTimerManager");

    __break(1u);
  }
}

void sub_1C262DED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void getMTAlarmManagerAlarmFired()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMTAlarmManagerAlarmFiredSymbolLoc_ptr;
  v8 = getMTAlarmManagerAlarmFiredSymbolLoc_ptr;
  if (!getMTAlarmManagerAlarmFiredSymbolLoc_ptr)
  {
    v1 = MobileTimerLibrary_858();
    v0 = (id *)dlsym(v1, "MTAlarmManagerAlarmFired");
    v6[3] = (uint64_t)v0;
    getMTAlarmManagerAlarmFiredSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMTAlarmManagerAlarmFired(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CSAlarmMonitor.m"), 26, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1C262E634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getMTAlarmManagerFiringAlarmDismissed()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMTAlarmManagerFiringAlarmDismissedSymbolLoc_ptr;
  v8 = getMTAlarmManagerFiringAlarmDismissedSymbolLoc_ptr;
  if (!getMTAlarmManagerFiringAlarmDismissedSymbolLoc_ptr)
  {
    v1 = MobileTimerLibrary_858();
    v0 = (id *)dlsym(v1, "MTAlarmManagerFiringAlarmDismissed");
    v6[3] = (uint64_t)v0;
    getMTAlarmManagerFiringAlarmDismissedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMTAlarmManagerFiringAlarmDismissed(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CSAlarmMonitor.m"), 27, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1C262E72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getMTAlarmManagerStateReset()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMTAlarmManagerStateResetSymbolLoc_ptr;
  v8 = getMTAlarmManagerStateResetSymbolLoc_ptr;
  if (!getMTAlarmManagerStateResetSymbolLoc_ptr)
  {
    v1 = MobileTimerLibrary_858();
    v0 = (id *)dlsym(v1, "MTAlarmManagerStateReset");
    v6[3] = (uint64_t)v0;
    getMTAlarmManagerStateResetSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMTAlarmManagerStateReset(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CSAlarmMonitor.m"), 28, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1C262E824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *MobileTimerLibrary_858()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MobileTimerLibraryCore_frameworkLibrary_864)
    MobileTimerLibraryCore_frameworkLibrary_864 = _sl_dlopen();
  v0 = (void *)MobileTimerLibraryCore_frameworkLibrary_864;
  if (!MobileTimerLibraryCore_frameworkLibrary_864)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MobileTimerLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("CSAlarmMonitor.m"), 24, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getMTAlarmManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MobileTimerLibrary_858();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MTAlarmManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMTAlarmManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getMTAlarmManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CSAlarmMonitor.m"), 25, CFSTR("Unable to find class %s"), "MTAlarmManager");

    __break(1u);
  }
}

void sub_1C262F758(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C2630AB8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C2631278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBKDeviceClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  BiometricKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BKDevice");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBKDeviceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CSBiometricMatchMonitor.m"), 20, CFSTR("Unable to find class %s"), "BKDevice");

    __break(1u);
  }
}

void __getBKDeviceManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  BiometricKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BKDeviceManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBKDeviceManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CSBiometricMatchMonitor.m"), 21, CFSTR("Unable to find class %s"), "BKDeviceManager");

    __break(1u);
  }
}

void BiometricKitLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!BiometricKitLibraryCore_frameworkLibrary)
    BiometricKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BiometricKitLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CSBiometricMatchMonitor.m"), 19, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_1C2632200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C26324DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C26325FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C26326AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1484(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1485(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__29(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1C3BC4734](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__30(uint64_t a1)
{

}

id CSAnalyticsContextCreateWithRecordingInfo(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v1, "voiceTriggerEventInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("voiceTriggerInfo"));
  objc_msgSend(v1, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("route"));
  objc_msgSend(v1, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("source"));

  return v2;
}

uint64_t __Block_byref_object_copy__2052(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2053(uint64_t a1)
{

}

void CSSecureLogInitIfNeeded()
{
  if (CSSecureLogInitIfNeeded_once != -1)
    dispatch_once(&CSSecureLogInitIfNeeded_once, &__block_literal_global_2248);
}

__CFDictionary *CSCopyKeychainBaseQueryDictionary(__CFString *a1, void *a2)
{
  __CFString *v4;
  __CFString *v5;
  id v6;
  __CFString *v7;
  __CFDictionary *Mutable;
  const void *v9;
  const void *v10;

  v4 = CFSTR("Siri Global");
  if (a1)
    v4 = a1;
  v5 = v4;
  v6 = a2;
  v7 = a1;
  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], CFSTR("com.apple.assistant"));
  v9 = (const void *)*MEMORY[0x1E0CD68F8];
  v10 = (const void *)-[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR(" - %@"), v6);

  CFDictionarySetValue(Mutable, v9, v10);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], CFSTR("com.apple.assistant"));

  return Mutable;
}

id CSKeychainValueForAccountAndKey(void *a1, void *a2)
{
  __CFString *v3;
  id v4;
  __CFDictionary *Dictionary;
  OSStatus v6;
  void *v7;
  NSObject *v8;
  CFTypeRef result;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  OSStatus v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    Dictionary = CSCopyKeychainBaseQueryDictionary(v3, v4);
    CFDictionarySetValue(Dictionary, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
    result = 0;
    v6 = SecItemCopyMatching(Dictionary, &result);
    if (Dictionary)
      CFRelease(Dictionary);
    if (v6 != -25300 && v6)
    {
      v8 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v12 = "CSKeychainValueForAccountAndKey";
        v13 = 2112;
        v14 = v4;
        v15 = 2112;
        v16 = v3;
        v17 = 1026;
        v18 = v6;
        _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Couldn't find keychain value %@ for account %@ %{public}d", buf, 0x26u);
      }
      v7 = 0;
    }
    else
    {
      v7 = (void *)objc_msgSend((id)result, "copy");
    }
    if (result)
      CFRelease(result);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1C263E634(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1C263FC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2541(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2542(uint64_t a1)
{

}

void sub_1C26451F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1C2648EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2649244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2649C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3546(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3547(uint64_t a1)
{

}

void sub_1C264BD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C264BEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C264C804(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3680(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3681(uint64_t a1)
{

}

void sub_1C264DCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C264DF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C264E148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C264E254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3869(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3870(uint64_t a1)
{

}

void sub_1C265165C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C2651D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C265373C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2654348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4378(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4379(uint64_t a1)
{

}

void sub_1C265E67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26607A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2660910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2660C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26613E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26614FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26616B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, char a18)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a18, 8);
  _Unwind_Resume(a1);
}

void sub_1C2661F94(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

uint64_t _VoiceTriggerDuringCallEnabledDidChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_voiceTriggerDuringCallEnabledDidChange");
}

void sub_1C2666504(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6441(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6442(uint64_t a1)
{

}

void sub_1C26670E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1C266962C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CSRCHandlingXPCServiceGetXPCInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7C56F0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_processRCWithId_requestId_speechPackage_taskId_forceAccept_completionHandler_, 2, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5, v8[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_processRCWithId_requestId_speechPackage_taskId_forceAccept_completionHandler_, 2, 1);

  return v0;
}

BOOL CSSiriSpeechRecordingGetUsesAutomaticEndpointingFromEndpointerOperationMode(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

uint64_t CSSiriSpeechRecordingGetUsesAutomaticEndpointingFromRequestOptions(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "endpointerOperationMode");
    if (v3)
      v4 = v3 == 4 || v3 == 3;
    else
      v4 = objc_msgSend(v2, "useAutomaticEndpointing");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t CSSiriSpeechRecordingGetUsesServerEndpointingFromRequestOptions(void *a1)
{
  id v1;
  void *v2;
  uint64_t UsesAutomaticEndpointingFromRequestOptions;

  v1 = a1;
  v2 = v1;
  if (!v1 || objc_msgSend(v1, "endpointerOperationMode") == 4)
    UsesAutomaticEndpointingFromRequestOptions = 0;
  else
    UsesAutomaticEndpointingFromRequestOptions = CSSiriSpeechRecordingGetUsesAutomaticEndpointingFromRequestOptions(v2);

  return UsesAutomaticEndpointingFromRequestOptions;
}

BOOL CSSiriSpeechRecordingModeIsAcousticFingerprinting(uint64_t a1)
{
  return a1 == 4;
}

BOOL CSSiriSpeechRecordingModeIsDictation(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

BOOL CSSiriSpeechRecordingModeIsSiri(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

BOOL CSSiriSpeechRecordingModeIsOfflineOnly(uint64_t a1)
{
  return a1 == 3 || a1 == 5;
}

id CSSiriSpeechRecordingRecordedAudioDirectoryPath()
{
  void *v0;
  void *v1;

  AFUserSupportDirectoryPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("RecordedAudio"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id CSSiriSpeechRecordingTrimmedAudioDirectoryPath()
{
  void *v0;
  void *v1;

  AFUserSupportDirectoryPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("TrimmedAudio"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1C266BB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C266BF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C266C110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C266C7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7143(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7144(uint64_t a1)
{

}

const __CFString *CSAttendingStopReasonGetName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("Default");
  else
    return off_1E7C24D28[a1 - 1];
}

uint64_t CSAttendingStopReasonGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (CSAttendingStopReasonGetFromName_onceToken != -1)
      dispatch_once(&CSAttendingStopReasonGetFromName_onceToken, &__block_literal_global_7183);
    objc_msgSend((id)CSAttendingStopReasonGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void NonlinearBeepCanceller::NonlinearBeepCanceller(NonlinearBeepCanceller *this)
{
  *(_DWORD *)this = 4;
  *(_OWORD *)((char *)this + 4) = xmmword_1C276CD20;
  *(_OWORD *)((char *)this + 20) = xmmword_1C276CD30;
  *(_OWORD *)((char *)this + 36) = xmmword_1C276CD40;
  *(_OWORD *)((char *)this + 52) = xmmword_1C276CD50;
  *(_QWORD *)((char *)this + 68) = 0x4000000001;
  *((_DWORD *)this + 19) = 16000;
  *(_OWORD *)((char *)this + 84) = xmmword_1C276CD60;
  *(_QWORD *)((char *)this + 108) = 0x1E3CE50800000000;
  *(_QWORD *)((char *)this + 100) = 0x3F0000003B000000;
  bzero((char *)this + 116, 0x2E4uLL);
}

{
  *(_DWORD *)this = 4;
  *(_OWORD *)((char *)this + 4) = xmmword_1C276CD20;
  *(_OWORD *)((char *)this + 20) = xmmword_1C276CD30;
  *(_OWORD *)((char *)this + 36) = xmmword_1C276CD40;
  *(_OWORD *)((char *)this + 52) = xmmword_1C276CD50;
  *(_QWORD *)((char *)this + 68) = 0x4000000001;
  *((_DWORD *)this + 19) = 16000;
  *(_OWORD *)((char *)this + 84) = xmmword_1C276CD60;
  *(_QWORD *)((char *)this + 108) = 0x1E3CE50800000000;
  *(_QWORD *)((char *)this + 100) = 0x3F0000003B000000;
  bzero((char *)this + 116, 0x2E4uLL);
}

void NonlinearBeepCanceller::nl_init(NonlinearBeepCanceller *this, int a2, float a3, float a4, float a5, float a6, float a7, float a8, float a9, float a10, int a11, int a12, int a13, int a14, int a15, int a16, float a17, unsigned int a18)
{
  float v31;
  vDSP_Length v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  _QWORD *v39;
  __int128 v40;
  char *v41;
  char *v42;
  char *v43;
  void *v44;
  void *v45;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  size_t v57;
  char *v58;
  __int128 v59;
  char *v60;
  char *v61;
  void *v62;
  void *v63;
  char *v64;
  char *v65;
  void *v66;
  void *v67;
  uint64_t i;
  unsigned int v69;
  unsigned int j;
  uint64_t v71;
  unsigned int *v72;
  unsigned int **v73;
  unint64_t v74;
  unsigned int *v75;
  unsigned int *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unsigned int *v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  unint64_t v88;
  _QWORD *v89;
  unsigned int v90;
  char *v92;
  uint64_t *v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  _DWORD *v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  unint64_t v103;
  uint64_t v104;
  _DWORD *v105;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  int32x2_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64x2_t v118;
  uint64x2_t v119;
  uint32x4_t v120;
  _DWORD *v121;
  int8x16_t v129;
  float32x4_t v130;
  int8x16_t v131;
  float32x4_t v132;
  int8x16_t v133;
  int8x16_t v134;
  float32x4_t v135;
  float32x4_t v136;
  int8x16_t v137;
  int8x16_t v138;
  int32x4_t v139;
  int8x16_t v140;
  float32x4_t v141;
  float32x4_t v142;
  float v143;
  float32x4_t v144;
  float v145;
  float32x4_t v146;
  float32x4_t v147;
  float32x4_t v148;
  float32x4_t v149;
  float32x4_t v150;
  float32x4_t v151;
  int16x4_t v152;
  int32x4_t v153;
  int64x2_t v154;
  float32x4_t v155;
  float64x2_t v156;
  float32x4_t v157;
  float32x4_t v158;
  float32x4_t v159;
  uint64x2_t v160;
  int8x16_t v161;
  int32x4_t v162;
  int8x16_t v163;
  int32x4_t v164;
  int8x16_t v165;
  int32x4_t v166;
  int64x2_t v167;
  NonlinearBeepCanceller *v168;
  int64x2_t v169;
  unsigned int v170;
  float32x4_t v171;
  unsigned int v172;
  float v173;
  float32x4_t v174;
  float32x4_t v175;
  unint64_t v177;
  float32x4_t v178;
  _DWORD v179[3];

  *(_DWORD *)this = a2;
  *((float *)this + 6) = __exp10f(a5 / 10.0);
  *((float *)this + 7) = a6;
  *((float *)this + 8) = a7;
  *((float *)this + 9) = a8;
  *((float *)this + 10) = __exp10f(a9 / 10.0);
  v31 = __exp10f(a17 / 10.0);
  *((_QWORD *)this + 14) = 507307272;
  *((_DWORD *)this + 13) = a11;
  *((_DWORD *)this + 14) = a12;
  *((_DWORD *)this + 15) = a13 & 0xFFFFFFFE;
  *((_DWORD *)this + 16) = a14;
  *((_DWORD *)this + 17) = a15;
  *((_DWORD *)this + 18) = a16;
  *((_DWORD *)this + 19) = a18;
  v32 = (a13 & 0xFFFFFFFE) * a16;
  *((_DWORD *)this + 21) = v32;
  *((_DWORD *)this + 22) = v32;
  *((_DWORD *)this + 23) = v32 >> 1;
  *((_DWORD *)this + 24) = (v32 >> 1) + 1;
  *((_DWORD *)this + 27) = 0;
  *((float *)this + 11) = a10;
  *((float *)this + 12) = v31;
  *((_QWORD *)this + 105) = vDSP_DFT_zrop_CreateSetup(*((vDSP_DFT_Setup *)this + 105), v32, vDSP_DFT_FORWARD);
  *((_QWORD *)this + 106) = vDSP_DFT_zrop_CreateSetup(*((vDSP_DFT_Setup *)this + 106), *((unsigned int *)this + 22), vDSP_DFT_INVERSE);
  *((float *)this + 25) = 2.0 / (float)((float)*((unsigned int *)this + 22) * (float)*((unsigned int *)this + 15));
  *((_DWORD *)this + 26) = 1056964608;
  v33 = (float)*((unsigned int *)this + 18) / (float)*((unsigned int *)this + 19);
  if (a3 <= 0.0)
  {
    *((_DWORD *)this + 1) = 0;
    *((_DWORD *)this + 5) = -1082130432;
    v36 = 0.0;
  }
  else
  {
    v34 = -v33 / a3;
    v35 = expf(v34);
    *((float *)this + 1) = v35;
    *((float *)this + 5) = -(float)(1.0 - v35);
    v36 = 0.0;
    if (v35 > 0.0)
      v36 = sqrtf(v35);
  }
  *((float *)this + 4) = v36;
  v37 = 0.0;
  if (a4 > 0.0)
  {
    v38 = -v33 / a4;
    v37 = expf(v38);
  }
  v39 = (_QWORD *)((char *)this + 168);
  v40 = *(_OWORD *)((char *)this + 168);
  *((float *)this + 2) = v37;
  *((float *)this + 3) = 1.0 - v37;
  v177 = *((unsigned int *)this + 17);
  v172 = *((_DWORD *)this + 14);
  v170 = *((_DWORD *)this + 13);
  v41 = (char *)v40;
  *((_QWORD *)this + 21) = 0;
  *((_QWORD *)this + 22) = 0;
  *((_QWORD *)this + 23) = 0;
  if ((_QWORD)v40)
  {
    v42 = (char *)*((_QWORD *)&v40 + 1);
    if (*((_QWORD *)&v40 + 1) != (_QWORD)v40)
    {
      v43 = (char *)*((_QWORD *)&v40 + 1);
      do
      {
        v45 = (void *)*((_QWORD *)v43 - 3);
        v43 -= 24;
        v44 = v45;
        if (v45)
        {
          *((_QWORD *)v42 - 2) = v44;
          operator delete(v44);
        }
        v42 = v43;
      }
      while (v43 != v41);
    }
    operator delete(v41);
    v41 = (char *)*((_QWORD *)this + 21);
    v46 = (char *)*((_QWORD *)this + 22);
  }
  else
  {
    v46 = 0;
  }
  v47 = 0xAAAAAAAAAAAAAAABLL * ((v46 - v41) >> 3);
  v48 = v177 - v47;
  if (v177 > v47)
  {
    v49 = *((_QWORD *)this + 23);
    if (0xAAAAAAAAAAAAAAABLL * ((v49 - (uint64_t)v46) >> 3) >= v48)
    {
      bzero(v46, 24 * ((24 * v48 - 24) / 0x18) + 24);
      *((_QWORD *)this + 22) = &v46[24 * ((24 * v48 - 24) / 0x18) + 24];
      goto LABEL_43;
    }
    v50 = 0xAAAAAAAAAAAAAAABLL * ((v49 - (uint64_t)v41) >> 3);
    v51 = 0x5555555555555556 * ((v49 - (uint64_t)v41) >> 3);
    if (v51 <= v177)
      v51 = v177;
    if (v50 >= 0x555555555555555)
      v52 = 0xAAAAAAAAAAAAAAALL;
    else
      v52 = v51;
    if (v52 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v53 = 3 * v52;
    v54 = (char *)operator new(24 * v52);
    v55 = &v54[8 * ((v46 - v41) >> 3)];
    v56 = &v54[8 * v53];
    v57 = 24 * ((24 * v48 - 24) / 0x18) + 24;
    bzero(v55, v57);
    v58 = &v55[v57];
    if (v46 == v41)
    {
      *((_QWORD *)this + 21) = v55;
      *((_QWORD *)this + 22) = v58;
      *((_QWORD *)this + 23) = v56;
      if (!v41)
        goto LABEL_43;
    }
    else
    {
      do
      {
        *((_QWORD *)v55 - 3) = 0;
        *((_QWORD *)v55 - 2) = 0;
        v55 -= 24;
        *((_QWORD *)v55 + 2) = 0;
        v59 = *(_OWORD *)(v46 - 24);
        v46 -= 24;
        *(_OWORD *)v55 = v59;
        *((_QWORD *)v55 + 2) = *((_QWORD *)v46 + 2);
        *(_QWORD *)v46 = 0;
        *((_QWORD *)v46 + 1) = 0;
        *((_QWORD *)v46 + 2) = 0;
      }
      while (v46 != v41);
      v60 = (char *)*((_QWORD *)this + 21);
      v41 = (char *)*((_QWORD *)this + 22);
      *((_QWORD *)this + 21) = v55;
      *((_QWORD *)this + 22) = v58;
      *((_QWORD *)this + 23) = v56;
      if (v41 != v60)
      {
        v61 = v41;
        do
        {
          v63 = (void *)*((_QWORD *)v61 - 3);
          v61 -= 24;
          v62 = v63;
          if (v63)
          {
            *((_QWORD *)v41 - 2) = v62;
            operator delete(v62);
          }
          v41 = v61;
        }
        while (v61 != v60);
        v41 = v60;
      }
      if (!v41)
        goto LABEL_43;
    }
    operator delete(v41);
    goto LABEL_43;
  }
  if (v177 < v47)
  {
    v64 = &v41[24 * v177];
    if (v46 != v64)
    {
      v65 = v46;
      do
      {
        v67 = (void *)*((_QWORD *)v65 - 3);
        v65 -= 24;
        v66 = v67;
        if (v67)
        {
          *((_QWORD *)v46 - 2) = v66;
          operator delete(v66);
        }
        v46 = v65;
      }
      while (v65 != v64);
    }
    *((_QWORD *)this + 22) = v64;
  }
LABEL_43:
  v168 = this;
  if ((_DWORD)v177)
  {
    for (i = 0; i != v177; ++i)
    {
      if (((v170 >> i) & 1) != 0)
        v69 = v172;
      else
        v69 = 1;
      if (v69)
      {
        for (j = 1; j <= v69; j += 2)
        {
          v71 = *v39 + 24 * i;
          v73 = (unsigned int **)(v71 + 8);
          v72 = *(unsigned int **)(v71 + 8);
          v74 = *(_QWORD *)(v71 + 16);
          if ((unint64_t)v72 >= v74)
          {
            v76 = *(unsigned int **)v71;
            v77 = ((uint64_t)v72 - *(_QWORD *)v71) >> 2;
            v78 = v77 + 1;
            if ((unint64_t)(v77 + 1) >> 62)
              goto LABEL_111;
            v79 = v74 - (_QWORD)v76;
            if (v79 >> 1 > v78)
              v78 = v79 >> 1;
            if ((unint64_t)v79 >= 0x7FFFFFFFFFFFFFFCLL)
              v80 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v80 = v78;
            if (v80)
            {
              v80 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v80);
              v72 = *v73;
              v76 = *(unsigned int **)v71;
            }
            else
            {
              v81 = 0;
            }
            v82 = (unsigned int *)(v80 + 4 * v77);
            *v82 = j;
            v75 = v82 + 1;
            while (v72 != v76)
            {
              v83 = *--v72;
              *--v82 = v83;
            }
            *(_QWORD *)v71 = v82;
            *v73 = v75;
            *(_QWORD *)(v71 + 16) = v80 + 4 * v81;
            if (v76)
              operator delete(v76);
          }
          else
          {
            *v72 = j;
            v75 = v72 + 1;
          }
          *v73 = v75;
        }
      }
    }
  }
  *((_DWORD *)v168 + 20) = 0;
  v85 = *((_QWORD *)v168 + 21);
  v84 = *((_QWORD *)v168 + 22);
  v86 = v84 - v85;
  if (v84 != v85)
  {
    v87 = 0;
    v88 = 0xAAAAAAAAAAAAAAABLL * (v86 >> 3);
    v89 = (_QWORD *)(v85 + 8);
    v90 = 1;
    do
    {
      v87 += (*v89 - *(v89 - 1)) >> 2;
      v89 += 3;
    }
    while (v88 > v90++);
    *((_DWORD *)v168 + 20) = v87;
  }
  v93 = (uint64_t *)((char *)v168 + 192);
  v92 = (char *)*((_QWORD *)v168 + 24);
  v94 = *(unsigned int *)v168;
  v95 = *((_QWORD *)v168 + 26);
  if (v94 > (v95 - (uint64_t)v92) >> 2)
  {
    if (v92)
    {
      *((_QWORD *)v168 + 25) = v92;
      operator delete(v92);
      v95 = 0;
      *v93 = 0;
      *((_QWORD *)v168 + 25) = 0;
      *((_QWORD *)v168 + 26) = 0;
    }
    v96 = v95 >> 1;
    if (v95 >> 1 <= v94)
      v96 = v94;
    if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFFCLL)
      v97 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v97 = v96;
    if (v97 >> 62)
LABEL_111:
      std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]();
    v98 = std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v97);
    *((_QWORD *)v168 + 24) = v98;
    *((_QWORD *)v168 + 26) = &v98[v99];
    v100 = (char *)&v98[v94];
    v101 = 4 * v94;
    do
    {
      *v98++ = 0;
      v101 -= 4;
    }
    while (v101);
    goto LABEL_95;
  }
  v102 = (char *)*((_QWORD *)v168 + 25);
  v103 = (v102 - v92) >> 2;
  if (v103 >= v94)
    v104 = *(unsigned int *)v168;
  else
    v104 = (v102 - v92) >> 2;
  if (v104)
  {
    v105 = (_DWORD *)*((_QWORD *)v168 + 24);
    do
    {
      *v105++ = 0;
      --v104;
    }
    while (v104);
  }
  if (v94 <= v103)
  {
    v100 = &v92[4 * v94];
LABEL_95:
    *((_QWORD *)v168 + 25) = v100;
    goto LABEL_96;
  }
  v106 = &v102[4 * (v94 - v103)];
  v107 = 4 * v94 - 4 * v103;
  do
  {
    *(_DWORD *)v102 = 0;
    v102 += 4;
    v107 -= 4;
  }
  while (v107);
  *((_QWORD *)v168 + 25) = v106;
LABEL_96:
  v108 = *((unsigned int *)v168 + 20);
  v179[0] = 0;
  std::vector<float>::assign((char **)v168 + 27, v108, v179);
  v109 = *((unsigned int *)v168 + 22);
  v179[0] = 0;
  std::vector<float>::assign((char **)v168 + 30, v109, v179);
  v110 = *((unsigned int *)v168 + 22);
  v179[0] = 0;
  std::vector<float>::assign((char **)v168 + 33, v110, v179);
  v111 = *((unsigned int *)v168 + 22);
  v179[0] = 0;
  std::vector<float>::assign((char **)v168 + 36, v111, v179);
  v112 = *((unsigned int *)v168 + 16);
  v179[0] = 0;
  std::vector<float>::assign((char **)v168 + 39, v112, v179);
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 42, *((_DWORD *)v168 + 20), *((_DWORD *)v168 + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 45, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 48, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 51, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 54, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 57, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 60, *((_DWORD *)v168 + 20), *((_DWORD *)v168 + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 63, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 66, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 69, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 24));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 72, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 24));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t *)v168 + 102, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 24));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t)v168 + 600, *((_DWORD *)v168 + 20), *(_DWORD *)v168, *((_DWORD *)v168 + 22));
  NonlinearBeepCanceller::fcn_vector_init((uint64_t)v168 + 624, *((_DWORD *)v168 + 20), *(_DWORD *)v168, *((_DWORD *)v168 + 24));
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)v168 + 81, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 20), *(_DWORD *)v168, *((_DWORD *)v168 + 22), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)v168 + 84, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 20), *(_DWORD *)v168, *((_DWORD *)v168 + 24), *((float *)v168 + 12));
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)v168 + 87, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 20), *(_DWORD *)v168, *((_DWORD *)v168 + 22), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)v168 + 90, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 20), *(_DWORD *)v168, *((_DWORD *)v168 + 24), *((float *)v168 + 12));
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)v168 + 93, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 20), *(_DWORD *)v168, *((_DWORD *)v168 + 22), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)v168 + 96, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 20), *(_DWORD *)v168, *((_DWORD *)v168 + 24), 0.0);
  NonlinearBeepCanceller::fcn_vector_init((_QWORD *)v168 + 99, *((_DWORD *)v168 + 16), *((_DWORD *)v168 + 20), *(_DWORD *)v168, *((_DWORD *)v168 + 24), 0.0);
  if (*(_DWORD *)v168 != 1)
  {
    v114 = 0;
    v115 = *v93;
    do
    {
      *(_DWORD *)(v115 + 4 * v114) = v114 + 1;
      ++v114;
    }
    while (v114 < (*(_DWORD *)v168 - 1));
  }
  v116 = *((unsigned int *)v168 + 22);
  if ((_DWORD)v116)
  {
    *(float *)v113.i32 = (float)v116;
    v159 = (float32x4_t)vdupq_lane_s32(v113, 0);
    v160 = (uint64x2_t)vdupq_n_s64(v116 - 1);
    v117 = (v116 + 3) & 0x1FFFFFFFCLL;
    v118 = (uint64x2_t)xmmword_1C276CD70;
    v119 = (uint64x2_t)xmmword_1C276CD80;
    v120 = (uint32x4_t)xmmword_1C276CD90;
    v121 = (_DWORD *)(*((_QWORD *)v168 + 30) + 8);
    __asm { FMOV            V1.4S, #4.0 }
    v158 = _Q1;
    __asm { FMOV            V1.4S, #1.0 }
    v171 = _Q1;
    __asm { FMOV            V4.4S, #3.0 }
    v156 = (float64x2_t)vdupq_n_s64(0x3FF459A5D6E6692DuLL);
    v157 = _Q4;
    v154 = vdupq_n_s64(4uLL);
    v155 = (float32x4_t)vdupq_n_s32(0x3FC90FDBu);
    do
    {
      v167 = (int64x2_t)v119;
      v169 = (int64x2_t)v118;
      v129 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgeq_u64(v160, v119), (int32x4_t)vcgeq_u64(v160, v118));
      v166 = (int32x4_t)v120;
      v130 = vdivq_f32(vmulq_f32(vcvtq_f32_u32(v120), v158), v159);
      v131 = (int8x16_t)vcgtq_f32(v171, v130);
      v132.i64[0] = 0x4000000040000000;
      v132.i64[1] = 0x4000000040000000;
      v133 = (int8x16_t)vcgtq_f32(v132, v130);
      v134 = (int8x16_t)vcgtq_f32(v157, v130);
      v135 = vsubq_f32(v132, v130);
      v136.i64[0] = 0xC0000000C0000000;
      v136.i64[1] = 0xC0000000C0000000;
      v137 = vandq_s8(v129, v131);
      v138 = vbicq_s8(v129, v131);
      v139 = (int32x4_t)vandq_s8(v138, v133);
      v140 = vbicq_s8(v138, v133);
      v164 = (int32x4_t)vandq_s8(v140, v134);
      v165 = v137;
      v162 = (int32x4_t)vbicq_s8(v140, v134);
      v163 = (int8x16_t)v139;
      v141 = (float32x4_t)vbslq_s8((int8x16_t)v162, (int8x16_t)vaddq_f32(v135, v132), vbslq_s8((int8x16_t)v164, (int8x16_t)vaddq_f32(v130, v136), vbslq_s8((int8x16_t)v139, (int8x16_t)v135, (int8x16_t)v130)));
      v161 = (int8x16_t)vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vorn_s8((int8x8_t)vmovn_s32(v162), vorr_s8((int8x8_t)vmovn_s32(v164), (int8x8_t)vmovn_s32(v139)))), 0x1FuLL));
      v178 = vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v141.f32), v156)), vmulq_f64(vcvt_hight_f64_f32(v141), v156)), v155);
      v173 = cosf(v178.f32[1]);
      v142.f32[0] = cosf(v178.f32[0]);
      v142.f32[1] = v173;
      v174 = v142;
      v143 = cosf(v178.f32[2]);
      v144 = v174;
      v144.f32[2] = v143;
      v175 = v144;
      v145 = cosf(v178.f32[3]);
      v146 = v175;
      v146.f32[3] = v145;
      v147.i64[0] = 0x3F0000003F000000;
      v147.i64[1] = 0x3F0000003F000000;
      v148.i64[0] = 0xBF000000BF000000;
      v148.i64[1] = 0xBF000000BF000000;
      v149 = vmlaq_f32(v147, v148, v146);
      v150 = vmulq_f32(v149, v149);
      v151 = vsqrtq_f32((float32x4_t)vbslq_s8(v161, (int8x16_t)v150, (int8x16_t)vsubq_f32(v171, v150)));
      v152 = vmovn_s32((int32x4_t)vorrq_s8(vorrq_s8((int8x16_t)v162, vorrq_s8(v165, v163)), (int8x16_t)v164));
      if ((v152.i8[0] & 1) != 0)
        *(v121 - 2) = v151.i32[0];
      if ((v152.i8[2] & 1) != 0)
        *(v121 - 1) = v151.i32[1];
      if ((v152.i8[4] & 1) != 0)
        *v121 = v151.i32[2];
      if ((v152.i8[6] & 1) != 0)
        v121[1] = v151.i32[3];
      v118 = (uint64x2_t)vaddq_s64(v169, v154);
      v119 = (uint64x2_t)vaddq_s64(v167, v154);
      v153.i64[0] = 0x400000004;
      v153.i64[1] = 0x400000004;
      v120 = (uint32x4_t)vaddq_s32(v166, v153);
      v121 += 4;
      v117 -= 4;
    }
    while (v117);
  }
}

char *std::vector<float>::assign(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  char *result;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 2)
  {
    v13 = a1[1];
    v14 = (v13 - result) >> 2;
    if (v14 >= a2)
      v15 = a2;
    else
      v15 = (v13 - result) >> 2;
    if (v15)
    {
      v16 = result;
      do
      {
        *(_DWORD *)v16 = *a3;
        v16 += 4;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[4 * a2];
    }
    else
    {
      v17 = &v13[4 * (a2 - v14)];
      v18 = 4 * a2 - 4 * v14;
      do
      {
        *(_DWORD *)v13 = *a3;
        v13 += 4;
        v18 -= 4;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    v8 = v6 >> 1;
    if (v6 >> 1 <= a2)
      v8 = a2;
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL)
      v9 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
    result = std::vector<float>::__vallocate[abi:ne180100](a1, v9);
    v10 = a1[1];
    v11 = &v10[4 * a2];
    v12 = 4 * a2;
    do
    {
      *(_DWORD *)v10 = *a3;
      v10 += 4;
      v12 -= 4;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

void NonlinearBeepCanceller::fcn_vector_init(uint64_t *a1, unsigned int a2, unsigned int a3)
{
  unint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *__p;
  _BYTE *v23;
  int v24;

  v24 = 0;
  v5 = a2;
  std::vector<float>::vector(&__p, a3, &v24);
  v6 = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 3) >= a2)
  {
    v12 = (a1[1] - (uint64_t)v6) / 24;
    if (v12 >= v5)
      v13 = v5;
    else
      v13 = (a1[1] - (uint64_t)v6) / 24;
    for (; v13; --v13)
    {
      if (v6 != (char *)&__p)
        std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(v6, (char *)__p, (uint64_t)v23, (v23 - (_BYTE *)__p) >> 2);
      v6 += 24;
    }
    if (v5 <= v12)
    {
      v17 = a1[1];
      v18 = *a1 + 24 * v5;
      if (v17 != v18)
      {
        v19 = a1[1];
        do
        {
          v21 = *(void **)(v19 - 24);
          v19 -= 24;
          v20 = v21;
          if (v21)
          {
            *(_QWORD *)(v17 - 16) = v20;
            operator delete(v20);
          }
          v17 = v19;
        }
        while (v19 != v18);
      }
      a1[1] = v18;
    }
    else
    {
      v14 = (_QWORD *)a1[1];
      v15 = &v14[3 * (v5 - v12)];
      v16 = 24 * v5 - 24 * v12;
      do
      {
        *v14 = 0;
        v14[1] = 0;
        v14[2] = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v14, __p, (uint64_t)v23, (v23 - (_BYTE *)__p) >> 2);
        v14 += 3;
        v16 -= 24;
      }
      while (v16);
      a1[1] = (uint64_t)v15;
    }
  }
  else
  {
    std::vector<std::vector<float>>::__vdeallocate(a1);
    v7 = 0x5555555555555556 * ((a1[2] - *a1) >> 3);
    if (v7 <= v5)
      v7 = v5;
    if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 3) >= 0x555555555555555)
      v8 = 0xAAAAAAAAAAAAAAALL;
    else
      v8 = v7;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](a1, v8);
    v9 = (_QWORD *)a1[1];
    v10 = &v9[3 * v5];
    v11 = 24 * v5;
    do
    {
      *v9 = 0;
      v9[1] = 0;
      v9[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v9, __p, (uint64_t)v23, (v23 - (_BYTE *)__p) >> 2);
      v9 += 3;
      v11 -= 24;
    }
    while (v11);
    a1[1] = (uint64_t)v10;
  }
  if (__p)
  {
    v23 = __p;
    operator delete(__p);
  }
}

void sub_1C266F450(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void NonlinearBeepCanceller::fcn_vector_init(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  unint64_t v6;
  unint64_t v7;
  void **v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  void *__p[3];
  uint64_t v22;
  uint64_t v23;
  int v24;
  void **v25;

  v24 = 0;
  v6 = a3;
  std::vector<float>::vector(__p, a4, &v24);
  std::vector<std::vector<float>>::vector(&v22, v6, (uint64_t)__p);
  v7 = a2;
  v8 = *(void ***)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) >= a2)
  {
    v14 = (*(_QWORD *)(a1 + 8) - (_QWORD)v8) / 24;
    if (v14 >= v7)
      v15 = v7;
    else
      v15 = (*(_QWORD *)(a1 + 8) - (_QWORD)v8) / 24;
    for (; v15; --v15)
    {
      if (v8 != (void **)&v22)
        std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>((uint64_t)v8, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
      v8 += 3;
    }
    if (v7 <= v14)
    {
      v19 = *(void ***)(a1 + 8);
      v20 = *(_QWORD *)a1 + 24 * v7;
      while (v19 != (void **)v20)
      {
        v19 -= 3;
        v25 = v19;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v25);
      }
      *(_QWORD *)(a1 + 8) = v20;
    }
    else
    {
      v16 = *(_QWORD **)(a1 + 8);
      v17 = &v16[3 * (v7 - v14)];
      v18 = 24 * v7 - 24 * v14;
      do
      {
        *v16 = 0;
        v16[1] = 0;
        v16[2] = 0;
        std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v16, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
        v16 += 3;
        v18 -= 24;
      }
      while (v18);
      *(_QWORD *)(a1 + 8) = v17;
    }
  }
  else
  {
    std::vector<std::vector<std::vector<float>>>::__vdeallocate((void ***)a1);
    v9 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3);
    if (v9 <= a2)
      v9 = a2;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100]((_QWORD *)a1, v10);
    v11 = *(_QWORD **)(a1 + 8);
    v12 = &v11[3 * a2];
    v13 = 24 * v7;
    do
    {
      *v11 = 0;
      v11[1] = 0;
      v11[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v11, v22, v23, 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3));
      v11 += 3;
      v13 -= 24;
    }
    while (v13);
    *(_QWORD *)(a1 + 8) = v12;
  }
  v25 = (void **)&v22;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v25);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1C266F6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, char *a16)
{
  a16 = &a12;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a16);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void NonlinearBeepCanceller::fcn_vector_init(_QWORD *a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, float a6)
{
  unint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t v27;
  void **v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  void **v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  void **v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  void *__p[3];
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  float v48;
  void **v49;
  char v50;

  v48 = a6;
  v9 = a4;
  std::vector<float>::vector(__p, a5, &v48);
  std::vector<std::vector<float>>::vector(&v43, v9, (uint64_t)__p);
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v49 = (void **)&v45;
  v50 = 0;
  if (a3)
  {
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](&v45, a3);
    v10 = v46;
    v11 = &v46[3 * a3];
    v12 = 24 * a3;
    do
    {
      *v10 = 0;
      v10[1] = 0;
      v10[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v10, v43, v44, 0xAAAAAAAAAAAAAAABLL * ((v44 - v43) >> 3));
      v10 += 3;
      v12 -= 24;
    }
    while (v12);
    v46 = v11;
  }
  v13 = a2;
  v14 = a1[2];
  v15 = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a1) >> 3) >= v13)
  {
    v40 = (a1[1] - v15) / 24;
    v41 = a1;
    if (v40 >= v13)
      v24 = v13;
    else
      v24 = (a1[1] - v15) / 24;
    if (!v24)
    {
LABEL_41:
      if (v13 <= v40)
      {
        v38 = (void **)v41[1];
        v39 = *v41 + 24 * v13;
        while (v38 != (void **)v39)
        {
          v38 -= 3;
          v49 = v38;
          std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v49);
        }
        v41[1] = v39;
      }
      else
      {
        v35 = (_QWORD *)v41[1];
        v36 = &v35[3 * (v13 - v40)];
        v37 = 24 * v13 - 24 * v40;
        do
        {
          *v35 = 0;
          v35[1] = 0;
          v35[2] = 0;
          std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v35, v45, v46, 0xAAAAAAAAAAAAAAABLL * (v46 - v45));
          v35 += 3;
          v37 -= 24;
        }
        while (v37);
        v41[1] = v36;
      }
      goto LABEL_49;
    }
    while (1)
    {
      if ((uint64_t **)v15 != &v45)
      {
        v26 = v45;
        v25 = v46;
        v27 = 0xAAAAAAAAAAAAAAABLL * (v46 - v45);
        v28 = *(void ***)v15;
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v15 + 16) - *(_QWORD *)v15) >> 3) >= v27)
        {
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v15 + 8) - (_QWORD)v28) >> 3) >= v27)
          {
            v33 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<std::vector<float>> *,std::vector<std::vector<float>> *,std::vector<std::vector<float>> *>(v45, v46, (uint64_t)v28);
            v34 = *(void ***)(v15 + 8);
            while (v34 != (void **)v33)
            {
              v34 -= 3;
              v49 = v34;
              std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v49);
            }
            *(_QWORD *)(v15 + 8) = v33;
            goto LABEL_40;
          }
          v32 = &v45[(uint64_t)(*(_QWORD *)(v15 + 8) - (_QWORD)v28) >> 3];
          std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<std::vector<float>> *,std::vector<std::vector<float>> *,std::vector<std::vector<float>> *>(v45, v32, (uint64_t)v28);
          v31 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v15 + 16, v32, v25, *(_QWORD **)(v15 + 8));
        }
        else
        {
          std::vector<std::vector<std::vector<float>>>::__vdeallocate((void ***)v15);
          if (v27 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]();
          v29 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)(v15 + 16) - *(_QWORD *)v15) >> 3);
          if (v29 <= v27)
            v29 = v27;
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v15 + 16) - *(_QWORD *)v15) >> 3) >= 0x555555555555555)
            v30 = 0xAAAAAAAAAAAAAAALL;
          else
            v30 = v29;
          std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100]((_QWORD *)v15, v30);
          v31 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v15 + 16, v26, v25, *(_QWORD **)(v15 + 8));
        }
        *(_QWORD *)(v15 + 8) = v31;
      }
LABEL_40:
      v15 += 24;
      if (!--v24)
        goto LABEL_41;
    }
  }
  if (v15)
  {
    v16 = (void **)a1[1];
    v17 = (void *)*a1;
    if (v16 != (void **)v15)
    {
      do
      {
        v16 -= 3;
        v49 = v16;
        std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v49);
      }
      while (v16 != (void **)v15);
      v17 = (void *)*a1;
    }
    a1[1] = v15;
    operator delete(v17);
    v14 = 0;
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  v18 = 0xAAAAAAAAAAAAAAABLL * (v14 >> 3);
  v19 = 2 * v18;
  if (2 * v18 <= v13)
    v19 = v13;
  if (v18 >= 0x555555555555555)
    v20 = 0xAAAAAAAAAAAAAAALL;
  else
    v20 = v19;
  if (v20 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]();
  v21 = operator new(24 * v20);
  *a1 = v21;
  a1[1] = v21;
  a1[2] = &v21[3 * v20];
  v22 = &v21[3 * v13];
  v23 = 24 * v13;
  do
  {
    *v21 = 0;
    v21[1] = 0;
    v21[2] = 0;
    std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v21, v45, v46, 0xAAAAAAAAAAAAAAABLL * (v46 - v45));
    v21 += 3;
    v23 -= 24;
  }
  while (v23);
  a1[1] = v22;
LABEL_49:
  v49 = (void **)&v45;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v49);
  v49 = (void **)&v43;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v49);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1C266FB1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char *a21)
{
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  a21 = &a14;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1C266FC0C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<std::vector<float>>::vector(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = 3 * a2;
    v8 = &v6[3 * a2];
    v9 = 8 * v7;
    do
    {
      *v6 = 0;
      v6[1] = 0;
      v6[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v6, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
      v6 += 3;
      v9 -= 24;
    }
    while (v9);
    a1[1] = v8;
  }
  return a1;
}

void sub_1C266FCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        v6 = v4;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

_QWORD *std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(_QWORD *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1C266FE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E7C22578, MEMORY[0x1E0DE42D0]);
}

void sub_1C266FEF0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

char *std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  uint64_t v3;
  char *result;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]();
  v3 = 3 * a2;
  result = (char *)operator new(24 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v3];
  return result;
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t *v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(v4, *v6, v6[1], 0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 3));
      v4 = v11 + 3;
      v11 += 3;
      v6 += 3;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_1C267001C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::vector<float>>::__init_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1C2670094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::vector<float>>>,std::vector<std::vector<float>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  void **v3;
  void **v4;
  void **v5;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = **(void ****)(a1 + 16);
    v4 = **(void ****)(a1 + 8);
    while (v3 != v4)
    {
      v3 -= 3;
      v5 = v3;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v5);
    }
  }
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v4, *(const void **)v6, *(_QWORD *)(v6 + 8), (uint64_t)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 2);
      v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_1C26701C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1C2670230(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (!*(_BYTE *)(a1 + 24))
  {
    v2 = **(_QWORD **)(a1 + 16);
    v3 = **(_QWORD **)(a1 + 8);
    if (v2 != v3)
    {
      v4 = **(_QWORD **)(a1 + 16);
      do
      {
        v6 = *(void **)(v4 - 24);
        v4 -= 24;
        v5 = v6;
        if (v6)
        {
          *(_QWORD *)(v2 - 16) = v5;
          operator delete(v5);
        }
        v2 = v4;
      }
      while (v4 != v3);
    }
  }
  return a1;
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<std::vector<float>> *,std::vector<std::vector<float>> *,std::vector<std::vector<float>> *>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v5;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      if (v5 != (uint64_t *)a3)
        std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(a3, *v5, v5[1], 0xAAAAAAAAAAAAAAABLL * ((v5[1] - *v5) >> 3));
      v5 += 3;
      a3 += 24;
    }
    while (v5 != a2);
  }
  return a3;
}

void std::vector<std::vector<std::vector<float>>>::__vdeallocate(void ***a1)
{
  void **v1;
  void **v3;
  void **v4;
  void **v5;

  v1 = *a1;
  if (*a1)
  {
    v3 = a1[1];
    v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        v3 -= 3;
        v5 = v3;
        std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v5);
      }
      while (v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<std::vector<float>>::__assign_with_size[abi:ne180100]<std::vector<float>*,std::vector<float>*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  void *v17;
  void *v18;

  v8 = a1 + 16;
  v9 = *(char **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) < a4)
  {
    std::vector<std::vector<float>>::__vdeallocate((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]();
    v10 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3);
    if (v10 <= a4)
      v10 = a4;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v10;
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100]((_QWORD *)a1, v11);
    v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(v8, a2, a3, *(_QWORD **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3) < a4)
  {
    v13 = a2 + 8 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<float> *,std::vector<float> *,std::vector<float> *>(a2, v13, v9);
    v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(v8, v13, a3, *(_QWORD **)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = v12;
    return;
  }
  v14 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<float> *,std::vector<float> *,std::vector<float> *>(a2, a3, v9);
  v15 = *(char **)(a1 + 8);
  if (v15 != v14)
  {
    v16 = *(char **)(a1 + 8);
    do
    {
      v18 = (void *)*((_QWORD *)v16 - 3);
      v16 -= 24;
      v17 = v18;
      if (v18)
      {
        *((_QWORD *)v15 - 2) = v17;
        operator delete(v17);
      }
      v15 = v16;
    }
    while (v16 != v14);
  }
  *(_QWORD *)(a1 + 8) = v14;
}

void sub_1C2670564(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1C267056C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

char *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::vector<float> *,std::vector<float> *,std::vector<float> *>(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v5;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      if ((char *)v5 != a3)
        std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(a3, *(char **)v5, *(_QWORD *)(v5 + 8), (uint64_t)(*(_QWORD *)(v5 + 8) - *(_QWORD *)v5) >> 2);
      v5 += 24;
      a3 += 24;
    }
    while (v5 != a2);
  }
  return a3;
}

void std::vector<std::vector<float>>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

uint64_t NonlinearBeepCanceller::nl_proc(NonlinearBeepCanceller *this, const AudioBufferList *a2, const AudioBufferList *a3, AudioBufferList *a4, AudioBufferList *a5, AudioBufferList *a6, AudioBufferList *a7)
{
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  char *v15;
  unsigned int v16;
  unsigned int v17;
  vDSP_Length v18;
  float *v19;
  float *v20;
  float *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  float v27;
  float v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  int64_t v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  char *v53;
  uint64_t v54;
  __int128 v55;
  void *v56;
  __int128 v57;
  char *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  void *v88;
  char *v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  int64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  __int128 v103;
  char *v104;
  uint64_t v105;
  float *v106;
  float *v107;
  float *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  float *v116;
  uint64_t v117;
  uint64_t v118;
  float *v119;
  float *v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  __int128 v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char *v132;
  uint64_t v133;
  char *v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  unint64_t v142;
  void **v143;
  void *v144;
  unint64_t v145;
  unint64_t i;
  unint64_t v147;
  uint64_t v148;
  float *v149;
  float *v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  uint64_t v154;
  float *v155;
  uint64_t v156;
  int v157;
  uint64_t v158;
  float *v159;
  float *v160;
  float *v161;
  float *v162;
  float *v163;
  uint64_t v164;
  float v165;
  unsigned int v166;
  uint64_t v167;
  float v168;
  int v169;
  unint64_t v170;
  uint64_t v171;
  float *v172;
  unint64_t v173;
  uint64_t v174;
  float *v175;
  float *v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  unsigned int v180;
  uint64_t v181;
  int v182;
  uint64_t v183;
  uint64_t v184;
  float *v185;
  float *v186;
  _QWORD *v187;
  float *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  float *v194;
  float *v195;
  float *v196;
  float *v197;
  float *v198;
  float *v199;
  float *v200;
  float *v201;
  float *v202;
  float *v203;
  uint64_t v204;
  unint64_t v205;
  uint64_t v206;
  unint64_t v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  unsigned int v211;
  float *v212;
  float *v213;
  uint64_t v214;
  uint64_t v215;
  float *v216;
  float *v217;
  float *v218;
  float *v219;
  unint64_t v220;
  uint64_t v221;
  unint64_t v222;
  void **v223;
  void **v224;
  void **v225;
  const float *v226;
  void *v227;
  uint64_t v228;
  int v229;
  int v230;
  uint64_t v231;
  uint64_t v232;
  int v233;
  int v234;
  uint64_t v235;
  unint64_t v236;
  void **v237;
  void **v238;
  void **v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  float *v244;
  uint64_t v245;
  int v246;
  int v247;
  uint64_t v248;
  uint64_t v249;
  int v250;
  int v251;
  const AudioBufferList *v253;
  uint64_t v259;
  void *v260;
  void **p_mData;
  uint64_t v262;
  uint64_t v263;
  __int128 v264;
  __int128 v265;
  unsigned int v266;
  uint64_t v267;
  const float *__src;
  unsigned int v269;
  uint64_t v270;
  float **v271;
  int v272[2];
  int v273[2];
  float *v274[2];
  unint64_t v275;
  void *v276;
  float v277;
  uint64_t __C;
  DSPSplitComplex v279;
  DSPSplitComplex __B;
  DSPSplitComplex v281;
  DSPSplitComplex __D;
  DSPSplitComplex v283;
  DSPSplitComplex __A;

  v9 = *((_QWORD *)this + 20);
  if (v9)
  {
    v10 = *((_QWORD *)this + 19);
    do
    {
      --v9;
      *((_QWORD *)this + 19) = ++v10;
      *((_QWORD *)this + 20) = v9;
      if (v10 >= 0x800)
      {
        operator delete(**((void ***)this + 16));
        *((_QWORD *)this + 16) += 8;
        v9 = *((_QWORD *)this + 20);
        v10 = *((_QWORD *)this + 19) - 1024;
        *((_QWORD *)this + 19) = v10;
      }
    }
    while (v9);
  }
  __C = 0;
  v277 = 0.0;
  if (*((_DWORD *)this + 17))
  {
    v253 = a2;
    v11 = 0;
    v12 = 0;
    v271 = (float **)((char *)this + 288);
    while (1)
    {
      __src = (const float *)a3->mBuffers[v12].mData;
      vDSP_vmul(__src, 1, __src, 1, *((float **)this + 33), 1, *((unsigned int *)this + 18));
      if (*(_QWORD *)(*((_QWORD *)this + 21) + 24 * v12 + 8) != *(_QWORD *)(*((_QWORD *)this + 21) + 24 * v12))
        break;
LABEL_118:
      if (++v12 >= (unint64_t)*((unsigned int *)this + 17))
      {
        v270 = *((unsigned int *)this + 40);
        a2 = v253;
        goto LABEL_121;
      }
    }
    v13 = 0;
    v14 = 0;
    p_mData = &a6->mBuffers[v12].mData;
    v262 = v12;
    while (1)
    {
      v15 = *(char **)(*((_QWORD *)this + 42) + 24 * v11);
      memmove(v15, &v15[4 * *((unsigned int *)this + 18)], 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18)));
      memcpy((void *)(*(_QWORD *)(*((_QWORD *)this + 42) + 24 * v11)+ 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18))), __src, 4 * *((unsigned int *)this + 18));
      v16 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)this + 21) + 24 * v12) + 4 * v13);
      if (v16 >= 2)
      {
        v17 = v16 >> 1;
        do
        {
          v18 = *((unsigned int *)this + 18);
          v19 = (float *)(*(_QWORD *)(*((_QWORD *)this + 42) + 24 * v11)
                        + 4 * (*((_DWORD *)this + 22) - v18));
          vDSP_vmul(v19, 1, *((const float **)this + 33), 1, v19, 1, v18);
          --v17;
        }
        while (v17);
      }
      NonlinearBeepCanceller::fcn_wola_analysis(*((const vDSP_DFT_SetupStruct **)this + 105), *(const float **)(*((_QWORD *)this + 42) + 24 * v11), *((const float **)this + 30), v271, *(float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v11) + 24 * *((unsigned int *)this + 27)), *((unsigned int *)this + 22), *((_DWORD *)this + 23), *((float *)this + 26));
      v20 = *(float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v11) + 24 * *((unsigned int *)this + 27));
      v21 = *(float **)(*(_QWORD *)(*((_QWORD *)this + 78) + 24 * v11) + 24 * *((unsigned int *)this + 27));
      v22 = *((unsigned int *)this + 23);
      __A.realp = v20 + 1;
      __A.imagp = &v20[(v22 + 1)];
      vDSP_zvmags(&__A, 1, v21 + 1, 1, (v22 - 1));
      *v21 = *v20 * *v20;
      v21[v22] = v20[v22] * v20[v22];
      v23 = *((_QWORD *)this + 27);
      *(_DWORD *)(v23 + 4 * v11) = 0;
      LODWORD(v24) = *(_DWORD *)this;
      if (*(_DWORD *)this)
      {
        v25 = 0;
        v26 = 0;
        do
        {
          vDSP_meanv(*(const float **)(*(_QWORD *)(*((_QWORD *)this + 78) + 24 * v11) + v25), 1, (float *)&__C + 1, *((unsigned int *)this + 24));
          v23 = *((_QWORD *)this + 27);
          v27 = *(float *)(v23 + 4 * v11) + *((float *)&__C + 1);
          *(float *)(v23 + 4 * v11) = v27;
          ++v26;
          v24 = *(unsigned int *)this;
          v25 += 24;
        }
        while (v26 < v24);
      }
      else
      {
        v27 = 0.0;
      }
      v28 = *((float *)this + 28) + (float)(v27 / (float)(*((_DWORD *)this + 22) * v24));
      *(float *)(v23 + 4 * v11) = v28;
      if ((float)(log10f(v28) * 10.0) <= *((float *)this + 11))
        goto LABEL_105;
      v29 = (char *)*((_QWORD *)this + 17);
      v30 = (char *)*((_QWORD *)this + 16);
      v31 = v29 - v30;
      v32 = v29 == v30 ? 0 : ((v29 - v30) << 7) - 1;
      v34 = *((_QWORD *)this + 19);
      v33 = *((_QWORD *)this + 20);
      v35 = v33 + v34;
      if (v32 == v33 + v34)
        break;
      v12 = v262;
LABEL_104:
      *(_DWORD *)(*(_QWORD *)&v30[(v35 >> 7) & 0x1FFFFFFFFFFFFF8] + 4 * (v35 & 0x3FF)) = v11;
      *((_QWORD *)this + 20) = v33 + 1;
LABEL_105:
      v127 = *((_QWORD *)this + 21);
      v128 = *(_QWORD *)(v127 + 24 * v12);
      if (*(_DWORD *)(v128 + 4 * v13) == 1)
      {
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v11) + 24 * *((unsigned int *)this + 27)), (const float **)this + 30, (const float **)(*((_QWORD *)this + 60) + 24 * v11), (const float **)v271, *p_mData, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        v127 = *((_QWORD *)this + 21);
        v128 = *(_QWORD *)(v127 + 24 * v12);
      }
      ++v11;
      v13 = ++v14;
      if (v14 >= (unint64_t)((*(_QWORD *)(v127 + 24 * v12 + 8) - v128) >> 2))
        goto LABEL_118;
    }
    v269 = v14;
    if (v34 < 0x400)
    {
      v48 = (char *)*((_QWORD *)this + 18);
      v49 = (char *)*((_QWORD *)this + 15);
      v263 = v31 >> 3;
      if (v31 >> 3 >= (unint64_t)((v48 - v49) >> 3))
      {
        if (v48 == v49)
          v52 = 1;
        else
          v52 = (v48 - v49) >> 2;
        v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v52);
        v259 = v54;
        *(_QWORD *)&v55 = v53;
        *((_QWORD *)&v55 + 1) = &v53[8 * v263];
        *(_OWORD *)v274 = v55;
        v56 = operator new(0x1000uLL);
        *(_QWORD *)&v57 = &v53[8 * v263];
        *((_QWORD *)&v57 + 1) = &v53[8 * v259];
        v58 = (char *)v57;
        if (v263 == v259)
        {
          v59 = v53;
          v60 = 8 * v263;
          v14 = v269;
          if (v31 < 1)
          {
            v260 = v56;
            v99 = v60 >> 2;
            if (v29 == v30)
              v100 = 1;
            else
              v100 = v99;
            v101 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v100);
            v12 = v262;
            v58 = &v101[8 * (v100 >> 2)];
            *(_QWORD *)&v103 = v101;
            *((_QWORD *)&v103 + 1) = v58;
            *(_OWORD *)v274 = v103;
            *(_QWORD *)&v57 = v58;
            *((_QWORD *)&v57 + 1) = &v101[8 * v102];
            if (v59)
            {
              v264 = v57;
              v104 = &v101[8 * (v100 >> 2)];
              operator delete(v59);
              v58 = v104;
              v57 = v264;
            }
            v56 = v260;
          }
          else
          {
            v61 = v60 >> 3;
            if (v61 >= -1)
              v62 = v61 + 1;
            else
              v62 = v61 + 2;
            v58 = (char *)(v57 - 8 * (v62 >> 1));
            *(_QWORD *)&v57 = v58;
            *(float **)&v63 = v274[0];
            *((_QWORD *)&v63 + 1) = v58;
            *(_OWORD *)v274 = v63;
            v12 = v262;
          }
        }
        else
        {
          v12 = v262;
          v14 = v269;
        }
        *(_QWORD *)v58 = v56;
        *(_QWORD *)&v57 = v57 + 8;
        v105 = *((_QWORD *)this + 17);
        while (v105 != *((_QWORD *)this + 16))
        {
          v106 = v274[1];
          if (v274[1] == v274[0])
          {
            v108 = (float *)v57;
            if ((unint64_t)v57 >= *((_QWORD *)&v57 + 1))
            {
              if (*((float **)&v57 + 1) == v274[1])
                v113 = 1;
              else
                v113 = (uint64_t)(*((_QWORD *)&v57 + 1) - (unint64_t)v274[1]) >> 2;
              v114 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v113);
              v107 = (float *)&v114[(2 * v113 + 6) & 0xFFFFFFFFFFFFFFF8];
              v116 = v107;
              v117 = (char *)v108 - (char *)v274[1];
              v64 = v108 == v274[1];
              v14 = v269;
              if (!v64)
              {
                v116 = (float *)((char *)v107 + (v117 & 0xFFFFFFFFFFFFFFF8));
                v118 = 8 * (v117 >> 3);
                v119 = v107;
                v120 = v274[1];
                do
                {
                  v121 = *(_QWORD *)v120;
                  v120 += 2;
                  *(_QWORD *)v119 = v121;
                  v119 += 2;
                  v118 -= 8;
                }
                while (v118);
              }
              *(_QWORD *)&v122 = v114;
              *((_QWORD *)&v122 + 1) = v107;
              *(_OWORD *)v274 = v122;
              *(_QWORD *)&v57 = v116;
              *((_QWORD *)&v57 + 1) = &v114[8 * v115];
              if (v106)
              {
                v265 = v57;
                operator delete(v106);
                v57 = v265;
              }
            }
            else
            {
              v109 = (uint64_t)(*((_QWORD *)&v57 + 1) - v57) >> 3;
              if (v109 >= -1)
                v110 = v109 + 1;
              else
                v110 = v109 + 2;
              v111 = v110 >> 1;
              v112 = v57 + 8 * (v110 >> 1);
              v107 = (float *)(v112 - (v57 - (unint64_t)v274[1]));
              if ((float *)v57 == v274[1])
              {
                v108 = v274[1];
              }
              else
              {
                v267 = *((_QWORD *)&v57 + 1);
                memmove((void *)(v112 - (v57 - (unint64_t)v274[1])), v274[1], v57 - (unint64_t)v274[1]);
                *((_QWORD *)&v57 + 1) = v267;
              }
              *(float **)&v123 = v274[0];
              *((_QWORD *)&v123 + 1) = v107;
              *(_OWORD *)v274 = v123;
              *(_QWORD *)&v57 = &v108[2 * v111];
              v12 = v262;
              v14 = v269;
            }
          }
          else
          {
            v107 = v274[1];
          }
          v124 = *(_QWORD *)(v105 - 8);
          v105 -= 8;
          *((_QWORD *)v107 - 1) = v124;
          *(float **)&v125 = v274[0];
          *((_QWORD *)&v125 + 1) = v274[1] - 2;
          *(_OWORD *)v274 = v125;
        }
        v126 = (void *)*((_QWORD *)this + 15);
        *(_OWORD *)((char *)this + 120) = *(_OWORD *)v274;
        *(_OWORD *)((char *)this + 136) = v57;
        if (v126)
          operator delete(v126);
        goto LABEL_103;
      }
      v50 = v48 - v49;
      v51 = operator new(0x1000uLL);
      if (v48 == v29)
      {
        v14 = v269;
        if (v49 == v30)
        {
          v77 = v51;
          if (v29 == v30)
            v78 = 1;
          else
            v78 = v50 >> 2;
          v79 = 2 * v78;
          v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v78);
          v30 = &v80[(v79 + 6) & 0xFFFFFFFFFFFFFFF8];
          v82 = (uint64_t *)*((_QWORD *)this + 16);
          v83 = v30;
          v84 = *((_QWORD *)this + 17) - (_QWORD)v82;
          if (v84)
          {
            v83 = &v30[v84 & 0xFFFFFFFFFFFFFFF8];
            v85 = 8 * (v84 >> 3);
            v86 = v30;
            do
            {
              v87 = *v82++;
              *(_QWORD *)v86 = v87;
              v86 += 8;
              v85 -= 8;
            }
            while (v85);
          }
          v88 = (void *)*((_QWORD *)this + 15);
          *((_QWORD *)this + 15) = v80;
          *((_QWORD *)this + 16) = v30;
          *((_QWORD *)this + 17) = v83;
          *((_QWORD *)this + 18) = &v80[8 * v81];
          v51 = v77;
          if (v88)
          {
            operator delete(v88);
            v51 = v77;
            v30 = (char *)*((_QWORD *)this + 16);
          }
        }
        *((_QWORD *)v30 - 1) = v51;
        v89 = (char *)*((_QWORD *)this + 16);
        v90 = (char *)*((_QWORD *)this + 17);
        *((_QWORD *)this + 16) = v89 - 8;
        v91 = *((_QWORD *)v89 - 1);
        *((_QWORD *)this + 16) = v89;
        v12 = v262;
        if (v90 == *((char **)this + 18))
        {
          v92 = *((_QWORD *)this + 15);
          v93 = (uint64_t)&v89[-v92];
          if ((unint64_t)v89 <= v92)
          {
            v129 = (uint64_t)&v90[-v92];
            v64 = v129 == 0;
            v130 = v129 >> 2;
            if (v64)
              v131 = 1;
            else
              v131 = v130;
            v132 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v131);
            v134 = &v132[8 * (v131 >> 2)];
            v135 = (uint64_t *)*((_QWORD *)this + 16);
            v90 = v134;
            v136 = *((_QWORD *)this + 17) - (_QWORD)v135;
            if (v136)
            {
              v90 = &v134[v136 & 0xFFFFFFFFFFFFFFF8];
              v137 = 8 * (v136 >> 3);
              v138 = &v132[8 * (v131 >> 2)];
              do
              {
                v139 = *v135++;
                *(_QWORD *)v138 = v139;
                v138 += 8;
                v137 -= 8;
              }
              while (v137);
            }
            v140 = (void *)*((_QWORD *)this + 15);
            *((_QWORD *)this + 15) = v132;
            *((_QWORD *)this + 16) = v134;
            *((_QWORD *)this + 17) = v90;
            *((_QWORD *)this + 18) = &v132[8 * v133];
            if (v140)
            {
              operator delete(v140);
              v90 = (char *)*((_QWORD *)this + 17);
            }
          }
          else
          {
            v94 = v93 >> 3;
            v42 = v93 >> 3 < -1;
            v95 = (v93 >> 3) + 2;
            if (v42)
              v96 = v95;
            else
              v96 = v94 + 1;
            v97 = &v89[-8 * (v96 >> 1)];
            v98 = v90 - v89;
            if (v90 != v89)
            {
              memmove(&v89[-8 * (v96 >> 1)], v89, v90 - v89);
              v89 = (char *)*((_QWORD *)this + 16);
            }
            v90 = &v97[v98];
            *((_QWORD *)this + 16) = &v89[-8 * (v96 >> 1)];
            *((_QWORD *)this + 17) = &v97[v98];
            v14 = v269;
          }
        }
        *(_QWORD *)v90 = v91;
        *((_QWORD *)this + 17) += 8;
        goto LABEL_103;
      }
      *(_QWORD *)v29 = v51;
      *((_QWORD *)this + 17) += 8;
      v12 = v262;
    }
    else
    {
      *((_QWORD *)this + 19) = v34 - 1024;
      v38 = *(_QWORD *)v30;
      v36 = v30 + 8;
      v37 = v38;
      *((_QWORD *)this + 16) = v36;
      v12 = v262;
      if (*((char **)this + 18) == v29)
      {
        v39 = *((_QWORD *)this + 15);
        v40 = (uint64_t)&v36[-v39];
        if ((unint64_t)v36 <= v39)
        {
          v65 = (uint64_t)&v29[-v39];
          v64 = v65 == 0;
          v66 = v65 >> 2;
          if (v64)
            v67 = 1;
          else
            v67 = v66;
          v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v67);
          v70 = &v68[8 * (v67 >> 2)];
          v71 = (uint64_t *)*((_QWORD *)this + 16);
          v29 = v70;
          v72 = *((_QWORD *)this + 17) - (_QWORD)v71;
          if (v72)
          {
            v29 = &v70[v72 & 0xFFFFFFFFFFFFFFF8];
            v73 = 8 * (v72 >> 3);
            v74 = &v68[8 * (v67 >> 2)];
            do
            {
              v75 = *v71++;
              *(_QWORD *)v74 = v75;
              v74 += 8;
              v73 -= 8;
            }
            while (v73);
          }
          v76 = (void *)*((_QWORD *)this + 15);
          *((_QWORD *)this + 15) = v68;
          *((_QWORD *)this + 16) = v70;
          *((_QWORD *)this + 17) = v29;
          *((_QWORD *)this + 18) = &v68[8 * v69];
          if (v76)
          {
            operator delete(v76);
            v29 = (char *)*((_QWORD *)this + 17);
          }
        }
        else
        {
          v41 = v40 >> 3;
          v42 = v40 >> 3 < -1;
          v43 = (v40 >> 3) + 2;
          if (v42)
            v44 = v43;
          else
            v44 = v41 + 1;
          v45 = &v36[-8 * (v44 >> 1)];
          v46 = v29 - v36;
          if (v29 == v36)
          {
            v47 = v29;
          }
          else
          {
            memmove(&v36[-8 * (v44 >> 1)], v36, v29 - v36);
            v45 = &v36[-8 * (v44 >> 1)];
            v47 = (char *)*((_QWORD *)this + 16);
          }
          v29 = &v45[v46];
          *((_QWORD *)this + 16) = &v47[-8 * (v44 >> 1)];
          *((_QWORD *)this + 17) = &v45[v46];
          v12 = v262;
        }
      }
      *(_QWORD *)v29 = v37;
      *((_QWORD *)this + 17) += 8;
    }
    v14 = v269;
LABEL_103:
    v30 = (char *)*((_QWORD *)this + 16);
    v33 = *((_QWORD *)this + 20);
    v35 = *((_QWORD *)this + 19) + v33;
    goto LABEL_104;
  }
  v270 = 0;
LABEL_121:
  if (*((_DWORD *)this + 16))
  {
    v141 = 0;
    v142 = 0;
    v143 = &a2->mBuffers[0].mData;
    do
    {
      v144 = *v143;
      v143 += 2;
      memmove(*(void **)(*((_QWORD *)this + 45) + v141), (const void *)(*(_QWORD *)(*((_QWORD *)this + 45) + v141) + 4 * *((unsigned int *)this + 18)), 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18)));
      memcpy((void *)(*(_QWORD *)(*((_QWORD *)this + 45) + v141)+ 4 * (*((_DWORD *)this + 22) - *((_DWORD *)this + 18))), v144, 4 * *((unsigned int *)this + 18));
      NonlinearBeepCanceller::fcn_wola_analysis(*((const vDSP_DFT_SetupStruct **)this + 105), *(const float **)(*((_QWORD *)this + 45) + v141), *((const float **)this + 30), (float **)this + 36, *(float **)(*((_QWORD *)this + 66) + v141), *((unsigned int *)this + 22), *((_DWORD *)this + 23), *((float *)this + 26));
      ++v142;
      v145 = *((unsigned int *)this + 16);
      v141 += 24;
    }
    while (v142 < v145);
    if ((_DWORD)v270)
    {
      if ((_DWORD)v145)
      {
        for (i = 0; i < v145; ++i)
        {
          vDSP_vclr(*(float **)(*((_QWORD *)this + 72) + 24 * i), 1, *((unsigned int *)this + 24));
          vDSP_vclr(*(float **)(*((_QWORD *)this + 48) + 24 * i), 1, *((unsigned int *)this + 22));
          v147 = 0;
          v148 = *(_QWORD *)(*((_QWORD *)this + 48) + 24 * i);
          v149 = (float *)(v148 + 4);
          v150 = (float *)(v148 + 4 * (*((_DWORD *)this + 23) + 1));
          __D.realp = v149;
          __D.imagp = v150;
          do
          {
            if (*((_QWORD *)this + 20) <= v147)
LABEL_196:
              std::__throw_out_of_range[abi:ne180100]();
            if (*(_DWORD *)this)
            {
              v151 = 0;
              v152 = 0;
              v153 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)this + 16)
                                                 + (((*((_QWORD *)this + 19) + v147) >> 7) & 0x1FFFFFFFFFFFFF8))
                                     + 4 * ((*((_QWORD *)this + 19) + v147) & 0x3FF));
              do
              {
                v154 = *(unsigned int *)(*((_QWORD *)this + 24) + 4 * v152);
                v155 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * i) + 24 * v153) + v151);
                vDSP_vsmul(v155, 1, (const float *)this + 4, v155, 1, *((unsigned int *)this + 22));
                v154 *= 3;
                v156 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v153) + 8 * v154);
                v157 = *((_DWORD *)this + 23);
                v283.realp = (float *)(v156 + 4);
                v283.imagp = (float *)(v156 + 4 * (v157 + 1));
                v158 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * i) + 24 * v153) + v151);
                __B.realp = (float *)(v158 + 4);
                __B.imagp = (float *)(v158 + 4 * (v157 + 1));
                vDSP_zvma(&v283, 1, &__B, 1, &__D, 1, &__D, 1, (v157 - 1));
                v159 = *(float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v153) + 8 * v154);
                v160 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * i) + 24 * v153) + v151);
                v161 = *(float **)(*((_QWORD *)this + 48) + 24 * i);
                *v161 = *v161 + (float)(*v159 * *v160);
                v161[*((unsigned int *)this + 23)] = v161[*((unsigned int *)this + 23)]
                                                   + (float)(v159[*((unsigned int *)this + 23)]
                                                           * v160[*((unsigned int *)this + 23)]);
                NonlinearBeepCanceller::fcn_smooth_psd(*(NonlinearBeepCanceller **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * i) + 24 * v153)+ v151), *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 90) + 24 * i) + 24 * v153) + v151), *((float *)this + 1), *((float *)this + 5), (float *)1, *((float *)this + 10), *((_DWORD *)this + 24));
                vDSP_vmul(*(const float **)(*(_QWORD *)(*((_QWORD *)this + 78) + 24 * v153) + 8 * v154), 1, *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * i) + 24 * v153) + v151), 1, *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * i) + 24 * v153) + v151), 1, *((unsigned int *)this + 24));
                vDSP_vadd(*(const float **)(*((_QWORD *)this + 72) + 24 * i), 1, *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * i) + 24 * v153) + v151), 1, *(float **)(*((_QWORD *)this + 72) + 24 * i), 1, *((unsigned int *)this + 24));
                NonlinearBeepCanceller::fcn_complex_mult_by_psd(*(NonlinearBeepCanceller **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v153) + 8 * v154), *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * i) + 24 * v153) + v151), *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 87) + 24 * i) + 24 * v153) + v151), *((unsigned int *)this + 23));
                ++v152;
                v151 += 24;
              }
              while (v152 < *(unsigned int *)this);
            }
            ++v147;
          }
          while (v147 != v270);
          vDSP_vsub(*(const float **)(*((_QWORD *)this + 48) + 24 * i), 1, *(const float **)(*((_QWORD *)this + 66) + 24 * i), 1, *(float **)(*((_QWORD *)this + 63) + 24 * i), 1, *((unsigned int *)this + 22));
          v162 = *(float **)(*((_QWORD *)this + 63) + 24 * i);
          v163 = *(float **)(*((_QWORD *)this + 69) + 24 * i);
          v164 = *((unsigned int *)this + 23);
          __A.realp = v162 + 1;
          __A.imagp = &v162[(v164 + 1)];
          vDSP_zvmags(&__A, 1, v163 + 1, 1, (v164 - 1));
          *v163 = *v162 * *v162;
          v163[v164] = v162[v164] * v162[v164];
          vDSP_meanv(*(const float **)(*((_QWORD *)this + 69) + 24 * i), 1, (float *)(*((_QWORD *)this + 39) + 4 * i), *((unsigned int *)this + 24));
          *(float *)(*((_QWORD *)this + 39) + 4 * i) = *((float *)this + 6)
                                                     + (float)(*(float *)(*((_QWORD *)this + 39) + 4 * i)
                                                             * *((float *)this + 7));
          v145 = *((unsigned int *)this + 16);
        }
      }
      goto LABEL_137;
    }
    if ((_DWORD)v145)
    {
      v235 = 0;
      v236 = 0;
      v237 = &a5->mBuffers[0].mData;
      v238 = &a4->mBuffers[0].mData;
      v239 = &a7->mBuffers[0].mData;
      do
      {
        v241 = *v239;
        v239 += 2;
        v240 = v241;
        v243 = *v238;
        v238 += 2;
        v242 = v243;
        v244 = (float *)*v237;
        v237 += 2;
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((_QWORD *)this + 66) + v235), (const float **)this + 30, (const float **)(*((_QWORD *)this + 57) + v235), (const float **)this + 36, v240, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        memcpy(v242, v240, 4 * *((unsigned int *)this + 18));
        vDSP_vclr(v244, 1, *((unsigned int *)this + 18));
        vDSP_vclr(*(float **)(*((_QWORD *)this + 51) + v235), 1, *((unsigned int *)this + 22));
        vDSP_vclr(*(float **)(*((_QWORD *)this + 54) + v235), 1, *((unsigned int *)this + 22));
        ++v236;
        v235 += 24;
      }
      while (v236 < *((unsigned int *)this + 16));
    }
LABEL_186:
    v245 = *(unsigned int *)this;
    v246 = *((_DWORD *)this + 27);
    if (v246 + 1 == (_DWORD)v245)
      v247 = 0;
    else
      v247 = v246 + 1;
    *((_DWORD *)this + 27) = v247;
    if ((_DWORD)v245)
    {
      v248 = 0;
      do
      {
        v249 = *((_QWORD *)this + 24);
        v250 = *(_DWORD *)(v249 + v248);
        if (v250 + 1 == (_DWORD)v245)
          v251 = 0;
        else
          v251 = v250 + 1;
        *(_DWORD *)(v249 + v248) = v251;
        v248 += 4;
      }
      while (4 * v245 != v248);
    }
    return 0;
  }
  if (!(_DWORD)v270)
    goto LABEL_186;
  LODWORD(v145) = 0;
LABEL_137:
  v165 = *((float *)this + 8);
  if (v165 > 0.0)
  {
    v166 = 0;
    if (v270 <= 1)
      v167 = 1;
    else
      v167 = v270;
    *(_QWORD *)v272 = v167;
    v168 = 0.0;
    v169 = v145;
    do
    {
      if (v169)
      {
        v266 = v166;
        v170 = 0;
        v171 = *((_QWORD *)this + 39);
        do
        {
          vDSP_vsadd(*(const float **)(*((_QWORD *)this + 72) + 24 * v170), 1, (const float *)(v171 + 4 * v170), *(float **)(*((_QWORD *)this + 102) + 24 * v170), 1, *((unsigned int *)this + 24));
          v172 = *(float **)(*((_QWORD *)this + 102) + 24 * v170);
          vDSP_svdiv((const float *)this + 9, v172, 1, v172, 1, *((unsigned int *)this + 24));
          NonlinearBeepCanceller::fcn_complex_mult_by_psd(*(NonlinearBeepCanceller **)(*((_QWORD *)this + 63) + 24 * v170), *(const float **)(*((_QWORD *)this + 102) + 24 * v170), *(float **)(*((_QWORD *)this + 63) + 24 * v170), *((unsigned int *)this + 23));
          vDSP_vclr(*(float **)(*((_QWORD *)this + 48) + 24 * v170), 1, *((unsigned int *)this + 22));
          v173 = 0;
          v174 = *(_QWORD *)(*((_QWORD *)this + 48) + 24 * v170);
          v175 = (float *)(v174 + 4);
          v176 = (float *)(v174 + 4 * (*((_DWORD *)this + 23) + 1));
          __D.realp = v175;
          __D.imagp = v176;
          do
          {
            if (*((_QWORD *)this + 20) <= v173)
              goto LABEL_196;
            if (*(_DWORD *)this)
            {
              v177 = 0;
              v178 = 0;
              v179 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)this + 16)
                                                 + (((*((_QWORD *)this + 19) + v173) >> 7) & 0x1FFFFFFFFFFFFF8))
                                     + 4 * ((*((_QWORD *)this + 19) + v173) & 0x3FF));
              do
              {
                v180 = *(_DWORD *)(*((_QWORD *)this + 24) + 4 * v178);
                v181 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 87) + 24 * v170) + 24 * v179) + v177);
                v182 = *((_DWORD *)this + 23);
                v283.realp = (float *)(v181 + 4);
                v283.imagp = (float *)(v181 + 4 * (v182 + 1));
                v183 = *(_QWORD *)(*((_QWORD *)this + 63) + 24 * v170);
                v279.realp = (float *)(v183 + 4);
                v279.imagp = (float *)(v183 + 4 * (v182 + 1));
                v184 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * v170) + 24 * v179) + v177);
                __B.realp = (float *)(v184 + 4);
                __B.imagp = (float *)(v184 + 4 * (v182 + 1));
                vDSP_zvcma(&v283, 1, &v279, 1, &__B, 1, &__B, 1, (v182 - 1));
                v185 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 87) + 24 * v170) + 24 * v179) + v177);
                v186 = *(float **)(*((_QWORD *)this + 63) + 24 * v170);
                v187 = (_QWORD *)(*((_QWORD *)this + 81) + 24 * v170);
                v188 = *(float **)(*(_QWORD *)(*v187 + 24 * v179) + v177);
                *v188 = *v188 + (float)(*v185 * *v186);
                v189 = *((unsigned int *)this + 23);
                v188[v189] = v188[v189] + (float)(v185[v189] * v186[v189]);
                v190 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v179) + 24 * v180);
                v191 = (v189 + 1);
                v283.realp = (float *)(v190 + 4);
                v283.imagp = (float *)(v190 + 4 * v191);
                v192 = *(_QWORD *)(*(_QWORD *)(*v187 + 24 * v179) + v177);
                __B.realp = (float *)(v192 + 4);
                __B.imagp = (float *)(v192 + 4 * v191);
                if ((float)(*((float *)this + 8) + -1.0) == v168)
                {
                  v193 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 93) + 24 * v170) + 24 * v179) + v177);
                  v281.realp = (float *)(v193 + 4);
                  v281.imagp = (float *)(v193 + 4 * v191);
                  vDSP_zvmul(&v283, 1, &__B, 1, &v281, 1, (v189 - 1), 1);
                  v194 = *(float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v179) + 24 * v180);
                  v195 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * v170) + 24 * v179) + v177);
                  v196 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 93) + 24 * v170) + 24 * v179) + v177);
                  *v196 = *v194 * *v195;
                  v196[*((unsigned int *)this + 23)] = v194[*((unsigned int *)this + 23)]
                                                     * v195[*((unsigned int *)this + 23)];
                  v197 = *(float **)(*((_QWORD *)this + 48) + 24 * v170);
                  vDSP_vadd(v196, 1, v197, 1, v197, 1, *((unsigned int *)this + 22));
                }
                else
                {
                  v198 = *(float **)(*(_QWORD *)(*v187 + 24 * v179) + v177);
                  vDSP_vsmul(v198, 1, (const float *)this + 4, v198, 1, *((unsigned int *)this + 22));
                  vDSP_zvma(&v283, 1, &__B, 1, &__D, 1, &__D, 1, (*((_DWORD *)this + 23) - 1));
                  v199 = *(float **)(*(_QWORD *)(*((_QWORD *)this + 75) + 24 * v179) + 24 * v180);
                  v200 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 81) + 24 * v170) + 24 * v179) + v177);
                  v201 = *(float **)(*((_QWORD *)this + 48) + 24 * v170);
                  *v201 = *v201 + (float)(*v199 * *v200);
                  v201[*((unsigned int *)this + 23)] = v201[*((unsigned int *)this + 23)]
                                                     + (float)(v199[*((unsigned int *)this + 23)]
                                                             * v200[*((unsigned int *)this + 23)]);
                }
                ++v178;
                v177 += 24;
              }
              while (v178 < *(unsigned int *)this);
            }
            ++v173;
          }
          while (v173 != *(_QWORD *)v272);
          vDSP_vsub(*(const float **)(*((_QWORD *)this + 48) + 24 * v170), 1, *(const float **)(*((_QWORD *)this + 66) + 24 * v170), 1, *(float **)(*((_QWORD *)this + 63) + 24 * v170), 1, *((unsigned int *)this + 22));
          v202 = *(float **)(*((_QWORD *)this + 63) + 24 * v170);
          v203 = *(float **)(*((_QWORD *)this + 69) + 24 * v170);
          v204 = *((unsigned int *)this + 23);
          __A.realp = v202 + 1;
          __A.imagp = &v202[(v204 + 1)];
          vDSP_zvmags(&__A, 1, v203 + 1, 1, (v204 - 1));
          *v203 = *v202 * *v202;
          v203[v204] = v202[v204] * v202[v204];
          vDSP_meanv(*(const float **)(*((_QWORD *)this + 69) + 24 * v170), 1, (float *)(*((_QWORD *)this + 39) + 4 * v170), *((unsigned int *)this + 24));
          v171 = *((_QWORD *)this + 39);
          *(float *)(v171 + 4 * v170) = *((float *)this + 6)
                                      + (float)(*(float *)(v171 + 4 * v170) * *((float *)this + 7));
          ++v170;
          v145 = *((unsigned int *)this + 16);
        }
        while (v170 < v145);
        v165 = *((float *)this + 8);
        v169 = *((_DWORD *)this + 16);
        v166 = v266;
      }
      v168 = (float)++v166;
    }
    while (v165 > (float)v166);
  }
  if ((_DWORD)v145)
  {
    v205 = 0;
    if (v270 <= 1)
      v206 = 1;
    else
      v206 = v270;
    *(_QWORD *)v273 = v206;
    do
    {
      v207 = 0;
      do
      {
        if (*((_QWORD *)this + 20) <= v207)
          goto LABEL_196;
        v275 = v207;
        if (*(_DWORD *)this)
        {
          v208 = 0;
          v209 = 0;
          v210 = *(unsigned int *)(*(_QWORD *)(*((_QWORD *)this + 16)
                                             + (((*((_QWORD *)this + 19) + v207) >> 7) & 0x1FFFFFFFFFFFFF8))
                                 + 4 * ((*((_QWORD *)this + 19) + v207) & 0x3FF));
          do
          {
            v211 = *(_DWORD *)(*((_QWORD *)this + 24) + 4 * v209);
            vDSP_vmul(*(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *(const float **)(*((_QWORD *)this + 102) + 24 * v205), 1, *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *((unsigned int *)this + 24));
            vDSP_vmul(*(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * v205) + 24 * v210) + v208), 1, *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, *((unsigned int *)this + 24));
            v212 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * v205) + 24 * v210) + v208);
            vDSP_vsub(*(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 99) + 24 * v205) + 24 * v210) + v208), 1, v212, 1, v212, 1, *((unsigned int *)this + 24));
            v213 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 84) + 24 * v205) + 24 * v210) + v208);
            vDSP_vabs(v213, 1, v213, 1, *((unsigned int *)this + 24));
            v214 = *(_QWORD *)(*((_QWORD *)this + 63) + 24 * v205);
            v215 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 93) + 24 * v205) + 24 * v210) + v208);
            vDSP_vmma((const float *)(v214 + 4), 1, (const float *)(v215 + 4), 1, (const float *)(v214 + 4 * (*((_DWORD *)this + 23) + 1)), 1, (const float *)(v215 + 4 * (*((_DWORD *)this + 23) + 1)), 1, (float *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 96) + 24 * v205) + 24 * v210) + v208)+ 4), 1, (*((_DWORD *)this + 23) - 1));
            v216 = *(float **)(*((_QWORD *)this + 63) + 24 * v205);
            v217 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 93) + 24 * v205) + 24 * v210) + v208);
            v218 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 96) + 24 * v205) + 24 * v210) + v208);
            *v218 = *v216 * *v217;
            v218[*((unsigned int *)this + 23)] = v216[*((unsigned int *)this + 23)] * v217[*((unsigned int *)this + 23)];
            vDSP_vsadd(*(const float **)(*(_QWORD *)(*((_QWORD *)this + 78) + 24 * v210) + 24 * v211), 1, (const float *)this + 6, *(float **)(*((_QWORD *)this + 69) + 24 * v205), 1, *((unsigned int *)this + 24));
            v219 = *(float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 96) + 24 * v205) + 24 * v210) + v208);
            vDSP_vdiv(*(const float **)(*((_QWORD *)this + 69) + 24 * v205), 1, v219, 1, v219, 1, *((unsigned int *)this + 24));
            NonlinearBeepCanceller::fcn_smooth_psd(*(NonlinearBeepCanceller **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 90) + 24 * v205) + 24 * v210)+ v208), *(const float **)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 96) + 24 * v205) + 24 * v210) + v208), *((float *)this + 2), *((float *)this + 3), 0, *((float *)this + 29), *((_DWORD *)this + 24));
            ++v209;
            v208 += 24;
          }
          while (v209 < *(unsigned int *)this);
        }
        v207 = v275 + 1;
      }
      while (v275 + 1 != *(_QWORD *)v273);
      ++v205;
      v220 = *((unsigned int *)this + 16);
    }
    while (v205 < v220);
    if ((_DWORD)v220)
    {
      v221 = 0;
      v222 = 0;
      v223 = &a5->mBuffers[0].mData;
      v224 = &a4->mBuffers[0].mData;
      v225 = &a7->mBuffers[0].mData;
      do
      {
        v226 = (const float *)*v225;
        v227 = *v224;
        v276 = *v223;
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((_QWORD *)this + 66) + v221), (const float **)this + 30, (const float **)(*((_QWORD *)this + 57) + v221), (const float **)this + 36, *v225, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((_QWORD *)this + 63) + v221), (const float **)this + 30, (const float **)(*((_QWORD *)this + 51) + v221), (const float **)this + 36, v227, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        NonlinearBeepCanceller::fcn_wola_synthesis(*((const vDSP_DFT_SetupStruct **)this + 106), *(const float **)(*((_QWORD *)this + 48) + v221), (const float **)this + 30, (const float **)(*((_QWORD *)this + 54) + v221), (const float **)this + 36, v276, *((_DWORD *)this + 18), *((_DWORD *)this + 22), *((float *)this + 25), *((_DWORD *)this + 23));
        vDSP_svesq(v226, 1, (float *)&__C, *((unsigned int *)this + 18));
        vDSP_svesq((const float *)v227, 1, &v277, *((unsigned int *)this + 18));
        if (v277 > (float)(*(float *)&__C * 3.0))
          memcpy(v227, v226, 4 * *((unsigned int *)this + 18));
        ++v222;
        v221 += 24;
        v223 += 2;
        v224 += 2;
        v225 += 2;
      }
      while (v222 < *((unsigned int *)this + 16));
    }
  }
  v228 = *(unsigned int *)this;
  v229 = *((_DWORD *)this + 27);
  if (v229 + 1 == (_DWORD)v228)
    v230 = 0;
  else
    v230 = v229 + 1;
  *((_DWORD *)this + 27) = v230;
  if ((_DWORD)v228)
  {
    v231 = 0;
    do
    {
      v232 = *((_QWORD *)this + 24);
      v233 = *(_DWORD *)(v232 + v231);
      if (v233 + 1 == (_DWORD)v228)
        v234 = 0;
      else
        v234 = v233 + 1;
      *(_DWORD *)(v232 + v231) = v234;
      v231 += 4;
    }
    while (4 * v228 != v231);
  }
  return 0;
}

void sub_1C2671EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,__int128 a29)
{
  operator delete(__p);
  if ((_QWORD)a29)
    operator delete((void *)a29);
  _Unwind_Resume(a1);
}

void NonlinearBeepCanceller::fcn_wola_analysis(const vDSP_DFT_SetupStruct *a1, const float *__A, const float *a3, float **a4, float *a5, vDSP_Length __N, unsigned int a7, float a8)
{
  vDSP_Length v11;
  const DSPComplex *v12;
  DSPSplitComplex __Z;
  float __B;

  v11 = a7;
  __Z.realp = a5;
  __Z.imagp = &a5[a7];
  vDSP_vmul(__A, 1, a3, 1, *a4, 1, __N);
  v12 = (const DSPComplex *)*a4;
  __B = a8;
  vDSP_ctoz(v12, 2, &__Z, 1, v11);
  vDSP_DFT_Execute(a1, __Z.realp, __Z.imagp, __Z.realp, __Z.imagp);
  vDSP_vsmul(__Z.realp, 1, &__B, __Z.realp, 1, v11);
  vDSP_vsmul(__Z.imagp, 1, &__B, __Z.imagp, 1, v11);
}

void NonlinearBeepCanceller::fcn_wola_synthesis(const vDSP_DFT_SetupStruct *a1, const float *a2, const float **a3, const float **a4, const float **a5, void *a6, unsigned int a7, unsigned int a8, float a9, unsigned int a10)
{
  DSPComplex *v16;
  vDSP_Length __N;
  float *v18;
  unsigned int v19;
  DSPSplitComplex __Z;
  float *__Or[3];
  float __B;

  v16 = (DSPComplex *)*a5;
  __B = a9;
  memset(__Or, 0, sizeof(__Or));
  __N = a8;
  LODWORD(__Z.realp) = 0;
  std::vector<float>::assign((char **)__Or, a8, &__Z);
  v18 = __Or[0];
  __Z.realp = __Or[0];
  __Z.imagp = &__Or[0][a10];
  vDSP_DFT_Execute(a1, a2, &a2[a10], __Or[0], __Z.imagp);
  vDSP_ztoc(&__Z, 1, v16, 2, a10);
  vDSP_vsmul((const float *)v16, 1, &__B, (float *)v16, 1, __N);
  if (v18)
    operator delete(v18);
  vDSP_vma(*a3, 1, *a5, 1, *a4, 1, (float *)*a4, 1, __N);
  memcpy(a6, *a4, 4 * a7);
  v19 = a8 - a7;
  memmove((void *)*a4, &(*a4)[a7], 4 * v19);
  vDSP_vclr((float *)&(*a4)[v19], 1, a7);
}

void sub_1C2672104(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_out_of_range[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E7C22580, MEMORY[0x1E0DE42E0]);
}

void sub_1C267215C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void NonlinearBeepCanceller::fcn_smooth_psd(NonlinearBeepCanceller *this, const float *a2, float a3, float a4, float *a5, float a6, unsigned int a7)
{
  int v7;
  vDSP_Length v11;
  float v12;
  float v13;
  float __B;

  v7 = (int)a5;
  v13 = a4;
  __B = a3;
  v12 = a6;
  v11 = a7;
  vDSP_vsmul((const float *)this, 1, &__B, (float *)this, 1, a7);
  vDSP_vsma(a2, 1, &v13, (const float *)this, 1, (float *)this, 1, v11);
  if (v7)
    vDSP_vabs((const float *)this, 1, (float *)this, 1, v11);
  if (a6 > 0.0)
    vDSP_vsadd((const float *)this, 1, &v12, (float *)this, 1, v11);
}

float NonlinearBeepCanceller::fcn_complex_mult_by_psd(NonlinearBeepCanceller *this, const float *__B, float *__C, vDSP_Length __N)
{
  unsigned int v4;
  float result;

  v4 = __N;
  vDSP_vmul((const float *)this, 1, __B, 1, __C, 1, __N);
  vDSP_vmul((const float *)this + v4 + 1, 1, __B + 1, 1, &__C[v4 + 1], 1, v4 - 1);
  result = *((float *)this + v4) * __B[v4];
  __C[v4] = result;
  return result;
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "deque");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

void sub_1C2673D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  id *v23;
  id *v24;
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_1C2675344(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C26753FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C26754B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C2676D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1C2677A14(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1C2678594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2679784(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C267D5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7979(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7980(uint64_t a1)
{

}

void sub_1C2687024(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1C268A4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8544(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8545(uint64_t a1)
{

}

id SpeechModelTrainingGetInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7C5810);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_trainPersonalizedLMWithLanguage_configuration_fides_write_completion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_trainAppLMWithLanguage_configuration_appBundleId_appLmDataFile_appLmDataFileSandboxExtension_completion_, 0, 1);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_trainAppLMWithLanguage_configuration_appBundleId_appLmDataFile_appLmDataFileSandboxExtension_completion_, 1, 1);

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_trainAllAppLMWithLanguage_completion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_buildPhoneticMatchWithLanguage_saveIntermediateFsts_completion_, 0, 1);

  return v0;
}

void sub_1C269215C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2693A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C2695A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C2695E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C26964A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1C2697298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1C26974AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C26976C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2697A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2697C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2697E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C269894C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2698BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2698E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9661(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9662(uint64_t a1)
{

}

void sub_1C269C950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10101(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10102(uint64_t a1)
{

}

void sub_1C26A0918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26A1DB8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C26A37D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1C26A46EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26A5A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11136(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11137(uint64_t a1)
{

}

void sub_1C26AE914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id readJson(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v8;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "fileExistsAtPath:", v1))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v8 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v8);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v8;
        if (!v5)
        {

          goto LABEL_10;
        }
        v6 = v5;
        NSLog(CFSTR("Cannot parse to JSON"));

      }
    }
    else
    {
      NSLog(CFSTR("Cannot find the file"));
    }
    v4 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

uint64_t getSeconPassInferenceBatchSize(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  int v13;
  uint64_t v14;

  if (!a1)
    return -1;
  readJson(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    goto LABEL_9;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("frontends"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dnn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nnet-forward"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("strict-batch-size"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if (v7)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("frontends"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dnn"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("subsample"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("stride"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    if (v12 <= 1)
      v13 = 1;
    else
      v13 = v12;
    v14 = v13 * v7;
  }
  else
  {
LABEL_9:
    v14 = -1;
  }

  return v14;
}

uint64_t getPhsInferenceBatchSize(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;
  uint64_t v10;

  if (!a1)
    return -1;
  readJson(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("sr"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v4 = CFSTR("sr");
    else
      v4 = CFSTR("spid");
    objc_msgSend(v2, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subsample"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stride"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    v10 = v9;
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

uint64_t getOSDInferenceBatchSize(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  int v7;
  uint64_t v8;

  if (!a1)
    return -1;
  readJson(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("spg"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nnet-forward-skip"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("skip-frames"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    v8 = v7;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

void sub_1C26B0834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26B2F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12353(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12354(uint64_t a1)
{

}

void sub_1C26B467C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  id *v6;
  uint64_t v7;

  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v7 - 104));
  _Unwind_Resume(a1);
}

void sub_1C26B485C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12751(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12752(uint64_t a1)
{

}

void *createFloatArray(int a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 4 * a1;
  v5 = malloc_type_malloc(4 * a1, 0x5D78DB79uLL);
  v6 = v5;
  if (v5)
  {
    bzero(v5, v4);
  }
  else
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = "createFloatArray";
      v11 = 1026;
      v12 = v4;
      v13 = 2114;
      v14 = v3;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s could not allocate %{public}d bytes for %{public}@", (uint8_t *)&v9, 0x1Cu);
    }
  }

  return v6;
}

float *fftEnergies(OpaqueFFTSetup *a1, float *a2, int a3)
{
  float *FloatArray;
  long double v7;
  float *v8;
  vDSP_Length v9;
  float *v10;
  float *v11;
  DSPSplitComplex __C;
  int __B;

  FloatArray = (float *)createFloatArray(a3, CFSTR("complex part zero vec"));
  __C.realp = a2;
  __C.imagp = FloatArray;
  v7 = log2((double)a3);
  vDSP_fft_zip(a1, &__C, 1, (unint64_t)v7, 1);
  v8 = (float *)createFloatArray(a3, CFSTR("fft magnitudes array"));
  v9 = a3;
  vDSP_zvmags(&__C, 1, v8, 1, a3);
  __B = a3;
  v10 = (float *)createFloatArray(a3, CFSTR("sqrt"));
  vvsqrtf(v10, v8, &__B);
  v11 = (float *)createFloatArray(a3, CFSTR("normalized fft magnitudes"));
  __B = 0x40000000;
  vDSP_vsmul(v10, 1, (const float *)&__B, v11, 1, v9);
  free(FloatArray);
  free(v8);
  free(v10);
  return v11;
}

float *vecsqrt(const float *a1, int a2)
{
  float *FloatArray;
  int v5;

  v5 = a2;
  FloatArray = (float *)createFloatArray(a2, CFSTR("sqrt"));
  vvsqrtf(FloatArray, a1, &v5);
  return FloatArray;
}

float countZeroCrossings(float *a1, int a2, float *a3)
{
  int v4;
  uint64_t v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float result;

  if (a2 < 1)
  {
    v10 = -3.4028e38;
  }
  else
  {
    v4 = 0;
    v5 = a2;
    v6 = a1[1];
    v7 = 3.4028e38;
    v8 = 1.1755e-38;
    do
    {
      v9 = v6;
      v6 = *a1;
      if (*a1 < v7)
        v7 = *a1;
      if (v6 > v8)
        v8 = *a1;
      if (v9 > 0.0 && v6 <= 0.0 || v9 < 0.0 && v6 >= 0.0)
        ++v4;
      ++a1;
      --v5;
    }
    while (v5);
    v10 = v8 - v7;
  }
  result = fabsf(v10);
  *a3 = result;
  return result;
}

float sumsegment(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  float result;
  float *v5;
  float v6;

  if (a3 < 1)
    return 0.0;
  v3 = a3;
  result = 0.0;
  v5 = (float *)(a1 + 4 * a2);
  do
  {
    v6 = *v5++;
    result = result + v6;
    --v3;
  }
  while (v3);
  return result;
}

uint64_t NviIsHorseman()
{
  if (NviIsHorseman_onceToken != -1)
    dispatch_once(&NviIsHorseman_onceToken, &__block_literal_global_13245);
  return NviIsHorseman_isHorseman;
}

uint64_t NviIsInternalBuild()
{
  if (NviIsInternalBuild_onceToken != -1)
    dispatch_once(&NviIsInternalBuild_onceToken, &__block_literal_global_8_13250);
  return NviIsInternalBuild_isInternal;
}

CFArrayRef NviPreferencesKeyList()
{
  return CFPreferencesCopyKeyList(CFSTR("com.apple.nvi"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

CFPropertyListRef NviPreferencesValueForKey(const __CFString *a1)
{
  return (id)CFPreferencesCopyAppValue(a1, CFSTR("com.apple.nvi"));
}

uint64_t GetNviPreferencesBoolValForKey(const __CFString *a1, unsigned int a2)
{
  _BOOL4 v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v3 = CFPreferencesGetAppBooleanValue(a1, CFSTR("com.apple.nvi"), &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat)
    return v3;
  else
    return a2;
}

uint64_t GetVTPreferencesBoolValForKey(const __CFString *a1, unsigned int a2)
{
  _BOOL4 v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v3 = CFPreferencesGetAppBooleanValue(a1, CFSTR("com.apple.voicetrigger"), &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat)
    return v3;
  else
    return a2;
}

uint64_t _vtPhraseTypeDidChangeNotificationReceived(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vtPhraseTypeDidChangeNotificationReceived");
}

void sub_1C26C0D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26C0FD8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1C26C17D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26C1A14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C26C3E04(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13866(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13867(uint64_t a1)
{

}

void sub_1C26C7458(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1C26CA6A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1C26CB4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14637(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14638(uint64_t a1)
{

}

void sub_1C26D1FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14762(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14763(uint64_t a1)
{

}

void sub_1C26D3E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26D4554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26D5990(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26D5BC0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  void *v3;
  uint64_t v4;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1C26D5EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1C26D6214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

void sub_1C26D640C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26D654C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26D65FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26D66A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26D6A5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C26D6DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C26D7664(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26D7A00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C26D7D94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

SmartSiriVolume *std::unique_ptr<SmartSiriVolume>::reset[abi:ne180100](SmartSiriVolume **a1, SmartSiriVolume *a2)
{
  SmartSiriVolume *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    SmartSiriVolume::~SmartSiriVolume(result);
    JUMPOUT(0x1C3BC4164);
  }
  return result;
}

void SmartSiriVolume::~SmartSiriVolume(SmartSiriVolume *this)
{
  vDSP_biquadm_SetupStruct *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (vDSP_biquadm_SetupStruct *)*((_QWORD *)this + 19);
  if (v2)
    vDSP_biquadm_DestroySetup(v2);
  v3 = (void *)*((_QWORD *)this + 20);
  if (v3)
  {
    *((_QWORD *)this + 21) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 9);
  if (v4)
  {
    *((_QWORD *)this + 10) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 6);
  if (v5)
  {
    *((_QWORD *)this + 7) = v5;
    operator delete(v5);
  }
  v6 = (void *)*((_QWORD *)this + 3);
  if (v6)
  {
    *((_QWORD *)this + 4) = v6;
    operator delete(v6);
  }
  v7 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v7;
    operator delete(v7);
  }
}

void sub_1C26D80E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26D82AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26D8438(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26D8A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1C26D8E20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void SmartSiriVolume::removeVoiceTriggerSamples(SmartSiriVolume *this, unint64_t a2, unint64_t a3)
{
  float v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (float)*((unsigned int *)this + 25);
  v5 = (unint64_t)(float)((float)a3 / v4);
  if (!v5)
  {
    v8 = (uint64_t)(*((_QWORD *)this + 21) - *((_QWORD *)this + 20)) >> 3;
LABEL_17:
    if (v8 < v5)
    {
      v16 = *MEMORY[0x1E0D18F20];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
      {
        v18 = 136315138;
        v19 = "removeVoiceTriggerSamples";
        _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume: number of elements to delete exceeds energy buffer size, ignore.", (uint8_t *)&v18, 0xCu);
      }
      v5 = 0;
    }
    goto LABEL_24;
  }
  v6 = *((_QWORD *)this + 20);
  v7 = *((_QWORD *)this + 21);
  v8 = (v7 - v6) >> 3;
  if (v8 < v5)
    goto LABEL_17;
  if (v7 != v6)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = (unint64_t)(float)((float)((float)*((unsigned int *)this + 28) - (float)((float)a2 / v4))
                                  + (float)*((unsigned int *)this + 27))
        % *((unsigned int *)this + 27);
    v13 = v12 - v5;
    while (1)
    {
      v14 = *(unsigned int *)(v6 + 8 * v9 + 4);
      if (v12 >= v5)
      {
        if (v12 < v14 || v13 >= v14)
          goto LABEL_14;
      }
      else if (v12 < v14 && v13 + *((unsigned int *)this + 27) >= v14)
      {
        goto LABEL_14;
      }
      std::vector<std::pair<float,unsigned int>>::erase((uint64_t)this + 160, (char *)(v6 + 8 * v9), (char *)(v6 + 8 * v9 + 8));
      ++v10;
      --v11;
      v6 = *((_QWORD *)this + 20);
      v7 = *((_QWORD *)this + 21);
LABEL_14:
      v9 = ++v11;
      if (v11 >= (unint64_t)((v7 - v6) >> 3))
        goto LABEL_22;
    }
  }
  v10 = 0;
LABEL_22:
  v17 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315394;
    v19 = "removeVoiceTriggerSamples";
    v20 = 1026;
    v21 = v10;
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: deleted %{public}u elements in energy buffer.", (uint8_t *)&v18, 0x12u);
  }
LABEL_24:
  *((_DWORD *)this + 28) = (*((unsigned int *)this + 27) - v5 + *((unsigned int *)this + 28) + 1)
                         % *((unsigned int *)this + 27);
}

uint64_t std::vector<std::pair<float,unsigned int>>::erase(uint64_t result, char *a2, char *a3)
{
  char *v3;
  uint64_t v4;

  if (a2 != a3)
  {
    v3 = *(char **)(result + 8);
    if (a3 != v3)
    {
      v4 = 8 * ((a3 - a2) >> 3);
      do
      {
        *(_DWORD *)a2 = *(_DWORD *)&a2[v4];
        *((_DWORD *)a2 + 1) = *(_DWORD *)&a2[v4 + 4];
        a2 += 8;
      }
      while (&a2[v4] != v3);
    }
    *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void sub_1C26D9140(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26D9358(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

float SmartSiriVolume::reset(SmartSiriVolume *this)
{
  void *v2;
  uint64_t v3;
  float result;
  vDSP_biquadm_SetupStruct *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float *v10;

  *((_DWORD *)this + 28) = 0;
  *((_BYTE *)this + 144) = 0;
  v2 = (void *)*((_QWORD *)this + 6);
  v3 = *((_QWORD *)this + 7) - (_QWORD)v2;
  if (v3 >= 1)
    bzero(v2, 4 * (((unint64_t)v3 >> 2) - ((unint64_t)v3 > 3)) + 4);
  v5 = (vDSP_biquadm_SetupStruct *)*((_QWORD *)this + 19);
  if (v5)
    vDSP_biquadm_ResetState(v5);
  v6 = *((_QWORD *)this + 20);
  v7 = *((_QWORD *)this + 21) - v6;
  if ((v7 & 0x7FFFFFFF8) != 0)
  {
    v8 = 0;
    v9 = (v7 >> 3);
    v10 = (float *)(v6 + 4);
    do
    {
      result = *((float *)this + 31);
      *(v10 - 1) = result;
      *(_DWORD *)v10 = v8;
      v10 += 2;
      ++v8;
    }
    while (v9 != v8);
  }
  return result;
}

float SmartSiriVolume::estimateSoundLevel(SmartSiriVolume *this)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  float v8;
  float v9;
  float *v10;
  float v11;
  float v12;
  uint64_t v13;
  float v14;
  float v16;

  v1 = *((_QWORD *)this + 20);
  v2 = *((_QWORD *)this + 21);
  if (v1 == v2)
    return -1000.0;
  v3 = v2 - v1;
  v4 = v3 >> 3;
  v5 = *((_DWORD *)this + 33) * (v3 >> 3) / 0x64;
  v6 = (v3 >> 3) - 1;
  if (v5 >= v6)
    v5 = (v3 >> 3) - 1;
  v7 = *((_DWORD *)this + 34) * (int)v4 / 0x64u;
  if (v7 >= v6)
    v7 = (v3 >> 3) - 1;
  if ((_DWORD)v4)
  {
    v8 = *(float *)(v1 + 8 * v5);
    v9 = *(float *)(v1 + 8 * v7);
    v10 = (float *)(v1 + 4);
    v11 = 0.0;
    v12 = 0.0;
    v13 = (v3 >> 3);
    do
    {
      v14 = *(v10 - 1);
      if (v14 >= v8 && v14 <= v9)
      {
        v16 = *(float *)(*((_QWORD *)this + 6)
                       + 4
                       * ((*(_DWORD *)v10 - *((_DWORD *)this + 28) + *((_DWORD *)this + 27))
                        % *((_DWORD *)this + 27)));
        v12 = v12 + (float)(v14 * v16);
        v11 = v11 + v16;
      }
      v10 += 2;
      --v13;
    }
    while (v13);
  }
  else
  {
    v12 = 0.0;
    v11 = 0.0;
  }
  if (v11 <= 1.17549e-38)
    return -1000.0;
  else
    return *((float *)this + 35) + log10(fmax((float)(v12 / v11), 1.17549e-38)) * 20.0;
}

void sub_1C26D993C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t SmartSiriVolume::feedFloatAudio(SmartSiriVolume *this, const float *a2, unsigned int a3)
{
  unsigned int v4;
  uint64_t result;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  float v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  float *v16;
  unsigned int v17;

  if (!a2)
    return 0xFFFFFFFFLL;
  v4 = *((_DWORD *)this + 24);
  *((_DWORD *)this + 25) = a3 / v4;
  if (a3 / v4 > *((_DWORD *)this + 26))
    return 4294967294;
  if (v4)
  {
    v7 = 0;
    do
    {
      v8 = *((_DWORD *)this + 25);
      v9 = v8 * v7++;
      v10 = v8 * v7;
      if (v10 != v9)
      {
        memmove((void *)(*(_QWORD *)this + 4 * v9), &a2[v9], 4 * v10 - 4 * v9);
        v4 = *((_DWORD *)this + 24);
      }
    }
    while (v7 < v4);
  }
  if (*((_BYTE *)this + 144))
    return 0;
  v11 = (float)*((unsigned int *)this + 25) / (float)*((unsigned int *)this + 29);
  v12 = vcvtas_u32_f32(20.0 / v11);
  v13 = *((unsigned int *)this + 27);
  v14 = (v13 - v12) & ~((int)(v13 - v12) >> 31);
  if (v14 < v13)
  {
    v15 = v13 - v14;
    v16 = (float *)(*((_QWORD *)this + 6) + 4 * v14);
    v17 = ~v14 + v13;
    do
    {
      *v16++ = expf((float)-(float)((float)v17-- * v11) / *((float *)this + 32));
      --v15;
    }
    while (v15);
  }
  result = 0;
  *((_BYTE *)this + 144) = 1;
  return result;
}

void SmartSiriVolume::computeTimeDomainEnergy(SmartSiriVolume *this, float a2)
{
  unint64_t v3;
  const float **v4;
  size_t v5;
  uint64_t v6;
  unint64_t v7;
  float **v8;
  size_t v9;
  vDSP_Length v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  const float **v14;
  float **v15;
  unint64_t v16;
  float v17;
  _BYTE v18[4];
  float __C;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  __C = 0.0;
  if (*((_QWORD *)this + 19))
  {
    MEMORY[0x1E0C80A78]();
    v4 = (const float **)&v18[-((v3 + 15) & 0xFFFFFFFF0)];
    if (v3 >= 0x200)
      v5 = 512;
    else
      v5 = v3;
    bzero(&v18[-((v3 + 15) & 0xFFFFFFFF0)], v5);
    v6 = *((unsigned int *)this + 24);
    MEMORY[0x1E0C80A78]();
    v8 = (float **)&v18[-((v7 + 15) & 0xFFFFFFFF0)];
    if (v7 >= 0x200)
      v9 = 512;
    else
      v9 = v7;
    bzero(&v18[-((v7 + 15) & 0xFFFFFFFF0)], v9);
    v10 = *((unsigned int *)this + 25);
    if ((_DWORD)v6)
    {
      v11 = 0;
      v12 = *(_QWORD *)this;
      v13 = *((_QWORD *)this + 3);
      v14 = v4;
      v15 = v8;
      do
      {
        *v14++ = (const float *)(v12 + 4 * v11);
        *v15++ = (float *)(v13 + 4 * v11);
        v11 += v10;
        --v6;
      }
      while (v6);
    }
    vDSP_biquadm(*((vDSP_biquadm_Setup *)this + 19), v4, 1, v8, 1, v10);
    if (*((_DWORD *)this + 24))
    {
      v16 = 0;
      v17 = 0.0;
      do
      {
        vDSP_rmsqv(v8[v16], 1, &__C, *((unsigned int *)this + 25));
        v17 = v17 + __C;
        ++v16;
      }
      while (v16 < *((unsigned int *)this + 24));
    }
  }
}

void SmartSiriVolume::prepareEnergyBuffer(SmartSiriVolume *this, float a2)
{
  uint64_t v4;
  void **v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unint64_t v20;
  float *v21;
  int v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _DWORD *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  char *v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  float *v46;
  float *v47;
  uint64_t v48;
  float *i;
  uint64_t v50;
  void *v51;

  v4 = *((_QWORD *)this + 20);
  v6 = *((_QWORD *)this + 21);
  v5 = (void **)((char *)this + 160);
  v7 = v6 - v4;
  if (((v6 - v4) & 0x7FFFFFFF8) != 0)
  {
    v8 = 0;
    v9 = 4;
    while (*(_DWORD *)(v4 + v9) != *((_DWORD *)this + 28))
    {
      ++v8;
      v9 += 8;
      if (((unint64_t)v7 >> 3) == v8)
        goto LABEL_7;
    }
    std::vector<std::pair<float,unsigned int>>::erase((uint64_t)this + 160, (char *)(v4 + 8 * v8), (char *)(v4 + 8 * v8 + 8));
    v4 = *((_QWORD *)this + 20);
    v6 = *((_QWORD *)this + 21);
  }
LABEL_7:
  if (v4 == v6 || *(float *)(v4 + 8 * ((v7 >> 3) - 1)) < a2)
  {
    v10 = LODWORD(a2) | ((unint64_t)*((unsigned int *)this + 28) << 32);
    v11 = *((_QWORD *)this + 22);
    if (v6 < v11)
    {
      *(_QWORD *)v6 = v10;
      v12 = (_QWORD *)(v6 + 8);
LABEL_38:
      *((_QWORD *)this + 21) = v12;
      goto LABEL_39;
    }
    v13 = (uint64_t)(v6 - v4) >> 3;
    if (!((unint64_t)(v13 + 1) >> 61))
    {
      v14 = v11 - v4;
      v15 = v14 >> 2;
      if (v14 >> 2 <= (unint64_t)(v13 + 1))
        v15 = v13 + 1;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
        v16 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v16 = v15;
      if (v16)
        v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v16);
      else
        v17 = 0;
      v32 = (unint64_t *)(v16 + 8 * v13);
      v33 = v16 + 8 * v17;
      *v32 = v10;
      v12 = v32 + 1;
      v35 = (char *)*((_QWORD *)this + 20);
      v34 = (char *)*((_QWORD *)this + 21);
      if (v34 != v35)
      {
        do
        {
          v36 = *((_QWORD *)v34 - 1);
          v34 -= 8;
          *--v32 = v36;
        }
        while (v34 != v35);
        v34 = (char *)*v5;
      }
      *((_QWORD *)this + 20) = v32;
      *((_QWORD *)this + 21) = v12;
      *((_QWORD *)this + 22) = v33;
      if (v34)
        operator delete(v34);
      goto LABEL_38;
    }
LABEL_62:
    std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]();
  }
  v18 = 0;
  v19 = 0;
  v20 = (uint64_t)(v6 - v4) >> 3;
  while (*(float *)(v4 + 8 * v18) < a2)
  {
    v18 = ++v19;
    if (v20 <= v19)
      goto LABEL_39;
  }
  v21 = (float *)(v4 + 8 * v18);
  v22 = *((_DWORD *)this + 28);
  v23 = *((_QWORD *)this + 22);
  if (v6 >= v23)
  {
    v37 = v20 + 1;
    if ((v20 + 1) >> 61)
      goto LABEL_62;
    v38 = v23 - v4;
    if (v38 >> 2 > v37)
      v37 = v38 >> 2;
    if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
      v39 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v39 = v37;
    if (v39)
    {
      v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v39);
    }
    else
    {
      v41 = 0;
      v40 = 0;
    }
    v42 = &v41[8 * v18];
    v43 = &v41[8 * v40];
    if (v18 == v40)
    {
      if (v18)
      {
        v42 -= (4 * v18 + 4) & 0xFFFFFFFFFFFFFFF8;
      }
      else
      {
        v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(1uLL);
        v43 = &v42[8 * v44];
        if (v41)
          operator delete(v41);
      }
    }
    *(float *)v42 = a2;
    *((_DWORD *)v42 + 1) = v22;
    v45 = v42 + 8;
    v46 = (float *)*v5;
    if (*v5 != v21)
    {
      v47 = v21;
      do
      {
        v48 = *((_QWORD *)v47 - 1);
        v47 -= 2;
        *((_QWORD *)v42 - 1) = v48;
        v42 -= 8;
      }
      while (v47 != v46);
    }
    for (i = (float *)*((_QWORD *)this + 21); v21 != i; ++v45)
    {
      v50 = *(_QWORD *)v21;
      v21 += 2;
      *v45 = v50;
    }
    v51 = (void *)*((_QWORD *)this + 20);
    *((_QWORD *)this + 20) = v42;
    *((_QWORD *)this + 21) = v45;
    *((_QWORD *)this + 22) = v43;
    if (v51)
      operator delete(v51);
  }
  else if (v21 == (float *)v6)
  {
    *(float *)v6 = a2;
    *(_DWORD *)(v6 + 4) = v22;
    *((_QWORD *)this + 21) = v6 + 8;
  }
  else
  {
    v24 = v21 + 2;
    v25 = (uint64_t *)(v6 - 8);
    v26 = (_QWORD *)v6;
    if (v6 >= 8)
    {
      v26 = (_QWORD *)v6;
      do
      {
        v27 = *v25++;
        *v26++ = v27;
      }
      while ((unint64_t)v25 < v6);
    }
    *((_QWORD *)this + 21) = v26;
    if ((_QWORD *)v6 != v24)
    {
      v28 = (uint64_t)(v6 - (_QWORD)v24) >> 3;
      v29 = (_DWORD *)(v6 - 4);
      v30 = v4 + 8 * v19;
      v31 = 8 * v28;
      do
      {
        *(v29 - 1) = *(_DWORD *)(v30 + v31 - 8);
        *v29 = *(_DWORD *)(v30 + v31 - 4);
        v29 -= 2;
        v31 -= 8;
      }
      while (v31);
    }
    *v21 = a2;
    *(_DWORD *)(v4 + 8 * v18 + 4) = v22;
  }
LABEL_39:
  *((_DWORD *)this + 28) = (*((_DWORD *)this + 28) + 1) % *((_DWORD *)this + 27);
}

void sub_1C26DA06C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void std::vector<float>::resize(char **a1, unint64_t a2)
{
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int v18;
  char *v19;

  v3 = *a1;
  v4 = a1[1];
  v5 = (v4 - *a1) >> 2;
  if (a2 <= v5)
  {
    if (a2 >= v5)
      return;
    v19 = &v3[4 * a2];
    goto LABEL_15;
  }
  v6 = a2 - v5;
  v7 = a1[2];
  if (a2 - v5 <= (v7 - v4) >> 2)
  {
    bzero(a1[1], 4 * v6);
    v19 = &v4[4 * v6];
LABEL_15:
    a1[1] = v19;
    return;
  }
  if (a2 >> 62)
    std::vector<std::vector<std::vector<std::vector<float>>>>::__throw_length_error[abi:ne180100]();
  v8 = v7 - v3;
  v9 = v8 >> 1;
  if (v8 >> 1 <= a2)
    v9 = a2;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
    v10 = 0x3FFFFFFFFFFFFFFFLL;
  else
    v10 = v9;
  v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v10);
  v12 = *a1;
  v13 = a1[1];
  v14 = &v11[4 * v5];
  v16 = &v11[4 * v15];
  bzero(v14, 4 * v6);
  v17 = &v14[4 * v6];
  while (v13 != v12)
  {
    v18 = *((_DWORD *)v13 - 1);
    v13 -= 4;
    *((_DWORD *)v14 - 1) = v18;
    v14 -= 4;
  }
  *a1 = v14;
  a1[1] = v17;
  a1[2] = v16;
  if (v12)
    operator delete(v12);
}

void sub_1C26DA57C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C26DA5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C26DA830(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26DAA20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26DAA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C26DABA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C26DAC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

float SmartSiriVolume::initialize(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, float a8, float a9, float a10)
{
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  char *v30;
  _BYTE *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  vDSP_Length v44;
  uint64_t v45;
  vDSP_Length v46;
  float result;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float *v52;

  *(_DWORD *)(a1 + 96) = a4;
  *(_DWORD *)(a1 + 104) = a3;
  *(_DWORD *)(a1 + 108) = a5;
  *(_DWORD *)(a1 + 132) = a6;
  *(_DWORD *)(a1 + 136) = a7;
  *(float *)(a1 + 140) = a10;
  *(float *)(a1 + 124) = a8;
  *(float *)(a1 + 128) = a9;
  *(_DWORD *)(a1 + 116) = a2;
  *(_DWORD *)(a1 + 120) = a4 * a3;
  std::vector<float>::resize((char **)a1, (a4 * a3));
  std::vector<float>::resize((char **)(a1 + 24), *(unsigned int *)(a1 + 120));
  std::vector<float>::resize((char **)(a1 + 48), *(unsigned int *)(a1 + 108));
  v11 = *(unsigned int *)(a1 + 108);
  v12 = *(_QWORD *)(a1 + 160);
  v13 = *(_QWORD *)(a1 + 168);
  v14 = (v13 - v12) >> 3;
  if (v11 <= v14)
  {
    if (v11 >= v14)
      goto LABEL_17;
    v27 = v12 + 8 * v11;
    goto LABEL_16;
  }
  v15 = v11 - v14;
  v16 = *(_QWORD *)(a1 + 176);
  if (v11 - v14 <= (v16 - v13) >> 3)
  {
    bzero(*(void **)(a1 + 168), 8 * v15);
    v27 = v13 + 8 * v15;
LABEL_16:
    *(_QWORD *)(a1 + 168) = v27;
    goto LABEL_17;
  }
  v17 = v16 - v12;
  if (v17 >> 2 > v11)
    v11 = v17 >> 2;
  if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
    v18 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v18 = v11;
  v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int *>>(v18);
  v20 = &v19[8 * v14];
  v22 = &v19[8 * v21];
  bzero(v20, 8 * v15);
  v23 = &v20[8 * v15];
  v25 = *(char **)(a1 + 160);
  v24 = *(char **)(a1 + 168);
  if (v24 != v25)
  {
    do
    {
      v26 = *((_QWORD *)v24 - 1);
      v24 -= 8;
      *((_QWORD *)v20 - 1) = v26;
      v20 -= 8;
    }
    while (v24 != v25);
    v24 = *(char **)(a1 + 160);
  }
  *(_QWORD *)(a1 + 160) = v20;
  *(_QWORD *)(a1 + 168) = v23;
  *(_QWORD *)(a1 + 176) = v22;
  if (v24)
    operator delete(v24);
LABEL_17:
  v28 = *(_DWORD *)(a1 + 96);
  v29 = (5 * v28);
  v30 = *(char **)(a1 + 72);
  v31 = *(_BYTE **)(a1 + 80);
  v32 = (v31 - v30) >> 3;
  if (v29 <= v32)
  {
    if (v29 >= v32)
      goto LABEL_34;
    v42 = &v30[8 * v29];
    goto LABEL_31;
  }
  v33 = v29 - v32;
  v34 = *(_QWORD *)(a1 + 88);
  if (v29 - v32 <= (v34 - (uint64_t)v31) >> 3)
  {
    bzero(*(void **)(a1 + 80), 8 * v33);
    v42 = &v31[8 * v33];
LABEL_31:
    *(_QWORD *)(a1 + 80) = v42;
    goto LABEL_34;
  }
  v35 = v34 - (_QWORD)v30;
  if (v35 >> 2 > v29)
    v29 = v35 >> 2;
  if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8)
    v36 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v36 = v29;
  if (v36 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v37 = (char *)operator new(8 * v36);
  v38 = &v37[8 * v32];
  v39 = &v37[8 * v36];
  bzero(v38, 8 * v33);
  v40 = &v38[8 * v33];
  while (v31 != v30)
  {
    v41 = *((_QWORD *)v31 - 1);
    v31 -= 8;
    *((_QWORD *)v38 - 1) = v41;
    v38 -= 8;
  }
  *(_QWORD *)(a1 + 72) = v38;
  *(_QWORD *)(a1 + 80) = v40;
  *(_QWORD *)(a1 + 88) = v39;
  if (v30)
  {
    operator delete(v30);
    v28 = *(_DWORD *)(a1 + 96);
  }
LABEL_34:
  if (v28)
  {
    v43 = 0;
    v44 = 0;
    do
    {
      v45 = *(_QWORD *)(a1 + 72) + 8 * v43;
      *(_OWORD *)v45 = KWeightingCoefs;
      *(_OWORD *)(v45 + 16) = unk_1C276CC40;
      *(_QWORD *)(v45 + 32) = 0;
      ++v44;
      v46 = *(unsigned int *)(a1 + 96);
      v43 += 5;
    }
    while (v44 < v46);
  }
  else
  {
    v46 = 0;
  }
  *(_QWORD *)(a1 + 152) = vDSP_biquadm_CreateSetup(*(const double **)(a1 + 72), 1uLL, v46);
  v48 = *(_QWORD *)(a1 + 160);
  v49 = *(_QWORD *)(a1 + 168) - v48;
  if ((v49 & 0x7FFFFFFF8) != 0)
  {
    v50 = 0;
    v51 = (v49 >> 3);
    v52 = (float *)(v48 + 4);
    do
    {
      result = *(float *)(a1 + 124);
      *(v52 - 1) = result;
      *(_DWORD *)v52 = v50;
      v52 += 2;
      ++v50;
    }
    while (v51 != v50);
  }
  return result;
}

void SmartSiriVolume::SmartSiriVolume(SmartSiriVolume *this)
{
  *((_DWORD *)this + 28) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_DWORD *)this + 32) = 1084227584;
  *(_QWORD *)((char *)this + 132) = 0x5F00000005;
  *((_DWORD *)this + 35) = 1119617024;
  *((_BYTE *)this + 144) = 0;
  *((_QWORD *)this + 21) = 0;
  *((_QWORD *)this + 22) = 0;
  *((_QWORD *)this + 20) = 0;
}

{
  *((_DWORD *)this + 28) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_DWORD *)this + 32) = 1084227584;
  *(_QWORD *)((char *)this + 132) = 0x5F00000005;
  *((_DWORD *)this + 35) = 1119617024;
  *((_BYTE *)this + 144) = 0;
  *((_QWORD *)this + 21) = 0;
  *((_QWORD *)this + 22) = 0;
  *((_QWORD *)this + 20) = 0;
}

void sub_1C26DBC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _fetchVibrationState(const __CFString *a1)
{
  const __CFBoolean *v1;
  const __CFBoolean *v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = (const __CFBoolean *)CFPreferencesCopyValue(a1, CFSTR("com.apple.springboard"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v1)
  {
    v2 = v1;
    if (CFBooleanGetValue(v1))
      v3 = 2;
    else
      v3 = 1;
    CFRelease(v2);
  }
  else
  {
    v4 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "_fetchVibrationState";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s vibration state fetched from CFPreferences is NULL, using On as default value", (uint8_t *)&v6, 0xCu);
    }
    return 2;
  }
  return v3;
}

void _silentVibrationPreferenceDidChangeCallback(uint64_t a1, uint64_t a2)
{
  id v2;

  if (kVibrationPreferenceObserver == a2)
  {
    +[CSSiriVibrationManager sharedManager](CSSiriVibrationManager, "sharedManager");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleSilentVibrationValueChange");

  }
}

void _ringVibrationPreferenceDidChangeCallback(uint64_t a1, uint64_t a2)
{
  id v2;

  if (kVibrationPreferenceObserver == a2)
  {
    +[CSSiriVibrationManager sharedManager](CSSiriVibrationManager, "sharedManager");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleRingVibrationValueChange");

  }
}

void InitNviLogging()
{
  if (InitNviLogging_once != -1)
    dispatch_once(&InitNviLogging_once, &__block_literal_global_15970);
}

void sub_1C26DDBCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26DDCF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id CSSiriRecordRouteFromAudioSource(void *a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D890E0]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C89860];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D890C8]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C897F8];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D890F0]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C89850];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D890C0]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C897E0];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D890E8]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C89868];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D890D0]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C89820];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D890D8]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C89A30];
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D890B8]))
    {
      v3 = 0;
      goto LABEL_18;
    }
    v2 = (id *)MEMORY[0x1E0C89A00];
  }
  v3 = *v2;
LABEL_18:

  return v3;
}

id CSSiriPlaybackRouteFromAudioDestination(void *a1)
{
  id v1;
  id *v2;
  id v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D89088]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C89810];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D89080]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C89800];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D890A0]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C89840];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D89068]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C897D0];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D89070]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C897E0];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D89078]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C897E8];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D89090]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C89820];
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D890B0]) & 1) != 0)
  {
    v2 = (id *)MEMORY[0x1E0C89868];
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D89098]))
    {
      v3 = 0;
      goto LABEL_20;
    }
    v2 = (id *)MEMORY[0x1E0C89838];
  }
  v3 = *v2;
LABEL_20:

  return v3;
}

void sub_1C26DF8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26E14C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16408(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16409(uint64_t a1)
{

}

void sub_1C26E1A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C26E350C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C26E3918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C26E3C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1C26E4030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C26E4E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  uint64_t v64;

  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose((const void *)(v64 - 208), 8);
  _Block_object_dispose((const void *)(v64 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1C26E5D8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16879(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16880(uint64_t a1)
{

}

void sub_1C26E7E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 240), 8);
  _Block_object_dispose((const void *)(v30 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1C26E9B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  char a66;

  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose(&STACK[0x288], 8);
  _Block_object_dispose(&STACK[0x2A8], 8);
  _Block_object_dispose(&STACK[0x2C8], 8);
  _Block_object_dispose(&STACK[0x2E8], 8);
  _Block_object_dispose(&STACK[0x308], 8);
  _Block_object_dispose(&STACK[0x328], 8);
  _Block_object_dispose(&STACK[0x390], 8);
  _Block_object_dispose(&STACK[0x3C0], 8);
  _Unwind_Resume(a1);
}

void sub_1C26EA650(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void _serviceInterestCallbackHandler(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id v5;

  if (a3 == -536870608)
  {
    +[CSHostPowerStateMonitorImplDarwin sharedInstance](CSHostPowerStateMonitorImplDarwin, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(a2) = objc_msgSend(v4, "_fetchHostStateWithService:", a2);

    +[CSHostPowerStateMonitorImplDarwin sharedInstance](CSHostPowerStateMonitorImplDarwin, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_didReceiveDarwinHostStateChangeNotification:", (int)a2);

  }
}

void sub_1C26ED988(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1C26EF0EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26EF2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26F10EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C26F6BDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C26F7518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18207(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18208(uint64_t a1)
{

}

id BenchmarkXPCGetInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[4];

  v117[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7AE228);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v117[0] = objc_opt_class();
  v117[1] = objc_opt_class();
  v117[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_runVTSecondPassModelWithConfig_locale_withUrl_completion_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v116[0] = objc_opt_class();
  v116[1] = objc_opt_class();
  v116[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_runVTSecondPassModelWithConfig_locale_withUrl_completion_, 1, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v115[0] = objc_opt_class();
  v115[1] = objc_opt_class();
  v115[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_runVTSecondPassModelWithConfig_locale_withUrl_completion_, 2, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v114[0] = objc_opt_class();
  v114[1] = objc_opt_class();
  v114[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_runVTSecondPassModelWithConfig_locale_withUrl_completion_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v113[0] = objc_opt_class();
  v113[1] = objc_opt_class();
  v113[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_runVTSecondPassModelWithConfig_locale_withUrl_completion_, 1, 1);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v112[0] = objc_opt_class();
  v112[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion_, 0, 0);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v111[0] = objc_opt_class();
  v111[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion_, 1, 0);

  v22 = (void *)MEMORY[0x1E0C99E60];
  v110[0] = objc_opt_class();
  v110[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v24, sel_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion_, 2, 0);

  v25 = (void *)MEMORY[0x1E0C99E60];
  v109[0] = objc_opt_class();
  v109[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion_, 0, 1);

  v28 = (void *)MEMORY[0x1E0C99E60];
  v108[0] = objc_opt_class();
  v108[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion_, 1, 1);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v107[0] = objc_opt_class();
  v107[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_runOSDAnalyzerWithConfig_withUrl_completion_, 0, 0);

  v34 = (void *)MEMORY[0x1E0C99E60];
  v106[0] = objc_opt_class();
  v106[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_runOSDAnalyzerWithConfig_withUrl_completion_, 1, 0);

  v37 = (void *)MEMORY[0x1E0C99E60];
  v105[0] = objc_opt_class();
  v105[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setWithArray:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_runOSDAnalyzerWithConfig_withUrl_completion_, 0, 1);

  v40 = (void *)MEMORY[0x1E0C99E60];
  v104[0] = objc_opt_class();
  v104[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setWithArray:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_runOSDAnalyzerWithConfig_withUrl_completion_, 1, 1);

  v43 = (void *)MEMORY[0x1E0C99E60];
  v103 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v103, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setWithArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_pingpong_completion_, 0, 0);

  v46 = (void *)MEMORY[0x1E0C99E60];
  v102 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setWithArray:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_pingpong_completion_, 0, 1);

  v49 = (void *)MEMORY[0x1E0C99E60];
  v101 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setWithArray:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_runODLDModelWithConfig_locale_inputText_completion_, 0, 0);

  v52 = (void *)MEMORY[0x1E0C99E60];
  v100 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setWithArray:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v54, sel_runODLDModelWithConfig_locale_inputText_completion_, 1, 0);

  v55 = (void *)MEMORY[0x1E0C99E60];
  v99 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setWithArray:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v57, sel_runODLDModelWithConfig_locale_inputText_completion_, 2, 0);

  v58 = (void *)MEMORY[0x1E0C99E60];
  v98 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setWithArray:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v60, sel_runODLDModelWithConfig_locale_inputText_completion_, 0, 1);

  v61 = (void *)MEMORY[0x1E0C99E60];
  v97 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setWithArray:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_runAudioInjectionOnly_completion_, 0, 0);

  v64 = (void *)MEMORY[0x1E0C99E60];
  v96 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setWithArray:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v66, sel_runAudioInjectionOnly_completion_, 0, 1);

  v67 = (void *)MEMORY[0x1E0C99E60];
  v95[0] = objc_opt_class();
  v95[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setWithArray:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_runNovDetectorWithConfig_configRoot_withUrl_completion_, 0, 0);

  v70 = (void *)MEMORY[0x1E0C99E60];
  v94[0] = objc_opt_class();
  v94[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setWithArray:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_runNovDetectorWithConfig_configRoot_withUrl_completion_, 1, 0);

  v73 = (void *)MEMORY[0x1E0C99E60];
  v93[0] = objc_opt_class();
  v93[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setWithArray:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v75, sel_runNovDetectorWithConfig_configRoot_withUrl_completion_, 2, 0);

  v76 = (void *)MEMORY[0x1E0C99E60];
  v92 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setWithArray:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v78, sel_runNovDetectorWithConfig_configRoot_withUrl_completion_, 0, 1);

  v79 = (void *)MEMORY[0x1E0C99E60];
  v91 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v91, 1);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setWithArray:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_benchmarkOnDeviceCompilationCleanup_, 0, 1);

  v82 = (void *)MEMORY[0x1E0C99E60];
  v90 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setWithArray:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_runNCModelWithConfig_completion_, 0, 0);

  v85 = (void *)MEMORY[0x1E0C99E60];
  v89 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setWithArray:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v87, sel_runNCModelWithConfig_completion_, 0, 1);

  return v0;
}

id CoreSpeechXPCGetInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[6];

  v25[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7ADFF0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  v24[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion_, 1, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  v23[3] = objc_opt_class();
  v23[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion_, 2, 0);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_voiceTriggerRTModelWithRequestOptions_downloadedModels_preinstalledModels_completion_, 1, 1);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_voiceTriggerJarvisLanguageList_jarvisSelectedLanguage_completion_, 0, 0);

  return v0;
}

id CoreSpeechServiceListenerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7C5870);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_setDelayInterstitialSounds_level_completion_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getVoiceTriggerRTModelRequestOptionsWithEndpointId_completion_, 0, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getVoiceTriggerRTModelRequestOptionsWithEndpointId_completion_, 0, 1);

  return v0;
}

void sub_1C2703304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C27035F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  id *v26;
  uint64_t v27;

  objc_destroyWeak(v26);
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak((id *)(v27 - 88));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19354(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19355(uint64_t a1)
{

}

void sub_1C2703A58(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x1C3BC4164](v2, 0x1090C40431A8F44);

  _Unwind_Resume(a1);
}

void sub_1C2703E90(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1C3BC414C](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void std::default_delete<corespeech::CSAudioCircularBufferImpl<unsigned char>>::operator()[abi:ne180100](_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)a1[6];
  if (v2)
  {
    a1[7] = v2;
    operator delete(v2);
  }
  v3 = a1[5];
  a1[5] = 0;
  if (v3)
    MEMORY[0x1C3BC414C](v3, 0x1000C8077774924);
  JUMPOUT(0x1C3BC4164);
}

void sub_1C2708238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19891(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19892(uint64_t a1)
{

}

void sub_1C270AF2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *CSAttendingTypeGetName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("Default");
  else
    return off_1E7C27688[a1 - 1];
}

uint64_t CSAttendingTypeGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (CSAttendingTypeGetFromName_onceToken != -1)
      dispatch_once(&CSAttendingTypeGetFromName_onceToken, &__block_literal_global_20350);
    objc_msgSend((id)CSAttendingTypeGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1C270EB48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C270EFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C270F4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20435(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20436(uint64_t a1)
{

}

void sub_1C270FC74(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1C2711014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2711494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 240), 8);
  _Block_object_dispose((const void *)(v38 - 208), 8);
  _Block_object_dispose((const void *)(v38 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C2711B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1C27121F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20940(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20941(uint64_t a1)
{

}

void sub_1C2713C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 240), 8);
  _Block_object_dispose((const void *)(v30 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1C2714EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;

  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void sub_1C2715B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2716380(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1C27178C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C271966C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2719CBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1C271A778(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1C271B5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1C271BC58(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21551(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21552(uint64_t a1)
{

}

void sub_1C271EE5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CSSiriAudioMessageServiceGetXPCInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7C5930);
}

uint64_t __Block_byref_object_copy__22427(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22428(uint64_t a1)
{

}

id _CSSiriBTDeviceGetAddress(void *a1)
{
  void *v1;
  int AddressString;
  int v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  int v11;
  _OWORD v12[15];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return a1;
  v1 = a1;
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  AddressString = BTDeviceGetAddressString();
  if (!AddressString)
  {
    a1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v12);
    return a1;
  }
  v3 = AddressString;
  v4 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315650;
    v7 = "_CSSiriBTDeviceGetAddress";
    v8 = 2048;
    v9 = v1;
    v10 = 1024;
    v11 = v3;
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Failed getting address from BTDevice %p (result = %d).", (uint8_t *)&v6, 0x1Cu);
  }
  return 0;
}

id _CSSiriBTResultGetError(int a1)
{
  if (a1)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ADBTResult"), a1, 0);
  else
    return 0;
}

uint64_t __Block_byref_object_copy__22668(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22669(uint64_t a1)
{

}

uint64_t _BTAccessoryEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return objc_msgSend(a5, "accessoryManager:event:device:state:", a1, a2, a3, a4);
}

uint64_t _BTLocalDeviceStatusEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "localDevice:event:result:", a1, a2, a3);
}

uint64_t _BTServiceEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  return objc_msgSend(a6, "device:serviceMask:serviceEventType:serviceSpecificEvent:result:", a1, a2, a3, a4, a5);
}

void _BTSessionEventCallback(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;

  v7 = a4;
  if ((a2 - 2) < 2)
  {
    v8 = v7;
    objc_msgSend(v7, "_sessionTerminated:", a1);
    goto LABEL_7;
  }
  if (a2 == 1)
  {
    v8 = v7;
    objc_msgSend(v7, "_sessionDetached:", a1);
    goto LABEL_7;
  }
  if (!a2)
  {
    v8 = v7;
    objc_msgSend(v7, "_sessionAttached:result:", a1, a3);
LABEL_7:
    v7 = v8;
  }

}

uint64_t _PhraseSpotterEnabledDidChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_phraseSpotterEnabledDidChange");
}

void sub_1C272AC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CSSiriAudioServiceGetWorkloop()
{
  if (CSSiriAudioServiceGetWorkloop_onceToken != -1)
    dispatch_once(&CSSiriAudioServiceGetWorkloop_onceToken, &__block_literal_global_23176);
  return (id)CSSiriAudioServiceGetWorkloop_workloop;
}

id MockRemotePluginXPCGetInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7C5990);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_createMockRemoteDeviceWithName_deviceID_completion_, 0, 0);

  v4 = (void *)MEMORY[0x1E0C99E60];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_createMockRemoteDeviceWithName_deviceID_completion_, 1, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_createMockRemoteDeviceWithName_deviceID_completion_, 1, 1);

  v10 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_injectAudio_toDeviceWithUUID_completion_, 0, 0);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_injectAudio_toDeviceWithUUID_completion_, 1, 0);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_disconnectDeviceWithUUID_completion_, 0, 0);

  v19 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20, v23[0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_listMockRemoteDeviecesWithCompletion_, 0, 1);

  return v0;
}

void sub_1C272D024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23373(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23374(uint64_t a1)
{

}

void sub_1C272DEB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C272DF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CSAudioTapProvider;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1C272DFA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C272E484(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1C272EC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1C272EFE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C272F0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1C272F184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1C272F1F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C272F40C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C272F86C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL isAudioQueueRecording(OpaqueAudioQueue *a1, _QWORD *a2)
{
  OSStatus Property;
  OSStatus v4;
  NSObject *v5;
  UInt32 ioDataSize;
  int outData;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  OSStatus v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  ioDataSize = 4;
  outData = 0;
  Property = AudioQueueGetProperty(a1, 0x6171726Eu, &outData, &ioDataSize);
  if (Property)
  {
    v4 = Property;
    v5 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "isAudioQueueRecording";
      v11 = 1024;
      v12 = v4;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Error reading AudioQueue property : %d", buf, 0x12u);
      if (!a2)
        return outData == 1;
      goto LABEL_4;
    }
    if (a2)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v4, 0);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return outData == 1;
}

void sub_1C272FA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C272FB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C272FE0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void isRunningListenerCallback(void *a1, OpaqueAudioQueue *a2, int a3)
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  OpaqueAudioQueue *v21;
  int v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F38];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "isRunningListenerCallback";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Received isRunningListenerCallback from Audio Queue", buf, 0xCu);
  }
  v7 = a1;
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = ___ZL25isRunningListenerCallbackPvP16OpaqueAudioQueuej_block_invoke;
  v25[3] = &unk_1E7C285E8;
  v9 = v7;
  v26 = v9;
  v10 = (void *)MEMORY[0x1C3BC4734](v25);
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = ___ZL25isRunningListenerCallbackPvP16OpaqueAudioQueuej_block_invoke_2;
  v23[3] = &unk_1E7C285E8;
  v11 = v9;
  v24 = v11;
  v12 = (void *)MEMORY[0x1C3BC4734](v23);
  objc_msgSend(v11, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = ___ZL25isRunningListenerCallbackPvP16OpaqueAudioQueuej_block_invoke_3;
  block[3] = &unk_1E7C27FC8;
  v22 = a3;
  v20 = v12;
  v21 = a2;
  v18 = v11;
  v19 = v10;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(v13, block);

}

void sub_1C2730030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

void ___ZL25isRunningListenerCallbackPvP16OpaqueAudioQueuej_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_releaseTransactionForStopListeningIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "aqStartCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "aqStartCompletion");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL))v4)[2](v4, v5 == 0);

    objc_msgSend(*(id *)(a1 + 32), "setAqStartCompletion:", 0);
  }

}

void sub_1C27300E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL25isRunningListenerCallbackPvP16OpaqueAudioQueuej_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_reset");
  objc_msgSend(*(id *)(a1 + 32), "_releaseTransactionForStopListeningIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "aqStopCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "aqStopCompletion");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL))v4)[2](v4, v5 == 0);

    objc_msgSend(*(id *)(a1 + 32), "setAqStopCompletion:", 0);
  }

}

void sub_1C2730194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL25isRunningListenerCallbackPvP16OpaqueAudioQueuej_block_invoke_3(uint64_t a1)
{
  int v2;
  OpaqueAudioQueue *v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 64);
  if (v2 == 1634824814)
  {
    v3 = *(OpaqueAudioQueue **)(a1 + 56);
    v12 = 0;
    v4 = isAudioQueueRecording(v3, &v12);
    v5 = v12;
    if (v5)
    {
      v6 = v5;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v8 = *MEMORY[0x1E0D18F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_DEFAULT))
      {
        v9 = CFSTR("NO");
        if (v4)
          v9 = CFSTR("YES");
        *(_DWORD *)buf = 136315394;
        v14 = "isRunningListenerCallback_block_invoke";
        v15 = 2114;
        v16 = v9;
        _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s isRecording: %{public}@", buf, 0x16u);
      }
      if (objc_msgSend(*(id *)(a1 + 32), "recordingAudioQueue"))
      {
        v10 = 48;
        if (v4)
          v10 = 40;
        v6 = 0;
        (*(void (**)(void))(*(_QWORD *)(a1 + v10) + 16))();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2061, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        v6 = 0;
      }
    }
  }
  else
  {
    v7 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "isRunningListenerCallback_block_invoke_3";
      v15 = 1024;
      LODWORD(v16) = v2;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s AudioQueue listener property %d not match", buf, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2056, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_1C2730428(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C2730538(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void handleInputBuffer(void *a1, OpaqueAudioQueue *a2, AudioQueueBuffer *a3, const AudioTimeStamp *a4, unsigned int a5, const AudioStreamPacketDescription *a6)
{
  void *v8;
  void *v9;
  UInt64 mHostTime;
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  UInt64 v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  if (a3 && a3->mAudioData && a3->mAudioDataByteSize)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3->mAudioData, a3->mAudioDataByteSize);
    mHostTime = a4->mHostTime;
    objc_msgSend(v8, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZL17handleInputBufferPvP16OpaqueAudioQueueP16AudioQueueBufferPK14AudioTimeStampjPK28AudioStreamPacketDescription_block_invoke;
    block[3] = &unk_1E7C28B58;
    v12 = v9;
    v16 = v12;
    v13 = v8;
    v17 = v13;
    v18 = mHostTime;
    dispatch_async(v11, block);

    AudioQueueEnqueueBuffer((AudioQueueRef)objc_msgSend(v13, "recordingAudioQueue"), a3, 0, 0);
  }
  else
  {
    v14 = *MEMORY[0x1E0D18F38];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "handleInputBuffer";
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_INFO, "%s Received invalid Audio Queue buffer, ignore", buf, 0xCu);
    }
  }

}

void sub_1C27306E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZL17handleInputBufferPvP16OpaqueAudioQueueP16AudioQueueBufferPK14AudioTimeStampjPK28AudioStreamPacketDescription_block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = v2 / objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth");
  v4 = objc_msgSend(*(id *)(a1 + 40), "processedSampleCount");
  objc_msgSend(*(id *)(a1 + 40), "circularBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "circularBuffer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSamples:numSamples:atHostTime:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), v3, *(_QWORD *)(a1 + 48));

  }
  v6 = objc_alloc(MEMORY[0x1E0D18FC8]);
  v9 = (id)objc_msgSend(v6, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:remoteVAD:", *(_QWORD *)(a1 + 32), 1, v3, objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth"), v4, *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(*(id *)(a1 + 40), "audioStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "audioStreamProvider:audioBufferAvailable:", *(_QWORD *)(a1 + 40), v9);

  objc_msgSend(*(id *)(a1 + 40), "setProcessedSampleCount:", v4 + v3);
}

void sub_1C2730848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1C2730AA8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t ASXSampleRateFromInt(uint64_t a1)
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1 > 31999)
  {
    switch(a1)
    {
      case 32000:
        return 32000;
      case 44100:
        return 44100;
      case 48000:
        return 48000;
    }
  }
  else
  {
    switch(a1)
    {
      case 8000:
        return 8000;
      case 11025:
        return 11025;
      case 16000:
        return 16000;
    }
  }
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "ASXSampleRateFromInt";
    v6 = 2050;
    v7 = a1;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Fingerprinter doesn't support rate %{public}ld", (uint8_t *)&v4, 0x16u);
  }
  return 16000;
}

uint64_t AudioConverterFillComplexBuffer_BlockInvoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v9;

  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](a5);
  v9 = v8[2](v8, a2, a3, a4);

  return v9;
}

void sub_1C273B5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1C273C3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C273EB10(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1C273FC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24421(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24422(uint64_t a1)
{

}

Class __getSiriCoreSymptomsReporterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!SiriCoreLibraryCore_frameworkLibrary)
    SiriCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SiriCoreLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SiriCoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("CSSiriSpeechRecorder.m"), 120, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SiriCoreSymptomsReporter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSiriCoreSymptomsReporterClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("CSSiriSpeechRecorder.m"), 121, CFSTR("Unable to find class %s"), "SiriCoreSymptomsReporter");

LABEL_8:
    __break(1u);
  }
  getSiriCoreSymptomsReporterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void _LPCMStreamASBDForSpeechControllerSettings(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  v3 = *MEMORY[0x1E0C89970];
  v4 = a2;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  *(_QWORD *)a1 = v6;

  *(_QWORD *)(a1 + 8) = 0xC6C70636DLL;
  *(_DWORD *)(a1 + 32) = 16;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C89930]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "unsignedIntValue");
  *(_DWORD *)(a1 + 28) = (_DWORD)v4;

  *(_DWORD *)(a1 + 20) = 1;
  *(_DWORD *)(a1 + 24) = 2 * (_DWORD)v4;
  *(_DWORD *)(a1 + 16) = 2 * (_DWORD)v4;
}

void sub_1C2744BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1C27451F0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  id *v6;
  uint64_t v7;

  objc_destroyWeak(v2);
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak((id *)(v7 - 152));
  objc_destroyWeak((id *)(v7 - 144));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24975(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24976(uint64_t a1)
{

}

void sub_1C27491F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C274C34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25755(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25756(uint64_t a1)
{

}

void sub_1C274D648(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t AudioConverterFillComplexBuffer_BlockInvoke_25988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v9;

  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](a5);
  v9 = v8[2](v8, a2, a3, a4);

  return v9;
}

void sub_1C274E424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C274F948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose((const void *)(v28 - 176), 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1C27503AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 176), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C27507F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 176), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C2750C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
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
  _Block_object_dispose((const void *)(v10 - 176), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26148(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26149(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__26851(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26852(uint64_t a1)
{

}

uint64_t AFAddInterruptingAudioSessionInfoToAnalyticsContext()
{
  return MEMORY[0x1E0CFE378]();
}

uint64_t AFAudioPlaybackOptionsGetNames()
{
  return MEMORY[0x1E0CFE398]();
}

uint64_t AFAudioSessionAssertionGetCurrentAcquisitionService()
{
  return MEMORY[0x1E0CFE3A0]();
}

uint64_t AFBTProductIDSupportsAnnounce()
{
  return MEMORY[0x1E0CFE3A8]();
}

uint64_t AFBluetoothWirelessSplitterSessionStateGetName()
{
  return MEMORY[0x1E0CFE3B0]();
}

uint64_t AFDeviceRingerSwitchStateGetName()
{
  return MEMORY[0x1E0CFE3E8]();
}

uint64_t AFDeviceSupportsEchoCancellation()
{
  return MEMORY[0x1E0CFE400]();
}

uint64_t AFDeviceSupportsFullSiriUOD()
{
  return MEMORY[0x1E0CFE408]();
}

uint64_t AFDeviceSupportsHybridUOD()
{
  return MEMORY[0x1E0CFE418]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x1E0CFE438]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x1E0CFE460]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x1E0CFE468]();
}

uint64_t AFDeviceSupportsZLL()
{
  return MEMORY[0x1E0CFE478]();
}

uint64_t AFIsATV()
{
  return MEMORY[0x1E0CFE4B0]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x1E0CFE4C0]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1E0CFE4D0]();
}

uint64_t AFIsMac()
{
  return MEMORY[0x1E0CFE4D8]();
}

uint64_t AFIsNano()
{
  return MEMORY[0x1E0CFE4E0]();
}

uint64_t AFIsVision()
{
  return MEMORY[0x1E0CFE4F8]();
}

uint64_t AFKeyValueObservingCreate()
{
  return MEMORY[0x1E0CFE500]();
}

uint64_t AFMachAbsoluteTimeAddTimeInterval()
{
  return MEMORY[0x1E0CFE530]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x1E0CFE538]();
}

uint64_t AFOfflineDictationCapable()
{
  return MEMORY[0x1E0CFE580]();
}

uint64_t AFPlaybackRouteIsHandsFree()
{
  return MEMORY[0x1E0CFE5A0]();
}

uint64_t AFPreferencesTypeToSiriEnabled()
{
  return MEMORY[0x1E0CFE5F8]();
}

uint64_t AFRecordRouteIsHearst()
{
  return MEMORY[0x1E0CFE600]();
}

uint64_t AFShouldRunAsrOnServerForUOD()
{
  return MEMORY[0x1E0CFE610]();
}

uint64_t AFSiriActivationContinuousConversation()
{
  return MEMORY[0x1E0CFE618]();
}

uint64_t AFSiriActivationContinuousVoiceTriggerDetected()
{
  return MEMORY[0x1E0CFE638]();
}

uint64_t AFSiriActivationHoneycombDeviceVoiceTrigger()
{
  return MEMORY[0x1E0CFE640]();
}

uint64_t AFSiriActivationServiceGetPort()
{
  return MEMORY[0x1E0CFE648]();
}

uint64_t AFSiriActivationVoiceKeywordDetected()
{
  return MEMORY[0x1E0CFE668]();
}

uint64_t AFSiriActivationVoiceTriggerActivate()
{
  return MEMORY[0x1E0CFE670]();
}

uint64_t AFSiriActivationVoiceTriggerPrewarm()
{
  return MEMORY[0x1E0CFE678]();
}

uint64_t AFSoundIDGetFromName()
{
  return MEMORY[0x1E0CFE6D0]();
}

uint64_t AFSoundIDGetIsValidAndSpecified()
{
  return MEMORY[0x1E0CFE6D8]();
}

uint64_t AFSoundIDGetName()
{
  return MEMORY[0x1E0CFE6E0]();
}

uint64_t AFSpeechEndpointerOperationModeGetIsValid()
{
  return MEMORY[0x1E0CFE6E8]();
}

uint64_t AFSpeechEndpointerOperationModeGetName()
{
  return MEMORY[0x1E0CFE6F0]();
}

uint64_t AFSpeechEventGetDescription()
{
  return MEMORY[0x1E0CFE6F8]();
}

uint64_t AFSpeechEventIsHardwareTrigger()
{
  return MEMORY[0x1E0CFE700]();
}

uint64_t AFSpeechEventIsTVRemote()
{
  return MEMORY[0x1E0CFE708]();
}

uint64_t AFSpeechEventIsVoiceTrigger()
{
  return MEMORY[0x1E0CFE710]();
}

uint64_t AFSpeechLogsDirectory()
{
  return MEMORY[0x1E0CFE718]();
}

uint64_t AFSpeechRecordingEventListenerGetXPCInterface()
{
  return MEMORY[0x1E0CFE720]();
}

uint64_t AFSupportsAudioSessionCoordination()
{
  return MEMORY[0x1E0CFE730]();
}

uint64_t AFSupportsSiriInCall()
{
  return MEMORY[0x1E0CFE750]();
}

uint64_t AFSupportsSpeechExtraction()
{
  return MEMORY[0x1E0CFE758]();
}

uint64_t AFSupportsVibration()
{
  return MEMORY[0x1E0CFE760]();
}

uint64_t AFSupportsWirelessSplitter()
{
  return MEMORY[0x1E0CFE768]();
}

uint64_t AFTurnIdentifierGetString()
{
  return MEMORY[0x1E0CFE780]();
}

uint64_t AFUserSupportDirectoryPath()
{
  return MEMORY[0x1E0CFE798]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

OSStatus AudioConverterConvertComplexBuffer(AudioConverterRef inAudioConverter, UInt32 inNumberPCMFrames, const AudioBufferList *inInputData, AudioBufferList *outOutputData)
{
  return MEMORY[0x1E0C91EB0](inAudioConverter, *(_QWORD *)&inNumberPCMFrames, inInputData, outOutputData);
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x1E0C91EB8](inAudioConverter);
}

OSStatus AudioConverterFillComplexBuffer(AudioConverterRef inAudioConverter, AudioConverterComplexInputDataProc inInputDataProc, void *inInputDataProcUserData, UInt32 *ioOutputDataPacketSize, AudioBufferList *outOutputData, AudioStreamPacketDescription *outPacketDescription)
{
  return MEMORY[0x1E0C91EC0](inAudioConverter, inInputDataProc, inInputDataProcUserData, ioOutputDataPacketSize, outOutputData, outPacketDescription);
}

OSStatus AudioConverterGetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0C91ED8](inAudioConverter, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x1E0C91EF8](inSourceFormat, inDestinationFormat, outAudioConverter);
}

OSStatus AudioConverterReset(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x1E0C91F18](inAudioConverter);
}

OSStatus AudioConverterSetProperty(AudioConverterRef inAudioConverter, AudioConverterPropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1E0C91F20](inAudioConverter, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus AudioDeviceGetProperty(AudioDeviceID inDevice, UInt32 inChannel, Boolean isInput, AudioDevicePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0C97588](*(_QWORD *)&inDevice, *(_QWORD *)&inChannel, isInput, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x1E0C91F28](inAudioFile);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x1E0C91F60](inFileRef, inPermissions, *(_QWORD *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0C91FC8](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

uint64_t AudioInjectionXPCGetInterface()
{
  return MEMORY[0x1E0D18E70]();
}

OSStatus AudioQueueAddPropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x1E0C91FF0](inAQ, *(_QWORD *)&inID, inProc, inUserData);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x1E0C91FF8](inAQ, *(_QWORD *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x1E0C92030](inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x1E0C92038](inAQ, inBuffer, *(_QWORD *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return MEMORY[0x1E0C92058](inAQ, inBuffer);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return MEMORY[0x1E0C92070](inAQ, *(_QWORD *)&inID, outData, ioDataSize);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return MEMORY[0x1E0C92080](inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, *(_QWORD *)&inFlags, outAQ);
}

OSStatus AudioQueueNewOutput(const AudioStreamBasicDescription *inFormat, AudioQueueOutputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return MEMORY[0x1E0C92098](inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, *(_QWORD *)&inFlags, outAQ);
}

OSStatus AudioQueueRemovePropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return MEMORY[0x1E0C920E0](inAQ, *(_QWORD *)&inID, inProc, inUserData);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x1E0C92100](inAQ, *(_QWORD *)&inID, inData, *(_QWORD *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x1E0C92108](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x1E0C92118](inAQ, inImmediate);
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x1E0C92158](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

uint64_t BTAccessoryManagerAddCallbacks()
{
  return MEMORY[0x1E0D4E0F0]();
}

uint64_t BTAccessoryManagerGetAnnounceCallsSupport()
{
  return MEMORY[0x1E0D4E118]();
}

uint64_t BTAccessoryManagerGetAnnounceMessagesSupport()
{
  return MEMORY[0x1E0D4E120]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x1E0D4E130]();
}

uint64_t BTAccessoryManagerGetFeatureCapability()
{
  return MEMORY[0x1E0D4E140]();
}

uint64_t BTAccessoryManagerRemoveCallbacks()
{
  return MEMORY[0x1E0D4E180]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x1E0D4E198]();
}

uint64_t BTDeviceConnect()
{
  return MEMORY[0x1E0D4E1B0]();
}

uint64_t BTDeviceDisconnect()
{
  return MEMORY[0x1E0D4E1C0]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x1E0D4E1D0]();
}

uint64_t BTDeviceFromIdentifier()
{
  return MEMORY[0x1E0D4E1E0]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x1E0D4E1E8]();
}

uint64_t BTDeviceGetDeviceId()
{
  return MEMORY[0x1E0D4E218]();
}

uint64_t BTDeviceIsAppleAudioDevice()
{
  return MEMORY[0x1E0D4E240]();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return MEMORY[0x1E0D4E290]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x1E0D4E2C0]();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return MEMORY[0x1E0D4E328]();
}

uint64_t BTServiceAddCallbacks()
{
  return MEMORY[0x1E0D4E398]();
}

uint64_t BTServiceRemoveCallbacks()
{
  return MEMORY[0x1E0D4E3A0]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x1E0D4E3B0]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x1E0D4E3C8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E20]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
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

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x1E0C9EB28]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t CSHasAOP()
{
  return MEMORY[0x1E0D18E88]();
}

uint64_t CSIsASMacWithAOP()
{
  return MEMORY[0x1E0D18E90]();
}

uint64_t CSIsAppleSiliconMac()
{
  return MEMORY[0x1E0D18E98]();
}

uint64_t CSIsBridgeOS()
{
  return MEMORY[0x1E0D18EA0]();
}

uint64_t CSIsCarryDevice()
{
  return MEMORY[0x1E0D18EA8]();
}

uint64_t CSIsCommunalDevice()
{
  return MEMORY[0x1E0D18EB0]();
}

uint64_t CSIsGibraltarMac()
{
  return MEMORY[0x1E0D18EB8]();
}

uint64_t CSIsHorseman()
{
  return MEMORY[0x1E0D18EC0]();
}

uint64_t CSIsHorsemanJunior()
{
  return MEMORY[0x1E0D18EC8]();
}

uint64_t CSIsIOS()
{
  return MEMORY[0x1E0D18ED0]();
}

uint64_t CSIsIPad()
{
  return MEMORY[0x1E0D18ED8]();
}

uint64_t CSIsIPhone()
{
  return MEMORY[0x1E0D18EE0]();
}

uint64_t CSIsInternalBuild()
{
  return MEMORY[0x1E0D18EE8]();
}

uint64_t CSIsMac()
{
  return MEMORY[0x1E0D18EF0]();
}

uint64_t CSIsMacMini()
{
  return MEMORY[0x1E0D18EF8]();
}

uint64_t CSIsOSX()
{
  return MEMORY[0x1E0D18F00]();
}

uint64_t CSIsTV()
{
  return MEMORY[0x1E0D18F08]();
}

uint64_t CSIsTorpedo()
{
  return MEMORY[0x1E0D18F10]();
}

uint64_t CSIsWatch()
{
  return MEMORY[0x1E0D18F18]();
}

uint64_t CSLogInitIfNeeded()
{
  return MEMORY[0x1E0D18F68]();
}

uint64_t CSMachAbsoluteTimeAddTimeInterval()
{
  return MEMORY[0x1E0D18F70]();
}

uint64_t CSMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x1E0D18F78]();
}

uint64_t CSMachAbsoluteTimeSubtractTimeInterval()
{
  return MEMORY[0x1E0D18F80]();
}

uint64_t CSMachAbsoluteTimeToMachContinuousTime()
{
  return MEMORY[0x1E0D18F88]();
}

uint64_t CSSiriUserSupportBaseURL()
{
  return MEMORY[0x1E0D18F90]();
}

uint64_t CSSupportsVibrator()
{
  return MEMORY[0x1E0D18F98]();
}

uint64_t CSSystemRootDirectory()
{
  return MEMORY[0x1E0D18FA0]();
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1E0C92278](inURL, *(_QWORD *)&inFileType, inStreamDesc, inChannelLayout, *(_QWORD *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x1E0C92280](inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0C92288](inExtAudioFile, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1E0C92290](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1E0C92298](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1E0C922A0](inExtAudioFile, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileWrapAudioFileID(AudioFileID inFileID, Boolean inForWriting, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1E0C922A8](inFileID, inForWriting, outExtAudioFile);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x1E0C922B0](inExtAudioFile, *(_QWORD *)&inNumberFrames, ioData);
}

uint64_t FigEndpointCopyActiveCarPlayEndpoint()
{
  return MEMORY[0x1E0CA0648]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x1E0CA0680]();
}

void IOHIDUserDeviceActivate(IOHIDUserDeviceRef device)
{
  MEMORY[0x1E0CBB5A0](device);
}

void IOHIDUserDeviceCancel(IOHIDUserDeviceRef device)
{
  MEMORY[0x1E0CBB5A8](device);
}

uint64_t IOHIDUserDeviceCreate()
{
  return MEMORY[0x1E0CBB5C0]();
}

uint64_t IOHIDUserDeviceHandleReport()
{
  return MEMORY[0x1E0CBB5D0]();
}

void IOHIDUserDeviceSetCancelHandler(IOHIDUserDeviceRef device, dispatch_block_t handler)
{
  MEMORY[0x1E0CBB5F0](device, handler);
}

void IOHIDUserDeviceSetDispatchQueue(IOHIDUserDeviceRef device, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB5F8](device, queue);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1E0CBB890]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x1E0D4BF18]();
}

uint64_t MRMediaRemoteRegisterForNowPlayingNotifications()
{
  return MEMORY[0x1E0D4C070]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1E0CB2C08](userName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

uint64_t WriteStackshotReport_async()
{
  return MEMORY[0x1E0D1BD48]();
}

uint64_t _AFPreferencesDictationLanguageDetectorEnabled()
{
  return MEMORY[0x1E0CFEAE8]();
}

uint64_t _AFPreferencesForceSpeexAudioRecording()
{
  return MEMORY[0x1E0CFEAF0]();
}

uint64_t _AFPreferencesForceUncompressedAudioRecording()
{
  return MEMORY[0x1E0CFEAF8]();
}

uint64_t _AFPreferencesKeepRecorededAudioFiles()
{
  return MEMORY[0x1E0CFEB00]();
}

uint64_t _AFPreferencesValueForKey()
{
  return MEMORY[0x1E0CFEB28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _IDSCopyIDForDeviceUniqueID()
{
  return MEMORY[0x1E0D343B0]();
}

uint64_t _MACleanV1Repository()
{
  return MEMORY[0x1E0D4E0A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E7C225A0();
}

void operator delete(void *__p)
{
  off_1E7C225A8(__p);
}

uint64_t operator delete()
{
  return off_1E7C225B0();
}

uint64_t operator new[]()
{
  return off_1E7C225B8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E7C225C0(__sz);
}

uint64_t operator new()
{
  return off_1E7C225C8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint64_t nd_close()
{
  return MEMORY[0x1E0DC8690]();
}

uint64_t nd_create()
{
  return MEMORY[0x1E0DC8698]();
}

uint64_t nd_error()
{
  return MEMORY[0x1E0DC86A0]();
}

uint64_t nd_getresults()
{
  return MEMORY[0x1E0DC86B8]();
}

uint64_t nd_initialize()
{
  return MEMORY[0x1E0DC86C8]();
}

uint64_t nd_wavedata()
{
  return MEMORY[0x1E0DC86E8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t remote_device_cancel()
{
  return MEMORY[0x1E0D86FF8]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x1E0D87038]();
}

uint64_t remote_device_copy_uuid()
{
  return MEMORY[0x1E0D87058]();
}

uint64_t remote_device_get_type()
{
  return MEMORY[0x1E0D87098]();
}

uint64_t remote_device_set_connected_callback()
{
  return MEMORY[0x1E0D870B8]();
}

uint64_t remote_device_set_disconnected_callback()
{
  return MEMORY[0x1E0D870C8]();
}

uint64_t remote_device_type_get_description()
{
  return MEMORY[0x1E0D870F8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void vDSP_DFT_Execute(const vDSP_DFT_SetupStruct *__Setup, const float *__Ir, const float *__Ii, float *__Or, float *__Oi)
{
  MEMORY[0x1E0C8BF60](__Setup, __Ir, __Ii, __Or, __Oi);
}

vDSP_DFT_Setup vDSP_DFT_zrop_CreateSetup(vDSP_DFT_Setup __Previous, vDSP_Length __Length, vDSP_DFT_Direction __Direction)
{
  return (vDSP_DFT_Setup)MEMORY[0x1E0C8BFB0](__Previous, __Length, *(_QWORD *)&__Direction);
}

void vDSP_biquadm(vDSP_biquadm_Setup __Setup, const float **__X, vDSP_Stride __IX, float **__Y, vDSP_Stride __IY, vDSP_Length __N)
{
  MEMORY[0x1E0C8BFF0](__Setup, __X, __IX, __Y, __IY, __N);
}

vDSP_biquadm_Setup vDSP_biquadm_CreateSetup(const double *__coeffs, vDSP_Length __M, vDSP_Length __N)
{
  return (vDSP_biquadm_Setup)MEMORY[0x1E0C8C008](__coeffs, __M, __N);
}

void vDSP_biquadm_DestroySetup(vDSP_biquadm_Setup __setup)
{
  MEMORY[0x1E0C8C018](__setup);
}

void vDSP_biquadm_ResetState(vDSP_biquadm_Setup __setup)
{
  MEMORY[0x1E0C8C028](__setup);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x1E0C8C050](__A, __IA, __F, __IF, __C, __IC, __N, __P);
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x1E0C8C060](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x1E0C8C070](__C, __IC, __Z, __IZ, __N);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
  MEMORY[0x1E0C8C0A0](__setup);
}

void vDSP_fft_zip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
  MEMORY[0x1E0C8C128](__Setup, __C, __IC, __Log2N, *(_QWORD *)&__Direction);
}

void vDSP_hamm_window(float *__C, vDSP_Length __N, int __Flag)
{
  MEMORY[0x1E0C8C150](__C, __N, *(_QWORD *)&__Flag);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1E8](__A, __IA, __C, __N);
}

void vDSP_rmsqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2C0](__A, __IA, __C, __N);
}

void vDSP_svdiv(const float *__A, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2D8](__A, __B, __IB, __C, __IC, __N);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2E8](__A, __I, __C, __N);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C328](__A, __IA, __C, __N);
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C358](__A, __IA, __C, __IC, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C3D8](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C400](__C, __IC, __N);
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C448](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vflt16(const __int16 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C598](__A, __IA, __C, __IC, __N);
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6A0](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vmma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6F8](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C740](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C800](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C888](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C920](__A, __IA, __C, __IC, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C940](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CA50](__Z, __IZ, __C, __IC, __N);
}

void vDSP_zvcma(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8CA80](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_zvma(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8CAB0](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CAB8](__A, __IA, __C, __IC, __N);
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
  MEMORY[0x1E0C8CAE8](__A, __IA, __B, __IB, __C, __IC, __N, *(_QWORD *)&__Conjugate);
}

void vvsqrtf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8DB80](a1, a2, a3);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

uint64_t xpc_file_transfer_create_with_path()
{
  return MEMORY[0x1E0C864C8]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x1E0D87360]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x1E0D87370]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x1E0D873A0]();
}

uint64_t xpc_remote_connection_send_message()
{
  return MEMORY[0x1E0D873C8]();
}

uint64_t xpc_remote_connection_send_message_with_reply()
{
  return MEMORY[0x1E0D873E0]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1E0D873F8]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

