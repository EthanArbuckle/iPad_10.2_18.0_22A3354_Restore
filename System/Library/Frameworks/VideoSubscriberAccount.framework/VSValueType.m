@implementation VSValueType

- (NSArray)properties
{
  return self->_properties;
}

- (BOOL)isSuperclassAlsoValueType
{
  return objc_msgSend((id)-[objc_class superclass](-[VSValueType implementationClass](self, "implementationClass"), "superclass"), "isEqual:", objc_opt_class()) ^ 1;
}

- (Class)implementationClass
{
  return self->_implementationClass;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setImplementationClass:(Class)a3
{
  objc_storeStrong((id *)&self->_implementationClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_implementationClass, 0);
}

@end
