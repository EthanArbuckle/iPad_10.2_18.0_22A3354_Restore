@implementation NSURL(NSURL)

- (uint64_t)hash
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
    return _CFNonObjCHash();
  else
    return 0;
}

+ (uint64_t)URLWithString:()NSURL
{
  return objc_msgSend(a1, "URLWithString:relativeToURL:", a3, 0);
}

- (NSString)description
{
  unint64_t v3;
  NSString *v4;
  NSString *v5;

  if (objc_msgSend((id)objc_msgSend(a1, "scheme"), "caseInsensitiveCompare:", CFSTR("data")))
  {
    if (objc_msgSend(a1, "baseURL"))
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ -- %@"), objc_msgSend(a1, "relativeString"), objc_msgSend(a1, "baseURL"));
    else
      return (NSString *)objc_msgSend(a1, "relativeString");
  }
  else
  {
    v3 = objc_msgSend((id)objc_msgSend(a1, "relativeString"), "length");
    if (v3 > 0x80)
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ... %@"), objc_msgSend((id)objc_msgSend(a1, "relativeString"), "substringToIndex:", 120), objc_msgSend((id)objc_msgSend(a1, "relativeString"), "substringFromIndex:", v3 - 8));
    else
      v4 = (NSString *)objc_msgSend(a1, "relativeString");
    v5 = v4;
    if (objc_msgSend(a1, "baseURL"))
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ -- %@"), v5, objc_msgSend(a1, "baseURL"));
    else
      return v5;
  }
}

- (CFStringRef)scheme
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
    return (id)CFURLCopyScheme(v3);
  else
    return 0;
}

- (CFURLRef)baseURL
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
    return CFURLGetBaseURL(v3);
  else
    return 0;
}

- (uint64_t)encodeWithCoder:()NSURL
{
  char v5;
  int v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  uint64_t result;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "allowsKeyedCoding");
  v6 = objc_msgSend(a1, "isFileReferenceURL");
  if ((v5 & 1) != 0)
  {
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "baseURL"), CFSTR("NS.base"));
      v7 = objc_msgSend(a1, "relativeString");
      v8 = CFSTR("NS.relative");
      v9 = a3;
      return objc_msgSend(v9, "encodeObject:forKey:", v7, v8);
    }
    v12 = (void *)objc_msgSend(a1, "filePathURL");
    v13 = objc_msgSend(a1, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 512, 0, 0, 0);
    if (v12
      || (result = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("com-apple-unresolvable-file-reference-url:")), (v12 = (void *)result) != 0))
    {
      objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v12, "baseURL"), CFSTR("NS.base"));
      result = objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v12, "relativeString"), CFSTR("NS.relative"));
    }
    if (v13)
    {
      v8 = CFSTR("NS.minimalBookmarkData");
      v9 = a3;
      v7 = v13;
      return objc_msgSend(v9, "encodeObject:forKey:", v7, v8);
    }
  }
  else
  {
    if (v6)
    {
      a1 = (void *)objc_msgSend(a1, "filePathURL");
      if (!a1)
        a1 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("com-apple-unresolvable-file-reference-url:"));
    }
    v11 = objc_msgSend(a1, "baseURL");
    v14 = v11 != 0;
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "c", &v14);
    if (v11)
      objc_msgSend(a3, "encodeObject:", v11);
    return objc_msgSend(a3, "encodeObject:", objc_msgSend(a1, "relativeString"));
  }
  return result;
}

- (CFStringRef)relativeString
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
    return (id)(id)CFURLGetString(v3);
  else
    return 0;
}

- (const)absoluteString
{
  objc_class *v3;
  const __CFURL *v4;
  const __CFURL *v5;
  const __CFString *v6;
  void *v8;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v8);
  }
  if (!v3)
    return 0;
  v4 = CFURLCopyAbsoluteURL(v3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (id)(id)CFURLGetString(v4);
  CFRelease(v5);
  return v6;
}

- (__CFString)path
{
  objc_class *v3;
  const __CFURL *v4;
  const __CFURL *v5;
  __CFString *v6;
  void *v8;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v8);
  }
  if (!v3)
    return 0;
  v4 = CFURLCopyAbsoluteURL(v3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (__CFString *)CFURLCopyFileSystemPath(v4, kCFURLPOSIXPathStyle);
  CFRelease(v5);
  return v6;
}

- (BOOL)isFileURL
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  return v3 && _CFURLIsFileURL() != 0;
}

- (BOOL)isEqual:()NSURL
{
  objc_class *v6;
  objc_class *v7;
  NSString *v9;

  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (objc_class *)objc_msgSend(a1, "_cfurl");
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if (v6 == (objc_class *)qword_1ECD0A200)
    {
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v6, a2));
    }
    else
    {
      v7 = (objc_class *)objc_msgSend(a3, "_cfurl");
      if (qword_1ECD0A208 != -1)
        dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
      if (v7 != (objc_class *)qword_1ECD0A200)
        return _CFNonObjCEqual() != 0;
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v7, a2));
    }
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v9, 0));
  }
  return 0;
}

- (char)_cfurl
{
  char *v1;
  Class Class;

  v1 = a1;
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class != (Class)qword_1ECD0A210)
    return *(char **)&v1[*MEMORY[0x1E0C99EC8]];
  return v1;
}

- (uint64_t)isKindOfClass:()NSURL
{
  Class Class;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210 && qword_1ECD0A210 == a3)
    return 1;
  v7.receiver = a1;
  v7.super_class = (Class)&off_1EDCF95D8;
  return (uint64_t)objc_msgSendSuper2(&v7, sel_isKindOfClass_, a3);
}

