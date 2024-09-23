void sub_230C4CC10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

uint64_t AXShouldCreateRemoteViewForIdentityAndSceneIdentifier(void *a1, void *a2, void *a3)
{
  char v4;
  id v7;
  id v8;
  id location;
  char v10;

  location = 0;
  objc_storeStrong(&location, a1);
  v8 = 0;
  objc_storeStrong(&v8, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  if ((objc_msgSend(v8, "containsString:", CFSTR("SUIS-VoiceControlUI")) & 1) != 0
    || (objc_msgSend(v8, "containsString:", CFSTR("com.apple.PaperBoard-wallpaper")) & 1) != 0
    || (objc_msgSend(v8, "containsString:", CFSTR("SUIS-AssistiveTouchUI")) & 1) != 0
    || (objc_msgSend(v8, "containsString:", CFSTR("com.apple.accessibility.AccessibilityUIServer")) & 1) != 0
    || (objc_msgSend(v8, "containsString:", CFSTR("com.apple.AccessibilityUIServer")) & 1) != 0
    || (objc_msgSend(v8, "containsString:", CFSTR("com.apple.fullkeyboardaccess")) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    NSClassFromString(CFSTR("RBSProcessIdentity"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = 1;
      if ((objc_msgSend(location, "safeBoolForKey:", CFSTR("isDaemon")) & 1) == 0)
      {
        v4 = 1;
        if ((objc_msgSend(v8, "containsString:", CFSTR("searchBar")) & 1) == 0)
        {
          v4 = 1;
          if ((objc_msgSend(v8, "containsString:", CFSTR("SiriHostedScene")) & 1) == 0)
          {
            v4 = 1;
            if (!AXIsXcodeLivePreviewsScene(v8))
            {
              v4 = 1;
              if ((objc_msgSend(v8, "containsString:", *MEMORY[0x24BDFE078]) & 1) == 0)
              {
                v4 = 1;
                if ((objc_msgSend(v8, "containsString:", *MEMORY[0x24BE00138]) & 1) == 0)
                {
                  v4 = 1;
                  if ((objc_msgSend(v8, "containsString:", CFSTR("UIHostedScene")) & 1) == 0)
                  {
                    v4 = 1;
                    if ((objc_msgSend(v7, "containsString:", CFSTR("PosterKit")) & 1) == 0)
                    {
                      v4 = 1;
                      if ((objc_msgSend(v7, "containsString:", CFSTR("com.apple.chrono")) & 1) == 0)
                        v4 = objc_msgSend(v7, "containsString:", CFSTR("com.apple.ActivityUIServices"));
                    }
                  }
                }
              }
            }
          }
        }
      }
      v10 = v4 & 1;
    }
    else
    {
      v10 = 0;
    }
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  return v10 & 1;
}

BOOL AXIsXcodeLivePreviewsScene(id obj)
{
  char v2;
  id location;
  BOOL v4;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = 1;
  if ((objc_msgSend(location, "hasPrefix:", CFSTR("XcodePreviews")) & 1) == 0)
  {
    v2 = 1;
    if ((objc_msgSend(location, "hasPrefix:", CFSTR("PreviewAgent")) & 1) == 0)
    {
      v2 = 1;
      if ((objc_msgSend(location, "hasPrefix:", CFSTR("SimDisplayScene")) & 1) == 0)
        v2 = objc_msgSend(location, "containsString:", CFSTR("UV-InjectedScene"));
    }
  }
  v4 = (v2 & 1) != 0 && (objc_msgSend(location, "hasSuffix:", CFSTR("static")) & 1) == 0;
  objc_storeStrong(&location, 0);
  return v4;
}

double AXCGFAbs(double a1)
{
  return fabs(a1);
}

double AXCGFAbs_0(double a1)
{
  return fabs(a1);
}

double AXCGFAbs_1(double a1)
{
  return fabs(a1);
}

double AXCGFAbs_2(double a1)
{
  return fabs(a1);
}

void sub_230C4FF28()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t axShouldDisableHitpointWarping()
{
  BOOL v1;
  char v2;

  v2 = 1;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v1 = 0;
    if (_AXSAutomationEnabled())
      v1 = _AXSAutomationHitpointWarpingEnabled() == 0;
    v2 = v1;
  }
  return v2 & 1;
}

double CGFloatMinMax(double a1, double a2, double a3)
{
  double v3;

  v3 = CGFloatMin(a3, a1);
  return CGFloatMax(a2, v3);
}

double CGFloatMax(double a1, double a2)
{
  return fmax(a1, a2);
}

double CGFloatMin(double a1, double a2)
{
  return fmin(a1, a2);
}

_BYTE *__os_log_helper_16_0_0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t AX_IS_DEBUG_BUILD()
{
  return 0;
}

id AXUITextRangeImplClass()
{
  if (!AXUITextRangeImplClass_class)
    AXUITextRangeImplClass_class = (uint64_t)NSClassFromString(CFSTR("UITextRangeImpl"));
  return (id)AXUITextRangeImplClass_class;
}

BOOL AXUIKeyboardTypeSupportsMisspelledRotor(uint64_t a1)
{
  return a1 != 2 && (unint64_t)(a1 - 4) > 3;
}

uint64_t AXShouldCreateRemoteViewForEachLayer(id obj)
{
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  objc_storeStrong(&location, 0);
  return 1;
}

void AXHandleUserInteractionForDictation(char a1)
{
  id v1[2];
  int v2;
  int v3;
  uint64_t (*v4)(uint64_t);
  void *v5;
  id v6;
  id v7;
  char v8;

  v8 = a1 & 1;
  v7 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIDictationController")), "safeValueForKey:", CFSTR("activeInstance"));
  if ((v8 & 1) == 0 || (AXHandleUserInteractionForDictation_DidBegin & 1) != 0)
  {
    if ((AXHandleUserInteractionForDictation_DidBegin & 1) != 0)
    {
      v1[0] = v7;
      AXPerformSafeBlock();
      AXHandleUserInteractionForDictation_DidBegin = 0;
      objc_storeStrong(v1, 0);
    }
  }
  else
  {
    v1[1] = (id)MEMORY[0x24BDAC760];
    v2 = -1073741824;
    v3 = 0;
    v4 = __AXHandleUserInteractionForDictation_block_invoke;
    v5 = &unk_24FF3DA40;
    v6 = v7;
    AXPerformSafeBlock();
    AXHandleUserInteractionForDictation_DidBegin = 1;
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(&v7, 0);
}

BOOL AXIsDictationListening()
{
  id v1;
  BOOL v2;
  id v3;

  v3 = (id)-[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIDictationController")), "safeValueForKey:", CFSTR("activeInstance"));
  v1 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("state"));
  v2 = objc_msgSend(v1, "intValue") == 2;

  objc_storeStrong(&v3, 0);
  return v2;
}

void sub_230C5B730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,int a24,_Unwind_Exception *exception_object)
{
  uint64_t v25;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v25 - 104));
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_3_2_8_69_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 69;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_0_1_4_0(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

void voiceOverDidEnableHandwriting(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v5;
  id v6;
  char v7;
  id v8[6];

  v8[5] = a1;
  v8[4] = a2;
  v8[3] = a3;
  v8[2] = a4;
  v8[1] = a5;
  v7 = 0;
  objc_opt_class();
  v6 = (id)__UIAccessibilityCastAsSafeCategory();
  v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  objc_msgSend(v5, "_axSetIsHandwritingEnabled:", 1);
  -[_UIKeyboardStateManagerAccessibility _axUpdateAutocorrectionSettings](v8[0]);
  objc_storeStrong(v8, 0);
}

void voiceOverDidDisableHandwriting(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v5;
  id v6;
  char v7;
  id v8[6];

  v8[5] = a1;
  v8[4] = a2;
  v8[3] = a3;
  v8[2] = a4;
  v8[1] = a5;
  v7 = 0;
  objc_opt_class();
  v6 = (id)__UIAccessibilityCastAsSafeCategory();
  v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  objc_msgSend(v5, "_axSetIsHandwritingEnabled:", 0);
  -[_UIKeyboardStateManagerAccessibility _axUpdateAutocorrectionSettings](v8[0]);
  objc_storeStrong(v8, 0);
}

uint64_t __os_log_helper_16_0_1_8_0(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void sub_230C64224(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  *(_QWORD *)(v10 - 48) = a1;
  *(_DWORD *)(v10 - 52) = a2;
  objc_destroyWeak((id *)(v10 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 48));
}

void sub_230C65F4C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, id *a19, uint64_t a20,uint64_t a21,id *a22,uint64_t a23,uint64_t a24,uint64_t a25,id *location)
{
  uint64_t v26;

  *(_QWORD *)(v26 - 184) = a1;
  *(_DWORD *)(v26 - 188) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v26 - 136));
  _Unwind_Resume(*(_Unwind_Exception **)(v26 - 184));
}

id getRTIInputUIServiceMachNameiOS()
{
  id v1;
  id v2;
  id *RTIInputUIServiceMachNameiOSSymbolLoc;

  RTIInputUIServiceMachNameiOSSymbolLoc = (id *)getRTIInputUIServiceMachNameiOSSymbolLoc();
  if (!RTIInputUIServiceMachNameiOSSymbolLoc)
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v1 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getRTIInputUIServiceMachNameiOS(void)");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_UIRemoteKeyboardPlaceholderViewAccessibility.m"), 16, CFSTR("%s"), dlerror());

    __break(1u);
    JUMPOUT(0x230C67050);
  }
  return *RTIInputUIServiceMachNameiOSSymbolLoc;
}

