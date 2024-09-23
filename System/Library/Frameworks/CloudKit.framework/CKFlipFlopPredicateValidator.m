@implementation CKFlipFlopPredicateValidator

- (CKFlipFlopPredicateValidator)initWithValidator:(id)a3
{
  id v3;
  CKFlipFlopPredicateValidator *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKFlipFlopPredicateValidator;
  v3 = a3;
  v4 = -[CKFlipFlopPredicateValidator init](&v8, sel_init);
  objc_msgSend_setValidator_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

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
  void *v12;
  char v13;
  id v14;
  id v15;
  BOOL v16;
  char v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  char v49;
  char v51;
  id v52;
  id v53;

  v6 = a3;
  objc_msgSend_validator(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (!a4)
  {
    v17 = objc_msgSend_validate_error_(v10, v11, (uint64_t)v6, 0);

    v14 = 0;
    if ((v17 & 1) != 0)
    {
      v16 = 1;
      v15 = 0;
      goto LABEL_24;
    }
LABEL_7:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = 0;
      if (!a4)
        goto LABEL_23;
      goto LABEL_14;
    }
    v18 = v6;
    v22 = objc_msgSend_predicateOperatorType(v18, v19, v20, v21);
    if (v22 > 5 || (v26 = qword_18A83D3A0[v22], objc_msgSend_comparisonPredicateModifier(v18, v23, v24, v25)))
    {
      v15 = 0;
      goto LABEL_11;
    }
    v28 = objc_alloc(MEMORY[0x1E0CB3518]);
    objc_msgSend_rightExpression(v18, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_leftExpression(v18, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_options(v18, v37, v38, v39);
    v42 = (void *)objc_msgSend_initWithLeftExpression_rightExpression_modifier_type_options_(v28, v41, (uint64_t)v32, (uint64_t)v36, 0, v26, v40);

    objc_msgSend_validator(self, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v46;
    if (a4)
    {
      v52 = 0;
      v49 = objc_msgSend_validate_error_(v46, v47, (uint64_t)v42, (uint64_t)&v52);
      v15 = v52;

      if ((v49 & 1) != 0)
        goto LABEL_26;
    }
    else
    {
      v51 = objc_msgSend_validate_error_(v46, v47, (uint64_t)v42, 0);

      v15 = 0;
      if ((v51 & 1) != 0)
      {
LABEL_26:

        goto LABEL_4;
      }
    }
LABEL_11:

    if (!a4)
      goto LABEL_23;
LABEL_14:
    if (v14)
    {
      v27 = objc_retainAutorelease(v14);
      v14 = v27;
LABEL_18:
      v16 = 0;
      *a4 = v27;
      goto LABEL_24;
    }
    if (v15)
    {
      v27 = objc_retainAutorelease(v15);
      v15 = v27;
      v14 = 0;
      goto LABEL_18;
    }
    v14 = 0;
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  v53 = 0;
  v13 = objc_msgSend_validate_error_(v10, v11, (uint64_t)v6, (uint64_t)&v53);
  v14 = v53;

  if ((v13 & 1) == 0)
    goto LABEL_7;
  v15 = 0;
LABEL_4:
  v16 = 1;
LABEL_24:

  return v16;
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
  objc_msgSend_validator(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("validator=%@"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CKObjectValidating)validator
{
  return self->_validator;
}

- (void)setValidator:(id)a3
{
  objc_storeStrong((id *)&self->_validator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
}

@end
