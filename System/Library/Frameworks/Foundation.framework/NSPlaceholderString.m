@implementation NSPlaceholderString

- (NSPlaceholderString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  CFAllocatorRef *v5;

  v5 = (CFAllocatorRef *)MEMORY[0x1E0C9AE10];
  if (!a5)
    v5 = (CFAllocatorRef *)MEMORY[0x1E0C9AE20];
  return (NSPlaceholderString *)CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, a4, *v5);
}

- (NSPlaceholderString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  const __CFAllocator *v8;
  CFStringEncoding v9;

  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v9 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      v9 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), a5);
      v9 = 1536;
    }
  }
  return (NSPlaceholderString *)CFStringCreateWithBytes(v8, (const UInt8 *)a3, a4, v9, 1u);
}

- (NSPlaceholderString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6
{
  _BOOL4 v6;
  const __CFAllocator *v10;
  CFStringEncoding v11;
  CFAllocatorRef *v12;

  v6 = a6;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v11 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      v11 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), a5);
      v11 = 1536;
    }
  }
  v12 = (CFAllocatorRef *)MEMORY[0x1E0C9AE10];
  if (!v6)
    v12 = (CFAllocatorRef *)MEMORY[0x1E0C9AE20];
  return (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v10, (const UInt8 *)a3, a4, v11, 1u, *v12);
}

- (NSPlaceholderString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5
{
  uint64_t v7;
  id v8;
  NSPlaceholderString *v9;
  void *v11;

  if (!a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v11);
  }
  v7 = objc_msgSend(a3, "__baseAttributedString");
  if (!v7)
    return (NSPlaceholderString *)_CFStringCreateWithFormatAndArgumentsAux2();
  v8 = -[NSAttributedString _initWithFormat:options:locale:arguments:]([NSAttributedString alloc], "_initWithFormat:options:locale:arguments:", v7, 0, a4, a5);
  v9 = (NSPlaceholderString *)objc_msgSend((id)objc_msgSend(v8, "string"), "copy");

  return v9;
}

- (NSPlaceholderString)initWithString:(id)a3
{
  NSPlaceholderString *v3;
  objc_class *v5;
  unint64_t v6;
  const UInt8 *v7;
  unint64_t v8;
  CFStringEncoding v9;
  const UniChar *v10;
  size_t v11;
  uint64_t v12;
  const UInt8 *v13;
  const __CFAllocator *v14;
  CFIndex v15;
  CFStringEncoding v16;
  void *v18;
  CFIndex v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v18);
  }
  v3 = (NSPlaceholderString *)a3;
  if (((unint64_t)a3 & 0x8000000000000000) != 0)
    return v3;
  v5 = (objc_class *)objc_opt_class();
  if (v5 == (objc_class *)__NSCFStringClass || class_getSuperclass(v5) == (Class)__NSCFStringClass)
    return (NSPlaceholderString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)v3);
  v6 = -[NSString fastestEncoding](v3, "fastestEncoding");
  v7 = -[NSString _fastCStringContents:](v3, "_fastCStringContents:", 0);
  v8 = -[NSString lengthOfBytesUsingEncoding:](v3, "lengthOfBytesUsingEncoding:", v6);
  if (v7)
  {
    v9 = CFStringConvertNSStringEncodingToEncoding(v6);
    if (v9 == -1)
    {
      if (v6 != 134217984 && v6)
      {
        v9 = -1;
      }
      else
      {
        if (_CFExecutableLinkedOnOrAfter())
          NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), v6);
        v9 = 1536;
      }
    }
    return (NSPlaceholderString *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, v8, v9, 0);
  }
  else
  {
    v10 = -[NSString _fastCharacterContents](v3, "_fastCharacterContents");
    if (!v10)
    {
      v11 = v8 + 1;
      v19 = 0;
      MEMORY[0x1E0C80A78](0);
      v13 = (const UInt8 *)&v19 - v12;
      if (v11 >= 0x101)
        v13 = (const UInt8 *)malloc_type_malloc(v11, 0x100004077774924uLL);
      -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13, v11, &v19, v6, 0, 0, -[NSPlaceholderString length](v3, "length", v19, v20), 0);
      v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v15 = v19;
      v16 = CFStringConvertNSStringEncodingToEncoding(v6);
      if (v16 == -1)
      {
        if (v6 != 134217984 && v6)
        {
          v16 = -1;
        }
        else
        {
          if (_CFExecutableLinkedOnOrAfter())
            NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), v6);
          v16 = 1536;
        }
      }
      if (v11 > 0x100)
        return (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v14, v13, v15, v16, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE10]);
      else
        return (NSPlaceholderString *)CFStringCreateWithBytes(v14, v13, v15, v16, 0);
    }
    return (NSPlaceholderString *)CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, v8 >> 1);
  }
}

- (NSPlaceholderString)init
{
  return (NSPlaceholderString *)&stru_1E0F56070;
}

- (NSPlaceholderString)initWithData:(id)a3 encoding:(unint64_t)a4
{
  const __CFAllocator *v6;
  CFStringEncoding v7;

  if (!a3)
    return (NSPlaceholderString *)&stru_1E0F56070;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = CFStringConvertNSStringEncodingToEncoding(a4);
  if (v7 == -1)
  {
    if (a4 != 134217984 && a4)
    {
      v7 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), a4);
      v7 = 1536;
    }
  }
  return (NSPlaceholderString *)CFStringCreateFromExternalRepresentation(v6, (CFDataRef)a3, v7);
}

