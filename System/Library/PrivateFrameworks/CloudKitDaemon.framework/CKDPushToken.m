@implementation CKDPushToken

- (CKDPushToken)initWithAPSEnvironmentString:(id)a3 apsToken:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CKDPushToken *v10;
  uint64_t v11;
  NSString *apsEnvironmentString;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSData *apsToken;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKDPushToken;
  v10 = -[CKDPushToken init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    apsEnvironmentString = v10->_apsEnvironmentString;
    v10->_apsEnvironmentString = (NSString *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    apsToken = v10->_apsToken;
    v10->_apsToken = (NSData *)v15;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CKDPushToken *v4;
  CKDPushToken *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  char v19;

  v4 = (CKDPushToken *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_apsToken(self, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_apsToken(v5, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CKObjectsAreBothNilOrEqual();

      if (v12)
      {
        objc_msgSend_apsEnvironmentString(self, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_apsEnvironmentString(v5, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CKObjectsAreBothNilOrEqual();

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;

  objc_msgSend_apsToken(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);
  objc_msgSend_apsEnvironmentString(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  return v13;
}

- (NSString)apsEnvironmentString
{
  return self->_apsEnvironmentString;
}

- (NSData)apsToken
{
  return self->_apsToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsToken, 0);
  objc_storeStrong((id *)&self->_apsEnvironmentString, 0);
}

@end