uint64_t getRTIInputUIServiceMachNameiOSSymbolLoc()
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v8 = getRTIInputUIServiceMachNameiOSSymbolLoc_ptr;
  v13 = getRTIInputUIServiceMachNameiOSSymbolLoc_ptr;
  if (!getRTIInputUIServiceMachNameiOSSymbolLoc_ptr)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getRTIInputUIServiceMachNameiOSSymbolLoc_block_invoke;
    v6 = &unk_24FF3DC50;
    v7 = &v9;
    __getRTIInputUIServiceMachNameiOSSymbolLoc_block_invoke((uint64_t)&v2);
  }
  v1 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getRTIInputUIServiceMachNameiOSSymbolLoc_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t result;

  v1 = (void *)RemoteTextInputLibrary();
  v2 = dlsym(v1, "RTIInputUIServiceMachNameiOS");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  getRTIInputUIServiceMachNameiOSSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t RemoteTextInputLibrary()
{
  id v1;
  id v2;
  uint64_t v3;

  v3 = RemoteTextInputLibraryCore();
  if (!v3)
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v1 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *RemoteTextInputLibrary(void)");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x230C672D0);
  }
  return v3;
}

uint64_t RemoteTextInputLibraryCore()
{
  if (!RemoteTextInputLibraryCore_frameworkLibrary)
    __RemoteTextInputLibraryCore_block_invoke();
  return RemoteTextInputLibraryCore_frameworkLibrary;
}

void sub_230C67C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  uint64_t v21;

  objc_destroyWeak((id *)(v21 - 56));
  objc_destroyWeak((id *)(v21 - 48));
  _Unwind_Resume(a1);
}

void sub_230C67D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, int a13, int a14, _Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_230C6CB1C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  *(_QWORD *)(v11 - 104) = a1;
  *(_DWORD *)(v11 - 108) = a2;
  objc_destroyWeak((id *)(v11 - 64));
  objc_destroyWeak((id *)(v11 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 104));
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

void sub_230C6FA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, _Unwind_Exception *exception_object)
{
  uint64_t v19;

  _Block_object_dispose((const void *)(v19 - 72), 8);
  _Unwind_Resume(a1);
}

void sub_230C702B0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230C70A3C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230C70BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, _Unwind_Exception *exception_object)
{
  uint64_t v20;

  _Block_object_dispose((const void *)(v20 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_230C71248()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230C75D90(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id *location)
{
  uint64_t v30;

  *(_QWORD *)(v30 - 96) = a1;
  *(_DWORD *)(v30 - 100) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v30 - 56));
  objc_destroyWeak((id *)(v30 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v30 - 96));
}

void sub_230C75DAC(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *a24,uint64_t a25,uint64_t a26,id *location,uint64_t a28,uint64_t a29,id *a30)
{
  uint64_t v30;

  *(_QWORD *)(v30 - 96) = a1;
  *(_DWORD *)(v30 - 100) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak(a30);
  objc_destroyWeak((id *)(v30 - 56));
  objc_destroyWeak((id *)(v30 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v30 - 96));
}

void sub_230C760C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_230C763C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_230C765FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, _Unwind_Exception *exception_object, char a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_230C76B6C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *a24,uint64_t a25,uint64_t a26,id *a27,uint64_t a28,uint64_t a29,id *location)
{
  uint64_t v30;

  *(_QWORD *)(v30 - 96) = a1;
  *(_DWORD *)(v30 - 100) = a2;
  objc_destroyWeak((id *)(v30 - 56));
  objc_destroyWeak((id *)(v30 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v30 - 96));
}

void sub_230C76F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_230C771A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_230C773B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, _Unwind_Exception *exception_object, char a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_230C7885C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,int a26,_Unwind_Exception *exception_object,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  uint64_t v33;

  objc_destroyWeak(&a33);
  objc_destroyWeak((id *)(v33 - 128));
  _Unwind_Resume(a1);
}

void sub_230C79D54(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id *a23,uint64_t a24,uint64_t a25,id *a26,uint64_t a27,uint64_t a28,id *a29,uint64_t a30,uint64_t a31,id *location)
{
  uint64_t v32;

  *(_QWORD *)(v32 - 48) = a1;
  *(_DWORD *)(v32 - 52) = a2;
  objc_destroyWeak((id *)(v32 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v32 - 48));
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230C7D408(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  *(_QWORD *)(v11 - 48) = a1;
  *(_DWORD *)(v11 - 52) = a2;
  objc_destroyWeak((id *)(v11 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 48));
}

BOOL AXKBElementWasForcedToUseForeignKB()
{
  id v1;
  id v2;
  char v3;
  id v4;
  id v5;
  char v6;
  id location;
  id v8;
  BOOL v9;

  v9 = 0;
  v5 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  v4 = (id)objc_msgSend(v5, "textInputTraits");
  v6 = objc_msgSend(v4, "isSecureTextEntry");

  if ((v6 & 1) != 0)
  {
    v1 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v8 = (id)objc_msgSend(v1, "currentInputMode");

    location = (id)UIKeyboardGetCurrentUILanguage();
    v2 = (id)objc_msgSend(v8, "primaryLanguage");
    v3 = objc_msgSend(v2, "hasPrefix:", location);

    v9 = (v3 & 1) == 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v8, 0);
  }
  return v9;
}

id AXKBElementLocalizedForKeyboardLocale(id obj)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v7 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v9 = (id)objc_msgSend(v7, "currentInputMode");

  v8 = 0;
  if (!AXKBElementWasForcedToUseForeignKB())
  {
    v1 = (id)objc_msgSend(v9, "primaryLanguage");
    v2 = v8;
    v8 = v1;

  }
  if (!AXKBElementLocalizedForKeyboardLocale_axBundle)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDD1488], "accessibilityBundleWithLastPathComponent:", CFSTR("UIKit.axbundle"));
    v4 = (void *)AXKBElementLocalizedForKeyboardLocale_axBundle;
    AXKBElementLocalizedForKeyboardLocale_axBundle = (uint64_t)v3;

  }
  v6 = (id)AXNSLocalizedStringForLocale();
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

BOOL UIAXRequiresTwoNextKeyboardKeys()
{
  id v1;
  id location;
  BOOL v3;

  v3 = 0;
  if ((AXDeviceHasHomeButton() & 1) == 0 && (AXDeviceIsPhone() & 1) != 0)
  {
    v1 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    location = (id)objc_msgSend(v1, "normalizedEnabledInputModeIdentifiers");

    if ((unint64_t)objc_msgSend(location, "count") > 2)
      v3 = (objc_msgSend(location, "containsObject:", *MEMORY[0x24BDF7AD0]) & 1) != 0;
    objc_storeStrong(&location, 0);
  }
  return v3;
}

