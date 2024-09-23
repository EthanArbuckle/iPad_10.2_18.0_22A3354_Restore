@implementation CKKindOfClassValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  char isKindOfClass;
  char v8;
  void *v9;
  void *v10;
  objc_class *parentClass;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = isKindOfClass;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v20[0] = *MEMORY[0x1E0CB2D50];
    v10 = (void *)MEMORY[0x1E0CB3940];
    if (self)
      parentClass = self->_parentClass;
    else
      parentClass = 0;
    NSStringFromClass(parentClass);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v13, (uint64_t)CFSTR("<%@> is not of type %@"), v14, v6, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = CFSTR("ck_isComparisonError");
    v21[0] = v15;
    v21[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v21, (uint64_t)v20, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v9, v18, (uint64_t)CFSTR("CKErrorDomain"), 12, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8 & 1;
}

- (id)CKPropertiesDescription
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (self)
    self = (CKKindOfClassValidator *)self->_parentClass;
  NSStringFromClass((Class)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v2, v4, (uint64_t)CFSTR("class=%@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentClass, 0);
}

@end
