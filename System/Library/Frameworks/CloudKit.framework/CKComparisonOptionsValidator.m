@implementation CKComparisonOptionsValidator

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
  unint64_t options;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = isKindOfClass;
  v12 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v42[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("<%@> is not a comparison predicate"), v10, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = CFSTR("ck_isComparisonError");
    v43[0] = v14;
    v43[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v43, (uint64_t)v42, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, (uint64_t)CFSTR("CKErrorDomain"), 12, v16);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((v11 & 1) == 0)
  {
    if (a4)
    {
LABEL_16:
      v12 = objc_retainAutorelease(v12);
      v23 = 0;
      *a4 = v12;
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  v18 = objc_msgSend_options(v6, v8, v9, v10);
  if (!self)
    goto LABEL_13;
  options = self->_options;
  if ((options & ~v18) != 0)
  {
    if (a4)
    {
LABEL_15:
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v40[0] = *MEMORY[0x1E0CB2D50];
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = objc_msgSend_options(v6, v19, v20, v21);
      sub_18A7D2FEC(v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v26, v32, (uint64_t)CFSTR("Unsupported comparison options: %@"), v33, v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = CFSTR("ck_isComparisonError");
      v41[0] = v34;
      v41[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v35, (uint64_t)v41, (uint64_t)v40, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v25, v37, (uint64_t)CFSTR("CKErrorDomain"), 12, v36);
      v38 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v38;
      goto LABEL_16;
    }
LABEL_12:
    v23 = 0;
    goto LABEL_17;
  }
  if (options)
  {
    v23 = 1;
    goto LABEL_17;
  }
LABEL_13:
  v24 = objc_msgSend_options(v6, v19, v20, v21);
  v23 = v24 == 0;
  if (a4 && v24)
    goto LABEL_15;
LABEL_17:

  return v23;
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
  if (self)
    self = (CKComparisonOptionsValidator *)self->_options;
  sub_18A7D2FEC((char)self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("options=%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
