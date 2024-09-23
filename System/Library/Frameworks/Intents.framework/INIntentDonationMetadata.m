@implementation INIntentDonationMetadata

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INIntentDonationMetadata;
  return -[INIntentDonationMetadata init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_init");
}

- (INIntentDonationMetadata)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INIntentDonationMetadata;
  return -[INIntentDonationMetadata init](&v4, sel_init, a3);
}

+ (Class)_intentClass
{
  Class result;

  result = (Class)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("+[INIntentDonationMetadata _intentClass] must be overridden"));
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
