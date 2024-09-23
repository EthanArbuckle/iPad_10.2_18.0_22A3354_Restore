@implementation GDKnosisAnswer

- (GDKnosisAnswer)initWithAnswerId:(id)a3 name:(id)a4 textualization:(id)a5 facts:(id)a6 parents:(id)a7 requestIds:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  GDKnosisAnswer *v22;
  uint64_t v23;
  NSString *answerId;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *name;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSString *textualization;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *facts;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSArray *parents;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSArray *requestIds;
  objc_super v46;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v46.receiver = self;
  v46.super_class = (Class)GDKnosisAnswer;
  v22 = -[GDKnosisAnswer init](&v46, sel_init);
  if (v22)
  {
    v23 = objc_msgSend_copy(v14, v20, v21);
    answerId = v22->_answerId;
    v22->_answerId = (NSString *)v23;

    v27 = objc_msgSend_copy(v15, v25, v26);
    name = v22->_name;
    v22->_name = (NSString *)v27;

    v31 = objc_msgSend_copy(v16, v29, v30);
    textualization = v22->_textualization;
    v22->_textualization = (NSString *)v31;

    v35 = objc_msgSend_copy(v17, v33, v34);
    facts = v22->_facts;
    v22->_facts = (NSArray *)v35;

    v39 = objc_msgSend_copy(v18, v37, v38);
    parents = v22->_parents;
    v22->_parents = (NSArray *)v39;

    v43 = objc_msgSend_copy(v19, v41, v42);
    requestIds = v22->_requestIds;
    v22->_requestIds = (NSArray *)v43;

  }
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *answerId;
  id v5;
  void *v6;
  const char *v7;
  NSString *name;
  void *v9;
  const char *v10;
  NSString *textualization;
  void *v12;
  const char *v13;
  NSArray *facts;
  void *v15;
  const char *v16;
  NSArray *parents;
  void *v18;
  const char *v19;
  NSArray *requestIds;
  const char *v21;
  id v22;

  answerId = self->_answerId;
  v5 = a3;
  NSStringFromSelector(sel_answerId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)answerId, v6);

  name = self->_name;
  NSStringFromSelector(sel_name);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)name, v9);

  textualization = self->_textualization;
  NSStringFromSelector(sel_textualization);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)textualization, v12);

  facts = self->_facts;
  NSStringFromSelector(sel_facts);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)facts, v15);

  parents = self->_parents;
  NSStringFromSelector(sel_parents);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)parents, v18);

  requestIds = self->_requestIds;
  NSStringFromSelector(sel_requestIds);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v21, (uint64_t)requestIds, v22);

}

- (GDKnosisAnswer)initWithCoder:(id)a3
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
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  GDKnosisAnswer *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  void *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  const char *v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v76;
  const __CFString *v77;
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  _QWORD v81[2];

  v81[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_answerId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    || (objc_msgSend_error(v4, v9, v10), v54 = (void *)objc_claimAutoreleasedReturnValue(), v54, !v54))
  {
    v11 = objc_opt_class();
    NSStringFromSelector(sel_name);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend_error(v4, v15, v16);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        v53 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    v17 = objc_opt_class();
    NSStringFromSelector(sel_textualization);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend_error(v4, v21, v22);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        v53 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend_setWithObjects_(v23, v26, v24, v25, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_facts);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v33 = (void *)MEMORY[0x1E0C99E60];
      v34 = objc_opt_class();
      v35 = objc_opt_class();
      objc_msgSend_setWithObjects_(v33, v36, v34, v35, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_parents);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClasses_forKey_(v4, v39, (uint64_t)v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v43 = (void *)MEMORY[0x1E0C99E60];
        v44 = objc_opt_class();
        v45 = objc_opt_class();
        objc_msgSend_setWithObjects_(v43, v46, v44, v45, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_requestIds);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_decodeObjectOfClasses_forKey_(v4, v49, (uint64_t)v47, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (v50)
        {
          self = (GDKnosisAnswer *)(id)objc_msgSend_initWithAnswerId_name_textualization_facts_parents_requestIds_(self, v51, (uint64_t)v8, v14, v20, v30, v40, v50);
          v53 = self;
        }
        else
        {
          objc_msgSend_error(v4, v51, v52);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v61)
          {
            v63 = (void *)MEMORY[0x1E0CB35C8];
            v76 = *MEMORY[0x1E0CB2D50];
            v77 = CFSTR("GDKnosisAnswer requestIds is nil");
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v62, (uint64_t)&v77, &v76, 1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v63, v65, (uint64_t)CFSTR("GDErrorDomain"), 9, v64);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_failWithError_(v4, v67, (uint64_t)v66);

          }
          v50 = 0;
          v53 = 0;
        }
        goto LABEL_24;
      }
      objc_msgSend_error(v4, v41, v42);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        v40 = 0;
        v53 = 0;
LABEL_25:

        goto LABEL_26;
      }
      v71 = (void *)MEMORY[0x1E0CB35C8];
      v78 = *MEMORY[0x1E0CB2D50];
      v79 = CFSTR("GDKnosisAnswer parents is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v60, (uint64_t)&v79, &v78, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v71, v72, (uint64_t)CFSTR("GDErrorDomain"), 9, v50);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v74, (uint64_t)v73);

      v40 = 0;
    }
    else
    {
      objc_msgSend_error(v4, v31, v32);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        v53 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v68 = (void *)MEMORY[0x1E0CB35C8];
      v80 = *MEMORY[0x1E0CB2D50];
      v81[0] = CFSTR("GDKnosisAnswer facts is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v58, (uint64_t)v81, &v80, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v68, v69, (uint64_t)CFSTR("GDErrorDomain"), 9, v40);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v70, (uint64_t)v50);
    }
    v53 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v53 = 0;
LABEL_29:

  return v53;
}

- (NSString)answerId
{
  return self->_answerId;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)textualization
{
  return self->_textualization;
}

- (NSArray)facts
{
  return self->_facts;
}

- (NSArray)parents
{
  return self->_parents;
}

- (NSArray)requestIds
{
  return self->_requestIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIds, 0);
  objc_storeStrong((id *)&self->_parents, 0);
  objc_storeStrong((id *)&self->_facts, 0);
  objc_storeStrong((id *)&self->_textualization, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_answerId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
