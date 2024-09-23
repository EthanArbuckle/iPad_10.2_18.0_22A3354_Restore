@implementation NSPlaceholderMutableString

- (NSPlaceholderMutableString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5
{
  NSPlaceholderMutableString *Mutable;
  void *v7;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v7);
  }
  Mutable = (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  _CFStringAppendFormatAndArgumentsAux2();
  return Mutable;
}

- (NSPlaceholderMutableString)init
{
  return (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
}

- (NSPlaceholderMutableString)initWithString:(id)a3
{
  objc_class *v4;
  __CFString *Mutable;
  void *v7;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v7);
  }
  v4 = (objc_class *)objc_opt_class();
  if (v4 == (objc_class *)__NSCFStringClass || class_getSuperclass(v4) == (Class)__NSCFStringClass)
    return (NSPlaceholderMutableString *)CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFStringRef)a3);
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringAppend(Mutable, (CFStringRef)a3);
  return (NSPlaceholderMutableString *)Mutable;
}

- (NSPlaceholderMutableString)initWithCapacity:(unint64_t)a3
{
  return (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
}

- (NSPlaceholderMutableString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  CFStringEncoding v8;
  NSPlaceholderMutableString *result;
  NSPlaceholderMutableString *v10;
  NSPlaceholderMutableString *MutableCopy;

  v8 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v8 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      v8 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), a5);
      v8 = 1536;
    }
  }
  result = (NSPlaceholderMutableString *)CFStringCreateWithBytes(0, (const UInt8 *)a3, a4, v8, 1u);
  if (result)
  {
    v10 = result;
    MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFStringRef)result);
    CFRelease(v10);
    return MutableCopy;
  }
  return result;
}

- (NSPlaceholderMutableString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *Mutable;

  v5 = a5;
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringAppendCharacters(Mutable, a3, a4);
  if (v5)
    free(a3);
  return (NSPlaceholderMutableString *)Mutable;
}

- (NSPlaceholderMutableString)initWithUTF8String:(const char *)a3
{
  __CFString *Mutable;
  NSPlaceholderMutableString *v6;
  void *v8;

  if (!a3)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NULL cString"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v8);
  }
  if (self != (NSPlaceholderMutableString *)&__mutablePlaceholder && !_CFExecutableLinkedOnOrAfter())
    return -[NSPlaceholderMutableString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", a3, strlen(a3), 4);
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v6 = (NSPlaceholderMutableString *)Mutable;
  if (Mutable)
    CFStringAppendCString(Mutable, a3, 0x8000100u);
  return v6;
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

- (NSPlaceholderMutableString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6
{
  _BOOL4 v6;
  CFStringEncoding v10;
  CFAllocatorRef *v11;
  NSPlaceholderMutableString *result;
  NSPlaceholderMutableString *v13;
  NSPlaceholderMutableString *MutableCopy;

  v6 = a6;
  v10 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v10 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      v10 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), a5);
      v10 = 1536;
    }
  }
  v11 = (CFAllocatorRef *)MEMORY[0x1E0C9AE10];
  if (!v6)
    v11 = (CFAllocatorRef *)MEMORY[0x1E0C9AE20];
  result = (NSPlaceholderMutableString *)CFStringCreateWithBytesNoCopy(0, (const UInt8 *)a3, a4, v10, 1u, *v11);
  if (result)
  {
    v13 = result;
    MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFStringRef)result);
    CFRelease(v13);
    return MutableCopy;
  }
  return result;
}

- (NSPlaceholderMutableString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6
{
  NSPlaceholderMutableString *result;
  NSPlaceholderMutableString *v7;
  NSPlaceholderMutableString *MutableCopy;

  result = -[NSString initWithBytesNoCopy:length:encoding:deallocator:]([NSString alloc], "initWithBytesNoCopy:length:encoding:deallocator:", a3, a4, a5, a6);
  if (result)
  {
    v7 = result;
    MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFStringRef)result);

    return MutableCopy;
  }
  return result;
}

- (NSPlaceholderMutableString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringAppendCharacters(Mutable, a3, a4);
  if (a5)
    (*((void (**)(id, unsigned __int16 *, unint64_t))a5 + 2))(a5, a3, a4);
  return (NSPlaceholderMutableString *)Mutable;
}

- (NSPlaceholderMutableString)initWithCString:(const char *)a3 encoding:(unint64_t)a4
{
  __CFString *Mutable;
  CFStringEncoding v7;
  void *v9;

  if (!a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
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
  CFStringAppendCString(Mutable, a3, v7);
  return (NSPlaceholderMutableString *)Mutable;
}

- (NSPlaceholderMutableString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  _BOOL4 v5;
  CFStringEncoding SystemEncoding;
  const __CFString *v9;
  NSPlaceholderMutableString *MutableCopy;

  v5 = a5;
  SystemEncoding = CFStringGetSystemEncoding();
  v9 = CFStringCreateWithBytes(0, (const UInt8 *)a3, a4, SystemEncoding, 0);
  if (v5)
    free(a3);
  if (!v9)
    return 0;
  MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v9);
  CFRelease(v9);
  return MutableCopy;
}

- (NSPlaceholderMutableString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7
{
  NSPlaceholderMutableString *Mutable;
  id v9;
  void *v11;

  if (!a3 || !a4)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v11);
  }
  Mutable = (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (!_CFStringAppendValidatedFormatAndArguments())
  {
    CFRelease(Mutable);
    if (a7 && *a7)
      v9 = *a7;
    return 0;
  }
  return Mutable;
}

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
  CFMutableStringRef Mutable;
  void *v9;

  if (!a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  objc_msgSend(a5, "pluralizationNumber");
  _CFStringAppendFormatAndArgumentsAux2();
  return Mutable;
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8
{
  CFMutableStringRef Mutable;
  id v11;
  void *v13;

  if (!a3 || !a4)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v13);
  }
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  objc_msgSend(a6, "pluralizationNumber");
  if (!_CFStringAppendValidatedFormatAndArguments())
  {
    CFRelease(Mutable);
    if (a7 && *a7)
      v11 = *a7;
    return 0;
  }
  return Mutable;
}

- (unint64_t)length
{
  NSLog((NSString *)CFSTR("Did you forget to nest alloc and init?"));
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)__NSMutableStringClass);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  NSLog((NSString *)CFSTR("Did you forget to nest alloc and init?"), a2, a3);
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)__NSMutableStringClass);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSLog((NSString *)CFSTR("Did you forget to nest alloc and init?"), a2, a3.location, a3.length, a4);
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)__NSMutableStringClass);
}

@end
