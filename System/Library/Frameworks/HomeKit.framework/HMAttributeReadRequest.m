@implementation HMAttributeReadRequest

- (BOOL)isEqual:(id)a3
{
  HMAttributeReadRequest *v4;
  HMAttributeReadRequest *v5;
  HMAttributeReadRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMAttributeReadRequest *)a3;
  if (self == v4)
  {
    v11 = 1;
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
      -[HMAttributeRequest accessoryProfile](v6, "accessoryProfile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[HMAttributeRequest attribute](self, "attribute");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAttributeRequest attribute](v6, "attribute");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMAttributeRequest accessoryProfile](self, "accessoryProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMAttributeRequest attribute](self, "attribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (id)readRequestWithAccessoryProfile:(id)a3 attribute:(id)a4
{
  id v5;
  id v6;
  HMAttributeReadRequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMAttributeRequest initWithAccessoryProfile:attribute:]([HMAttributeReadRequest alloc], "initWithAccessoryProfile:attribute:", v6, v5);

  return v7;
}

@end
