@implementation CKComparisonPredicateValidator

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  char v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  char v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  char v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  char v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  char v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  char v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  char v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  char v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  void *v78;
  char v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  _QWORD v110[3];
  _QWORD v111[3];
  _QWORD v112[3];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[3];
  _QWORD v118[3];
  _QWORD v119[3];
  _QWORD v120[2];
  _QWORD v121[3];

  v121[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v120[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("%@ is not a comparison predicate"), v9, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v120[1] = CFSTR("ck_isComparisonError");
    v121[0] = v20;
    v121[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v121, (uint64_t)v120, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v19, v23, (uint64_t)CFSTR("CKErrorDomain"), 12, v22);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
LABEL_25:
      v18 = objc_retainAutorelease(v18);
      v83 = 0;
      *a4 = v18;
      goto LABEL_26;
    }
    goto LABEL_21;
  }
  objc_msgSend_modifierValidator(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (a4)
  {
    v109 = 0;
    v13 = objc_msgSend_validate_error_(v10, v11, (uint64_t)v6, (uint64_t)&v109);
    v14 = v109;

    if ((v13 & 1) == 0)
    {
      v47 = (void *)MEMORY[0x1E0CB35C8];
      v118[0] = *MEMORY[0x1E0CB2D50];
      v55 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_localizedDescription(v14, v15, v16, v17);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v55, v56, (uint64_t)CFSTR("Invalid modifier in <%@>: %@"), v57, v6, v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = *MEMORY[0x1E0CB3388];
      v119[0] = v52;
      v119[1] = v14;
      v118[1] = v58;
      v118[2] = CFSTR("ck_isComparisonError");
      v119[2] = MEMORY[0x1E0C9AAB0];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v59, (uint64_t)v119, (uint64_t)v118, 3);
      goto LABEL_23;
    }
    v18 = v14;
  }
  else
  {
    v24 = objc_msgSend_validate_error_(v10, v11, (uint64_t)v6, 0);

    v18 = 0;
    if ((v24 & 1) == 0)
      goto LABEL_21;
  }
  objc_msgSend_leftExpressionValidator(self, v15, v16, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leftExpression(v6, v26, v27, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    v60 = objc_msgSend_validate_error_(v25, v29, (uint64_t)v30, 0);

    if ((v60 & 1) != 0)
    {
      objc_msgSend_operatorValidator(self, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend_validate_error_(v64, v65, (uint64_t)v6, 0);

      if ((v66 & 1) != 0)
      {
        objc_msgSend_optionsValidator(self, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend_validate_error_(v70, v71, (uint64_t)v6, 0);

        if ((v72 & 1) != 0)
        {
          v14 = v18;
          goto LABEL_18;
        }
      }
    }
LABEL_21:
    v83 = 0;
    goto LABEL_26;
  }
  v108 = v18;
  v31 = objc_msgSend_validate_error_(v25, v29, (uint64_t)v30, (uint64_t)&v108);
  v14 = v108;

  if ((v31 & 1) == 0)
  {
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v116[0] = *MEMORY[0x1E0CB2D50];
    v84 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_localizedDescription(v14, v32, v33, v34);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v84, v85, (uint64_t)CFSTR("Invalid left expression in <%@>: %@"), v86, v6, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = *MEMORY[0x1E0CB3388];
    v117[0] = v52;
    v117[1] = v14;
    v116[1] = v87;
    v116[2] = CFSTR("ck_isComparisonError");
    v117[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v88, (uint64_t)v117, (uint64_t)v116, 3);
    goto LABEL_23;
  }
  objc_msgSend_operatorValidator(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v14;
  v37 = objc_msgSend_validate_error_(v35, v36, (uint64_t)v6, (uint64_t)&v107);
  v18 = v107;

  if ((v37 & 1) == 0)
  {
    v93 = (void *)MEMORY[0x1E0CB35C8];
    v114[0] = *MEMORY[0x1E0CB2D50];
    v94 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_localizedDescription(v18, v38, v39, v40);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v94, v95, (uint64_t)CFSTR("Invalid operator in <%@>: %@"), v96, v6, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = *MEMORY[0x1E0CB3388];
    v115[0] = v52;
    v115[1] = v18;
    v114[1] = v97;
    v114[2] = CFSTR("ck_isComparisonError");
    v115[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v98, (uint64_t)v115, (uint64_t)v114, 3);
LABEL_28:
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v93, v99, (uint64_t)CFSTR("CKErrorDomain"), 12, v89);
    v91 = objc_claimAutoreleasedReturnValue();
    v14 = v18;
    goto LABEL_24;
  }
  objc_msgSend_optionsValidator(self, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v18;
  v43 = objc_msgSend_validate_error_(v41, v42, (uint64_t)v6, (uint64_t)&v106);
  v14 = v106;

  if ((v43 & 1) == 0)
  {
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v112[0] = *MEMORY[0x1E0CB2D50];
    v48 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_localizedDescription(v14, v44, v45, v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v48, v50, (uint64_t)CFSTR("Invalid options in <%@>: %@"), v51, v6, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = *MEMORY[0x1E0CB3388];
    v113[0] = v52;
    v113[1] = v14;
    v112[1] = v53;
    v112[2] = CFSTR("ck_isComparisonError");
    v113[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v54, (uint64_t)v113, (uint64_t)v112, 3);
LABEL_23:
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v47, v90, (uint64_t)CFSTR("CKErrorDomain"), 12, v89);
    v91 = objc_claimAutoreleasedReturnValue();
LABEL_24:

    v18 = (id)v91;
    goto LABEL_25;
  }
LABEL_18:
  objc_msgSend_rightExpressionValidator(self, v44, v45, v46);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rightExpression(v6, v74, v75, v76);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    v83 = objc_msgSend_validate_error_(v73, v77, (uint64_t)v78, 0);

    v18 = v14;
    goto LABEL_26;
  }
  v105 = v14;
  v79 = objc_msgSend_validate_error_(v73, v77, (uint64_t)v78, (uint64_t)&v105);
  v18 = v105;

  if ((v79 & 1) == 0)
  {
    v93 = (void *)MEMORY[0x1E0CB35C8];
    v110[0] = *MEMORY[0x1E0CB2D50];
    v100 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_localizedDescription(v18, v80, v81, v82);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v100, v101, (uint64_t)CFSTR("Invalid right expression in <%@>: %@"), v102, v6, v49);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = *MEMORY[0x1E0CB3388];
    v111[0] = v52;
    v111[1] = v18;
    v110[1] = v103;
    v110[2] = CFSTR("ck_isComparisonError");
    v111[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v104, (uint64_t)v111, (uint64_t)v110, 3);
    goto LABEL_28;
  }
  v83 = 1;
LABEL_26:

  return v83;
}

- (id)CKPropertiesDescription
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;

  v3 = (void *)objc_opt_new();
  objc_msgSend_modifierValidator(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_modifierValidator(self, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v11, v13, (uint64_t)CFSTR("modifierValidator=%@"), v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v16, (uint64_t)v15, v17);

  }
  objc_msgSend_leftExpressionValidator(self, v8, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_leftExpressionValidator(self, v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v24, (uint64_t)CFSTR("leftExpressionValidator=%@"), v25, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v27, (uint64_t)v26, v28);

  }
  objc_msgSend_operatorValidator(self, v19, v20, v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_operatorValidator(self, v30, v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v33, v35, (uint64_t)CFSTR("operatorValidator=%@"), v36, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v38, (uint64_t)v37, v39);

  }
  objc_msgSend_optionsValidator(self, v30, v31, v32);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_optionsValidator(self, v41, v42, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v44, v46, (uint64_t)CFSTR("optionsValidator=%@"), v47, v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v49, (uint64_t)v48, v50);

  }
  objc_msgSend_rightExpressionValidator(self, v41, v42, v43);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    v55 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_rightExpressionValidator(self, v52, v53, v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v55, v57, (uint64_t)CFSTR("rightExpressionValidator=%@"), v58, v56);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v60, (uint64_t)v59, v61);

  }
  objc_msgSend_componentsJoinedByString_(v3, v52, (uint64_t)CFSTR(", "), v54);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

