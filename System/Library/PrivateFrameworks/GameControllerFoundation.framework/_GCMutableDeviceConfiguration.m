@implementation _GCMutableDeviceConfiguration

- (id)_initWithIdentifier:(id)a3 attributes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "mutableCopy");
  v10.receiver = self;
  v10.super_class = (Class)_GCMutableDeviceConfiguration;
  v8 = -[_GCDeviceConfiguration _initWithIdentifier:attributes:](&v10, sel__initWithIdentifier_attributes_, v6, v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _GCDeviceConfiguration *v4;
  NSObject *identifier;
  void *v6;
  id v7;

  v4 = [_GCDeviceConfiguration alloc];
  identifier = self->super._identifier;
  v6 = (void *)-[NSDictionary copy](self->super._attributes, "copy");
  v7 = -[_GCDeviceConfiguration _initWithIdentifier:attributes:](v4, "_initWithIdentifier:attributes:", identifier, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[_GCMutableDeviceConfiguration _initWithIdentifier:attributes:]([_GCMutableDeviceConfiguration alloc], "_initWithIdentifier:attributes:", self->super._identifier, self->super._attributes);
}

- (void)setValue:(id)a3 forAttribute:(id)a4
{
  -[NSDictionary setValue:forKey:](self->super._attributes, "setValue:forKey:", a3, a4);
}

- (void)setIdentifier:(id)a3
{
  NSObject *v4;
  NSObject *identifier;

  v4 = objc_msgSend(a3, "copyWithZone:", 0);
  identifier = self->super._identifier;
  self->super._identifier = v4;

}

- (void)setTransient:(BOOL)a3
{
  id v4;

  +[NSNumber numberWithBool:](&off_1F03A9E90, "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_GCMutableDeviceConfiguration setValue:forAttribute:](self, "setValue:forAttribute:", v4, CFSTR("Transient"));

}

- (void)setPriority:(unint64_t)a3
{
  id v4;

  +[NSNumber numberWithUnsignedInteger:](&off_1F03A9E90, "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_GCMutableDeviceConfiguration setValue:forAttribute:](self, "setValue:forAttribute:", v4, CFSTR("Priority"));

}

- (void)setDeviceIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copyWithZone:", 0);
  -[_GCMutableDeviceConfiguration setValue:forAttribute:](self, "setValue:forAttribute:", v4, CFSTR("DeviceIdentifier"));

}

- (void)setDeviceDependencies:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[_GCMutableDeviceConfiguration setValue:forAttribute:](self, "setValue:forAttribute:", v4, CFSTR("DeviceDependencies"));

}

- (void)setDeviceBuilderIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copyWithZone:", 0);
  -[_GCMutableDeviceConfiguration setValue:forAttribute:](self, "setValue:forAttribute:", v4, CFSTR("DeviceBuilderIdentifier"));

}

@end
