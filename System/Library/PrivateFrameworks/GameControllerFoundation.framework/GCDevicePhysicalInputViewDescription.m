@implementation GCDevicePhysicalInputViewDescription

- (GCDevicePhysicalInputViewDescription)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputViewDescription;
  return -[GCDevicePhysicalInputViewDescription init](&v3, sel_init);
}

- (BOOL)validate:(id *)a3
{
  return 1;
}

- (id)valueForUndefinedKey:(id)a3
{
  return (id)-[NSMutableDictionary valueForKey:](self->_additionalConfiguration, "valueForKey:", a3);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  NSMutableDictionary *additionalConfiguration;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  additionalConfiguration = self->_additionalConfiguration;
  if (!additionalConfiguration)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_additionalConfiguration;
    self->_additionalConfiguration = v8;

    additionalConfiguration = self->_additionalConfiguration;
  }
  -[NSMutableDictionary setValue:forUndefinedKey:](additionalConfiguration, "setValue:forUndefinedKey:", v10, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalConfiguration, 0);
}

@end