id UIAXNextKeyboardValue(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  unint64_t v11;
  id v12;
  char v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  char v18;
  NSObject *log;
  os_log_type_t type;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id obj;
  id v27;
  id v28;
  id v29;
  id v30;
  char v31;
  unint64_t v32;
  os_log_type_t v33;
  id v34;
  uint64_t v35;
  os_log_type_t v36;
  id v37;
  id v38;
  uint8_t v39[15];
  char v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  char v47;
  id v48;
  id v49;
  uint64_t v50;
  uint8_t v51[32];
  uint8_t v52[24];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v50 = a1;
  v49 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v47 = 0;
  v25 = (id)objc_msgSend(v49, "safeValueForKey:", CFSTR("_layout"));
  v46 = (id)__UIAccessibilitySafeClass();

  v45 = v46;
  objc_storeStrong(&v46, 0);
  v48 = v45;
  v44 = (id)objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v43 = (id)objc_msgSend(v44, "currentInputMode");
  v24 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  v23 = (id)objc_msgSend(v24, "textInputTraits");
  v42 = (id)objc_msgSend(v44, "nextInputModeInPreferenceListForTraits:updatePreference:skipEmoji:", v23, 0, objc_msgSend(v48, "keyplaneContainsEmojiKey") & 1);

  if (v50 == 1)
  {
    v21 = (id)objc_msgSend(v43, "normalizedIdentifier");
    v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BDF7AD0]);

    if ((v22 & 1) == 0)
    {
      v41 = (id)AXLogAppAccessibility();
      v40 = 17;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_FAULT))
      {
        log = v41;
        type = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_fault_impl(&dword_230C4A000, log, type, "Asked for the next keyboard for the emoji key, but shouldn't have needed it because the label includes that info already.", v39, 2u);
      }
      objc_storeStrong(&v41, 0);
    }
  }
  else if (v50 == 2)
  {
    v17 = (id)objc_msgSend(v42, "normalizedIdentifier");
    v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDF7AD0]);

    if ((v18 & 1) != 0)
    {
      v38 = (id)objc_msgSend(v44, "activeInputModes");
      if ((unint64_t)objc_msgSend(v38, "count") <= 2)
      {
        v37 = (id)AXLogAppAccessibility();
        v36 = OS_LOG_TYPE_FAULT;
        if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_FAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v52, (uint64_t)v38);
          _os_log_fault_impl(&dword_230C4A000, (os_log_t)v37, v36, "Unexpectedly tried to skip emoji but had only active input modes: %@", v52, 0xCu);
        }
        objc_storeStrong(&v37, 0);
      }
      if ((unint64_t)objc_msgSend(v38, "count") > 2)
      {
        v35 = objc_msgSend(v38, "indexOfObject:", v43);
        if (v35 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v34 = (id)AXLogAppAccessibility();
          v33 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v51, (uint64_t)v43, (uint64_t)v38);
            _os_log_impl(&dword_230C4A000, (os_log_t)v34, v33, "Unable to find current input mode: %@ in list of active inputmodes: %@.\nThis list of keyboards may have been modified in Settings after last choosing an inputmode.", v51, 0x16u);
          }
          objc_storeStrong(&v34, 0);
        }
        v32 = 0;
        if (v35 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = 0;
        }
        else
        {
          v15 = v35 + 1;
          v16 = v15 % objc_msgSend(v38, "count");
        }
        v32 = v16;
        v31 = 0;
        objc_opt_class();
        v14 = (id)objc_msgSend(v38, "objectAtIndexedSubscript:", v16);
        v30 = (id)__UIAccessibilityCastAsClass();

        v29 = v30;
        objc_storeStrong(&v30, 0);
        v12 = (id)objc_msgSend(v29, "normalizedIdentifier");
        v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDF7AD0]);

        if ((v13 & 1) != 0)
        {
          v11 = v32 + 1;
          v32 = v11 % objc_msgSend(v38, "count");
        }
        v1 = (id)objc_msgSend(v38, "objectAtIndexedSubscript:", v32);
        v2 = v42;
        v42 = v1;

      }
      objc_storeStrong(&v38, 0);
    }
  }
  v28 = 0;
  if (v42)
  {
    v3 = (id)objc_msgSend(v42, "displayName");
    v4 = v28;
    v28 = v3;

    v27 = (id)objc_msgSend(v42, "primaryLanguage");
    v5 = (id)objc_msgSend(v27, "lowercaseString");
    v6 = v27;
    v27 = v5;

    v7 = (id)objc_msgSend(v27, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v8 = v27;
    v27 = v7;

    obj = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v28);
    objc_msgSend(obj, "setAttribute:forKey:", v27, *MEMORY[0x24BDFEB98]);
    objc_storeStrong(&v28, obj);
    objc_storeStrong(&obj, 0);
    objc_storeStrong(&v27, 0);
  }
  v10 = v28;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  return v10;
}

id _TraditionalStrokeDictionary()
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("一"), CFSTR("橫"), CFSTR("㆒"), CFSTR("橫"), CFSTR("⼀"), CFSTR("豎"), CFSTR("丨"), CFSTR("豎"), CFSTR("⼁"), CFSTR("丿"), CFSTR("丿"), CFSTR("撇"), CFSTR("⼃"), CFSTR("點"), CFSTR("丶"), CFSTR("點"), CFSTR("⼂"),
                                           CFSTR("折"),
                                           CFSTR("乛"),
                                           0));
}

id _SimplifiedStrokeDictionary()
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("一"), CFSTR("横"), CFSTR("㆒"), CFSTR("横"), CFSTR("⼀"), CFSTR("竖"), CFSTR("丨"), CFSTR("竖"), CFSTR("⼁"), CFSTR("撇"), CFSTR("丿"), CFSTR("撇"), CFSTR("⼃"), CFSTR("点"), CFSTR("丶"), CFSTR("点"), CFSTR("⼂"),
                                           CFSTR("折"),
                                           CFSTR("乛"),
                                           0));
}

id _ZhuyinTraditionalStrokeDictionary()
{
  return (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("三聲、"), CFSTR("ˇ"), 0);
}

void sub_230C89FB0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230C8A134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  uint64_t v21;

  _Block_object_dispose((const void *)(v21 - 104), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_0_2_4_0_4_0(uint64_t result, int a2, int a3)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  return result;
}

void sub_230C9008C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_2_1_8_66(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void sub_230C92898()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230C92D7C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230C94790()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_3_1_8_69(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 69;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void sub_230C978F0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_3_3_4_0_4_0_8_65(uint64_t result, int a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 65;
  *(_BYTE *)(result + 15) = 8;
  *(_QWORD *)(result + 16) = a4;
  return result;
}

uint64_t __os_log_helper_16_0_4_4_0_4_0_4_0_4_0(uint64_t result, int a2, int a3, int a4, int a5)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 0;
  *(_BYTE *)(result + 15) = 4;
  *(_DWORD *)(result + 16) = a4;
  *(_BYTE *)(result + 20) = 0;
  *(_BYTE *)(result + 21) = 4;
  *(_DWORD *)(result + 22) = a5;
  return result;
}

uint64_t __os_log_helper_16_3_1_8_65(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 65;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void _accessibilityReceiveDictationLifecycleNotfication(uint64_t a1, uint64_t a2, const __CFString *a3, void *a4, void *a5)
{
  id v5;
  void *v6;
  id v7;
  id obj[3];
  CFStringRef v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id location;

  v11 = a1;
  v10 = a2;
  v9 = a3;
  obj[2] = a4;
  obj[1] = a5;
  obj[0] = (id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x24BDFE8C8]);
  if (CFStringCompare(v9, (CFStringRef)*MEMORY[0x24BDFE8D0], 0) || !obj[0])
  {
    if (CFStringCompare(v9, (CFStringRef)*MEMORY[0x24BDFE8D8], 0) == kCFCompareEqualTo
      && (id)_lastActiveDictationController == obj[0])
    {
      objc_storeStrong((id *)&_lastActiveDictationController, 0);
    }
  }
  else
  {
    location = 0;
    objc_storeStrong(&location, obj[0]);
    v7 = location;
    objc_storeStrong(&location, 0);
    v12 = v7;
    v5 = v7;
    v6 = (void *)_lastActiveDictationController;
    _lastActiveDictationController = (uint64_t)v5;

  }
  objc_storeStrong(obj, 0);
}

void sub_230CA0FC8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230CA5EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, _Unwind_Exception *exception_object)
{
  uint64_t v19;

  _Block_object_dispose((const void *)(v19 - 72), 8);
  _Unwind_Resume(a1);
}

BOOL __CGSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

void sub_230CAE3E4()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

BOOL AX_CGSizeIsProbablyEmpty(double a1, double a2)
{
  return AXCGFAbs(a1 - 0.0) < 0.001 || AXCGFAbs(a2 - 0.0) < 0.001 || AX_CGSizeIsEmpty(a1, a2);
}

void sub_230CB1638()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

double CGFAbs(double a1)
{
  return fabs(a1);
}

void sub_230CB6218()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230CB6698()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

BOOL AX_CGSizeIsEmpty(double a1, double a2)
{
  BOOL v3;

  v3 = 1;
  if (a1 > 0.0)
    return a2 <= 0.0;
  return v3;
}

void sub_230CBAC00()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

void sub_230CBD514(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  uint64_t v11;

  *(_QWORD *)(v11 - 64) = a1;
  *(_DWORD *)(v11 - 68) = a2;
  objc_destroyWeak((id *)(v11 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 64));
}

BOOL __CGSizeEqualToSize_0(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

BOOL __CGPointEqualToPoint(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

void sub_230CC24D4()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230CC2C20()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230CC47C8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230CC4A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, _Unwind_Exception *exception_object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_230CC4C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, _Unwind_Exception *exception_object, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230CCC674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  uint64_t v23;

  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v23 - 48));
  _Unwind_Resume(a1);
}

void sub_230CCCE00()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

