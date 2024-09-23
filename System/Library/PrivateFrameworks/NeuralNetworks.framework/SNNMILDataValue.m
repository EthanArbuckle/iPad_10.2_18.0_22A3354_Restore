@implementation SNNMILDataValue

- (SNNMILDataValue)initWithStringScalar:(id)a3
{
  id v4;
  SNNMILDataValue *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNNMILDataValue;
  v5 = -[SNNMILValue init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_dataType = 1;
  }

  return v5;
}

- (SNNMILDataValue)initWithScalar:(id)a3 dataType:(unint64_t)a4
{
  id v6;
  SNNMILDataValue *v7;
  uint64_t v8;
  NSData *data;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SNNMILDataValue;
  v7 = -[SNNMILValue init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithScalar:dataType:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    data = v7->_data;
    v7->_data = (NSData *)v8;

    v7->_dataType = a4;
  }

  return v7;
}

- (SNNMILDataValue)initWithShape:(id)a3 scalars:(id)a4 dataType:(unint64_t)a5
{
  id v9;
  id v10;
  SNNMILDataValue *v11;
  uint64_t v12;
  uint64_t v13;
  NSData *v14;
  NSData *data;
  NSData *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SNNMILDataValue;
  v11 = -[SNNMILValue init](&v18, sel_init);
  if (v11)
  {
    if (a5 - 2 > 0xA)
      v12 = 1;
    else
      v12 = qword_242C4B388[a5 - 2];
    v13 = objc_msgSend(v10, "count");
    v14 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", v13 * v12);
    -[NSData appendScalars:dataType:](v14, "appendScalars:dataType:", v10, a5);
    data = v11->_data;
    v11->_data = v14;
    v16 = v14;

    objc_storeStrong((id *)&v11->_dimensions, a3);
    v11->_dataType = a5;
  }

  return v11;
}

- (SNNMILDataValue)initWithShape:(id)a3 bytes:(const void *)a4 dataType:(unint64_t)a5
{
  id v9;
  SNNMILDataValue *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  NSData *data;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SNNMILDataValue;
  v10 = -[SNNMILValue init](&v24, sel_init);
  if (v10)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v21;
      v14 = 1;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v11);
          v14 *= objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v20);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v12);
    }
    else
    {
      v14 = 1;
    }

    if (a5 - 2 > 0xA)
      v16 = 1;
    else
      v16 = qword_242C4B388[a5 - 2];
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a4, v16 * v14);
    data = v10->_data;
    v10->_data = (NSData *)v17;

    objc_storeStrong((id *)&v10->_dimensions, a3);
    v10->_dataType = a5;
  }

  return v10;
}

- (SNNMILDataValue)initWithShape:(id)a3 bytesNoCopy:(void *)a4 dataType:(unint64_t)a5
{
  id v9;
  SNNMILDataValue *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  NSData *data;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SNNMILDataValue;
  v10 = -[SNNMILValue init](&v24, sel_init);
  if (v10)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v21;
      v14 = 1;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v11);
          v14 *= objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v20);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v12);
    }
    else
    {
      v14 = 1;
    }

    if (a5 - 2 > 0xA)
      v16 = 1;
    else
      v16 = qword_242C4B388[a5 - 2];
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a4, v16 * v14, 0);
    data = v10->_data;
    v10->_data = (NSData *)v17;

    objc_storeStrong((id *)&v10->_dimensions, a3);
    v10->_dataType = a5;
  }

  return v10;
}

- (void)bytes
{
  id v2;
  void *v3;

  -[SNNMILDataValue data](self, "data");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (void *)objc_msgSend(v2, "bytes");

  return v3;
}

- (unint64_t)byteCount
{
  void *v2;
  unint64_t v3;

  -[SNNMILDataValue data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (BOOL)isScalar
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SNNMILDataValue dimensions](self, "dimensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SNNMILDataValue dimensions](self, "dimensions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (int64_t)rank
{
  void *v3;
  void *v4;

  -[SNNMILDataValue dimensions](self, "dimensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SNNMILDataValue dimensions](self, "dimensions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "count");

  }
  return (int64_t)v3;
}

- (int64_t)scalarCount
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SNNMILDataValue dimensions](self, "dimensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SNNMILDataValue dimensions](self, "dimensions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v7 *= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (unique_ptr<const)milValueWithContext:(id)a3
{
  _QWORD *v3;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unique_ptr<const MIL::IRValue, std::default_delete<const MIL::IRValue>> v13;
  id v14;

  v5 = v3;
  v14 = a3;
  -[SNNMILDataValue dimensions](self, "dimensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[SNNMILDataValue bytes](self, "bytes");
    -[SNNMILDataValue dimensions](self, "dimensions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SNNMILDataValue dataType](self, "dataType");
    if (v14)
      objc_msgSend(v14, "milValueForTensorWithBytes:shape:dataType:", v7, v8, v9);
    else
      *v5 = 0;

  }
  else if (-[SNNMILDataValue dataType](self, "dataType") == 1)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_data, 4);
    if (v14)
      objc_msgSend(v14, "milValueForString:", v10);
    else
      *v5 = 0;

  }
  else
  {
    v11 = -[SNNMILDataValue bytes](self, "bytes");
    v12 = -[SNNMILDataValue dataType](self, "dataType");
    if (v14)
      objc_msgSend(v14, "milValueForScalarWithBytes:dataType:", v11, v12);
    else
      *v5 = 0;
  }

  return v13;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end
