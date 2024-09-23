@implementation HAPMetadataTuple

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HAPMetadataTuple index](self, "index");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "index");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataTuple index](self, "index");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

- (HAPMetadataTuple)initWithCharacteristicType:(id)a3 serviceType:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HAPMetadataTuple *v10;
  HAPMetadataTuple *v11;
  HAPMetadataTuple *v12;
  uint64_t v13;
  NSString *index;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)HAPMetadataTuple;
    v11 = -[HAPMetadataTuple init](&v16, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_characteristicType, a3);
      objc_storeStrong((id *)&v12->_serviceType, a4);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@+%@"), v9, v7);
      v13 = objc_claimAutoreleasedReturnValue();
      index = v12->_index;
      v12->_index = (NSString *)v13;

    }
    self = v12;
    v10 = self;
  }

  return v10;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

@end
