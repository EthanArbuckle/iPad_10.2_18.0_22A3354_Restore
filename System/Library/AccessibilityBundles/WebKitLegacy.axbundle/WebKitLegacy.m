void sendNotificationAfterHandlingWebKeyEventIfNeeded(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a1;
  if (_AXSAutomationEnabled())
  {
    objc_msgSend(v5, "characters");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "charactersIgnoringModifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "modifierFlags");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXUIAutomationHandleKeyComplete();

  }
}

void sub_230E45FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230E46374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t axIsSafari()
{
  void *v0;

  if ((axIsSafari_DidCheck & 1) == 0)
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityBundleIdentifier");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    axIsSafari_IsSafari = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

    axIsSafari_DidCheck = 1;
  }
  return axIsSafari_IsSafari;
}

void sub_230E4659C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getWebThreadLockSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!WebKitLegacyLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24FF8ED88;
    v5 = 0;
    WebKitLegacyLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!WebKitLegacyLibraryCore_frameworkLibrary)
    __getWebThreadLockSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)WebKitLegacyLibraryCore_frameworkLibrary, "WebThreadLock");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getWebThreadLockSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void insertChar(__int16 a1, _WORD **a2, _QWORD **a3, CGRect **a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  _WORD *v9;
  _QWORD *v10;
  CGRect *v11;
  double x;
  double y;
  double width;
  double height;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v9 = *a2;
  *v9 = a1;
  *a2 = v9 + 1;
  v10 = *a3;
  *v10 = a7;
  *a3 = v10 + 1;
  x = (*a4)[-1].origin.x;
  y = (*a4)[-1].origin.y;
  width = (*a4)[-1].size.width;
  height = (*a4)[-1].size.height;
  v16 = x - width;
  v17 = y - height;
  v18 = width * 0.5;
  if (a6 == 270)
    v19 = width * 0.5;
  else
    v19 = (*a4)[-1].size.height;
  if (a6 != 270)
    v17 = (*a4)[-1].origin.y;
  if (a6 == 180)
  {
    v19 = (*a4)[-1].size.height;
    v20 = height * 0.5;
  }
  else
  {
    v20 = (*a4)[-1].size.width;
  }
  if (a6 == 180)
    v17 = (*a4)[-1].origin.y;
  else
    v16 = (*a4)[-1].origin.x;
  v21 = x + width;
  v22 = y + height;
  if (a6 != 90)
  {
    v18 = (*a4)[-1].size.height;
    v22 = (*a4)[-1].origin.y;
  }
  if (a6)
    height = v18;
  else
    width = height * 0.5;
  if (a6)
    y = v22;
  else
    x = v21;
  if (a6 > 179)
  {
    height = v19;
    width = v20;
    y = v17;
    x = v16;
  }
  v11 = *a4;
  *v11 = CGRectIntegral(*(CGRect *)&x);
  ++*a4;
  ++*a5;
}

void __getWebThreadLockSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *WebKitLegacyLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UIWebDocumentViewAccessibility.m"), 16, CFSTR("%s"), *a1);

  __break(1u);
  AXFormatInteger();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x24BDFE058]();
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

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BDFE380]();
}

uint64_t AXUIAutomationHandleKeyComplete()
{
  return MEMORY[0x24BEBAD80]();
}

uint64_t AXUIKeyboardWindow()
{
  return MEMORY[0x24BDFFA18]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x24BDBEA68](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x24BDBEA70](document, pageNumber);
}

uint64_t CGPDFPageCopyTextString()
{
  return MEMORY[0x24BDBEBD8]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEBF0](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x24BDBEC18](page);
}

uint64_t CGPDFTextStringGetBBoxForIndex()
{
  return MEMORY[0x24BDBED70]();
}

uint64_t CGPDFTextStringGetCharacterAtIndex()
{
  return MEMORY[0x24BDBED78]();
}

uint64_t CGPDFTextStringGetLength()
{
  return MEMORY[0x24BDBED80]();
}

uint64_t CGPDFTextStringGetPositionForIndex()
{
  return MEMORY[0x24BDBED88]();
}

uint64_t CGPDFTextStringGetTransformForIndex()
{
  return MEMORY[0x24BDBED90]();
}

uint64_t CGPDFTextStringRelease()
{
  return MEMORY[0x24BDBED98]();
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t DDResultGetCategory()
{
  return MEMORY[0x24BE2B2A8]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x24BE2B2E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UIAccessibilitySceneReferencePointToScreenPoint()
{
  return MEMORY[0x24BEBB078]();
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x24BEBB208]();
}

uint64_t WebThreadLock()
{
  return MEMORY[0x24BDFAA38]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BDFE528]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x24BED20C0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

uint64_t uscript_getScript()
{
  return MEMORY[0x24BEDC270]();
}

