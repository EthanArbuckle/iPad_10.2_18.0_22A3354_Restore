@implementation IDSPseudonym

- (IDSPseudonym)initWithURI:(id)a3 maskedURI:(id)a4 properties:(id)a5
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  double v15;
  IDSPseudonym *v16;
  IDSPseudonym *v17;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v14 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, v24, self, CFSTR("IDSPseudonym.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maskedURI"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, v21, self, CFSTR("IDSPseudonym.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URI"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13, v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, v27, self, CFSTR("IDSPseudonym.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("properties"));

LABEL_4:
  v28.receiver = self;
  v28.super_class = (Class)IDSPseudonym;
  v16 = -[IDSPseudonym init](&v28, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_URI, a3);
    objc_storeStrong((id *)&v17->_maskedURI, a4);
    objc_storeStrong((id *)&v17->_properties, a5);
  }

  return v17;
}

- (id)withUpdatedProperties:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  v8 = (void *)objc_msgSend_initWithURI_maskedURI_properties_(v5, v6, (uint64_t)self->_URI, v7, self->_maskedURI, v4);

  return v8;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p URI:%@, maskedURI:%@, properties: %@>"), *(double *)&self->_URI, v5, self, self->_URI, self->_maskedURI, self->_properties);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToPseudonym;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToPseudonym = objc_msgSend_isEqualToPseudonym_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToPseudonym = 0;

  return isEqualToPseudonym;
}

- (BOOL)isEqualToPseudonym:(id)a3
{
  const char *v4;
  uint64_t v5;
  IDSPseudonym *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  char isEqualToURI;

  v6 = (IDSPseudonym *)a3;
  if (self == v6)
  {
    isEqualToURI = 1;
  }
  else
  {
    objc_msgSend_URI(self, v4, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URI(v6, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToURI_(v8, v13, (uint64_t)v12, v14))
    {
      objc_msgSend_properties(self, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_properties(v6, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToPseudonymProperties_(v18, v23, (uint64_t)v22, v24))
      {
        objc_msgSend_maskedURI(self, v25, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_maskedURI(v6, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToURI = objc_msgSend_isEqualToURI_(v28, v33, (uint64_t)v32, v34);

      }
      else
      {
        isEqualToURI = 0;
      }

    }
    else
    {
      isEqualToURI = 0;
    }

  }
  return isEqualToURI;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  unint64_t v17;

  objc_msgSend_URI(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_properties(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (id)destinationURIs
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_URI(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_destinationURIs(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPseudonym)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  IDSPseudonymProperties *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  IDSPseudonym *v26;

  v4 = a3;
  objc_msgSend__stringForKey_(v4, v5, (uint64_t)CFSTR("u"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URIWithPrefixedURI_(IDSURI, v8, (uint64_t)v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__stringForKey_(v4, v11, (uint64_t)CFSTR("m"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URIWithPrefixedURI_(IDSURI, v14, (uint64_t)v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [IDSPseudonymProperties alloc];
  objc_msgSend__dictionaryForKey_(v4, v18, (uint64_t)CFSTR("p"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend_initWithDictionaryRepresentation_(v17, v21, (uint64_t)v20, v22);
  v26 = 0;
  if (v10 && v16 && v23)
  {
    self = (IDSPseudonym *)(id)objc_msgSend_initWithURI_maskedURI_properties_(self, v24, (uint64_t)v10, v25, v16, v23);
    v26 = self;
  }

  return v26;
}

- (IDSPseudonym)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  double v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  BOOL v19;
  IDSPseudonym *v21;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("u"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, CFSTR("m"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, v15, CFSTR("p"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v19 = v12 == 0;
  else
    v19 = 1;
  if (v19 || v16 == 0)
  {
    v21 = 0;
  }
  else
  {
    self = (IDSPseudonym *)(id)objc_msgSend_initWithURI_maskedURI_properties_(self, v17, (uint64_t)v8, v18, v12, v16);
    v21 = self;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  IDSURI *URI;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  id v11;

  URI = self->_URI;
  v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)URI, v6, CFSTR("u"));
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->_maskedURI, v8, CFSTR("m"));
  objc_msgSend_encodeObject_forKey_(v11, v9, (uint64_t)self->_properties, v10, CFSTR("p"));

}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_prefixedURI(self->_URI, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CFDictionarySetValue(v3, CFSTR("u"), v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAFA6D8();
  }

  objc_msgSend_prefixedURI(self->_maskedURI, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CFDictionarySetValue(v3, CFSTR("m"), v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAFA658();
  }

  objc_msgSend_dictionaryRepresentation(self->_properties, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    CFDictionarySetValue(v3, CFSTR("p"), v15);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAFA558();
  }

  v19 = (void *)objc_msgSend_copy(v3, v16, v17, v18);
  return (NSDictionary *)v19;
}

- (IDSURI)URI
{
  return self->_URI;
}

- (IDSURI)maskedURI
{
  return self->_maskedURI;
}

- (IDSPseudonymProperties)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_maskedURI, 0);
  objc_storeStrong((id *)&self->_URI, 0);
}

@end