- (void)release
{
  Class Class;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((void *)qword_1ECD0A200 != a1)
      JUMPOUT(0x186DA79E8);
  }
  else
  {
    v3.receiver = a1;
    v3.super_class = (Class)&off_1EDCF95D8;
    objc_msgSendSuper2(&v3, sel_release);
  }
}

+ (id)URLWithString:()NSURL relativeToURL:
{
  if (a3)
    return (id)objc_msgSend(objc_allocWithZone(a1), "initWithString:relativeToURL:", a3, a4);
  else
    return 0;
}

+ (id)allocWithZone:()NSURL
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if ((void *)qword_1ECD0A210 == a1)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    return (id)qword_1ECD0A200;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)off_1EDCF8BD0;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (uint64_t)initWithString:()NSURL relativeToURL:
{
  return objc_msgSend(a1, "initWithString:relativeToURL:encodingInvalidCharacters:", a3, a4, 1);
}

- (CFURLRef)initWithString:()NSURL relativeToURL:encodingInvalidCharacters:
{
  Class Class;
  char *v11;
  CFURLRef v12;
  NSURLComponents *v13;
  void *v14;
  CFURLRef v15;
  NSString *v17;
  void *v18;
  _QWORD *v19;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil string parameter"), _NSMethodExceptionProem(a1, a2));

    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_19;
  }
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((objc_class *)qword_1ECD0A200 == a1)
    {
      if (!dyld_program_sdk_at_least() || !_os_feature_enabled_impl())
        return CFURLCreateWithString(0, a3, a4);
      v13 = -[NSURLComponents initWithString:encodingInvalidCharacters:]([NSURLComponents alloc], "initWithString:encodingInvalidCharacters:", a3, a5);
      v14 = (void *)MEMORY[0x186DA8F78]();
      v15 = CFURLCreateWithString(0, (CFStringRef)-[NSURLComponents string](v13, "string"), a4);
      objc_autoreleasePoolPop(v14);

      return v15;
    }
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object already initialized"), _NSMethodExceptionProem(a1, a2));

    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = (_QWORD *)MEMORY[0x1E0C99750];
LABEL_19:
    objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", *v19, v17, 0));
  }
  v20.receiver = a1;
  v20.super_class = (Class)&off_1EDCF95D8;
  v11 = -[objc_class init](&v20, sel_init);
  if (v11)
  {
    v12 = CFURLCreateWithString(0, a3, a4);
    if (v12)
    {
      *(_QWORD *)&v11[*MEMORY[0x1E0C99EC8]] = v12;
    }
    else
    {

      return 0;
    }
  }
  return (CFURLRef)v11;
}

- (id)retain
{
  void *v1;
  Class Class;
  objc_super v4;
  uint64_t v5;

  v1 = a1;
  v5 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class != (Class)qword_1ECD0A210)
  {
    v4.receiver = v1;
    v4.super_class = (Class)&off_1EDCF95D8;
    return objc_msgSendSuper2(&v4, sel_retain);
  }
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if ((void *)qword_1ECD0A200 == v1)
    return v1;
  return (id)_CFNonObjCRetain();
}

- (uint64_t)initWithString:()NSURL
{
  return objc_msgSend(a1, "initWithString:relativeToURL:", a3, 0);
}

- (id)standardizedURL
{
  void *v3;
  objc_class *v4;
  void *v6;

  v3 = a1;
  v4 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v4 == (objc_class *)qword_1ECD0A200)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v4, a2)), 0);
    objc_exception_throw(v6);
  }
  if (!v4)
    return 0;
  if (_CFURLCopyComponents())
    return (id)_CFURLCreateFromComponents();
  return v3;
}

- (CFURLRef)initWithCoder:()NSURL
{
  NSObject *v6;
  uint64_t v7;
  const __CFURL *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  CFURLRef result;
  const __CFString *v15;
  const __CFURL *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    buf[0] = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "c", buf, 1);
    if (buf[0])
    {
      v7 = objc_msgSend(a3, "decodeObject");
      if (!v7)
        goto LABEL_30;
      v8 = (const __CFURL *)v7;
      objc_opt_self();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_30;
    }
    else
    {
      v8 = 0;
    }
    v20 = objc_msgSend(a3, "decodeObject");
    if (v20)
    {
      v21 = (const __CFString *)v20;
      if (_NSIsNSString())
      {
        result = (CFURLRef)objc_msgSend(a1, "initWithString:relativeToURL:", v21, v8);
        if (!result)
        {
          result = CFURLCreateWithString(0, v21, v8);
          if (result)
            goto LABEL_23;
        }
        goto LABEL_33;
      }
    }
LABEL_30:

    LODWORD(a1) = 0;
    goto LABEL_37;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.minimalBookmarkData"))
    && objc_msgSend(a3, "_strictSecureDecodingEnabled"))
  {
    v6 = _NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = _NSMethodExceptionProem((objc_class *)a1, sel_initWithCoder_);
      _os_log_fault_impl(&dword_1817D9000, v6, OS_LOG_TYPE_FAULT, "%@: Skipped decoding bookmark data due to NSKeyedUnarchiver mode.", buf, 0xCu);
    }
