@implementation CKSubscriptionInfo

- (unint64_t)hash
{
  NSString *subscriptionID;
  NSString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKContainer *container;
  CKContainer *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CKDatabase *database;
  CKDatabase *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  if (self)
    subscriptionID = self->_subscriptionID;
  else
    subscriptionID = 0;
  v4 = subscriptionID;
  v8 = objc_msgSend_hash(v4, v5, v6, v7);
  if (self)
    container = self->_container;
  else
    container = 0;
  v10 = container;
  v14 = objc_msgSend_hash(v10, v11, v12, v13);
  if (self)
    database = self->_database;
  else
    database = 0;
  v16 = database;
  v23 = objc_msgSend_scope(v16, v17, v18, v19);
  if (self)
    v24 = objc_msgSend_hash(self->_environment, v20, v21, v22);
  else
    v24 = objc_msgSend_hash(0, v20, v21, v22);
  v25 = v14 ^ v8 ^ v23 ^ v24;

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  NSString *subscriptionID;
  NSString *v10;
  void *v11;
  id v12;
  CKContainer *container;
  CKContainer *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CKDatabase *database;
  CKDatabase *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  int v32;
  char v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (v5)
      v7 = (void *)v5[5];
    else
      v7 = 0;
    v8 = v7;
    if (self)
      subscriptionID = self->_subscriptionID;
    else
      subscriptionID = 0;
    v10 = subscriptionID;
    if (!CKObjectsAreBothNilOrEqual(v8, v10))
    {
      LOBYTE(v32) = 1;
LABEL_27:

      v33 = v32 ^ 1;
      goto LABEL_28;
    }
    if (v6)
      v11 = (void *)v6[2];
    else
      v11 = 0;
    v12 = v11;
    if (self)
      container = self->_container;
    else
      container = 0;
    v14 = container;
    if (!objc_msgSend_isEqual_(v12, v15, (uint64_t)v14, v16))
    {
      LOBYTE(v32) = 1;
LABEL_26:

      goto LABEL_27;
    }
    if (v6)
      v17 = (void *)v6[1];
    else
      v17 = 0;
    v18 = v17;
    v22 = objc_msgSend_scope(v18, v19, v20, v21);
    if (self)
      database = self->_database;
    else
      database = 0;
    v24 = database;
    if (v22 != objc_msgSend_scope(v24, v25, v26, v27))
    {
      LOBYTE(v32) = 1;
      goto LABEL_25;
    }
    if (v6)
    {
      v28 = (void *)v6[3];
      if (!self)
      {
LABEL_20:
        v29 = v28;
        v32 = objc_msgSend_isEqual_(v29, v30, (uint64_t)self, v31) ^ 1;

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
      v28 = 0;
      if (!self)
        goto LABEL_20;
    }
    self = (CKSubscriptionInfo *)self->_environment;
    goto LABEL_20;
  }
  v33 = 0;
LABEL_28:

  return v33;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  CKDatabase *v8;
  NSString *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v8 = self->_database;
    v9 = self->_environment;
    objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: %p; database=%@ environment=%@ subscriptionID=%@>"),
      v11,
      v7,
      self,
      v8,
      v9,
      self->_subscriptionID);
  }
  else
  {
    v9 = 0;
    v8 = 0;
    objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p; database=%@ environment=%@ subscriptionID=%@>"),
      v6,
      v7,
      0,
      0,
      0,
      0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionID, 0);
  objc_storeStrong(&self->_idHandler, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
