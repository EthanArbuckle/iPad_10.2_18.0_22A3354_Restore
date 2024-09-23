@implementation GDKnosisRequest

- (GDKnosisRequest)initWithKGQ:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  GDKnosisRequest *v16;
  uint64_t v17;
  NSString *query;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *kgq;
  NSArray *intentArgs;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSNumber *limit;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSNumber *offset;
  objc_super v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)GDKnosisRequest;
  v16 = -[GDKnosisRequest init](&v33, sel_init);
  if (v16)
  {
    v17 = objc_msgSend_copy(v11, v14, v15);
    query = v16->_query;
    v16->_query = (NSString *)v17;

    v21 = objc_msgSend_copy(v10, v19, v20);
    kgq = v16->_kgq;
    v16->_kgq = (NSString *)v21;

    intentArgs = v16->_intentArgs;
    v16->_intentArgs = 0;

    v26 = objc_msgSend_copy(v12, v24, v25);
    limit = v16->_limit;
    v16->_limit = (NSNumber *)v26;

    v30 = objc_msgSend_copy(v13, v28, v29);
    offset = v16->_offset;
    v16->_offset = (NSNumber *)v30;

    *(_WORD *)&v16->_enableDebug = 0;
  }

  return v16;
}

- (GDKnosisRequest)initWithKGQ:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6 enableDebug:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  GDKnosisRequest *v18;
  uint64_t v19;
  NSString *query;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *kgq;
  NSArray *intentArgs;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSNumber *limit;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSNumber *offset;
  objc_super v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v35.receiver = self;
  v35.super_class = (Class)GDKnosisRequest;
  v18 = -[GDKnosisRequest init](&v35, sel_init);
  if (v18)
  {
    v19 = objc_msgSend_copy(v13, v16, v17);
    query = v18->_query;
    v18->_query = (NSString *)v19;

    v23 = objc_msgSend_copy(v12, v21, v22);
    kgq = v18->_kgq;
    v18->_kgq = (NSString *)v23;

    intentArgs = v18->_intentArgs;
    v18->_intentArgs = 0;

    v28 = objc_msgSend_copy(v14, v26, v27);
    limit = v18->_limit;
    v18->_limit = (NSNumber *)v28;

    v32 = objc_msgSend_copy(v15, v30, v31);
    offset = v18->_offset;
    v18->_offset = (NSNumber *)v32;

    v18->_enableDebug = a7;
    v18->_enableTextualization = 0;
  }

  return v18;
}

- (GDKnosisRequest)initWithKGQ:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6 enableDebug:(BOOL)a7 enableTextualization:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  GDKnosisRequest *v20;
  uint64_t v21;
  NSString *query;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSString *kgq;
  NSArray *intentArgs;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSNumber *limit;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSNumber *offset;
  objc_super v37;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v37.receiver = self;
  v37.super_class = (Class)GDKnosisRequest;
  v20 = -[GDKnosisRequest init](&v37, sel_init);
  if (v20)
  {
    v21 = objc_msgSend_copy(v15, v18, v19);
    query = v20->_query;
    v20->_query = (NSString *)v21;

    v25 = objc_msgSend_copy(v14, v23, v24);
    kgq = v20->_kgq;
    v20->_kgq = (NSString *)v25;

    intentArgs = v20->_intentArgs;
    v20->_intentArgs = 0;

    v30 = objc_msgSend_copy(v16, v28, v29);
    limit = v20->_limit;
    v20->_limit = (NSNumber *)v30;

    v34 = objc_msgSend_copy(v17, v32, v33);
    offset = v20->_offset;
    v20->_offset = (NSNumber *)v34;

    v20->_enableDebug = a7;
    v20->_enableTextualization = a8;
  }

  return v20;
}

- (GDKnosisRequest)initWithIntents:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  GDKnosisRequest *v17;
  uint64_t v18;
  NSString *query;
  NSString *kgq;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSNumber *limit;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSNumber *offset;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)GDKnosisRequest;
  v17 = -[GDKnosisRequest init](&v30, sel_init);
  if (v17)
  {
    v18 = objc_msgSend_copy(v12, v15, v16);
    query = v17->_query;
    v17->_query = (NSString *)v18;

    kgq = v17->_kgq;
    v17->_kgq = 0;

    objc_storeStrong((id *)&v17->_intentArgs, a3);
    v23 = objc_msgSend_copy(v13, v21, v22);
    limit = v17->_limit;
    v17->_limit = (NSNumber *)v23;

    v27 = objc_msgSend_copy(v14, v25, v26);
    offset = v17->_offset;
    v17->_offset = (NSNumber *)v27;

    *(_WORD *)&v17->_enableDebug = 0;
  }

  return v17;
}

