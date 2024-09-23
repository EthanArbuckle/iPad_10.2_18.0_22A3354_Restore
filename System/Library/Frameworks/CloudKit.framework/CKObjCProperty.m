@implementation CKObjCProperty

- (int64_t)compare:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      v5 = v4;
      objc_msgSend_name(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      self = (CKObjCProperty *)objc_msgSend_compare_(v9, v14, (uint64_t)v13, v15);
    }
  }
  else
  {
    self = (CKObjCProperty *)-1;
  }

  return (int64_t)self;
}

- (NSString)name
{
  return self->_name;
}

- (CKObjCType)type
{
  return self->_type;
}

- (id)description
{
  void *v3;
  void *v4;
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v21.receiver = self;
  v21.super_class = (Class)CKObjCProperty;
  -[CKObjCProperty description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_type(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v17, (uint64_t)CFSTR("<%@: %@ (%@)>"), v18, v4, v8, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (SEL)getterSelector
{
  return self->_getterSelector;
}

- (SEL)setterSelector
{
  return self->_setterSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceVariableName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_classHandle, 0);
}

@end
