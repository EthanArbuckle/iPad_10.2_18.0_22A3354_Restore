@implementation ASCICloudKeychainLoginChoice

- (unint64_t)loginChoiceKind
{
  return 5;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCICloudKeychainLoginChoice)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCICloudKeychainLoginChoice;
  return -[ASCICloudKeychainLoginChoice init](&v4, sel_init, a3);
}

@end
