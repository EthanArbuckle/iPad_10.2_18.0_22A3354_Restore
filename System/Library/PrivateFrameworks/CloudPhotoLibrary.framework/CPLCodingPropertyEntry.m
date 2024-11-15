@implementation CPLCodingPropertyEntry

- (void)ivarAddrForObject:(id)a3
{
  void *result;

  result = self->_ivar;
  if (result)
    return (char *)a3 + ivar_getOffset((Ivar)result);
  return result;
}

- (id)ivarValueForObject:(id)a3
{
  objc_ivar *ivar;
  void *v4;

  ivar = self->_ivar;
  if (ivar)
  {
    object_getIvar(a3, ivar);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setIvarValue:(id)a3 forObject:(id)a4
{
  objc_ivar *ivar;

  ivar = self->_ivar;
  if (ivar)
    object_setIvar(a4, ivar, a3);
}

- (char)propertyType
{
  return self->_propertyType;
}

- (void)setPropertyType:(char)a3
{
  self->_propertyType = a3;
}

- (NSSet)propertyClasses
{
  return self->_propertyClasses;
}

- (void)setPropertyClasses:(id)a3
{
  objc_storeStrong((id *)&self->_propertyClasses, a3);
}

- (SEL)propertyGetter
{
  return self->_propertyGetter;
}

- (void)setPropertyGetter:(SEL)a3
{
  self->_propertyGetter = a3;
}

- (SEL)propertySetter
{
  return self->_propertySetter;
}

- (void)setPropertySetter:(SEL)a3
{
  self->_propertySetter = a3;
}

- (void)propertyGetterIMP
{
  return self->_propertyGetterIMP;
}

- (void)setPropertyGetterIMP:(void *)a3
{
  self->_propertyGetterIMP = a3;
}

- (void)propertySetterIMP
{
  return self->_propertySetterIMP;
}

- (void)setPropertySetterIMP:(void *)a3
{
  self->_propertySetterIMP = a3;
}

- (objc_ivar)ivar
{
  return self->_ivar;
}

- (void)setIvar:(objc_ivar *)a3
{
  self->_ivar = a3;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (NSString)structName
{
  return self->_structName;
}

- (void)setStructName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structName, 0);
  objc_storeStrong((id *)&self->_propertyClasses, 0);
}

@end