LABEL_18:
    v17 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.relative"));
    if (v17)
    {
      v18 = (const __CFString *)v17;
      if (_NSIsNSString())
      {
        v19 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.base"));
        result = (CFURLRef)objc_msgSend(a1, "initWithString:relativeToURL:", v18, v19);
        if (result)
          return result;
        v15 = v18;
        v16 = (const __CFURL *)v19;
LABEL_22:
        result = CFURLCreateWithString(0, v15, v16);
        if (result)
        {
LABEL_23:
          CFRelease(result);
          LODWORD(a1) = 1;
          goto LABEL_37;
        }
LABEL_36:
        LODWORD(a1) = 0;
        goto LABEL_37;
      }
    }
    goto LABEL_35;
  }
  v9 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.minimalBookmarkData"));
  if (!v9)
    goto LABEL_18;
  v10 = v9;
  if (!_NSIsNSData())
    goto LABEL_18;
  if (a1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v10, 768, 0, 0, 0);
    if (v11)
    {
      v12 = objc_msgSend((id)objc_msgSend(v11, "filePathURL"), "absoluteString");
      if (v12)
      {
        v13 = (const __CFString *)v12;
        result = (CFURLRef)objc_msgSend(a1, "initWithString:", v12);
        if (result)
          return result;
        v15 = v13;
        v16 = 0;
        goto LABEL_22;
      }
LABEL_35:

      goto LABEL_36;
    }
    v22 = *MEMORY[0x1E0C99AA8];
    v23 = *MEMORY[0x1E0C999D0];
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "resourceValuesForKeys:fromBookmarkData:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0C99AA8], *MEMORY[0x1E0C999D0], 0), v10);
    v25 = objc_msgSend(v24, "objectForKey:", v22);
    if (!v25)
      goto LABEL_35;
    result = (CFURLRef)objc_msgSend(a1, "initFileURLWithPath:isDirectory:", v25, objc_msgSend((id)objc_msgSend(v24, "objectForKey:", v23), "BOOLValue"));
LABEL_33:
    LODWORD(a1) = 0;
    if (result)
      return result;
  }
LABEL_37:
  if (dyld_program_sdk_at_least() && (a1 & _os_feature_enabled_impl()) == 1)
    return (CFURLRef)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", &stru_1E0F56070);
  objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("%@: invalid archived object"), _NSMethodExceptionProem((objc_class *)objc_alloc(MEMORY[0x1E0C99E98]), a2)));
  return 0;
}

+ (id)fileURLWithPath:()NSURL isDirectory:relativeToURL:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initFileURLWithPath:isDirectory:relativeToURL:", a3, a4, a5);
}

+ (id)fileURLWithPath:()NSURL
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initFileURLWithPath:", a3);
}

+ (id)fileURLWithPath:()NSURL isDirectory:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initFileURLWithPath:isDirectory:", a3, a4);
}

- (char)initFileURLWithPath:()NSURL isDirectory:relativeToURL:
{
  char *v6;
  void *v9;
  Class Class;
  uint64_t v11;
  NSString *v13;
  void *v14;
  _QWORD *v15;
  objc_super v16;
  uint64_t v17;

  v6 = (char *)a1;
  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil string parameter"), _NSMethodExceptionProem(a1, a2));

    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_19;
  }
  v9 = a3;
  if (!objc_msgSend(a3, "length"))
    goto LABEL_11;
  if ((objc_msgSend(v9, "isAbsolutePath") & 1) == 0)
    v9 = (void *)objc_msgSend(v9, "stringByStandardizingPath");
  Class = object_getClass(v6);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((char *)qword_1ECD0A200 == v6)
      JUMPOUT(0x186DA737CLL);
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object already initialized"), _NSMethodExceptionProem((objc_class *)v6, a2));

    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (_QWORD *)MEMORY[0x1E0C99750];
LABEL_19:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", *v15, v13, 0));
  }
  v16.receiver = v6;
  v16.super_class = (Class)&off_1EDCF95D8;
  v6 = (char *)-[objc_class init](&v16, sel_init);
  if (v6)
  {
    v11 = MEMORY[0x186DA737C](0, v9, 0, a4, a5);
    if (v11)
    {
      *(_QWORD *)&v6[*MEMORY[0x1E0C99EC8]] = v11;
      return v6;
    }
LABEL_11:

    return 0;
  }
  return v6;
}

- (CFURLRef)initFileURLWithPath:()NSURL
{
  char *v4;
  __CFString *v5;
  Class Class;
  CFURLRef v7;
  NSString *v9;
  void *v10;
  _QWORD *v11;
  objc_super v12;
  Boolean isDirectory;
  uint64_t v14;

  v4 = (char *)a1;
  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil string parameter"), _NSMethodExceptionProem(a1, a2));

    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_23;
  }
  v5 = a3;
  if (!-[__CFString length](a3, "length"))
    goto LABEL_15;
  if ((-[__CFString isAbsolutePath](v5, "isAbsolutePath") & 1) == 0)
    v5 = (__CFString *)-[__CFString stringByStandardizingPath](v5, "stringByStandardizingPath");
  isDirectory = 0;
  if (-[__CFString characterAtIndex:](v5, "characterAtIndex:", -[__CFString length](v5, "length") - 1) == 47)
  {
    isDirectory = 1;
  }
  else if ((_NSFileExists((uint64_t)v5, (BOOL *)&isDirectory) & 1) == 0)
  {
    isDirectory = 0;
  }
  Class = object_getClass(v4);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((char *)qword_1ECD0A200 == v4)
    {

      return CFURLCreateWithFileSystemPath(0, v5, kCFURLPOSIXPathStyle, isDirectory);
    }
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object already initialized"), _NSMethodExceptionProem((objc_class *)v4, a2));

    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (_QWORD *)MEMORY[0x1E0C99750];
