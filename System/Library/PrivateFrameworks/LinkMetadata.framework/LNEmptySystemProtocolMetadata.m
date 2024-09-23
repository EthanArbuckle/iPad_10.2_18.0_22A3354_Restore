@implementation LNEmptySystemProtocolMetadata

- (LNEmptySystemProtocolMetadata)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LNEmptySystemProtocolMetadata;
  return -[LNEmptySystemProtocolMetadata init](&v3, sel_init);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  LNEmptySystemProtocolMetadata *v4;
  LNEmptySystemProtocolMetadata *v5;
  char isKindOfClass;

  v4 = (LNEmptySystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    isKindOfClass = 1;
  }
  else if (v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
