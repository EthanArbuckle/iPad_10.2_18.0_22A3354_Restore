@implementation LKCGImageCodingProxy

- (id)decodedObject
{
  return self->_image;
}

- (LKCGImageCodingProxy)initWithCoder:(id)a3
{
  LKCGImageCodingProxy *v5;
  int v6;
  uint64_t *v7;
  const __CFDictionary *v8;
  const __CFData *v9;
  const __CFData *v10;
  CGImageSource *v11;
  CGImageSource *v12;
  CGImageRef v13;
  void *v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[LKCGImageCodingProxy initWithCoder:]::onceToken != -1)
    dispatch_once(&-[LKCGImageCodingProxy initWithCoder:]::onceToken, &__block_literal_global_679);
  v16.receiver = self;
  v16.super_class = (Class)LKCGImageCodingProxy;
  v5 = -[LKCGImageCodingProxy init](&v16, sel_init);
  if (v5)
  {
    if ((objc_msgSend(a3, "containsValueForKey:", CFSTR("loadAsHDR")) & 1) != 0)
    {
      v6 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("loadAsHDR"));
      v7 = &-[LKCGImageCodingProxy initWithCoder:]::dictHDR;
      if (!v6)
        v7 = &-[LKCGImageCodingProxy initWithCoder:]::dictSDR;
      v8 = (const __CFDictionary *)*v7;
    }
    else
    {
      v8 = (const __CFDictionary *)-[LKCGImageCodingProxy initWithCoder:]::dictSDR;
    }
    v9 = (const __CFData *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    if (v9
      && (v10 = v9, (v11 = CGImageSourceCreateWithData(v9, v8)) != 0)
      && (v12 = v11, v5->_image = CGImageSourceCreateImageAtIndex(v11, 0, v8), CFRelease(v12), v5->_image))
    {
      if (objc_msgSend(a3, "containsValueForKey:", CFSTR("A8asL8"))
        && objc_msgSend(a3, "decodeBoolForKey:", CFSTR("A8asL8")))
      {
        v13 = CA_copyL8CGImageAsA8(v5->_image);
        CGImageRelease(v5->_image);
        v5->_image = v13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(a3, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "unarchiver:didReadData:forImage:", a3, v10, v5->_image);
      }
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)LKCGImageCodingProxy;
  -[LKCGImageCodingProxy dealloc](&v3, sel_dealloc);
}

- (LKCGImageCodingProxy)initWithObject:(id)a3
{
  LKCGImageCodingProxy *v4;
  CFTypeID v5;
  uint64_t v6;
  mach_port_t v7;
  __IOSurface *v8;
  __IOSurface *v9;
  __IOSurface *IOSurface;
  CGImageRef cgimage_from_iosurface;
  uint64_t v13;
  __IOSurface *v14;
  __IOSurface *v15;
  uint64_t v16;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)LKCGImageCodingProxy;
  v4 = -[LKCGImageCodingProxy init](&v17, sel_init);
  if (!v4)
    return v4;
  v5 = CFGetTypeID(a3);
  v6 = CAMachPortGetTypeID::type;
  if (!CAMachPortGetTypeID::type)
  {
    v6 = _CFRuntimeRegisterClass();
    CAMachPortGetTypeID::type = v6;
  }
  if (v5 == v6)
  {
    if (a3)
    {
      v7 = *((_DWORD *)a3 + 4);
      if (v7)
      {
        v8 = IOSurfaceLookupFromMachPort(v7);
        if (v8)
        {
          v9 = v8;
          v4->_image = (CGImage *)create_cgimage_from_iosurface(v8);
          CFRelease(v9);
        }
      }
    }
    return v4;
  }
  if (v5 == CVPixelBufferGetTypeID())
  {
    IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)a3);
    if (!IOSurface)
      return v4;
    goto LABEL_14;
  }
  if (v5 == IOSurfaceGetTypeID())
  {
    IOSurface = (__IOSurface *)a3;
LABEL_14:
    cgimage_from_iosurface = (CGImageRef)create_cgimage_from_iosurface(IOSurface);
LABEL_15:
    v4->_image = cgimage_from_iosurface;
    return v4;
  }
  v13 = CAImageQueueGetTypeID::type;
  if (!CAImageQueueGetTypeID::type)
  {
    v13 = _CFRuntimeRegisterClass();
    CAImageQueueGetTypeID::type = v13;
  }
  if (v5 != v13)
  {
    cgimage_from_iosurface = CGImageRetain((CGImageRef)a3);
    goto LABEL_15;
  }
  v14 = CAImageQueueCopyLastIOSurface((uint64_t)a3);
  if (v14)
  {
    v15 = v14;
    v16 = create_cgimage_from_iosurface(v14);
    CFRelease(v15);
  }
  else
  {
    v16 = 0;
  }
  v4->_image = (CGImage *)v16;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const __CFString *v4;
  CGImage *image;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  unsigned int v11;
  CGImageDestination *v12;
  CGImageDestination *v13;
  char v14;
  id v15;

  v4 = (const __CFString *)CACodingImageFormat;
  image = self->_image;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(a3, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x186DBE2E4]();
      v8 = (void *)objc_msgSend(v6, "archiver:dataForImage:", a3, image);
      if (v8)
      {
        v15 = v8;
        v9 = v8;
        objc_autoreleasePoolPop(v7);
        objc_msgSend(a3, "encodeObject:forKey:", v15, CFSTR("data"));
        if (!image)
        {

          return;
        }
        goto LABEL_19;
      }
      objc_autoreleasePoolPop(v7);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_msgSend(v6, "archiver:formatForImage:", a3, image);
      if (v10)
        v4 = (const __CFString *)v10;
    }
  }
  v11 = CA_CGImageIsA8(image);
  if (v11)
  {
    image = CA_copyA8CGImageAsL8(image);
    if (!image)
      goto LABEL_23;
  }
  else if (!image)
  {
    return;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v12 = CGImageDestinationCreateWithData((CFMutableDataRef)v15, v4, 1uLL, 0);
  if (v12)
  {
    v13 = v12;
    CGImageDestinationAddImage(v12, image, 0);
    CGImageDestinationFinalize(v13);
    CFRelease(v13);
  }
  if (!v15)
  {
    if (!v11)
      return;
LABEL_23:
    CGImageRelease(image);
    return;
  }
  objc_msgSend(a3, "encodeObject:forKey:", v15, CFSTR("data"));
  if (v11)
  {
    v14 = 1;
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("A8asL8"));
    goto LABEL_20;
  }
LABEL_19:
  v14 = 0;
LABEL_20:
  CGImageGetColorSpace(image);
  if (CGColorSpaceContainsFlexGTCInfo())
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("loadAsHDR"));

  if ((v14 & 1) != 0)
    goto LABEL_23;
}

id __38__LKCGImageCodingProxy_initWithCoder___block_invoke()
{
  id result;

  -[LKCGImageCodingProxy initWithCoder:]::dictSDR = (uint64_t)image_properties_dictionary(0);
  result = image_properties_dictionary(1);
  -[LKCGImageCodingProxy initWithCoder:]::dictHDR = (uint64_t)result;
  return result;
}

@end