LABEL_23:
    objc_exception_throw((id)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", *v11, v9, 0));
  }
  v12.receiver = v4;
  v12.super_class = (Class)&off_1EDCF95D8;
  v4 = (char *)-[objc_class init](&v12, sel_init);
  if (v4)
  {
    v7 = CFURLCreateWithFileSystemPath(0, v5, kCFURLPOSIXPathStyle, isDirectory);
    if (v7)
    {
      *(_QWORD *)&v4[*MEMORY[0x1E0C99EC8]] = v7;
      return (CFURLRef)v4;
    }
LABEL_15:

    return 0;
  }
  return (CFURLRef)v4;
}

- (CFURLRef)initFileURLWithPath:()NSURL isDirectory:
{
  char *v5;
  __CFString *v7;
  Class Class;
  CFURLRef v9;
  NSString *v11;
  void *v12;
  _QWORD *v13;
  objc_super v14;
  uint64_t v15;

  v5 = (char *)a1;
  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil string parameter"), _NSMethodExceptionProem(a1, a2));

    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_19;
  }
  v7 = a3;
  if (!-[__CFString length](a3, "length"))
    goto LABEL_11;
  if ((-[__CFString isAbsolutePath](v7, "isAbsolutePath") & 1) == 0)
    v7 = (__CFString *)-[__CFString stringByStandardizingPath](v7, "stringByStandardizingPath");
  Class = object_getClass(v5);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class != (Class)qword_1ECD0A210)
  {
    v14.receiver = v5;
    v14.super_class = (Class)&off_1EDCF95D8;
    v5 = (char *)-[objc_class init](&v14, sel_init);
    if (!v5)
      return (CFURLRef)v5;
    v9 = CFURLCreateWithFileSystemPath(0, v7, kCFURLPOSIXPathStyle, a4);
    if (v9)
    {
      *(_QWORD *)&v5[*MEMORY[0x1E0C99EC8]] = v9;
      return (CFURLRef)v5;
    }
LABEL_11:

    return 0;
  }
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if ((char *)qword_1ECD0A200 != v5)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object already initialized"), _NSMethodExceptionProem((objc_class *)v5, a2));

    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = (_QWORD *)MEMORY[0x1E0C99750];
LABEL_19:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", *v13, v11, 0));
  }
  return CFURLCreateWithFileSystemPath(0, v7, kCFURLPOSIXPathStyle, a4);
}

- (CFStringRef)parameterString
{
  objc_class *v3;
  void *v5;
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__NSURL_NSURL__parameterString__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (_MergedGlobals_123 == -1)
  {
    if (v3)
      return (id)CFURLCopyParameterString(v3, 0);
  }
  else
  {
    dispatch_once(&_MergedGlobals_123, block);
    if (v3)
      return (id)CFURLCopyParameterString(v3, 0);
  }
  return 0;
}

- (__CFString)fileSystemRepresentation
{
  objc_class *v4;
  void *v5;
  __CFString *v6;
  const __CFURL *v7;
  const __CFURL *v8;
  const __CFString *v9;
  CFIndex MaximumSizeOfFileSystemRepresentation;
  void *v11;
  NSString *v12;
  NSString *v14;
  void *v15;
  _QWORD *v16;
  NSString *v17;

  v4 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v4 == (objc_class *)qword_1ECD0A200)
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v4, a2));
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = (_QWORD *)MEMORY[0x1E0C99750];
    goto LABEL_22;
  }
  if (!v4)
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@ was not initialized"), _NSMethodExceptionProem((objc_class *)a1, a2), a1);
    goto LABEL_19;
  }
  v5 = malloc_type_malloc(0x400uLL, 0x3AF1E0E7uLL);
  if (!v5)
  {
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unable to allocate memory for length (%ld)"), _NSMethodExceptionProem((objc_class *)a1, a2), 1024);
    goto LABEL_21;
  }
  v6 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v5, 1024), "bytes");
  if (!CFURLGetFileSystemRepresentation(v4, 1u, (UInt8 *)v6, 1024))
  {
    v7 = CFURLCopyAbsoluteURL(v4);
    if (v7)
    {
      v8 = v7;
      v9 = CFURLCopyFileSystemPath(v7, kCFURLPOSIXPathStyle);
      v6 = (__CFString *)v9;
      if (v9)
      {
        MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v9);
        CFRelease(v6);
        if (MaximumSizeOfFileSystemRepresentation != -1)
        {
          v11 = malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x55E22903uLL);
          if (v11)
          {
            v6 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v11, MaximumSizeOfFileSystemRepresentation), "bytes");
            if (!CFURLGetFileSystemRepresentation(v8, 1u, (UInt8 *)v6, MaximumSizeOfFileSystemRepresentation))
            {
              v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: conversion failed for %@"), _NSMethodExceptionProem((objc_class *)a1, a2), a1);
LABEL_19:
              v14 = v12;
              v15 = (void *)MEMORY[0x1E0C99DA0];
              v16 = (_QWORD *)MEMORY[0x1E0C99778];
              goto LABEL_22;
            }
            goto LABEL_15;
          }
          v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unable to allocate memory for length (%ld)"), _NSMethodExceptionProem((objc_class *)a1, a2), MaximumSizeOfFileSystemRepresentation);
LABEL_21:
          v14 = v17;
          v15 = (void *)MEMORY[0x1E0C99DA0];
          v16 = (_QWORD *)MEMORY[0x1E0C99850];
LABEL_22:
          objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", *v16, v14, 0));
        }
        v6 = 0;
      }
