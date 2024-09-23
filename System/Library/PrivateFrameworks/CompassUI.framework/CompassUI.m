double bubbleDiameter(double a1)
{
  return round(a1 * 71.0 / 320.0);
}

double currentHeadingLength(double a1)
{
  return round(a1 * 49.5 / 320.0);
}

double compassTicLength(double a1)
{
  return round(a1 * 15.0 / 320.0);
}

double bearingLength(double a1)
{
  return round(a1 * 30.0 / 320.0);
}

double smallCrosshairWidth(double a1)
{
  return round(a1 * 17.0 / 320.0);
}

double crosshairWidth(double a1)
{
  return round(a1 * 120.0 / 320.0);
}

void CGPointRoundToPixel()
{
  if (qword_255972B58 != -1)
    dispatch_once(&qword_255972B58, &unk_24F0D2328);
}

void sub_22825A1F8()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  qword_255972AF0 = v0;

}

double normalizedRotation(double a1, double a2)
{
  double v2;

  if (a2 <= 3.14159265)
  {
    if (a2 < -3.14159265)
      a2 = a2 + 6.28318531;
  }
  else
  {
    a2 = -(6.28318531 - a2);
  }
  v2 = a2 - a1;
  if (a2 - a1 > 3.14159265)
    return a1 - (6.28318531 - v2);
  if (v2 < -3.14159265)
    return v2 + 6.28318531 + a1;
  return a2;
}

void distanceBetweenAngles(double a1, double a2)
{
  fmod(vabdd_f64(a1, a2), 360.0);
}

double RoundHeading(double a1)
{
  return fmod(round(a1), 360.0);
}

double lerp(double a1, double a2, double a3)
{
  return a1 + a3 * (a2 - a1);
}

double ConvertDecimalDegreesToDMS(uint64_t *a1, _QWORD *a2, double *a3, double a4)
{
  uint64_t v4;
  double result;

  if (a1)
  {
    v4 = (uint64_t)a4;
    if ((uint64_t)a4 < 0)
      v4 = -v4;
    *a1 = v4;
  }
  result = fabs((a4 - (double)(uint64_t)a4) * 60.0);
  if (a2)
    *a2 = (uint64_t)result;
  if (a3)
  {
    result = (result - (double)(uint64_t)result) * 60.0;
    *a3 = result;
  }
  return result;
}

void ConvertDegreeSignToString(_QWORD *a1, int a2, double a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  if (a1)
  {
    v5 = (uint64_t)(a3 * 3600.0);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a2)
    {
      if (v5 < 0)
      {
        v8 = CFSTR("cW");
        v9 = CFSTR("W");
      }
      else
      {
        v8 = CFSTR("cE");
        v9 = CFSTR("E");
      }
    }
    else if (v5 < 0)
    {
      v8 = CFSTR("cS");
      v9 = CFSTR("S");
    }
    else
    {
      v8 = CFSTR("cN");
      v9 = CFSTR("N");
    }
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    *a1 = v11;

  }
}

id CreateCoordinateComponentString(int a1, double a2, double a3)
{
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;

  if (a1)
    a2 = a3;
  v3 = fabs((a2 - (double)(uint64_t)a2) * 60.0);
  v4 = (uint64_t)v3;
  v5 = (v3 - (double)(uint64_t)v3) * 60.0;
  if ((uint64_t)a2 >= 0)
    v6 = (uint64_t)a2;
  else
    v6 = -(uint64_t)a2;
  v21 = 0;
  ConvertDegreeSignToString(&v21, a1, a2);
  v7 = v21;
  v8 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringFromNumber:numberStyle:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringFromNumber:numberStyle:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x24BDD17C8]);
  WebLocalizedString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithFormat:", v18, v10, v13, v16, v7, 0);

  return v19;
}

