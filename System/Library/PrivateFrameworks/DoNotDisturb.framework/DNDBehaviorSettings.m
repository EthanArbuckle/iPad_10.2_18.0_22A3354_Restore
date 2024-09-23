@implementation DNDBehaviorSettings

- (DNDBehaviorSettings)init
{
  return (DNDBehaviorSettings *)-[DNDBehaviorSettings _initWithSettings:](self, "_initWithSettings:", 0);
}

- (id)_initWithSettings:(id)a3
{
  return -[DNDBehaviorSettings _initWithInterruptionBehaviorSetting:](self, "_initWithInterruptionBehaviorSetting:", objc_msgSend(a3, "interruptionBehaviorSetting"));
}

- (id)_initWithInterruptionBehaviorSetting:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DNDBehaviorSettings;
  result = -[DNDBehaviorSettings init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  DNDBehaviorSettings *v4;
  DNDBehaviorSettings *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (DNDBehaviorSettings *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDBehaviorSettings interruptionBehaviorSetting](self, "interruptionBehaviorSetting");
      v7 = -[DNDBehaviorSettings interruptionBehaviorSetting](v5, "interruptionBehaviorSetting");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  DNDStringFromInterruptionBehaviorSetting(-[DNDBehaviorSettings interruptionBehaviorSetting](self, "interruptionBehaviorSetting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; interruptionBehaviorSetting: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDBehaviorSettings _initWithSettings:]([DNDMutableBehaviorSettings alloc], "_initWithSettings:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDBehaviorSettings)initWithCoder:(id)a3
{
  return (DNDBehaviorSettings *)-[DNDBehaviorSettings _initWithInterruptionBehaviorSetting:](self, "_initWithInterruptionBehaviorSetting:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("interruptionBehaviorSetting")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDBehaviorSettings interruptionBehaviorSetting](self, "interruptionBehaviorSetting"), CFSTR("interruptionBehaviorSetting"));

}

- (unint64_t)interruptionBehaviorSetting
{
  return self->_interruptionBehaviorSetting;
}

@end
