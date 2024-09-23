@implementation MXMOSLogDevice_Internal

- (MXMOSLogDevice_Internal)initWithOSLogDevice:(id)a3
{
  id v5;
  MXMOSLogDevice_Internal *v6;
  MXMOSLogDevice_Internal *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMOSLogDevice_Internal;
  v6 = -[MXMOSLogDevice_Internal init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rawDevice, a3);

  return v7;
}

- (MXMOSLogDevice_Internal)initWithName:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  MXMOSLogDevice_Internal *v9;
  MXMOSLogDevice_Internal *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MXMOSLogDevice_Internal;
  v9 = -[MXMOSLogDevice_Internal init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (OSLogDevice)rawDevice
{
  return self->_rawDevice;
}

- (void)setRawDevice:(id)a3
{
  objc_storeStrong((id *)&self->_rawDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawDevice, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
