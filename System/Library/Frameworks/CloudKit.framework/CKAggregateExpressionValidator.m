@implementation CKAggregateExpressionValidator

- (CKAggregateExpressionValidator)initWithValidators:(id)a3
{
  id v3;
  CKAggregateExpressionValidator *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAggregateExpressionValidator;
  v3 = a3;
  v4 = -[CKAggregateExpressionValidator init](&v8, sel_init);
  objc_msgSend_setSubExpressionValidators_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

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
  uint64_t v13;
  uint64_t v14;
  char isKindOfClass;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  id *v83;
  void *v84;
  void *v85;
  char v86;
  id v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  void *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  void *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  void *v114;
  const char *v115;
  void *v116;
  void *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  const char *v123;
  void *v124;
  const char *v125;
  id v126;
  id v127;
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[4];

  v137[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_subExpressionValidators(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_count(v10, v11, v12, v13);

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v19 = isKindOfClass;
  v20 = 0;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v136[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("<%@> is not an expression"), v18, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v136[1] = CFSTR("ck_isComparisonError");
    v137[0] = v22;
    v137[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v137, (uint64_t)v136, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v21, v25, (uint64_t)CFSTR("CKErrorDomain"), 12, v24);
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((v19 & 1) != 0)
  {
    if (objc_msgSend_expressionType(v6, v16, v17, v18) == 14)
    {
      objc_msgSend_constantValue(v6, v26, v27, v28);
      v29 = objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v33 = (void *)v29;
        objc_msgSend_constantValue(v6, v30, v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v35 = objc_opt_isKindOfClass();

        if ((v35 & 1) != 0)
        {
          objc_msgSend_subExpressionValidators(self, v30, v36, v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend_count(v37, v38, v39, v40);

          v126 = v6;
          if (v41 < 2)
          {
LABEL_11:
            objc_msgSend_constantValue(v6, v42, v43, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_subExpressionValidators(self, v61, v62, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_firstObject(v64, v65, v66, v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend_count(v45, v69, v70, v71))
            {
              v75 = 0;
              v76 = v20;
              while (1)
              {
                if (v14 != 1)
                {
                  objc_msgSend_subExpressionValidators(self, v72, v73, v74);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectAtIndexedSubscript_(v77, v78, v75, v79);
                  v80 = objc_claimAutoreleasedReturnValue();
                  v81 = v68;
                  v68 = (void *)v80;

                }
                objc_msgSend_objectAtIndexedSubscript_(v45, v72, v75, v74);
                v20 = (id)objc_claimAutoreleasedReturnValue();
                if (a4)
                {
                  v83 = a4;
                  v84 = v45;
                  v127 = v76;
                  v85 = v68;
                  v86 = objc_msgSend_validate_error_(v68, v82, (uint64_t)v20, (uint64_t)&v127);
                  v87 = v127;

                  if ((v86 & 1) == 0)
                  {
                    v116 = (void *)MEMORY[0x1E0CB35C8];
                    v128[0] = *MEMORY[0x1E0CB2D50];
                    v117 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend_localizedDescription(v87, v88, v89, v90);
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_stringWithFormat_(v117, v119, (uint64_t)CFSTR("Aggregate value %lu of <%@> is invalid: %@"), v120, v75, v126, v118);
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    v122 = *MEMORY[0x1E0CB3388];
                    v129[0] = v121;
                    v129[1] = v87;
                    v128[1] = v122;
                    v128[2] = CFSTR("ck_isComparisonError");
                    v129[2] = MEMORY[0x1E0C9AAB0];
                    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v123, (uint64_t)v129, (uint64_t)v128, 3);
                    v124 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_errorWithDomain_code_userInfo_(v116, v125, (uint64_t)CFSTR("CKErrorDomain"), 12, v124);
                    v76 = (void *)objc_claimAutoreleasedReturnValue();

                    v45 = v84;
                    a4 = v83;
                    v68 = v85;
                    goto LABEL_28;
                  }
                  v76 = v87;
                  v45 = v84;
                  a4 = v83;
                  v68 = v85;
                }
                else if ((objc_msgSend_validate_error_(v68, v82, (uint64_t)v20, 0) & 1) == 0)
                {
                  goto LABEL_28;
                }

                if (++v75 >= (unint64_t)objc_msgSend_count(v45, v91, v92, v93))
                {
                  v94 = 1;
                  goto LABEL_29;
                }
              }
            }
            v94 = 1;
            goto LABEL_30;
          }
          objc_msgSend_constantValue(v6, v42, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend_count(v45, v46, v47, v48);
          objc_msgSend_subExpressionValidators(self, v50, v51, v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend_count(v53, v54, v55, v56);

          if (v49 == v57)
          {

            goto LABEL_11;
          }
          if (!a4)
          {
            v94 = 0;
LABEL_31:

            if (!a4)
              goto LABEL_35;
            goto LABEL_32;
          }
          v100 = (void *)MEMORY[0x1E0CB35C8];
          v130[0] = *MEMORY[0x1E0CB2D50];
          v101 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_subExpressionValidators(self, v58, v59, v60);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend_count(v68, v102, v103, v104);
          v109 = objc_msgSend_count(v45, v106, v107, v108);
          objc_msgSend_stringWithFormat_(v101, v110, (uint64_t)CFSTR("Invalid number of values in <%@>. Expected %lu, but found %lu"), v111, v6, v105, v109);
          v112 = objc_claimAutoreleasedReturnValue();
          v130[1] = CFSTR("ck_isComparisonError");
          v131[0] = v112;
          v131[1] = MEMORY[0x1E0C9AAB0];
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v113, (uint64_t)v131, (uint64_t)v130, 2);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v100, v115, (uint64_t)CFSTR("CKErrorDomain"), 12, v114);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = (id)v112;
LABEL_28:

          v94 = 0;
LABEL_29:
          v20 = v76;
LABEL_30:

          v6 = v126;
          goto LABEL_31;
        }
      }
      if (a4)
      {
        v95 = (void *)MEMORY[0x1E0CB35C8];
        v132[0] = *MEMORY[0x1E0CB2D50];
        v126 = v6;
        objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v30, (uint64_t)CFSTR("%@ is not a valid aggregate"), v32, v6);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v132[1] = CFSTR("ck_isComparisonError");
        v133[0] = v45;
        v133[1] = MEMORY[0x1E0C9AAB0];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v97, (uint64_t)v133, (uint64_t)v132, 2);
        goto LABEL_27;
      }
    }
    else if (a4)
    {
      v95 = (void *)MEMORY[0x1E0CB35C8];
      v134[0] = *MEMORY[0x1E0CB2D50];
      v126 = v6;
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v26, (uint64_t)CFSTR("<%@> is not an aggregate expression"), v28, v6);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v134[1] = CFSTR("ck_isComparisonError");
      v135[0] = v45;
      v135[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v96, (uint64_t)v135, (uint64_t)v134, 2);
LABEL_27:
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v95, v98, (uint64_t)CFSTR("CKErrorDomain"), 12, v68);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    v94 = 0;
    goto LABEL_35;
  }
  v94 = 0;
  if (!a4)
    goto LABEL_35;
LABEL_32:
  if (!v94)
  {
    v20 = objc_retainAutorelease(v20);
    v94 = 0;
    *a4 = v20;
  }
LABEL_35:

  return v94;
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
  objc_msgSend_subExpressionValidators(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("validators=%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)subExpressionValidators
{
  return self->_subExpressionValidators;
}

- (void)setSubExpressionValidators:(id)a3
{
  objc_storeStrong((id *)&self->_subExpressionValidators, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subExpressionValidators, 0);
}

@end
