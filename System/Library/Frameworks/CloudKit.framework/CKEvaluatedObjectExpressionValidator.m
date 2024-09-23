@implementation CKEvaluatedObjectExpressionValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v5;
  char isKindOfClass;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = isKindOfClass;
  v11 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v30[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("<%@> is not an expression"), v9, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = CFSTR("ck_isComparisonError");
    v31[0] = v13;
    v31[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v31, (uint64_t)v30, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v16, (uint64_t)CFSTR("CKErrorDomain"), 12, v15);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((v10 & 1) == 0)
  {
    if (!a4)
    {
      v20 = 0;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v17 = objc_msgSend_expressionType(v5, v7, v8, v9);
  v20 = v17 == 1;
  if (a4 && v17 != 1)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v18, (uint64_t)CFSTR("<%@> is not an evaluated object expression"), v19, v5, *MEMORY[0x1E0CB2D50]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = CFSTR("ck_isComparisonError");
    v29[0] = v22;
    v29[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v29, (uint64_t)v28, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v21, v25, (uint64_t)CFSTR("CKErrorDomain"), 12, v24);
    v26 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v26;
LABEL_9:
    v11 = objc_retainAutorelease(v11);
    v20 = 0;
    *a4 = v11;
  }
LABEL_11:

  return v20;
}

@end
