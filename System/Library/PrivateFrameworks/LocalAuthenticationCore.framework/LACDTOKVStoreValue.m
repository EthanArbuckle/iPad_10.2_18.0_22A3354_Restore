@implementation LACDTOKVStoreValue

- (LACDTOKVStoreValue)initWithData:(id)a3
{
  id v5;
  LACDTOKVStoreValue *v6;
  LACDTOKVStoreValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOKVStoreValue;
  v6 = -[LACDTOKVStoreValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (LACDTOKVStoreValue)initWithBoolValue:(BOOL)a3
{
  void *v4;
  LACDTOKVStoreValue *v5;
  BOOL v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LACDTOKVStoreValue initWithData:](self, "initWithData:", v4);

  return v5;
}

- (LACDTOKVStoreValue)initWithIntegerValue:(int64_t)a3
{
  void *v4;
  LACDTOKVStoreValue *v5;
  int64_t v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v7, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LACDTOKVStoreValue initWithData:](self, "initWithData:", v4);

  return v5;
}

- (BOOL)BOOLValue
{
  BOOL v3;
  LACDTOKVStoreValue *v4;
  LACDTOKVStoreValue *v5;

  v3 = 1;
  v4 = -[LACDTOKVStoreValue initWithBoolValue:]([LACDTOKVStoreValue alloc], "initWithBoolValue:", 1);
  if (!-[LACDTOKVStoreValue isEqual:](self, "isEqual:", v4))
  {
    v5 = -[LACDTOKVStoreValue initWithIntegerValue:]([LACDTOKVStoreValue alloc], "initWithIntegerValue:", 1);
    v3 = -[LACDTOKVStoreValue isEqual:](self, "isEqual:", v5);

  }
  return v3;
}

- (int64_t)integerValue
{
  id v3;
  void *v4;
  unint64_t v5;
  int64_t v6;

  -[LACDTOKVStoreValue data](self, "data");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

    return v6;
  }
  -[LACDTOKVStoreValue data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 <= 8)
  {
    -[LACDTOKVStoreValue data](self, "data");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = *(_QWORD *)objc_msgSend(v3, "bytes");
    goto LABEL_6;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)data
{
  return self->_data;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[LACDTOKVStoreValue data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      -[LACDTOKVStoreValue data](self, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
