void sub_22D9A3BC8()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v0 = 0;
    _os_log_debug_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "#locationButton xpc service(locationUI) Interrupted", v0, 2u);
  }
}

void sub_22D9A3C24()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v0 = 0;
    _os_log_debug_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "#locationButton xpc service(locationUI) Invalidated", v0, 2u);
  }
}

void sub_22D9A3C80(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_error_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "#locationButton Error with proxy, error: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_22D9A4254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(a9);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void sub_22D9A42A8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  _QWORD *WeakRetained;
  __n128 v9;
  __n128 v10;
  void *v11;
  const char *v12;
  __n128 v13;
  __n128 v14;
  int hasDifferentColorAppearanceComparedToTraitCollection;
  const char *v16;
  __n128 v17;
  __n128 v18;
  void *v19;
  void *v20;
  const char *v21;
  __n128 v22;
  __n128 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  __n128 v28;
  __n128 v29;
  void *v30;
  const char *v31;
  __n128 v32;
  __n128 v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  __n128 v37;
  __n128 v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend_traitCollection(v5, v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    hasDifferentColorAppearanceComparedToTraitCollection = objc_msgSend_hasDifferentColorAppearanceComparedToTraitCollection_(v6, v12, v13, v14, v11);

    if (hasDifferentColorAppearanceComparedToTraitCollection)
    {
      v19 = (void *)WeakRetained[59];
      objc_msgSend_traitCollection(v5, v16, v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resolvedColorWithTraitCollection_(v19, v21, v22, v23, v20);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)WeakRetained[61];
      WeakRetained[61] = v24;

      v26 = (void *)WeakRetained[60];
      objc_msgSend_traitCollection(v5, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_resolvedColorWithTraitCollection_(v26, v31, v32, v33, v30);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)WeakRetained[62];
      WeakRetained[62] = v34;

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_traitCollection(v5, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = WeakRetained[61];
        v41 = WeakRetained[62];
        v42 = 138412802;
        v43 = v39;
        v44 = 2112;
        v45 = v40;
        v46 = 2112;
        v47 = v41;
        _os_log_debug_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "#locationButton traitCollection: %@ backgroundColor:%@ tintColor:%@", (uint8_t *)&v42, 0x20u);

      }
    }
  }

}

void sub_22D9A4468(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  const char *v9;
  __n128 v10;
  __n128 v11;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend__yieldSlotViewContentForLayerContextID_slotStyle_withYieldBlock_(WeakRetained, v9, v10, v11, a2, v8, v7);

}

void sub_22D9A4BA4(uint64_t a1, const char *a2, __n128 a3, __n128 a4)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  __n128 v11;
  __n128 v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend_locationUIProxy(*(void **)(a1 + 32), a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_22D9A4C50;
  v13[3] = &unk_24F97D808;
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 72);
  v14 = *(id *)(a1 + 64);
  objc_msgSend_getRemoteContentForStyle_layerContext_tag_sandboxExtension_completionHandler_(v5, v10, v11, v12, v6, v9, v7, v8, v13);

}

void sub_22D9A4C50(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = sub_22D9A4D2C;
    v4[3] = &unk_24F97D7E0;
    v6 = *(id *)(a1 + 32);
    v5 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_22D9A2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Error: #locationButton remote-imaging suspended. RemoteSlotContent is null", buf, 2u);
  }

}

uint64_t sub_22D9A4D2C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_22D9A54A8(uint64_t a1, void *a2)
{
  const char *v2;
  __n128 v3;
  __n128 v4;
  const char *v5;
  __n128 v6;
  __n128 v7;
  id v8;

  v8 = a2;
  objc_msgSend_setAccessibilityContrast_(v8, v2, v3, v4, 0);
  objc_msgSend_setAccessibilityButtonShapes_(v8, v5, v6, v7, 0);

}

double sub_22D9A5830(void *a1, void *a2, double a3)
{
  id v5;
  const char *v6;
  __n128 v7;
  __n128 v8;
  const char *v9;
  __n128 v10;
  __n128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v25 = 0.0;
  v26 = 0.0;
  v24 = 0.0;
  v5 = a2;
  objc_msgSend_getRed_green_blue_alpha_(a1, v6, v7, v8, &v26, &v25, &v24, 0);
  v22 = 0.0;
  v23 = 0.0;
  v21 = 0.0;
  objc_msgSend_getRed_green_blue_alpha_(v5, v9, v10, v11, &v23, &v22, &v21, 0);

  v12 = (1.0 - a3) * v23 + v26 * a3;
  v13 = v24;
  v14 = (1.0 - a3) * v22 + v25 * a3;
  v15 = (1.0 - a3) * v21;
  if (v12 <= 0.03928)
    v16 = v12 / 12.92;
  else
    v16 = pow((v12 + 0.055) / 1.055, 2.4);
  v17 = v15 + v13 * a3;
  if (v14 <= 0.03928)
    v18 = v14 / 12.92;
  else
    v18 = pow((v14 + 0.055) / 1.055, 2.4);
  if (v17 <= 0.03928)
    v19 = v17 / 12.92;
  else
    v19 = pow((v17 + 0.055) / 1.055, 2.4);
  return v18 * 0.7152 + v16 * 0.2126 + v19 * 0.0722;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x24BDBBA70]();
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x24BDBDFA0](c, alpha);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEB0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47B0](descriptor, matrix, size);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x24BDC4850]();
}

CGFloat CTFontGetSize(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC4908](font);
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t UISLocalizedStringForSecureName()
{
  return MEMORY[0x24BEBEC70]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

