@implementation NSFileProviderKernelPartialFolderMaterializationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderKernelPartialFolderMaterializationInfo)initWithFileName:(id)a3
{
  NSFileProviderKernelPartialFolderMaterializationInfo *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFileProviderKernelPartialFolderMaterializationInfo;
  v4 = -[NSFileProviderKernelPartialFolderMaterializationInfo init](&v6, sel_init);
  if (v4)
    v4->fileName = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderKernelPartialFolderMaterializationInfo;
  -[NSFileProviderKernelPartialFolderMaterializationInfo dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderKernelPartialFolderMaterializationInfo instances should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", self->fileName, CFSTR("filename"));
}

- (NSFileProviderKernelPartialFolderMaterializationInfo)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderKernelPartialFolderMaterializationInfo should only ever be decoded by XPC"), 0));
  }
  self->fileName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filename"));
  return self;
}

- (NSString)fileName
{
  return self->fileName;
}

@end
