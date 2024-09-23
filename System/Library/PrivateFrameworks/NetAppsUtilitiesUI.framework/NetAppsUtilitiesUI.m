BOOL NACGFloatGreaterThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16 || a1 > a2;
}

uint64_t NAStringFromCGPoint(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2);
}

uint64_t NAStringFromCGSize(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2);
}

id NAStringFromCGRect(double a1, double a2, double a3, double a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a1, 17, *(_QWORD *)&a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a3, 17, *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("{%@, %@}"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL NACGFloatIsZero(double a1)
{
  return fabs(a1) < 2.22044605e-16;
}

BOOL NACGFloatIsOne(double a1)
{
  return fabs(a1 + -1.0) < 2.22044605e-16;
}

BOOL NACGFloatEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

BOOL NACGFloatLessThanFloat(double a1, double a2)
{
  float v2;
  float v3;

  if (a1 >= a2)
    return 0;
  v2 = a1;
  v3 = a2;
  return vabds_f32(v2, v3) >= 0.00000011921;
}

BOOL NACGFloatLessThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16 || a1 < a2;
}

BOOL NACGFloatGreaterThanFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) >= 2.22044605e-16 && a1 > a2;
}

double NACGFloatCeilForScale(double a1, double a2)
{
  double v3;

  if (fabs(a2) < 2.22044605e-16)
  {
    +[NAUIDeviceUtilities mainScreenScale](NAUIDeviceUtilities, "mainScreenScale");
    a2 = v3;
  }
  return ceil(a2 * a1) / a2;
}

double NACGFloatPowerOf2Ceil(double a1)
{
  double result;
  uint64_t v3;
  uint64_t v4;

  result = 0.0;
  if (a1 > 0.0)
  {
    v3 = vcvtpd_u64_f64(a1);
    if ((v3 & (v3 - 1)) != 0)
    {
      do
      {
        v4 = v3;
        v3 &= v3 - 1;
      }
      while (v3);
      v3 = 2 * v4;
    }
    return (double)(unint64_t)v3;
  }
  return result;
}

double NACGFloatEpsilon()
{
  return 2.22044605e-16;
}

double NACGFloatByLinearlyInterpolatingFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

BOOL NAUICurrentContentSizeCategoryIsLargerThanOrEqualToCategory(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __NAUICurrentContentSizeCategoryIsLargerThanOrEqualToCategory_block_invoke;
    v8[3] = &unk_24D612590;
    v9 = v3;
    v11 = &v12;
    v10 = v5;
    NAUIEnumerateContentSizeCategoriesInIncreasingOrder(1, 1, v8);
    v6 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void sub_216CEFE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void NAUIEnumerateContentSizeCategoriesInIncreasingOrder(int a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v5 = a3;
  if (NAUIEnumerateContentSizeCategoriesInIncreasingOrder_onceToken != -1)
    dispatch_once(&NAUIEnumerateContentSizeCategoriesInIncreasingOrder_onceToken, &__block_literal_global);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v6 = MEMORY[0x24BDAC760];
  if (!a1)
    goto LABEL_5;
  v7 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_smallerThanDefaultSizes;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_2;
  v17[3] = &unk_24D6125B8;
  v18 = v5;
  v19 = &v20;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);

  if (!*((_BYTE *)v21 + 24))
  {
LABEL_5:
    v8 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_normalSizes;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_3;
    v14[3] = &unk_24D6125B8;
    v9 = v5;
    v15 = v9;
    v16 = &v20;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

    if (!*((_BYTE *)v21 + 24) && a2)
    {
      v10 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_accessibilitySizes;
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_4;
      v11[3] = &unk_24D6125B8;
      v12 = v9;
      v13 = &v20;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

    }
  }
  _Block_object_dispose(&v20, 8);

}

void sub_216CEFFF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

const __CFString *NAUIShortDescriptionFromUIContentSizeCategory(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7690]) & 1) != 0)
  {
    v2 = CFSTR("xSM");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF76B8]) & 1) != 0)
  {
    v2 = CFSTR("SM");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF76A8]) & 1) != 0)
  {
    v2 = CFSTR("M");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF76A0]) & 1) != 0)
  {
    v2 = CFSTR("L");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7688]) & 1) != 0)
  {
    v2 = CFSTR("XL");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7680]) & 1) != 0)
  {
    v2 = CFSTR("XXL");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7678]) & 1) != 0)
  {
    v2 = CFSTR("XXXL");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7660]) & 1) != 0)
  {
    v2 = CFSTR("AX-M");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7658]) & 1) != 0)
  {
    v2 = CFSTR("AX-L");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7650]) & 1) != 0)
  {
    v2 = CFSTR("AX-XL");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7648]) & 1) != 0)
  {
    v2 = CFSTR("AX-XXL");
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7640]))
  {
    v2 = CFSTR("AX-XXXL");
  }
  else
  {
    v2 = CFSTR("??");
  }

  return v2;
}

const __CFString *NAUIStringFromLayoutAttribute(unint64_t a1)
{
  if (a1 > 0x14)
    return CFSTR("NSLayoutAttribute(?)");
  else
    return off_24D612628[a1];
}

void sub_216CF1450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216CF14CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double UIScreenPixelHeight()
{
  void *v0;
  double v1;
  double v2;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = 1.0 / v1;

  return v2;
}

id NAUILayoutMetricsForUIEdgeInsetsNamed(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  UIEdgeInsetKeyNamed(v9, CFSTR("top"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  UIEdgeInsetKeyNamed(v9, CFSTR("bottom"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  UIEdgeInsetKeyNamed(v9, CFSTR("left"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  UIEdgeInsetKeyNamed(v9, CFSTR("right"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[3] = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id UIEdgeInsetKeyNamed(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

void sub_216CF1F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_216CF2124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL NAUIIsCJKCharacter()
{
  return uscript_hasScript()
      || uscript_hasScript()
      || uscript_hasScript()
      || uscript_hasScript()
      || uscript_hasScript() != 0;
}

id NSStringFromUIInterfaceOrientationMask(char a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 0x10) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("landscape-left"));
    if ((a1 & 8) == 0)
    {
LABEL_3:
      if ((a1 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v3, "addObject:", CFSTR("portrait"));
      if ((a1 & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("landscape-right"));
  if ((a1 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a1 & 4) != 0)
LABEL_5:
    objc_msgSend(v3, "addObject:", CFSTR("portrait-upside-down"));
LABEL_6:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id NSStringFromUIInterfaceOrientation(char a1)
{
  return NSStringFromUIInterfaceOrientationMask(1 << a1);
}

void sub_216CF3F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double NARectWithCGSize()
{
  return *MEMORY[0x24BDBEFB0];
}

double NADegreesToRadians(double a1)
{
  return a1 * 0.0174532925;
}

double NARadiansToDegrees(double a1)
{
  return a1 * 57.2957795;
}

double NARadiansFromCGAffineTransform(long double *a1)
{
  return atan2(a1[1], *a1);
}

void sub_216CF5168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x24BDC47A8](*(_QWORD *)&uiType, language, size);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

uint64_t uscript_hasScript()
{
  return MEMORY[0x24BEDC278]();
}

