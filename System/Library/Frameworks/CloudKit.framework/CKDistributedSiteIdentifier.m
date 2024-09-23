@implementation CKDistributedSiteIdentifier

+ (id)pSiteIdentifierFromSiteIdentifier:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_identifier(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_modifier(v3, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setModifier_(v4, v15, (uint64_t)v14, v16);
  return v4;
}

+ (id)siteIdentifierFromPSiteIdentifier:(id)a3
{
  id v3;
  CKDistributedSiteIdentifier *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = a3;
  v4 = [CKDistributedSiteIdentifier alloc];
  objc_msgSend_identifier(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifier(v3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend_initWithIdentifier_modifier_(v4, v13, (uint64_t)v8, (uint64_t)v12);
  return v14;
}

- (CKDistributedSiteIdentifier)initWithIdentifier:(id)a3
{
  return (CKDistributedSiteIdentifier *)objc_msgSend_initWithIdentifier_modifier_(self, a2, (uint64_t)a3, 0);
}

- (CKDistributedSiteIdentifier)initWithIdentifier:(id)a3 modifier:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKDistributedSiteIdentifier *v11;
  uint64_t v12;
  NSData *identifier;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSData *v19;
  NSData *modifier;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CKDistributedSiteIdentifier;
  v11 = -[CKDistributedSiteIdentifier init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    identifier = v11->_identifier;
    v11->_identifier = (NSData *)v12;

    v17 = (void *)objc_msgSend_copy(v7, v14, v15, v16);
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = (NSData *)objc_opt_new();
    modifier = v11->_modifier;
    v11->_modifier = v19;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDistributedSiteIdentifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  CKDistributedSiteIdentifier *v14;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  NSStringFromSelector(sel_modifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (CKDistributedSiteIdentifier *)objc_msgSend_initWithIdentifier_modifier_(self, v13, (uint64_t)v8, (uint64_t)v12);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_identifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)v8, (uint64_t)v9);

  objc_msgSend_modifier(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_modifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v14, (uint64_t)v15);

  objc_autoreleasePoolPop(v4);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  char isEqual;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v40;

  v5 = a3;
  objc_opt_class();
  if (((v5 != 0) & objc_opt_isKindOfClass()) != 0)
  {
    v6 = v5;
    objc_msgSend_identifier(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v6, v11, v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v17
      || (objc_msgSend_identifier(self, v14, v15, v16),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_identifier(v6, v18, v19, v20),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_isEqual_(v40, v21, (uint64_t)v3, v22)))
    {
      objc_msgSend_modifier(self, v14, v15, v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_modifier(v6, v25, v26, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 == v31)
      {

        isEqual = 1;
      }
      else
      {
        objc_msgSend_modifier(self, v28, v29, v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_modifier(v6, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v32, v37, (uint64_t)v36, v38);

      }
      if (v10 == v17)
        goto LABEL_11;
    }
    else
    {
      isEqual = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  isEqual = 0;
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  objc_msgSend_identifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_modifier(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

+ (id)SHADescription:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CC_LONG v21;
  const char *v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  unsigned __int8 md[20];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v3, v8, v9, v10))
  {
    v13 = objc_retainAutorelease(v3);
    v17 = (const void *)objc_msgSend_bytes(v13, v14, v15, v16);
    v21 = objc_msgSend_length(v13, v18, v19, v20);
    CC_SHA1(v17, v21, md);
    for (i = 0; i != 4; ++i)
      objc_msgSend_appendFormat_(v7, v22, (uint64_t)CFSTR("%02x"), v23, md[i]);
  }
  else
  {
    v25 = 4;
    do
    {
      objc_msgSend_appendFormat_(v7, v11, (uint64_t)CFSTR("%02x"), v12, 0);
      --v25;
    }
    while (v25);
  }

  return v7;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;

  v3 = (void *)objc_opt_class();
  objc_msgSend_identifier(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SHADescription_(v3, v8, (uint64_t)v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_mutableCopy(v10, v11, v12, v13);

  objc_msgSend_modifier(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_length(v18, v19, v20, v21);

  if (v22)
  {
    v23 = (void *)objc_opt_class();
    objc_msgSend_modifier(self, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SHADescription_(v23, v28, (uint64_t)v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v14, v31, (uint64_t)CFSTR("(%@)"), v32, v30);

  }
  return v14;
}

- (id)descriptionWithStringSiteIdentifiers
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_identifier(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_initWithData_encoding_(v3, v8, (uint64_t)v7, 4);
  v13 = v9;
  if (v9)
  {
    v14 = v9;
  }
  else
  {
    objc_msgSend_identifier(self, v10, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v15, v16, v17, v18);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  v22 = (void *)objc_msgSend_mutableCopy(v14, v19, v20, v21);
  objc_msgSend_modifier(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_length(v26, v27, v28, v29);

  if (v30)
  {
    v31 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_modifier(self, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend_initWithData_encoding_(v31, v36, (uint64_t)v35, 4);
    v41 = v37;
    if (v37)
    {
      v42 = v37;
    }
    else
    {
      objc_msgSend_modifier(self, v38, v39, v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v43, v44, v45, v46);
      v42 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_appendFormat_(v22, v47, (uint64_t)CFSTR("(%@)"), v48, v42);

  }
  return v22;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (NSData)modifier
{
  return self->_modifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
