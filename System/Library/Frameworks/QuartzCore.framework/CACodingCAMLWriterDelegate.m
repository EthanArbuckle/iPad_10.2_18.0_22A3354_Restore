@implementation CACodingCAMLWriterDelegate

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)CACodingCAMLWriterDelegate;
  -[CACodingCAMLWriterDelegate dealloc](&v3, sel_dealloc);
}

- (CACodingCAMLWriterDelegate)initWithResourceDir:(id)a3
{
  CACodingCAMLWriterDelegate *result;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CACodingCAMLWriterDelegate;
  result = -[CACodingCAMLWriterDelegate init](&v5, sel_init);
  result->_resourceDir = (NSString *)a3;
  result->_serial = 0;
  return result;
}

- (id)CAMLWriter:(id)a3 typeForObject:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (coding_once != -1)
    dispatch_once_f(&coding_once, 0, (dispatch_function_t)coding_init);
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v4);
  if (v5 == self_bundle)
    return 0;
  do
  {
    v4 = (void *)objc_msgSend(v4, "superclass");
    if (!v4)
      break;
    v6 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v4);
  }
  while (v6 != self_bundle);
  return NSStringFromClass((Class)v4);
}

- (id)CAMLWriter:(id)a3 URLForResource:(id)a4
{
  CFTypeID v6;
  NSDictionary *v7;
  const __CFString *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t serial;
  uint64_t v14;
  CGImageDestination *v15;
  CGImageDestination *v16;
  void *v17;
  BOOL v18;
  NSObject *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = CFGetTypeID(a4);
  if (v6 == CGImageGetTypeID())
  {
    v7 = -[CACodingCAMLWriterDelegate imageEncodeOptions](self, "imageEncodeOptions");
    v8 = -[CACodingCAMLWriterDelegate imageFormat](self, "imageFormat");
    if (a4)
    {
      if (CGImageGetBitsPerPixel((CGImageRef)a4) == 8 && CGImageGetAlphaInfo((CGImageRef)a4) == kCGImageAlphaNone)
      {
        CAGetColorSpace(3u);
        CGImageGetColorSpace((CGImageRef)a4);
        if (CGColorSpaceEqualToColorSpace())
        {
          v7 = 0;
          v8 = CFSTR("public.png");
        }
      }
    }
    os_unfair_lock_lock((os_unfair_lock_t)&-[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::_extension_lock);
    v9 = (id)-[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::extensions;
    if (!-[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::extensions)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::extensions = (uint64_t)v9;
    }
    v10 = objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    if (!v10)
    {
      v11 = (void *)CGImageSourceCopyTypeExtensions();
      v10 = objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      objc_msgSend((id)-[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::extensions, "setObject:forKeyedSubscript:", v10, v8);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&-[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::_extension_lock);
    v12 = (void *)MEMORY[0x1E0CB3940];
    serial = self->_serial;
    self->_serial = serial + 1;
    v14 = objc_msgSend(v12, "stringWithFormat:", CFSTR("assets/image%d.%@"), serial, v10);
    v15 = CGImageDestinationCreateWithURL((CFURLRef)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", v14, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_resourceDir)), v8, 1uLL, 0);
    if (v15)
    {
      v16 = v15;
      CGImageDestinationAddImage(v15, (CGImageRef)a4, (CFDictionaryRef)v7);
      v17 = (void *)MEMORY[0x186DBE2E4]();
      v18 = CGImageDestinationFinalize(v16);
      objc_autoreleasePoolPop(v17);
      CFRelease(v16);
      if (v18)
        return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
      if (x_log_hook_p())
      {
        objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        x_log_();
      }
      else
      {
        v20 = x_log_category_utilities;
        if (os_log_type_enabled((os_log_t)x_log_category_utilities, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v22 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
          _os_log_impl(&dword_184457000, v20, OS_LOG_TYPE_ERROR, "CAML: Failed to encode image: %s\n", buf, 0xCu);
        }
      }
    }
  }
  return 0;
}

- (BOOL)CAMLWriter:(id)a3 shouldEncodeObject:(id)a4
{
  float v6;

  if (!self->_skipHiddenLayers)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 1;
  if ((objc_msgSend(a4, "isHidden") & 1) != 0)
    return 0;
  objc_msgSend(a4, "opacity");
  return v6 > 0.0;
}

- (NSString)imageFormat
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setImageFormat:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDictionary)imageEncodeOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setImageEncodeOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)skipHiddenLayers
{
  return self->_skipHiddenLayers;
}

- (void)setSkipHiddenLayers:(BOOL)a3
{
  self->_skipHiddenLayers = a3;
}

@end
