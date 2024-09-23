void sub_22D90CF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D90D378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getAMSUIOnboardingViewControllerClass()
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
  v0 = (void *)getAMSUIOnboardingViewControllerClass_softClass;
  v7 = getAMSUIOnboardingViewControllerClass_softClass;
  if (!getAMSUIOnboardingViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAMSUIOnboardingViewControllerClass_block_invoke;
    v3[3] = &unk_24F966CF8;
    v3[4] = &v4;
    __getAMSUIOnboardingViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D90D434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D90D818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  id *v37;

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getAMSUIOnboardingViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesUILibrary();
  result = objc_getClass("AMSUIOnboardingViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSUIOnboardingViewControllerClass_block_invoke_cold_1();
  getAMSUIOnboardingViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AppleMediaServicesUILibrary()
{
  void *v0;

  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
    AppleMediaServicesUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getAMSUIOnboardingFeatureClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesUILibrary();
  result = objc_getClass("AMSUIOnboardingFeature");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSUIOnboardingFeatureClass_block_invoke_cold_1();
  getAMSUIOnboardingFeatureClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getOBPrivacyLinkControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getOBPrivacyLinkControllerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("OBPrivacyLinkController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getOBPrivacyLinkControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D90E7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVAudioSessionClass()
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
  v0 = (void *)getAVAudioSessionClass_softClass;
  v7 = getAVAudioSessionClass_softClass;
  if (!getAVAudioSessionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAVAudioSessionClass_block_invoke;
    v3[3] = &unk_24F966CF8;
    v3[4] = &v4;
    __getAVAudioSessionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D90F54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D90FA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getAVPlayerItemClass_block_invoke(uint64_t a1)
{
  Class result;

  AVFoundationLibrary();
  result = objc_getClass("AVPlayerItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAVPlayerItemClass_block_invoke_cold_1();
  getAVPlayerItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AVFoundationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AVFoundationLibraryCore_frameworkLibrary)
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AVFoundationLibraryCore_frameworkLibrary;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAVPlayerViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AVKitLibraryCore_frameworkLibrary)
  {
    AVKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AVKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getAVPlayerViewControllerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("AVPlayerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getAVPlayerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVPlayerClass_block_invoke(uint64_t a1)
{
  Class result;

  AVFoundationLibrary();
  result = objc_getClass("AVPlayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAVPlayerClass_block_invoke_cold_1();
  getAVPlayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAVAudioSessionClass_block_invoke(uint64_t a1)
{
  Class result;

  AVFoundationLibrary();
  result = objc_getClass("AVAudioSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAVAudioSessionClass_block_invoke_cold_1();
  getAVAudioSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D91202C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D9128B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

Class initPKPaymentPass()
{
  Class result;

  if (PassKitCoreLibrary_sOnce != -1)
    dispatch_once(&PassKitCoreLibrary_sOnce, &__block_literal_global_25);
  result = objc_getClass("PKPaymentPass");
  classPKPaymentPass = (uint64_t)result;
  getPKPaymentPassClass = (uint64_t (*)())PKPaymentPassFunction;
  return result;
}

id PKPaymentPassFunction()
{
  return (id)classPKPaymentPass;
}

Class initPKPassLibrary()
{
  Class result;

  if (PassKitCoreLibrary_sOnce != -1)
    dispatch_once(&PassKitCoreLibrary_sOnce, &__block_literal_global_25);
  result = objc_getClass("PKPassLibrary");
  classPKPassLibrary = (uint64_t)result;
  getPKPassLibraryClass = (uint64_t (*)())PKPassLibraryFunction;
  return result;
}

id PKPassLibraryFunction()
{
  return (id)classPKPassLibrary;
}

void sub_22D9134AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKVirtualCardClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PassKitCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getPKVirtualCardClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("PKVirtualCard");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getPKVirtualCardClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAMSUIOnboardingViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAMSUIOnboardingFeatureClass_block_invoke_cold_1(v0);
}

void __getAMSUIOnboardingFeatureClass_block_invoke_cold_1()
{
  abort_report_np();
  __getOBPrivacyLinkControllerClass_block_invoke_cold_1();
}

void __getOBPrivacyLinkControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[AMPUserNotificationContentViewController observeValueForKeyPath:ofObject:change:context:].cold.1(v0);
}

void __getAVPlayerItemClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAVPlayerViewControllerClass_block_invoke_cold_1(v0);
}

void __getAVPlayerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAVPlayerClass_block_invoke_cold_1(v0);
}

void __getAVPlayerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAVAudioSessionClass_block_invoke_cold_1(v0);
}

void __getAVAudioSessionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getPKVirtualCardClass_block_invoke_cold_1(v0);
}

void __getPKVirtualCardClass_block_invoke_cold_1()
{
  CGAffineTransform *v0;
  CGFloat v1;
  CGFloat v2;

  abort_report_np();
  CGAffineTransformMakeScale(v0, v1, v2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t SSFileLog()
{
  return MEMORY[0x24BEB24D8]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

