@implementation NSURLCredential

- (_CFURLCredential)_CFURLCredential
{
  return (_CFURLCredential *)self->_internal;
}

+ (NSURLCredential)credentialForTrust:(SecTrustRef)trust
{
  return -[NSURLCredential initWithTrust:]([NSURLCredential alloc], "initWithTrust:", trust);
}

- (NSURLCredential)initWithTrust:(SecTrustRef)trust
{
  NSURLCredential *v4;
  const void *v5;
  NSURLCredentialInternal *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSURLCredential;
  v4 = -[NSURLCredential init](&v8, sel_init);
  if (v4)
  {
    v5 = (const void *)CFURLCredentialCreateWithTrust(*MEMORY[0x1E0C9AE00], trust);
    v6 = (NSURLCredentialInternal *)CFMakeCollectable(v5);
    v4->_internal = v6;
    if (!v6)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLCredential;
  -[NSURLCredential dealloc](&v3, sel_dealloc);
}

- (NSURLCredential)initWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence
{
  int v5;
  uint64_t v8;
  NSURLCredential *v9;
  const void *v10;
  NSURLCredentialInternal *v11;
  objc_super v13;

  v5 = persistence;
  v13.receiver = self;
  v13.super_class = (Class)NSURLCredential;
  v9 = -[NSURLCredential init](&v13, sel_init);
  if (v9)
  {
    v10 = (const void *)CFURLCredentialCreate(*MEMORY[0x1E0C9AE00], (const __CFString *)user, (const __CFString *)password, v8, v5 + 1);
    v11 = (NSURLCredentialInternal *)CFMakeCollectable(v10);
    v9->_internal = v11;
    if (!v11)
    {

      return 0;
    }
  }
  return v9;
}

- (id)_initWithCFURLCredential:(_CFURLCredential *)a3
{
  NSURLCredential *v3;

  v3 = self;
  self->_internal = (NSURLCredentialInternal *)a3;
  if (a3)
  {
    CFRetain(a3);
    CFMakeCollectable(a3);
  }
  else
  {

    return 0;
  }
  return v3;
}

- (NSURLCredential)initWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certArray persistence:(NSURLCredentialPersistence)persistence
{
  int v5;
  NSURLCredential *v8;
  const void *v9;
  NSURLCredentialInternal *v10;
  objc_super v12;

  v5 = persistence;
  v12.receiver = self;
  v12.super_class = (Class)NSURLCredential;
  v8 = -[NSURLCredential init](&v12, sel_init);
  if (v8)
  {
    v9 = (const void *)CFURLCredentialCreateWithIdentityAndCertificateArray(*MEMORY[0x1E0C9AE00], identity, (const __CFArray *)certArray, v5 + 1);
    v10 = (NSURLCredentialInternal *)CFMakeCollectable(v9);
    v8->_internal = v10;
    if (!v10)
    {

      return 0;
    }
  }
  return v8;
}

- (_CFURLCredential)_cfurlcredential
{
  return (_CFURLCredential *)self->_internal;
}

- (NSString)user
{
  return (NSString *)(id)CFURLCredentialGetUsername((uint64_t)self->_internal);
}

- (NSString)password
{
  void *v2;

  v2 = (void *)URLCredential_PasswordBased::safelyCast((uint64_t)self->_internal, (const _CFURLCredential *)a2);
  if (v2)
    v2 = (void *)(*(uint64_t (**)(void *))(*(_QWORD *)v2 + 128))(v2);
  return (NSString *)v2;
}

- (BOOL)hasPassword
{
  uint64_t v2;

  v2 = URLCredential_PasswordBased::safelyCast((uint64_t)self->_internal, (const _CFURLCredential *)a2);
  if (v2)
    LOBYTE(v2) = (*(unsigned int (**)(uint64_t))(*(_QWORD *)v2 + 136))(v2) != 0;
  return v2;
}

- (NSURLCredentialPersistence)persistence
{
  NSURLCredentialInternal *internal;
  char *v3;

  internal = self->_internal;
  if (URLCredential::Class(void)::sOnce_URLCredential != -1)
    dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_8521);
  v3 = (char *)internal + 16;
  if (!internal)
    v3 = 0;
  return *((int *)v3 + 9) - 1;
}

- (id)description
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)NSURLCredential;
  v4 = -[NSURLCredential description](&v6, sel_description);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, CFURLCredentialGetUsername((uint64_t)self->_internal));
}

- (unint64_t)hash
{
  return CFHash(self->_internal);
}

- (BOOL)isEqual:(id)a3
{
  NSURLCredentialInternal *internal;
  const void *v6;

  if (self == a3)
  {
    LOBYTE(internal) = 1;
  }
  else
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    internal = self->_internal;
    if (!internal)
      return (char)internal;
    v6 = (const void *)*((_QWORD *)a3 + 1);
    if (!v6)
    {
LABEL_6:
      LOBYTE(internal) = 0;
      return (char)internal;
    }
    LOBYTE(internal) = CFEqual(internal, v6) != 0;
  }
  return (char)internal;
}

