@implementation CKComparisonOperatorValidator

- (CKComparisonOperatorValidator)initWithOperatorType:(unint64_t)a3
{
  CKComparisonOperatorValidator *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKComparisonOperatorValidator;
  v4 = -[CKComparisonOperatorValidator init](&v8, sel_init);
  objc_msgSend_setOperatorType_(v4, v5, a3, v6);
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
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = isKindOfClass;
  v12 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v44[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("<%@> is not a comparison predicate"), v10, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = CFSTR("ck_isComparisonError");
    v45[0] = v14;
    v45[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v45, (uint64_t)v44, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, (uint64_t)CFSTR("CKErrorDomain"), 12, v16);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((v11 & 1) == 0)
  {
    if (!a4)
    {
      v26 = 0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v18 = objc_msgSend_predicateOperatorType(v6, v8, v9, v10);
  v22 = objc_msgSend_operatorType(self, v19, v20, v21);
  v26 = v18 == v22;
  if (a4 && v18 != v22)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v42[0] = *MEMORY[0x1E0CB2D50];
    v28 = (void *)MEMORY[0x1E0CB3940];
    v29 = objc_msgSend_predicateOperatorType(v6, v23, v24, v25);
    sub_18A7D280C(v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v28, v34, (uint64_t)CFSTR("Unsupported operator: %@"), v35, v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = CFSTR("ck_isComparisonError");
    v43[0] = v36;
    v43[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)v43, (uint64_t)v42, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v27, v39, (uint64_t)CFSTR("CKErrorDomain"), 12, v38);
    v40 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v40;
LABEL_9:
    v12 = objc_retainAutorelease(v12);
    v26 = 0;
    *a4 = v12;
  }
LABEL_11:

  return v26;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_msgSend_operatorType(self, a2, v2, v3);
  sub_18A7D280C(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("operator=%@"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)operatorType
{
  return self->_operatorType;
}

- (void)setOperatorType:(unint64_t)a3
{
  self->_operatorType = a3;
}

@end
