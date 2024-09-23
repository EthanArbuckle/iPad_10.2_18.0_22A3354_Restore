void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1B57409D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5740B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5740BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B5740F74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B57412A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5741558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, id location)
{
  void *v18;
  id *v19;
  void *v20;
  void *v21;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B57416C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void setupHapticLogScopes(void)
{
  if (setupHapticLogScopes(void)::once != -1)
    dispatch_once(&setupHapticLogScopes(void)::once, &__block_literal_global_2);
}

void sub_1B57418A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B5741B44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5741C7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5741EA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5742384(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5742418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void AVFASoftLink::AVFASoftLink(AVFASoftLink *this)
{
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  id *v6;
  void *v7;
  id *v8;
  id *v9;
  id *v10;
  id *v11;
  id *v12;

  *((_OWORD *)this + 1) = 0u;
  v2 = (id *)((char *)this + 16);
  v3 = (id *)((char *)this + 24);
  *((_OWORD *)this + 2) = 0u;
  v4 = (id *)((char *)this + 32);
  *(_OWORD *)this = 0u;
  v5 = (id *)((char *)this + 40);
  *((_QWORD *)this + 6) = 0;
  v6 = (id *)((char *)this + 48);
  v7 = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 1);
  if (v7)
  {
    *(_QWORD *)this = NSClassFromString(CFSTR("AVAudioFormat"));
    *((_QWORD *)this + 1) = NSClassFromString(CFSTR("AVAudioSession"));
    v8 = (id *)dlsym(v7, "AVAudioSessionMediaServicesWereResetNotification");
    if (v8)
      objc_storeStrong(v3, *v8);
    v9 = (id *)dlsym(v7, "AVAudioSessionMediaServicesWereLostNotification");
    if (v9)
      objc_storeStrong(v2, *v9);
    v10 = (id *)dlsym(v7, "AVAudioSessionCategorySystemSoundsAndHaptics");
    if (v10)
      objc_storeStrong(v4, *v10);
    v11 = (id *)dlsym(v7, "AVAudioSessionCategoryPlayback");
    if (v11)
      objc_storeStrong(v5, *v11);
    v12 = (id *)dlsym(v7, "AVAudioSessionModeHapticsConstantVolume");
    if (v12)
      objc_storeStrong(v6, *v12);
  }
}

void sub_1B5742564(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;

  _Unwind_Resume(a1);
}

void ___Z20setupClientLogScopesv_block_invoke()
{
  CALog::Scope *v0;
  __CFString *v1;
  CALog::Scope *v2;
  __CFString *v3;

  v0 = (CALog::Scope *)operator new();
  *((_QWORD *)v0 + 1) = 0;
  *(_QWORD *)v0 = os_log_create("com.apple.coreaudio", "hcln");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hapticclient_verbose");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CALog::Scope::SetPriorityThresholdFromPreference(v0, CFSTR("com.apple.coreaudio"), v1);

  kAVHCScope = (uint64_t)v0;
  v2 = (CALog::Scope *)operator new();
  *((_QWORD *)v2 + 1) = 0;
  *(_QWORD *)v2 = os_log_create("com.apple.coreaudio", "hcst");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hapticclient_state_verbose");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CALog::Scope::SetPriorityThresholdFromPreference(v2, CFSTR("com.apple.coreaudio"), v3);

  kAVHSScope = (uint64_t)v2;
}

void sub_1B57426A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___Z20setupHapticLogScopesv_block_invoke()
{
  int v0;
  __SecTask *v1;
  __SecTask *v2;
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  BOOL v6;
  CALog::Scope *v7;
  __CFString *v8;
  CALog::Scope *v9;
  __CFString *v10;
  CALog::Scope *v11;
  __CFString *v12;

  v0 = _os_feature_enabled_impl();
  v1 = SecTaskCreateFromSelf(0);
  if (!v1)
  {
    v6 = 0;
    if (!v0)
      goto LABEL_13;
    goto LABEL_11;
  }
  v2 = v1;
  v3 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.coreaudio.LoadDecodersInProcess"), 0);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  CFRelease(v2);
  if (v0)
  {
LABEL_11:
    if (!v6)
      AudioConverterPrepare();
  }
LABEL_13:
  v7 = (CALog::Scope *)operator new();
  *((_QWORD *)v7 + 1) = 0;
  *(_QWORD *)v7 = os_log_create("com.apple.corehaptics", "hapi");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hapticapi_verbose");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CALog::Scope::SetPriorityThresholdFromPreference(v7, CFSTR("com.apple.coreaudio"), v8);

  kHAPIScope = (uint64_t)v7;
  v9 = (CALog::Scope *)operator new();
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)v9 = os_log_create("com.apple.corehaptics", "hpwr");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hapticpower_verbose");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CALog::Scope::SetPriorityThresholdFromPreference(v9, CFSTR("com.apple.coreaudio"), v10);

  kHPWRScope = (uint64_t)v9;
  v11 = (CALog::Scope *)operator new();
  *((_QWORD *)v11 + 1) = 0;
  *(_QWORD *)v11 = os_log_create("com.apple.corehaptics", "hmet");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hapticmetrics_verbose");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CALog::Scope::SetPriorityThresholdFromPreference(v11, CFSTR("com.apple.coreaudio"), v12);

  kHMETScope = (uint64_t)v11;
}

void sub_1B57428D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *CALog::Scope::SetPriorityThresholdFromPreference(CALog::Scope *this, __CFString *a2, __CFString *a3)
{
  _QWORD *result;
  uint64_t v4;
  _QWORD v5[3];
  _QWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5[0] = &off_1E695FCF0;
  v5[1] = this;
  v6 = v5;
  CASmartPreferences::AddHandler<int>((CASmartPreferences *)a3, a2, (uint64_t)CALog::PrefValueToPriority, (uint64_t)v5);
  result = v6;
  if (v6 == v5)
  {
    v4 = 4;
    result = v5;
  }
  else
  {
    if (!v6)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
}

void sub_1B574298C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *CASmartPreferences::AddHandler<int>(CASmartPreferences *a1, __CFString *a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];
  _BYTE *v16;
  _BYTE v17[24];
  _BYTE *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = CASmartPreferences::instance(a1);
  v14 = a3;
  v9 = v15;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)v15, a4);
  v18 = 0;
  v10 = operator new(0x30uLL);
  *v10 = &off_1E695FC98;
  v10[1] = v14;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(v10 + 2), (uint64_t)v15);
  v18 = v10;
  CASmartPreferences::_RegisterFirstHandler((uint64_t)v8, a1, a2, (uint64_t)v17);
  result = v18;
  if (v18 == v17)
  {
    v12 = 4;
    result = v17;
  }
  else
  {
    if (!v18)
      goto LABEL_6;
    v12 = 5;
  }
  result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v12))();
LABEL_6:
  if (v16 == v15)
  {
    v13 = 4;
  }
  else
  {
    if (!v16)
      return result;
    v13 = 5;
    v9 = v16;
  }
  return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v9 + 8 * v13))(v9);
}

void sub_1B5742AF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _QWORD *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  _QWORD *v17;
  char *v18;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v20 = a17;
  if (a17 == v18)
  {
    v21 = 4;
    v20 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_6;
    v21 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v20 + 8 * v21))();
LABEL_6:
  if (a13 == v17)
  {
    v22 = 4;
  }
  else
  {
    if (!a13)
      goto LABEL_11;
    v22 = 5;
    v17 = a13;
  }
  (*(void (**)(_QWORD *))(*v17 + 8 * v22))(v17);
LABEL_11:
  _Unwind_Resume(exception_object);
}

void *CASmartPreferences::instance(CASmartPreferences *this)
{
  unsigned __int8 v1;

  {
    CASmartPreferences::CASmartPreferences((CASmartPreferences *)&CASmartPreferences::instance(void)::global);
  }
  return &CASmartPreferences::instance(void)::global;
}

void sub_1B5742BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CASmartPreferences::_RegisterFirstHandler(uint64_t a1, const void *a2, __CFString *a3, uint64_t a4)
{
  unint64_t v8;
  uint64_t v9;
  void *value;
  const void *v11;

  value = a3;
  v11 = a2;
  std::mutex::lock((std::mutex *)a1);
  if ((CASmartPreferences::HavePref((CASmartPreferences *)a1, a2, a3) & 1) == 0)
  {
    CFRetain(a2);
    CFRetain(a3);
    v8 = *(_QWORD *)(a1 + 80);
    if (v8 >= *(_QWORD *)(a1 + 88))
    {
      v9 = std::vector<CASmartPreferences::Pref>::__emplace_back_slow_path<__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>((uint64_t *)(a1 + 72), (uint64_t *)&v11, (uint64_t *)&value, a4);
    }
    else
    {
      std::allocator<CASmartPreferences::Pref>::construct[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>(a1 + 88, *(_QWORD **)(a1 + 80), (uint64_t *)&v11, (uint64_t *)&value, a4);
      v9 = v8 + 48;
      *(_QWORD *)(a1 + 80) = v8 + 48;
    }
    *(_QWORD *)(a1 + 80) = v9;
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 64), value);
    CASmartPreferences::Pref::Load((CFStringRef *)(*(_QWORD *)(a1 + 80) - 48));
  }
  std::mutex::unlock((std::mutex *)a1);
}

void sub_1B5742CB0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 80) = v2;
  std::mutex::unlock((std::mutex *)v1);
  _Unwind_Resume(a1);
}

uint64_t CASmartPreferences::HavePref(CASmartPreferences *this, CFTypeRef cf1, const __CFString *a3)
{
  CFTypeRef *v3;
  CFTypeRef *v4;

  v3 = (CFTypeRef *)*((_QWORD *)this + 9);
  v4 = (CFTypeRef *)*((_QWORD *)this + 10);
  if (v3 == v4)
    return 0;
  while (!CFEqual(cf1, *v3) || !CFEqual(a3, v3[1]))
  {
    v3 += 6;
    if (v3 == v4)
      return 0;
  }
  return 1;
}

CFPropertyListRef CASmartPreferences::Pref::Load(CFStringRef *this)
{
  CFPropertyListRef result;
  CFStringRef v3;
  CFPropertyListRef v4;

  result = CFPreferencesCopyAppValue(*this, this[1]);
  if (result)
  {
    v4 = result;
    v3 = this[5];
    if (!v3)
      std::__throw_bad_function_call[abi:ne180100]();
    return (CFPropertyListRef)(*((uint64_t (**)(CFStringRef, CFPropertyListRef *))v3->isa + 6))(v3, &v4);
  }
  return result;
}

_QWORD *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::__clone(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = operator new(0x30uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *v2 = &off_1E695FC98;
  v2[1] = v3;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_1B5742DD4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E695FCF0;
  a2[1] = v2;
  return result;
}

uint64_t std::vector<CASmartPreferences::Pref>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CASmartPreferences::Pref>,std::reverse_iterator<CASmartPreferences::Pref*>,std::reverse_iterator<CASmartPreferences::Pref*>,std::reverse_iterator<CASmartPreferences::Pref*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void **std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer(void **a1)
{
  std::__split_buffer<CASmartPreferences::Pref>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::destroy_deallocate(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 16;
  v3 = (char *)*((_QWORD *)__p + 5);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

void sub_1B5743AB4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSException *v26;
  const CALog::Scope *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  if (a2 == 1)
  {
    v26 = (NSException *)objc_begin_catch(a1);
    CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)(v23 - 160) = 136315650;
      v30 = v23 - 160;
      *(_QWORD *)(v30 + 4) = "HapticServerConfig.mm";
      *(_WORD *)(v23 - 148) = 1024;
      *(_DWORD *)(v30 + 14) = 174;
      *(_WORD *)(v23 - 142) = 2080;
      *(_QWORD *)(v30 + 20) = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Caught exception during dictionary parse", (uint8_t *)(v23 - 160), 0x1Cu);
    }

    NSErrorFromNSException(v26);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(v20 + 48) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;

    objc_end_catch();
    JUMPOUT(0x1B5743A44);
  }

  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__emplace_unique_key_args<AVHapticPlayerEventType,std::pair<AVHapticPlayerEventType const,NSString * {__strong}> const&>(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  _QWORD *v12;
  void *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  v12 = (_QWORD *)(a1 + 16);
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v6;
  v13 = (void *)a3[1];
  i[2] = *a3;
  i[3] = v13;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    v16 = 1;
    if (v7 >= 3)
      v16 = (v7 & (v7 - 1)) != 0;
    v17 = v16 | (2 * v7);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__rehash<true>(a1, v19);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *i = *v21;
LABEL_38:
    *v21 = i;
    goto LABEL_39;
  }
  *i = *v12;
  *v12 = i;
  *(_QWORD *)(v20 + 8 * v3) = v12;
  if (*i)
  {
    v22 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7)
        v22 %= v7;
    }
    else
    {
      v22 &= v7 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1B5743FA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void CASmartPreferences::CASmartPreferences(CASmartPreferences *this)
{
  NSObject *global_queue;
  NSObject *v3;
  uint64_t v4;
  _QWORD handler[5];

  *(_QWORD *)this = 850045863;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
  global_queue = dispatch_get_global_queue(0, 0);
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  v3 = dispatch_source_create(MEMORY[0x1E0C80DC0], 1uLL, 0, global_queue);
  v4 = MEMORY[0x1E0C809B0];
  *((_QWORD *)this + 12) = v3;
  handler[0] = v4;
  handler[1] = 0x40000000;
  handler[2] = ___ZN18CASmartPreferencesC2Ev_block_invoke;
  handler[3] = &__block_descriptor_tmp_0;
  handler[4] = this;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*((dispatch_object_t *)this + 12));
}

void sub_1B57442C4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::~mutex(v1);
  _Unwind_Resume(a1);
}

uint64_t PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

_QWORD *__copy_helper_atomic_property_(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
}

void sub_1B5744564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)PatternPlayer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B574475C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B57449AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B5744BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B5744E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  id *v17;
  void *v18;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B57451B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,id location)
{
  void *v22;
  id *v23;
  void *v24;
  id *v25;
  void *v26;

  objc_destroyWeak(v25);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B5745500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,id location)
{
  void *v22;
  id *v23;
  void *v24;
  id *v25;
  void *v26;

  objc_destroyWeak(v25);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B57455E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B5745728(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5745860(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5745B4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5745DBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1B57460B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B57462F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1B5746934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  void *v28;

  _Unwind_Resume(a1);
}

void sub_1B5746C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_1B5746ED4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B57471DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;

  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1B57472DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  id *v13;
  void *v14;
  uint64_t v15;

  objc_destroyWeak(v13);
  objc_destroyWeak((id *)(v15 - 40));
  _Unwind_Resume(a1);
}

void sub_1B5747570(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5747898(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B57479A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B5747B48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B5747E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;

  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1B5748044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B57480D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B5748190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B5748D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,void *a41)
{
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;

  *(_QWORD *)(v45 - 248) = a1;

  _Unwind_Resume(*(_Unwind_Exception **)(v45 - 248));
}

void sub_1B57491FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B57493D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B574960C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5749794(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1B574984C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B57498E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B5749BE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B574A60C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  void *v38;
  id *v39;
  void *v40;
  void *v41;
  uint64_t v42;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose((const void *)(v42 - 176), 8);

  objc_destroyWeak(v39);
  objc_destroyWeak(location);
  objc_destroyWeak(&a38);

  _Unwind_Resume(a1);
}

void sub_1B574AA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B574AB48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  id *v13;
  void *v14;
  uint64_t v15;

  objc_destroyWeak(v13);
  objc_destroyWeak((id *)(v15 - 40));
  _Unwind_Resume(a1);
}

void sub_1B574ACC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B574B230(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__assign_unique<std::pair<AVHapticPlayerEventType const,NSString * {__strong}> const*>(_QWORD *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t *v4;
  uint64_t v6;
  uint64_t i;
  id *v8;
  BOOL v9;
  id *v10;
  void *v11;
  BOOL v12;

  v4 = a2;
  v6 = a1[1];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      *(_QWORD *)(*a1 + 8 * i) = 0;
    v8 = (id *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8)
      v9 = a2 == a3;
    else
      v9 = 1;
    if (v9)
    {
      v10 = v8;
    }
    else
    {
      do
      {
        v11 = (void *)v4[1];
        v8[2] = (id)*v4;
        objc_storeStrong(v8 + 3, v11);
        v10 = (id *)*v8;
        std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique(a1, v8);
        v4 += 2;
        if (v10)
          v12 = v4 == a3;
        else
          v12 = 1;
        v8 = v10;
      }
      while (!v12);
    }
    std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__deallocate_node((uint64_t)a1, v10);
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__emplace_unique_key_args<AVHapticPlayerEventType,std::pair<AVHapticPlayerEventType const,NSString * {__strong}> const&>((uint64_t)a1, v4, v4);
    v4 += 2;
  }
}

void sub_1B574B38C(void *a1)
{
  uint64_t v1;
  id *v2;

  __cxa_begin_catch(a1);
  std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__deallocate_node(v1, v2);
  __cxa_rethrow();
}

void sub_1B574B3A4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B574B764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B574BBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1B574BD8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B574C3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_signpost_id_t spid, uint64_t a11, uint64_t a12, uint8_t buf)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B574C94C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B574CA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B574CB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B574CCD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  void *v18;
  id *v19;
  void *v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B574CF68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B574D38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B574D5D0(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  void *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);

  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v5 - 72));
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B574DB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,id location)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B574E3DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id CALog::Scope::oslog(id *this)
{
  return *this;
}

