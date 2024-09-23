uint64_t MTUIIsPadIdiom()
{
  if (MTUIIsPadIdiom_onceToken != -1)
    dispatch_once(&MTUIIsPadIdiom_onceToken, &__block_literal_global_4);
  return MTUIIsPadIdiom_isPadIdiom;
}

double MTUIRoundToPixel(double a1)
{
  if (MTUIMainScreenScale_onceToken != -1)
    dispatch_once(&MTUIMainScreenScale_onceToken, &__block_literal_global_0);
  return round(*(double *)&MTUIMainScreenScale_screenScale * a1) / *(double *)&MTUIMainScreenScale_screenScale;
}

double MTUIFloorToPixel(double a1)
{
  if (MTUIMainScreenScale_onceToken != -1)
    dispatch_once(&MTUIMainScreenScale_onceToken, &__block_literal_global_0);
  return floor(*(double *)&MTUIMainScreenScale_screenScale * a1) / *(double *)&MTUIMainScreenScale_screenScale;
}

double MTUIMainScreenScale()
{
  if (MTUIMainScreenScale_onceToken != -1)
    dispatch_once(&MTUIMainScreenScale_onceToken, &__block_literal_global_0);
  return *(double *)&MTUIMainScreenScale_screenScale;
}

double MTUIStandardizeAngle(double result)
{
  for (; result < 0.0; result = result + 6.28318531)
    ;
  for (; result > 6.28318531; result = result + -6.28318531)
    ;
  return result;
}

id MTImageCache()
{
  if (MTImageCache_onceToken != -1)
    dispatch_once(&MTImageCache_onceToken, &__block_literal_global_276);
  return (id)MTImageCache_imageCache;
}

uint64_t MTUIIsPhoneIdiom()
{
  if (MTUIIsPhoneIdiom_onceToken != -1)
    dispatch_once(&MTUIIsPhoneIdiom_onceToken, &__block_literal_global_1);
  return MTUIIsPhoneIdiom_isPhoneIdiom;
}

BOOL MTUIIsVeryWidePhoneSize()
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "keyWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "frame");
  v3 = v2;
  v5 = v4;

  if (v3 >= v5)
    v6 = v5;
  else
    v6 = v3;
  return v6 > 375.0;
}

BOOL MTUIIsVeryShortPhoneSize()
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "keyWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "frame");
  v3 = v2;
  v5 = v4;

  if (v3 >= v5)
    v6 = v5;
  else
    v6 = v3;
  return v6 < 375.0;
}

BOOL MTUIShouldUseLargePadLayout()
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "keyWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "frame");
  v3 = v2;
  v5 = v4;

  return MTUIShouldUseLargePadLayoutForSize(v3, v5);
}

BOOL MTUIShouldUseLargePadLayoutForSize(double a1, double a2)
{
  double v4;

  if (MTUIIsPadIdiom_onceToken != -1)
    dispatch_once(&MTUIIsPadIdiom_onceToken, &__block_literal_global_4);
  if (a1 >= a2)
    v4 = a2;
  else
    v4 = a1;
  return v4 > 834.0 && MTUIIsPadIdiom_isPadIdiom != 0;
}

BOOL MTUIIsLargeText()
{
  void *v0;
  NSString *v1;
  _BOOL8 IsAccessibilityCategory;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v1);
  return IsAccessibilityCategory;
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x24BDBDE00](c, page);
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
  MEMORY[0x24BDBDF68](c, angle);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x24BDBE080](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEA08](url);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x24BDBEA70](document, pageNumber);
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

void CGPDFPageRelease(CGPDFPageRef page)
{
  MEMORY[0x24BDBEC58](page);
}

CGPDFPageRef CGPDFPageRetain(CGPDFPageRef page)
{
  return (CGPDFPageRef)MEMORY[0x24BDBEC70](page);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return MEMORY[0x24BDC4780]();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x24BDC47A8](*(_QWORD *)&uiType, language, size);
}

uint64_t DateMaskToString()
{
  return MEMORY[0x24BE67748]();
}

uint64_t FormatTime()
{
  return MEMORY[0x24BE67758]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MTLogForCategory()
{
  return MEMORY[0x24BE677C0]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t ResetTimeFormatter()
{
  return MEMORY[0x24BE67890]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BDF7698](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
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

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x24BDF7C80]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

uint64_t _HKCreateURLForSampleType()
{
  return MEMORY[0x24BDD42E8]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x24BDAEFB0](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

