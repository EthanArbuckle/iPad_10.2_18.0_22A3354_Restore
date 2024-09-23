@implementation CKDAppContainerAccountTuple

- (CKDAppContainerAccountTuple)initWithAppContainerTuple:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CKDAppContainerAccountTuple *v10;
  uint64_t v11;
  CKDAppContainerTuple *appContainerTuple;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *accountID;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKDAppContainerAccountTuple;
  v10 = -[CKDAppContainerAccountTuple init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    appContainerTuple = v10->_appContainerTuple;
    v10->_appContainerTuple = (CKDAppContainerTuple *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    accountID = v10->_accountID;
    v10->_accountID = (NSString *)v15;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CKDAppContainerAccountTuple *v4;
  CKDAppContainerAccountTuple *v5;
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

  v4 = (CKDAppContainerAccountTuple *)a3;
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
      objc_msgSend_accountID(self, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountID(v5, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CKObjectsAreBothNilOrEqual();

      if (v12)
      {
        objc_msgSend_appContainerTuple(self, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appContainerTuple(v5, v16, v17);
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

  objc_msgSend_appContainerTuple(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);
  objc_msgSend_accountID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  return v13;
}

- (CKDAppContainerTuple)appContainerTuple
{
  return self->_appContainerTuple;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_appContainerTuple, 0);
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_appContainerTuple(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountID(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v9, (uint64_t)CFSTR("%@, accountID=\"%@\"), v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAppContainerAccountTuple *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

@end