- (SecIdentityRef)identity
{
  NSURLCredentialInternal *internal;

  internal = self->_internal;
  if (!internal)
    return 0;
  if (URLCredential::Class(void)::sOnce_URLCredential != -1)
    dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_8521);
  if (*((_DWORD *)internal + 12) == 3)
    return (SecIdentityRef)(*(uint64_t (**)(uint64_t))(*((_QWORD *)internal + 2) + 120))((uint64_t)internal + 16);
  else
    return 0;
}

- (NSArray)certificates
{
  NSURLCredentialInternal *internal;

  internal = self->_internal;
  if (!internal)
    return 0;
  if (URLCredential::Class(void)::sOnce_URLCredential != -1)
    dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_8521);
  if (*((_DWORD *)internal + 12) == 3)
    return (NSArray *)(*(uint64_t (**)(uint64_t))(*((_QWORD *)internal + 2) + 112))((uint64_t)internal + 16);
  else
    return 0;
}

- (void)encodeWithCoder:(id)a3
{
  CFTypeRef Archive;
  const void *v5;

  Archive = _CFURLCredentialCreateArchive((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (uint64_t)self->_internal);
  if (Archive)
  {
    v5 = Archive;
    if (objc_msgSend(a3, "requiresSecureCoding") && objc_msgSend(a3, "allowsKeyedCoding"))
      objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("__nsurlcredential_proto_plist"));
    else
      objc_msgSend(a3, "encodeObject:", v5);
    CFRelease(v5);
  }
}

- (NSURLCredential)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  const void *v14;
  uint64_t (***v15)(URLCredentialInternetPassword *__hidden, const CFObject *);
  uint64_t (***v16)(URLCredentialInternetPassword *__hidden, const CFObject *);
  uint64_t (***v17)(URLCredentialInternetPassword *__hidden, const CFObject *);
  NSURLCredential *v18;
  uint64_t v20;
  void *v21;

  if (objc_msgSend(a3, "requiresSecureCoding") && objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v21 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v21, "setWithObjects:", v20, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0), CFSTR("__nsurlcredential_proto_plist"));
  }
  else
  {
    v13 = (const __CFDictionary *)objc_msgSend(a3, "decodeObject");
  }
  if (!v13)
    return (NSURLCredential *)-[NSURLCredential _initWithCFURLCredential:](self, "_initWithCFURLCredential:", 0);
  v15 = URLCredential::createFromPropertyList((URLCredential *)*MEMORY[0x1E0C9AE00], v13, v14);
  v16 = v15;
  if (v15)
    v17 = v15 - 2;
  else
    v17 = 0;
  v18 = -[NSURLCredential _initWithCFURLCredential:](self, "_initWithCFURLCredential:", v17);
  if (v16)
    CFRelease(v17);
  return v18;
}

- (BOOL)_hasSWCACreatorAttribute
{
  NSURLCredentialInternal *internal;

  internal = self->_internal;
  if (!internal)
    return 0;
  if (URLCredential::Class(void)::sOnce_URLCredential != -1)
    dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_8521);
  return !*((_DWORD *)internal + 12)
      && URLCredentialInternetPassword::containsSWCACreator(*((const __CFDictionary **)internal + 12)) != 0;
}

- (void)_removeSWCACreatorAttribute
{
  NSURLCredentialInternal *internal;
  const __CFAllocator *v3;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v5;
  const void *v6;
  const void *v7;
  const __CFAllocator *v8;
  void (**v9)(AutoScalar *__hidden);
  void *value;

  internal = self->_internal;
  if (internal)
  {
    if (URLCredential::Class(void)::sOnce_URLCredential != -1)
      dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_8521);
    if (!*((_DWORD *)internal + 12))
    {
      if (URLCredentialInternetPassword::containsSWCACreator(*((const __CFDictionary **)internal + 12)))
      {
        v3 = CFGetAllocator(internal);
        MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, *((CFDictionaryRef *)internal + 12));
        if (MutableCopy)
        {
          v5 = MutableCopy;
          v6 = (const void *)*MEMORY[0x1E0CD6998];
          AutoScalar::AutoScalar((AutoScalar *)&v9, 0);
          CFDictionarySetValue(v5, v6, value);
          v9 = &off_1E14E47E8;
          if (value)
            CFRelease(value);
          v7 = (const void *)*((_QWORD *)internal + 12);
          if (v7)
            CFRelease(v7);
          v8 = CFGetAllocator(internal);
          *((_QWORD *)internal + 12) = CFDictionaryCreateCopy(v8, v5);
          CFRelease(v5);
        }
      }
    }
  }
}

+ (NSURLCredential)credentialWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence
{
  return -[NSURLCredential initWithUser:password:persistence:]([NSURLCredential alloc], "initWithUser:password:persistence:", user, password, persistence);
}

+ (NSURLCredential)credentialWithIdentity:(SecIdentityRef)identity certificates:(NSArray *)certArray persistence:(NSURLCredentialPersistence)persistence
{
  return -[NSURLCredential initWithIdentity:certificates:persistence:]([NSURLCredential alloc], "initWithIdentity:certificates:persistence:", identity, certArray, persistence);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
