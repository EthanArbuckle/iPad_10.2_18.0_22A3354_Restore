@implementation CKDeclarativePredicateValidator

- (CKDeclarativePredicateValidator)init
{
  CKDeclarativePredicateValidator *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  CKObjectValidating *validator;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)CKDeclarativePredicateValidator;
  v2 = -[CKDeclarativePredicateValidator init](&v46, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_class();
    sub_18A79E908(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A79DDAC();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A79DE1C();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_class();
    sub_18A79DEA8(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A79DC44(v6, v9, v10, v11, v12, v13, v14, v15, v8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A79DB20(v5, v17, v18, v19, v20, v21, v22, v23, v16, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    sub_18A7D7F30();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A79DE8C();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A79DB20(v24, v27, v28, v29, v30, v31, v32, v33, v25, (uint64_t)v26);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A79DC44(v4, v35, v36, v37, v38, v39, v40, v41, v34, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    sub_18A79DD68(v42);
    v43 = objc_claimAutoreleasedReturnValue();
    validator = v2->_validator;
    v2->_validator = (CKObjectValidating *)v43;

  }
  return v2;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  char v9;

  v6 = a3;
  v9 = objc_msgSend_validate_error_(self->_validator, v7, (uint64_t)v6, 0);
  if ((v9 & 1) == 0)
    objc_msgSend_validate_error_(self->_validator, v8, (uint64_t)v6, (uint64_t)a4);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
}

@end
