@implementation IMPair

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

- (void)dealloc
{
  id first;
  id second;
  objc_super v5;

  first = self->_first;
  self->_first = 0;

  second = self->_second;
  self->_second = 0;

  v5.receiver = self;
  v5.super_class = (Class)IMPair;
  -[IMPair dealloc](&v5, sel_dealloc);
}

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *second;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  second = (void *)objc_msgSend_initWithFirst_second_(v8, v9, (uint64_t)v7, (uint64_t)v6);

  return second;
}

- (IMPair)initWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  IMPair *v8;
  const char *v9;
  uint64_t v10;
  IMPair *v11;
  const char *v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMPair;
  v8 = -[IMPair init](&v15, sel_init);
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setFirst_(v8, v9, (uint64_t)v6, v10);
    objc_msgSend_setSecond_(v11, v12, (uint64_t)v7, v13);
  }

  return v11;
}

- (void)setSecond:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setFirst:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)second
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)first
{
  return objc_getProperty(self, a2, 8, 1);
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

  objc_msgSend_first(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_second(self, v10, v11, v12);
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
  uint64_t v8;
  char isEqual;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_msgSend_first(self, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_first(v4, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v10, v15, (uint64_t)v14, v16))
    {
      objc_msgSend_second(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_second(v4, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v20, v25, (uint64_t)v24, v26);

    }
    else
    {
      isEqual = 0;
    }

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_first(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_second(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: %p first: %@, second: %@>"), v14, v4, self, v8, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
