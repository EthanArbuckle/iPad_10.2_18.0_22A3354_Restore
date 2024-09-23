@implementation CKResult

- (CKResult)initWithSuccess:(id)a3
{
  id v5;
  CKResult *v6;
  CKResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKResult;
  v6 = -[CKResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_successValue, a3);

  return v7;
}

- (CKResult)initWithFailure:(id)a3
{
  id v5;
  CKResult *v6;
  CKResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKResult;
  v6 = -[CKResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
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

  objc_msgSend_successValue(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_error(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  CKResult *v4;
  CKResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;

  v4 = (CKResult *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_successValue(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_successValue(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14)
      {
        objc_msgSend_error(self, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_error(v5, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (id)successValue
{
  return self->_successValue;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_successValue, 0);
}

@end