BOOL __CGPointEqualToPoint_0(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

void __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230CDA0EC(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, uint64_t a14, uint64_t a15, id *a16, uint64_t a17, uint64_t a18, id *a19, uint64_t a20,uint64_t a21,id *location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  uint64_t v34;

  *(_QWORD *)(v34 - 112) = a1;
  *(_DWORD *)(v34 - 116) = a2;
  objc_destroyWeak((id *)(v34 - 72));
  objc_destroyWeak((id *)(v34 - 64));
  _Unwind_Resume(*(_Unwind_Exception **)(v34 - 112));
}

void sub_230CDAD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,_Unwind_Exception *exception_object)
{
  uint64_t v22;

  _Block_object_dispose((const void *)(v22 - 72), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

id getEMFEmojiTokenClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getEMFEmojiTokenClass_softClass;
  v13 = getEMFEmojiTokenClass_softClass;
  if (!getEMFEmojiTokenClass_softClass)
  {
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getEMFEmojiTokenClass_block_invoke;
    v6 = &unk_24FF3DC50;
    v7 = &v9;
    __getEMFEmojiTokenClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getEMFEmojiTokenClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;
  id v3;
  id v4;

  EmojiFoundationLibrary();
  Class = objc_getClass("EMFEmojiToken");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getEMFEmojiTokenClass(void)_block_invoke");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", "EMFEmojiToken");

    __break(1u);
    JUMPOUT(0x230CDE4D0);
  }
  getEMFEmojiTokenClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t EmojiFoundationLibrary()
{
  id v1;
  id v2;
  uint64_t v3;

  v3 = EmojiFoundationLibraryCore();
  if (!v3)
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v1 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *EmojiFoundationLibrary(void)");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x230CDE5F4);
  }
  return v3;
}

uint64_t EmojiFoundationLibraryCore()
{
  if (!EmojiFoundationLibraryCore_frameworkLibrary)
    __EmojiFoundationLibraryCore_block_invoke();
  return EmojiFoundationLibraryCore_frameworkLibrary;
}

void sub_230CE0528(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  *(_QWORD *)(v10 - 64) = a1;
  *(_DWORD *)(v10 - 68) = a2;
  objc_destroyWeak((id *)(v10 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 64));
}

void __Block_byref_object_copy__15(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230CE2F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object)
{
  uint64_t v18;

  _Block_object_dispose((const void *)(v18 - 72), 8);
  _Unwind_Resume(a1);
}

double CGFAbs_0(double a1)
{
  return fabs(a1);
}

uint64_t accessibilityRTLKeyPositionSort(void *a1, void *a2, void *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  id v23;
  char v24;
  id v25[2];
  id v26;
  id location;
  uint64_t v28;

  location = 0;
  objc_storeStrong(&location, a1);
  v26 = 0;
  objc_storeStrong(&v26, a2);
  v25[1] = a3;
  v24 = 0;
  objc_opt_class();
  v23 = (id)__UIAccessibilityCastAsClass();
  v22 = v23;
  objc_storeStrong(&v23, 0);
  v25[0] = v22;
  v20 = 0;
  objc_opt_class();
  v19 = (id)__UIAccessibilityCastAsClass();
  v18 = v19;
  objc_storeStrong(&v19, 0);
  v21 = v18;
  objc_msgSend(v25[0], "frame");
  v15 = v3;
  objc_msgSend(v21, "frame");
  if (v15 <= v4)
  {
    objc_msgSend(v25[0], "frame", v15);
    v14 = v5;
    objc_msgSend(v21, "frame");
    if (v14 >= v6)
    {
      objc_msgSend(v25[0], "frame", v14);
      v13 = v7;
      objc_msgSend(v21, "frame");
      if (v13 <= v8)
      {
        objc_msgSend(v25[0], "frame", v13);
        v12 = v9;
        objc_msgSend(v21, "frame");
        v28 = v12 < v10;
      }
      else
      {
        v28 = -1;
      }
    }
    else
    {
      v28 = -1;
    }
  }
  else
  {
    v28 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&location, 0);
  return v28;
}

void sub_230CE8A08(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_DWORD *)(v2 - 116) = a2;
  _Block_object_dispose((const void *)(v2 - 96), 8);
  _Block_object_dispose((const void *)(v2 - 64), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 112));
}

id accessibilityLocalizedString(id obj)
{
  id v2;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = (id)UIKitAccessibilityLocalizedString();
  objc_storeStrong(&location, 0);
  return v2;
}

id accessibilityLocalizedStringInTable(void *a1, void *a2)
{
  id v4;
  id v5;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v5 = 0;
  objc_storeStrong(&v5, a2);
  v4 = (id)UIKitAccessibilityLocalizedStringInTable();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);
  return v4;
}

id axAnnotateDataNetworkViewWithType(void *a1)
{
  id v2;
  id v3[2];

  v3[1] = a1;
  v3[0] = 0;
  if ((unint64_t)a1 <= 0xD)
    __asm { BR              X8 }
  v2 = v3[0];
  objc_storeStrong(v3, 0);
  return v2;
}

uint64_t axIsAutomaticArbiterClientKeyboardActive()
{
  id v1;
  char v2;

  v1 = (id)objc_msgSend(MEMORY[0x24BDF6B60], "safeValueForKey:", CFSTR("automaticKeyboardArbiterClient"));
  v2 = objc_msgSend(v1, "safeBoolForKey:", CFSTR("keyboardActive"));

  return v2 & 1;
}

uint64_t axKeyboardInSeparateProcessAndScene(id obj)
{
  BOOL v2;
  char v3;
  id v4;
  id v5;
  char v6;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v6 = objc_msgSend(location, "safeBoolForKey:", CFSTR("_isHostedInAnotherProcess")) & 1;
  v4 = (id)objc_msgSend(location, "windowScene");
  v5 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_FBSScene"));

  if ((v6 & 1) == 0 || (v3 = 1, !v5))
  {
    v2 = 0;
    if ((v6 & 1) == 0)
      v2 = v5 == 0;
    v3 = v2;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);
  return v3 & 1;
}

uint64_t _accessibilityFindDurationRangeInString(void *a1, _QWORD *a2)
{
  id v2;
  BOOL v4;
  char v6;
  unsigned __int8 v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t i;
  id v11;
  _QWORD *v12;
  id location;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  location = 0;
  objc_storeStrong(&location, a1);
  v12 = a2;
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v20 = 0;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  v23 = 0;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v15 = 0;
  v11 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  i = 0;
  v9 = objc_msgSend(location, "length");
  while (i < v9)
  {
    v17 = i;
    v16 = v9 - i;
    v18 = i;
    v19 = v9 - i;
    v8 = objc_msgSend(location, "rangeOfCharacterFromSet:options:range:", v11, 0, i, v9 - i);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v7 = 0;
    v6 = 1;
    for (i = v8 + 1; ; ++i)
    {
      v4 = 0;
      if (i < v9)
        v4 = v7 < 3u;
      if (!v4)
        break;
      if (v6 && v6 != 1)
      {
        if ((unsigned __int16)objc_msgSend(location, "characterAtIndex:", i) != 58)
          break;
        v6 = 0;
      }
      else
      {
        if ((objc_msgSend(v11, "characterIsMember:", (unsigned __int16)objc_msgSend(location, "characterAtIndex:", i)) & 1) == 0)
          break;
        if (++v6 == 2)
          ++v7;
      }
    }
    if (v7 >= 2u)
    {
      v14 = v8;
      v15 = 2 * v7 + v7 - 1;
      if (v12)
      {
        if (v7 == 2)
          v2 = objc_retainAutorelease((id)*MEMORY[0x24BDFEB38]);
        else
          v2 = objc_retainAutorelease((id)*MEMORY[0x24BDFEB28]);
        *v12 = v2;
      }
      break;
    }
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  return v14;
}

id _createFormatDurationString(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;

  v17 = a1;
  v16 = a2;
  v15 = _createDurationString(a1);
  v14 = _createDurationString(v16);
  v6 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  v7 = accessibilityLocalizedString(CFSTR("slider.time.position"));
  v13 = (id)objc_msgSend(v6, "initWithFormat:", v15, v14);

  *(_QWORD *)&v10 = objc_msgSend(v13, "rangeOfString:", v15);
  *((_QWORD *)&v10 + 1) = v2;
  v12 = v10;
  *(_QWORD *)&v9 = objc_msgSend(v13, "rangeOfString:options:", v14, 4);
  *((_QWORD *)&v9 + 1) = v3;
  v11 = v9;
  v8 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFEA60]), "initWithString:", v13);
  if ((_QWORD)v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "setAttribute:forKey:withRange:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB38], v12);
  if ((_QWORD)v11 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "setAttribute:forKey:withRange:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB38], v11);
  v5 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  return v5;
}

id _createDurationString(double a1)
{
  id v1;
  float v2;
  unint64_t v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;

  v8 = a1;
  v9 = a1;
  v7 = vcvtmd_u64_f64(a1);
  v6 = a1 - (double)v7;
  v5 = v7 / 0x3C;
  v4 = 0;
  if (v7 / 0x3C)
  {
    v7 %= 60 * v5;
    v4 = v5 / 0x3C;
    if (v5 / 0x3C)
      v5 %= 60 * v4;
  }
  v1 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  v2 = v6;
  return (id)objc_msgSend(v1, "initWithFormat:", CFSTR("%lu:%lu:%.2f"), v4, v5, (float)((float)v7 + v2));
}

void sub_230CF69B8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

id trimWhitespaceToNil(id obj)
{
  id v1;
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v6 = location;
  v7 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v1 = (id)objc_msgSend(v6, "stringByTrimmingCharactersInSet:");
  v2 = location;
  location = v1;

  if (objc_msgSend(location, "length"))
    v3 = location;
  else
    v3 = 0;
  v5 = v3;
  objc_storeStrong(&location, 0);
  return v5;
}

void __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230CFDFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, _Unwind_Exception *exception_object)
{
  uint64_t v20;

  objc_destroyWeak((id *)(v20 - 24));
  _Unwind_Resume(a1);
}

