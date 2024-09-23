@implementation GDKnosisResult

- (GDKnosisResult)initWithQuery:(id)a3 kgq:(id)a4 status:(unint64_t)a5 answers:(id)a6 errorMessage:(id)a7 limit:(id)a8 offset:(id)a9 hasMoreAnswers:(BOOL)a10 debug:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  GDKnosisResult *v26;
  uint64_t v27;
  NSString *query;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSString *kgq;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *answers;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSString *errorMessage;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSNumber *limit;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSNumber *offset;
  objc_super v50;

  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a11;
  v50.receiver = self;
  v50.super_class = (Class)GDKnosisResult;
  v26 = -[GDKnosisResult init](&v50, sel_init);
  if (v26)
  {
    v27 = objc_msgSend_copy(v17, v24, v25);
    query = v26->_query;
    v26->_query = (NSString *)v27;

    v31 = objc_msgSend_copy(v18, v29, v30);
    kgq = v26->_kgq;
    v26->_kgq = (NSString *)v31;

    v26->_status = a5;
    v35 = objc_msgSend_copy(v19, v33, v34);
    answers = v26->_answers;
    v26->_answers = (NSArray *)v35;

    v39 = objc_msgSend_copy(v20, v37, v38);
    errorMessage = v26->_errorMessage;
    v26->_errorMessage = (NSString *)v39;

    v43 = objc_msgSend_copy(v21, v41, v42);
    limit = v26->_limit;
    v26->_limit = (NSNumber *)v43;

    v47 = objc_msgSend_copy(v22, v45, v46);
    offset = v26->_offset;
    v26->_offset = (NSNumber *)v47;

    v26->_hasMoreAnswers = a10;
    objc_storeStrong((id *)&v26->_debug, a11);
  }

  return v26;
}

- (GDKnosisResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  GDKnosisResult *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  const char *v72;
  void *v73;
  const char *v74;
  const char *v75;
  void *v76;
  const char *v77;
  const char *v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  void *v83;
  void *v84;
  const char *v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  char v96;
  uint64_t v97;
  const __CFString *v98;
  uint64_t v99;
  const __CFString *v100;
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  const __CFString *v104;
  uint64_t v105;
  _QWORD v106[2];

  v106[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_query);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = objc_opt_class();
    NSStringFromSelector("kgq");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend_error(v4, v15, v16);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        v14 = 0;
        v63 = 0;
LABEL_34:

        goto LABEL_35;
      }
      v73 = (void *)MEMORY[0x1E0CB35C8];
      v103 = *MEMORY[0x1E0CB2D50];
      v104 = CFSTR("GDKnosisResult kgq is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v67, (uint64_t)&v104, &v103, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v73, v74, (uint64_t)CFSTR("GDErrorDomain"), 9, v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v75, (uint64_t)v30);
      goto LABEL_20;
    }
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v17, v20, v18, v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_answers);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v27 = objc_opt_class();
      NSStringFromSelector(sel_errorMessage);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_error(v4, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
        NSStringFromSelector(sel_status);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend_decodeIntegerForKey_(v4, v35, (uint64_t)v34);

        objc_msgSend_error(v4, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
          v40 = objc_opt_class();
          NSStringFromSelector(sel_limit);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v40, v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            v46 = objc_opt_class();
            NSStringFromSelector(sel_offset);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v46, v47);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              NSStringFromSelector(sel_hasMoreAnswers);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = objc_msgSend_decodeBoolForKey_(v4, v53, (uint64_t)v52);

              objc_msgSend_error(v4, v54, v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v56)
              {
                v94 = objc_opt_class();
                NSStringFromSelector(sel_debug);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_decodeObjectOfClass_forKey_(v4, v58, v94, v57);
                v95 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_error(v4, v59, v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();

                if (v61)
                {
                  v63 = 0;
                }
                else
                {
                  LOBYTE(v93) = v96;
                  self = (GDKnosisResult *)(id)objc_msgSend_initWithQuery_kgq_status_answers_errorMessage_limit_offset_hasMoreAnswers_debug_(self, v62, (uint64_t)v8, v14, v36, v24, v30, v43, v49, v93, v95);
                  v63 = self;
                }

                goto LABEL_30;
              }
            }
            else
            {
              objc_msgSend_error(v4, v50, v51);
              v81 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v81)
              {
                v83 = (void *)MEMORY[0x1E0CB35C8];
                v97 = *MEMORY[0x1E0CB2D50];
                v98 = CFSTR("GDKnosisResult offset is nil");
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v82, (uint64_t)&v98, &v97, 1);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_errorWithDomain_code_userInfo_(v83, v85, (uint64_t)CFSTR("GDErrorDomain"), 9, v84);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_failWithError_(v4, v87, (uint64_t)v86);

              }
              v49 = 0;
            }
