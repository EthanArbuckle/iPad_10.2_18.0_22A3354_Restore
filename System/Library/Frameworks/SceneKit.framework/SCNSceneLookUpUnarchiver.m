@implementation SCNSceneLookUpUnarchiver

- (SCNSceneLookUpUnarchiver)initWithCoder:(id)a3
{
  SCNSceneLookUpUnarchiver *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNSceneLookUpUnarchiver;
  v4 = -[SCNSceneLookUpUnarchiver init](&v6, sel_init);
  if (v4)
    objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("db"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
