@implementation NSException

- (NSDictionary)userInfo
{
  return self->userInfo;
}

- (NSException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5 osLogPack:(void *)a6 size:(unint64_t)a7
{
  char *v12;
  const __CFString *reason;
  CFStringEncoding SystemEncoding;
  const char *CStringPtr;
  uint64_t v16;
  CFDataRef v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  self->name = (NSString *)objc_msgSend(a3, "copy");
  self->reason = (NSString *)objc_msgSend(a4, "copy");
  self->userInfo = (NSDictionary *)a5;
  v12 = (char *)v19 - ((_os_log_pack_size() + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
    goto LABEL_4;
  if (_NSIsNSCFConstantString((uint64_t)self->reason))
  {
    reason = (const __CFString *)self->reason;
    SystemEncoding = CFStringGetSystemEncoding();
    CStringPtr = CFStringGetCStringPtr(reason, SystemEncoding);
    v16 = _os_log_pack_fill();
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = CStringPtr;
    a6 = v12;
LABEL_4:
    __CFLookUpClass("NSMutableDictionary");
    self->reserved = (id)objc_opt_new();
    v17 = CFDataCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)a6, a7);
    objc_msgSend(self->reserved, "setObject:forKey:", v17, CFSTR("osLogPack"));

  }
  return self;
}

- (NSException)initWithName:(NSExceptionName)aName reason:(NSString *)aReason userInfo:(NSDictionary *)aUserInfo
{
  return -[NSException initWithName:reason:userInfo:osLogPack:size:](self, "initWithName:reason:userInfo:osLogPack:size:", aName, aReason, aUserInfo, 0, 0);
}

+ (NSException)exceptionWithName:(NSExceptionName)name reason:(NSString *)reason userInfo:(NSDictionary *)userInfo
{
  return (NSException *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithName:reason:userInfo:", name, reason, userInfo);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSException;
  -[NSException dealloc](&v3, sel_dealloc);
}

- (NSExceptionName)name
{
  return self->name;
}

- (NSString)reason
{
  return self->reason;
}

- (NSArray)callStackReturnAddresses
{
  return (NSArray *)objc_msgSend(self->reserved, "objectForKey:", CFSTR("callStackReturnAddresses"));
}

- (NSArray)callStackSymbols
{
  return (NSArray *)objc_msgSend(self->reserved, "objectForKey:", CFSTR("callStackSymbols"));
}

- (BOOL)_isUnarchived
{
  return objc_msgSend(self->reserved, "objectForKey:", CFSTR("_NSExceptionWasUnarchived")) != 0;
}

- (void)_markAsUnarchived
{
  void *v3;

  if (!self->reserved)
  {
    __CFLookUpClass("NSMutableDictionary");
    v3 = (void *)objc_opt_new();
    self->reserved = v3;
    objc_msgSend(v3, "setObject:forKey:", CFSTR("SENTINEL"), CFSTR("_NSExceptionWasUnarchived"));
  }
}

- (BOOL)_installStackTraceKeyIfNeeded
{
  NSDictionary *userInfo;
  uint64_t v4;
  NSDictionary *v5;
  NSDictionary *v6;

  userInfo = self->userInfo;
  if (!userInfo)
    goto LABEL_6;
  if (-[NSDictionary objectForKey:](userInfo, "objectForKey:", CFSTR("NSStackTraceKey")))
  {
    LOBYTE(v4) = 0;
    return v4;
  }
  v5 = self->userInfo;
  if (v5)
  {
    v6 = (NSDictionary *)-[NSDictionary mutableCopy](v5, "mutableCopy");
  }
  else
  {
LABEL_6:
    __CFLookUpClass("NSMutableDictionary");
    v6 = (NSDictionary *)objc_opt_new();
  }
  self->userInfo = v6;
  v4 = objc_msgSend((id)objc_msgSend(self->reserved, "objectForKey:", CFSTR("callStackReturnAddresses")), "description");
  if (v4)
  {
    -[NSDictionary setObject:forKey:](self->userInfo, "setObject:forKey:", v4, CFSTR("NSStackTraceKey"));
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (a3 && (v5 = objc_opt_class(), v5 == objc_opt_class()))
    return -[NSString isEqual:](self->name, "isEqual:", *((_QWORD *)a3 + 1));
  else
    return 0;
}

- (unint64_t)hash
{
  return -[NSString hash](self->name, "hash");
}

- (id)description
{
  id result;

  result = self->reason;
  if (!result)
    return self->name;
  return result;
}

- (void)raise
{
  objc_exception_throw(self);
}

- (NSException)init
{

  return 0;
}

+ (NSException)exceptionWithName:(id)a3 reason:(id)a4 userInfo:(id)a5 osLogPack:(void *)a6 size:(unint64_t)a7
{
  return (NSException *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithName:reason:userInfo:osLogPack:size:", a3, a4, a5, a6, a7);
}

+ (void)raise:(NSExceptionName)name format:(NSString *)format arguments:(va_list)argList
{
  const __CFString *v7;

  if (format)
    v7 = (id)CFStringCreateWithFormatAndArguments((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, (CFStringRef)format, argList);
  else
    v7 = &stru_1E1337B18;
  objc_exception_throw((id)objc_msgSend(a1, "exceptionWithName:reason:userInfo:", name, v7, 0));
}

+ (void)raise:(NSExceptionName)name format:(NSString *)format
{
  const __CFString *v6;
  va_list v7;
  uint64_t v8;
  va_list va;

  va_start(va, format);
  v8 = *MEMORY[0x1E0C80C00];
  if (format)
  {
    va_copy(v7, va);
    v6 = (id)CFStringCreateWithFormatAndArguments((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, (CFStringRef)format, va);
  }
  else
  {
    v6 = &stru_1E1337B18;
  }
  objc_exception_throw((id)objc_msgSend(a1, "exceptionWithName:reason:userInfo:", name, v6, 0, v7, v8));
}

- (NSException)initWithCoder:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