LABEL_29:
            v63 = 0;
LABEL_30:

            goto LABEL_31;
          }
          objc_msgSend_error(v4, v44, v45);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v79)
          {
            v88 = (void *)MEMORY[0x1E0CB35C8];
            v99 = *MEMORY[0x1E0CB2D50];
            v100 = CFSTR("GDKnosisResult limit is nil");
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v80, (uint64_t)&v100, &v99, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v88, v89, (uint64_t)CFSTR("GDErrorDomain"), 9, v49);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_failWithError_(v4, v91, (uint64_t)v90);

            goto LABEL_29;
          }
          v43 = 0;
LABEL_22:
          v63 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
LABEL_20:
      v63 = 0;
LABEL_32:

      goto LABEL_33;
    }
    objc_msgSend_error(v4, v25, v26);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v68)
    {
      v76 = (void *)MEMORY[0x1E0CB35C8];
      v101 = *MEMORY[0x1E0CB2D50];
      v102 = CFSTR("GDKnosisResult answers is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v69, (uint64_t)&v102, &v101, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v76, v77, (uint64_t)CFSTR("GDErrorDomain"), 9, v30);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v78, (uint64_t)v43);
      goto LABEL_22;
    }
    v24 = 0;
LABEL_18:
    v63 = 0;
LABEL_33:

    goto LABEL_34;
  }
  objc_msgSend_error(v4, v9, v10);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v64)
  {
    v70 = (void *)MEMORY[0x1E0CB35C8];
    v105 = *MEMORY[0x1E0CB2D50];
    v106[0] = CFSTR("GDKnosisResult query is nil");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v65, (uint64_t)v106, &v105, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v70, v71, (uint64_t)CFSTR("GDErrorDomain"), 9, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v72, (uint64_t)v24);
    goto LABEL_18;
  }
  v63 = 0;
LABEL_35:

  return v63;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *query;
  id v5;
  void *v6;
  const char *v7;
  NSString *kgq;
  void *v9;
  const char *v10;
  unint64_t status;
  void *v12;
  const char *v13;
  NSArray *answers;
  void *v15;
  const char *v16;
  NSString *errorMessage;
  void *v18;
  const char *v19;
  NSNumber *limit;
  void *v21;
  const char *v22;
  NSNumber *offset;
  void *v24;
  const char *v25;
  _BOOL8 hasMoreAnswers;
  void *v27;
  const char *v28;
  GDKnosisDebug *debug;
  const char *v30;
  id v31;

  query = self->_query;
  v5 = a3;
  NSStringFromSelector(sel_query);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)query, v6);

  kgq = self->_kgq;
  NSStringFromSelector("kgq");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)kgq, v9);

  status = self->_status;
  NSStringFromSelector(sel_status);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v13, status, v12);

  answers = self->_answers;
  NSStringFromSelector(sel_answers);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)answers, v15);

  errorMessage = self->_errorMessage;
  NSStringFromSelector(sel_errorMessage);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)errorMessage, v18);

  limit = self->_limit;
  NSStringFromSelector(sel_limit);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)limit, v21);

  offset = self->_offset;
  NSStringFromSelector(sel_offset);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)offset, v24);

  hasMoreAnswers = self->_hasMoreAnswers;
  NSStringFromSelector(sel_hasMoreAnswers);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v28, hasMoreAnswers, v27);

  debug = self->_debug;
  NSStringFromSelector(sel_debug);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v30, (uint64_t)debug, v31);

}

- (NSString)query
{
  return self->_query;
}

- (NSString)kgq
{
  return self->_kgq;
}

- (unint64_t)status
{
  return self->_status;
}

- (NSArray)answers
{
  return self->_answers;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (NSNumber)offset
{
  return self->_offset;
}

- (BOOL)hasMoreAnswers
{
  return self->_hasMoreAnswers;
}

- (GDKnosisDebug)debug
{
  return self->_debug;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debug, 0);
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_answers, 0);
  objc_storeStrong((id *)&self->_kgq, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
