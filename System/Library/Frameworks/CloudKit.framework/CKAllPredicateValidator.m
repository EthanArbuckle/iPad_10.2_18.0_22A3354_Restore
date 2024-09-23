@implementation CKAllPredicateValidator

- (CKAllPredicateValidator)initWithValidators:(id)a3
{
  id v3;
  CKAllPredicateValidator *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAllPredicateValidator;
  v3 = a3;
  v4 = -[CKAllPredicateValidator init](&v8, sel_init);
  objc_msgSend_setValidators_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

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
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  char v19;
  id v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_validators(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v12)
  {
    v14 = v12;
    v15 = 0;
    v16 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (a4)
        {
          v23 = v15;
          v19 = objc_msgSend_validate_error_(v18, v13, (uint64_t)v6, (uint64_t)&v23);
          v20 = v23;

          if ((v19 & 1) == 0)
          {
            v15 = objc_retainAutorelease(v20);
            v21 = 0;
            *a4 = v15;
            goto LABEL_17;
          }
          v15 = v20;
        }
        else if ((objc_msgSend_validate_error_(v18, v13, (uint64_t)v6, 0) & 1) == 0)
        {
          v21 = 0;
          goto LABEL_17;
        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v24, (uint64_t)v28, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }
  v21 = 1;
LABEL_17:

  return v21;
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
  objc_msgSend_validators(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("validators=%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)validators
{
  return self->_validators;
}

- (void)setValidators:(id)a3
{
  objc_storeStrong((id *)&self->_validators, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validators, 0);
}

@end
