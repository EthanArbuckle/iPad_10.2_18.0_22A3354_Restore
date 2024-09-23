@implementation HMDBackingStoreLogRecord

- (HMDBackingStoreLogRecord)initWithArray:(id)a3
{
  id v4;
  HMDBackingStoreLogRecord *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSData *v20;
  NSData *data;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  CKRecordID *root;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)HMDBackingStoreLogRecord;
  v5 = -[HMDBackingStoreLogRecord init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v9 = objc_msgSend(v8, "integerValue");
    v5->_rowID = v9;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = objc_msgSend(v12, "integerValue");
    v5->_xactID = v13;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    v17 = objc_msgSend(v16, "integerValue");
    v5->_pushed = v17;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    data = v5->_data;
    v5->_data = v20;

    objc_msgSend(v4, "objectAtIndexedSubscript:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    v25 = objc_msgSend(v24, "integerValue");
    v5->_type = v25;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;

    v29 = objc_msgSend(v28, "integerValue");
    v5->_encoding = v29;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
    v32 = v31;

    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0C95070], "parseFromString:", v32);
      v33 = objc_claimAutoreleasedReturnValue();
      root = v5->_root;
      v5->_root = (CKRecordID *)v33;
    }
    else
    {
      root = v5->_root;
      v5->_root = 0;
    }

  }
  return v5;
}

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMDBackingStoreLogRecord rowID](self, "rowID");
  v5 = -[HMDBackingStoreLogRecord xactID](self, "xactID");
  v6 = -[HMDBackingStoreLogRecord type](self, "type");
  v7 = -[HMDBackingStoreLogRecord encoding](self, "encoding");
  v8 = -[HMDBackingStoreLogRecord pushed](self, "pushed");
  -[HMDBackingStoreLogRecord data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  -[HMDBackingStoreLogRecord root](self, "root");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDBackingStoreLogRecord id: %lld, xact_id: %lld, type: %lld, encoding: %lld, pushed: 0x%llx, size: %llu, root: %@>"), v4, v5, v6, v7, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (int64_t)xactID
{
  return self->_xactID;
}

- (int64_t)pushed
{
  return self->_pushed;
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)encoding
{
  return self->_encoding;
}

- (CKRecordID)root
{
  return self->_root;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
