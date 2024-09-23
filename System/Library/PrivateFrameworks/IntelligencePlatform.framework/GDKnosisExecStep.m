@implementation GDKnosisExecStep

- (GDKnosisExecStep)initWithKgQueryNode:(id)a3 indexQuery:(id)a4 messages:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  GDKnosisExecStep *v13;
  uint64_t v14;
  NSString *kgQueryNode;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *indexQuery;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *messages;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)GDKnosisExecStep;
  v13 = -[GDKnosisExecStep init](&v25, sel_init);
  if (v13)
  {
    v14 = objc_msgSend_copy(v8, v11, v12);
    kgQueryNode = v13->_kgQueryNode;
    v13->_kgQueryNode = (NSString *)v14;

    v18 = objc_msgSend_copy(v9, v16, v17);
    indexQuery = v13->_indexQuery;
    v13->_indexQuery = (NSString *)v18;

    v22 = objc_msgSend_copy(v10, v20, v21);
    messages = v13->_messages;
    v13->_messages = (NSArray *)v22;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *kgQueryNode;
  id v5;
  void *v6;
  const char *v7;
  NSString *indexQuery;
  void *v9;
  const char *v10;
  NSArray *messages;
  const char *v12;
  id v13;

  kgQueryNode = self->_kgQueryNode;
  v5 = a3;
  NSStringFromSelector(sel_kgQueryNode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)kgQueryNode, v6);

  indexQuery = self->_indexQuery;
  NSStringFromSelector(sel_indexQuery);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)indexQuery, v9);

  messages = self->_messages;
  NSStringFromSelector(sel_messages);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)messages, v13);

}

- (GDKnosisExecStep)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  GDKnosisExecStep *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_kgQueryNode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_error(v4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v13 = objc_opt_class();
    NSStringFromSelector(sel_indexQuery);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_error(v4, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v12 = 0;
LABEL_10:

      goto LABEL_11;
    }
    v20 = objc_opt_class();
    NSStringFromSelector(sel_messages);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v22, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      objc_msgSend_error(v4, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v12 = 0;
        goto LABEL_9;
      }
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CB2D50];
      v35[0] = CFSTR("GDKnosisExecStep messages is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)v35, &v34, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v29, v31, (uint64_t)CFSTR("GDErrorDomain"), 9, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v33, (uint64_t)v32);

    }
    self = (GDKnosisExecStep *)(id)objc_msgSend_initWithKgQueryNode_indexQuery_messages_(self, v24, (uint64_t)v8, v16, v23);
    v12 = self;
LABEL_9:

    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (NSString)kgQueryNode
{
  return self->_kgQueryNode;
}

- (NSString)indexQuery
{
  return self->_indexQuery;
}

- (NSArray)messages
{
  return self->_messages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_indexQuery, 0);
  objc_storeStrong((id *)&self->_kgQueryNode, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
