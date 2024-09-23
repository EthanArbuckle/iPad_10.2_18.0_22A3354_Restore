@implementation NSFileProviderPresenterInfo

+ (id)infoWithPresenterID:(id)a3 auditToken:(id *)a4 observedUbiquityAttributes:(id)a5
{
  NSFileProviderPresenterInfo *v8;
  __int128 v9;

  v8 = objc_alloc_init(NSFileProviderPresenterInfo);
  v9 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v8->presenterAuditToken.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v8->presenterAuditToken.val[4] = v9;
  v8->presenterID = (NSString *)objc_msgSend(a3, "copy");
  v8->observedUbiquityAttributes = (NSSet *)a5;
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderPresenterInfo;
  -[NSFileProviderPresenterInfo dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderPresenterInfo instances should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeBytes:length:forKey:", &self->presenterAuditToken, 32, CFSTR("audittoken"));
  objc_msgSend(a3, "encodeObject:forKey:", self->presenterID, CFSTR("presenterid"));
  objc_msgSend(a3, "encodeObject:forKey:", self->observedUbiquityAttributes, CFSTR("ubiquityattrs"));
  objc_msgSend(a3, "encodeObject:forKey:", self->changedURL, CFSTR("newurl"));
}

- (NSFileProviderPresenterInfo)initWithCoder:(id)a3
{
  _OWORD *v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderPresenterInfo should only ever be decoded by XPC"), 0));
  }
  v10 = 0;
  v5 = (_OWORD *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("audittoken"), &v10);
  if (v5 && v10 == 32)
  {
    v6 = v5[1];
    *(_OWORD *)self->presenterAuditToken.val = *v5;
    *(_OWORD *)&self->presenterAuditToken.val[4] = v6;
    self->presenterID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presenterid"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    self->observedUbiquityAttributes = (NSSet *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), CFSTR("ubiquityattrs"));
    self->changedURL = (NSURL *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("newurl"));
  }
  else
  {

    v11 = CFSTR("NSDebugDescription");
    v12[0] = CFSTR("Audit token is missing or invalid");
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1)));
    return 0;
  }
  return self;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)presenterAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->presenterAuditToken, 32, 1, 0);
  return result;
}

- (NSString)presenterID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)observedUbiquityAttributes
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)changedURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChangedURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
