@implementation HMAttributeResponse

- (BOOL)isEqual:(id)a3
{
  HMAttributeResponse *v4;
  HMAttributeResponse *v5;
  HMAttributeResponse *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (HMAttributeResponse *)a3;
  if (self == v4)
  {
    v17 = 1;
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

      objc_msgSend(v9, "accessoryProfile");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessoryProfile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqual:", v14))
      {
        objc_msgSend(v9, "attribute");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "attribute");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

@end
