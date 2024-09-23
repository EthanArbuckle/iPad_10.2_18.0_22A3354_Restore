@implementation HAPAccessoryWakeTuple

- (HAPAccessoryWakeTuple)initWithPort:(int64_t)a3 wakeAddress:(id)a4 wakePattern:(id)a5
{
  id v9;
  id v10;
  HAPAccessoryWakeTuple *v11;
  HAPAccessoryWakeTuple *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HAPAccessoryWakeTuple;
  v11 = -[HAPAccessoryWakeTuple init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_wakePort = a3;
    objc_storeStrong((id *)&v11->_wakeAddress, a4);
    objc_storeStrong((id *)&v12->_wakePattern, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[HAPAccessoryWakeTuple wakeAddress](self, "wakeAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HAPAccessoryWakeTuple wakePattern](self, "wakePattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[HAPAccessoryWakeTuple wakePort](self, "wakePort");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HAPAccessoryWakeTuple *v4;
  HAPAccessoryWakeTuple *v5;
  HAPAccessoryWakeTuple *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (HAPAccessoryWakeTuple *)a3;
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
    if (!v6)
      goto LABEL_9;
    v7 = -[HAPAccessoryWakeTuple wakePort](self, "wakePort");
    if (v7 != -[HAPAccessoryWakeTuple wakePort](v6, "wakePort"))
      goto LABEL_9;
    -[HAPAccessoryWakeTuple wakeAddress](self, "wakeAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPAccessoryWakeTuple wakeAddress](v6, "wakeAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HMFEqualObjects();

    if (v10)
    {
      -[HAPAccessoryWakeTuple wakePattern](self, "wakePattern");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPAccessoryWakeTuple wakePattern](v6, "wakePattern");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = HMFEqualObjects();

    }
    else
    {
LABEL_9:
      v13 = 0;
    }

  }
  return v13;
}

- (NSString)wakeAddress
{
  return self->_wakeAddress;
}

- (int64_t)wakePort
{
  return self->_wakePort;
}

- (NSData)wakePattern
{
  return self->_wakePattern;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakePattern, 0);
  objc_storeStrong((id *)&self->_wakeAddress, 0);
}

@end