void sub_230CFF510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,_Unwind_Exception *exception_object)
{
  uint64_t v24;

  _Block_object_dispose((const void *)(v24 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_230D053C0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_2_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

void __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_2_3_8_64_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_66_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

double CGFloatMin_0(double a1, double a2)
{
  return fmin(a1, a2);
}

double UIEdgeInsetsInsetRect_0(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t __os_log_helper_16_2_2_8_66_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

double UIRectGetWidth(double a1, double a2, double a3)
{
  return a3;
}

double UIRectGetMaxX(double a1, double a2, double a3)
{
  return a1 + a3;
}

double UIRectGetHeight(double a1, double a2, double a3, double a4)
{
  return a4;
}

double UIRectGetMinY(double a1, double a2)
{
  return a2;
}

double UIRectGetMaxY(double a1, double a2, double a3, double a4)
{
  return a2 + a4;
}

BOOL __CGPointEqualToPoint_1(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

double CGFloatMinMax_0(double a1, double a2, double a3)
{
  double v3;

  v3 = CGFloatMin_0(a3, a1);
  return CGFloatMax_0(a2, v3);
}

uint64_t __os_log_helper_16_2_2_4_0_8_64(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 64;
  *(_BYTE *)(result + 9) = 8;
  *(_QWORD *)(result + 10) = a3;
  return result;
}

double CGFloatMax_0(double a1, double a2)
{
  return fmax(a1, a2);
}

void __Block_byref_object_copy__18(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230D171D4(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = a1;
  *(_DWORD *)(v2 - 100) = a2;
  objc_destroyWeak((id *)(v2 - 56));
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 96));
}

id _containerForDimmingView(id obj)
{
  id v2;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = (id)objc_msgSend(location, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UISearchDisplayControllerContainerView")));
  objc_storeStrong(&location, 0);
  return v2;
}

void _toggleDimmingView(void *a1, void *a2)
{
  double v2;
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v9 = 0;
  objc_storeStrong(&v9, a2);
  v8 = _containerForDimmingView(location);
  if (v8 && (objc_msgSend(location, "alpha"), v2 != 0.0))
  {
    if (v8)
    {
      v6 = (id)objc_msgSend(v8, "_accessibilityDescendantOfType:", objc_opt_class());
      v4 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("_setAccessibilitySearchControllerDimmingViewVisible"));
      objc_msgSend(v8, "setAccessibilityViewIsModal:", 1);
      objc_msgSend(location, "setIsAccessibilityElement:", 1);
      objc_storeStrong(&v6, 0);
    }
  }
  else
  {
    v7 = (id)objc_msgSend(v9, "_accessibilityDescendantOfType:", objc_opt_class());
    v3 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("_setAccessibilitySearchControllerDimmingViewHidden"));
    objc_msgSend(v9, "setAccessibilityViewIsModal:", 0);
    objc_msgSend(location, "setIsAccessibilityElement:", 0);
    objc_storeStrong(&v7, 0);
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

id AXNoLoc(id obj)
{
  id v2;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = location;
  objc_storeStrong(&location, 0);
  return v2;
}

void sub_230D1EBF8(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  uint64_t v15;

  *(_QWORD *)(v15 - 96) = a1;
  *(_DWORD *)(v15 - 100) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v15 - 96));
}

id AXStatusBarItemHint(id obj)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  id v11;
  char v12;
  int v13;
  char v14;
  char v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;
  BOOL v21;
  id v22;
  char v23;
  id v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  id v29;
  id location;
  uint64_t v31;

  location = 0;
  objc_storeStrong(&location, obj);
  v29 = (id)objc_msgSend(location, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v28 = objc_msgSend(v29, "currentStyle");
  v27 = 0;
  v27 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityIsSystemAppServer") & 1;
  v26 = accessibilityLocalizedString(CFSTR("status.bar.scroll.to.top.hint"));
  v25 = 0;
  if (v28 == 207)
  {
    v1 = accessibilityLocalizedString(CFSTR("opens.preferences"));
    v2 = v25;
    v25 = v1;

    objc_storeStrong(&v26, 0);
  }
  else
  {
    v23 = 0;
    v15 = 1;
    if ((UIStatusBarStyleIsDoubleHeight() & 1) == 0)
    {
      v14 = 0;
      if ((v27 & 1) != 0)
      {
        v24 = (id)objc_msgSend(MEMORY[0x24BE006F0], "server");
        v23 = 1;
        v14 = objc_msgSend(v24, "isScreenLockedWithPasscode:", 0);
      }
      v15 = v14;
    }
    if ((v23 & 1) != 0)

    if ((v15 & 1) != 0)
      objc_storeStrong(&v26, 0);
  }
  v22 = accessibilityLocalizedString(CFSTR("notification.center.hint"));
  v21 = 0;
  v19 = 0;
  if ((v27 & 1) != 0)
  {
    v20 = (id)objc_msgSend(MEMORY[0x24BE006F0], "server");
    v19 = 1;
    v13 = objc_msgSend(v20, "isNotificationCenterVisible") & 1;
  }
  else
  {
    v13 = 0;
  }
  if ((v19 & 1) != 0)

  v21 = v13 != 0;
  v18 = (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (id)objc_msgSend(v18, "bundleIdentifier");
  v12 = 1;
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.purplebuddy")) & 1) == 0)
  {
    v10 = 0;
    if ((v27 & 1) != 0)
      v10 = v21;
    v12 = v10;
  }

  if ((v12 & 1) != 0)
    objc_storeStrong(&v22, 0);
  v17 = accessibilityLocalizedString(CFSTR("control.center.hint"));
  if ((v27 & 1) != 0 && v21)
    objc_storeStrong(&v17, 0);
  v16 = 0;
  v31 = 0;
  v7 = (id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v31 = v8;
  v9 = 1;
  if (v8 != 1)
    v9 = v31 == 5;
  if (v9)
  {
    v3 = accessibilityLocalizedString(CFSTR("dock.hint"));
    v4 = v16;
    v16 = v3;

  }
  v6 = (id)__UIAXStringForVariables();
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

id AXStatusBarPillTimeView(id obj)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v7 = (id)objc_msgSend(location, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIStatusBar")));
  v2 = (id)objc_msgSend(v7, "safeDictionaryForKey:", CFSTR("items"));
  v6 = (id)objc_msgSend(v2, "allValues");

  v3 = (id)objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &__block_literal_global_32);
  v5 = (id)objc_msgSend(v3, "firstObject");

  v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("pillTimeView"));
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
  return v4;
}

double CGFAbs_1(double a1)
{
  return fabs(a1);
}

void sub_230D26FD8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230D2B3D8(uint64_t a1, int a2)
{
  uint64_t v2;
  id *v4;

  v4 = *(id **)(v2 - 152);
  *(_QWORD *)(v2 - 88) = a1;
  *(_DWORD *)(v2 - 92) = a2;
  objc_destroyWeak(v4);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 88));
}

void sub_230D2CC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,_Unwind_Exception *exception_object)
{
  uint64_t v28;

  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__19(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

double CGFloor(double a1)
{
  return floor(a1);
}

void AXApplyTabBarItemPropertiesToView(void *a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;
  unsigned int v14;
  id v15;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v15 = 0;
  objc_storeStrong(&v15, a2);
  v13 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("systemItem"));
  v14 = objc_msgSend(v13, "intValue");

  if (v14)
  {
    v10 = v15;
    v11 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v14);
    objc_msgSend(v10, "accessibilitySetIdentification:");

  }
  v2 = v15;
  v3 = (id)objc_msgSend(location, "_accessibilityAXAttributedHint");
  objc_msgSend(v2, "setAccessibilityHint:");

  v4 = v15;
  v5 = (id)objc_msgSend(location, "_accessibilityAXAttributedValue");
  objc_msgSend(v4, "setAccessibilityValue:");

  v6 = v15;
  v7 = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
  objc_msgSend(v6, "setAccessibilityLabel:");

  v8 = v15;
  v9 = (id)objc_msgSend(location, "accessibilityIdentifier");
  objc_msgSend(v8, "setAccessibilityIdentifier:");

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
}

double UIEdgeInsetsInsetRect_1(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t _UIAXElementIsHeaderInSearchContexts(id obj)
{
  uint64_t v1;
  id v3;
  char v4;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v3 = (id)objc_msgSend(location, "_iosAccessibilityAttributeValue:", 2004);
  v1 = objc_msgSend(v3, "unsignedLongLongValue");
  v4 = 1;
  if ((v1 & *MEMORY[0x24BDF73C0]) != *MEMORY[0x24BDF73C0])
    v4 = objc_msgSend(location, "_accessibilityElementServesAsHeadingLandmark");

  objc_storeStrong(&location, 0);
  return v4 & 1;
}

void sub_230D34C2C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__20(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_2_2_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 66;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_66_8_0_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 66;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

void sub_230D35B80()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230D3C880()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_0_2_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

void __Block_byref_object_copy__21(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230D47A0C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  uint64_t v11;

  *(_QWORD *)(v11 - 64) = a1;
  *(_DWORD *)(v11 - 68) = a2;
  objc_destroyWeak((id *)(v11 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 64));
}

BOOL UIInterfaceOrientationIsLandscape(uint64_t a1)
{
  BOOL v2;

  v2 = 1;
  if (a1 != 4)
    return a1 == 3;
  return v2;
}

void sub_230D4FC8C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

double UIEdgeInsetsInsetRect_2(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

BOOL UIEdgeInsetsEqualToEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v9;

  v9 = 0;
  if (a2 == a6)
  {
    v9 = 0;
    if (a1 == a5)
    {
      v9 = 0;
      if (a4 == a8)
        return a3 == a7;
    }
  }
  return v9;
}

void sub_230D59DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, int a12, _Unwind_Exception *exception_object, char a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_230D5B350()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_2_3_8_64_8_64_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

double UIEdgeInsetsInsetRect_3(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

BOOL UIEdgeInsetsEqualToEdgeInsets_0(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v9;

  v9 = 0;
  if (a2 == a6)
  {
    v9 = 0;
    if (a1 == a5)
    {
      v9 = 0;
      if (a4 == a8)
        return a3 == a7;
    }
  }
  return v9;
}

uint64_t __os_log_helper_16_2_4_4_0_4_0_8_64_8_64(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 64;
  *(_BYTE *)(result + 15) = 8;
  *(_QWORD *)(result + 16) = a4;
  *(_BYTE *)(result + 24) = 64;
  *(_BYTE *)(result + 25) = 8;
  *(_QWORD *)(result + 26) = a5;
  return result;
}

BOOL __CGSizeEqualToSize_1(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

uint64_t AXIgnoresTextOperations()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&AXIgnoresTextOperations_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_597_0);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return AXIgnoresTextOperations_Ignores & 1;
}

void sub_230D7B19C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  *(_QWORD *)(v38 - 208) = a1;
  *(_DWORD *)(v38 - 212) = a2;
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v38 - 208));
}