void sub_1B574E4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id AVFASoftLink::getAVAudioSessionMediaServicesWereResetNotification(AVFASoftLink *this)
{
  return *(id *)(CADeprecated::TSingleton<AVFASoftLink>::instance() + 24);
}

id AVFASoftLink::getAVAudioSessionMediaServicesWereLostNotification(AVFASoftLink *this)
{
  return *(id *)(CADeprecated::TSingleton<AVFASoftLink>::instance() + 16);
}

void sub_1B574E670(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

id AVFASoftLink::getAVAudioSession(AVFASoftLink *this)
{
  return *(id *)(CADeprecated::TSingleton<AVFASoftLink>::instance() + 8);
}

uint64_t CADeprecated::TSingleton<AVFASoftLink>::instance()
{
  unint64_t v0;
  char v2;
  char **v3;
  char *v4;

  v0 = atomic_load(&CADeprecated::TSingleton<AVFASoftLink>::sOnce);
  if (v0 != -1)
  {
    v4 = &v2;
    v3 = &v4;
    std::__call_once(&CADeprecated::TSingleton<AVFASoftLink>::sOnce, &v3, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<CADeprecated::TSingleton<AVFASoftLink>::instance(void)::{lambda(void)#1} &&>>);
  }
  return CADeprecated::TSingleton<AVFASoftLink>::sInstance;
}

void sub_1B574E750(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B574E8DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B574EF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, id obj)
{
  void *v14;
  void *v15;
  void *v16;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B574F060(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B574F34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  void *v30;
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);

  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_1B574F710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B574F848(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B574FAE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  void *v19;
  id *v20;
  void *v21;
  id *v22;

  v22 = v20;
  objc_destroyWeak(v22);

  objc_destroyWeak(&location);
  objc_sync_exit(v19);

  _Unwind_Resume(a1);
}

void sub_1B574FDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B5750220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B5750504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B57507C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B57509DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5750CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  void *v15;
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B5750F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
  void *v28;
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_1B57510A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5751704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31)
{
  id *v31;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  uint64_t v36;
  void *v37;

  v37 = v33;

  objc_destroyWeak(v34);
  objc_destroyWeak(v31);
  _Block_object_dispose(&a26, 8);

  objc_destroyWeak((id *)(v36 - 168));
  _Unwind_Resume(a1);
}

void sub_1B5751910(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5751AB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5751DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_1B5752160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  void *v21;
  void *v22;
  void *v23;

  objc_sync_exit(v22);
  _Unwind_Resume(a1);
}

void sub_1B57522CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B575247C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B57524F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B57535A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void startEventFromEvent(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  float *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  NSObject *v20;
  NSObject *v21;
  _OWORD *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int16 v34;
  int v35;
  uint64_t v36;
  void *v40;
  _OWORD v41[4];
  int v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  _BYTE v50[10];
  _DWORD v51[6];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = a2;
  v40 = v6;
  v8 = objc_msgSend(v6, "fixedParamCount");
  v42 = 0;
  memset(v41, 0, sizeof(v41));
  if ((_DWORD)v8)
  {
    v9 = 0;
    v36 = v8;
    v10 = v8;
    v11 = (_DWORD *)(objc_msgSend(v40, "fixedParams") + 8);
    v12 = (float *)v41 + 2;
    do
    {
      v13 = *((_QWORD *)v11 - 1);
      *((_DWORD *)v12 - 1) = v13;
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = *(float *)v11;
          objc_msgSend(v15, "floatValue");
          applyImmediateParameters(v16, v17, v13);
        }

      }
      clientParamValueToFixedParamValue();
      v19 = v18;
      *v12 = v18;
      if (kAVHCScope)
      {
        if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
        {
          v20 = *(id *)kAVHCScope;
          if (v20)
          {
            v21 = v20;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136316418;
              v44 = "AVHapticClient.mm";
              v45 = 1024;
              v46 = 533;
              v47 = 2080;
              v48 = "startEventFromEvent";
              v49 = 1024;
              *(_DWORD *)v50 = v9;
              *(_WORD *)&v50[4] = 1024;
              *(_DWORD *)&v50[6] = v13;
              LOWORD(v51[0]) = 2048;
              *(double *)((char *)v51 + 2) = v19;
              _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Copied fixed param[%d]: ID %d, normalized value %f, for start event", buf, 0x32u);
            }

          }
        }
      }
      ++v9;
      v11 += 4;
      v12 += 2;
    }
    while (v10 != v9);
    LODWORD(v41[0]) = v36;
    v22 = v41;
  }
  else
  {
    v22 = 0;
  }
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v23 = *(id *)kAVHCScope;
      if (v23)
      {
        v24 = v23;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v40, "time");
          v26 = v25;
          v27 = objc_msgSend(v40, "eventType");
          *(_DWORD *)buf = 136316162;
          v44 = "AVHapticClient.mm";
          v45 = 1024;
          v46 = 538;
          v47 = 2080;
          v48 = "startEventFromEvent";
          v49 = 2048;
          *(_QWORD *)v50 = v26;
          *(_WORD *)&v50[8] = 1024;
          v51[0] = v27;
          _os_log_impl(&dword_1B573F000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating start event at relative time %f for eventID: %u", buf, 0x2Cu);
        }

      }
    }
  }
  objc_msgSend(v40, "time", v36);
  v29 = v28;
  v30 = objc_msgSend(v40, "eventType");
  if (v22)
  {
    v31 = *v22;
    v32 = a5;
    *(_OWORD *)(a5 + 56) = v22[1];
    v33 = v22[3];
    *(_OWORD *)(a5 + 72) = v22[2];
    *(_OWORD *)(a5 + 88) = v33;
    v34 = 8 * *(_WORD *)v22 + 44;
    *(_DWORD *)(a5 + 104) = *((_DWORD *)v22 + 16);
    *(_OWORD *)(a5 + 40) = v31;
    v35 = v34 & 0xFFFC | 0x10000;
  }
  else
  {
    v32 = a5;
    *(_DWORD *)(a5 + 104) = 0;
    *(_OWORD *)(a5 + 88) = 0u;
    *(_OWORD *)(a5 + 72) = 0u;
    *(_OWORD *)(a5 + 56) = 0u;
    *(_OWORD *)(a5 + 40) = 0u;
    v35 = 65648;
  }
  *(_DWORD *)v32 = v35;
  *(_QWORD *)(v32 + 8) = v29;
  *(_QWORD *)(v32 + 16) = a3;
  *(_QWORD *)(v32 + 24) = v30;
  *(_QWORD *)(v32 + 32) = a4;

}

void sub_1B5753A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B5753DB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B57543F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B5754FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B57558DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, void *a12, void *a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B5755B74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B5755D98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B5755E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B5755FD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5756370(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5756EE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B5757C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  void *v33;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1B575866C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  void *v29;

  _Unwind_Resume(a1);
}

void sub_1B57588C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5758AD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5758CC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5758E64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B57590B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B57592B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B57599F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5759AD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5759E0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B575A0DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B575A1F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B575A5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_1B575AC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B575AF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B575B1E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id CALog::LogObjIfEnabled(CALog *this, uint64_t a2, const CALog::Scope *a3)
{
  void *v3;
  id v4;
  uint64_t v6;

  if ((int)this < 6)
  {
    if (!a2)
    {
      v3 = (void *)MEMORY[0x1E0C81028];
      v4 = MEMORY[0x1E0C81028];
      return v3;
    }
    return *(id *)a2;
  }
  if (a2)
  {
    v6 = 1;
    if ((_DWORD)this != 6)
      v6 = 2;
    if ((*(_QWORD *)(a2 + 8) & v6) != 0)
      return *(id *)a2;
  }
  return 0;
}

void sub_1B575B314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B575B600(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void NSExceptionToNSError(void *a1, _QWORD *a2)
{
  NSException *v3;
  NSException *v4;

  v3 = a1;
  if (a2)
  {
    v4 = v3;
    NSErrorFromNSException(v3);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    v3 = v4;
  }

}

void sub_1B575B688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

BOOL _Haptic_Check(uint64_t a1, uint64_t a2, const char *a3, const char *a4, int a5, _QWORD *a6)
{
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a5)
    return a5 == 0;
  if (!kHAPIScope)
  {
    v10 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
    goto LABEL_6;
  }
  v10 = *(id *)kHAPIScope;
  if (v10)
  {
LABEL_6:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v19 = "HapticUtils.h";
      v20 = 1024;
      v21 = 61;
      v22 = 2080;
      v23 = "_Haptic_Check";
      v24 = 2080;
      v25 = a3;
      v26 = 2080;
      v27 = a4;
      v28 = 1024;
      v29 = a5;
      _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: %s: %s error %d", buf, 0x36u);
    }

  }
  if (!a6)
  {
    snprintf((char *)buf, 0x400uLL, "%s: %s", a3, a4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", buf, 1);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    Haptic_RaiseException(CFSTR("com.apple.CoreHaptics"), v16, a5);
  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, CFSTR("Error "), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), a5, v15);
  *a6 = (id)objc_claimAutoreleasedReturnValue();

  return a5 == 0;
}

void sub_1B575BA0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B575BD84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B575C0D4()
{
  void *v0;

  objc_end_catch();

  JUMPOUT(0x1B575C0F4);
}

void sub_1B575C0E0()
{
  JUMPOUT(0x1B575C0E8);
}

void sub_1B575C3F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B575C7D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B575CC40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B575CD84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id NSErrorFromNSException(NSException *a1)
{
  NSException *v1;
  void *v2;
  char v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = a1;
  -[NSException name](v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0C99778]);

  if ((v3 & 1) != 0)
  {
    v4 = -4814;
    goto LABEL_7;
  }
  -[NSException userInfo](v1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("OSStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {

    v4 = -4898;
    goto LABEL_7;
  }
  v4 = objc_msgSend(v6, "integerValue");

  if (v4)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

void sub_1B575CE68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void Haptic_RaiseException(NSString *a1, NSString *a2, int a3)
{
  NSString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a1;
  v6 = a2;
  v7 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObject:forKey:", v8, CFSTR("OSStatus"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v5, v6, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
}

void sub_1B575CF28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B575D12C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B575D2F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B575D4B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B575D6C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CATimeUtilities::GetCurrentGregorianDate(CATimeUtilities *this)
{
  CFAbsoluteTime Current;
  CATimeUtilities *v2;

  Current = CFAbsoluteTimeGetCurrent();
  return CATimeUtilities::GregorianDateFromAbsoluteTime(v2, Current);
}

uint64_t CATimeUtilities::GregorianDateFromAbsoluteTime(CATimeUtilities *this, CFAbsoluteTime a2)
{
  unsigned __int8 v3;

  if ((v3 & 1) == 0
  {
    CATimeUtilities::GregorianDateFromAbsoluteTime(double)::tz = (uint64_t)CFTimeZoneCopySystem();
  }
  return *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(a2, (CFTimeZoneRef)CATimeUtilities::GregorianDateFromAbsoluteTime(double)::tz);
}

void sub_1B575D75C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B575D840(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

_QWORD *__copy_helper_atomic_property__46(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
}

_QWORD *__copy_helper_atomic_property__47(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
}

_QWORD *std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<unsigned long>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1B575DA70(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned long>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<unsigned long>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E695F680, MEMORY[0x1E0DE42D0]);
}

void sub_1B575DB50(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void sub_1B575DDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B575DF14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B575E428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B575E650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)AdvancedPatternPlayer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B575E9D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B575EC60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B575EE60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B575F060(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B575F394(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B575F76C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B575FC64()
{
  objc_end_catch();
  JUMPOUT(0x1B575FB78);
}

void sub_1B575FDF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B576003C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B5760268(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B57604D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B5760698(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B5760870(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5760A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  void *v15;
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5760BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B5760DD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B576115C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B57613CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void AudioResource::AudioResource(AudioResource *this, NSURL *a2)
{
  NSURL *v3;

  v3 = a2;
  *((_QWORD *)this + 8) = 0;
  *((_BYTE *)this + 72) = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = v3;
}

void AudioResource::~AudioResource(AudioResource *this)
{
  OpaqueExtAudioFile *v2;

  if (*((_BYTE *)this + 72))
  {
    AudioResource::decrementAllocatedBytes((AudioResource *)(4
                                                           * *((_QWORD *)this + 2)
                                                           * *((unsigned int *)this + 13)));
    *((_BYTE *)this + 72) = 0;
  }
  v2 = (OpaqueExtAudioFile *)*((_QWORD *)this + 1);
  if (v2)
  {
    ExtAudioFileDispose(v2);
    *((_QWORD *)this + 1) = 0;
  }

}

void AudioResource::decrementAllocatedBytes(AudioResource *this)
{
  NSObject *v2;
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  AudioResource *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!this)
    return;
  AudioResource::getTotalAllocationLock(this);
  std::mutex::lock(&AudioResource::getTotalAllocationLock(void)::sMutex);
  if (!kHAPIScope)
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
    goto LABEL_6;
  }
  v2 = *(id *)kHAPIScope;
  if (v2)
  {
LABEL_6:
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4 = 136316162;
      v5 = "AudioResource.mm";
      v6 = 1024;
      v7 = 153;
      v8 = 2080;
      v9 = "decrementAllocatedBytes";
      v10 = 2048;
      v11 = this;
      v12 = 2048;
      v13 = AudioResource::_sTotalAllocatedBytes;
      _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Removing %llu bytes from our existing %llu", (uint8_t *)&v4, 0x30u);
    }

  }
  if (AudioResource::_sTotalAllocatedBytes < (unint64_t)this)
    AudioResource::decrementAllocatedBytes();
  AudioResource::_sTotalAllocatedBytes -= (uint64_t)this;
  std::mutex::unlock(&AudioResource::getTotalAllocationLock(void)::sMutex);
}

OpaqueExtAudioFile *AudioResource::close(AudioResource *this)
{
  OpaqueExtAudioFile *result;

  result = (OpaqueExtAudioFile *)*((_QWORD *)this + 1);
  if (result)
  {
    result = (OpaqueExtAudioFile *)ExtAudioFileDispose(result);
    *((_QWORD *)this + 1) = 0;
  }
  return result;
}

uint64_t AudioResource::open(AudioResource *this)
{
  OSStatus v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  OSStatus v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)this + 1))
    return 0;
  v3 = ExtAudioFileOpenURL(*(CFURLRef *)this, (ExtAudioFileRef *)this + 1);
  if (!v3)
    return 0;
  if (!kHAPIScope)
  {
    v4 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
    goto LABEL_8;
  }
  v4 = *(id *)kHAPIScope;
  if (v4)
  {
LABEL_8:
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)this;
      v7 = 136316162;
      v8 = "AudioResource.mm";
      v9 = 1024;
      v10 = 50;
      v11 = 2080;
      v12 = "open";
      v13 = 2112;
      v14 = v6;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1B573F000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Failed to open audio resource %@: %u", (uint8_t *)&v7, 0x2Cu);
    }

  }
  return 4294962472;
}

