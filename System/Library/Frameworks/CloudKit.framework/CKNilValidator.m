@implementation CKNilValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_constantValue(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v9)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("<%@> is not 'nil'"), v11, v5, *MEMORY[0x1E0CB2D50]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("ck_isComparisonError");
    v19[0] = v13;
    v19[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v14, (uint64_t)v19, (uint64_t)v18, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v16, (uint64_t)CFSTR("CKErrorDomain"), 12, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 == 0;
}

@end
