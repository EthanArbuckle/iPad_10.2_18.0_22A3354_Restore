@implementation _DDUIEmptyDeviceGroup

- (_DDUIEmptyDeviceGroup)initWithName:(id)a3
{
  id v4;
  _DDUIEmptyDeviceGroup *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DDUIEmptyDeviceGroup;
  v5 = -[_DDUIEmptyDeviceGroup init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("ddui@empty.device.group.identifier");
}

- (NSString)accountIdentifier
{
  return 0;
}

- (NSString)accountAltDSID
{
  return 0;
}

- (unsigned)preferredDeviceType
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