uint64_t AudioResource::verifyAudioFile(ExtAudioFileRef *this, int a2)
{
  uint64_t v4;
  uint64_t Property;
  NSObject *v6;
  id v7;
  ExtAudioFileRef v8;
  id v9;
  ExtAudioFileRef v10;
  OpaqueExtAudioFile *v11;
  UInt32 ioPropertyDataSize;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  ExtAudioFileRef v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = AudioResource::open((AudioResource *)this);
  if ((_DWORD)v4)
    return v4;
  ioPropertyDataSize = 40;
  Property = ExtAudioFileGetProperty(this[1], 0x66666D74u, &ioPropertyDataSize, this + 3);
  this[8] = this[3];
  if ((_DWORD)Property)
  {
    v4 = Property;
    if (kHAPIScope)
    {
      v6 = *(id *)kHAPIScope;
      if (!v6)
        goto LABEL_18;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v7 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v8 = *this;
    *(_DWORD *)buf = 136315906;
    v15 = "AudioResource.mm";
    v16 = 1024;
    v17 = 75;
    v18 = 2080;
    v19 = "verifyAudioFile";
    v20 = 2112;
    v21 = v8;
    goto LABEL_16;
  }
  ioPropertyDataSize = 8;
  v4 = ExtAudioFileGetProperty(this[1], 0x2366726Du, &ioPropertyDataSize, this + 2);
  if ((_DWORD)v4)
  {
    if (kHAPIScope)
    {
      v6 = *(id *)kHAPIScope;
      if (!v6)
        goto LABEL_18;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v10 = *this;
    *(_DWORD *)buf = 136315906;
    v15 = "AudioResource.mm";
    v16 = 1024;
    v17 = 81;
    v18 = 2080;
    v19 = "verifyAudioFile";
    v20 = 2112;
    v21 = v10;
LABEL_16:
    _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Failed to get property for audio resource %@", buf, 0x26u);
LABEL_17:

  }
LABEL_18:
  if (a2)
  {
    v11 = this[1];
    if (v11)
    {
      ExtAudioFileDispose(v11);
      this[1] = 0;
    }
  }
  return v4;
}

uint64_t AudioResource::readAndAllocateRawBuffer(AudioResource *this, char **a2)
{
  UInt32 v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  OpaqueExtAudioFile *v12;
  id v14;
  uint64_t v15;
  AudioBufferList ioData;
  UInt32 ioNumberFrames;
  _QWORD inPropertyData[2];
  int v19;
  int v20;
  int v21;
  UInt32 v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  *a2 = 0;
  v23 = 0;
  v4 = *((_DWORD *)this + 13);
  inPropertyData[0] = *((_QWORD *)this + 3);
  inPropertyData[1] = 0x96C70636DLL;
  v19 = 4 * v4;
  v20 = 1;
  v21 = 4 * v4;
  v22 = v4;
  LODWORD(v23) = 32;
  v5 = ExtAudioFileSetProperty(*((ExtAudioFileRef *)this + 1), 0x63666D74u, 0x28u, inPropertyData);
  if (!(_DWORD)v5)
  {
    v6 = AudioResource::incrementAllocatedBytes((AudioResource *)(4 * *((_QWORD *)this + 2) * v22));
    if ((_DWORD)v6)
      return v6;
    v8 = (void *)operator new[]();
    *((_BYTE *)this + 72) = 1;
    ioNumberFrames = *((_DWORD *)this + 4);
    ioData.mNumberBuffers = 1;
    ioData.mBuffers[0].mNumberChannels = v22;
    ioData.mBuffers[0].mDataByteSize = v21 * ioNumberFrames;
    ioData.mBuffers[0].mData = v8;
    v6 = ExtAudioFileRead(*((ExtAudioFileRef *)this + 1), &ioNumberFrames, &ioData);
    if (!(_DWORD)v6)
    {
      *a2 = (char *)v8;
      goto LABEL_14;
    }
    if (kHAPIScope)
    {
      v9 = *(id *)kHAPIScope;
      if (!v9)
      {
LABEL_22:
        MEMORY[0x1B5E4EEAC](v8, 0x1000C8077774924);
        v6 = 4294962472;
        goto LABEL_14;
      }
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)this;
      *(_DWORD *)buf = 136316162;
      v25 = "AudioResource.mm";
      v26 = 1024;
      v27 = 118;
      v28 = 2080;
      v29 = "readAndAllocateRawBuffer";
      v30 = 2112;
      v31 = v15;
      v32 = 1024;
      v33 = v6;
      _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Failed to read from audio resource %@: %u", buf, 0x2Cu);
    }

    goto LABEL_22;
  }
  v6 = v5;
  if (!kHAPIScope)
  {
    v7 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_11;
  }
  v7 = *(id *)kHAPIScope;
  if (v7)
  {
LABEL_11:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)this;
      *(_DWORD *)buf = 136315906;
      v25 = "AudioResource.mm";
      v26 = 1024;
      v27 = 99;
      v28 = 2080;
      v29 = "readAndAllocateRawBuffer";
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_1B573F000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Failed to set property on audio resource %@", buf, 0x26u);
    }

  }
LABEL_14:
  v12 = (OpaqueExtAudioFile *)*((_QWORD *)this + 1);
  if (v12)
  {
    ExtAudioFileDispose(v12);
    *((_QWORD *)this + 1) = 0;
  }
  return v6;
}

uint64_t AudioResource::incrementAllocatedBytes(AudioResource *this)
{
  NSObject *v2;
  id v3;
  int AppBooleanValue;
  char *v5;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  AudioResource *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  AudioResource::getTotalAllocationLock(this);
  std::mutex::lock(&AudioResource::getTotalAllocationLock(void)::sMutex);
  if (kHAPIScope)
  {
    v2 = *(id *)kHAPIScope;
    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v11 = 136316162;
    v12 = "AudioResource.mm";
    v13 = 1024;
    v14 = 139;
    v15 = 2080;
    v16 = "incrementAllocatedBytes";
    v17 = 2048;
    v18 = this;
    v19 = 2048;
    v20 = AudioResource::_sTotalAllocatedBytes;
    _os_log_impl(&dword_1B573F000, v2, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Adding %llu bytes to our existing %llu", (uint8_t *)&v11, 0x30u);
  }

LABEL_8:
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ignore_custom_audio_limit"), CFSTR("com.apple.corehaptics"), 0);
  v5 = (char *)this + AudioResource::_sTotalAllocatedBytes;
  if ((unint64_t)this + AudioResource::_sTotalAllocatedBytes > 0x800000 && AppBooleanValue == 0)
  {
    if (kHAPIScope)
    {
      v8 = *(id *)kHAPIScope;
      if (!v8)
      {
LABEL_20:
        v7 = 4294962471;
        goto LABEL_21;
      }
    }
    else
    {
      v8 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315650;
      v12 = "AudioResource.mm";
      v13 = 1024;
      v14 = 142;
      v15 = 2080;
      v16 = "incrementAllocatedBytes";
      _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Memory limit reached on custom audio resources - unregister others to make space", (uint8_t *)&v11, 0x1Cu);
    }

    goto LABEL_20;
  }
  v7 = 0;
  AudioResource::_sTotalAllocatedBytes = (uint64_t)v5;
LABEL_21:
  std::mutex::unlock(&AudioResource::getTotalAllocationLock(void)::sMutex);
  return v7;
}

void sub_1B5762110(_Unwind_Exception *a1)
{
  std::mutex::unlock(&AudioResource::getTotalAllocationLock(void)::sMutex);
  _Unwind_Resume(a1);
}

void *AudioResource::getTotalAllocationLock(AudioResource *this)
{
  unsigned __int8 v1;

  {
    __cxa_atexit((void (*)(void *))MEMORY[0x1E0DE4AB8], &AudioResource::getTotalAllocationLock(void)::sMutex, &dword_1B573F000);
  }
  return &AudioResource::getTotalAllocationLock(void)::sMutex;
}

uint64_t CALog::PrefValueToPriority(const __CFString *this, BOOL *a2, BOOL *a3)
{
  CFTypeID v5;
  int v6;
  int v7;
  int valuePtr;
  int v10;
  char buffer[64];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  valuePtr = -1;
  v5 = CFGetTypeID(this);
  if (v5 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)this, kCFNumberIntType, &valuePtr);
    v6 = valuePtr + 3;
  }
  else
  {
    if (v5 != CFStringGetTypeID())
      goto LABEL_22;
    if (CFEqual(this, CFSTR("error")))
    {
      v6 = 1;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("warning")))
    {
      v6 = 2;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("note")) || CFEqual(this, CFSTR("notice")))
    {
      v6 = 3;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("info")))
    {
      v6 = 4;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("details")))
    {
      v6 = 5;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("minutiae")))
    {
      v6 = 6;
      goto LABEL_23;
    }
    if (CFEqual(this, CFSTR("spew")))
    {
      v6 = 7;
      goto LABEL_23;
    }
    if (!CFStringGetCString(this, buffer, 64, 0x8000100u))
    {
LABEL_22:
      v6 = -1;
      goto LABEL_23;
    }
    v10 = 0;
    v7 = sscanf(buffer, "%d", &v10);
    v6 = v10 + 3;
    if (v7 != 1)
      v6 = -1;
  }
LABEL_23:
  *a2 = v6 > 0;
  return v6 & ~(v6 >> 31);
}

uint64_t std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

_QWORD *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_1E695FC98;
  v2 = a1 + 2;
  v3 = (_QWORD *)a1[5];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::~__func(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_1E695FC98;
  v1 = a1 + 2;
  v2 = (_QWORD *)a1[5];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x1B5E4EEC4);
}

uint64_t std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::__clone(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  *a2 = &off_1E695FC98;
  a2[1] = v2;
  return std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), a1 + 16);
}

_QWORD *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::destroy(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 16);
  result = *(_QWORD **)(a1 + 40);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

BOOL std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::operator()(uint64_t a1, uint64_t *a2)
{
  return std::__invoke_void_return_wrapper<BOOL,false>::__call[abi:ne180100]<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1} &,void const*>(a1 + 8, a2);
}

uint64_t std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::target_type()
{
}

BOOL std::__invoke_void_return_wrapper<BOOL,false>::__call[abi:ne180100]<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1} &,void const*>(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  char v7;
  int v8;

  v3 = *a2;
  v7 = 0;
  v4 = (*(uint64_t (**)(uint64_t, char *))a1)(v3, &v7);
  if (!v7)
    return 0;
  v8 = v4;
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, int *))(*(_QWORD *)v5 + 48))(v5, &v8);
  return v7 != 0;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1B5E4EEC4);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

void std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::~__func()
{
  JUMPOUT(0x1B5E4EEC4);
}

_QWORD *std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E695FCF0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::operator()(uint64_t result, int *a2)
{
  uint64_t v2;

  v2 = 3;
  if (*a2 <= 6)
    v2 = 1;
  *(_QWORD *)(*(_QWORD *)(result + 8) + 8) = v2;
  return result;
}

uint64_t std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0,std::allocator<CALog::Scope::SetPriorityThresholdFromPreference(__CFString const*,__CFString const*)::$_0>,void ()(int)>::target_type()
{
}

