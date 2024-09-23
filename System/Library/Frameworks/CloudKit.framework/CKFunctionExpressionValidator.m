@implementation CKFunctionExpressionValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  char isKindOfClass;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  char isEqualToString;
  char v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSArray *argumentValidators;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  NSArray *v54;
  const char *v55;
  char v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSString *functionName;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  void *v75;
  NSArray *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  void *v91;
  const char *v92;
  void *v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  const char *v100;
  void *v101;
  const char *v102;
  NSArray *obj;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[3];
  _QWORD v110[3];
  _BYTE v111[128];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[4];

  v119[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = isKindOfClass;
  v12 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v118[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("<%@> is not an expression"), v10, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v118[1] = CFSTR("ck_isComparisonError");
    v119[0] = v14;
    v119[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v119, (uint64_t)v118, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, (uint64_t)CFSTR("CKErrorDomain"), 12, v16);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((v11 & 1) != 0)
  {
    if (objc_msgSend_expressionType(v6, v8, v9, v10) == 4)
    {
      objc_msgSend_function(v6, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      if (self)
        isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)self->_functionName, v23);
      else
        isEqualToString = objc_msgSend_isEqualToString_(v21, v22, 0, v23);
      v26 = isEqualToString;

      if ((v26 & 1) != 0)
      {
        objc_msgSend_arguments(v6, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_count(v30, v31, v32, v33);
        if (self)
          v38 = objc_msgSend_count(self->_argumentValidators, v34, v35, v36);
        else
          v38 = objc_msgSend_count(0, v34, v35, v36);
        v39 = v38;

        if (v37 == v39)
        {
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          if (self)
            argumentValidators = self->_argumentValidators;
          else
            argumentValidators = 0;
          obj = argumentValidators;
          v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v105, (uint64_t)v111, 16);
          if (v42)
          {
            v46 = v42;
            v47 = 0;
            v48 = *(_QWORD *)v106;
            while (2)
            {
              for (i = 0; i != v46; ++i)
              {
                if (*(_QWORD *)v106 != v48)
                  objc_enumerationMutation(obj);
                v50 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
                objc_msgSend_arguments(v6, v43, v44, v45);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectAtIndexedSubscript_(v51, v52, v47 + i, v53);
                v54 = (NSArray *)objc_claimAutoreleasedReturnValue();

                if (a4)
                {
                  v104 = v12;
                  v56 = objc_msgSend_validate_error_(v50, v55, (uint64_t)v54, (uint64_t)&v104);
                  v57 = v104;

                  if ((v56 & 1) == 0)
                  {
                    v94 = (void *)MEMORY[0x1E0CB35C8];
                    v109[0] = *MEMORY[0x1E0CB2D50];
                    v95 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend_localizedDescription(v57, v58, v59, v60);
                    v12 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_stringWithFormat_(v95, v96, (uint64_t)CFSTR("Argument %lu of <%@> is invalid: %@"), v97, v47 + i, v6, v12);
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    v99 = *MEMORY[0x1E0CB3388];
                    v110[0] = v98;
                    v110[1] = v57;
                    v109[1] = v99;
                    v109[2] = CFSTR("ck_isComparisonError");
                    v110[2] = MEMORY[0x1E0C9AAB0];
                    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v100, (uint64_t)v110, (uint64_t)v109, 3);
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_errorWithDomain_code_userInfo_(v94, v102, (uint64_t)CFSTR("CKErrorDomain"), 12, v101);
                    v65 = objc_claimAutoreleasedReturnValue();

                    goto LABEL_39;
                  }
                  v12 = v57;
                }
                else if ((objc_msgSend_validate_error_(v50, v55, (uint64_t)v54, 0) & 1) == 0)
                {
                  goto LABEL_40;
                }

              }
              v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v105, (uint64_t)v111, 16);
              v47 += i;
              v61 = 1;
              if (v46)
                continue;
              break;
            }
          }
          else
          {
            v61 = 1;
          }
LABEL_41:

          if (!a4)
            goto LABEL_45;
          goto LABEL_42;
        }
        if (a4)
        {
          v74 = (void *)MEMORY[0x1E0CB35C8];
          v112[0] = *MEMORY[0x1E0CB2D50];
          v75 = (void *)MEMORY[0x1E0CB3940];
          if (self)
            v76 = self->_argumentValidators;
          else
            v76 = 0;
          v54 = v76;
          v80 = objc_msgSend_count(v54, v77, v78, v79);
          objc_msgSend_arguments(v6, v81, v82, v83);
          obj = (NSArray *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend_count(obj, v84, v85, v86);
          objc_msgSend_stringWithFormat_(v75, v88, (uint64_t)CFSTR("Invalid number of arguments to <%@>. Expected %lu, but found %lu"), v89, v6, v80, v87);
          v72 = objc_claimAutoreleasedReturnValue();
          v112[1] = CFSTR("ck_isComparisonError");
          v113[0] = v72;
          v113[1] = MEMORY[0x1E0C9AAB0];
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v90, (uint64_t)v113, (uint64_t)v112, 2);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v74, v92, (uint64_t)CFSTR("CKErrorDomain"), 12, v91);
          v65 = objc_claimAutoreleasedReturnValue();

LABEL_38:
          v12 = (id)v72;
LABEL_39:

          v12 = (id)v65;
LABEL_40:

          v61 = 0;
          goto LABEL_41;
        }
      }
      else if (a4)
      {
        v66 = (void *)MEMORY[0x1E0CB35C8];
        v114[0] = *MEMORY[0x1E0CB2D50];
        v67 = (void *)MEMORY[0x1E0CB3940];
        if (self)
          functionName = self->_functionName;
        else
          functionName = 0;
        obj = functionName;
        objc_msgSend_stringWithFormat_(v67, v69, (uint64_t)CFSTR("%@ does not match function '%@'"), v70, v6, obj);
        v54 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v114[1] = CFSTR("ck_isComparisonError");
        v115[0] = v54;
        v115[1] = MEMORY[0x1E0C9AAB0];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v71, (uint64_t)v115, (uint64_t)v114, 2);
        v72 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v66, v73, (uint64_t)CFSTR("CKErrorDomain"), 12, v72);
        v65 = objc_claimAutoreleasedReturnValue();

        goto LABEL_38;
      }
    }
    else if (a4)
    {
      v62 = (void *)MEMORY[0x1E0CB35C8];
      v116[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v18, (uint64_t)CFSTR("<%@> is not a function expression"), v20, v6);
      v116[1] = CFSTR("ck_isComparisonError");
      obj = (NSArray *)objc_claimAutoreleasedReturnValue();
      v117[0] = obj;
      v117[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v63, (uint64_t)v117, (uint64_t)v116, 2);
      v54 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v62, v64, (uint64_t)CFSTR("CKErrorDomain"), 12, v54);
      v65 = objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    }
    v61 = 0;
    goto LABEL_45;
  }
  v61 = 0;
  if (!a4)
    goto LABEL_45;
LABEL_42:
  if (!v61)
  {
    v12 = objc_retainAutorelease(v12);
    v61 = 0;
    *a4 = v12;
  }
LABEL_45:

  return v61;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v3;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self)
  {
    v5 = self->_functionName;
    objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("functionName=%@, validators=%@"), v7, v5, self->_argumentValidators);
  }
  else
  {
    v5 = 0;
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("functionName=%@, validators=%@"), v2, 0, 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argumentValidators, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
}

@end
