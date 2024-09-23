@implementation CKMultiValueMergeableDeltaRegisterState

+ (id)newSalt
{
  const char *v2;
  _BYTE __buf[32];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  arc4random_buf(__buf, 0x20uLL);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v2, (uint64_t)__buf, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CKMultiValueMergeableDeltaRegisterState)init
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  CKMultiValueMergeableDeltaRegisterState *v13;

  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_class();
  v11 = (void *)objc_msgSend_newSalt(v7, v8, v9, v10);
  v13 = (CKMultiValueMergeableDeltaRegisterState *)objc_msgSend_initWithIdentifier_vector_salt_(self, v12, (uint64_t)v5, (uint64_t)v6, v11);

  return v13;
}

- (CKMultiValueMergeableDeltaRegisterState)initWithIdentifier:(id)a3 vector:(id)a4 salt:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKMultiValueMergeableDeltaRegisterState *v14;
  uint64_t v15;
  NSUUID *identifier;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CKDistributedTimestampStateVector *vector;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSData *salt;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKMultiValueMergeableDeltaRegisterState;
  v14 = -[CKMultiValueMergeableDeltaRegisterState init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v8, v11, v12, v13);
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v15;

    v20 = objc_msgSend_mutableCopy(v9, v17, v18, v19);
    vector = v14->_vector;
    v14->_vector = (CKDistributedTimestampStateVector *)v20;

    v25 = objc_msgSend_copy(v10, v22, v23, v24);
    salt = v14->_salt;
    v14->_salt = (NSData *)v25;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMultiValueMergeableDeltaRegisterState)initWithCoder:(id)a3
{
  id v4;
  CKMultiValueMergeableDeltaRegisterState *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSUUID *identifier;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  CKDistributedTimestampStateVector *vector;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSData *salt;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKMultiValueMergeableDeltaRegisterState;
  v5 = -[CKMultiValueMergeableDeltaRegisterState init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_identifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v9;

    v11 = objc_opt_class();
    NSStringFromSelector(sel_vector);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, (uint64_t)v12);
    v14 = objc_claimAutoreleasedReturnValue();
    vector = v5->_vector;
    v5->_vector = (CKDistributedTimestampStateVector *)v14;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_salt);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v16, (uint64_t)v17);
    v19 = objc_claimAutoreleasedReturnValue();
    salt = v5->_salt;
    v5->_salt = (NSData *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;
  void *v6;
  const char *v7;
  CKDistributedTimestampStateVector *vector;
  void *v9;
  const char *v10;
  NSData *salt;
  const char *v12;
  id v13;

  identifier = self->_identifier;
  v5 = a3;
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)identifier, (uint64_t)v6);

  vector = self->_vector;
  NSStringFromSelector(sel_vector);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)vector, (uint64_t)v9);

  salt = self->_salt;
  NSStringFromSelector(sel_salt);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)salt, (uint64_t)v13);

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
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;

  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_identifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vector(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_salt(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_initWithIdentifier_vector_salt_(v4, v17, (uint64_t)v8, (uint64_t)v12, v16);

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CKMultiValueMergeableDeltaRegisterState *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKMultiValueMergeableDeltaRegisterState *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  char isEqual;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;

  v6 = (CKMultiValueMergeableDeltaRegisterState *)a3;
  if (self == v6)
  {
    isEqual = 1;
  }
  else
  {
    v7 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v6, v8, v7, v9))
    {
      v10 = v6;
      objc_msgSend_identifier(self, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v10, v15, v16, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v21)
      {
        objc_msgSend_identifier(self, v18, v19, v20);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v10, v22, v23, v24);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v3, v25, (uint64_t)v4, v26))
        {
          isEqual = 0;
          goto LABEL_19;
        }
      }
      objc_msgSend_vector(self, v18, v19, v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vector(v10, v29, v30, v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 == v35)
      {
        v64 = v28;
      }
      else
      {
        objc_msgSend_vector(self, v32, v33, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vector(v10, v37, v38, v39);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v36, v40, (uint64_t)v65, v41))
        {
          isEqual = 0;
          goto LABEL_17;
        }
        v63 = v36;
        v64 = v28;
      }
      objc_msgSend_salt(self, v32, v33, v34);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_salt(v10, v43, v44, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      if (v42 == (void *)v46)
      {

        isEqual = 1;
      }
      else
      {
        v50 = (void *)v46;
        objc_msgSend_salt(self, v47, v48, v49);
        v62 = v3;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_salt(v10, v52, v53, v54);
        v61 = v4;
        v55 = v21;
        v56 = v14;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v51, v58, (uint64_t)v57, v59);

        v14 = v56;
        v21 = v55;
        v4 = v61;

        v3 = v62;
      }
      v36 = v63;
      v28 = v64;
      if (v64 == v35)
      {
LABEL_18:

        if (v14 == v21)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    isEqual = 0;
  }
LABEL_21:

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
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  objc_msgSend_identifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_vector(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_salt(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CKDistributedTimestampStateVector)vector
{
  return self->_vector;
}

- (NSData)salt
{
  return self->_salt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_vector, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