LABEL_15:
      CFRelease(v8);
      return v6;
    }
    return 0;
  }
  return v6;
}

+ (id)fileURLWithFileSystemRepresentation:()NSURL isDirectory:relativeToURL:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a3, a4, a5);
}

- (char)initFileURLWithFileSystemRepresentation:()NSURL isDirectory:relativeToURL:
{
  Class Class;
  char *v11;
  size_t v12;
  uint64_t v13;
  NSString *v15;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((void *)qword_1ECD0A200 == a1)
    {
      strlen(a3);
      JUMPOUT(0x186DA7334);
    }
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object already initialized"), _NSMethodExceptionProem((objc_class *)a1, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v15, 0));
  }
  v16.receiver = a1;
  v16.super_class = (Class)&off_1EDCF95D8;
  v11 = (char *)objc_msgSendSuper2(&v16, sel_init);
  if (v11)
  {
    v12 = strlen(a3);
    v13 = MEMORY[0x186DA7334](*MEMORY[0x1E0C9AE00], a3, v12, a4, a5);
    *(_QWORD *)&v11[*MEMORY[0x1E0C99ED0]] = 0;
    *(_QWORD *)&v11[*MEMORY[0x1E0C99EB8]] = 0;
    *(_QWORD *)&v11[*MEMORY[0x1E0C99EC0]] = 0;
    if (v13)
    {
      *(_QWORD *)&v11[*MEMORY[0x1E0C99EC8]] = v13;
    }
    else
    {

      return 0;
    }
  }
  return v11;
}

- (BOOL)getFileSystemRepresentation:()NSURL maxLength:
{
  objc_class *v7;
  _BOOL8 result;
  void *v9;

  v7 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v7 == (objc_class *)qword_1ECD0A200)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v7, a2)), 0);
    objc_exception_throw(v9);
  }
  if (v7)
    return CFURLGetFileSystemRepresentation(v7, 1u, a3, a4) != 0;
  result = 0;
  *a3 = 0;
  return result;
}

- (CFStringRef)host
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
    return (id)CFURLCopyHostName(v3);
  else
    return 0;
}

- (uint64_t)isMemberOfClass:()NSURL
{
  Class Class;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210 && qword_1ECD0A210 == a3)
    return 1;
  v7.receiver = a1;
  v7.super_class = (Class)&off_1EDCF95D8;
  return (uint64_t)objc_msgSendSuper2(&v7, sel_isMemberOfClass_, a3);
}

- (BOOL)hasDirectoryPath
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  return v3 && CFURLHasDirectoryPath(v3) != 0;
}

- (id)dealloc
{
  Class Class;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_freeClients");
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class != (Class)qword_1ECD0A210)

  v4.receiver = a1;
  v4.super_class = (Class)&off_1EDCF95D8;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

- (void)_freeClients
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
  {
    v4 = (void *)__CFURLReservedPtr();
    if (v4)
    {

      __CFURLSetReservedPtr();
    }
  }
}

- (CFURLRef)absoluteURL
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
    return CFURLCopyAbsoluteURL(v3);
  else
    return 0;
}

- (CFStringRef)query
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
    return (id)CFURLCopyQueryString(v3, 0);
  else
    return 0;
}

- (NSNumber)port
{
  objc_class *v3;
  SInt32 v4;
  void *v6;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v6);
  }
  if (!v3)
    return 0;
  v4 = CFURLGetPortNumber(v3);
  if (v4 == -1)
    return 0;
  else
    return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4);
}

- (NSString)resourceSpecifier
{
  objc_class *v4;
  __CFString *v5;
  NSString *result;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  if ((objc_msgSend(a1, "_isAbsolute") & 1) == 0)
    return (NSString *)objc_msgSend(a1, "relativeString");
  v4 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v4 == (objc_class *)qword_1ECD0A200)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v4, a2)), 0);
    objc_exception_throw(v9);
  }
  if (!v4)
    return 0;
  if (!CFURLCanBeDecomposed(v4))
  {
    v5 = (__CFString *)CFURLCopyResourceSpecifier(v4);
    return (NSString *)v5;
  }
  if (CFURLGetBaseURL(v4))
  {
    v5 = (id)CFURLGetString(v4);
    return (NSString *)v5;
  }
  v7 = (id)CFURLCopyNetLocation(v4);
  v8 = (id)CFURLCopyPath(v4);
  result = (id)CFURLCopyResourceSpecifier(v4);
  if (v7)
  {
    if (v8)
    {
      if (result)
        return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("//%@%@%@"), v7, v8, result);
      else
        return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("//%@%@"), v7, v8, v11);
    }
    else if (result)
    {
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("//%@"), v7, v10, v11);
    }
    else
    {
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("//%@%@"), v7, 0, v11);
    }
  }
  else if (v8)
  {
    if (result)
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v8, result, v11);
    else
      return (NSString *)v8;
  }
  return result;
}

- (BOOL)_isAbsolute
{
  return !objc_msgSend(a1, "baseURL") && objc_msgSend(a1, "scheme") != 0;
}

- (CFStringRef)fragment
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
    return (id)CFURLCopyFragment(v3, 0);
  else
    return 0;
}

- (CFStringRef)relativePath
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
    return (id)CFURLCopyFileSystemPath(v3, kCFURLPOSIXPathStyle);
  else
    return 0;
}

- (id)_tryRetain
{
  Class Class;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((void *)qword_1ECD0A200 == a1)
      return 0;
    else
      return (id)(_CFTryRetain() != 0);
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_1EDCF95D8;
    return objc_msgSendSuper2(&v4, sel__tryRetain);
  }
}

