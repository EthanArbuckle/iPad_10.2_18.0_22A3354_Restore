@implementation CKMergeableDeltaID

- (CKMergeableDeltaID)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v3, v6, v4, (uint64_t)CFSTR("%@ is unavailable"), v5);

  return 0;
}

- (CKMergeableDeltaID)initWithDeltaIdentifier:(id)a3 valueID:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKMergeableDeltaID *v14;
  uint64_t v15;
  NSString *deltaIdentifier;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CKMergeableValueID *valueID;
  void *v23;
  CKException *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  id v34;
  objc_super v35;
  id v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v37 = 0;
  v8 = _CKCheckArgument((uint64_t)"deltaIdentifier", v6, 0, 0, 0, &v37);
  v9 = v37;
  if ((v8 & 1) == 0
    || (v9,
        v36 = 0,
        v10 = _CKCheckArgument((uint64_t)"valueID", v7, 0, 0, 0, &v36),
        v9 = v36,
        (v10 & 1) == 0))
  {
    v23 = v9;
    v24 = [CKException alloc];
    v28 = objc_msgSend_code(v23, v25, v26, v27);
    objc_msgSend_localizedDescription(v23, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend_initWithCode_format_(v24, v33, v28, (uint64_t)CFSTR("%@"), v32);

    objc_exception_throw(v34);
  }

  v35.receiver = self;
  v35.super_class = (Class)CKMergeableDeltaID;
  v14 = -[CKMergeableDeltaID init](&v35, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v6, v11, v12, v13);
    deltaIdentifier = v14->_deltaIdentifier;
    v14->_deltaIdentifier = (NSString *)v15;

    v20 = objc_msgSend_copy(v7, v17, v18, v19);
    valueID = v14->_valueID;
    v14->_valueID = (CKMergeableValueID *)v20;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  CKMergeableDeltaID *v4;
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
  int v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  char isEqual;

  v4 = (CKMergeableDeltaID *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend_deltaIdentifier(self, v5, v6, v7),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_deltaIdentifier(v4, v9, v10, v11),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend_isEqual_(v8, v13, (uint64_t)v12, v14),
          v12,
          v8,
          v15))
    {
      objc_msgSend_valueID(self, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueID(v4, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);

    }
    else
    {
      isEqual = 0;
    }
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

  objc_msgSend_deltaIdentifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_valueID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMergeableDeltaID)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  CKMergeableDeltaID *v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v6 = objc_opt_class();
  NSStringFromSelector(sel_deltaIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  NSStringFromSelector(sel_valueID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  v15 = (CKMergeableDeltaID *)objc_msgSend_initWithDeltaIdentifier_valueID_(self, v14, (uint64_t)v9, (uint64_t)v13);

  return v15;
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
  objc_msgSend_deltaIdentifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_deltaIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)v8, (uint64_t)v9);

  objc_msgSend_valueID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_valueID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v14, (uint64_t)v15);

  objc_autoreleasePoolPop(v4);
}

- (NSString)deltaIdentifier
{
  return self->_deltaIdentifier;
}

- (CKMergeableValueID)valueID
{
  return self->_valueID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueID, 0);
  objc_storeStrong((id *)&self->_deltaIdentifier, 0);
}

@end
