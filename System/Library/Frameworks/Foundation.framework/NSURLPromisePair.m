@implementation NSURLPromisePair

- (NSURLPromisePair)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("_NSURLPromisePair should only ever be decoded by XPC"), 0));
  }
  self->_logicalURL = (NSURL *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSLogicalURL"));
  self->_physicalURL = (NSURL *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPhysicalURL"));
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileAccessClaims should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", self->_logicalURL, CFSTR("NSLogicalURL"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_physicalURL, CFSTR("NSPhysicalURL"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)URL
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", -[NSURL absoluteString](self->_logicalURL, "absoluteString"));
  if (v2)
    _CFURLPromiseSetPhysicalURL();
  return (NSURL *)v2;
}

+ (id)pairWithURL:(id)a3
{
  id v3;
  const void *v5;

  v3 = a3;
  if (a3)
  {
    v5 = (const void *)_CFURLPromiseCopyPhysicalURL();
    v3 = (id)objc_msgSend(a1, "pairWithLogicalURL:physicalURL:", v3, v5);
    if (v5)
      CFRelease(v5);
  }
  return v3;
}

+ (id)pairWithLogicalURL:(id)a3 physicalURL:(id)a4
{
  _QWORD *v6;

  if (!a3)
    return 0;
  v6 = objc_alloc_init((Class)a1);
  if (v6)
  {
    v6[1] = objc_msgSend(a3, "copy");
    v6[2] = objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSURLPromisePair;
  -[NSURLPromisePair dealloc](&v3, sel_dealloc);
}

- (NSURL)logicalURL
{
  return self->_logicalURL;
}

- (NSURL)physicalURL
{
  return self->_physicalURL;
}

@end
