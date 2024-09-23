@implementation NSFileProvidingInfo

+ (id)infoWithReaderID:(id)a3 options:(unint64_t)a4 auditToken:(id *)a5 kernelMaterializationInfo:(id)a6
{
  int v8;
  NSFileProvidingInfo *v10;
  __int128 v11;

  v8 = a4;
  v10 = objc_alloc_init(NSFileProvidingInfo);
  v11 = *(_OWORD *)&a5->var0[4];
  *(_OWORD *)v10->readerAuditToken.val = *(_OWORD *)a5->var0;
  *(_OWORD *)&v10->readerAuditToken.val[4] = v11;
  v10->readerID = (NSString *)objc_msgSend(a3, "copy");
  v10->readingOptions = v8 & 0x7FFFFFFF;
  v10->kernelMaterializationInfo = (NSFileProviderKernelMaterializationInfo *)a6;
  return v10;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProvidingInfo;
  -[NSFileProvidingInfo dealloc](&v3, sel_dealloc);
}

- (void)setProvidedItemRecursiveGenerationCount:(unint64_t)a3
{
  self->recursiveGenerationCount = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProvidingInfo instances should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeBytes:length:forKey:", &self->readerAuditToken, 32, CFSTR("audittoken"));
  objc_msgSend(a3, "encodeObject:forKey:", self->readerID, CFSTR("readerid"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->readingOptions), CFSTR("options"));
  objc_msgSend(a3, "encodeObject:forKey:", self->kernelMaterializationInfo, CFSTR("kernmatinfo"));
}

- (NSFileProvidingInfo)initWithCoder:(id)a3
{
  __int128 *v5;
  __int128 v6;
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProvidingInfo should only ever be decoded by XPC"), 0));
  }
  v8 = 0;
  v5 = (__int128 *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("audittoken"), &v8);
  if (v5 && v8 == 32)
  {
    v6 = *v5;
    *(_OWORD *)&self->readerAuditToken.val[4] = v5[1];
    *(_OWORD *)self->readerAuditToken.val = v6;
    self->readerID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerid"));
    self->readingOptions = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options")), "unsignedIntegerValue");
    self->kernelMaterializationInfo = (NSFileProviderKernelMaterializationInfo *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kernmatinfo"));
  }
  else
  {

    v9 = CFSTR("NSDebugDescription");
    v10[0] = CFSTR("Audit token is missing or invalid");
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
    return 0;
  }
  return self;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)readerAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->readerAuditToken, 32, 1, 0);
  return result;
}

- (NSString)readerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)readingOptions
{
  return self->readingOptions;
}

- (NSFileProviderKernelMaterializationInfo)kernelMaterializationInfo
{
  return (NSFileProviderKernelMaterializationInfo *)objc_getProperty(self, a2, 32, 1);
}

@end
