id CRSUIImageViewWithResolver(void *a1)
{
  objc_class *v1;
  void (**v2)(id, void *);
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v1 = (objc_class *)MEMORY[0x24BDF6AD0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerImage:withTraitCollection:", v6, v4);

  v2[2](v2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "registerImage:withTraitCollection:", v7, v5);
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTraitCollection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v9);
  objc_msgSend(v10, "setContentMode:", 2);
  objc_msgSend(v10, "setClipsToBounds:", 1);

  return v10;
}

CRSUICAPackageView *CRSUICAPackageViewWithStatefulPackage(void *a1)
{
  id v1;
  int v2;
  CRSUICAPackageView *v3;
  void *v4;
  CRSUICAPackageView *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v1 = a1;
  v2 = objc_msgSend(v1, "hasDynamicState");
  v3 = [CRSUICAPackageView alloc];
  objc_msgSend(v1, "package");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __CRSUICAPackageViewWithStatefulPackage_block_invoke;
    v8[3] = &unk_24C769700;
    v9 = v1;
    v5 = -[CRSUICAPackageView initWithPackage:dynamicStateProvider:](v3, "initWithPackage:dynamicStateProvider:", v4, v8);

  }
  else
  {
    objc_msgSend(v1, "lightModeState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CRSUICAPackageView initWithPackage:state:](v3, "initWithPackage:state:", v4, v6);

  }
  -[CRSUICAPackageView setContentMode:](v5, "setContentMode:", 2);
  -[CRSUICAPackageView setClipsToBounds:](v5, "setClipsToBounds:", 1);

  return v5;
}

void sub_20D6CE530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v22);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D6CE674(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_20D6CF328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D6CF450(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20D6D1020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D6D1148(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id CRSUILogForCategory(unint64_t a1)
{
  if (a1 >= 7)
    CRSUILogForCategory_cold_1();
  if (CRSUILogForCategory_onceToken != -1)
    dispatch_once(&CRSUILogForCategory_onceToken, &__block_literal_global_4);
  return (id)CRSUILogForCategory_logObjects[a1];
}

void sub_20D6D3BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D6D3D18(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D6D5058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D6D51B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D6D5960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CRSUICarPlayTestAppSetMainScreenCornerMaskImage(void *a1)
{
  void *v1;
  UIImage *image;

  image = a1;
  CFPreferencesAppSynchronize(CFSTR("com.apple.carplay.internal"));
  if (image)
  {
    UIImagePNGRepresentation(image);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(CFSTR("CornerMaskOverrideImage"), v1, CFSTR("com.apple.carplay.internal"));

  }
  else
  {
    CFPreferencesSetAppValue(CFSTR("CornerMaskOverrideImage"), 0, CFSTR("com.apple.carplay.internal"));
  }

}

void CRSUICarPlayTestAppSetClusterScreenCornerMaskImage(void *a1)
{
  void *v1;
  UIImage *image;

  image = a1;
  CFPreferencesAppSynchronize(CFSTR("com.apple.carplay.internal"));
  if (image)
  {
    UIImagePNGRepresentation(image);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(CFSTR("ClusterCornerMaskOverrideImage"), v1, CFSTR("com.apple.carplay.internal"));

  }
  else
  {
    CFPreferencesSetAppValue(CFSTR("ClusterCornerMaskOverrideImage"), 0, CFSTR("com.apple.carplay.internal"));
  }

}

void CRSUICarPlayTestAppSetUISyncDisabled(int a1)
{
  const void *v2;

  CFPreferencesAppSynchronize(CFSTR("com.apple.carplay.internal"));
  if (a1)
    v2 = (const void *)*MEMORY[0x24BDBD270];
  else
    v2 = 0;
  CFPreferencesSetAppValue(CFSTR("UISyncChannelDisabled"), v2, CFSTR("com.apple.carplay.internal"));
}

void sub_20D6D8708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D6D8844(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_20D6DBE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D6DBF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D6DF2A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D6E1004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D6E1D00(_Unwind_Exception *a1)
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
  objc_destroyWeak((id *)(v6 - 152));
  _Unwind_Resume(a1);
}

void CRSUILogForCategory_cold_1()
{
  __assert_rtn("CRSUILogForCategory", "CRSUILogging.m", 14, "category < CRSUILoggingCategoryCount");
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x24BE0BB38]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x24BE0BB58]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x24BE0BB60]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x24BDF8190]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

