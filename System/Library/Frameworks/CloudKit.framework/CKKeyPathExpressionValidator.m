@implementation CKKeyPathExpressionValidator

- (CKKeyPathExpressionValidator)initWithValidator:(id)a3
{
  id v3;
  CKKeyPathExpressionValidator *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKKeyPathExpressionValidator;
  v3 = a3;
  v4 = -[CKKeyPathExpressionValidator init](&v8, sel_init);
  objc_msgSend_setValidator_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  char isKindOfClass;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  char v31;
  id v32;
  char v33;
  void *v34;
  void *v35;
  const char *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  id v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = isKindOfClass;
  v12 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v47[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("<%@> is not an expression"), v10, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = CFSTR("ck_isComparisonError");
    v48[0] = v14;
    v48[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v48, (uint64_t)v47, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, (uint64_t)CFSTR("CKErrorDomain"), 12, v16);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((v11 & 1) == 0)
  {
    if (a4)
    {
LABEL_17:
      v12 = objc_retainAutorelease(v12);
      v33 = 0;
      *a4 = v12;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (objc_msgSend_expressionType(v6, v8, v9, v10) != 3)
  {
    if (a4)
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v45[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v18, (uint64_t)CFSTR("<%@> is not a keyPath expression"), v20, v6);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = CFSTR("ck_isComparisonError");
      v46[0] = v35;
      v46[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v36, (uint64_t)v46, (uint64_t)v45, 2);
LABEL_16:
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v34, v39, (uint64_t)CFSTR("CKErrorDomain"), 12, v38);
      v40 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v40;
      goto LABEL_17;
    }
LABEL_18:
    v33 = 0;
    goto LABEL_19;
  }
  objc_msgSend_keyPath(v6, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    if (a4)
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v43[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v22, (uint64_t)CFSTR("'%@' is not a valid keyPath"), v24, v6);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = CFSTR("ck_isComparisonError");
      v44[0] = v35;
      v44[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)v44, (uint64_t)v43, 2);
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  objc_msgSend_validator(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyPath(v6, v26, v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    v33 = objc_msgSend_validate_error_(v25, v29, (uint64_t)v30, 0);

    goto LABEL_19;
  }
  v42 = v12;
  v31 = objc_msgSend_validate_error_(v25, v29, (uint64_t)v30, (uint64_t)&v42);
  v32 = v42;

  if ((v31 & 1) == 0)
  {
    v12 = v32;
    goto LABEL_17;
  }
  v33 = 1;
  v12 = v32;
LABEL_19:

  return v33;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_validator(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("validator=%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CKObjectValidating)validator
{
  return self->_validator;
}

- (void)setValidator:(id)a3
{
  objc_storeStrong((id *)&self->_validator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
}

@end
