uint64_t MSGetTrackListBorderColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.899999976, 1.0);
}

uint64_t MSGetTrackListEvenRowColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.866666667, 0.870588235, 0.878431373, 1.0);
}

uint64_t MSGetTrackListOddRowColor()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.796078431, 0.8, 0.811764706, 1.0);
}

Class initAMPOnboardingViewController()
{
  Class result;

  if (AMPCoreUILibrary_sOnce != -1)
    dispatch_once(&AMPCoreUILibrary_sOnce, &__block_literal_global);
  result = objc_getClass("AMPOnboardingViewController");
  classAMPOnboardingViewController = (uint64_t)result;
  getAMPOnboardingViewControllerClass = AMPOnboardingViewControllerFunction;
  return result;
}

uint64_t AMPOnboardingViewControllerFunction()
{
  return classAMPOnboardingViewController;
}

Class initAMPOnboardingFeature()
{
  Class result;

  if (AMPCoreUILibrary_sOnce != -1)
    dispatch_once(&AMPCoreUILibrary_sOnce, &__block_literal_global);
  result = objc_getClass("AMPOnboardingFeature");
  classAMPOnboardingFeature = (uint64_t)result;
  getAMPOnboardingFeatureClass = AMPOnboardingFeatureFunction;
  return result;
}

uint64_t AMPOnboardingFeatureFunction()
{
  return classAMPOnboardingFeature;
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t ISWeakLinkedClassForString()
{
  return MEMORY[0x24BEC8B50]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t SUCopyLocalizedReviewsStringForCount()
{
  return MEMORY[0x24BEC8E58]();
}

uint64_t SUCopyProgressStringForSeconds()
{
  return MEMORY[0x24BEC8E60]();
}

uint64_t SUItemTypeIsMediaType()
{
  return MEMORY[0x24BEC8E80]();
}

uint64_t SUPositionEqualToPosition()
{
  return MEMORY[0x24BEC8E98]();
}

uint64_t SUTableCellGetCleanColor()
{
  return MEMORY[0x24BEC8EE0]();
}

uint64_t SUTableCellGetExplicitColor()
{
  return MEMORY[0x24BEC8EE8]();
}

uint64_t SUTableCellGetHighlightedTextColor()
{
  return MEMORY[0x24BEC8EF0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BDF7CC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