- (CKObjectValidating)modifierValidator
{
  return self->_modifierValidator;
}

- (void)setModifierValidator:(id)a3
{
  objc_storeStrong((id *)&self->_modifierValidator, a3);
}

- (CKObjectValidating)leftExpressionValidator
{
  return self->_leftExpressionValidator;
}

- (void)setLeftExpressionValidator:(id)a3
{
  objc_storeStrong((id *)&self->_leftExpressionValidator, a3);
}

- (CKObjectValidating)operatorValidator
{
  return self->_operatorValidator;
}

- (void)setOperatorValidator:(id)a3
{
  objc_storeStrong((id *)&self->_operatorValidator, a3);
}

- (CKObjectValidating)optionsValidator
{
  return self->_optionsValidator;
}

- (void)setOptionsValidator:(id)a3
{
  objc_storeStrong((id *)&self->_optionsValidator, a3);
}

- (CKObjectValidating)rightExpressionValidator
{
  return self->_rightExpressionValidator;
}

- (void)setRightExpressionValidator:(id)a3
{
  objc_storeStrong((id *)&self->_rightExpressionValidator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightExpressionValidator, 0);
  objc_storeStrong((id *)&self->_optionsValidator, 0);
  objc_storeStrong((id *)&self->_operatorValidator, 0);
  objc_storeStrong((id *)&self->_leftExpressionValidator, 0);
  objc_storeStrong((id *)&self->_modifierValidator, 0);
}

@end
