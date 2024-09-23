void sub_230C06C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_230C07378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id accessibilityQuickSpeakLocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, 0, CFSTR("QuickSpeak"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_230C0C778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230C0D2D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230C0D9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_230C0EC80()
{
  objc_end_catch();
  JUMPOUT(0x230C0EC88);
}

void sub_230C0F408(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x24BDFDF98]();
}

uint64_t AXInvertColorForColor()
{
  return MEMORY[0x24BDFF9C8]();
}

uint64_t AXLogSpeakSelection()
{
  return MEMORY[0x24BDFE190]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x24BDFE210]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x24BDFE238]();
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

uint64_t AXProcessIsAXUIServer()
{
  return MEMORY[0x24BDFE298]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

uint64_t AXSlightlyDarkerColorForColor()
{
  return MEMORY[0x24BDFF9D8]();
}

uint64_t AXSpeakHighlightColor()
{
  return MEMORY[0x24BDFE390]();
}

uint64_t AXUISentenceTextRangeForInput()
{
  return MEMORY[0x24BDFFA40]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
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

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

uint64_t QSInstallSharedSafeCategoriesIfNeeded()
{
  return MEMORY[0x24BDFFAC0]();
}

uint64_t QSUnionRectsWithRect()
{
  return MEMORY[0x24BDFFAC8]();
}

void UIAccessibilityZoomFocusChanged(UIAccessibilityZoomType type, CGRect frame, UIView *view)
{
  MEMORY[0x24BDF7460](type, view, (__n128)frame.origin, *(__n128 *)&frame.origin.y, (__n128)frame.size, *(__n128 *)&frame.size.height);
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BDFE528]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x24BED20C0]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x24BED22D0]();
}

uint64_t _AXSQuickSpeakEnabled()
{
  return MEMORY[0x24BED23C0]();
}

uint64_t _AXSQuickSpeakHighlightTextEnabled()
{
  return MEMORY[0x24BED23C8]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x24BDFE548]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIApplicationIsWebKitLoaded()
{
  return MEMORY[0x24BDF8098]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BDFE550]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x24BDFE5A8]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BDFE5C0]();
}

uint64_t __UIAccessibilitySetAssociatedObject()
{
  return MEMORY[0x24BDFE608]();
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

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

