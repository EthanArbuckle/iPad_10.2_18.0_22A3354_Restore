@implementation CKKindOfCollectionClassValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  const char *v15;
  uint64_t v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  const char *v33;
  uint64_t v34;
  char v35;
  void *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  BOOL v42;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  id v49;
  id *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _BYTE v63[128];
  _QWORD v64[2];
  _QWORD v65[2];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  v50 = a4;
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v6 = v5;
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v55, (uint64_t)v66, 16);
    if (v8)
    {
      v9 = v8;
      v49 = v5;
      v10 = 0;
      v11 = *(_QWORD *)v56;
      v12 = *MEMORY[0x1E0CB2D50];
      v13 = 1;
      while (1)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v56 != v11)
            objc_enumerationMutation(v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (!a4)
            {
              v13 = 0;
              continue;
            }
LABEL_16:
            v18 = (void *)MEMORY[0x1E0CB35C8];
            v64[0] = v12;
            objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("Nested collection classes are not allowed: %@"), v16, v6);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v64[1] = CFSTR("ck_isComparisonError");
            v65[0] = v19;
            v65[1] = MEMORY[0x1E0C9AAA0];
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v65, (uint64_t)v64, 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v18, v22, (uint64_t)CFSTR("CKErrorDomain"), 12, v21);
            v23 = objc_claimAutoreleasedReturnValue();

            a4 = v50;
            v13 = 0;
            v10 = (id)v23;
            continue;
          }
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
            v13 = 0;
          if (a4 && (isKindOfClass & 1) != 0)
            goto LABEL_16;
        }
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v55, (uint64_t)v66, 16);
        if (!v9)
          goto LABEL_19;
      }
    }
    goto LABEL_38;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v42 = 0;
      v10 = 0;
      goto LABEL_41;
    }
    v44 = (void *)MEMORY[0x1E0CB35C8];
    v59[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v24, (uint64_t)CFSTR("<%@> is not a collection class"), v26, v5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = CFSTR("ck_isComparisonError");
    v60[0] = v45;
    v60[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v46, (uint64_t)v60, (uint64_t)v59, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v44, v48, (uint64_t)CFSTR("CKErrorDomain"), 12, v47);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v42 = 0;
    goto LABEL_40;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend_allValues(v5, v24, v25, v26);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v27, (uint64_t)&v51, (uint64_t)v63, 16);
  if (v28)
  {
    v29 = v28;
    v49 = v5;
    v10 = 0;
    v30 = *(_QWORD *)v52;
    v31 = *MEMORY[0x1E0CB2D50];
    v13 = 1;
    while (1)
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v52 != v30)
          objc_enumerationMutation(v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (!a4)
          {
            v13 = 0;
            continue;
          }
LABEL_34:
          v36 = (void *)MEMORY[0x1E0CB35C8];
          v61[0] = v31;
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v33, (uint64_t)CFSTR("Nested collection classes are not allowed: %@"), v34, v49);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v61[1] = CFSTR("ck_isComparisonError");
          v62[0] = v37;
          v62[1] = MEMORY[0x1E0C9AAA0];
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v38, (uint64_t)v62, (uint64_t)v61, 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v36, v40, (uint64_t)CFSTR("CKErrorDomain"), 12, v39);
          v41 = objc_claimAutoreleasedReturnValue();

          a4 = v50;
          v13 = 0;
          v10 = (id)v41;
          continue;
        }
        objc_opt_class();
        v35 = objc_opt_isKindOfClass();
        if ((v35 & 1) != 0)
          v13 = 0;
        if (a4 && (v35 & 1) != 0)
          goto LABEL_34;
      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v33, (uint64_t)&v51, (uint64_t)v63, 16);
      if (!v29)
      {
LABEL_19:
        v5 = v49;
        goto LABEL_39;
      }
    }
  }
LABEL_38:
  v10 = 0;
  v13 = 1;
LABEL_39:

  v42 = v13 & 1;
  if (a4)
  {
LABEL_40:
    v10 = objc_retainAutorelease(v10);
    *a4 = v10;
  }
LABEL_41:

  return v42;
}

@end
