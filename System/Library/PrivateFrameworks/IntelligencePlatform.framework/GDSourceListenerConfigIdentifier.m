@implementation GDSourceListenerConfigIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_updateType, 0);
  objc_storeStrong((id *)&self->_sourceType, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *view;
  id v5;
  void *v6;
  const char *v7;
  NSString *sourceType;
  void *v9;
  const char *v10;
  uint64_t index;
  void *v12;
  const char *v13;
  NSString *updateType;
  void *v15;
  const char *v16;
  NSString *sourceIdentifier;
  const char *v18;
  id v19;

  view = self->_view;
  v5 = a3;
  NSStringFromSelector(sel_view);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)view, v6);

  sourceType = self->_sourceType;
  NSStringFromSelector(sel_sourceType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)sourceType, v9);

  index = self->_index;
  NSStringFromSelector(sel_index);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInt_forKey_(v5, v13, index, v12);

  updateType = self->_updateType;
  NSStringFromSelector(sel_updateType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)updateType, v15);

  sourceIdentifier = self->_sourceIdentifier;
  NSStringFromSelector(sel_sourceIdentifier);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)sourceIdentifier, v19);

}

- (GDSourceListenerConfigIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  GDSourceListenerConfigIdentifier *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  NSStringFromSelector(sel_view);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v5, v8, v6, v7, v4, 1, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend_error(v4, v10, v11), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    v14 = (void *)MEMORY[0x1E0D81610];
    v15 = objc_opt_class();
    NSStringFromSelector(sel_sourceType);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v14, v17, v15, v16, v4, 1, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_7;
    objc_msgSend_error(v4, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21
      || (NSStringFromSelector(sel_index),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend_decodeIntForKey_(v4, v23, (uint64_t)v22),
          v22,
          objc_msgSend_error(v4, v25, v26),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v27,
          v27))
    {
LABEL_7:
      v13 = 0;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0D81610];
      v30 = objc_opt_class();
      NSStringFromSelector(sel_updateType);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v29, v32, v30, v31, v4, 1, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33
        && (objc_msgSend_error(v4, v34, v35), v36 = (void *)objc_claimAutoreleasedReturnValue(), v36, !v36))
      {
        v37 = (void *)MEMORY[0x1E0D81610];
        v38 = objc_opt_class();
        NSStringFromSelector(sel_sourceIdentifier);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_robustDecodeObjectOfClass_forKey_withCoder_expectNonNull_errorDomain_errorCode_logHandle_(v37, v40, v38, v39, v4, 1, CFSTR("GDViewUpdateSourceKeyError"), 9, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41
          && (objc_msgSend_error(v4, v42, v43),
              v44 = (void *)objc_claimAutoreleasedReturnValue(),
              v44,
              !v44))
        {
          self = (GDSourceListenerConfigIdentifier *)(id)objc_msgSend_initWithView_sourceType_index_updateType_sourceIdentifier_(self, v45, (uint64_t)v9, v18, v24, v33, v41);
          v13 = self;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithFormat_(v3, v4, (uint64_t)CFSTR("<GDSourceListenerConfigIdentifier v: %@, s: %@, u: %@ idx: %tu, sId: \"%@\">"), self->_view, self->_sourceType, self->_updateType, self->_index, self->_sourceIdentifier);
}

- (NSString)sourceType
{
  return self->_sourceType;
}

- (int)index
{
  return self->_index;
}

- (NSString)view
{
  return self->_view;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (GDSourceListenerConfigIdentifier)initWithView:(id)a3 sourceType:(id)a4 index:(int)a5 updateType:(id)a6 sourceIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  GDSourceListenerConfigIdentifier *v18;
  uint64_t v19;
  NSString *view;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *sourceType;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *updateType;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSString *sourceIdentifier;
  objc_super v34;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v34.receiver = self;
  v34.super_class = (Class)GDSourceListenerConfigIdentifier;
  v18 = -[GDSourceListenerConfigIdentifier init](&v34, sel_init);
  if (v18)
  {
    v19 = objc_msgSend_copy(v12, v16, v17);
    view = v18->_view;
    v18->_view = (NSString *)v19;

    v23 = objc_msgSend_copy(v13, v21, v22);
    sourceType = v18->_sourceType;
    v18->_sourceType = (NSString *)v23;

    v18->_index = a5;
    v27 = objc_msgSend_copy(v14, v25, v26);
    updateType = v18->_updateType;
    v18->_updateType = (NSString *)v27;

    v31 = objc_msgSend_copy(v15, v29, v30);
    sourceIdentifier = v18->_sourceIdentifier;
    v18->_sourceIdentifier = (NSString *)v31;

  }
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  GDSourceListenerConfigIdentifier *v4;
  GDSourceListenerConfigIdentifier *v5;
  const char *v6;
  char isEqualToGDSourceListenerConfigIdentifier;

  v4 = (GDSourceListenerConfigIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToGDSourceListenerConfigIdentifier = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToGDSourceListenerConfigIdentifier = objc_msgSend_isEqualToGDSourceListenerConfigIdentifier_(self, v6, (uint64_t)v5);
  }
  else
  {
    isEqualToGDSourceListenerConfigIdentifier = 0;
  }

  return isEqualToGDSourceListenerConfigIdentifier;
}

- (BOOL)isEqualToGDSourceListenerConfigIdentifier:(id)a3
{
  id *v4;
  id *v5;
  NSString *view;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  const char *v10;
  char isEqual;
  NSString *sourceType;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  const char *v16;
  char v17;
  NSString *sourceIdentifier;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  const char *v22;
  char v23;
  NSString *updateType;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  const char *v28;
  char v29;
  const char *v30;
  uint64_t v31;
  BOOL v32;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_16;
  view = self->_view;
  v7 = (NSString *)v4[2];
  if (view == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = view;
    isEqual = objc_msgSend_isEqual_(v9, v10, (uint64_t)v8);

    if ((isEqual & 1) == 0)
      goto LABEL_16;
  }
  sourceType = self->_sourceType;
  v13 = (NSString *)v5[3];
  if (sourceType == v13)
  {

  }
  else
  {
    v14 = v13;
    v15 = sourceType;
    v17 = objc_msgSend_isEqual_(v15, v16, (uint64_t)v14);

    if ((v17 & 1) == 0)
      goto LABEL_16;
  }
  sourceIdentifier = self->_sourceIdentifier;
  v19 = (NSString *)v5[5];
  if (sourceIdentifier == v19)
  {

  }
  else
  {
    v20 = v19;
    v21 = sourceIdentifier;
    v23 = objc_msgSend_isEqual_(v21, v22, (uint64_t)v20);

    if ((v23 & 1) == 0)
      goto LABEL_16;
  }
  updateType = self->_updateType;
  v25 = (NSString *)v5[4];
  if (updateType == v25)
  {

    goto LABEL_19;
  }
  v26 = v25;
  v27 = updateType;
  v29 = objc_msgSend_isEqual_(v27, v28, (uint64_t)v26);

  if ((v29 & 1) != 0)
  {
LABEL_19:
    v32 = objc_msgSend_index(v5, v30, v31) == self->_index;
    goto LABEL_17;
  }
LABEL_16:
  v32 = 0;
LABEL_17:

  return v32;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = objc_msgSend_hash(self->_view, a2, v2);
  v7 = objc_msgSend_hash(self->_sourceType, v5, v6) - v4 + 32 * v4;
  v10 = objc_msgSend_hash(self->_sourceIdentifier, v8, v9) - v7 + 32 * v7;
  v13 = objc_msgSend_hash(self->_updateType, v11, v12);
  return self->_index - (v13 - v10 + 32 * v10) + 32 * (v13 - v10 + 32 * v10);
}

- (NSString)updateType
{
  return self->_updateType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
