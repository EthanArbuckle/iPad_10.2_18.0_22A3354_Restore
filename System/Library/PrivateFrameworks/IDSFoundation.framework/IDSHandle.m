@implementation IDSHandle

- (IDSHandle)initWithURI:(id)a3 isUserVisible:(BOOL)a4 validationStatus:(int64_t)a5
{
  id v9;
  IDSHandle *v10;
  IDSHandle *v11;
  IDSHandle *v12;
  objc_super v14;

  v9 = a3;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSHandle;
    v10 = -[IDSHandle init](&v14, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_URI, a3);
      v11->_isUserVisible = a4;
      v11->_validationStatus = a5;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v5;
  v9 = CFSTR("YES");
  if (!self->_isUserVisible)
    v9 = CFSTR("NO");
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p URI:%@, visible:%@, valStatus: %ld>"), v7, v5, self, self->_URI, v9, self->_validationStatus);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToHandle;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToHandle = objc_msgSend_isEqualToHandle_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToHandle = 0;

  return isEqualToHandle;
}

- (BOOL)isEqualToHandle:(id)a3
{
  const char *v4;
  uint64_t v5;
  IDSHandle *v6;
  double v7;
  int isUserVisible;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  char isEqual;

  v6 = (IDSHandle *)a3;
  if (self == v6)
  {
    isEqual = 1;
  }
  else
  {
    isUserVisible = objc_msgSend_isUserVisible(self, v4, v5, v7);
    if (isUserVisible == objc_msgSend_isUserVisible(v6, v9, v10, v11)
      && (v15 = objc_msgSend_validationStatus(self, v12, v13, v14),
          v15 == objc_msgSend_validationStatus(v6, v16, v17, v18)))
    {
      objc_msgSend_URI(self, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URI(v6, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v22, v27, (uint64_t)v26, v28);

    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  int isUserVisible;
  uint64_t v18;

  objc_msgSend_URI(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);

  v13 = objc_msgSend_validationStatus(self, v10, v11, v12) - v9 + 32 * v9;
  isUserVisible = objc_msgSend_isUserVisible(self, v14, v15, v16);
  v18 = 1237;
  if (isUserVisible)
    v18 = 1231;
  return v18 - v13 + 32 * v13 + 29791;
}

- (IDSURI)URI
{
  return self->_URI;
}

- (BOOL)isUserVisible
{
  return self->_isUserVisible;
}

- (int64_t)validationStatus
{
  return self->_validationStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URI, 0);
}

@end
