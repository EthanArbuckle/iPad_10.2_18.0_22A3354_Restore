@implementation CKCompoundSubpredicateValidator

- (CKCompoundSubpredicateValidator)initWithValidator:(id)a3
{
  id v3;
  CKCompoundSubpredicateValidator *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKCompoundSubpredicateValidator;
  v3 = a3;
  v4 = -[CKCompoundSubpredicateValidator init](&v8, sel_init);
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
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  char v30;
  id v31;
  char v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  const char *v43;
  id v45;
  id obj;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[3];
  _QWORD v53[3];
  _BYTE v54[128];
  _QWORD v55[2];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = isKindOfClass;
  v12 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v55[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("<%@> is not a compound predicate"), v10, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = CFSTR("ck_isComparisonError");
    v56[0] = v14;
    v56[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v56, (uint64_t)v55, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, (uint64_t)CFSTR("CKErrorDomain"), 12, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((v11 & 1) == 0)
  {
    v33 = 0;
    if (!a4)
      goto LABEL_26;
    goto LABEL_24;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend_subpredicates(v6, v8, v9, v10);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v48, (uint64_t)v54, 16);
  if (v19)
  {
    v23 = v19;
    v45 = v6;
    v24 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend_validator(self, v20, v21, v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        if (a4)
        {
          v47 = v12;
          v30 = objc_msgSend_validate_error_(v27, v28, v26, (uint64_t)&v47);
          v31 = v47;

          if ((v30 & 1) == 0)
          {
            v34 = (void *)MEMORY[0x1E0CB35C8];
            v52[0] = *MEMORY[0x1E0CB2D50];
            v35 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend_localizedDescription(v31, v20, v21, v22);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v35, v37, (uint64_t)CFSTR("Invalid subpredicate <%@>: %@"), v38, v26, v36);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = *MEMORY[0x1E0CB3388];
            v53[0] = v39;
            v53[1] = v31;
            v52[1] = v40;
            v52[2] = CFSTR("ck_isComparisonError");
            v53[2] = MEMORY[0x1E0C9AAA0];
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v41, (uint64_t)v53, (uint64_t)v52, 3);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v34, v43, (uint64_t)CFSTR("CKErrorDomain"), 12, v42);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
            v33 = 0;
            goto LABEL_21;
          }
          v12 = v31;
        }
        else
        {
          v32 = objc_msgSend_validate_error_(v27, v28, v26, 0);

          if ((v32 & 1) == 0)
            goto LABEL_20;
        }
      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v48, (uint64_t)v54, 16);
      if (v23)
        continue;
      break;
    }
    v33 = 1;
LABEL_21:
    v6 = v45;
  }
  else
  {
    v33 = 1;
  }

  if (a4)
  {
LABEL_24:
    if (!v33)
      *a4 = objc_retainAutorelease(v12);
  }
LABEL_26:

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