- (GDKnosisRequest)initWithIntents:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6 enableDebug:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  GDKnosisRequest *v19;
  uint64_t v20;
  NSString *query;
  NSString *kgq;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSNumber *limit;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSNumber *offset;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v32.receiver = self;
  v32.super_class = (Class)GDKnosisRequest;
  v19 = -[GDKnosisRequest init](&v32, sel_init);
  if (v19)
  {
    v20 = objc_msgSend_copy(v14, v17, v18);
    query = v19->_query;
    v19->_query = (NSString *)v20;

    kgq = v19->_kgq;
    v19->_kgq = 0;

    objc_storeStrong((id *)&v19->_intentArgs, a3);
    v25 = objc_msgSend_copy(v15, v23, v24);
    limit = v19->_limit;
    v19->_limit = (NSNumber *)v25;

    v29 = objc_msgSend_copy(v16, v27, v28);
    offset = v19->_offset;
    v19->_offset = (NSNumber *)v29;

    v19->_enableDebug = a7;
    v19->_enableTextualization = 0;
  }

  return v19;
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
  NSArray *intentArgs;
  void *v12;
  const char *v13;
  NSNumber *limit;
  void *v15;
  const char *v16;
  NSNumber *offset;
  void *v18;
  const char *v19;
  _BOOL8 enableDebug;
  void *v21;
  const char *v22;
  _BOOL8 enableTextualization;
  const char *v24;
  id v25;

  query = self->_query;
  v5 = a3;
  NSStringFromSelector(sel_query);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)query, v6);

  kgq = self->_kgq;
  NSStringFromSelector("kgq");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)kgq, v9);

  intentArgs = self->_intentArgs;
  NSStringFromSelector(sel_intentArgs);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)intentArgs, v12);

  limit = self->_limit;
  NSStringFromSelector(sel_limit);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)limit, v15);

  offset = self->_offset;
  NSStringFromSelector(sel_offset);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)offset, v18);

  enableDebug = self->_enableDebug;
  NSStringFromSelector(sel_enableDebug);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v22, enableDebug, v21);

  enableTextualization = self->_enableTextualization;
  NSStringFromSelector(sel_enableTextualization);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v24, enableTextualization, v25);

}

- (GDKnosisRequest)initWithCoder:(id)a3
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
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *limit_offset_enableDebug;
  void *v53;
  const char *v54;
  GDKnosisRequest *v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  const char *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  const char *v73;
  void *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  const __CFString *v84;
  uint64_t v85;
  _QWORD v86[2];

  v86[1] = *MEMORY[0x1E0C80C00];
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
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        v14 = 0;
        v55 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v17, v20, v18, v19, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_intentArgs);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v23, (uint64_t)v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      goto LABEL_4;
    objc_msgSend_error(v4, v25, v26);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v57)
    {
      if (!v14)
      {
        v71 = (void *)MEMORY[0x1E0CB35C8];
        v83 = *MEMORY[0x1E0CB2D50];
        v84 = CFSTR("GDKnosisRequest either kgq or intentArgs is required");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v58, (uint64_t)&v84, &v83, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v71, v72, (uint64_t)CFSTR("GDErrorDomain"), 9, v30);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_failWithError_(v4, v73, (uint64_t)v36);
        goto LABEL_26;
      }
LABEL_4:
      v27 = objc_opt_class();
      NSStringFromSelector(sel_limit);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v33 = objc_opt_class();
        NSStringFromSelector(sel_offset);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v33, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          NSStringFromSelector(sel_enableDebug);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend_decodeBoolForKey_(v4, v40, (uint64_t)v39);

          objc_msgSend_error(v4, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v44)
          {
            NSStringFromSelector(sel_enableTextualization);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend_decodeBoolForKey_(v4, v46, (uint64_t)v45);

            objc_msgSend_error(v4, v48, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v50)
            {
              if (v24)
                limit_offset_enableDebug = (void *)objc_msgSend_initWithIntents_query_limit_offset_enableDebug_(self, v51, (uint64_t)v24, v8, v30, v36, v41);
              else
                limit_offset_enableDebug = (void *)objc_msgSend_initWithKGQ_query_limit_offset_enableDebug_enableTextualization_(self, v51, (uint64_t)v14, v8, v30, v36, v41, v47);
              self = limit_offset_enableDebug;
              v55 = self;
              goto LABEL_27;
            }
          }
        }
        else
        {
          objc_msgSend_error(v4, v37, v38);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v64)
          {
            v66 = (void *)MEMORY[0x1E0CB35C8];
            v79 = *MEMORY[0x1E0CB2D50];
            v80 = CFSTR("GDKnosisRequest offset is nil");
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v65, (uint64_t)&v80, &v79, 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v66, v68, (uint64_t)CFSTR("GDErrorDomain"), 9, v67);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_failWithError_(v4, v70, (uint64_t)v69);

          }
          v36 = 0;
        }
      }
      else
      {
        objc_msgSend_error(v4, v31, v32);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
        {
          v30 = 0;
          v55 = 0;
LABEL_28:

          goto LABEL_29;
        }
        v74 = (void *)MEMORY[0x1E0CB35C8];
        v81 = *MEMORY[0x1E0CB2D50];
        v82 = CFSTR("GDKnosisRequest limit is nil");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v63, (uint64_t)&v82, &v81, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v74, v75, (uint64_t)CFSTR("GDErrorDomain"), 9, v36);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_failWithError_(v4, v77, (uint64_t)v76);

        v30 = 0;
      }
LABEL_26:
      v55 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v24 = 0;
LABEL_17:
    v55 = 0;
LABEL_29:

    goto LABEL_30;
  }
  objc_msgSend_error(v4, v9, v10);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v53)
  {
    v59 = (void *)MEMORY[0x1E0CB35C8];
    v85 = *MEMORY[0x1E0CB2D50];
    v86[0] = CFSTR("GDKnosisRequest query is nil");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v54, (uint64_t)v86, &v85, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v59, v60, (uint64_t)CFSTR("GDErrorDomain"), 9, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v61, (uint64_t)v24);
    goto LABEL_17;
  }
  v55 = 0;
LABEL_31:

  return v55;
}

- (NSString)query
{
  return self->_query;
}

- (NSString)kgq
{
  return self->_kgq;
}

- (NSArray)intentArgs
{
  return self->_intentArgs;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (NSNumber)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)enableDebug
{
  return self->_enableDebug;
}

- (BOOL)enableTextualization
{
  return self->_enableTextualization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_intentArgs, 0);
  objc_storeStrong((id *)&self->_kgq, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
