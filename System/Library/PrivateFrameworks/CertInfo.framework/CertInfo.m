__CFString *_stringValueForPropertyDictionary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;
  char *v6;
  int v7;
  int v8;
  unint64_t v9;
  UInt8 *v10;
  __CFString *v11;
  unint64_t v12;
  UInt8 *v13;
  char v14;
  _BYTE v16[2048];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BDE9480]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BDE9488]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDE9498]))
  {
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v3, 1, 1);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    v11 = v4;
    goto LABEL_18;
  }
  if (!objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDE9490]))
  {
    if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDE94B0]))
    {
      objc_msgSend(v3, "absoluteString");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = v3;
    }
    goto LABEL_17;
  }
  v5 = objc_retainAutorelease(v3);
  v6 = (char *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  v8 = v7;
  v9 = (3 * v7);
  if (v9 < 0x801)
  {
    v10 = v16;
    goto LABEL_10;
  }
  v10 = (UInt8 *)malloc_type_malloc((3 * v7), 0x100004077774924uLL);
  if (v10)
  {
LABEL_10:
    if (v8)
    {
      v12 = 0;
      do
      {
        v13 = &v10[v12];
        *v13 = a0123456789abcd[(unint64_t)*v6 >> 4];
        v14 = *v6++;
        v13[1] = a0123456789abcd[v14 & 0xF];
        v12 += 3;
        v13[2] = 32;
      }
      while (v12 < v9);
    }
    v11 = (__CFString *)CFStringCreateWithBytes(0, v10, v9, 0x600u, 0);
    if (v10 != v16)
      free(v10);
    goto LABEL_15;
  }
  v11 = 0;
LABEL_15:

LABEL_18:
  return v11;
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDAB8](space, pattern, components);
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBA0](baseSpace);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
  MEMORY[0x24BDBDFC8](c, components);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetPatternPhase(CGContextRef c, CGSize phase)
{
  MEMORY[0x24BDBE050](c, (__n128)phase, *(__n128 *)&phase.height);
}

uint64_t CGPatternCreateWithImage2()
{
  return MEMORY[0x24BDBEF60]();
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

uint64_t SecCertificateCopyIssuerSummary()
{
  return MEMORY[0x24BDE8880]();
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x24BDE88B8]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x24BDE88F8](certificate);
}

uint64_t SecCertificateIsSelfSignedCA()
{
  return MEMORY[0x24BDE8960]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x24BDE8970]();
}

uint64_t SecTrustCopyDetailedPropertiesAtIndex()
{
  return MEMORY[0x24BDE8D98]();
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x24BDE8DF8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x24BDE8E00](trust);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

