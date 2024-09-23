@implementation CKPCSKeysToRemove

- (id)initInternal
{
  CKPCSKeysToRemove *v2;
  uint64_t v3;
  NSString *etag;
  uint64_t v5;
  NSArray *keys;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKPCSKeysToRemove;
  v2 = -[CKPCSKeysToRemove init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    etag = v2->_etag;
    v2->_etag = (NSString *)v3;

    v5 = objc_opt_new();
    keys = v2->_keys;
    v2->_keys = (NSArray *)v5;

  }
  return v2;
}

- (CKPCSKeysToRemove)initWithEtag:(id)a3 keys:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKPCSKeysToRemove *v11;
  uint64_t v12;
  NSString *etag;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *keys;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKPCSKeysToRemove;
  v11 = -[CKPCSKeysToRemove init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    etag = v11->_etag;
    v11->_etag = (NSString *)v12;

    objc_msgSend_CKDeepCopy(v7, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    keys = v11->_keys;
    v11->_keys = (NSArray *)v17;

  }
  return v11;
}

- (BOOL)isEmpty
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  objc_msgSend_keys(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v4, v5, v6, v7) == 0;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  int isEqualToString;
  id v19;
  const char *v20;
  void *v21;
  id v22;
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
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  char isEqual;
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && (objc_msgSend_etag(self, v8, v9, v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_etag(v4, v12, v13, v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        isEqualToString = objc_msgSend_isEqualToString_(v11, v16, (uint64_t)v15, v17),
        v15,
        v11,
        isEqualToString))
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3928]);
    v21 = (void *)objc_msgSend_initWithKey_ascending_comparator_(v19, v20, (uint64_t)CFSTR("pcsKeyID"), 1, &unk_1E1F589D8);
    v22 = objc_alloc(MEMORY[0x1E0CB3928]);
    v24 = (void *)objc_msgSend_initWithKey_ascending_(v22, v23, (uint64_t)CFSTR("keyType"), 1);
    objc_msgSend_keys(self, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v21;
    v48[1] = v24;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v29, (uint64_t)v48, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingDescriptors_(v28, v31, (uint64_t)v30, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_keys(v4, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v21;
    v47[1] = v24;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v38, (uint64_t)v47, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingDescriptors_(v37, v40, (uint64_t)v39, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    isEqual = objc_msgSend_isEqual_(v33, v43, (uint64_t)v42, v44);
  }
  else
  {
    isEqual = 0;
  }

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

  objc_msgSend_etag(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_keys(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
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
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKPCSKeysToRemove;
  -[CKPCSKeysToRemove description](&v24, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_etag(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keys(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v20, (uint64_t)CFSTR(": etag:%@ keys:%@"), v21, v11, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_etag(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setEtag_(v4, v13, (uint64_t)v12, v14);

  objc_msgSend_keys(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeys_(v4, v23, (uint64_t)v22, v24);

  return v4;
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
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v4 = a3;
  objc_msgSend_etag(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("Etag"));

  objc_msgSend_keys(self, v10, v11, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v14, (uint64_t)CFSTR("Keys"));

}

- (CKPCSKeysToRemove)initWithCoder:(id)a3
{
  id v4;
  CKPCSKeysToRemove *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *etag;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSArray *keys;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKPCSKeysToRemove;
  v5 = -[CKPCSKeysToRemove init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("Etag"));
    v8 = objc_claimAutoreleasedReturnValue();
    etag = v5->_etag;
    v5->_etag = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v10, v14, v11, v15, v12, v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("Keys"));
    v18 = objc_claimAutoreleasedReturnValue();
    keys = v5->_keys;
    v5->_keys = (NSArray *)v18;

  }
  return v5;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