- (unint64_t)_isDeallocating
{
  Class Class;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    return (void *)qword_1ECD0A200 == a1 || _CFIsDeallocating() != 0;
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_1EDCF95D8;
    return (unint64_t)objc_msgSendSuper2(&v4, sel__isDeallocating);
  }
}

- (CFStringRef)user
{
  objc_class *v3;
  void *v5;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v5);
  }
  if (v3)
    return (id)CFURLCopyUserName(v3);
  else
    return 0;
}

- (char)initFileURLWithPath:()NSURL relativeToURL:
{
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Class Class;
  char *v13;
  const void *v14;
  NSString *v16;
  NSString *v17;
  objc_super v18;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (!a3)
  {
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil string parameter"), _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0));
  }
  v7 = a3;
  if (!objc_msgSend(a3, "length"))
    goto LABEL_15;
  if ((objc_msgSend(v7, "isAbsolutePath") & 1) == 0)
    v7 = (void *)objc_msgSend(v7, "stringByStandardizingPath");
  v8 = objc_msgSend(v7, "characterAtIndex:", objc_msgSend(v7, "length") - 1);
  v9 = *MEMORY[0x1E0C9AE00];
  if (v8 == 47)
  {
    v10 = MEMORY[0x186DA737C](v9, v7, 0, 1, a4);
    v21[3] = v10;
    if (!v10)
    {
LABEL_15:

LABEL_16:
      v13 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    v11 = MEMORY[0x186DA737C](v9, v7, 0, 0, a4);
    v21[3] = v11;
    if (!v11)
      goto LABEL_15;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__NSURL_NSURL__initFileURLWithPath_relativeToURL___block_invoke;
    v19[3] = &unk_1E0F510E0;
    v19[5] = a4;
    v19[6] = &v20;
    v19[4] = v7;
    +[NSURL setIOPolicy:type:scope:forBlock:](MEMORY[0x1E0C99E98], (uint64_t)v19);
    if (!v21[3])
      goto LABEL_15;
  }
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    v13 = (char *)v21[3];
    if ((objc_class *)qword_1ECD0A200 != a1)
    {
      CFRelease((CFTypeRef)v21[3]);
      v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object already initialized"), _NSMethodExceptionProem(a1, a2));

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v16, 0));
    }
  }
  else
  {
    v18.receiver = a1;
    v18.super_class = (Class)&off_1EDCF95D8;
    v13 = (char *)-[objc_class init](&v18, sel_init);
    v14 = (const void *)v21[3];
    if (!v13)
    {
      CFRelease(v14);
      goto LABEL_16;
    }
    *(_QWORD *)&v13[*MEMORY[0x1E0C99EC8]] = v14;
  }
LABEL_17:
  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)fileURLWithPath:()NSURL relativeToURL:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initFileURLWithPath:relativeToURL:", a3, a4);
}

- (CFIndex)retainCount
{
  Class Class;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((void *)qword_1ECD0A200 == a1)
      return -1;
    else
      return CFGetRetainCount(a1);
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_1EDCF95D8;
    return (CFIndex)objc_msgSendSuper2(&v4, sel_retainCount);
  }
}

- (uint64_t)_clientsCreatingIfNecessary:()NSURL
{
  objc_class *v5;
  uint64_t Mutable;
  void *v8;

  v5 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v5 == (objc_class *)qword_1ECD0A200)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v5, a2)), 0);
    objc_exception_throw(v8);
  }
  if (!v5)
    return 0;
  Mutable = __CFURLReservedPtr();
  if (!Mutable && a3)
  {
    Mutable = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, 0);
    __CFURLSetReservedPtr();
  }
  return Mutable;
}

- (uint64_t)init
{
  uint64_t v2;
  const __CFString *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
  {
    v2 = objc_msgSend(a1, "initWithString:", &stru_1E0F56070);
    v3 = CFSTR("this results in an NSURL instance with an empty URL string.");
  }
  else
  {

    v2 = 0;
    v3 = CFSTR("the NSURL object has been released and nil returned.");
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__NSURL_NSURL__init__block_invoke;
  v5[3] = &unk_1E0F4D2D8;
  v5[4] = v3;
  if (init_onceToken != -1)
    dispatch_once(&init_onceToken, v5);
  return v2;
}

- (uint64_t)initWithString:()NSURL encodingInvalidCharacters:
{
  return objc_msgSend(a1, "initWithString:relativeToURL:encodingInvalidCharacters:", a3, 0, a4);
}

+ (id)URLWithString:()NSURL encodingInvalidCharacters:
{
  if (a3)
    return (id)objc_msgSend(objc_allocWithZone(a1), "initWithString:relativeToURL:encodingInvalidCharacters:", a3, 0, a4);
  else
    return 0;
}

- (uint64_t)initWithScheme:()NSURL host:path:
{
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  unsigned int v18;
  NSString *v20;

  if ((objc_msgSend(a5, "isAbsolutePath") & 1) == 0)
  {
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: path %@ is not absolute."), _NSMethodExceptionProem(a1, a2), a5);

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0));
  }
  if (a4)
    v10 = (const __CFString *)objc_msgSend(a4, "stringByAddingPercentEscapes");
  else
    v10 = &stru_1E0F56070;
  v11 = objc_msgSend(a5, "standardizedURLPath");
  if (a3)
  {
    v12 = v11;
    v13 = objc_msgSend(a3, "length");
    if (v13 >= 1)
    {
      v14 = v13;
      v15 = MEMORY[0x1E0C80978];
      do
      {
        v16 = v14 - 1;
        v17 = objc_msgSend(a3, "characterAtIndex:", v14 - 1);
        v18 = v17;
        if (v17 > 0x7F)
        {
          if (__maskrune(v17, 0x100uLL))
            goto LABEL_16;
        }
        else if ((*(_DWORD *)(v15 + 4 * v17 + 60) & 0x100) != 0)
        {
          goto LABEL_16;
        }
        if (v14 < 2 || v18 - 48 >= 0xA && (v18 > 0x2E || ((1 << v18) & 0x680000000000) == 0))
          goto LABEL_20;
LABEL_16:
        --v14;
      }
      while (v16 + 1 > 1);
    }
    if (v10 && v12)
      return (uint64_t)-[objc_class initWithString:](a1, "initWithString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@%@"), a3, v10, v12));
  }
