@implementation CKRoughlyEquivalentProperties

- (CKRoughlyEquivalentProperties)initWithDictionary:(id)a3
{
  id v5;
  CKRoughlyEquivalentProperties *v6;
  CKRoughlyEquivalentProperties *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKRoughlyEquivalentProperties;
  v6 = -[CKRoughlyEquivalentProperties init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionary, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;

  v4 = a3;
  objc_msgSend_dictionary(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v10, (uint64_t)v8);

}

- (CKRoughlyEquivalentProperties)initWithCoder:(id)a3
{
  id v4;
  CKRoughlyEquivalentProperties *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSDictionary *dictionary;
  objc_super v16;
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKRoughlyEquivalentProperties;
  v5 = -[CKRoughlyEquivalentProperties init](&v16, sel_init);
  if (v5)
  {
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    v17[5] = objc_opt_class();
    v17[6] = objc_opt_class();
    v17[7] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v17, 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v8, (uint64_t)v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_dictionary);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v10, (uint64_t)v11);
    v13 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v13;

  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_dictionary(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CKRoughlyEquivalentProperties *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  CKRoughlyEquivalentProperties *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char isEqual;

  v4 = (CKRoughlyEquivalentProperties *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    {
      v8 = v4;
      objc_msgSend_dictionary(self, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionary(v8, v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      isEqual = objc_msgSend_isEqual_(v12, v17, (uint64_t)v16, v18);
    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
