@implementation HMDDataStreamFragment

- (HMDDataStreamFragment)initWithData:(id)a3 sequenceNumber:(id)a4 type:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDDataStreamFragment *v13;
  HMDDataStreamFragment *v14;
  uint64_t v15;
  NSNumber *sequenceNumber;
  uint64_t v17;
  NSString *type;
  HMDDataStreamFragment *v20;
  SEL v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v20 = (HMDDataStreamFragment *)_HMFPreconditionFailure();
    return (HMDDataStreamFragment *)-[HMDDataStreamFragment attributeDescriptions](v20, v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDDataStreamFragment;
  v13 = -[HMDDataStreamFragment init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_data, a3);
    v15 = objc_msgSend(v10, "copy");
    sequenceNumber = v14->_sequenceNumber;
    v14->_sequenceNumber = (NSNumber *)v15;

    v17 = objc_msgSend(v12, "copy");
    type = v14->_type;
    v14->_type = (NSString *)v17;

  }
  return v14;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[HMDDataStreamFragment data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Data Length"), v6);
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamFragment sequenceNumber](self, "sequenceNumber", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Sequence Number"), v9);
  v16[1] = v10;
  v11 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDataStreamFragment type](self, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Type"), v12);
  v16[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isInitial
{
  void *v2;
  BOOL v3;

  -[HMDDataStreamFragment sequenceNumber](self, "sequenceNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue") == 1;

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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

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
    objc_msgSend(v6, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDataStreamFragment data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToData:", v9))
    {
      objc_msgSend(v7, "sequenceNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDataStreamFragment sequenceNumber](self, "sequenceNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToNumber:", v11))
      {
        objc_msgSend(v7, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDDataStreamFragment type](self, "type");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMDDataStreamFragment data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMDDataStreamFragment sequenceNumber](self, "sequenceNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMDDataStreamFragment type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)sequenceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
