void sub_2199524D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219952628(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_219952804(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

BOOL NCIsValidWidgetDisplayMode(unint64_t a1)
{
  return a1 < 2;
}

const __CFString *NCStringFromWidgetDisplayMode(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("[Unknown]");
  if (a1 == 1)
    v1 = CFSTR("NCWidgetDisplayModeExpanded");
  if (a1)
    return v1;
  else
    return CFSTR("NCWidgetDisplayModeCompact");
}

const __CFString *NCStringFromWidgetVisibilityState(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("[Unknown]");
  if (a1 == 1)
    v1 = CFSTR("NCWidgetVisibilityStateForeground");
  if (a1)
    return v1;
  else
    return CFSTR("NCWidgetVisibilityStateBackground");
}

void sub_219953F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 224), 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose((const void *)(v37 - 128), 8);
  _Block_object_dispose((const void *)(v37 - 96), 8);
  _Block_object_dispose((const void *)(v37 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t SanitizedClientFrameFromHostSize(double a1, double a2, double a3, double a4, double a5, double a6)
{
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double Width;
  double v13;
  CGFloat v14;
  CGRect v16;
  CGRect v17;

  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = fmax(a1 - a4 - a6, 0.0);
  if (a1 <= v8)
    v9 = a1;
  else
    v9 = v8;
  v10 = fmax(a2 - a3 - a5, 0.0);
  if (a2 <= v10)
    v11 = a2;
  else
    v11 = v10;
  v16.origin.x = *(CGFloat *)MEMORY[0x24BDBF090];
  v16.origin.y = *(CGFloat *)(MEMORY[0x24BDBF090] + 8);
  v16.size.width = v9;
  v16.size.height = v11;
  Width = CGRectGetWidth(v16);
  v13 = fmax(a4, 0.0);
  if (Width <= v13)
    v14 = Width;
  else
    v14 = v13;
  v17.origin.x = v14;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  CGRectGetHeight(v17);
  NCMainScreenScale();
  return UIRectIntegralWithScale();
}

void sub_2199551F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2199557E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219955C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2199566D8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,__int128 buf)
{
  uint64_t v23;
  id v24;
  NSObject *v25;
  uint64_t v26;

  if (a2 == 1)
  {
    v24 = objc_begin_catch(a1);
    v25 = NCLogWidgets;
    if (os_log_type_enabled((os_log_t)NCLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(v23 + 32);
      LODWORD(buf) = 138543618;
      *(_QWORD *)((char *)&buf + 4) = v26;
      WORD6(buf) = 2114;
      *(_QWORD *)((char *)&buf + 14) = v24;
      _os_log_impl(&dword_219951000, v25, OS_LOG_TYPE_DEFAULT, "Encountered exception attempting to encode layer tree (layer=%{public}@): %{public}@", (uint8_t *)&buf, 0x16u);
    }
    objc_end_catch();
    JUMPOUT(0x219956570);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_2199576B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_219957F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void NCSwizzleClassMethod(objc_class *a1, const char *a2, const char *a3)
{
  objc_method *ClassMethod;
  objc_method *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  ClassMethod = class_getClassMethod(a1, a2);
  if (!ClassMethod)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void NCSwizzleClassMethod(__unsafe_unretained Class, SEL, SEL)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NCUtilities.m"), 15, CFSTR("Could not obtain method for selector '%@'"), v10);

  }
  v7 = class_getClassMethod(a1, a3);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void NCSwizzleClassMethod(__unsafe_unretained Class, SEL, SEL)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NCUtilities.m"), 17, CFSTR("Could not obtain method for selector '%@'"), v13);

  }
  method_exchangeImplementations(ClassMethod, v7);
}

double NCMainScreenScale()
{
  if (NCMainScreenScale_onceToken != -1)
    dispatch_once(&NCMainScreenScale_onceToken, &__block_literal_global);
  return *(double *)&NCMainScreenScale___mainScreenScale;
}

void NCRegisterWidgetsLogging()
{
  if (NCRegisterWidgetsLogging_onceToken != -1)
    dispatch_once(&NCRegisterWidgetsLogging_onceToken, &__block_literal_global_0);
}

uint64_t CAMLEncodeLayerTreeToPathWithOptions()
{
  return MEMORY[0x24BDE54F0]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGRect CGRectFromString(NSString *string)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDF65B0](string);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
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

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BDF7290]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x24BDF7668](lhs, rhs);
}

UIEdgeInsets UIEdgeInsetsFromString(NSString *string)
{
  double v1;
  double v2;
  double v3;
  double v4;
  UIEdgeInsets result;

  MEMORY[0x24BDF76F8](string);
  result.right = v4;
  result.bottom = v3;
  result.left = v2;
  result.top = v1;
  return result;
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BDF7CF0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BDF7CF8]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x24BDF7D00]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle()
{
  return MEMORY[0x24BE64078]();
}

uint64_t _MTInternalVibrancyEffectStyleForPublicStyle()
{
  return MEMORY[0x24BE64080]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCE90](cls, name);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x24BDADEF0](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x24BEDCF28](m1, m2);
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

