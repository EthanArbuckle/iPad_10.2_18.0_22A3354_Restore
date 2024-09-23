@implementation DESChunk

- (DESChunk)initWithKey:(id)a3 clippingBound:(id)a4 data:(id)a5
{
  id v9;
  id v10;
  id v11;
  DESChunk *v12;
  DESChunk *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DESChunk;
  v12 = -[DESChunk init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    objc_storeStrong((id *)&v13->_clippingBound, a4);
    objc_storeStrong((id *)&v13->_data, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  DESChunk *v4;
  DESChunk *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v4 = (DESChunk *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DESChunk key](self, "key");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DESChunk key](v5, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[DESChunk clippingBound](self, "clippingBound");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[DESChunk clippingBound](v5, "clippingBound");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
        {
          -[DESChunk data](self, "data");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[DESChunk data](v5, "data");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v11, "isEqualToData:", v12);

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSNumber hash](self->_clippingBound, "hash") ^ v3;
  return v4 ^ -[NSMutableData hash](self->_data, "hash");
}

- (NSString)key
{
  return self->_key;
}

- (NSNumber)clippingBound
{
  return self->_clippingBound;
}

- (void)setClippingBound:(id)a3
{
  objc_storeStrong((id *)&self->_clippingBound, a3);
}

- (NSMutableData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_clippingBound, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
