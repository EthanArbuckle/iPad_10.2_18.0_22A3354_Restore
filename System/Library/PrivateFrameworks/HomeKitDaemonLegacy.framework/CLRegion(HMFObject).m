@implementation CLRegion(HMFObject)

- (id)shortDescription
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("<%@>"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (NSString)shortDescription
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

@end
