@implementation CSFTensorProperties

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSFTensorProperties shape](self, "shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToArray:", v6);

  v8 = objc_msgSend(v4, "dataType");
  if (v8 == -[CSFTensorProperties dataType](self, "dataType"))
    v9 = v7;
  else
    v9 = 0;

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shape: %@ dataType: %lu"), self->_shape, self->_dataType);
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
  objc_storeStrong((id *)&self->_shape, a3);
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unint64_t)a3
{
  self->_dataType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
}

+ (id)propertyWithShape:(id)a3 dataType:(unint64_t)a4
{
  id v5;
  CSFTensorProperties *v6;

  v5 = a3;
  v6 = objc_alloc_init(CSFTensorProperties);
  -[CSFTensorProperties setShape:](v6, "setShape:", v5);
  -[CSFTensorProperties setDataType:](v6, "setDataType:", a4);

  return v6;
}

@end
