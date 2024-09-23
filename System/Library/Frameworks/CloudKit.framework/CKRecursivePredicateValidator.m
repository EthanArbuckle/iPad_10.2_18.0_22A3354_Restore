@implementation CKRecursivePredicateValidator

- (CKRecursivePredicateValidator)initWithValidator:(id)a3
{
  id v3;
  CKRecursivePredicateValidator *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKRecursivePredicateValidator;
  v3 = a3;
  v4 = -[CKRecursivePredicateValidator init](&v8, sel_init);
  objc_msgSend_setValidator_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  BOOL v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_validator(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_validate_error_(v10, v11, (uint64_t)v6, (uint64_t)a4);

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend_subpredicates(v6, v13, v14, v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v25, (uint64_t)v29, 16);
      if (v18)
      {
        v20 = v18;
        v21 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(v16);
            if (!objc_msgSend_validate_error_(self, v19, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (uint64_t)a4))
            {
              v23 = 0;
              goto LABEL_15;
            }
          }
          v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v25, (uint64_t)v29, 16);
          if (v20)
            continue;
          break;
        }
      }
      v23 = 1;
LABEL_15:

    }
    else
    {
      v23 = 1;
    }
  }
  else
  {
    v23 = 0;
  }

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