void __Block_byref_object_copy__23(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

BOOL AX_CGSizeIsEmpty_0(double a1, double a2)
{
  BOOL v3;

  v3 = 1;
  if (a1 > 0.0)
    return a2 <= 0.0;
  return v3;
}

BOOL __CGPointEqualToPoint_2(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

void sub_230D82B24()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

BOOL __CGSizeEqualToSize_2(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

void __Block_byref_object_copy__24(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230D85190()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

id AXNoLoc_0(id obj)
{
  id v2;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = location;
  objc_storeStrong(&location, 0);
  return v2;
}

BOOL __CGSizeEqualToSize_3(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

uint64_t __os_log_helper_16_3_3_8_69_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 69;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_3_3_8_69_8_69_8_69(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 69;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 69;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 69;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_3_2_8_69_8_69(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 69;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 69;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_3_3_8_69_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 69;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

void __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

double CGCeiling(double a1)
{
  return ceil(a1);
}

double CGFAbs_2(double a1)
{
  return fabs(a1);
}

void __Block_byref_object_copy__26(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void __Block_byref_object_copy__27(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230D9A8F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,_Unwind_Exception *exception_object)
{
  uint64_t v24;

  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v24 - 80));
  objc_destroyWeak((id *)(v24 - 72));
  _Unwind_Resume(a1);
}

void sub_230D9B744(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  uint64_t v13;

  *(_QWORD *)(v13 - 168) = a1;
  *(_DWORD *)(v13 - 172) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 96));
  _Unwind_Resume(*(_Unwind_Exception **)(v13 - 168));
}

uint64_t __os_log_helper_16_2_2_8_64_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_64_4_0_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 64;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  return result;
}

uint64_t _isDevicePasscodeLocked()
{
  id v1;
  char v2;

  v2 = 0;
  v1 = (id)objc_msgSend(MEMORY[0x24BE006F0], "server");
  objc_msgSend(v1, "isScreenLockedWithPasscode:", &v2);

  return v2 & 1;
}

BOOL __CGSizeEqualToSize_4(double a1, double a2, double a3, double a4)
{
  BOOL v5;

  v5 = 0;
  if (a1 == a3)
    return a2 == a4;
  return v5;
}

void sub_230DAA76C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  uint64_t v9;

  *(_QWORD *)(v9 - 56) = a1;
  *(_DWORD *)(v9 - 60) = a2;
  objc_destroyWeak((id *)(v9 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v9 - 56));
}

void __Block_byref_object_copy__28(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void __Block_byref_object_copy__29(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_2_4_8_64_4_0_8_0_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 64;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  return result;
}

void sub_230DB6618()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_230DB733C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  *(_QWORD *)(v10 - 32) = a1;
  *(_DWORD *)(v10 - 36) = a2;
  objc_destroyWeak((id *)(v10 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 32));
}

void sub_230DBA5C8(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, id *a15, uint64_t a16, uint64_t a17, id *a18, uint64_t a19, uint64_t a20,uint64_t a21,id *location)
{
  uint64_t v22;

  *(_QWORD *)(v22 - 112) = a1;
  *(_DWORD *)(v22 - 116) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v22 - 64));
  _Unwind_Resume(*(_Unwind_Exception **)(v22 - 112));
}

void sub_230DBB020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  uint64_t v21;

  _Block_object_dispose((const void *)(v21 - 136), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__30(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_230DBBED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,int a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a38);
  _Unwind_Resume(a1);
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x24BDFDF80]();
}

uint64_t AXColorGetLuma()
{
  return MEMORY[0x24BDFF9B0]();
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x24BDFF9B8]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x24BDFDF98]();
}

uint64_t AXColorsProbablyEqual()
{
  return MEMORY[0x24BDFF9C0]();
}

uint64_t AXDateStringForFormat()
{
  return MEMORY[0x24BDFFF00]();
}

uint64_t AXDateStringForFormatWithTimeZone()
{
  return MEMORY[0x24BDFFF08]();
}

uint64_t AXDeviceGetMainScreenPixelBounds()
{
  return MEMORY[0x24BDFFF30]();
}

uint64_t AXDeviceGetType()
{
  return MEMORY[0x24BDFDFC0]();
}

uint64_t AXDeviceHasHomeButton()
{
  return MEMORY[0x24BDFFF60]();
}

uint64_t AXDeviceHasJindo()
{
  return MEMORY[0x24BDFDFC8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFE000]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x24BDFE008]();
}

uint64_t AXDeviceIsPhoneIdiom()
{
  return MEMORY[0x24BDFE010]();
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  return MEMORY[0x24BDFE8E8]();
}

uint64_t AXFormatFloat()
{
  return MEMORY[0x24BDFE048]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BDFE050]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x24BDFE058]();
}

uint64_t AXFormatNumber()
{
  return MEMORY[0x24BDFE068]();
}

uint64_t AXFrontBoardFocusedAppPID()
{
  return MEMORY[0x24BDFE638]();
}

uint64_t AXFrontBoardFocusedAppPIDs()
{
  return MEMORY[0x24BDFE648]();
}

uint64_t AXFrontBoardFocusedAppPIDsIgnoringSiri()
{
  return MEMORY[0x24BDFE650]();
}

uint64_t AXFrontBoardFocusedAppPidsForContinuity()
{
  return MEMORY[0x24BDFE658]();
}

uint64_t AXFrontBoardFocusedApps()
{
  return MEMORY[0x24BDFE678]();
}

uint64_t AXFrontBoardIsSystemAppUINonExclusive()
{
  return MEMORY[0x24BDFE690]();
}

uint64_t AXFrontBoardPIDForApplicationWithBundleID()
{
  return MEMORY[0x24BDFE698]();
}

uint64_t AXFrontBoardRunningAppPIDs()
{
  return MEMORY[0x24BDFE6B0]();
}

uint64_t AXFrontBoardSpeakThisAppPIDForPoint()
{
  return MEMORY[0x24BDFE6C8]();
}

