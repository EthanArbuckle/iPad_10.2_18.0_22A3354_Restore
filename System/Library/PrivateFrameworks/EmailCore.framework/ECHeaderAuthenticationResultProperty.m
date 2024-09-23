@implementation ECHeaderAuthenticationResultProperty

- (ECHeaderAuthenticationResultProperty)initWithPropertyType:(id)a3 property:(id)a4 value:(id)a5
{
  id v9;
  id v10;
  id v11;
  ECHeaderAuthenticationResultProperty *v12;
  ECHeaderAuthenticationResultProperty *v13;
  uint64_t v14;
  NSString *fullProperty;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ECHeaderAuthenticationResultProperty;
  v12 = -[ECHeaderAuthenticationResultProperty init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_propertyType, a3);
    objc_storeStrong((id *)&v13->_property, a4);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v9, v10);
    fullProperty = v13->_fullProperty;
    v13->_fullProperty = (NSString *)v14;

    objc_storeStrong((id *)&v13->_value, a5);
  }

  return v13;
}

- (NSString)fullProperty
{
  return self->_fullProperty;
}

- (NSString)propertyType
{
  return self->_propertyType;
}

- (NSString)property
{
  return self->_property;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_propertyType, 0);
  objc_storeStrong((id *)&self->_fullProperty, 0);
}

@end
