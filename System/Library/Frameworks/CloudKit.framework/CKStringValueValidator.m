@implementation CKStringValueValidator

- (CKStringValueValidator)initWithValue:(id)a3
{
  id v3;
  CKStringValueValidator *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKStringValueValidator;
  v3 = a3;
  v4 = -[CKStringValueValidator init](&v8, sel_init);
  objc_msgSend_setValue_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  objc_class *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char isEqualToString;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!a4)
      goto LABEL_9;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v33[0] = *MEMORY[0x1E0CB2D50];
    v18 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v18, v20, (uint64_t)CFSTR("%@ is not a string (%@)"), v21, v6, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = CFSTR("ck_isComparisonError");
    v34[0] = v22;
    v34[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v34, (uint64_t)v33, 2);
LABEL_8:
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v29, (uint64_t)CFSTR("CKErrorDomain"), 12, v28);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
    goto LABEL_9;
  }
  objc_msgSend_value(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v6, v11, (uint64_t)v10, v12);

  if ((isEqualToString & 1) == 0)
  {
    if (!a4)
      goto LABEL_9;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v31[0] = *MEMORY[0x1E0CB2D50];
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_value(self, v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v24, v25, (uint64_t)CFSTR("%@ is not equal to %@"), v26, v6, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = CFSTR("ck_isComparisonError");
    v32[0] = v22;
    v32[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)v32, (uint64_t)v31, 2);
    goto LABEL_8;
  }
  LOBYTE(a4) = 1;
LABEL_9:

  return (char)a4;
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
  objc_msgSend_value(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("value=%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