LABEL_20:

  return 0;
}

- (objc_class)initWithDataRepresentation:()NSURL relativeToURL:
{
  objc_class *v7;
  Class Class;
  const __CFAllocator *v9;
  CFURLRef v10;
  const __CFAllocator *v11;
  CFURLRef v12;
  NSString *v14;
  objc_super v15;
  uint64_t v16;

  v7 = a1;
  v16 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((objc_class *)qword_1ECD0A200 != v7)
    {
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object already initialized"), _NSMethodExceptionProem(v7, a2));

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v14, 0));
    }
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = CFURLCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0x8000100u, a4);
    if (!v12)
      v12 = CFURLCreateWithBytes(v11, (const UInt8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0x201u, a4);
    if (v12)
      return v12;
  }
  else
  {
    v15.receiver = v7;
    v15.super_class = (Class)&off_1EDCF95D8;
    v7 = (objc_class *)-[objc_class init](&v15, sel_init);
    if (v7)
    {
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v10 = CFURLCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0x8000100u, a4);
      if (!v10)
        v10 = CFURLCreateWithBytes(v9, (const UInt8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0x201u, a4);
      *(_QWORD *)((char *)v7 + (int)*MEMORY[0x1E0C99ED0]) = 0;
      *(_QWORD *)((char *)v7 + (int)*MEMORY[0x1E0C99EB8]) = 0;
      *(_QWORD *)((char *)v7 + (int)*MEMORY[0x1E0C99EC0]) = 0;
      if (v10)
      {
        *(_QWORD *)((char *)v7 + (int)*MEMORY[0x1E0C99EC8]) = v10;
      }
      else
      {

        return 0;
      }
    }
  }
  return v7;
}

+ (id)URLWithDataRepresentation:()NSURL relativeToURL:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initWithDataRepresentation:relativeToURL:", a3, a4);
}

- (objc_class)initAbsoluteURLWithDataRepresentation:()NSURL relativeToURL:
{
  objc_class *v7;
  Class Class;
  const __CFAllocator *v9;
  CFURLRef v10;
  const __CFAllocator *v11;
  CFURLRef v12;
  NSString *v14;
  objc_super v15;
  uint64_t v16;

  v7 = a1;
  v16 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((objc_class *)qword_1ECD0A200 != v7)
    {
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object already initialized"), _NSMethodExceptionProem(v7, a2));

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v14, 0));
    }
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = CFURLCreateAbsoluteURLWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0x8000100u, a4, 1u);
    if (!v12)
      v12 = CFURLCreateAbsoluteURLWithBytes(v11, (const UInt8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0x201u, a4, 1u);
    if (v12)
      return v12;
  }
  else
  {
    v15.receiver = v7;
    v15.super_class = (Class)&off_1EDCF95D8;
    v7 = (objc_class *)-[objc_class init](&v15, sel_init);
    if (v7)
    {
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v10 = CFURLCreateAbsoluteURLWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0x8000100u, a4, 1u);
      if (!v10)
        v10 = CFURLCreateAbsoluteURLWithBytes(v9, (const UInt8 *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0x201u, a4, 1u);
      *(_QWORD *)((char *)v7 + (int)*MEMORY[0x1E0C99ED0]) = 0;
      *(_QWORD *)((char *)v7 + (int)*MEMORY[0x1E0C99EB8]) = 0;
      *(_QWORD *)((char *)v7 + (int)*MEMORY[0x1E0C99EC0]) = 0;
      if (v10)
      {
        *(_QWORD *)((char *)v7 + (int)*MEMORY[0x1E0C99EC8]) = v10;
      }
      else
      {

        return 0;
      }
    }
  }
  return v7;
}

+ (id)absoluteURLWithDataRepresentation:()NSURL relativeToURL:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initAbsoluteURLWithDataRepresentation:relativeToURL:", a3, a4);
}

- (uint64_t)dataRepresentation
{
  objc_class *v3;
  size_t v4;
  CFIndex v5;
  UInt8 *v6;
  UInt8 *v7;
  void *v9;

  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v9);
  }
  if (v3)
  {
    v4 = CFURLGetBytes(v3, 0, 0);
    if (v4 != -1)
    {
      v5 = v4;
      v6 = (UInt8 *)malloc_type_malloc(v4, 0x32624C02uLL);
      if (v6)
      {
        v7 = v6;
        if (CFURLGetBytes(v3, v6, v5) == v5)
          return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v5, 1);
        free(v7);
      }
    }
  }
  return 0;
}

