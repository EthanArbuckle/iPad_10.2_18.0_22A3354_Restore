@implementation CKDAssetID

- (CKDAssetID)initWithRecordID:(id)a3 fileSignature:(id)a4 referenceSignature:(id)a5 size:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  CKDAssetID *v16;
  uint64_t v17;
  CKDPRecordIdentifier *recordID;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSData *fileSignature;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSData *referenceSignature;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CKDAssetID;
  v16 = -[CKDAssetID init](&v28, sel_init);
  if (v16)
  {
    v17 = objc_msgSend_copy(v10, v14, v15);
    recordID = v16->_recordID;
    v16->_recordID = (CKDPRecordIdentifier *)v17;

    v21 = objc_msgSend_copy(v11, v19, v20);
    fileSignature = v16->_fileSignature;
    v16->_fileSignature = (NSData *)v21;

    v25 = objc_msgSend_copy(v12, v23, v24);
    referenceSignature = v16->_referenceSignature;
    v16->_referenceSignature = (NSData *)v25;

    objc_storeStrong((id *)&v16->_size, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  CKDAssetID *v4;
  CKDAssetID *v5;
  CKDAssetID *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int isEqual;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  int v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  int v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  char isEqualToNumber;

  v4 = (CKDAssetID *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToNumber = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    objc_msgSend_recordID(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v6, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v9, v13, (uint64_t)v12);

    if (!isEqual)
      goto LABEL_10;
    objc_msgSend_fileSignature(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileSignature(v6, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_isEqual_(v17, v21, (uint64_t)v20);

    if (!v22)
      goto LABEL_10;
    objc_msgSend_referenceSignature(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_referenceSignature(v6, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = CKObjectsAreBothNilOrEqual();

    if (v29)
    {
      objc_msgSend_size(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_size(v6, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToNumber = objc_msgSend_isEqualToNumber_(v32, v36, (uint64_t)v35);

    }
    else
    {
LABEL_10:
      isEqualToNumber = 0;
    }

  }
  else
  {
    isEqualToNumber = 0;
  }

  return isEqualToNumber;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;

  objc_msgSend_recordID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);
  objc_msgSend_fileSignature(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;
  objc_msgSend_referenceSignature(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_hash(v16, v17, v18);
  objc_msgSend_size(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v13 ^ v19 ^ objc_msgSend_hash(v22, v23, v24);

  return v25;
}

- (id)CKPropertiesDescription
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_recordID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("recordID=%@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_fileSignature(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v11, v15, (uint64_t)CFSTR("fileSignature=%@"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v17, (uint64_t)v16);

  objc_msgSend_referenceSignature(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_referenceSignature(self, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v23, v25, (uint64_t)CFSTR("referenceSignature=%@"), v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v3, v27, (uint64_t)v26);

  }
  v28 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_size(self, v21, v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v28, v30, (uint64_t)CFSTR("size=%@"), v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v3, v32, (uint64_t)v31);

  objc_msgSend_componentsJoinedByString_(v3, v33, (uint64_t)CFSTR(", "));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAssetID *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (CKDPRecordIdentifier)recordID
{
  return self->_recordID;
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (NSNumber)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