- (NSPlaceholderString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7
{
  NSPlaceholderString *StringWithValidatedFormatAndArguments;
  id v9;
  void *v11;

  if (!a3 || !a4)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v11);
  }
  StringWithValidatedFormatAndArguments = (NSPlaceholderString *)CFStringCreateStringWithValidatedFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDictionaryRef)a5, (CFStringRef)a4, (CFStringRef)a3, a6, (CFErrorRef *)a7);
  if (a7 && *a7)
    v9 = *a7;
  return StringWithValidatedFormatAndArguments;
}

- (NSPlaceholderString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  return (NSPlaceholderString *)CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, a4);
}

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
  void *v7;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v7);
  }
  objc_msgSend(a5, "pluralizationNumber");
  return (id)_CFStringCreateWithFormatAndArgumentsAux2();
}

- (NSPlaceholderString)initWithCString:(const char *)a3 encoding:(unint64_t)a4
{
  const __CFAllocator *v6;
  CFStringEncoding v7;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = CFStringConvertNSStringEncodingToEncoding(a4);
  if (v7 == -1)
  {
    if (a4 != 134217984 && a4)
    {
      v7 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), a4);
      v7 = 1536;
    }
  }
  return (NSPlaceholderString *)CFStringCreateWithCString(v6, a3, v7);
}

uint64_t __71__NSPlaceholderString_initWithBytesNoCopy_length_encoding_deallocator___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

- (NSPlaceholderString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6
{
  const __CFAllocator *v9;
  const __CFAllocator *v10;
  CFStringEncoding v11;
  NSPlaceholderString *v12;
  _QWORD v14[7];
  CFAllocatorContext context;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__NSPlaceholderString_initWithBytesNoCopy_length_encoding_deallocator___block_invoke;
    v14[3] = &unk_1E0F50FA8;
    v14[4] = a6;
    v14[5] = a3;
    v14[6] = a4;
    memset(&context, 0, sizeof(context));
    context.info = (void *)objc_msgSend(v14, "copy");
    context.allocate = (CFAllocatorAllocateCallBack)_NSAllocatorAllocateHALTIfUsed;
    context.deallocate = (CFAllocatorDeallocateCallBack)_NSAllocatorDeallocateWithBlock;
    v9 = CFAllocatorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], &context);
  }
  else
  {
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
  }
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v11 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      v11 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), a5);
      v11 = 1536;
    }
  }
  v12 = (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v10, (const UInt8 *)a3, a4, v11, 1u, v9);
  if (v9)
    CFRelease(v9);
  return v12;
}

- (NSPlaceholderString)initWithCString:(const char *)a3 length:(unint64_t)a4
{
  const __CFAllocator *v6;
  CFStringEncoding SystemEncoding;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  SystemEncoding = CFStringGetSystemEncoding();
  return (NSPlaceholderString *)CFStringCreateWithBytes(v6, (const UInt8 *)a3, a4, SystemEncoding, 0);
}

- (unint64_t)retainCount
{
  return -1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (NSPlaceholderString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  const __CFAllocator *v7;
  NSPlaceholderString *v8;
  _QWORD v10[7];
  CFAllocatorContext context;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__NSPlaceholderString_initWithCharactersNoCopy_length_deallocator___block_invoke;
    v10[3] = &unk_1E0F50FA8;
    v10[4] = a5;
    v10[5] = a3;
    v10[6] = a4;
    memset(&context, 0, sizeof(context));
    context.info = (void *)objc_msgSend(v10, "copy");
    context.allocate = (CFAllocatorAllocateCallBack)_NSAllocatorAllocateHALTIfUsed;
    context.deallocate = (CFAllocatorDeallocateCallBack)_NSAllocatorDeallocateWithBlock;
    v7 = CFAllocatorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], &context);
  }
  else
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
  }
  v8 = (NSPlaceholderString *)CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, a4, v7);
  if (v7)
    CFRelease(v7);
  return v8;
}

uint64_t __67__NSPlaceholderString_initWithCharactersNoCopy_length_deallocator___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

- (NSPlaceholderString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  _BOOL4 v5;
  const __CFAllocator *v8;
  CFStringEncoding SystemEncoding;
  CFAllocatorRef *v10;

  v5 = a5;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  SystemEncoding = CFStringGetSystemEncoding();
  v10 = (CFAllocatorRef *)MEMORY[0x1E0C9AE10];
  if (!v5)
    v10 = (CFAllocatorRef *)MEMORY[0x1E0C9AE20];
  return (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v8, (const UInt8 *)a3, a4, SystemEncoding, 0, *v10);
}

- (NSPlaceholderString)initWithCString:(const char *)a3
{
  const __CFAllocator *v4;
  CFStringEncoding SystemEncoding;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  SystemEncoding = CFStringGetSystemEncoding();
  return (NSPlaceholderString *)CFStringCreateWithCString(v4, a3, SystemEncoding);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8
{
  void *StringWithValidatedFormatAux;
  id v10;
  void *v12;

  if (!a3 || !a4)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v12);
  }
  objc_msgSend(a6, "pluralizationNumber");
  StringWithValidatedFormatAux = (void *)_CFStringCreateStringWithValidatedFormatAux();
  if (a7 && *a7)
    v10 = *a7;
  return StringWithValidatedFormatAux;
}

- (unint64_t)length
{
  NSLog((NSString *)CFSTR("Did you forget to nest alloc and init?"));
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)__NSStringClass);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  NSLog((NSString *)CFSTR("Did you forget to nest alloc and init?"), a2, a3);
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)__NSStringClass);
}

@end
