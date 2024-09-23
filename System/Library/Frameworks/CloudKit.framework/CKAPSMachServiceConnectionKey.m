@implementation CKAPSMachServiceConnectionKey

- (CKAPSMachServiceConnectionKey)initWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKAPSMachServiceConnectionKey *v11;
  uint64_t v12;
  NSString *environmentName;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *namedDelegatePort;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKAPSMachServiceConnectionKey;
  v11 = -[CKAPSMachServiceConnectionKey init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    environmentName = v11->_environmentName;
    v11->_environmentName = (NSString *)v12;

    v17 = objc_msgSend_copy(v7, v14, v15, v16);
    namedDelegatePort = v11->_namedDelegatePort;
    v11->_namedDelegatePort = (NSString *)v17;

  }
  return v11;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  objc_msgSend_environmentName(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_namedDelegatePort(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  char isEqualToString;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
  {
    v8 = v4;
    objc_msgSend_environmentName(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_environmentName(v8, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v12, v17, (uint64_t)v16, v18))
    {
      objc_msgSend_namedDelegatePort(self, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_namedDelegatePort(v8, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v22, v27, (uint64_t)v26, v28);

    }
    else
    {
      isEqualToString = 0;
    }

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (NSString)namedDelegatePort
{
  return self->_namedDelegatePort;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedDelegatePort, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
}

@end
