@implementation NSObject(CAMLWriter)

- (BOOL)CAMLTypeSupportedForKey:()CAMLWriter
{
  return objc_msgSend(a1, "CAMLTypeForKey:") != 0;
}

- (const)CAMLType
{
  CFTypeID v1;
  uint64_t v3;
  objc_class *v4;

  v1 = CFGetTypeID(a1);
  if (v1 == CGColorGetTypeID())
    return CFSTR("CGColor");
  if (v1 == CGImageGetTypeID())
    return CFSTR("CGImage");
  if (v1 == CGImageSourceGetTypeID())
    return CFSTR("CGImageSource");
  if (v1 == CGPDFDocumentGetTypeID())
    return CFSTR("CGPDFDocument");
  if (v1 == CGPathGetTypeID())
    return CFSTR("CGPath");
  v3 = CABackingStoreGetTypeID::type;
  if (!CABackingStoreGetTypeID::type)
  {
    v3 = _CFRuntimeRegisterClass();
    CABackingStoreGetTypeID::type = v3;
  }
  if (v1 == v3)
    return CFSTR("CATintedImage");
  v4 = (objc_class *)objc_opt_class();
  return (const __CFString *)NSStringFromClass(v4);
}

- (void)encodeWithCAMLWriter:()CAMLWriter
{
  CGColor *v4;
  CFTypeID v5;
  uint64_t Image;
  uint64_t v7;
  CFStringRef v8;
  CFStringRef v9;
  CFStringRef v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  CGColorSpace *v14;
  CFStringRef v15;
  CFStringRef v16;
  CFStringRef v17;
  uint64_t v18;
  CATintedImage *v19;
  id v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v4 = a1;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = CFGetTypeID(a1);
  if (v5 == CGColorGetTypeID())
  {
    v23 = 0u;
    v24 = 0u;
    memset(&v22, 0, sizeof(v22));
    if (CGColorGetPattern(v4))
    {
      Image = CGPatternGetImage();
      if (Image)
      {
        v7 = objc_msgSend(a3, "URLStringForResource:", Image);
        if (v7)
          objc_msgSend(a3, "setElementAttribute:forKey:", v7, CFSTR("src"));
      }
      CGPatternGetMatrix();
      v21 = v22;
      if (!CGAffineTransformIsIdentity(&v21))
      {
        v8 = CACreateStringWithDoubleArray((uint64_t)&v22, 6uLL, 1.0e-12);
        if (v8)
        {
          v9 = v8;
          v10 = CFStringCreateWithFormat(0, 0, CFSTR("matrix(%@)"), v8);
          objc_msgSend(a3, "setElementAttribute:forKey:", v10, CFSTR("matrix"));
          CFRelease(v10);
LABEL_29:
          CFRelease(v9);
        }
      }
    }
    else
    {
      v14 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
      CA_CGColorGetRGBComponents(v4, v14, (CGFloat *)&v23);
      if (*((double *)&v24 + 1) != 1.0)
      {
        v15 = CACreateStringWithDoubleArray((uint64_t)&v24 + 8, 1uLL, 0.001);
        if (v15)
        {
          v16 = v15;
          objc_msgSend(a3, "setElementAttribute:forKey:", v15, CFSTR("opacity"));
          CFRelease(v16);
        }
      }
      v17 = CACreateStringWithDoubleArray((uint64_t)&v23, 3uLL, 0.001);
      if (v17)
      {
        v9 = v17;
        objc_msgSend(a3, "setElementContent:", v17);
        goto LABEL_29;
      }
    }
  }
  else if (v5 == CGImageGetTypeID())
  {
    if (v4)
    {
      v11 = CA_CGImageIsA8(v4);
      if (v11)
        v4 = CA_copyA8CGImageAsL8(v4);
      v12 = objc_msgSend(a3, "URLStringForResource:", v4);
      if (v12)
      {
        objc_msgSend(a3, "setElementAttribute:forKey:", v12, CFSTR("src"));
        if (v11)
          objc_msgSend(a3, "setElementAttribute:forKey:", CFSTR("1"), CFSTR("A8asL8"));
        CGImageGetColorSpace(v4);
        if (CGColorSpaceContainsFlexGTCInfo())
          objc_msgSend(a3, "setElementAttribute:forKey:", CFSTR("1"), CFSTR("loadAsHDR"));
      }
      if (v11)
        CGImageRelease(v4);
    }
  }
  else if (v5 == CGImageSourceGetTypeID() || v5 == CGPDFDocumentGetTypeID())
  {
    v13 = objc_msgSend(a3, "URLStringForResource:", v4);
    if (v13)
      objc_msgSend(a3, "setElementAttribute:forKey:", v13, CFSTR("src"));
  }
  else if (v5 == CGPathGetTypeID())
  {
    v20 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    CGPathApply(v4, v20, (CGPathApplierFunction)path_callback);
    objc_msgSend(a3, "setElementContent:", v20);

  }
  else
  {
    v18 = CABackingStoreGetTypeID::type;
    if (!CABackingStoreGetTypeID::type)
    {
      v18 = _CFRuntimeRegisterClass();
      CABackingStoreGetTypeID::type = v18;
    }
    if (v5 == v18)
    {
      v19 = +[CATintedImage tintedImageWithCABackingStore:](CATintedImage, "tintedImageWithCABackingStore:", v4);
      if (-[CATintedImage image](v19, "image"))
        -[CATintedImage encodeWithCAMLWriter:](v19, "encodeWithCAMLWriter:", a3);
    }
  }
}

- (uint64_t)CAMLTypeForKey:()CAMLWriter
{
  return 0;
}

@end
