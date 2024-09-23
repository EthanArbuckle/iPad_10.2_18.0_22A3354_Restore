@implementation GDKnosisIntentArgInfo

- (GDKnosisIntentArgInfo)initWithIntent:(id)a3 args:(id)a4 score:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  GDKnosisIntentArgInfo *v13;
  uint64_t v14;
  NSString *intent;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSSet *args;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSNumber *score;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GDKnosisIntentArgInfo;
  v13 = -[GDKnosisIntentArgInfo init](&v25, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v11, v12);
    intent = v13->_intent;
    v13->_intent = (NSString *)v14;

    v18 = objc_msgSend_copy(v9, v16, v17);
    args = v13->_args;
    v13->_args = (NSSet *)v18;

    v22 = objc_msgSend_copy(v10, v20, v21);
    score = v13->_score;
    v13->_score = (NSNumber *)v22;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *intent;
  id v5;
  void *v6;
  const char *v7;
  NSSet *args;
  void *v9;
  const char *v10;
  NSNumber *score;
  const char *v12;
  id v13;

  intent = self->_intent;
  v5 = a3;
  NSStringFromSelector(sel_intent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)intent, v6);

  args = self->_args;
  NSStringFromSelector(sel_args);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)args, v9);

  score = self->_score;
  NSStringFromSelector(sel_score);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)score, v13);

}

- (GDKnosisIntentArgInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  GDKnosisIntentArgInfo *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_intent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v14, v12, v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_args);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v21 = objc_opt_class();
      NSStringFromSelector(sel_score);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        self = (GDKnosisIntentArgInfo *)(id)objc_msgSend_initWithIntent_args_score_(self, v25, (uint64_t)v8, v18, v24);
        v27 = self;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend_error(v4, v25, v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
        v34 = (void *)MEMORY[0x1E0CB35C8];
        v47 = *MEMORY[0x1E0CB2D50];
        v48 = CFSTR("GDKnosisIntentArgInfo score is nil");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)&v48, &v47, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v34, v36, (uint64_t)CFSTR("GDErrorDomain"), 9, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_failWithError_(v4, v38, (uint64_t)v37);

      }
      v24 = 0;
    }
    else
    {
      objc_msgSend_error(v4, v19, v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v18 = 0;
        v27 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v42 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      v50 = CFSTR("GDKnosisIntentArgInfo args is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)&v50, &v49, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v42, v43, (uint64_t)CFSTR("GDErrorDomain"), 9, v24);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v45, (uint64_t)v44);

      v18 = 0;
    }
LABEL_14:
    v27 = 0;
    goto LABEL_15;
  }
  objc_msgSend_error(v4, v9, v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v39 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = CFSTR("GDKnosisIntentArgInfo intent is nil");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)v52, &v51, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v39, v40, (uint64_t)CFSTR("GDErrorDomain"), 9, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v41, (uint64_t)v24);
    goto LABEL_14;
  }
  v27 = 0;
LABEL_17:

  return v27;
}

- (NSString)intent
{
  return self->_intent;
}

- (NSSet)args
{
  return self->_args;
}

- (NSNumber)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_args, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