uint64_t AXFrontBoardSpeakThisAppPIDs()
{
  return MEMORY[0x24BDFE6D0]();
}

uint64_t AXGuaranteedMutableArray()
{
  return MEMORY[0x24BDFE070]();
}

uint64_t AXLanguageConvertToCanonicalForm()
{
  return MEMORY[0x24BE001A8]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x24BDFE0B0]();
}

uint64_t AXLogBrailleHW()
{
  return MEMORY[0x24BDFE0E0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

uint64_t AXLogElementTraversal()
{
  return MEMORY[0x24BDFE100]();
}

uint64_t AXLogFirstElement()
{
  return MEMORY[0x24BDFE108]();
}

uint64_t AXLogFocusEngine()
{
  return MEMORY[0x24BDFE110]();
}

uint64_t AXLogLoading()
{
  return MEMORY[0x24BDFE138]();
}

uint64_t AXLogOpaqueElements()
{
  return MEMORY[0x24BDFE158]();
}

uint64_t AXLogRemoteElement()
{
  return MEMORY[0x24BDFE170]();
}

uint64_t AXLogScrollToVisible()
{
  return MEMORY[0x24BDFE178]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x24BDFE188]();
}

uint64_t AXLogUIA()
{
  return MEMORY[0x24BDFE1E8]();
}

uint64_t AXLogValidations()
{
  return MEMORY[0x24BDFE208]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x24BDFE210]();
}

uint64_t AXNSLocalizedStringForLocale()
{
  return MEMORY[0x24BED1FE8]();
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

uint64_t AXPidSuspend()
{
  return MEMORY[0x24BDFE928]();
}

uint64_t AXPidUnsuspend()
{
  return MEMORY[0x24BDFE930]();
}

uint64_t AXProcessIsFullKeyboardAccess()
{
  return MEMORY[0x24BDFE2B0]();
}

uint64_t AXProcessIsInCallService()
{
  return MEMORY[0x24BDFE2B8]();
}

uint64_t AXProcessIsInputUI()
{
  return MEMORY[0x24BDFE2C0]();
}

uint64_t AXProcessIsPineBoard()
{
  return MEMORY[0x24BDFE2D0]();
}

uint64_t AXProcessIsShortcuts()
{
  return MEMORY[0x24BDFE2D8]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x24BDFE2E0]();
}

uint64_t AXProcessIsStickerPickerService()
{
  return MEMORY[0x24BDFE2E8]();
}

uint64_t AXProcessIsSystemApplication()
{
  return MEMORY[0x24BDFE2F0]();
}

uint64_t AXRemoteElementConcatSceneUUIDAndContextId()
{
  return MEMORY[0x24BDFE940]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x24BDFE948]();
}

uint64_t AXRetainAutorelease()
{
  return MEMORY[0x24BE00338]();
}

uint64_t AXSSAccessibilityDescriptionForSymbolName()
{
  return MEMORY[0x24BDFF740]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

uint64_t AXSafeProtocolFromString()
{
  return MEMORY[0x24BDFE388]();
}

uint64_t AXSelectionModeVoiceOverSelectionMovement()
{
  return MEMORY[0x24BEBAD68]();
}

uint64_t AXUIAllKeyboardWindows()
{
  return MEMORY[0x24BDFF9E8]();
}

uint64_t AXUIApplicationWindows()
{
  return MEMORY[0x24BDFF9F0]();
}

uint64_t AXUIAutomationHandleKeyComplete()
{
  return MEMORY[0x24BEBAD80]();
}

CFTypeID AXUIElementGetTypeID(void)
{
  return MEMORY[0x24BDFE9E8]();
}

uint64_t AXUIElementPerformFencedActionWithValue()
{
  return MEMORY[0x24BDFE9F8]();
}

AXError AXUIElementSetMessagingTimeout(AXUIElementRef element, float timeoutInSeconds)
{
  return MEMORY[0x24BDFEA08](element, timeoutInSeconds);
}

uint64_t AXUIKeyboardEntryNotificationBlockTimer()
{
  return MEMORY[0x24BEBAD88]();
}

uint64_t AXUIKeyboardIsOOP()
{
  return MEMORY[0x24BDFF9F8]();
}

uint64_t AXUIKeyboardIsOnScreen()
{
  return MEMORY[0x24BDFFA00]();
}

uint64_t AXUIKeyboardScreenFrame()
{
  return MEMORY[0x24BDFFA08]();
}

uint64_t AXUIKeyboardWindow()
{
  return MEMORY[0x24BDFFA18]();
}

uint64_t AXUIMakeTouchForTouchesBeganAtLocation()
{
  return MEMORY[0x24BDFFA28]();
}

uint64_t AXUIRepresentedKeyboardElement()
{
  return MEMORY[0x24BDFFA38]();
}

uint64_t AXUIUnblockKeyboardEntryNotifications()
{
  return MEMORY[0x24BEBAD90]();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return (AXValueRef)MEMORY[0x24BDFEA28](*(_QWORD *)&theType, valuePtr);
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x24BE004C8]();
}

uint64_t AX_CGRectAlmostEqualToRect()
{
  return MEMORY[0x24BE004E8]();
}

uint64_t AX_CGRectBySubtractingRect()
{
  return MEMORY[0x24BE004F0]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x24BE00500]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C0](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x24BDBC328](allocator, activities, repeats, order, block);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x24BDBD8B0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x24BDBE298]();
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

CGSize CGSizeFromString(NSString *string)
{
  double v1;
  double v2;
  CGSize result;

  MEMORY[0x24BDF65B8](string);
  result.height = v2;
  result.width = v1;
  return result;
}

uint64_t FKALogCommon()
{
  return MEMORY[0x24BDFE450]();
}

uint64_t GSCurrentEventTimestamp()
{
  return MEMORY[0x24BE3D598]();
}

uint64_t IOHIDEventCreateScrollEvent()
{
  return MEMORY[0x24BDD8218]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x24BDD82B8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MRMediaRemoteSendCommand()
{
  return MEMORY[0x24BE65220]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x24BDD1238]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x24BDD1248]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x24BDF6688](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

uint64_t QSInstallSharedSafeCategoriesIfNeeded()
{
  return MEMORY[0x24BDFFAC0]();
}

uint64_t UIAXArrayForString()
{
  return MEMORY[0x24BEBAE20]();
}

uint64_t UIAXFrameForElements()
{
  return MEMORY[0x24BEBAE40]();
}

uint64_t UIAXKeyboardIsOnScreen()
{
  return MEMORY[0x24BEBAE48]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x24BEBAE50]();
}

uint64_t UIAXLocalizedStringForKnownAXIdentifier()
{
  return MEMORY[0x24BEBAE58]();
}

uint64_t UIAXMassageElementDescription()
{
  return MEMORY[0x24BEBAE60]();
}

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x24BEBAE90]();
}

uint64_t UIAccessibilityColorEqualToColor()
{
  return MEMORY[0x24BEBAEC8]();
}

uint64_t UIAccessibilityConvertAccessibilityPathToViewCoordinates()
{
  return MEMORY[0x24BDF7210]();
}

uint64_t UIAccessibilityConvertAttachmentsInAttributedStringToAX()
{
  return MEMORY[0x24BEBAEF8]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDF7218](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

UIBezierPath *__cdecl UIAccessibilityConvertPathToScreenCoordinates(UIBezierPath *path, UIView *view)
{
  return (UIBezierPath *)MEMORY[0x24BDF7220](path, view);
}

uint64_t UIAccessibilityConvertRectToPortraitCoordinates()
{
  return MEMORY[0x24BEBAF10]();
}

uint64_t UIAccessibilityCreateEventForSceneReferencePoint()
{
  return MEMORY[0x24BEBAF18]();
}

uint64_t UIAccessibilityEmojiDescription()
{
  return MEMORY[0x24BDFE828]();
}

id UIAccessibilityFocusedElement(UIAccessibilityAssistiveTechnologyIdentifier assistiveTechnologyIdentifier)
{
  return (id)MEMORY[0x24BDF7240](assistiveTechnologyIdentifier);
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x24BEBAFC0]();
}

uint64_t UIAccessibilityFrameToBounds()
{
  return MEMORY[0x24BEBAFC8]();
}

uint64_t UIAccessibilityGetKeyboardLayoutStar()
{
  return MEMORY[0x24BEBAFD0]();
}

uint64_t UIAccessibilityIsAppExtension()
{
  return MEMORY[0x24BEBAFE8]();
}

