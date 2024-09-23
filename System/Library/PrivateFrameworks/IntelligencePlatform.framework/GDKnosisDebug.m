@implementation GDKnosisDebug

- (GDKnosisDebug)initWithIndexCallCount:(int)a3 execSteps:(id)a4 messages:(id)a5
{
  id v8;
  id v9;
  GDKnosisDebug *v10;
  const char *v11;
  uint64_t v12;
  GDKnosisDebug *v13;
  uint64_t v14;
  NSArray *execSteps;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *messages;
  objc_super v21;

  v8 = a4;
  v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)GDKnosisDebug;
  v10 = -[GDKnosisDebug init](&v21, sel_init);
  v13 = v10;
  if (v10)
  {
    v10->_indexCallCount = a3;
    v14 = objc_msgSend_copy(v8, v11, v12);
    execSteps = v13->_execSteps;
    v13->_execSteps = (NSArray *)v14;

    v18 = objc_msgSend_copy(v9, v16, v17);
    messages = v13->_messages;
    v13->_messages = (NSArray *)v18;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t indexCallCount;
  id v5;
  void *v6;
  const char *v7;
  NSArray *execSteps;
  void *v9;
  const char *v10;
  NSArray *messages;
  const char *v12;
  id v13;

  indexCallCount = self->_indexCallCount;
  v5 = a3;
  NSStringFromSelector(sel_indexCallCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInt_forKey_(v5, v7, indexCallCount, v6);

  execSteps = self->_execSteps;
  NSStringFromSelector(sel_execSteps);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)execSteps, v9);

  messages = self->_messages;
  NSStringFromSelector(sel_messages);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)messages, v13);

}

- (GDKnosisDebug)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  GDKnosisDebug *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSStringFromSelector(sel_indexCallCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_decodeIntForKey_(v4, v6, (uint64_t)v5);

  objc_msgSend_error(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v12 = objc_opt_class();
    NSStringFromSelector(sel_execSteps);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v14, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend_error(v4, v16, v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v11 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      v42[0] = CFSTR("GDKnosisDebug execSteps is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v42, &v41, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v29, v31, (uint64_t)CFSTR("GDErrorDomain"), 9, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v33, (uint64_t)v32);

    }
    v18 = objc_opt_class();
    NSStringFromSelector(sel_messages);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v20, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend_error(v4, v22, v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v11 = 0;
        goto LABEL_10;
      }
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      v40 = CFSTR("GDKnosisDebug messages is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)&v40, &v39, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v34, v36, (uint64_t)CFSTR("GDErrorDomain"), 9, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v38, (uint64_t)v37);

    }
    self = (GDKnosisDebug *)(id)objc_msgSend_initWithIndexCallCount_execSteps_messages_(self, v22, v7, v15, v21);
    v11 = self;
LABEL_10:

    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (int)indexCallCount
{
  return self->_indexCallCount;
}

- (NSArray)execSteps
{
  return self->_execSteps;
}

- (NSArray)messages
{
  return self->_messages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_execSteps, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
