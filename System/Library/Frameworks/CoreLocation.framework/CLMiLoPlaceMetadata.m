@implementation CLMiLoPlaceMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;

  v4 = (void *)objc_opt_class();
  return (id)objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPlaceMetadata)initWithCoder:(id)a3
{
  return 0;
}

@end
