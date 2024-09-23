id EDDisplayIdentifierForWindowScene(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "screen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "hardwareIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)EDEmbeddedDisplayIdentifier;
  v5 = v3;

  return v5;
}

void sub_2295AF4D0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 80));
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

double ColorMakeWithColor(void *a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0.0;
  v3 = 0;
  v4 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v2, &v3, &v4, 0);
  return v2;
}

double ColorCombineColors(double a1, double a2, double a3, double a4)
{
  return a1 + a4;
}

double ColorDivide(double a1, double a2, double a3, double a4)
{
  return a1 / a4;
}

BOOL ColorEqualToColor(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 == a4 && a2 == a5 && a3 == a6;
}

BOOL ColorApproxEqualToColor(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return vabdd_f64(a1, a4) < a7 && vabdd_f64(a2, a5) < a7 && vabdd_f64(a3, a6) < a7;
}

double ColorDistanceToColor(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return sqrt((a2 - a5) * (a2 - a5) + (a1 - a4) * (a1 - a4) + (a3 - a6) * (a3 - a6));
}

uint64_t ColorUIColor(double a1, double a2, double a3)
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", a1, a2, a3, 1.0);
}

BOOL EDLensPositionIsCorner(uint64_t a1)
{
  return (unint64_t)(a1 - 5) < 4;
}

BOOL EDLensPositionIsEdge(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 8;
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count)
{
  MEMORY[0x24BDBE110](c, points, count);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
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

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x24BEB0C80]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

uint64_t _UIRenderDisplay()
{
  return MEMORY[0x24BDF8170]();
}

uint64_t _UIRenderingBufferCreate()
{
  return MEMORY[0x24BDF8178]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

