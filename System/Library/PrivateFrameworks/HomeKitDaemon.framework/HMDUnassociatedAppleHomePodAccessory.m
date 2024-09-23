@implementation HMDUnassociatedAppleHomePodAccessory

- (HMDUnassociatedAppleHomePodAccessory)initWithCoder:(id)a3
{
  id v4;
  HMDUnassociatedAppleHomePodAccessory *v5;
  objc_class *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDUnassociatedAppleHomePodAccessory;
  v5 = -[HMDUnassociatedAppleMediaAccessory initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    object_setClass(v5, v6);
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("HMD.un.var")) & 1) == 0)
      -[HMDUnassociatedAppleMediaAccessory setVariant:](v5, "setVariant:", 2);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
