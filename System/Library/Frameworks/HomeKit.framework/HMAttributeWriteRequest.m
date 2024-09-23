@implementation HMAttributeWriteRequest

- (HMAttributeWriteRequest)initWithAccessoryProfile:(id)a3 attribute:(id)a4 value:(id)a5
{
  id v9;
  HMAttributeWriteRequest *v10;
  HMAttributeWriteRequest *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMAttributeWriteRequest;
  v10 = -[HMAttributeRequest initWithAccessoryProfile:attribute:](&v13, sel_initWithAccessoryProfile_attribute_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_value, a5);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HMAttributeWriteRequest *v4;
  HMAttributeWriteRequest *v5;
  HMAttributeWriteRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (HMAttributeWriteRequest *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMAttributeRequest accessoryProfile](self, "accessoryProfile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAttributeRequest accessoryProfile](v6, "accessoryProfile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v10))
      {
        -[HMAttributeRequest attribute](self, "attribute");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAttributeRequest attribute](v6, "attribute");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  -[HMAttributeRequest accessoryProfile](self, "accessoryProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[HMAttributeRequest attribute](self, "attribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v5;

  return v7;
}

- (NSCopying)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (id)writeRequestWithAccessoryProfile:(id)a3 attribute:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMAttributeWriteRequest *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMAttributeWriteRequest initWithAccessoryProfile:attribute:value:]([HMAttributeWriteRequest alloc], "initWithAccessoryProfile:attribute:value:", v9, v8, v7);

  return v10;
}

@end