uint64_t UIAccessibilityIsImageScreenshot()
{
  return MEMORY[0x24BDFE830]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BDF72B0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

uint64_t UIAccessibilityIsWidgetExtension()
{
  return MEMORY[0x24BEBAFF0]();
}

uint64_t UIAccessibilityLanguageForLanguage()
{
  return MEMORY[0x24BEBB020]();
}

uint64_t UIAccessibilityMetadataDescriptionForImage()
{
  return MEMORY[0x24BDFE838]();
}

uint64_t UIAccessibilityPhotoCreationDate()
{
  return MEMORY[0x24BDFE848]();
}

uint64_t UIAccessibilityPointForPoint()
{
  return MEMORY[0x24BEBB050]();
}

uint64_t UIAccessibilityPointToPoint()
{
  return MEMORY[0x24BEBB058]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIAccessibilityRelateElements()
{
  return MEMORY[0x24BEBB060]();
}

uint64_t UIAccessibilitySpeak()
{
  return MEMORY[0x24BEBB0B8]();
}

uint64_t UIAccessibilityUnrelateAllElements()
{
  return MEMORY[0x24BEBB1C0]();
}

uint64_t UIAccessibilityViewHasHiddenOrZeroAlphaAncestor()
{
  return MEMORY[0x24BEBB1E0]();
}

uint64_t UIAccessibilityWindowForContextId()
{
  return MEMORY[0x24BEBB200]();
}

void UIAccessibilityZoomFocusChanged(UIAccessibilityZoomType type, CGRect frame, UIView *view)
{
  MEMORY[0x24BDF7460](type, view, (__n128)frame.origin, *(__n128 *)&frame.origin.y, (__n128)frame.size, *(__n128 *)&frame.size.height);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

uint64_t UIImageGetTableNextButton()
{
  return MEMORY[0x24BDF7908]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t UIKeyboardGetCurrentUILanguage()
{
  return MEMORY[0x24BDF7A40]();
}

uint64_t UIKeyboardInputModeGetLanguage()
{
  return MEMORY[0x24BDF7A90]();
}

uint64_t UIKeyboardInputModeGetLanguageWithRegion()
{
  return MEMORY[0x24BDF7A98]();
}

uint64_t UIKeyboardPredictionEnabledForCurrentInputMode()
{
  return MEMORY[0x24BDF7B20]();
}

uint64_t UIKeyboardSetSplit()
{
  return MEMORY[0x24BDF7B38]();
}

uint64_t UIKeyboardSupportsSplit()
{
  return MEMORY[0x24BDF7B48]();
}

uint64_t UIKeyboardTypeIsNumberPad()
{
  return MEMORY[0x24BDF7B50]();
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x24BEBB208]();
}

uint64_t UIKitAccessibilityLocalizedStringInTable()
{
  return MEMORY[0x24BEBB210]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x24BDF7C78]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BDF7D08]();
}

uint64_t UISLocalizedStringForSecureName()
{
  return MEMORY[0x24BEBEC70]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x24BDF7DA0]();
}

uint64_t UIStatusBarStyleIsDoubleHeight()
{
  return MEMORY[0x24BDF7DC0]();
}

uint64_t VOTLogCommon()
{
  return MEMORY[0x24BDFE508]();
}

uint64_t VOTLogHandwriting()
{
  return MEMORY[0x24BDFE510]();
}

uint64_t _AXAddToElementCache()
{
  return MEMORY[0x24BDFECE8]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BDFE528]();
}

uint64_t _AXFeatureSupportsScrollBars()
{
  return MEMORY[0x24BE00808]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BDFE538]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x24BED2040]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x24BED2050]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x24BED2070]();
}

uint64_t _AXSAuditInspectionModeEnabled()
{
  return MEMORY[0x24BED20B0]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x24BED20C0]();
}

uint64_t _AXSAutomationFauxCollectionViewCellsEnabled()
{
  return MEMORY[0x24BED20C8]();
}

uint64_t _AXSAutomationFauxTableViewCellsEnabled()
{
  return MEMORY[0x24BED20D0]();
}

uint64_t _AXSAutomationHitpointWarpingEnabled()
{
  return MEMORY[0x24BED20D8]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSFullKeyboardAccessFocusRingEnabled()
{
  return MEMORY[0x24BED21F8]();
}

uint64_t _AXSFullKeyboardAccessPassthroughModeEnabled()
{
  return MEMORY[0x24BED2200]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x24BED22D0]();
}

uint64_t _AXSMossdeepEnabled()
{
  return MEMORY[0x24BED2340]();
}

uint64_t _AXSQuickSpeakEnabled()
{
  return MEMORY[0x24BED23C0]();
}

uint64_t _AXSQuickSpeakHighlightTextEnabled()
{
  return MEMORY[0x24BED23C8]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x24BED2518]();
}

uint64_t _AXSSpeakThisHighlightVisible()
{
  return MEMORY[0x24BED2520]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x24BDFE548]();
}

uint64_t _AXUIElementCreateAppElementWithPid()
{
  return MEMORY[0x24BDFED40]();
}

uint64_t _AXUIElementRemoteBridgeMachPortForAXServer()
{
  return MEMORY[0x24BDFED78]();
}

uint64_t _AXUIElementSetMachPortForNextMessage()
{
  return MEMORY[0x24BDFED88]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x24BDBD008]();
}

uint64_t _UIAXAssignFocusToItem()
{
  return MEMORY[0x24BDF8048]();
}

uint64_t _UIAXDismissKeyboardIfNecessary()
{
  return MEMORY[0x24BEBB230]();
}

uint64_t _UIAXLastKeyboardUsed()
{
  return MEMORY[0x24BEBB240]();
}

uint64_t _UIAXObjectIsBehindKeyboard()
{
  return MEMORY[0x24BEBB248]();
}

uint64_t _UIAXSetLastKeyboardUsed()
{
  return MEMORY[0x24BEBB250]();
}

uint64_t _UIAccessibilityBlockPostingOfAllNotifications()
{
  return MEMORY[0x24BEBB258]();
}

uint64_t _UIAccessibilityBlockPostingOfNotification()
{
  return MEMORY[0x24BEBB260]();
}

uint64_t _UIAccessibilityFocusedElementForAssistiveTech()
{
  return MEMORY[0x24BEBB288]();
}

uint64_t _UIAccessibilityFocusedElements()
{
  return MEMORY[0x24BEBB290]();
}

uint64_t _UIAccessibilityFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BDF8058]();
}

uint64_t _UIAccessibilityIgnoreNextNotification()
{
  return MEMORY[0x24BEBB298]();
}

uint64_t _UIAccessibilityNextIgnoredNotification()
{
  return MEMORY[0x24BEBB2B0]();
}

uint64_t _UIAccessibilitySetAssociatedElementContextForNextNotification()
{
  return MEMORY[0x24BEBB2B8]();
}

uint64_t _UIAccessibilityStartedWithInitialization()
{
  return MEMORY[0x24BDF8078]();
}

uint64_t _UIAccessibilityUnblockPostingOfNotification()
{
  return MEMORY[0x24BEBB2C0]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x24BDF8090]();
}

uint64_t _UIApplicationIsWebKitLoaded()
{
  return MEMORY[0x24BDF8098]();
}

uint64_t _UIImageIsSystemSymbol()
{
  return MEMORY[0x24BDF8140]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x24BDFEDA0]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x24BEBB2D0]();
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

uint64_t __UIAccessibilityGetAssociatedInt()
{
  return MEMORY[0x24BDFE588]();
}

uint64_t __UIAccessibilityGetAssociatedInteger()
{
  return MEMORY[0x24BDFE590]();
}

uint64_t __UIAccessibilityGetAssociatedLong()
{
  return MEMORY[0x24BDFE598]();
}

uint64_t __UIAccessibilityGetAssociatedNonRetainedObject()
{
  return MEMORY[0x24BDFE5A0]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x24BDFE5A8]();
}

uint64_t __UIAccessibilityGetAssociatedUnsignedInt()
{
  return MEMORY[0x24BDFE5B0]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BDFE5C0]();
}

uint64_t __UIAccessibilitySetAssociatedBool()
{
  return MEMORY[0x24BDFE5C8]();
}

uint64_t __UIAccessibilitySetAssociatedInt()
{
  return MEMORY[0x24BDFE5E8]();
}

uint64_t __UIAccessibilitySetAssociatedInteger()
{
  return MEMORY[0x24BDFE5F0]();
}

uint64_t __UIAccessibilitySetAssociatedLong()
{
  return MEMORY[0x24BDFE5F8]();
}

uint64_t __UIAccessibilitySetAssociatedNonRetainedObject()
{
  return MEMORY[0x24BDFE600]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x24BDFE608]();
}

uint64_t __UIAccessibilitySetAssociatedUnsignedInt()
{
  return MEMORY[0x24BDFE610]();
}

uint64_t __ax_verbose_encode_with_type_encoding_group_class()
{
  return MEMORY[0x24BDFE620]();
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

uint64_t accessibilityUIKitLocalizedString()
{
  return MEMORY[0x24BEBB2E0]();
}

uint64_t accessibilityUIKitSymbolNamesLocalizedString()
{
  return MEMORY[0x24BEBB2E8]();
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x24BEDCE68](cls, outCount);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x24BEDCF08](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x24BEDCF10](v);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
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

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

