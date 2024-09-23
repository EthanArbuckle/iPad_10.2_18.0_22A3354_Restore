@implementation CKAnyPredicateValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  NSArray *validators;
  NSArray *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  if (self)
    validators = self->_validators;
  else
    validators = 0;
  v8 = validators;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v42, (uint64_t)v46, 16);
  if (!v10)
  {
    v13 = 0;
    goto LABEL_23;
  }
  v12 = v10;
  v13 = 0;
  v14 = *(_QWORD *)v43;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v43 != v14)
        objc_enumerationMutation(v8);
      v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      if (a4)
      {
        v41 = 0;
        v17 = objc_msgSend_validate_error_(v16, v11, (uint64_t)v6, (uint64_t)&v41);
        v18 = v41;
        v22 = v18;
        if ((v17 & 1) != 0)
          goto LABEL_30;
        if ((objc_msgSend_isComparisonError(v18, v19, v20, v21) & 1) != 0)
        {
LABEL_15:
          if (!v13)
          {
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v23, v24);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_addObject_(v13, v11, (uint64_t)v22, v24);
        }
        else
        {
          if (!v22)
            continue;
          objc_msgSend_addObject_(0, v11, (uint64_t)v22, v24);
        }

        continue;
      }
      if ((objc_msgSend_validate_error_(v16, v11, (uint64_t)v6, 0) & 1) != 0)
      {
        v22 = 0;
LABEL_30:

        v39 = 1;
        goto LABEL_31;
      }
      v22 = 0;
      if (objc_msgSend_isComparisonError(0, v25, v26, v27))
        goto LABEL_15;
    }
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v42, (uint64_t)v46, 16);
    if (v12)
      continue;
    break;
  }
LABEL_23:

  if (a4)
  {
    objc_msgSend_lastObject(0, v28, v29, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend_count(v13, v35, v36, v37))
    {
      objc_msgSend_lastObject(v13, v31, v32, v33);
      v38 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v38;
    }
    v8 = objc_retainAutorelease(v34);
    v39 = 0;
    *a4 = v8;
LABEL_31:

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *validators;

  validators = self;
  if (self)
    validators = self->_validators;
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("validators=%@"), v2, validators);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validators, 0);
}

@end
