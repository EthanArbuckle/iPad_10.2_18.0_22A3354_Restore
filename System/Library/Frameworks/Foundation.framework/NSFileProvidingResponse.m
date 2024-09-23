@implementation NSFileProvidingResponse

+ (id)responseWithError:(id)a3
{
  NSFileProvidingResponse *v4;

  v4 = objc_alloc_init(NSFileProvidingResponse);
  v4->error = (NSError *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProvidingResponse;
  -[NSFileProvidingResponse dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProvidingResponse instances should only ever be encoded by XPC"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->providedItemRecursiveGenerationCount), CFSTR("gencount"));
  objc_msgSend(a3, "encodeObject:forKey:", self->error, CFSTR("error"));
  objc_msgSend(a3, "encodeObject:forKey:", self->sandboxToken, CFSTR("sandboxtoken"));
}

- (NSFileProvidingResponse)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("NSFileProvidingResponse should only ever be decoded by XPC"), 0));
  }
  self->providedItemRecursiveGenerationCount = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gencount")), "unsignedIntegerValue");
  self->error = (NSError *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  self->sandboxToken = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sandboxtoken"));
  return self;
}

- (unint64_t)providedItemRecursiveGenerationCount
{
  return self->providedItemRecursiveGenerationCount;
}

- (void)setProvidedItemRecursiveGenerationCount:(unint64_t)a3
{
  self->providedItemRecursiveGenerationCount = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)sandboxToken
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSandboxToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
