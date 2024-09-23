@implementation HMFObject

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)privateDescription
{
  if (qword_1ED013280 != -1)
    dispatch_once(&qword_1ED013280, &__block_literal_global_91);
  return (NSString *)HMFObjectDescriptionWithOptions(self, _MergedGlobals_77 | 2u);
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSString)debugDescription
{
  return (NSString *)HMFObjectDescriptionWithOptions(self, 0);
}

@end
