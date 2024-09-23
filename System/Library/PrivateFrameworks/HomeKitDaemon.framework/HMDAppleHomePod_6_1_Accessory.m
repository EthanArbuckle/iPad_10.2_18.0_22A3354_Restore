@implementation HMDAppleHomePod_6_1_Accessory

- (HMDAppleHomePod_6_1_Accessory)initWithCoder:(id)a3
{
  HMDAppleHomePod_6_1_Accessory *v3;
  objc_class *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDAppleHomePod_6_1_Accessory;
  v3 = -[HMDAppleMediaAccessory initWithCoder:](&v6, sel_initWithCoder_, a3);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    object_setClass(v3, v4);
    -[HMDAppleMediaAccessory setVariant:](v3, "setVariant:", 4);
  }
  return v3;
}

- (BOOL)isHomePod2ndGen
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
