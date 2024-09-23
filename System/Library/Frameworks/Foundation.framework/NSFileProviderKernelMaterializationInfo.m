@implementation NSFileProviderKernelMaterializationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSFileProviderKernelMaterializationInfo)kernelMaterializationInfoWithOperation:(unsigned int)a3
{
  NSFileProviderKernelMaterializationInfo *v4;

  v4 = objc_alloc_init(NSFileProviderKernelMaterializationInfo);
  v4->operation = a3;
  return v4;
}

+ (id)fileMaterializationInfoWithOperation:(unsigned int)a3 size:(int64_t)a4 offset:(int64_t)a5
{
  NSFileProviderKernelMaterializationInfo *v8;

  v8 = objc_alloc_init(NSFileProviderKernelMaterializationInfo);
  v8->operation = a3;
  v8->fileMaterializationInfo = -[NSFileProviderKernelFileMaterializationInfo initWithSize:offset:]([NSFileProviderKernelFileMaterializationInfo alloc], "initWithSize:offset:", a4, a5);
  return v8;
}

+ (id)partialFolderMaterializationInfoWithOperation:(unsigned int)a3 fileName:(const char *)a4
{
  NSFileProviderKernelMaterializationInfo *v6;

  v6 = objc_alloc_init(NSFileProviderKernelMaterializationInfo);
  v6->operation = a3;
  v6->partialFolderMaterializationInfo = -[NSFileProviderKernelPartialFolderMaterializationInfo initWithFileName:]([NSFileProviderKernelPartialFolderMaterializationInfo alloc], "initWithFileName:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4));
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderKernelMaterializationInfo;
  -[NSFileProviderKernelMaterializationInfo dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderKernelMaterializationInfo instances should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->operation), CFSTR("fileop"));
  objc_msgSend(a3, "encodeObject:forKey:", self->fileMaterializationInfo, CFSTR("fileinfo"));
  objc_msgSend(a3, "encodeObject:forKey:", self->partialFolderMaterializationInfo, CFSTR("folderinfo"));
}

- (NSFileProviderKernelMaterializationInfo)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderKernelMaterializationInfo should only ever be decoded by XPC"), 0));
  }
  self->operation = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileop")), "unsignedIntValue");
  self->fileMaterializationInfo = (NSFileProviderKernelFileMaterializationInfo *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileinfo"));
  self->partialFolderMaterializationInfo = (NSFileProviderKernelPartialFolderMaterializationInfo *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("folderinfo"));
  return self;
}

- (unsigned)operation
{
  return self->operation;
}

- (NSFileProviderKernelFileMaterializationInfo)fileMaterializationInfo
{
  return self->fileMaterializationInfo;
}

- (NSFileProviderKernelPartialFolderMaterializationInfo)partialFolderMaterializationInfo
{
  return self->partialFolderMaterializationInfo;
}

@end
