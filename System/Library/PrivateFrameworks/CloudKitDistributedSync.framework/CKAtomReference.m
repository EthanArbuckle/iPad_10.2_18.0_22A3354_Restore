@implementation CKAtomReference

- (CKAtomReference)initWithMergeableValueID:(id)a3
{
  return (CKAtomReference *)MEMORY[0x1E0DE7D20](self, sel_initWithMergeableValueID_timestamp_, a3);
}

- (CKAtomReference)initWithMergeableValueID:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  CKAtomReference *v10;
  uint64_t v11;
  CKMergeableValueID *mergeableValueID;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKDistributedTimestamp *timestamp;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKAtomReference;
  v10 = -[CKAtomReference init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    mergeableValueID = v10->_mergeableValueID;
    v10->_mergeableValueID = (CKMergeableValueID *)v11;

    v15 = objc_msgSend_copy(v7, v13, v14);
    timestamp = v10->_timestamp;
    v10->_timestamp = (CKDistributedTimestamp *)v15;

    v10->_type = 1;
  }

  return v10;
}

- (CKAtomReference)initWithMergeableValueID:(id)a3 timestamp:(id)a4 type:(unsigned __int8)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  CKAtomReference *v12;
  uint64_t v13;
  CKMergeableValueID *mergeableValueID;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CKDistributedTimestamp *timestamp;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKAtomReference;
  v12 = -[CKAtomReference init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend_copy(v8, v10, v11);
    mergeableValueID = v12->_mergeableValueID;
    v12->_mergeableValueID = (CKMergeableValueID *)v13;

    v17 = objc_msgSend_copy(v9, v15, v16);
    timestamp = v12->_timestamp;
    v12->_timestamp = (CKDistributedTimestamp *)v17;

    v12->_type = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CKAtomReference *v5;
  CKAtomReference *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  char isEqual;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v38;

  v5 = (CKAtomReference *)a3;
  if (v5 == self)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v9 = objc_msgSend_type(self, v7, v8);
      if (v9 != objc_msgSend_type(v6, v10, v11))
      {
        isEqual = 0;
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend_mergeableValueID(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mergeableValueID(v6, v15, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 != v19)
      {
        objc_msgSend_mergeableValueID(self, v17, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mergeableValueID(v6, v21, v22);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v20, v23, (uint64_t)v3))
        {
          isEqual = 0;
LABEL_15:

LABEL_16:
          goto LABEL_17;
        }
        v38 = v20;
      }
      objc_msgSend_timestamp(self, v17, v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timestamp(v6, v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      if (v25 == (void *)v28)
      {

        isEqual = 1;
      }
      else
      {
        v31 = (void *)v28;
        objc_msgSend_timestamp(self, v29, v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timestamp(v6, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v32, v36, (uint64_t)v35);

      }
      v20 = v38;
      if (v14 == v19)
        goto LABEL_16;
      goto LABEL_15;
    }
    isEqual = 0;
  }
LABEL_18:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;

  v4 = objc_msgSend_type(self, a2, v2);
  objc_msgSend_mergeableValueID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hash(v7, v8, v9);
  objc_msgSend_timestamp(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ objc_msgSend_hash(v13, v14, v15) ^ v4;

  return v16;
}

- (unsigned)type
{
  return self->_type;
}

- (CKMergeableValueID)mergeableValueID
{
  return self->_mergeableValueID;
}

- (CKDistributedTimestamp)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_mergeableValueID, 0);
}

@end
