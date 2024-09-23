void sub_235CE8F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_235CE98A0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_235CE9E64(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_235CF76AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
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

id AXAuditLocString(void *a1, uint64_t a2)
{
  return AXAuditLocStringWithValue(a1, a2, &stru_25071BA38);
}

id AXAuditLocStringWithValue(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;

  v5 = a1;
  v6 = a3;
  if (AXAuditLocStringWithValue_onceToken != -1)
    dispatch_once(&AXAuditLocStringWithValue_onceToken, &__block_literal_global_17);
  v7 = CFSTR("LocalizableIOS");
  if (a2 != 1)
    v7 = 0;
  if (a2)
    v8 = (__CFString *)v7;
  else
    v8 = CFSTR("Localizable");
  if (-[__CFString length](v8, "length"))
  {
    objc_msgSend((id)AXAuditLocStringWithValue_myBundle, "localizedStringForKey:value:table:", v5, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t AXAuditAttributeWithPrefixLocStringExists(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;

  v5 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), a2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXAuditLocStringWithValue(v6, 1, CFSTR("KEY NOT FOUND"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("KEY NOT FOUND")))
  {
    if (!a3)
    {
      v10 = 1;
      v8 = v6;
      v9 = v7;
      goto LABEL_11;
    }
    v8 = v6;
    goto LABEL_8;
  }
  v8 = v5;

  AXAuditLocStringWithValue(v8, 1, CFSTR("KEY NOT FOUND"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("KEY NOT FOUND")) & 1) == 0)
  {
    if (!a3)
    {
LABEL_9:
      v10 = 1;
      goto LABEL_11;
    }
    v7 = v9;
LABEL_8:
    v9 = objc_retainAutorelease(v7);
    *a3 = v9;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

id AXAuditAttributeWithPrefixLocString(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v3 = a1;
  v8 = 0;
  LODWORD(a2) = AXAuditAttributeWithPrefixLocStringExists(v3, a2, &v8);
  v4 = v8;
  v5 = v4;
  if (!(_DWORD)a2)
    v4 = v3;
  v6 = v4;

  return v6;
}

BOOL AuditDoesAllowDeveloperAttributes(int pid)
{
  mach_port_name_t v2;

  v2 = 0;
  return task_for_pid(*MEMORY[0x24BDAEC58], pid, &v2) == 0;
}

id iOSFrontmostApp()
{
  void *v0;
  AXUIElementRef SystemWide;
  AXUIElementRef v3;

  objc_msgSend(MEMORY[0x24BDFEA68], "primaryApp");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
    return v0;
  SystemWide = AXUIElementCreateSystemWide();
  if (!SystemWide)
    return 0;
  v3 = SystemWide;
  AXUIElementCopyApplicationAtPosition();
  CFRelease(v3);
  return 0;
}

id AXAuditCurrentApplications()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "systemApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_235CFF6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void updateTimestampOfResults(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v30;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v5);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v6, "caseResults");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v26;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
              v21 = 0u;
              v22 = 0u;
              v23 = 0u;
              v24 = 0u;
              objc_msgSend(v12, "auditIssues");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v22;
                do
                {
                  v17 = 0;
                  do
                  {
                    if (*(_QWORD *)v22 != v16)
                      objc_enumerationMutation(v13);
                    objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17++), "setTimeStamp:", v4);
                  }
                  while (v15 != v17);
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
                }
                while (v15);
              }

              ++v11;
            }
            while (v11 != v9);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v20);
  }

}

void _axNotificationHandler(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v6;

  v6 = a5;
  if (a3 == 1000)
    objc_msgSend(v6, "_screenChangedNotification");

}

uint64_t AXDevicePrimeDisplayManager()
{
  return MEMORY[0x24BDFFFD0]();
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  return MEMORY[0x24BDFE900](observer, element, notification, refcon);
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return MEMORY[0x24BDFE908](*(_QWORD *)&application, callback, outObserver);
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(AXObserverRef observer)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDFE910](observer);
}

AXError AXObserverRemoveNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification)
{
  return MEMORY[0x24BDFE918](observer, element, notification);
}

uint64_t AXUIElementCopyApplicationAtPosition()
{
  return MEMORY[0x24BDFE9C0]();
}

AXUIElementRef AXUIElementCreateSystemWide(void)
{
  return (AXUIElementRef)MEMORY[0x24BDFE9D8]();
}

AXError AXUIElementGetPid(AXUIElementRef element, pid_t *pid)
{
  return MEMORY[0x24BDFE9E0](element, pid);
}

uint64_t AXUIElementRegisterSystemWideServerDeathCallback()
{
  return MEMORY[0x24BDFEA00]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x24BDBDB20]();
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE068](c, red, green, blue, alpha);
}

void CGContextStrokeRectWithWidth(CGContextRef c, CGRect rect, CGFloat width)
{
  MEMORY[0x24BDBE128](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, width);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x24BDD0BE0]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x24BDD0BE8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x24BDD0BF0]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

NSRect NSInsetRect(NSRect aRect, CGFloat dX, CGFloat dY)
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSRect result;

  MEMORY[0x24BDD0DF8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, dX, dY);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return MEMORY[0x24BDD0E28]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x24BDD1260]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BDF78C0]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BDF7920](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t _AXUIElementCreateData()
{
  return MEMORY[0x24BDFED48]();
}

uint64_t _AXUIElementCreateWithData()
{
  return MEMORY[0x24BDFED50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x24BEDD4D0](p, isRequiredMethod, isInstanceMethod, outCount);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x24BDB0160](*(_QWORD *)&target_tport, *(_QWORD *)&pid, t);
}

