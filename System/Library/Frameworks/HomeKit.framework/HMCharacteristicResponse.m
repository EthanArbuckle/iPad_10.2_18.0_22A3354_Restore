@implementation HMCharacteristicResponse

- (HMCharacteristicResponse)initWithRequest:(id)a3 value:(id)a4 error:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMCharacteristicResponse;
  return -[HMResponseBase initWithRequest:value:error:](&v6, sel_initWithRequest_value_error_, a3, a4, a5);
}

- (HMCharacteristicResponse)initWithRequest:(id)a3 error:(id)a4
{
  return -[HMCharacteristicResponse initWithRequest:value:error:](self, "initWithRequest:value:error:", a3, 0, a4);
}

- (BOOL)isEqual:(id)a3
{
  HMCharacteristicResponse *v4;
  HMCharacteristicResponse *v5;
  HMCharacteristicResponse *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;

  v4 = (HMCharacteristicResponse *)a3;
  if (self == v4)
  {
    v15 = 1;
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
      -[HMResponseBase request](self, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v8;

      -[HMResponseBase request](v6, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      objc_msgSend(v9, "characteristic");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "characteristic");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v13, "isEqual:", v14);
    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

@end
