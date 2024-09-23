@implementation GDKnosisArgInfo

- (GDKnosisArgInfo)initWithValue:(id)a3 arg:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  GDKnosisArgInfo *v10;
  uint64_t v11;
  NSString *value;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *arg;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GDKnosisArgInfo;
  v10 = -[GDKnosisArgInfo init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    value = v10->_value;
    v10->_value = (NSString *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    arg = v10->_arg;
    v10->_arg = (NSString *)v15;

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *value;
  id v5;
  void *v6;
  const char *v7;
  NSString *arg;
  const char *v9;
  id v10;

  value = self->_value;
  v5 = a3;
  NSStringFromSelector(sel_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)value, v6);

  arg = self->_arg;
  NSStringFromSelector("arg");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)arg, v10);

}

- (GDKnosisArgInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  GDKnosisArgInfo *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = objc_opt_class();
    NSStringFromSelector("arg");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      self = (GDKnosisArgInfo *)(id)objc_msgSend_initWithValue_arg_(self, v15, (uint64_t)v8, v14);
      v17 = self;
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend_error(v4, v15, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      v33 = CFSTR("GDKnosisArgInfo arg is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v33, &v32, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v22, v24, (uint64_t)CFSTR("GDErrorDomain"), 9, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v26, (uint64_t)v25);

    }
    v14 = 0;
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  objc_msgSend_error(v4, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = CFSTR("GDKnosisArgInfo value is nil");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v35, &v34, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v27, v28, (uint64_t)CFSTR("GDErrorDomain"), 9, v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v30, (uint64_t)v29);

    goto LABEL_10;
  }
  v17 = 0;
LABEL_12:

  return v17;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)arg
{
  return self->_arg;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arg, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