- (char)initByResolvingBookmarkData:()NSURL options:relativeToURL:bookmarkDataIsStale:error:
{
  Class Class;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  objc_super v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((void *)qword_1ECD0A200 != a1)
    {
      v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object already initialized"), _NSMethodExceptionProem((objc_class *)a1, a2));

      v23 = (void *)MEMORY[0x1E0C99DA0];
      v24 = *MEMORY[0x1E0C99750];
      v25 = v22;
      goto LABEL_30;
    }
    v19 = objc_msgSend(a5, "_cfurl");
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if (v19 != qword_1ECD0A200)
    {
      v15 = (char *)MEMORY[0x186DA72F8](*MEMORY[0x1E0C9AE00], a3, a4, v19, 0, a6, a7);
      if (v15)
        return v15;
      if (a7 && *a7)
      {
        v15 = 0;
        *a7 = *a7;
        return v15;
      }
      return 0;
    }
    v21 = (objc_class *)v19;
LABEL_29:
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v21, a2));
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99750];
LABEL_30:
    objc_exception_throw((id)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v25, 0));
  }
  v26.receiver = a1;
  v26.super_class = (Class)&off_1EDCF95D8;
  v15 = (char *)objc_msgSendSuper2(&v26, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(a5, "_cfurl");
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if (v16 != qword_1ECD0A200)
    {
      v17 = MEMORY[0x186DA72F8](*MEMORY[0x1E0C9AE00], a3, a4, v16, 0, a6, a7);
      *(_QWORD *)&v15[*MEMORY[0x1E0C99ED0]] = 0;
      *(_QWORD *)&v15[*MEMORY[0x1E0C99EB8]] = 0;
      *(_QWORD *)&v15[*MEMORY[0x1E0C99EC0]] = 0;
      v18 = (int)*MEMORY[0x1E0C99EC8];
      if (v17)
      {
        *(_QWORD *)&v15[v18] = v17;
        return v15;
      }
      *(_QWORD *)&v15[v18] = 0;
      if (a7 && *a7)
        *a7 = *a7;

      return 0;
    }
    v21 = (objc_class *)v16;
    goto LABEL_29;
  }
  return v15;
}

+ (id)URLByResolvingBookmarkData:()NSURL options:relativeToURL:bookmarkDataIsStale:error:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", a3, a4, a5, a6, a7);
}

- (char)initByResolvingAliasFileAtURL:()NSURL options:error:
{
  Class Class;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v15;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  Class = object_getClass(a1);
  if (qword_1ECD0A218 != -1)
    dispatch_once(&qword_1ECD0A218, &__block_literal_global_407);
  if (Class == (Class)qword_1ECD0A210)
  {
    if (qword_1ECD0A208 != -1)
      dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
    if ((void *)qword_1ECD0A200 != a1)
    {
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object already initialized"), _NSMethodExceptionProem((objc_class *)a1, a2));

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v15, 0));
    }
    v11 = (char *)MEMORY[0x186DA7DC0](*MEMORY[0x1E0C9AE00], a3, a4, 0, a5);
    if (!v11)
    {
      if (a5 && *a5)
      {
        v11 = 0;
        *a5 = *a5;
        return v11;
      }
      return 0;
    }
  }
  else
  {
    v16.receiver = a1;
    v16.super_class = (Class)&off_1EDCF95D8;
    v11 = (char *)objc_msgSendSuper2(&v16, sel_init);
    if (v11)
    {
      v12 = MEMORY[0x186DA7DC0](*MEMORY[0x1E0C9AE00], a3, a4, 0, a5);
      *(_QWORD *)&v11[*MEMORY[0x1E0C99ED0]] = 0;
      *(_QWORD *)&v11[*MEMORY[0x1E0C99EB8]] = 0;
      *(_QWORD *)&v11[*MEMORY[0x1E0C99EC0]] = 0;
      v13 = (int)*MEMORY[0x1E0C99EC8];
      if (v12)
      {
        *(_QWORD *)&v11[v13] = v12;
        return v11;
      }
      *(_QWORD *)&v11[v13] = 0;
      if (a5 && *a5)
        *a5 = *a5;

      return 0;
    }
  }
  return v11;
}

+ (id)URLByResolvingAliasFileAtURL:()NSURL options:error:
{
  return (id)objc_msgSend(objc_allocWithZone(a1), "initByResolvingAliasFileAtURL:options:error:", a3, a4, a5);
}

- (objc_class)password
{
  objc_class *v3;
  const __CFString *v4;
  const __CFString *v5;
  CFIndex location;
  uint64_t v7;
  void *v9;
  CFRange result;
  uint64_t v11;
  CFRange v12;
  CFRange v13;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_msgSend(a1, "_cfurl");
  if (qword_1ECD0A208 != -1)
    dispatch_once(&qword_1ECD0A208, &__block_literal_global_51);
  if (v3 == (objc_class *)qword_1ECD0A200)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: object was not initialized"), _NSMethodExceptionProem(v3, a2)), 0);
    objc_exception_throw(v9);
  }
  if (v3)
  {
    v4 = CFURLCopyNetLocation(v3);
    if (v4)
    {
      v5 = v4;
      location = CFStringFind(v4, CFSTR("@"), 4uLL).location;
      if (location == -1
        || (v7 = location,
            result.location = 0,
            result.length = 0,
            v12.location = 0,
            v12.length = location,
            !CFStringFindWithOptions(v5, CFSTR(":"), v12, 0, &result)))
      {
        v3 = 0;
      }
      else
      {
        v13.location = result.location + 1;
        v13.length = v7 + ~result.location;
        v3 = (id)CFStringCreateWithSubstring(0, v5, v13);
      }
      CFRelease(v5);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

@end
