@implementation NSUUID

+ (NSUUID)allocWithZone:(_NSZone *)a3
{
  objc_class *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (NSUUID == a1 || (id)objc_opt_class() == a1)
  {
    v6 = (objc_class *)objc_opt_self();
    return (NSUUID *)NSAllocateObject(v6, 0, a3);
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NSUUID;
    return (NSUUID *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (unint64_t)hash
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  v3[1] = 0;
  -[NSUUID getUUIDBytes:](self, "getUUIDBytes:", v3);
  return CFHashBytes();
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self == a3)
    return 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v9 = 0;
  v10 = 0;
  -[NSUUID getUUIDBytes:](self, "getUUIDBytes:", &v9);
  v7 = 0;
  v8 = 0;
  objc_msgSend(a3, "getUUIDBytes:", &v7);
  return v9 == v7 && v10 == v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSUUID)UUID
{
  return (NSUUID *)objc_alloc_init((Class)a1);
}

+ (BOOL)_compatibilityBehavior
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (NSUUID)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSUUID;
  return -[NSUUID init](&v3, sel_init);
}

- (NSUUID)initWithUUIDString:(NSString *)string
{
  return 0;
}

- (NSUUID)initWithUUIDBytes:(const unsigned __int8 *)bytes
{
  return 0;
}

- (NSComparisonResult)compare:(NSUUID *)otherUUID
{
  int v4;
  uint64_t i;
  int v6;
  BOOL v7;
  NSComparisonResult v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self == otherUUID)
    return 0;
  v11 = 0uLL;
  -[NSUUID getUUIDBytes:](self, "getUUIDBytes:", &v11);
  v10 = 0uLL;
  -[NSUUID getUUIDBytes:](otherUUID, "getUUIDBytes:", &v10);
  v4 = 0;
  v12 = v10;
  v13 = v11;
  for (i = 15; i != -1; --i)
  {
    v6 = *((unsigned __int8 *)&v13 + i) - *((unsigned __int8 *)&v12 + i);
    v4 = v4 & (((v6 - 1) & ~v6) >> 8) | v6;
  }
  v7 = v4 < 0;
  v8 = (unint64_t)(v4 != 0);
  if (v7)
    return -1;
  else
    return v8;
}

- (void)getUUIDBytes:(unsigned __int8 *)uuid
{
  *(_QWORD *)uuid = 0;
  *((_QWORD *)uuid + 1) = 0;
}

- (NSString)UUIDString
{
  return (NSString *)&stru_1E0F56070;
}

- (__CFString)_cfUUIDString
{
  NSString *v2;
  __CFString *v3;

  v2 = -[NSUUID UUIDString](self, "UUIDString");
  v3 = (__CFString *)v2;
  if (v2)
    CFRetain(v2);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v5[1] = 0;
  -[NSUUID getUUIDBytes:](self, "getUUIDBytes:", v5);
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithUUIDBytes:", v5);
}

- (void)encodeWithCoder:(id)a3
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("-[NSUUID encodeWithCoder]: NSUUIDs cannot be encoded by non-keyed coders"), 0));
  v5[0] = 0;
  v5[1] = 0;
  -[NSUUID getUUIDBytes:](self, "getUUIDBytes:", v5);
  objc_msgSend(a3, "encodeBytes:length:forKey:", v5, 16, CFSTR("NS.uuidbytes"));
}

- (NSUUID)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("-[NSUUID initWithCoder]: NSUUIDs cannot be decoded by non-keyed coders"), 0));
  v9 = 0;
  v5 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("NS.uuidbytes"), &v9);
  if (v5)
  {
    if (v9 == 16)
      return -[NSUUID initWithUUIDBytes:](self, "initWithUUIDBytes:", v5);
    if (dyld_program_sdk_at_least())
    {
      v10 = CFSTR("NSLocalizedDescription");
      v11 = CFSTR("UUID bytes were not the expected length");
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v8 = 4864;
      goto LABEL_9;
    }
    return -[NSUUID init](self, "init");
  }
  if (!dyld_program_sdk_at_least())
    return -[NSUUID init](self, "init");
  v12 = CFSTR("NSLocalizedDescription");
  v13[0] = CFSTR("UUID bytes not found in archive");
  v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = 4865;
LABEL_9:
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v8, v7));

  return 0;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

@end
