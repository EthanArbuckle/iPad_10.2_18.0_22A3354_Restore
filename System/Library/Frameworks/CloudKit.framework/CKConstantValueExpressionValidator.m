@implementation CKConstantValueExpressionValidator

- (CKConstantValueExpressionValidator)initWithValidator:(id)a3
{
  id v3;
  CKConstantValueExpressionValidator *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKConstantValueExpressionValidator;
  v3 = a3;
  v4 = -[CKConstantValueExpressionValidator init](&v8, sel_init);
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
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  char v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  char v38;
  id v39;
  const char *v40;
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
      goto LABEL_10;
    goto LABEL_17;
  }
  if (objc_msgSend_expressionType(v6, v8, v9, v10))
  {
    if (a4)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v45[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v18, (uint64_t)CFSTR("<%@> is not a constantValue expression"), v20, v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = CFSTR("ck_isComparisonError");
      v46[0] = v22;
      v46[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v46, (uint64_t)v45, 2);
LABEL_8:
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v21, v25, (uint64_t)CFSTR("CKErrorDomain"), 12, v24);
      v26 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v26;
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  objc_msgSend_constantValue(v6, v18, v19, v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    if (a4)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v43[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v29, (uint64_t)CFSTR("%@ is not a valid constant value"), v31, v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = CFSTR("ck_isComparisonError");
      v44[0] = v22;
      v44[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v40, (uint64_t)v44, (uint64_t)v43, 2);
      goto LABEL_8;
    }
LABEL_17:
    v27 = 0;
    goto LABEL_18;
  }
  objc_msgSend_validator(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constantValue(v6, v33, v34, v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    v27 = objc_msgSend_validate_error_(v32, v36, (uint64_t)v37, 0);

    goto LABEL_18;
  }
  v42 = v12;
  v38 = objc_msgSend_validate_error_(v32, v36, (uint64_t)v37, (uint64_t)&v42);
  v39 = v42;

  if ((v38 & 1) != 0)
  {
    v27 = 1;
    v12 = v39;
    goto LABEL_18;
  }
  v12 = v39;
LABEL_10:
  v12 = objc_retainAutorelease(v12);
  v27 = 0;
  *a4 = v12;
LABEL_18:

  return v27;
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
