@implementation HMAnnounceUserSettings

- (HMAnnounceUserSettings)initWithDeviceNotificationMode:(unint64_t)a3
{
  HMAnnounceUserSettings *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMAnnounceUserSettings;
  result = -[HMAnnounceUserSettings init](&v5, sel_init);
  if (result)
    result->_deviceNotificationMode = a3;
  return result;
}

- (HMAnnounceUserSettings)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMAnnounceUserSettings *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.Announce.DeviceNotificationModeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMAnnounceUserSettings initWithDeviceNotificationMode:](self, "initWithDeviceNotificationMode:", objc_msgSend(v5, "unsignedIntegerValue"));
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[HMAnnounceUserSettings deviceNotificationMode](self, "deviceNotificationMode"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("HMD.Announce.DeviceNotificationModeKey"));

}

- (BOOL)isEqual:(id)a3
{
  HMAnnounceUserSettings *v4;
  HMAnnounceUserSettings *v5;
  HMAnnounceUserSettings *v6;
  HMAnnounceUserSettings *v7;
  uint64_t v8;
  BOOL v9;

  v4 = (HMAnnounceUserSettings *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      v8 = -[HMAnnounceUserSettings deviceNotificationMode](v6, "deviceNotificationMode");
      v9 = v8 == -[HMAnnounceUserSettings deviceNotificationMode](self, "deviceNotificationMode");
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)shortDescription
{
  return (id)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAnnounceUserSettings deviceNotificationMode](self, "deviceNotificationMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("deviceNotificationMode"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)deviceNotificationMode
{
  return self->_deviceNotificationMode;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
