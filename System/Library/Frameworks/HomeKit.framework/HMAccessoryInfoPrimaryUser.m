@implementation HMAccessoryInfoPrimaryUser

- (HMAccessoryInfoPrimaryUser)initWithUUIDString:(id)a3 selectionType:(unint64_t)a4
{
  id v7;
  HMAccessoryInfoPrimaryUser *v8;
  HMAccessoryInfoPrimaryUser *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMAccessoryInfoPrimaryUser;
  v8 = -[HMAccessoryInfoPrimaryUser init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuidString, a3);
    v9->_selectionType = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HMAccessoryInfoPrimaryUser;
  -[HMAccessoryInfoPrimaryUser description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoPrimaryUser uuidString](self, "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAccessoryInfoPrimaryUser selectionType](self, "selectionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@, %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)_primaryUserInfoEventSelectionType:(unint64_t)a3
{
  return a3 != 0;
}

- (id)protoPayload
{
  HMAccessoryInfoProtoPrimaryUserInfoEvent *v3;
  void *v4;

  v3 = objc_alloc_init(HMAccessoryInfoProtoPrimaryUserInfoEvent);
  -[HMAccessoryInfoPrimaryUser uuidString](self, "uuidString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoPrimaryUserInfoEvent setUuidString:](v3, "setUuidString:", v4);

  -[HMAccessoryInfoProtoPrimaryUserInfoEvent setSelectionType:](v3, "setSelectionType:", -[HMAccessoryInfoPrimaryUser _primaryUserInfoEventSelectionType:](self, "_primaryUserInfoEventSelectionType:", -[HMAccessoryInfoPrimaryUser selectionType](self, "selectionType")));
  return v3;
}

- (id)protoData
{
  void *v2;
  void *v3;

  -[HMAccessoryInfoPrimaryUser protoPayload](self, "protoPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMAccessoryInfoPrimaryUser)initWithProtoPayload:(id)a3
{
  id v4;
  void *v5;
  int v6;
  HMAccessoryInfoPrimaryUser *v7;

  v4 = a3;
  objc_msgSend(v4, "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "selectionType");

  v7 = -[HMAccessoryInfoPrimaryUser initWithUUIDString:selectionType:](self, "initWithUUIDString:selectionType:", v5, v6 != 0);
  return v7;
}

- (HMAccessoryInfoPrimaryUser)initWithProtoData:(id)a3
{
  id v4;
  HMAccessoryInfoProtoPrimaryUserInfoEvent *v5;
  HMAccessoryInfoPrimaryUser *v6;

  v4 = a3;
  v5 = -[HMAccessoryInfoProtoPrimaryUserInfoEvent initWithData:]([HMAccessoryInfoProtoPrimaryUserInfoEvent alloc], "initWithData:", v4);

  v6 = -[HMAccessoryInfoPrimaryUser initWithProtoPayload:](self, "initWithProtoPayload:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryInfoPrimaryUser *v4;
  HMAccessoryInfoPrimaryUser *v5;
  HMAccessoryInfoPrimaryUser *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;

  v4 = (HMAccessoryInfoPrimaryUser *)a3;
  if (self == v4)
  {
    v10 = 1;
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
      -[HMAccessoryInfoPrimaryUser uuidString](self, "uuidString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryInfoPrimaryUser uuidString](v6, "uuidString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (HMFEqualObjects())
      {
        v9 = -[HMAccessoryInfoPrimaryUser selectionType](self, "selectionType");
        v10 = v9 == -[HMAccessoryInfoPrimaryUser selectionType](v6, "selectionType");
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
  void *v2;
  unint64_t v3;

  -[HMAccessoryInfoPrimaryUser uuidString](self, "uuidString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)uuidString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end
