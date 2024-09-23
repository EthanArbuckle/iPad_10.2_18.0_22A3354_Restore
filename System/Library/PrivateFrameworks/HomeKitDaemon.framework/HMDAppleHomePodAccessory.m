@implementation HMDAppleHomePodAccessory

- (HMDAppleHomePodAccessory)initWithCoder:(id)a3
{
  HMDAppleHomePodAccessory *v3;
  objc_class *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDAppleHomePodAccessory;
  v3 = -[HMDAppleMediaAccessory initWithCoder:](&v6, sel_initWithCoder_, a3);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    object_setClass(v3, v4);
    -[HMDAppleMediaAccessory setVariant:](v3, "setVariant:", 2);
  }
  return v3;
}

- (BOOL)isHomePodMini
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