void `virtual thunk to'CAException::~CAException(CAException *this)
{
  std::exception::~exception((std::exception *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24)));
}

{
  std::exception::~exception((std::exception *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24)));
  JUMPOUT(0x1B5E4EEC4);
}

void CAException::~CAException(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1B5E4EEC4);
}

void CAXException::~CAXException(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1B5E4EEC4);
}

const char *CAException::what(CAException *this)
{
  return "CAException";
}

uint64_t CAXException::what(CAXException *this)
{
  return (uint64_t)this + 8;
}

void sub_1B5762F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34)
{
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  _Unwind_Resume(a1);
}

void sub_1B5763404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B5763A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_1B5763F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B5764438(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B57646C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B5764848(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B57649C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1B5764BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B5764D7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B576589C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  void *v25;
  void *v26;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1B5765A20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5765BA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5765CA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5765D0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B57667AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  void *v27;

  _Unwind_Resume(a1);
}

void sub_1B57670B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  void *v27;

  _Unwind_Resume(a1);
}

void sub_1B5767234(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B57672D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5768234(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B576852C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5768954(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void sub_1B576918C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5769420(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5769758(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5769858(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  NSException *v20;
  void *v21;
  void *v22;

  if (a2 == 1)
  {
    v20 = (NSException *)objc_begin_catch(a1);
    NSErrorFromNSException(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v17)
      *v17 = objc_retainAutorelease(v21);

    objc_end_catch();
    JUMPOUT(0x1B576982CLL);
  }

  _Unwind_Resume(a1);
}

void sub_1B5769DD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5769FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  void *v29;

  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

void sub_1B576A2C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B576A7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B576AA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B576B184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  void *v38;
  void *v39;
  uint64_t v40;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v40 - 192), 8);

  _Unwind_Resume(a1);
}

void sub_1B576B390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B576B6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B576B9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  void *v30;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);

  _Unwind_Resume(a1);
}

void sub_1B576BAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B576BD78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, id);
  _Block_object_dispose(va, 8);

  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1B576BEBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B576C204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B576C324(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B576C4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CHMetrics;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B576C6C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B576CCD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B576CE04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B576CFC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B576D138(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B576D384(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B576D4F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B576D698(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B576D948(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B576DF10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v2 = a2;
  v5 = a2 + 2;
  v4 = a2[2];
  *(v5 - 1) = v4;
  v6 = std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v4, v5);
  if (v6)
    return v6;
  std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return v2;
}

void std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__deallocate_node(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (id *)*v2;

      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *i;
  unint64_t v8;
  float v9;
  float v10;
  uint64_t v11;
  _BOOL8 v12;
  size_t v13;
  unint64_t v14;
  size_t v15;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
      v5 = v3 <= a2 ? a2 % v3 : a2;
    else
      v5 = (v3 - 1) & a2;
    v6 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v5);
    if (v6)
    {
      for (i = (_QWORD *)*v6; i; i = (_QWORD *)*i)
      {
        v8 = i[1];
        if (v8 == a2)
        {
          if (i[2] == *a3)
            return i;
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3)
              v8 %= v3;
          }
          else
          {
            v8 &= v3 - 1;
          }
          if (v8 != v5)
            break;
        }
      }
    }
  }
  v9 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v10 = *(float *)(a1 + 32);
  if (!v3 || (float)(v10 * (float)v3) < v9)
  {
    v11 = 2 * v3;
    v12 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    v13 = v12 | v11;
    v14 = vcvtps_u32_f32(v9 / v10);
    if (v13 <= v14)
      v15 = v14;
    else
      v15 = v13;
    std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__rehash<true>(a1, v15);
  }
  return 0;
}

_QWORD *std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__node_insert_unique_perform[abi:ne180100](_QWORD *result, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  _QWORD *v5;
  unint64_t v6;

  v2 = (int8x8_t)result[1];
  v3 = a2[1];
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(_QWORD *)&v2)
      v3 %= *(_QWORD *)&v2;
  }
  else
  {
    v3 &= *(_QWORD *)&v2 - 1;
  }
  v5 = *(_QWORD **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(_QWORD *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v2)
        v6 %= *(_QWORD *)&v2;
    }
    else
    {
      v6 &= *(_QWORD *)&v2 - 1;
    }
    v5 = (_QWORD *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {

  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

_QWORD *std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::find<AVHapticPlayerEventType>(_QWORD *a1, unint64_t *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3)
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E695F688, MEMORY[0x1E0DE42E0]);
}

void sub_1B576E474(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::__unordered_map_hasher<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::hash<AVHapticPlayerEventType>,std::equal_to<AVHapticPlayerEventType>,true>,std::__unordered_map_equal<AVHapticPlayerEventType,std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>,std::equal_to<AVHapticPlayerEventType>,std::hash<AVHapticPlayerEventType>,true>,std::allocator<std::__hash_value_type<AVHapticPlayerEventType,NSString * {__strong}>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

BOOL PlatformUtilities_iOS::ProductIsAPhone(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 1;
}

BOOL PlatformUtilities_iOS::ProductIsAppleTV(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 4;
}

BOOL PlatformUtilities_iOS::ProductIsAppleWatch(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 6;
}

BOOL PlatformUtilities_iOS::ProductIsiPod(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 2;
}

BOOL PlatformUtilities_iOS::ProductIsiPad(PlatformUtilities_iOS *this)
{
  return MGGetSInt32Answer() == 3;
}

uint64_t PlatformUtilities_iOS::ProductIsMuseDevice(PlatformUtilities_iOS *this)
{
  unsigned __int8 v1;
  uint64_t v3;
  PlatformUtilities_iOS *ProductType;
  BOOL v5;

  if ((v1 & 1) == 0
  {
    v3 = MGGetBoolAnswer();
    v5 = (v3 & 1) != 0
      || (ProductType = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType((PlatformUtilities_iOS *)v3),
          (_DWORD)ProductType == 131)
      || PlatformUtilities_iOS::GetProductType(ProductType) == 143;
    PlatformUtilities_iOS::ProductIsMuseDevice(void)::isMuseDevice = v5;
  }
  return PlatformUtilities_iOS::ProductIsMuseDevice(void)::isMuseDevice;
}

void sub_1B576E630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PlatformUtilities_iOS::GetProductType(PlatformUtilities_iOS *this)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((PlatformUtilities_iOS::GetProductType(void)::sCompletedCheck & 1) == 0)
  {
    PlatformUtilities_iOS::GetProductType(void)::sCompletedCheck = 1;
    v1 = MGGetProductType();
    if (v1 <= 2089455187)
    {
      if (v1 > 1293446024)
      {
        if (v1 > 1602181455)
        {
          if (v1 <= 1868379042)
          {
            if (v1 <= 1721691076)
            {
              if (v1 <= 1625227433)
              {
                if (v1 == 1602181456)
                {
                  v2 = 126;
                  goto LABEL_354;
                }
                if (v1 == 1608945770)
                {
                  v2 = 145;
                  goto LABEL_354;
                }
                goto LABEL_353;
              }
              if (v1 != 1625227434)
              {
                if (v1 == 1644180312)
                {
                  v2 = 117;
                  goto LABEL_354;
                }
                if (v1 == 1701146937)
                {
                  v2 = 34;
LABEL_354:
                  PlatformUtilities_iOS::GetProductType(void)::sType = v2;
                  return PlatformUtilities_iOS::GetProductType(void)::sType;
                }
                goto LABEL_353;
              }
LABEL_226:
              v2 = 78;
              goto LABEL_354;
            }
            if (v1 <= 1737882205)
            {
              if (v1 == 1721691077)
              {
                v2 = 15;
                goto LABEL_354;
              }
              if (v1 == 1733600853)
              {
                v2 = 100;
                goto LABEL_354;
              }
              goto LABEL_353;
            }
            if (v1 == 1737882206)
            {
              v2 = 88;
              goto LABEL_354;
            }
            if (v1 == 1756509290)
            {
              v2 = 116;
              goto LABEL_354;
            }
            v6 = 1834147427;
            goto LABEL_283;
          }
          if (v1 <= 2032616840)
          {
            if (v1 > 1990293941)
            {
              if (v1 == 1990293942)
              {
                v2 = 112;
                goto LABEL_354;
              }
              if (v1 != 2001966017)
              {
                v5 = 2023824667;
                goto LABEL_148;
              }
LABEL_239:
              v2 = 70;
              goto LABEL_354;
            }
            if (v1 != 1868379043)
            {
              if (v1 == 1895344378)
              {
                v2 = 68;
                goto LABEL_354;
              }
              goto LABEL_353;
            }
LABEL_210:
            v2 = 76;
            goto LABEL_354;
          }
          if (v1 > 2078329140)
          {
            if (v1 == 2078329141)
            {
              v2 = 24;
              goto LABEL_354;
            }
            if (v1 == 2080700391)
            {
              v2 = 31;
              goto LABEL_354;
            }
            v7 = 2081274472;
LABEL_220:
            if (v1 == v7)
            {
              v2 = 94;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          if (v1 != 2032616841)
          {
            if (v1 == 2048538371)
            {
              v2 = 45;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
LABEL_296:
          v2 = 20;
          goto LABEL_354;
        }
        if (v1 > 1402208363)
        {
          if (v1 > 1429914405)
          {
            if (v1 <= 1549248875)
            {
              if (v1 == 1429914406)
              {
                v2 = 18;
                goto LABEL_354;
              }
              if (v1 == 1517755655)
              {
                v2 = 129;
                goto LABEL_354;
              }
            }
            else
            {
              switch(v1)
              {
                case 1549248876:
                  v2 = 130;
                  goto LABEL_354;
                case 1559256613:
                  v2 = 40;
                  goto LABEL_354;
                case 1573906122:
                  v2 = 110;
                  goto LABEL_354;
              }
            }
          }
          else if (v1 <= 1412429327)
          {
            if (v1 == 1402208364)
            {
              v2 = 102;
              goto LABEL_354;
            }
            if (v1 == 1408738134)
            {
              v2 = 122;
              goto LABEL_354;
            }
          }
          else
          {
            switch(v1)
            {
              case 1412429328:
                v2 = 50;
                goto LABEL_354;
              case 1415625992:
                v2 = 108;
                goto LABEL_354;
              case 1419435331:
                v2 = 114;
                goto LABEL_354;
            }
          }
          goto LABEL_353;
        }
        if (v1 > 1325975681)
        {
          if (v1 > 1371389548)
          {
            if (v1 == 1371389549)
            {
              v2 = 22;
              goto LABEL_354;
            }
            if (v1 != 1373516433)
            {
              if (v1 == 1380747801)
              {
                v2 = 99;
                goto LABEL_354;
              }
              goto LABEL_353;
            }
            goto LABEL_210;
          }
          if (v1 == 1325975682)
          {
            v2 = 52;
            goto LABEL_354;
          }
          v3 = 1353145733;
LABEL_238:
          if (v1 != v3)
            goto LABEL_353;
          goto LABEL_239;
        }
        if (v1 <= 1302273957)
        {
          if (v1 != 1293446025)
          {
            if (v1 == 1294429942)
            {
              v2 = 119;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
LABEL_276:
          v2 = 74;
          goto LABEL_354;
        }
        if (v1 != 1302273958)
        {
          if (v1 == 1309571158)
          {
            v2 = 113;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
LABEL_297:
        v2 = 80;
        goto LABEL_354;
      }
      if (v1 <= 551446204)
      {
        if (v1 > 253148924)
        {
          if (v1 > 344862119)
          {
            if (v1 <= 358923951)
            {
              if (v1 == 344862120)
              {
                v2 = 87;
                goto LABEL_354;
              }
              if (v1 == 355234908)
              {
                v2 = 101;
                goto LABEL_354;
              }
            }
            else
            {
              switch(v1)
              {
                case 358923952:
                  v2 = 98;
                  goto LABEL_354;
                case 445396642:
                  v2 = 89;
                  goto LABEL_354;
                case 502329937:
                  v2 = 17;
                  goto LABEL_354;
              }
            }
            goto LABEL_353;
          }
          if (v1 > 337183580)
          {
            if (v1 == 337183581)
            {
              v2 = 10;
              goto LABEL_354;
            }
            if (v1 == 340218669)
            {
              v2 = 83;
              goto LABEL_354;
            }
            v3 = 341800273;
            goto LABEL_238;
          }
          if (v1 != 253148925)
          {
            if (v1 == 262180327)
            {
              v2 = 95;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
LABEL_290:
          v2 = 92;
          goto LABEL_354;
        }
        if (v1 <= 79936590)
        {
          if (v1 > 40511011)
          {
            if (v1 == 40511012)
            {
              v2 = 106;
              goto LABEL_354;
            }
            if (v1 == 42878382)
            {
              v2 = 11;
              goto LABEL_354;
            }
          }
          else
          {
            if (v1 == 23433786)
            {
              v2 = 46;
              goto LABEL_354;
            }
            if (v1 == 33245053)
            {
              v2 = 53;
              goto LABEL_354;
            }
          }
          goto LABEL_353;
        }
        if (v1 > 157833460)
        {
          if (v1 != 157833461)
          {
            if (v1 == 173258742)
            {
              v2 = 44;
              goto LABEL_354;
            }
            if (v1 != 228444038)
              goto LABEL_353;
            goto LABEL_289;
          }
LABEL_257:
          v2 = 63;
          goto LABEL_354;
        }
        if (v1 != 79936591)
        {
          v8 = 88647037;
          goto LABEL_216;
        }
LABEL_293:
        v2 = 61;
        goto LABEL_354;
      }
      if (v1 > 952317140)
      {
        if (v1 <= 1119807501)
        {
          if (v1 > 1085318933)
          {
            switch(v1)
            {
              case 1085318934:
                v2 = 103;
                goto LABEL_354;
              case 1110205732:
                v2 = 33;
                goto LABEL_354;
              case 1114644381:
                v2 = 64;
                goto LABEL_354;
            }
            goto LABEL_353;
          }
          if (v1 != 952317141)
          {
            if (v1 == 1060988941)
            {
              v2 = 8;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          goto LABEL_292;
        }
        if (v1 > 1234705394)
        {
          if (v1 == 1234705395)
          {
            v2 = 97;
            goto LABEL_354;
          }
          if (v1 != 1280441783)
          {
            if (v1 == 1280909812)
            {
              v2 = 124;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          goto LABEL_257;
        }
        if (v1 != 1119807502)
        {
          if (v1 == 1169082144)
          {
            v2 = 26;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
LABEL_256:
        v2 = 36;
        goto LABEL_354;
      }
      if (v1 <= 761631963)
      {
        if (v1 > 689804741)
        {
          if (v1 == 689804742)
          {
            v2 = 29;
            goto LABEL_354;
          }
          v6 = 746003606;
LABEL_283:
          if (v1 != v6)
            goto LABEL_353;
          goto LABEL_288;
        }
        if (v1 != 551446205)
        {
          if (v1 == 676119128)
          {
            v2 = 118;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        goto LABEL_256;
      }
      if (v1 > 820711326)
      {
        if (v1 != 820711327)
        {
          if (v1 == 896202454)
          {
            v2 = 56;
            goto LABEL_354;
          }
          if (v1 != 910181310)
            goto LABEL_353;
          goto LABEL_296;
        }
LABEL_272:
        v2 = 54;
        goto LABEL_354;
      }
      if (v1 != 761631964)
      {
        if (v1 == 776033019)
        {
          v2 = 42;
          goto LABEL_354;
        }
        goto LABEL_353;
      }
LABEL_294:
      v2 = 81;
      goto LABEL_354;
    }
    if (v1 > 3133873108)
    {
      if (v1 > 3645319984)
      {
        if (v1 > 3885279869)
        {
          if (v1 > 4067129263)
          {
            if (v1 <= 4201643248)
            {
              if (v1 == 4067129264)
              {
                v2 = 111;
                goto LABEL_354;
              }
              if (v1 == 4172444931)
              {
                v2 = 104;
                goto LABEL_354;
              }
            }
            else
            {
              switch(v1)
              {
                case 4201643249:
                  v2 = 28;
                  goto LABEL_354;
                case 4232256925:
                  v2 = 86;
                  goto LABEL_354;
                case 4240173202:
                  v2 = 2;
                  goto LABEL_354;
              }
            }
          }
          else if (v1 <= 3953847431)
          {
            if (v1 == 3885279870)
            {
              v2 = 25;
              goto LABEL_354;
            }
            if (v1 == 3933982784)
            {
              v2 = 38;
              goto LABEL_354;
            }
          }
          else
          {
            switch(v1)
            {
              case 3953847432:
                v2 = 128;
                goto LABEL_354;
              case 4025247511:
                v2 = 105;
                goto LABEL_354;
              case 4055323051:
                v2 = 43;
                goto LABEL_354;
            }
          }
          goto LABEL_353;
        }
        if (v1 <= 3767261005)
        {
          if (v1 <= 3707345670)
          {
            if (v1 != 3645319985)
            {
              if (v1 == 3683904382)
              {
                v2 = 109;
                goto LABEL_354;
              }
              goto LABEL_353;
            }
LABEL_289:
            v2 = 57;
            goto LABEL_354;
          }
          if (v1 != 3707345671)
          {
            if (v1 == 3711192744)
            {
              v2 = 66;
              goto LABEL_354;
            }
            if (v1 == 3743999268)
            {
              v2 = 19;
              goto LABEL_354;
            }
LABEL_353:
            v2 = 0;
            goto LABEL_354;
          }
          goto LABEL_256;
        }
        if (v1 <= 3856877969)
        {
          if (v1 == 3767261006)
          {
            v2 = 125;
            goto LABEL_354;
          }
          v3 = 3801472101;
          goto LABEL_238;
        }
        if (v1 == 3856877970)
        {
          v2 = 82;
          goto LABEL_354;
        }
        if (v1 != 3863625342)
        {
          if (v1 == 3865922942)
          {
            v2 = 41;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
LABEL_252:
        v2 = 75;
        goto LABEL_354;
      }
      if (v1 <= 3361025852)
      {
        if (v1 > 3215673113)
        {
          if (v1 > 3242623366)
          {
            switch(v1)
            {
              case 3242623367:
                v2 = 14;
                goto LABEL_354;
              case 3300281076:
                v2 = 39;
                goto LABEL_354;
              case 3348380076:
                v2 = 4;
                goto LABEL_354;
            }
            goto LABEL_353;
          }
          if (v1 == 3215673114)
          {
            v2 = 60;
            goto LABEL_354;
          }
          if (v1 != 3228373941)
            goto LABEL_353;
          goto LABEL_226;
        }
        if (v1 <= 3196158496)
        {
          if (v1 == 3133873109)
          {
            v2 = 47;
            goto LABEL_354;
          }
          v8 = 3184375231;
LABEL_216:
          if (v1 == v8)
          {
            v2 = 62;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        if (v1 != 3196158497)
        {
          if (v1 == 3196805751)
          {
            v2 = 6;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
      }
      else
      {
        if (v1 <= 3571532205)
        {
          if (v1 > 3402870383)
          {
            switch(v1)
            {
              case 3402870384:
                v2 = 55;
                goto LABEL_354;
              case 3455223061:
                v2 = 65;
                goto LABEL_354;
              case 3540156652:
                v2 = 73;
                goto LABEL_354;
            }
            goto LABEL_353;
          }
          if (v1 != 3361025853)
          {
            if (v1 == 3397214291)
            {
              v2 = 59;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          goto LABEL_291;
        }
        if (v1 <= 3599094682)
        {
          if (v1 == 3571532206)
          {
            v2 = 123;
            goto LABEL_354;
          }
          if (v1 == 3585085679)
          {
            v2 = 9;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        if (v1 == 3599094683)
          goto LABEL_252;
        if (v1 != 3636345305)
        {
          if (v1 == 3637438250)
          {
            v2 = 37;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
      }
      goto LABEL_280;
    }
    if (v1 <= 2516717267)
    {
      if (v1 <= 2288107368)
      {
        if (v1 <= 2159747552)
        {
          if (v1 > 2132302343)
          {
            if (v1 == 2132302344)
            {
              v2 = 120;
              goto LABEL_354;
            }
            if (v1 != 2158787296)
              goto LABEL_353;
            goto LABEL_272;
          }
          if (v1 != 2089455188)
          {
            if (v1 != 2103978418)
              goto LABEL_353;
            goto LABEL_276;
          }
LABEL_291:
          v2 = 79;
          goto LABEL_354;
        }
        if (v1 <= 2236272847)
        {
          if (v1 == 2159747553)
          {
            v2 = 21;
            goto LABEL_354;
          }
          v7 = 2162679683;
          goto LABEL_220;
        }
        if (v1 != 2236272848)
        {
          if (v1 != 2262113699)
          {
            if (v1 == 2270970153)
            {
              v2 = 16;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          goto LABEL_293;
        }
LABEL_280:
        v2 = 69;
        goto LABEL_354;
      }
      if (v1 > 2418348557)
      {
        if (v1 <= 2454275342)
        {
          if (v1 == 2418348558)
          {
            v2 = 107;
            goto LABEL_354;
          }
          if (v1 == 2445473385)
          {
            v2 = 96;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        if (v1 == 2454275343)
        {
          v2 = 48;
          goto LABEL_354;
        }
        if (v1 != 2458172802)
        {
          if (v1 != 2468178735)
            goto LABEL_353;
          goto LABEL_290;
        }
        goto LABEL_280;
      }
      if (v1 <= 2311900305)
      {
        if (v1 != 2288107369)
        {
          if (v1 == 2309863438)
          {
            v2 = 30;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        goto LABEL_297;
      }
      if (v1 == 2311900306)
      {
        v2 = 13;
        goto LABEL_354;
      }
      if (v1 == 2336512887)
      {
LABEL_292:
        v2 = 93;
        goto LABEL_354;
      }
      v4 = 2385671069;
LABEL_181:
      if (v1 == v4)
      {
        v2 = 35;
        goto LABEL_354;
      }
      goto LABEL_353;
    }
    if (v1 > 2781508712)
    {
      if (v1 <= 2943112656)
      {
        if (v1 <= 2823174121)
        {
          if (v1 == 2781508713)
          {
            v2 = 5;
            goto LABEL_354;
          }
          if (v1 == 2797549163)
          {
            v2 = 85;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        if (v1 != 2823174122)
        {
          if (v1 != 2880863278)
          {
            if (v1 == 2903084588)
            {
              v2 = 67;
              goto LABEL_354;
            }
            goto LABEL_353;
          }
          goto LABEL_256;
        }
        goto LABEL_294;
      }
      if (v1 <= 3001488777)
      {
        if (v1 == 2943112657)
        {
          v2 = 121;
          goto LABEL_354;
        }
        if (v1 == 2979575960)
        {
          v2 = 127;
          goto LABEL_354;
        }
        goto LABEL_353;
      }
      if (v1 == 3001488778)
      {
        v2 = 27;
        goto LABEL_354;
      }
      if (v1 != 3054476161)
      {
        v5 = 3101941570;
LABEL_148:
        if (v1 != v5)
          goto LABEL_353;
        goto LABEL_210;
      }
LABEL_288:
      v2 = 77;
      goto LABEL_354;
    }
    if (v1 <= 2673319455)
    {
      if (v1 > 2628394913)
      {
        if (v1 != 2628394914)
        {
          if (v1 == 2644487444)
          {
            v2 = 72;
            goto LABEL_354;
          }
          goto LABEL_353;
        }
        goto LABEL_288;
      }
      if (v1 != 2516717268)
      {
        v4 = 2614323575;
        goto LABEL_181;
      }
    }
    else
    {
      if (v1 > 2722529671)
      {
        switch(v1)
        {
          case 2722529672:
            v2 = 23;
            goto LABEL_354;
          case 2730762296:
            v2 = 84;
            goto LABEL_354;
          case 2751865418:
            v2 = 115;
            goto LABEL_354;
        }
        goto LABEL_353;
      }
      if (v1 != 2673319456)
      {
        if (v1 == 2702125347)
        {
          v2 = 3;
          goto LABEL_354;
        }
        goto LABEL_353;
      }
    }
    v2 = 58;
    goto LABEL_354;
  }
  return PlatformUtilities_iOS::GetProductType(void)::sType;
}

uint64_t PlatformUtilities_iOS::ProductSupportsAssistant(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsCarPlay(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsLivePhoto(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsVibrator(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsHaptics(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsSiriBargeIn(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsWirelessCharging(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsPictureInPicture(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::CopyProductAssignedName(PlatformUtilities_iOS *this)
{
  return MGGetStringAnswer();
}

uint64_t PlatformUtilities_iOS::IsTelephonyCaptureAllowed(int a1)
{
  uint64_t result;
  const __CFString *v3;
  const __CFString *v4;

  if (queryBuildType(void)::once != -1)
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_66);
  if (!gIsInternal && !gIsCarrier)
    return 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.coreaudio"));
  result = CACFPreferencesGetAppIntegerValue(CFSTR("EnableTelephonyMonitor"), CFSTR("com.apple.coreaudio"), 0);
  if (result)
  {
    switch(a1)
    {
      case 0:
        v3 = CFSTR("com.apple.coreaudio");
        CFPreferencesAppSynchronize(CFSTR("com.apple.coreaudio"));
        v4 = CFSTR("EnableVPTelephonyMonitor");
        break;
      case 1:
        v3 = CFSTR("com.apple.audio.virtualaudio");
        CFPreferencesAppSynchronize(CFSTR("com.apple.audio.virtualaudio"));
        v4 = CFSTR("EnableVADTelephonyMonitor");
        break;
      case 2:
        v3 = CFSTR("com.apple.coreaudio");
        CFPreferencesAppSynchronize(CFSTR("com.apple.coreaudio"));
        v4 = CFSTR("EnableHALTelephonyMonitor");
        break;
      case 3:
        v3 = CFSTR("com.apple.audio.virtualaudio");
        CFPreferencesAppSynchronize(CFSTR("com.apple.audio.virtualaudio"));
        v4 = CFSTR("EnableEANCTelephonyMonitor");
        break;
      default:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          PlatformUtilities_iOS::IsTelephonyCaptureAllowed();
        __break(1u);
        JUMPOUT(0x1B576F99CLL);
    }
    return CACFPreferencesGetAppIntegerValue(v4, v3, 0) != 0;
  }
  return result;
}

uint64_t PlatformUtilities_iOS::IsInternalBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1)
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_66);
  return gIsInternal;
}

uint64_t PlatformUtilities_iOS::IsCarrierBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1)
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_66);
  return gIsCarrier;
}

uint64_t PlatformUtilities_iOS::ProductSupportsTelephonyOverUSB(PlatformUtilities_iOS *this)
{
  uint64_t result;

  result = MGGetBoolAnswer();
  if ((_DWORD)result)
    return MGGetBoolAnswer();
  return result;
}

uint64_t PlatformUtilities_iOS::ProductSupportsSiriSpeaks(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsStereoRecording(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductSupportsBrook(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::IsUIBuild(PlatformUtilities_iOS *this)
{
  if (queryBuildType(void)::once != -1)
    dispatch_once(&queryBuildType(void)::once, &__block_literal_global_66);
  return gIsUI;
}

uint64_t PlatformUtilities_iOS::_eaJyFmO(PlatformUtilities_iOS *this)
{
  if (PlatformUtilities_iOS::_eaJyFmO(void)::once != -1)
    dispatch_once(&PlatformUtilities_iOS::_eaJyFmO(void)::once, &__block_literal_global_0);
  return PlatformUtilities_iOS::_eaJyFmO(void)::isMonarchLowEndHardware;
}

void ___ZN21PlatformUtilities_iOS8_eaJyFmOEv_block_invoke()
{
  const void *v0;
  BOOL v1;
  const void *v2;
  char v3;

  v0 = (const void *)MGCopyAnswer();
  v2 = v0;
  v3 = 1;
  if (v0)
    v1 = CFEqual(v0, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
  else
    v1 = 0;
  PlatformUtilities_iOS::_eaJyFmO(void)::isMonarchLowEndHardware = v1;
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v2);
}

void sub_1B576FB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  _Unwind_Resume(a1);
}

uint64_t PlatformUtilities_iOS::ProductHasAOP(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

uint64_t PlatformUtilities_iOS::ProductHasBaseband(PlatformUtilities_iOS *this)
{
  return MGGetBoolAnswer();
}

void PlatformUtilities_iOS::TrimHardwareModelShortName(__CFString *this, __CFString *a2)
{
  const __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  CFIndex Length;
  CFStringRef v7;
  char v8;
  CFStringRef suffix;
  char v10;
  CFRange v11;

  if (!this)
    return;
  v3 = CFSTR("AP");
  if (CFStringHasSuffix(this, CFSTR("AP"))
    || (v3 = CFSTR("DEV"), CFStringHasSuffix(this, CFSTR("DEV")))
    || (v3 = CFSTR("ap"), CFStringHasSuffix(this, CFSTR("ap")))
    || (v3 = CFSTR("dev"), CFStringHasSuffix(this, CFSTR("dev"))))
  {
    CFStringTrim(this, v3);
  }
  suffix = 0;
  v10 = 1;
  v4 = MGGetProductType();
  if (v4 == 952317141)
  {
    v7 = CFStringCreateWithCString(0, "u", 0x600u);
    v8 = 1;
    CACFString::operator=((uint64_t)&suffix, (uint64_t)&v7);
  }
  else
  {
    if (v4 != 2081274472 && v4 != 2468178735)
      goto LABEL_14;
    v7 = CFStringCreateWithCString(0, "m", 0x600u);
    v8 = 1;
    CACFString::operator=((uint64_t)&suffix, (uint64_t)&v7);
  }
  CACFString::~CACFString((CACFString *)&v7);
LABEL_14:
  v5 = suffix;
  if (suffix)
  {
    if (CFStringHasSuffix(this, suffix))
    {
      Length = CFStringGetLength(this);
      v11.length = CFStringGetLength(v5);
      v11.location = Length - v11.length;
      CFStringFindAndReplace(this, v5, &stru_1E69626F8, v11, 1uLL);
    }
  }
  CACFString::~CACFString((CACFString *)&suffix);
}

void sub_1B576FD5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  CACFString::~CACFString((CACFString *)&a9);
  CACFString::~CACFString((CACFString *)&a11);
  _Unwind_Resume(a1);
}

uint64_t PlatformUtilities_iOS::GetBuiltInMicCount(PlatformUtilities_iOS *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0
  {
    PlatformUtilities_iOS::GetBuiltInMicCount(void)::sMicCount = PlatformUtilities_iOS::GetBuiltInMicCount(void)::$_0::operator()();
  }
  return PlatformUtilities_iOS::GetBuiltInMicCount(void)::sMicCount;
}

void sub_1B576FDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const __CFNumber *PlatformUtilities_iOS::GetBuiltInMicCount(void)::$_0::operator()()
{
  const __CFNumber *result;
  const __CFNumber *v1;
  unsigned int valuePtr;

  result = (const __CFNumber *)MGCopyAnswer();
  valuePtr = 0;
  if (result)
  {
    v1 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v1);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFStringRef PlatformUtilities_iOS::CopyAcousticIDFilePrefix(PlatformUtilities_iOS *this)
{
  const char *p_p;
  CFStringRef v2;
  uint64_t v3;
  void *__p;
  char v6;
  _QWORD v7[2];
  _QWORD v8[11];
  char v9;
  uint64_t v10;

  if (MGIsQuestionValid())
    MGGetSInt32Answer();
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"AID", 3);
  std::ostream::operator<<();
  std::stringbuf::str();
  if (v6 >= 0)
    p_p = (const char *)&__p;
  else
    p_p = (const char *)__p;
  v2 = CFStringCreateWithCString(0, p_p, 0x600u);
  if (v6 < 0)
    operator delete(__p);
  v7[0] = *MEMORY[0x1E0DE4F50];
  v3 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)v7 + *(_QWORD *)(v7[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v8[0] = v3;
  v8[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v9 < 0)
    operator delete((void *)v8[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1B5E4EE88](&v10);
  return v2;
}

void sub_1B576FF84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
    operator delete(__p);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x1E0DE4FD0];
  v3 = MEMORY[0x1E0DE4FD0] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x1E0DE4FD0] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x1E0DE4F50];
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 16);
  v7 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_1B57700B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x1B5E4EE88](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x1E0DE4F50];
  v3 = *MEMORY[0x1E0DE4F50];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F50];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DE4FB8] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1B5E4EE88](a1 + 128);
  return a1;
}

CFStringRef PlatformUtilities_iOS::CopyProductTypeFilePrefix(int a1)
{
  int v1;
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
  CFStringRef result;
  uint64_t v21;
  char __str[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  __str[0] = 0;
  switch(a1)
  {
    case 1:
      v21 = 0;
      v1 = 184;
      goto LABEL_7;
    case 2:
      v21 = 0;
      goto LABEL_5;
    case 3:
      v21 = 97;
LABEL_5:
      v1 = 238;
      goto LABEL_7;
    case 4:
      v21 = 0;
      v1 = 520;
LABEL_7:
      v2 = 98;
      goto LABEL_179;
    case 5:
      v21 = 0;
      v1 = 10;
      goto LABEL_35;
    case 6:
      v21 = 0;
      v1 = 11;
      goto LABEL_35;
    case 7:
      v21 = 0;
      v1 = 12;
      goto LABEL_35;
    case 8:
      v21 = 0;
      v1 = 16;
      goto LABEL_35;
    case 9:
      v21 = 0;
      v1 = 17;
      goto LABEL_35;
    case 10:
      v21 = 0;
      v1 = 101;
      goto LABEL_35;
    case 11:
      v21 = 0;
      v1 = 111;
      goto LABEL_35;
    case 12:
      v21 = 0;
      v1 = 121;
      goto LABEL_35;
    case 13:
      v21 = 0;
      v1 = 20;
      goto LABEL_35;
    case 14:
      v21 = 0;
      v1 = 21;
      goto LABEL_35;
    case 15:
      v21 = 0;
      v1 = 22;
      goto LABEL_35;
    case 16:
      v21 = 0;
      v1 = 201;
      goto LABEL_35;
    case 17:
      v21 = 0;
      v1 = 211;
      goto LABEL_35;
    case 18:
      v21 = 0;
      v1 = 221;
      goto LABEL_35;
    case 19:
      v21 = 0;
      v1 = 32;
      goto LABEL_35;
    case 20:
      v21 = 0;
      v1 = 33;
      goto LABEL_35;
    case 21:
      v21 = 0;
      v1 = 79;
      goto LABEL_35;
    case 22:
      v21 = 0;
      v1 = 42;
      goto LABEL_35;
    case 23:
      v21 = 0;
      v1 = 43;
      goto LABEL_35;
    case 24:
      v21 = 0;
      v1 = 49;
      goto LABEL_35;
    case 25:
      v21 = 103;
      v1 = 52;
      goto LABEL_35;
    case 26:
      v3 = 103;
      goto LABEL_31;
    case 27:
      v3 = 112;
LABEL_31:
      v21 = v3;
      v1 = 53;
      goto LABEL_35;
    case 28:
      v21 = 112;
      v1 = 54;
      goto LABEL_35;
    case 29:
      v21 = 0;
      v1 = 63;
      goto LABEL_35;
    case 30:
      v21 = 0;
      v1 = 64;
LABEL_35:
      v2 = 100;
      goto LABEL_179;
    case 31:
      v21 = 0;
      v1 = 104;
      goto LABEL_178;
    case 32:
      v21 = 0;
      goto LABEL_39;
    case 33:
      v21 = 100;
LABEL_39:
      v1 = 42;
      goto LABEL_94;
    case 34:
      v21 = 0;
      goto LABEL_44;
    case 35:
      v4 = 98;
      goto LABEL_43;
    case 36:
      v4 = 115;
LABEL_43:
      v21 = v4;
LABEL_44:
      v1 = 71;
      goto LABEL_94;
    case 37:
      v21 = 0;
      v1 = 72;
      goto LABEL_94;
    case 38:
      v21 = 0;
      v1 = 73;
      goto LABEL_94;
    case 39:
      v21 = 0;
      v1 = 81;
      goto LABEL_94;
    case 40:
      v21 = 0;
      v1 = 82;
      goto LABEL_94;
    case 41:
      v21 = 0;
      goto LABEL_51;
    case 42:
      v21 = 109;
LABEL_51:
      v1 = 85;
      goto LABEL_94;
    case 43:
      v21 = 0;
      goto LABEL_54;
    case 44:
      v21 = 109;
LABEL_54:
      v1 = 86;
      goto LABEL_94;
    case 45:
      v21 = 0;
      goto LABEL_57;
    case 46:
      v21 = 109;
LABEL_57:
      v1 = 87;
      goto LABEL_94;
    case 47:
      v21 = 0;
      v1 = 96;
      goto LABEL_94;
    case 48:
      v21 = 0;
      v1 = 97;
      goto LABEL_94;
    case 49:
      v21 = 0;
      goto LABEL_62;
    case 50:
      v21 = 97;
LABEL_62:
      v1 = 98;
      goto LABEL_94;
    case 51:
      v21 = 0;
      goto LABEL_65;
    case 52:
      v21 = 97;
LABEL_65:
      v1 = 99;
      goto LABEL_94;
    case 53:
      v21 = 97;
      v1 = 105;
      goto LABEL_94;
    case 54:
      v21 = 0;
      v1 = 120;
      goto LABEL_94;
    case 55:
      v21 = 0;
      v1 = 127;
      goto LABEL_94;
    case 56:
      v21 = 0;
      v1 = 128;
      goto LABEL_94;
    case 57:
      v21 = 0;
      goto LABEL_72;
    case 58:
      v21 = 97;
LABEL_72:
      v1 = 171;
      goto LABEL_94;
    case 59:
      v21 = 0;
      v1 = 181;
      goto LABEL_94;
    case 60:
      v21 = 0;
      v1 = 182;
      goto LABEL_94;
    case 61:
      v21 = 0;
      v1 = 207;
      goto LABEL_94;
    case 62:
      v21 = 0;
      v1 = 210;
      goto LABEL_94;
    case 63:
      v21 = 0;
      v1 = 217;
      goto LABEL_94;
    case 64:
      v21 = 0;
      v1 = 305;
      goto LABEL_94;
    case 65:
      v21 = 0;
      v1 = 307;
      goto LABEL_94;
    case 66:
      v21 = 0;
      v1 = 308;
      goto LABEL_94;
    case 67:
      v21 = 0;
      v1 = 310;
      goto LABEL_94;
    case 68:
      v21 = 0;
      v1 = 311;
      goto LABEL_94;
    case 69:
      v21 = 0;
      v1 = 317;
      goto LABEL_94;
    case 70:
      v21 = 0;
      v1 = 320;
      goto LABEL_94;
    case 71:
      v21 = 0;
      v1 = 348;
      goto LABEL_94;
    case 72:
      v21 = 0;
      v1 = 407;
      goto LABEL_94;
    case 73:
      v21 = 0;
      v1 = 408;
      goto LABEL_94;
    case 74:
      v21 = 0;
      v1 = 417;
      goto LABEL_94;
    case 75:
      v21 = 0;
      v1 = 420;
      goto LABEL_94;
    case 76:
      v21 = 0;
      v1 = 517;
      goto LABEL_94;
    case 77:
      v21 = 0;
      v1 = 522;
      goto LABEL_94;
    case 78:
      v21 = 0;
      v1 = 617;
      goto LABEL_94;
    case 79:
      v21 = 0;
      v1 = 620;
LABEL_94:
      v2 = 106;
      goto LABEL_179;
    case 80:
      v21 = 97;
      v1 = 27;
      goto LABEL_178;
    case 81:
      v21 = 97;
      v1 = 28;
      goto LABEL_178;
    case 82:
      v21 = 0;
      v1 = 41;
      goto LABEL_178;
    case 83:
      v21 = 0;
      v1 = 42;
      goto LABEL_178;
    case 84:
      v21 = 0;
      v1 = 48;
      goto LABEL_178;
    case 85:
      v21 = 0;
      v1 = 49;
      goto LABEL_178;
    case 86:
      v21 = 0;
      v1 = 51;
      goto LABEL_178;
    case 87:
      v21 = 0;
      v1 = 53;
      goto LABEL_178;
    case 88:
      v21 = 0;
      v1 = 56;
      goto LABEL_178;
    case 89:
      v21 = 0;
      v1 = 61;
      goto LABEL_178;
    case 90:
      v21 = 0;
      v1 = 64;
      goto LABEL_178;
    case 91:
      v21 = 0;
      v1 = 65;
      goto LABEL_178;
    case 92:
      v21 = 0;
      v1 = 66;
      goto LABEL_178;
    case 93:
      v21 = 0;
      v1 = 69;
      goto LABEL_178;
    case 94:
      v21 = 0;
      v1 = 71;
      goto LABEL_178;
    case 95:
      v21 = 0;
      v1 = 74;
      goto LABEL_178;
    case 96:
      v21 = 0;
      v1 = 75;
      goto LABEL_178;
    case 97:
      v21 = 0;
      v1 = 841;
      goto LABEL_178;
    case 98:
      v21 = 0;
      v1 = 102;
      goto LABEL_178;
    case 99:
      v21 = 0;
      v1 = 112;
      goto LABEL_178;
    case 100:
      v5 = 115;
      goto LABEL_117;
    case 101:
      v5 = 98;
LABEL_117:
      v21 = v5;
      v1 = 111;
      goto LABEL_178;
    case 102:
      v6 = 115;
      goto LABEL_120;
    case 103:
      v6 = 98;
LABEL_120:
      v21 = v6;
      v1 = 121;
      goto LABEL_178;
    case 104:
      v7 = 115;
      goto LABEL_123;
    case 105:
      v7 = 98;
LABEL_123:
      v21 = v7;
      v1 = 131;
      goto LABEL_178;
    case 106:
      v8 = 115;
      goto LABEL_126;
    case 107:
      v8 = 98;
LABEL_126:
      v21 = v8;
      v1 = 140;
      goto LABEL_178;
    case 108:
      v9 = 115;
      goto LABEL_129;
    case 109:
      v9 = 98;
LABEL_129:
      v21 = v9;
      v1 = 141;
      goto LABEL_178;
    case 110:
      v10 = 115;
      goto LABEL_132;
    case 111:
      v10 = 98;
LABEL_132:
      v21 = v10;
      v1 = 142;
      goto LABEL_178;
    case 112:
      v11 = 98;
      goto LABEL_135;
    case 113:
      v11 = 115;
LABEL_135:
      v21 = v11;
      v1 = 143;
      goto LABEL_178;
    case 114:
      v12 = 115;
      goto LABEL_138;
    case 115:
      v12 = 98;
LABEL_138:
      v21 = v12;
      v1 = 144;
      goto LABEL_178;
    case 116:
      v13 = 115;
      goto LABEL_141;
    case 117:
      v13 = 98;
LABEL_141:
      v21 = v13;
      v1 = 146;
      goto LABEL_178;
    case 118:
      v14 = 98;
      goto LABEL_144;
    case 119:
      v14 = 115;
LABEL_144:
      v21 = v14;
      v1 = 149;
      goto LABEL_178;
    case 120:
      v15 = 115;
      goto LABEL_147;
    case 121:
      v15 = 98;
LABEL_147:
      v21 = v15;
      v1 = 157;
      goto LABEL_178;
    case 122:
      v16 = 115;
      goto LABEL_150;
    case 123:
      v16 = 98;
LABEL_150:
      v21 = v16;
      v1 = 158;
      goto LABEL_178;
    case 124:
      v17 = 115;
      goto LABEL_153;
    case 125:
      v17 = 98;
LABEL_153:
      v21 = v17;
      v1 = 187;
      goto LABEL_178;
    case 126:
      v18 = 115;
      goto LABEL_156;
    case 127:
      v18 = 98;
LABEL_156:
      v21 = v18;
      v1 = 188;
      goto LABEL_178;
    case 128:
      v21 = 0;
      v1 = 101;
      goto LABEL_160;
    case 129:
      v21 = 0;
      v1 = 102;
      goto LABEL_160;
    case 130:
      v21 = 0;
      v1 = 103;
LABEL_160:
      v2 = 112;
      goto LABEL_179;
    case 131:
      v19 = 110;
      goto LABEL_163;
    case 132:
      v19 = 112;
LABEL_163:
      v21 = v19;
      v1 = 398;
      goto LABEL_174;
    case 133:
      v21 = 0;
      v1 = 456;
      goto LABEL_174;
    case 134:
      v21 = 112;
      v1 = 698;
      goto LABEL_174;
    case 135:
      v21 = 0;
      v1 = 720;
      goto LABEL_174;
    case 136:
      v21 = 0;
      v1 = 721;
      goto LABEL_174;
    case 137:
      v21 = 0;
      v1 = 734;
      goto LABEL_174;
    case 138:
      v21 = 0;
      v1 = 1125;
      goto LABEL_174;
    case 139:
      v21 = 0;
      v1 = 1250;
      goto LABEL_174;
    case 140:
      v21 = 0;
      v1 = 1251;
      goto LABEL_174;
    case 141:
      v21 = 0;
      v1 = 1252;
      goto LABEL_174;
    case 142:
      v21 = 0;
      v1 = 1253;
LABEL_174:
      v2 = 116;
      goto LABEL_179;
    case 143:
      snprintf(__str, 0x18uLL, "%c%d%c", 116, 698, 116);
      goto LABEL_180;
    case 144:
      v21 = 0;
      v1 = 100;
      v2 = 113;
      goto LABEL_179;
    case 145:
      v21 = 0;
      v1 = 301;
LABEL_178:
      v2 = 110;
LABEL_179:
      snprintf(__str, 0x18uLL, "%c%d%c", v2, v1, v21);
LABEL_180:
      if (!__str[0])
        goto LABEL_182;
      result = CFStringCreateWithCString(0, __str, 0x600u);
      break;
    default:
LABEL_182:
      result = 0;
      break;
  }
  return result;
}

void ___ZL14queryBuildTypev_block_invoke()
{
  const void *v0;
  CFTypeRef *v1;
  BOOL v2;
  const __CFString *v3;
  BOOL v4;
  const void *v5;
  BOOL v6;
  const void *v7;
  char v8;
  const __CFString *v9;
  char v10;
  const void *v11;
  char v12;

  v0 = (const void *)MGCopyAnswer();
  v11 = v0;
  v12 = 1;
  v1 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  if (v0)
    v2 = CFEqual(v0, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
  else
    v2 = 0;
  gIsInternal = v2;
  v3 = (const __CFString *)MGCopyAnswer();
  v9 = v3;
  v10 = 1;
  if (v3)
    v4 = CFStringCompare(CFSTR("Carrier"), v3, 0) == kCFCompareEqualTo;
  else
    v4 = 0;
  gIsCarrier = v4;
  v5 = (const void *)MGCopyAnswer();
  v7 = v5;
  v8 = 1;
  if (v5)
    v6 = CFEqual(v5, *v1) != 0;
  else
    v6 = 0;
  gIsUI = v6;
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v7);
  CACFString::~CACFString((CACFString *)&v9);
  CACFBoolean::~CACFBoolean((CACFBoolean *)&v11);
}

void sub_1B5770A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a9);
  CACFString::~CACFString((CACFString *)&a11);
  CACFBoolean::~CACFBoolean((CACFBoolean *)&a13);
  _Unwind_Resume(a1);
}

void CACFString::~CACFString(CACFString *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
}

void CACFBoolean::~CACFBoolean(CACFBoolean *this)
{
  const void *v2;

  if (*((_BYTE *)this + 8))
  {
    v2 = *(const void **)this;
    if (*(_QWORD *)this)
      CFRelease(v2);
  }
}

uint64_t CACFString::operator=(uint64_t a1, uint64_t a2)
{
  const void *v3;
  BOOL v5;
  int v6;
  BOOL v7;

  v3 = *(const void **)a2;
  if (*(_QWORD *)a2 != *(_QWORD *)a1)
  {
    if (*(_QWORD *)a1)
      v5 = *(_BYTE *)(a1 + 8) == 0;
    else
      v5 = 1;
    if (!v5)
    {
      CFRelease(*(CFTypeRef *)a1);
      v3 = *(const void **)a2;
    }
    *(_QWORD *)a1 = v3;
    v6 = *(unsigned __int8 *)(a2 + 8);
    *(_BYTE *)(a1 + 8) = v6;
    if (v6)
      v7 = v3 == 0;
    else
      v7 = 1;
    if (!v7)
      CFRetain(v3);
  }
  return a1;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x1B5E4EDD4](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x1B5E4EDE0](v13);
  return a1;
}

void sub_1B5770C38(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x1B5E4EDE0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1B5770C18);
}

void sub_1B5770C80(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_1B5770DB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

double CACFPreferencesGetAppFloatValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  const __CFString *v4;
  BOOL *v5;
  const __CFString *v6;
  BOOL *v7;
  double v8;
  char v10;

  v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  v6 = v4;
  if (a3)
    v7 = a3;
  else
    v7 = (BOOL *)&v10;
  v8 = CASmartPreferences::InterpretFloat(v4, v7, v5);
  if (v6)
    CFRelease(v6);
  return v8;
}

double CASmartPreferences::InterpretFloat(const __CFString *this, _BYTE *a2, BOOL *a3)
{
  CFTypeID v5;
  double valuePtr;
  char buffer[64];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  valuePtr = 0.0;
  *a2 = 0;
  if (this)
  {
    v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      valuePtr = (double)CFBooleanGetValue((CFBooleanRef)this);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)this, kCFNumberDoubleType, &valuePtr);
      goto LABEL_6;
    }
    if (v5 == CFStringGetTypeID())
    {
      CFStringGetCString(this, buffer, 64, 0x600u);
      if (sscanf(buffer, "%lf", &valuePtr) == 1)
        goto LABEL_6;
    }
  }
  return valuePtr;
}

uint64_t CACFPreferencesGetAppIntegerValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  const __CFString *v4;
  BOOL *v5;
  const __CFString *v6;
  BOOL *v7;
  uint64_t v8;
  char v10;

  v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  v6 = v4;
  if (a3)
    v7 = a3;
  else
    v7 = (BOOL *)&v10;
  v8 = CASmartPreferences::InterpretInteger(v4, v7, v5);
  if (v6)
    CFRelease(v6);
  return v8;
}

uint64_t CASmartPreferences::InterpretInteger(const __CFString *this, _BYTE *a2, BOOL *a3)
{
  CFTypeID v5;
  int valuePtr;
  char buffer[64];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  *a2 = 0;
  if (this)
  {
    v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      valuePtr = CFBooleanGetValue((CFBooleanRef)this);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)this, kCFNumberIntType, &valuePtr);
      goto LABEL_6;
    }
    if (v5 == CFStringGetTypeID())
    {
      CFStringGetCString(this, buffer, 64, 0x600u);
      if (sscanf(buffer, "%d", &valuePtr) == 1)
        goto LABEL_6;
    }
  }
  return valuePtr;
}

BOOL CACFPreferencesGetAppBooleanValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CASmartPreferences *v4;
  BOOL *v5;
  CASmartPreferences *v6;
  BOOL *v7;
  _BOOL8 v8;
  char v10;

  v4 = (CASmartPreferences *)CFPreferencesCopyAppValue(a1, a2);
  v6 = v4;
  if (a3)
    v7 = a3;
  else
    v7 = (BOOL *)&v10;
  v8 = CASmartPreferences::InterpretBoolean(v4, v7, v5);
  if (v6)
    CFRelease(v6);
  return v8;
}

BOOL CASmartPreferences::InterpretBoolean(CASmartPreferences *this, _BYTE *a2, BOOL *a3)
{
  const __CFBoolean *v4;
  CFTypeID v5;
  char v7;
  char *v8;
  int v9;
  BOOL v10;
  int valuePtr;
  char buffer[4];
  __int16 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  *a2 = 0;
  if (this)
  {
    v4 = this;
    v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      LODWORD(this) = CFBooleanGetValue(v4);
LABEL_6:
      *a2 = 1;
      return (_DWORD)this != 0;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      LODWORD(this) = valuePtr != 0;
      goto LABEL_6;
    }
    if (v5 != CFStringGetTypeID())
    {
      LODWORD(this) = 0;
      return (_DWORD)this != 0;
    }
    CFStringGetCString((CFStringRef)v4, buffer, 64, 0x600u);
    if (sscanf(buffer, "%d", &valuePtr) == 1)
    {
      *a2 = 1;
      LODWORD(this) = valuePtr != 0;
      return (_DWORD)this != 0;
    }
    v7 = buffer[0];
    if (buffer[0])
    {
      v8 = &buffer[1];
      do
      {
        *(v8 - 1) = __tolower(v7);
        v9 = *v8++;
        v7 = v9;
      }
      while (v9);
    }
    if (!(*(unsigned __int16 *)buffer ^ 0x6F6E | buffer[2])
      || (*(_DWORD *)buffer == 1936482662 ? (v10 = v13 == 101) : (v10 = 0), v10))
    {
      LODWORD(this) = 0;
      goto LABEL_6;
    }
    if (*(_DWORD *)buffer == 7562617 || !(*(_DWORD *)buffer ^ 0x65757274 | v13))
    {
      LODWORD(this) = 1;
      *a2 = 1;
    }
    else
    {
      LODWORD(this) = valuePtr;
    }
  }
  return (_DWORD)this != 0;
}

uint64_t CACFPreferencesGetAppFourCCValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;
  uint64_t v7;
  BOOL v8;
  char buffer[4];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  if (!v4)
  {
    v7 = 0;
    v8 = 0;
    if (!a3)
      return v7;
    goto LABEL_7;
  }
  v5 = v4;
  v6 = CFGetTypeID(v4);
  if (v6 == CFStringGetTypeID() && (CFStringGetCString(v5, buffer, 64, 0x600u), strlen(buffer) == 4))
  {
    v7 = bswap32(*(unsigned int *)buffer);
    v8 = 1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  CFRelease(v5);
  if (a3)
LABEL_7:
    *a3 = v8;
  return v7;
}

void ___ZN18CASmartPreferencesC2Ev_block_invoke(uint64_t a1)
{
  CASmartPreferences::RereadPrefs(*(CASmartPreferences **)(a1 + 32));
}

void CASmartPreferences::RereadPrefs(CASmartPreferences *this)
{
  CFStringRef *v2;
  CFStringRef *v3;

  std::mutex::lock((std::mutex *)this);
  CFSetApplyFunction(*((CFSetRef *)this + 8), (CFSetApplierFunction)SynchronizePrefDomain, 0);
  v2 = (CFStringRef *)*((_QWORD *)this + 9);
  v3 = (CFStringRef *)*((_QWORD *)this + 10);
  while (v2 != v3)
  {
    CASmartPreferences::Pref::Load(v2);
    v2 += 6;
  }
  std::mutex::unlock((std::mutex *)this);
}

void sub_1B577147C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t SynchronizePrefDomain(const __CFString *a1, void *a2)
{
  return CFPreferencesSynchronize(a1, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

uint64_t std::vector<CASmartPreferences::Pref>::__emplace_back_slow_path<__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  void *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  uint64_t *v18;

  v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  v6 = v5 + 1;
  if (v5 + 1 > 0x555555555555555)
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * ((a1[2] - *a1) >> 4) > v6)
    v6 = 0x5555555555555556 * ((a1[2] - *a1) >> 4);
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL)
    v10 = 0x555555555555555;
  else
    v10 = v6;
  v18 = a1 + 2;
  if (v10)
    v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CASmartPreferences::Pref>>((uint64_t)(a1 + 2), v10);
  else
    v11 = 0;
  v14 = v11;
  v15 = &v11[48 * v5];
  v17 = &v11[48 * v10];
  std::allocator<CASmartPreferences::Pref>::construct[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>((uint64_t)(a1 + 2), v15, a2, a3, a4);
  v16 = v15 + 48;
  std::vector<CASmartPreferences::Pref>::__swap_out_circular_buffer(a1, &v14);
  v12 = a1[1];
  std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer(&v14);
  return v12;
}

void sub_1B57715C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

_QWORD *std::allocator<CASmartPreferences::Pref>::construct[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>(uint64_t a1, _QWORD *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = *a3;
  v7 = *a4;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)v10, a5);
  *a2 = v6;
  a2[1] = v7;
  result = v11;
  if (!v11)
  {
    a2[5] = 0;
    return result;
  }
  if (v11 == v10)
  {
    a2[5] = a2 + 2;
    (*(void (**)(_QWORD *))(v10[0] + 24))(v10);
  }
  else
  {
    a2[5] = (*(uint64_t (**)(void))(*v11 + 16))();
  }
  result = v11;
  if (v11 == v10)
  {
    v9 = 4;
    result = v10;
  }
  else
  {
    if (!v11)
      return result;
    v9 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v9))();
}

void sub_1B57716C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CASmartPreferences::Pref>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CASmartPreferences::Pref>,std::reverse_iterator<CASmartPreferences::Pref*>,std::reverse_iterator<CASmartPreferences::Pref*>,std::reverse_iterator<CASmartPreferences::Pref*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  v13 = 0;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    do
    {
      v9 = a3 - 48;
      *(_OWORD *)(v7 - 48) = *(_OWORD *)(a3 - 48);
      std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100](v7 - 32, a3 - 32);
      v7 = *((_QWORD *)&v15 + 1) - 48;
      *((_QWORD *)&v15 + 1) -= 48;
      a3 = v9;
    }
    while (v9 != a5);
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<CASmartPreferences::Pref>,std::reverse_iterator<CASmartPreferences::Pref*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(_QWORD *)(a1 + 24) = v4;
  }
  else
  {
    v3 = (_QWORD *)(a1 + 24);
  }
  *v3 = 0;
  return a1;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<CASmartPreferences::Pref>,std::reverse_iterator<CASmartPreferences::Pref*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<CASmartPreferences::Pref>,std::reverse_iterator<CASmartPreferences::Pref*>>::operator()[abi:ne180100]((_QWORD *)a1);
  return a1;
}

_QWORD *std::_AllocatorDestroyRangeReverse<std::allocator<CASmartPreferences::Pref>,std::reverse_iterator<CASmartPreferences::Pref*>>::operator()[abi:ne180100](_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result[2] + 8);
  v2 = *(_QWORD *)(result[1] + 8);
  while (v1 != v2)
  {
    result = *(_QWORD **)(v1 + 40);
    if ((_QWORD *)(v1 + 16) == result)
    {
      result = (_QWORD *)(v1 + 16);
      v3 = 4;
    }
    else
    {
      if (!result)
        goto LABEL_8;
      v3 = 5;
    }
    result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
LABEL_8:
    v1 += 48;
  }
  return result;
}

_QWORD *std::__split_buffer<CASmartPreferences::Pref>::clear[abi:ne180100](_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = result[1];
  v1 = result[2];
  if (v1 != v2)
  {
    v3 = result;
    do
    {
      v3[2] = v1 - 48;
      result = *(_QWORD **)(v1 - 8);
      if (result == (_QWORD *)(v1 - 32))
      {
        result = (_QWORD *)(v1 - 32);
        v4 = 4;
      }
      else
      {
        if (!result)
        {
          v1 -= 48;
          continue;
        }
        v4 = 5;
      }
      result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
      v1 = v3[2];
    }
    while (v1 != v2);
  }
  return result;
}

void sub_1B57719D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5771B34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void setupClientLogScopes(void)
{
  if (setupClientLogScopes(void)::once != -1)
    dispatch_once(&setupClientLogScopes(void)::once, &__block_literal_global_1);
}

void sub_1B5771D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)AVHapticClient;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B5771EC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5771FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;

  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1B577213C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5772664(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5772B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1B5772F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;
  void *v26;

  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1B57733D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;

  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1B5773810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;

  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1B5773AD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5773C24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5773CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B5773E0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5773F5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5773FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B57743C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

float applyImmediateParameters(float a1, float a2, uint64_t a3)
{
  int v3;
  float v6;
  float v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (a3 != 2000 && a3 != 1000)
  {
    if (kAVHCScope)
    {
      v9 = *(id *)kAVHCScope;
      if (!v9)
        return a1;
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v10 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = "AVHapticClient.mm";
      v14 = 1024;
      v15 = 506;
      v16 = 2080;
      v17 = "applyImmediateParameters";
      v18 = 1024;
      v19 = v3;
      _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: ImmediateParameter for ID %u is not supported", (uint8_t *)&v12, 0x22u);
    }
    v7 = a1;
    goto LABEL_18;
  }
  v6 = fminf(a1 * a2, 1.0);
  if ((float)(a1 * a2) <= 0.0)
    v7 = 0.0;
  else
    v7 = v6;
  if (kAVHCScope)
  {
    if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
    {
      v8 = *(id *)kAVHCScope;
      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v12 = 136316674;
          v13 = "AVHapticClient.mm";
          v14 = 1024;
          v15 = 503;
          v16 = 2080;
          v17 = "applyImmediateParameters";
          v18 = 1024;
          v19 = v3;
          v20 = 2048;
          v21 = a1;
          v22 = 2048;
          v23 = a2;
          v24 = 2048;
          v25 = v7;
          _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: fixed param[%u]: source value: %.2f, immediateParameter value: %.2f, result value: %.2f", (uint8_t *)&v12, 0x40u);
        }
LABEL_18:

      }
    }
  }
  return v7;
}

unint64_t HapticClientUtil::getIndexOfSplitPoint<AVHapticEvent>(void *a1)
{
  id v1;
  unint64_t v2;
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "time");
  v5 = v4;

  if (v2 < 2)
  {
LABEL_10:
    if (kAVHCScope)
    {
      if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
      {
        v12 = *(id *)kAVHCScope;
        if (v12)
        {
          v13 = v12;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v19 = 136315906;
            v20 = "AVHapticClient.mm";
            v21 = 1024;
            v22 = 1534;
            v23 = 2080;
            v24 = "getIndexOfSplitPoint";
            v25 = 1024;
            v26 = v2 >> 1;
            _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No good split point found - returning midpoint %u", (uint8_t *)&v19, 0x22u);
          }

        }
      }
    }
    v6 = v2 >> 1;
  }
  else
  {
    v6 = 1;
    while (1)
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "time");
      v9 = v8 - v5;
      if (v9 > 0.01 && v6 >= 3 * v2 / 5)
        break;
      if (v6 >= 4 * v2 / 5 && v9 > 0.0)
      {
        if (kAVHCScope)
        {
          if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
          {
            v17 = *(id *)kAVHCScope;
            if (v17)
            {
              v15 = v17;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                v19 = 136316418;
                v20 = "AVHapticClient.mm";
                v21 = 1024;
                v22 = 1528;
                v23 = 2080;
                v24 = "getIndexOfSplitPoint";
                v25 = 1024;
                v26 = v2;
                v27 = 1024;
                v28 = v6;
                v29 = 2048;
                v30 = v9;
                v16 = "%25s:%-5d %s: Force-splitting length-%u array at index %u (delta from previous event: %f seconds)";
LABEL_27:
                _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v19, 0x32u);
              }
              goto LABEL_28;
            }
          }
        }
        goto LABEL_29;
      }
      objc_msgSend(v7, "time");
      v5 = v11;

      if (v2 == ++v6)
        goto LABEL_10;
    }
    if (kAVHCScope)
    {
      if ((*(_BYTE *)(kAVHCScope + 8) & 1) != 0)
      {
        v14 = *(id *)kAVHCScope;
        if (v14)
        {
          v15 = v14;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v19 = 136316418;
            v20 = "AVHapticClient.mm";
            v21 = 1024;
            v22 = 1521;
            v23 = 2080;
            v24 = "getIndexOfSplitPoint";
            v25 = 1024;
            v26 = v2;
            v27 = 1024;
            v28 = v6;
            v29 = 2048;
            v30 = v9;
            v16 = "%25s:%-5d %s: Splitting length-%u array at index %u (delta from previous event: %f seconds)";
            goto LABEL_27;
          }
LABEL_28:

        }
      }
    }
LABEL_29:

  }
  return v6;
}

void sub_1B5774A68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5774D0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577565C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5775840(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B5775A20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B5775B74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1B5775FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B57766CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5776D3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B57772F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5777630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  std::mutex *v10;

  std::mutex::unlock(v10);
  _Unwind_Resume(a1);
}

void sub_1B5777708(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B57778D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B577798C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5777BB0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1B5777F3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5778320(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B577850C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B57786F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B57788C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B5778A70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B5778C1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B5778DC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B5778F70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B577911C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B57792C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B577949C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B5779630(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B57797BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B57799C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5779A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B5779A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B5779D24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5779EF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577A19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  v21 = v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1B577A5B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  id *v17;
  void *v18;
  void *v19;

  objc_sync_exit(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B577A758(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577AA1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B577ABCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

void sub_1B577B054(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B577B39C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577B51C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___ZN16HapticClientUtil19getSortedEventArrayI13AVHapticEventEEP7NSArrayIPT_ES6__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "time");
  v6 = v5;
  objc_msgSend(v4, "time");
  if (v6 >= v7)
    v8 = 0;
  else
    v8 = -1;
  if (v6 > v7)
    v9 = 1;
  else
    v9 = v8;

  return v9;
}

void sub_1B577B648(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZN16HapticClientUtil19getSortedEventArrayI40AVHapticPlayerParameterCurveControlPointEEP7NSArrayIPT_ES6__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "time");
  v6 = v5;
  objc_msgSend(v4, "time");
  if (v6 >= v7)
    v8 = 0;
  else
    v8 = -1;
  if (v6 > v7)
    v9 = 1;
  else
    v9 = v8;

  return v9;
}

void sub_1B577B6B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::erase(uint64_t **a1, uint64_t a2)
{
  uint64_t *v3;

  v3 = std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__remove_node_pointer(a1, (uint64_t *)a2);

  operator delete((void *)a2);
  return v3;
}

uint64_t *std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t *std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__emplace_unique_key_args<unsigned long,unsigned long &,AVHapticSequenceEntry * {__strong}>(uint64_t **a1, unint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t *v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t **v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a1 + 1;
  v7 = a1[1];
  if (v7)
  {
    v9 = *a2;
    while (1)
    {
      while (1)
      {
        v10 = (uint64_t **)v7;
        v11 = v7[4];
        if (v9 >= v11)
          break;
        v7 = *v10;
        v8 = v10;
        if (!*v10)
          goto LABEL_10;
      }
      if (v11 >= v9)
        break;
      v7 = v10[1];
      if (!v7)
      {
        v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v10 = a1 + 1;
LABEL_10:
    v12 = (uint64_t *)operator new(0x30uLL);
    v13 = *a3;
    v14 = *a4;
    *a4 = 0;
    v12[4] = v13;
    v12[5] = v14;
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__insert_node_at(a1, (uint64_t)v10, v8, v12);
    return v12;
  }
  return (uint64_t *)v10;
}

uint64_t *std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::destroy(a1, a2[1]);

    operator delete(a2);
  }
}

void sub_1B577BF2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B577C024(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577C298(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  NSException *v23;
  uint64_t v24;
  void *v25;

  if (a2 == 1)
  {
    v23 = (NSException *)objc_begin_catch(exc_buf);
    NSErrorFromNSException(v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(a16 + 40);
    *(_QWORD *)(a16 + 40) = v24;

    objc_end_catch();
    JUMPOUT(0x1B577C224);
  }
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(exc_buf);
}

void sub_1B577C848(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

NSURL *FullURLPathFromURL(NSURL *a1, NSURL *a2)
{
  NSURL *v3;
  NSURL *v4;
  NSURL *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSURL *v18;
  NSObject *v19;
  id v20;
  NSURL *v21;
  _BOOL4 v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v27;
  NSURL *v28;
  id obj;
  NSURL *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  NSURL *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v28 = v3;
  v30 = v4;
  -[NSURL relativePath](v3, "relativePath");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "characterAtIndex:", 0) == 47)
  {
    v5 = v3;
    goto LABEL_41;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "addObject:", v4);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleURL");
  v9 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v9;
  objc_msgSend(v7, "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(v10, "URLsForDirectory:inDomains:", qword_1B5794478[i], 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v7, "addObjectsFromArray:", v12);

  }
  objc_msgSend(v10, "ubiquityIdentityToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v10, "URLForUbiquityContainerIdentifier:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v7, "addObject:", v14);

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v7;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v34;
LABEL_15:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v16)
        objc_enumerationMutation(obj);
      v18 = (NSURL *)*(id *)(*((_QWORD *)&v33 + 1) + 8 * v17);
      if (kHAPIScope)
      {
        v19 = *(id *)kHAPIScope;
        if (!v19)
          goto LABEL_25;
      }
      else
      {
        v19 = MEMORY[0x1E0C81028];
        v20 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v38 = "CHHapticPattern.mm";
        v39 = 1024;
        v40 = 329;
        v41 = 2080;
        v42 = "FullURLPathFromURL";
        v43 = 2112;
        v44 = v18;
        _os_log_impl(&dword_1B573F000, v19, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Searching for resource in '%@'", buf, 0x26u);
      }

LABEL_25:
      v21 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:relativeToURL:", v31, 0, v18);
      v5 = v21;
      if (v21)
      {
        v32 = 0;
        v22 = -[NSURL checkResourceIsReachableAndReturnError:](v21, "checkResourceIsReachableAndReturnError:", &v32);
        v23 = v32;
        if (v22)
        {
          if (kHAPIScope)
          {
            v24 = *(id *)kHAPIScope;
            v4 = v30;
            if (!v24)
            {
LABEL_39:

              goto LABEL_40;
            }
          }
          else
          {
            v24 = MEMORY[0x1E0C81028];
            v25 = MEMORY[0x1E0C81028];
            v4 = v30;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315906;
            v38 = "CHHapticPattern.mm";
            v39 = 1024;
            v40 = 333;
            v41 = 2080;
            v42 = "FullURLPathFromURL";
            v43 = 2112;
            v44 = v5;
            _os_log_impl(&dword_1B573F000, v24, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Found it at '%@'", buf, 0x26u);
          }

          goto LABEL_39;
        }
        v4 = v30;
      }
      else
      {
        v23 = 0;
      }

      if (v15 == ++v17)
      {
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        if (v15)
          goto LABEL_15;
        break;
      }
    }
  }
  v5 = 0;
LABEL_40:

LABEL_41:
  return v5;
}

void sub_1B577CE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B577D930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B577DA24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577DBC4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1B577DE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B577E160(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577E1EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B577E510(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B577E5C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B577EC68(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, __int128 a12)
{
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const CALog::Scope *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;

  if (a2 == 1)
  {
    objc_begin_catch(a1);
    CALog::LogObjIfEnabled((CALog *)1, *(_QWORD *)(v15 + 3656), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315650;
      *(_QWORD *)((char *)&buf + 4) = "CHHapticEngine.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 553;
      WORD1(a12) = 2080;
      *(_QWORD *)((char *)&a12 + 4) = "-[CHHapticEngine handleMediaServerRecovery:]_block_invoke";
      _os_log_impl(&dword_1B573F000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: FATAL ERROR: Unable to reconnect to server", (uint8_t *)&buf, 0x1Cu);
    }

    v21 = (void *)v12[7];
    v12[7] = 0;

    objc_end_catch();
    JUMPOUT(0x1B577EBCCLL);
  }

  _Unwind_Resume(a1);
}

void sub_1B577EE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B577EEC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B577F114(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577F34C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577F4DC(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;

  objc_destroyWeak(v2);

  _Unwind_Resume(a1);
}

void sub_1B577F6AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577F8D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B577FA84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B577FC20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  id *v15;
  void *v16;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B577FDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_1B577FEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B57802C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  id *v3;

  _Unwind_Resume(a1);
}

void sub_1B578093C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

void sub_1B5780CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)CHHapticEngine;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B5780DC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B57811C4()
{
  objc_end_catch();
  JUMPOUT(0x1B5781140);
}

void sub_1B57816FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B57819D8()
{
  objc_end_catch();
  JUMPOUT(0x1B57819E0);
}

void sub_1B5781B94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5781FB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B57826D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1B5782878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_1B5782EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;

  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1B5783118(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5783280(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B57835C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B57838A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5783C30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5783CE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5783E68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5783FE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5784164(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B57842E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5784460(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B57847F8(_Unwind_Exception *a1)
{
  std::mutex *v1;
  void *v2;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1B5784A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1B5784CCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B5785094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_1B57853C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B57855B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5785AC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5785FBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B57863A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  void *v32;
  void *v33;
  id *v34;
  void *v35;

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_1B57865FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  void *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B5786798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5786EB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5788208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::mutex *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,void *a56)
{
  void *v56;
  void *v57;
  uint64_t v58;

  std::shared_ptr<AudioResource>::~shared_ptr[abi:ne180100](v58 - 256);
  _Block_object_dispose((const void *)(v58 - 192), 8);

  _Block_object_dispose(&a31, 8);
  std::shared_ptr<AudioResource>::~shared_ptr[abi:ne180100]((uint64_t)&a53);
  std::mutex::unlock(a16);

  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<AudioResource>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

void sub_1B5788544(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id AVFASoftLink::getAVAudioFormat(AVFASoftLink *this)
{
  return *(id *)CADeprecated::TSingleton<AVFASoftLink>::instance();
}

void sub_1B57886D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B5788DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;
  std::mutex *v23;
  void *v24;

  std::shared_ptr<AudioResource>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  std::mutex::unlock(v23);
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

uint64_t newStateFromOld(int a1, int a2, int a3)
{
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  switch(a1)
  {
    case 0:
      if (a3)
        v6 = 3;
      else
        v6 = 2;
      if (a2)
        v7 = v6;
      else
        v7 = 0;
      break;
    case 1:
      if (a2)
        v8 = 3;
      else
        v8 = 1;
      if (a3)
        v7 = 0;
      else
        v7 = v8;
      break;
    case 2:
      if (a2)
        v9 = 2;
      else
        v9 = 0;
      v10 = a3 == 0;
      goto LABEL_20;
    case 3:
      v9 = a3 ^ 1;
      v10 = a2 == 0;
LABEL_20:
      if (v10)
        v7 = v9;
      else
        v7 = 3;
      break;
    default:
      v7 = 0;
      break;
  }
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v11 = *(id *)kHAPIScope;
      if (v11)
      {
        v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v14 = 136316674;
          v15 = "CHHapticEngine.mm";
          v16 = 1024;
          v17 = 2204;
          v18 = 2080;
          v19 = "newStateFromOld";
          v20 = 1024;
          v21 = a1;
          v22 = 1024;
          v23 = a2;
          v24 = 1024;
          v25 = a3;
          v26 = 1024;
          v27 = v7;
          _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Old: %d mute: %d running: %d => New: %d", (uint8_t *)&v14, 0x34u);
        }

      }
    }
  }
  return v7;
}

void std::__call_once_param<std::tuple<CADeprecated::TSingleton<AVFASoftLink>::instance(void)::{lambda(void)#1} &&>>::__execute[abi:ne180100]<>()
{
  AVFASoftLink *v0;

  v0 = (AVFASoftLink *)operator new();
  AVFASoftLink::AVFASoftLink(v0);
  __dmb(0xBu);
  CADeprecated::TSingleton<AVFASoftLink>::sInstance = (uint64_t)v0;
}

void sub_1B5789024(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1B5E4EEC4](v1, 0x80C40C96DFCA5);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::destroy(a1, a2[1]);

    std::shared_ptr<AudioResource>::~shared_ptr[abi:ne180100]((uint64_t)(a2 + 5));
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::destroy(a1, a2[1]);

    operator delete(a2);
  }
}

uint64_t std::shared_ptr<AudioResource>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

uint64_t **std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::tuple<NSURL * {__strong},NSDictionary * {__strong}>>(uint64_t **a1, unint64_t *a2, _QWORD *a3, __int128 *a4)
{
  uint64_t *v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t **v10;
  unint64_t v11;
  char *v12;
  __int128 v13;

  v8 = a1 + 1;
  v7 = a1[1];
  if (v7)
  {
    v9 = *a2;
    while (1)
    {
      while (1)
      {
        v10 = (uint64_t **)v7;
        v11 = v7[4];
        if (v9 >= v11)
          break;
        v7 = *v10;
        v8 = v10;
        if (!*v10)
          goto LABEL_10;
      }
      if (v11 >= v9)
        break;
      v7 = v10[1];
      if (!v7)
      {
        v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v10 = a1 + 1;
LABEL_10:
    v12 = (char *)operator new(0x38uLL);
    *((_QWORD *)v12 + 4) = *a3;
    v13 = *a4;
    *(_QWORD *)a4 = 0;
    *((_QWORD *)a4 + 1) = 0;
    *(_OWORD *)(v12 + 40) = v13;
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__insert_node_at(a1, (uint64_t)v10, v8, (uint64_t *)v12);
    return (uint64_t **)v12;
  }
  return v10;
}

uint64_t *std::__tree<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::pair<NSURL * {__strong},NSDictionary * {__strong}>>>>::erase(uint64_t **a1, uint64_t a2)
{
  uint64_t *v3;

  v3 = std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__remove_node_pointer(a1, (uint64_t *)a2);

  operator delete((void *)a2);
  return v3;
}

uint64_t **std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::__emplace_unique_key_args<unsigned long,unsigned long &,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>(uint64_t **a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t *v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t **v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;

  v8 = a1 + 1;
  v7 = a1[1];
  if (v7)
  {
    v9 = *a2;
    while (1)
    {
      while (1)
      {
        v10 = (uint64_t **)v7;
        v11 = v7[4];
        if (v9 >= v11)
          break;
        v7 = *v10;
        v8 = v10;
        if (!*v10)
          goto LABEL_10;
      }
      if (v11 >= v9)
        break;
      v7 = v10[1];
      if (!v7)
      {
        v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v10 = a1 + 1;
LABEL_10:
    v12 = (char *)operator new(0x48uLL);
    *((_QWORD *)v12 + 4) = *a3;
    *(_OWORD *)(v12 + 40) = *(_OWORD *)a4;
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    v13 = *(_QWORD *)(a4 + 16);
    *(_QWORD *)(a4 + 16) = 0;
    *((_QWORD *)v12 + 7) = v13;
    *((_DWORD *)v12 + 16) = *(_DWORD *)(a4 + 24);
    std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__insert_node_at(a1, (uint64_t)v10, v8, (uint64_t *)v12);
    return (uint64_t **)v12;
  }
  return v10;
}

_QWORD *std::allocate_shared[abi:ne180100]<AudioResource,std::allocator<AudioResource>,NSURL * {__strong}&,void>@<X0>(NSURL **a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x68uLL);
  result = std::__shared_ptr_emplace<AudioResource>::__shared_ptr_emplace[abi:ne180100]<NSURL * {__strong}&,std::allocator<AudioResource>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_1B578936C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<AudioResource>::__shared_ptr_emplace[abi:ne180100]<NSURL * {__strong}&,std::allocator<AudioResource>,0>(_QWORD *a1, NSURL **a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_1E695FD70;
  AudioResource::AudioResource((AudioResource *)(a1 + 3), *a2);
  return a1;
}

void sub_1B57893BC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<AudioResource>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E695FD70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AudioResource>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E695FD70;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1B5E4EEC4);
}

void std::__shared_ptr_emplace<AudioResource>::__on_zero_shared(uint64_t a1)
{
  AudioResource::~AudioResource((AudioResource *)(a1 + 24));
}

uint64_t *std::__tree<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::tuple<std::shared_ptr<AudioResource>,NSDictionary * {__strong},unsigned int>>>>::erase(uint64_t **a1, uint64_t a2)
{
  uint64_t *v3;

  v3 = std::__tree<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,AVHapticSequenceEntry * {__strong}>>>::__remove_node_pointer(a1, (uint64_t *)a2);

  std::shared_ptr<AudioResource>::~shared_ptr[abi:ne180100](a2 + 40);
  operator delete((void *)a2);
  return v3;
}

BOOL OUTLINED_FUNCTION_1(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

void sub_1B57896C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5789974(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B5789C5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5789F60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B578A108(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B578A240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B578A578(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B578A7B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B578AA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)AVHapticPlayer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B578AEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1B578B004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B578B140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B578B278(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B578B49C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B578B63C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B578B818(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B578B9CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B578BB5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B578BCE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B578BE98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_1B578C05C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_1B578C220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_1B578C3A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B578C8CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B578CA84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B578CBC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B578CD7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B578D1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  va_list va2;

  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v19 = va_arg(va2, _QWORD);
  v21 = va_arg(va2, _QWORD);
  v22 = va_arg(va2, _QWORD);
  v23 = va_arg(va2, _QWORD);
  _Block_object_dispose((const void *)(v12 - 112), 8);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);

  _Unwind_Resume(a1);
}

void sub_1B578D640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  va_list va2;

  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v19 = va_arg(va2, _QWORD);
  v21 = va_arg(va2, _QWORD);
  v22 = va_arg(va2, _QWORD);
  v23 = va_arg(va2, _QWORD);
  _Block_object_dispose((const void *)(v12 - 112), 8);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);

  _Unwind_Resume(a1);
}

void sub_1B578DA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  void *v28;

  _Block_object_dispose(&a21, 8);

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1B578DE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v12 = v10;

  a9.super_class = (Class)AVHapticSequence;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1B578E18C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B578E270(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B578E2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B578E36C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B578E434(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B578E4A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B578E704(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B578EC58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B578EFD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B578F2F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B578F610(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B578F928(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B578FC04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B578FF70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B579027C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B57907FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1B5790B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B5790E34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B5791018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B57910D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B57911A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B5791260(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void AudioResource::decrementAllocatedBytes()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v0 = 136315394;
    v1 = "AudioResource.mm";
    v2 = 1024;
    v3 = 154;
    _os_log_impl(&dword_1B573F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(_sTotalAllocatedBytes >= bytes) != 0 is false]: ", (uint8_t *)&v0, 0x12u);
  }
  __break(1u);
}

void PlatformUtilities_iOS::IsTelephonyCaptureAllowed()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B573F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, " Unhandled case in switch", v0, 2u);
}

uint64_t AudioConverterPrepare()
{
  return MEMORY[0x1E0CFF490]();
}

uint64_t CAReportingClientCreateReporterID()
{
  return MEMORY[0x1E0DDE838]();
}

uint64_t CAReportingClientDestroyReporterID()
{
  return MEMORY[0x1E0DDE840]();
}

uint64_t CAReportingClientSendMessage()
{
  return MEMORY[0x1E0DDE860]();
}

uint64_t CAReportingClientSetAudioServiceType()
{
  return MEMORY[0x1E0DDE880]();
}

uint64_t CAReportingClientSetConfiguration()
{
  return MEMORY[0x1E0DDE890]();
}

uint64_t CAReportingClientStartReporter()
{
  return MEMORY[0x1E0DDE898]();
}

uint64_t CAReportingClientStopReporter()
{
  return MEMORY[0x1E0DDE8B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2;
  double v3;
  CFGregorianDate result;

  v2 = MEMORY[0x1E0C97C88](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
  MEMORY[0x1E0C99250](theString, trimString);
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99280]();
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x1E0CFF638](inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x1E0CFF640](inExtAudioFile, *(_QWORD *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x1E0CFF650](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x1E0CFF658](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x1E0CFF668](inExtAudioFile, *(_QWORD *)&inPropertyID, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1E0DE2BA0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE4700]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E695F6C0();
}

void operator delete(void *__p)
{
  off_1E695F6C8(__p);
}

uint64_t operator delete()
{
  return off_1E695F6D0();
}

uint64_t operator new[]()
{
  return off_1E695F6D8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E695F6E0(__sz);
}

uint64_t operator new()
{
  return off_1E695F6E8();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t clientParamToSynthParam()
{
  return MEMORY[0x1E0CFFC70]();
}

uint64_t clientParamValueToFixedParamValue()
{
  return MEMORY[0x1E0CFFC78]();
}

uint64_t createHapticCommandWriter()
{
  return MEMORY[0x1E0CFFC80]();
}

uint64_t destroyHapticCommandWriter()
{
  return MEMORY[0x1E0CFFC88]();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
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

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  MEMORY[0x1E0DE7C20](dest, src, copyHelper);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

uint64_t reserveForWrite()
{
  return MEMORY[0x1E0CFFE70]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t updateReservedWriteIndex()
{
  return MEMORY[0x1E0CFFE80]();
}

uint64_t writeCommand()
{
  return MEMORY[0x1E0CFFE88]();
}

uint64_t writeCommandToReserved()
{
  return MEMORY[0x1E0CFFE90]();
}

