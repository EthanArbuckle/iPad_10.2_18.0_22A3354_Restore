@implementation MPSGraphListType

- (MPSGraphListType)initWithElementType:(id)a3
{
  id v4;
  MPSGraphListType *v5;
  uint64_t v6;
  MPSGraphType *elementType;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPSGraphListType;
  v5 = -[MPSGraphListType init](&v9, sel_init);
  v6 = objc_msgSend(v4, "copyWithZone:", 0);
  elementType = v5->_elementType;
  v5->_elementType = (MPSGraphType *)v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPSGraphListType initWithElementType:]([MPSGraphListType alloc], "initWithElementType:", self->_elementType);
}

- (MPSGraphType)elementType
{
  return (MPSGraphType *)objc_getProperty(self, a2, 8, 1);
}

- (void)setElementType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementType, 0);
}

@end
