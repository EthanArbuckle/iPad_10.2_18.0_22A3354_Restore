@implementation MPSGraphShapedType

- (MPSGraphShapedType)initWithShape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  MPSShape *v6;
  MPSGraphShapedType *v7;
  uint64_t v8;
  NSArray *v9;
  objc_super v11;

  v6 = shape;
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphShapedType;
  v7 = -[MPSGraphShapedType init](&v11, sel_init);
  v8 = -[MPSShape copyWithZone:](v6, "copyWithZone:", 0);
  v9 = v7->_shape;
  v7->_shape = (NSArray *)v8;

  v7->_dataType = dataType;
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPSGraphShapedType initWithShape:dataType:]([MPSGraphShapedType alloc], "initWithShape:dataType:", self->_shape, self->_dataType);
}

- (BOOL)isEqualTo:(MPSGraphShapedType *)object
{
  MPSGraphShapedType *v4;
  unsigned int dataType;
  void *v6;
  NSArray *shape;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;

  v4 = object;
  dataType = self->_dataType;
  if (dataType != -[MPSGraphShapedType dataType](v4, "dataType"))
    goto LABEL_13;
  if (self->_shape)
    goto LABEL_3;
  -[MPSGraphShapedType shape](v4, "shape");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    LOBYTE(v6) = 1;
    goto LABEL_14;
  }
  if (self->_shape)
    goto LABEL_3;
  -[MPSGraphShapedType shape](v4, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    goto LABEL_13;
  if (self->_shape)
  {
LABEL_3:
    -[MPSGraphShapedType shape](v4, "shape");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_14;
    shape = self->_shape;
  }
  else
  {
    shape = 0;
  }
  v8 = -[NSArray count](shape, "count");
  -[MPSGraphShapedType shape](v4, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v8 != v10)
  {
LABEL_13:
    LOBYTE(v6) = 0;
    goto LABEL_14;
  }
  v11 = 0;
  do
  {
    v12 = -[NSArray count](self->_shape, "count");
    LOBYTE(v6) = v11 >= v12;
    if (v11 >= v12)
      break;
    -[NSArray objectAtIndexedSubscript:](self->_shape, "objectAtIndexedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraphShapedType shape](v4, "shape");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "isEqualToNumber:", v15);

    ++v11;
  }
  while ((v16 & 1) != 0);
LABEL_14:

  return (char)v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MPSGraphShapedType;
  -[MPSGraphShapedType debugDescription](&v8, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray debugDescription](self->_shape, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (MPSShape)shape
{
  return (MPSShape *)objc_getProperty(self, a2, 16, 1);
}

- (void)setShape:(MPSShape *)shape
{
  objc_setProperty_atomic_copy(self, a2, shape, 16);
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (void)setDataType:(MPSDataType)dataType
{
  self->_dataType = dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
}

@end
