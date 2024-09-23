@implementation NSFileProviderKernelFileMaterializationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderKernelFileMaterializationInfo)initWithSize:(int64_t)a3 offset:(int64_t)a4
{
  NSFileProviderKernelFileMaterializationInfo *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSFileProviderKernelFileMaterializationInfo;
  result = -[NSFileProviderKernelFileMaterializationInfo init](&v7, sel_init);
  if (result)
  {
    result->size = a3;
    result->offset = a4;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderKernelFileMaterializationInfo instances should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeInt64:forKey:", self->size, CFSTR("NSSize"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->offset, CFSTR("NSOffset"));
}

- (NSFileProviderKernelFileMaterializationInfo)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderKernelFileMaterializationInfo should only ever be decoded by XPC"), 0));
  }
  self->size = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NSSize"));
  self->offset = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NSOffset"));
  return self;
}

- (int64_t)size
{
  return self->size;
}

- (int64_t)offset
{
  return self->offset;
}

@end
