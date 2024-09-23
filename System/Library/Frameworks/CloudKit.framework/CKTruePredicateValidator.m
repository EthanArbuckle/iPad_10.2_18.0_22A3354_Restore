@implementation CKTruePredicateValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v5;
  char isKindOfClass;
  const char *v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char isEqual;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = isKindOfClass;
  v10 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v31[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("<%@> is not a predicate"), v8, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = CFSTR("ck_isComparisonError");
    v32[0] = v12;
    v32[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v32, (uint64_t)v31, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v11, v15, (uint64_t)CFSTR("CKErrorDomain"), 12, v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((v9 & 1) == 0)
  {
    if (!a4)
    {
      isEqual = 0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  objc_msgSend_predicateWithValue_(MEMORY[0x1E0CB3880], v7, 1, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v5, v17, (uint64_t)v16, v18);

  if (a4 && (isEqual & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v20, (uint64_t)CFSTR("Invalid predicate %@"), v21, v5, *MEMORY[0x1E0CB2D50]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = CFSTR("ck_isComparisonError");
    v30[0] = v23;
    v30[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v30, (uint64_t)v29, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v22, v26, (uint64_t)CFSTR("CKErrorDomain"), 12, v25);
    v27 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v27;
LABEL_9:
    v10 = objc_retainAutorelease(v10);
    isEqual = 0;
    *a4 = v10;
  }
LABEL_11:

  return isEqual;
}

@end
