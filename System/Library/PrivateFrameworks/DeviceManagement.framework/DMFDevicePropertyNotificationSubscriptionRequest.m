@implementation DMFDevicePropertyNotificationSubscriptionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFDevicePropertyNotificationSubscriptionRequest)initWithCoder:(id)a3
{
  id v4;
  DMFDevicePropertyNotificationSubscriptionRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *propertyKeys;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMFDevicePropertyNotificationSubscriptionRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("propertyKeys"));
    v9 = objc_claimAutoreleasedReturnValue();
    propertyKeys = v5->_propertyKeys;
    v5->_propertyKeys = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFDevicePropertyNotificationSubscriptionRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFDevicePropertyNotificationSubscriptionRequest propertyKeys](self, "propertyKeys", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("propertyKeys"));

}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (void)setPropertyKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyKeys, 0);
}

@end
