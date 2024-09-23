@implementation NSFileProviderMovingInfo

+ (id)infoWithDestinationDirectoryURL:(id)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_opt_new();
  v4[1] = a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderMovingInfo;
  -[NSFileProviderMovingInfo dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderMovingInfo instances should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", self->destinationDirectoryURL, CFSTR("destinationDirectoryURL"));
}

- (NSFileProviderMovingInfo)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProviderMovingInfo should only ever be decoded by XPC"), 0));
  }
  self->destinationDirectoryURL = (NSURL *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationDirectoryURL"));
  return self;
}

- (NSURL)destinationDirectoryURL
{
  return self->destinationDirectoryURL;
}

@end
