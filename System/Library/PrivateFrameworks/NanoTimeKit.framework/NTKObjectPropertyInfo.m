@implementation NTKObjectPropertyInfo

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isDynamic
{
  return self->_isDynamic;
}

- (void)setIsDynamic:(BOOL)a3
{
  self->_isDynamic = a3;
}

- (NSString)typeString
{
  return self->_typeString;
}

- (void)setTypeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