uint64_t StringWithLocationDirection()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v0 = (void *)qword_255972B60;
  if (!qword_255972B60)
  {
    v1 = objc_alloc(MEMORY[0x24BDBCE30]);
    WebLocalizedString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    WebLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WebLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WebLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WebLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WebLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WebLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WebLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, 0);
    v11 = (void *)qword_255972B60;
    qword_255972B60 = v10;

    v0 = (void *)qword_255972B60;
  }
  objc_msgSend(v0, "count");
  return MEMORY[0x24BEDD108](qword_255972B60, sel_objectAtIndex_);
}

id sharedHeadingFormatter()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("CompassHeadingFormatterKey"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v2, "setNumberStyle:", 0);
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setLocale:", v3);

    objc_msgSend(v2, "setNegativePrefix:", CFSTR("−"));
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v2, CFSTR("CompassHeadingFormatterKey"));

  }
  return v2;
}

id compassThinFont70G2()
{
  CTFontRef UIFontForLanguage;
  void *CopyOfSystemUIFontWithGrade;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuItemFontType|0x80, 70.0, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  objc_msgSend(CopyOfSystemUIFontWithGrade, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(UIFontForLanguage);
  CFRelease(CopyOfSystemUIFontWithGrade);
  v17 = *MEMORY[0x24BDF7748];
  v4 = *MEMORY[0x24BDF7778];
  v14[0] = *MEMORY[0x24BDF7780];
  v3 = v14[0];
  v14[1] = v4;
  v15[0] = &unk_24F0D3990;
  v15[1] = &unk_24F0D39A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v12[0] = v3;
  v12[1] = v4;
  v13[0] = &unk_24F0D39C0;
  v13[1] = &unk_24F0D39A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v9, 70.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id compassMediumFont20()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = *MEMORY[0x24BDF7858];
  v1 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7858]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v1, "systemFontOfSize:weight:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_fontScaledLikeTextStyle:maximumPointSize:compatibleWithTraitCollection:forIB:", v0, 0, 0, 26.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

double sub_22825AB70(void *a1)
{
  double v1;

  objc_msgSend(a1, "_scaledValueForValue:");
  return ceil(v1);
}

id sub_22825AB88(void *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

uint64_t sub_22825ABEC()
{
  return 0;
}

double sub_22825ABF4(double a1, uint64_t a2, uint64_t a3, uint64_t *a4, _QWORD *a5, double *a6)
{
  uint64_t v6;
  double result;

  if (a4)
  {
    v6 = (uint64_t)a1;
    if ((uint64_t)a1 < 0)
      v6 = -v6;
    *a4 = v6;
  }
  result = fabs((a1 - (double)(uint64_t)a1) * 60.0);
  if (a5)
    *a5 = (uint64_t)result;
  if (a6)
  {
    result = (result - (double)(uint64_t)result) * 60.0;
    *a6 = result;
  }
  return result;
}

uint64_t sub_22825AD90(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_invalidate);
}

double compassRadius(double a1)
{
  return round(a1 * 100.0 / 320.0);
}

double cardinalLabelRadius(double a1)
{
  return round(a1 * 77.0 / 320.0);
}

double northTriangleRadius(double a1)
{
  return round(a1 * 118.0 / 320.0);
}

double degreeLabelRadius(double a1)
{
  return round(a1 * 133.0 / 320.0);
}

double bearingLabelRadius(double a1)
{
  return round(a1 * 140.0 / 320.0);
}

double bearingInnerRadius(double a1)
{
  return round(a1 * 63.0 / 320.0);
}

double bearingOuterRadius(double a1)
{
  return round(a1 * 92.0 / 320.0);
}

void sub_22825BEA0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CalibrationMultiplier"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v1 = v3;
  }
  else
  {
    v2 = 0;
  }
  qword_255972B68 = v2;

}

void sub_22825D65C(uint64_t a1)
{
  double v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = fmod(*(double *)(a1 + 40) + *(double *)(a1 + 48), 360.0);
    objc_msgSend(WeakRetained, "showTicAtAngle:withCredit:", v2, 1.0);
    objc_msgSend(WeakRetained[126], "setAngle:", v2 * 3.14159265 / 180.0);
  }

}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x24BED84B8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t WebLocalizedString()
{
  return MEMORY[0x24BDFAA20]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
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

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
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

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

