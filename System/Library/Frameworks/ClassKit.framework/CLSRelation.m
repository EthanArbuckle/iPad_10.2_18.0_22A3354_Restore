@implementation CLSRelation

- (CLSRelation)initWithFromEntity:(Class)a3 toEntity:(Class)a4 onFromKey:(id)a5 toKey:(id)a6 faultable:(BOOL)a7
{
  id v13;
  id v14;
  CLSRelation *v15;
  CLSRelation *v16;
  objc_super v18;

  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CLSRelation;
  v15 = -[CLSRelation init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromEntity, a3);
    objc_storeStrong((id *)&v16->_toEntity, a4);
    objc_storeStrong((id *)&v16->_fromKey, a5);
    objc_storeStrong((id *)&v16->_toKey, a6);
    v16->_faultable = a7;
  }

  return v16;
}

- (BOOL)isInverseOfRelation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  BOOL v20;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  char v35;
  char isEqualToString;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v7 = a3;
  v10 = objc_msgSend_fromEntity(self, v8, v9);
  if (v10 == objc_msgSend_toEntity(v7, v11, v12))
  {
    v15 = objc_msgSend_toEntity(self, v13, v14);
    if (v15 == objc_msgSend_fromEntity(v7, v16, v17))
    {
      objc_msgSend_fromKey(self, v18, v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 || (objc_msgSend_toKey(v7, v22, v23), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend_fromKey(self, v22, v23);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          isEqualToString = 0;
          goto LABEL_26;
        }
        v3 = (void *)v25;
        objc_msgSend_toKey(v7, v26, v27);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          objc_msgSend_fromKey(self, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_toKey(v7, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v30, v34, (uint64_t)v33) & 1) != 0)
          {
            v56 = v33;
            v57 = v30;
            v35 = 1;
LABEL_16:
            objc_msgSend_toKey(self, v22, v23);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v39)
            {
              objc_msgSend_fromKey(v7, v37, v38);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v55)
              {
                v55 = 0;
                isEqualToString = 1;
                goto LABEL_30;
              }
            }
            objc_msgSend_toKey(self, v37, v38);
            v40 = objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              v43 = (void *)v40;
              objc_msgSend_fromKey(v7, v41, v42);
              v44 = objc_claimAutoreleasedReturnValue();
              if (v44)
              {
                v47 = (void *)v44;
                objc_msgSend_toKey(self, v45, v46);
                v54 = v5;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_fromKey(v7, v49, v50);
                v53 = v35;
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                isEqualToString = objc_msgSend_isEqualToString_(v48, v52, (uint64_t)v51);

                v35 = v53;
                v5 = v54;

                if (!v39)
                {
LABEL_30:

                  if ((v35 & 1) == 0)
                  {
LABEL_26:
                    v20 = isEqualToString;
                    if (!v24)
                    {
LABEL_27:

                      v20 = isEqualToString;
                    }
LABEL_28:

                    goto LABEL_4;
                  }
LABEL_25:

                  goto LABEL_26;
                }
LABEL_24:

                if ((v35 & 1) == 0)
                  goto LABEL_26;
                goto LABEL_25;
              }

            }
            isEqualToString = 0;
            if (!v39)
              goto LABEL_30;
            goto LABEL_24;
          }

        }
        isEqualToString = 0;
        v20 = 0;
        if (!v24)
          goto LABEL_27;
        goto LABEL_28;
      }
      v35 = 0;
      goto LABEL_16;
    }
  }
  v20 = 0;
LABEL_4:

  return v20;
}

- (BOOL)isEquivalentToRelation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  BOOL v20;
  const char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  char v35;
  char isEqualToString;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v7 = a3;
  v10 = objc_msgSend_fromEntity(self, v8, v9);
  if (v10 == objc_msgSend_fromEntity(v7, v11, v12))
  {
    v15 = objc_msgSend_toEntity(self, v13, v14);
    if (v15 == objc_msgSend_toEntity(v7, v16, v17))
    {
      objc_msgSend_fromKey(self, v18, v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 || (objc_msgSend_fromKey(v7, v22, v23), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend_fromKey(self, v22, v23);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          isEqualToString = 0;
          goto LABEL_26;
        }
        v3 = (void *)v25;
        objc_msgSend_fromKey(v7, v26, v27);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          objc_msgSend_fromKey(self, v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_fromKey(v7, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToString_(v30, v34, (uint64_t)v33) & 1) != 0)
          {
            v56 = v33;
            v57 = v30;
            v35 = 1;
LABEL_16:
            objc_msgSend_toKey(self, v22, v23);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v39)
            {
              objc_msgSend_toKey(v7, v37, v38);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v55)
              {
                v55 = 0;
                isEqualToString = 1;
                goto LABEL_30;
              }
            }
            objc_msgSend_toKey(self, v37, v38);
            v40 = objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              v43 = (void *)v40;
              objc_msgSend_toKey(v7, v41, v42);
              v44 = objc_claimAutoreleasedReturnValue();
              if (v44)
              {
                v47 = (void *)v44;
                objc_msgSend_toKey(self, v45, v46);
                v54 = v5;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_toKey(v7, v49, v50);
                v53 = v35;
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                isEqualToString = objc_msgSend_isEqualToString_(v48, v52, (uint64_t)v51);

                v35 = v53;
                v5 = v54;

                if (!v39)
                {
LABEL_30:

                  if ((v35 & 1) == 0)
                  {
LABEL_26:
                    v20 = isEqualToString;
                    if (!v24)
                    {
LABEL_27:

                      v20 = isEqualToString;
                    }
LABEL_28:

                    goto LABEL_4;
                  }
LABEL_25:

                  goto LABEL_26;
                }
LABEL_24:

                if ((v35 & 1) == 0)
                  goto LABEL_26;
                goto LABEL_25;
              }

            }
            isEqualToString = 0;
            if (!v39)
              goto LABEL_30;
            goto LABEL_24;
          }

        }
        isEqualToString = 0;
        v20 = 0;
        if (!v24)
          goto LABEL_27;
        goto LABEL_28;
      }
      v35 = 0;
      goto LABEL_16;
    }
  }
  v20 = 0;
LABEL_4:

  return v20;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CLSRelation;
  -[CLSRelation description](&v27, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendString_(v6, v7, (uint64_t)CFSTR("(fromEntity: "));
  v10 = (objc_class *)objc_msgSend_fromEntity(self, v8, v9);
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v12, (uint64_t)v11);

  objc_msgSend_appendString_(v6, v13, (uint64_t)CFSTR(") (toEntity: "));
  v16 = (objc_class *)objc_msgSend_toEntity(self, v14, v15);
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v18, (uint64_t)v17);

  objc_msgSend_fromKey(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_toKey(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v25, (uint64_t)CFSTR(") (on: fromEntity.%@ == toEntity.%@)"), v21, v24);

  return v6;
}

- (Class)fromEntity
{
  return self->_fromEntity;
}

- (NSString)fromKey
{
  return self->_fromKey;
}

- (Class)toEntity
{
  return self->_toEntity;
}

- (NSString)toKey
{
  return self->_toKey;
}

- (BOOL)isFaultable
{
  return self->_faultable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toKey, 0);
  objc_storeStrong((id *)&self->_toEntity, 0);
  objc_storeStrong((id *)&self->_fromKey, 0);
  objc_storeStrong((id *)&self->_fromEntity, 0);
}

@end
