@implementation CKMergeableDelta

- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKMergeableDelta *v11;
  uint64_t v12;
  CKMergeableValueID *valueID;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKMergeableDelta;
  v11 = -[CKMergeableDelta init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    valueID = v11->_valueID;
    v11->_valueID = (CKMergeableValueID *)v12;

    objc_storeStrong((id *)&v11->_metadata, a4);
    v11->_encryptMetadataTernary = -1;
  }

  return v11;
}

- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKMergeableDelta *v17;
  uint64_t v18;
  NSData *data;
  void *v21;
  CKException *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33 = 0;
  v11 = _CKCheckArgument((uint64_t)"data", v10, 0, 0, 0, &v33);
  v12 = v33;
  if ((v11 & 1) == 0)
  {
    v21 = v12;
    v22 = [CKException alloc];
    v26 = objc_msgSend_code(v21, v23, v24, v25);
    objc_msgSend_localizedDescription(v21, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, (uint64_t)CFSTR("%@"), v30);

    objc_exception_throw(v32);
  }

  v17 = (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_(self, v13, (uint64_t)v8, (uint64_t)v9);
  if (v17)
  {
    v18 = objc_msgSend_copy(v10, v14, v15, v16);
    data = v17->__data;
    v17->__data = (NSData *)v18;

  }
  return v17;
}

- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 encryptedData:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKMergeableDelta *v17;
  uint64_t v18;
  NSData *encryptedData;
  void *v21;
  CKException *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33 = 0;
  v11 = _CKCheckArgument((uint64_t)"encryptedData", v10, 0, 0, 0, &v33);
  v12 = v33;
  if ((v11 & 1) == 0)
  {
    v21 = v12;
    v22 = [CKException alloc];
    v26 = objc_msgSend_code(v21, v23, v24, v25);
    objc_msgSend_localizedDescription(v21, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, (uint64_t)CFSTR("%@"), v30);

    objc_exception_throw(v32);
  }

  v17 = (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_(self, v13, (uint64_t)v8, (uint64_t)v9);
  if (v17)
  {
    v18 = objc_msgSend_copy(v10, v14, v15, v16);
    encryptedData = v17->_encryptedData;
    v17->_encryptedData = (NSData *)v18;

  }
  return v17;
}

- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 asset:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  const char *v13;
  uint64_t v14;
  CKMergeableDelta *v15;
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
  uint64_t v26;
  uint64_t v27;
  NSURL *fileURL;
  void *v30;
  CKException *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  id v41;
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v42 = 0;
  v11 = _CKCheckArgument((uint64_t)"asset", v10, 0, 0, 0, &v42);
  v12 = v42;
  if ((v11 & 1) == 0)
  {
    v30 = v12;
    v31 = [CKException alloc];
    v35 = objc_msgSend_code(v30, v32, v33, v34);
    objc_msgSend_localizedDescription(v30, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (id)objc_msgSend_initWithCode_format_(v31, v40, v35, (uint64_t)CFSTR("%@"), v39);

    objc_exception_throw(v41);
  }

  v14 = objc_msgSend_initWithValueID_metadata_(self, v13, (uint64_t)v8, (uint64_t)v9);
  v15 = (CKMergeableDelta *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 40), a5);
    objc_msgSend_fileURL(v10, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend_fileURL(v10, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend_copy(v23, v24, v25, v26);
      fileURL = v15->_fileURL;
      v15->_fileURL = (NSURL *)v27;

    }
  }

  return v15;
}

- (CKMergeableDelta)initWithValueID:(id)a3 metadata:(id)a4 fileURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CKMergeableDelta *v17;
  uint64_t v18;
  NSURL *fileURL;
  void *v21;
  CKException *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  id v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33 = 0;
  v11 = _CKCheckArgument((uint64_t)"fileURL", v10, 0, 0, 0, &v33);
  v12 = v33;
  if ((v11 & 1) == 0)
  {
    v21 = v12;
    v22 = [CKException alloc];
    v26 = objc_msgSend_code(v21, v23, v24, v25);
    objc_msgSend_localizedDescription(v21, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend_initWithCode_format_(v22, v31, v26, (uint64_t)CFSTR("%@"), v30);

    objc_exception_throw(v32);
  }

  v17 = (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_(self, v13, (uint64_t)v8, (uint64_t)v9);
  if (v17)
  {
    v18 = objc_msgSend_copy(v10, v14, v15, v16);
    fileURL = v17->_fileURL;
    v17->_fileURL = (NSURL *)v18;

  }
  return v17;
}

- (CKMergeableDelta)initWithData:(id)a3 metadata:(id)a4
{
  return (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_data_(self, a2, 0, (uint64_t)a4, a3);
}

- (CKMergeableDelta)initWithFileURL:(id)a3 metadata:(id)a4
{
  return (CKMergeableDelta *)MEMORY[0x1E0DE7D20](self, sel_initWithValueID_metadata_fileURL_, 0, a4);
}

- (CKMergeableDelta)init
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
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;

  objc_msgSend__data(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_metadata(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_valueID(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_hash(v21, v22, v23, v24);
  objc_msgSend_asset(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);
  objc_msgSend_fileURL(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v33 ^ objc_msgSend_hash(v37, v38, v39, v40);

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  CKMergeableDelta *v4;
  CKMergeableDelta *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int isEqual;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  char v52;

  v4 = (CKMergeableDelta *)a3;
  if (self == v4)
  {
    v52 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_valueID(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_valueID(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);

      if (!isEqual)
        goto LABEL_10;
      objc_msgSend_metadata(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_metadata(v5, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CKObjectsAreBothNilOrEqual(v20, v24);

      if (!v25)
        goto LABEL_10;
      objc_msgSend__data(self, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__data(v5, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CKObjectsAreBothNilOrEqual(v29, v33);

      if (!v34)
        goto LABEL_10;
      objc_msgSend_asset(self, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_asset(v5, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CKObjectsAreBothNilOrEqual(v38, v42);

      if (v43)
      {
        objc_msgSend_fileURL(self, v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileURL(v5, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = CKObjectsAreBothNilOrEqual(v47, v51);

      }
      else
      {
LABEL_10:
        v52 = 0;
      }

    }
    else
    {
      v52 = 0;
    }
  }

  return v52;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKMergeableDelta *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  _QWORD *v14;
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
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;

  v4 = [CKMergeableDelta alloc];
  objc_msgSend_valueID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadata(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (_QWORD *)objc_msgSend_initWithValueID_metadata_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  objc_msgSend__data(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_copy(v18, v19, v20, v21);
  v23 = (void *)v14[4];
  v14[4] = v22;

  objc_msgSend_fileURL(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_copy(v27, v28, v29, v30);
  v32 = (void *)v14[1];
  v14[1] = v31;

  objc_msgSend_encryptedData(self, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_copy(v36, v37, v38, v39);
  v41 = (void *)v14[7];
  v14[7] = v40;

  objc_msgSend_asset(self, v42, v43, v44);
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v14[5];
  v14[5] = v45;

  v14[6] = objc_msgSend_encryptMetadataTernary(self, v47, v48, v49);
  return v14;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKMergeableDelta *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKMergeableDelta *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  id v49;

  v49 = a3;
  objc_msgSend_valueID(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v49, v8, (uint64_t)CFSTR("valueID"), (uint64_t)v7, 0);

  objc_msgSend__data(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (v12)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    v18 = objc_msgSend_length(v12, v13, v14, v15);
    objc_msgSend_numberWithUnsignedInteger_(v17, v19, v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v49, v22, (uint64_t)CFSTR("dataLength"), (uint64_t)v21, 0);

  }
  objc_msgSend_encryptedData(self, v13, v14, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURL(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKSanitizedPath(v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v49, v32, (uint64_t)CFSTR("fileURL"), (uint64_t)v31, 0);

  if (v23)
  {
    v36 = (void *)MEMORY[0x1E0CB37E8];
    v37 = objc_msgSend_length(v23, v33, v34, v35);
    objc_msgSend_numberWithUnsignedInteger_(v36, v38, v37, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v49, v41, (uint64_t)CFSTR("encryptedDataLength"), (uint64_t)v40, 0);

  }
  objc_msgSend_metadata(self, v33, v34, v35);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v49, v43, (uint64_t)CFSTR("metadata"), (uint64_t)v42, 0);

  objc_msgSend_asset(self, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v49, v48, (uint64_t)CFSTR("asset"), (uint64_t)v47, 0);

}

- (NSURL)fileURL
{
  CKMergeableDelta *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  NSURL *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = self;
  objc_sync_enter(v2);
  v6 = v2->_fileURL;
  if (!v6)
  {
    objc_msgSend_asset(v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURL(v7, v8, v9, v10);
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v2);

  return v6;
}

- (void)setFileURL:(id)a3
{
  NSURL *v4;
  NSURL *fileURL;
  CKMergeableDelta *obj;

  v4 = (NSURL *)a3;
  obj = self;
  objc_sync_enter(obj);
  fileURL = obj->_fileURL;
  obj->_fileURL = v4;

  objc_sync_exit(obj);
}

- (id)dataBackedDeltaWithError:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  CKMergeableDelta *v9;
  void *v10;
  CKMergeableDelta *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  objc_msgSend__data(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = self;
  }
  else
  {
    objc_msgSend_dataWithError_(self, v7, (uint64_t)a3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = [CKMergeableDelta alloc];
      objc_msgSend_valueID(self, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_metadata(self, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_data_(v11, v20, (uint64_t)v15, (uint64_t)v19, v10);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (CKMergeableDeltaID)deltaID
{
  CKMergeableDeltaID *v3;
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
  void *v17;

  v3 = [CKMergeableDeltaID alloc];
  objc_msgSend_metadata(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueID(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_initWithDeltaIdentifier_valueID_(v3, v16, (uint64_t)v11, (uint64_t)v15);

  return (CKMergeableDeltaID *)v17;
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
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  id v40;

  v4 = a3;
  objc_msgSend_valueID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_valueID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v8, (uint64_t)v9);

  objc_msgSend_metadata(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

  objc_msgSend__data(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel__data);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v20, (uint64_t)v21);

  objc_msgSend_fileURL(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fileURL);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v26, (uint64_t)v27);

  v32 = objc_msgSend_encryptMetadataTernary(self, v29, v30, v31);
  NSStringFromSelector(sel_encryptMetadataTernary);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v4, v34, v32, (uint64_t)v33);

  objc_msgSend_asset(self, v35, v36, v37);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_asset);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v40, (uint64_t)v38);

}

- (CKMergeableDelta)initWithCoder:(id)a3
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
  CKMergeableDelta *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSData *data;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSURL *fileURL;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  CKAsset *asset;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_valueID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  NSStringFromSelector(sel_metadata);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (CKMergeableDelta *)objc_msgSend_initWithValueID_metadata_(self, v13, (uint64_t)v8, (uint64_t)v12);
  if (v14)
  {
    v15 = objc_opt_class();
    NSStringFromSelector(sel__data);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16);
    v18 = objc_claimAutoreleasedReturnValue();
    data = v14->__data;
    v14->__data = (NSData *)v18;

    v20 = objc_opt_class();
    NSStringFromSelector(sel_fileURL);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v20, (uint64_t)v21);
    v23 = objc_claimAutoreleasedReturnValue();
    fileURL = v14->_fileURL;
    v14->_fileURL = (NSURL *)v23;

    NSStringFromSelector(sel_encryptMetadataTernary);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_encryptMetadataTernary = objc_msgSend_decodeIntegerForKey_(v4, v26, (uint64_t)v25, v27);

    v28 = objc_opt_class();
    NSStringFromSelector(sel_asset);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v28, (uint64_t)v29);
    v31 = objc_claimAutoreleasedReturnValue();
    asset = v14->_asset;
    v14->_asset = (CKAsset *)v31;

  }
  return v14;
}

- (id)dataWithError:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  id v22;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint8_t buf[4];
  CKMergeableDelta *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_fileURL(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asset(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__data(self, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    goto LABEL_2;
  if (v6)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v20 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v38 = self;
      _os_log_debug_impl(&dword_18A5C5000, v20, OS_LOG_TYPE_DEBUG, "Loading data from file for delta %@", buf, 0xCu);
    }
    v36 = 0;
    objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E0C99D50], v21, (uint64_t)v6, 0, &v36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v36;
    goto LABEL_9;
  }
  if (v10)
  {
    objc_msgSend_fileURL(v10, v15, v16, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v28 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend_fileURL(v10, v25, v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend_dataWithContentsOfURL_options_error_(v28, v30, (uint64_t)v29, 0, &v35);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v35;

      goto LABEL_10;
    }
    objc_msgSend_assetContent(v10, v25, v26, v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend_assetContent(v10, v32, v33, v34);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_2:
      v18 = (void *)v14;
      v19 = 0;
      goto LABEL_10;
    }
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v32, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Cannot load data from a delta asset with no content: %@"), self);
LABEL_22:
    v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v19 = v22;
    goto LABEL_10;
  }
  objc_msgSend_encryptedData(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v31, (uint64_t)CFSTR("CKErrorDomain"), 1, CFSTR("Unknown error getting data from %@"), self);
    goto LABEL_22;
  }
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v31, (uint64_t)CFSTR("CKErrorDomain"), 12, CFSTR("Cannot get unencrypted data from an encrypted delta: %@"), self);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0;
LABEL_10:
  if (a3)
    *a3 = objc_retainAutorelease(v19);

  return v18;
}

- (BOOL)contentSize:(unint64_t *)a3 error:(id *)a4
{
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
  unint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  char ResourceValue_forKey_error;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  CKMergeableDelta *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend__data(self, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURL(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_asset(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15;
  if (v7)
  {
    v20 = objc_msgSend_length(v7, v16, v17, v18);
    goto LABEL_5;
  }
  objc_msgSend_assetContent(v15, v16, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_assetContent(v19, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_length(v25, v26, v27, v28);

    goto LABEL_5;
  }
  if (!v11)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v37 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = self;
      _os_log_fault_impl(&dword_18A5C5000, v37, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Unable to get content size for delta with no contents %@", buf, 0xCu);
    }
    v20 = 0;
LABEL_5:
    v29 = 0;
    ResourceValue_forKey_error = 1;
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v40 = 0;
  v32 = *MEMORY[0x1E0C99998];
  v39 = 0;
  ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v11, v22, (uint64_t)&v40, v32, &v39);
  v33 = v40;
  v29 = v39;
  if ((ResourceValue_forKey_error & 1) != 0)
  {
    v20 = objc_msgSend_integerValue(v33, v34, v35, v36);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v38 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = self;
      v43 = 2112;
      v44 = v29;
      _os_log_error_impl(&dword_18A5C5000, v38, OS_LOG_TYPE_ERROR, "Unable to get content size for file-backed delta %@: %@", buf, 0x16u);
    }
    v20 = 0;
  }

  if (a4)
LABEL_6:
    *a4 = objc_retainAutorelease(v29);
LABEL_7:
  if (a3)
    *a3 = v20;

  return ResourceValue_forKey_error;
}

- (BOOL)protobufSize:(unint64_t *)a3 error:(id *)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  int v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int isEncrypted;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v34;
  unint64_t v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend_asset(self, a2, (uint64_t)a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11 = 0;
    v12 = 0;
    LOBYTE(v13) = 1;
  }
  else
  {
    v34 = 0;
    v35 = 0;
    v13 = objc_msgSend_contentSize_error_(self, v8, (uint64_t)&v35, (uint64_t)&v34);
    v12 = v34;
    if (v13)
    {
      v11 = v35;
    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v14 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v12;
        _os_log_error_impl(&dword_18A5C5000, v14, OS_LOG_TYPE_ERROR, "Failed to get content size when calculating delta proto size: %@", buf, 0xCu);
      }
      v11 = 0;
    }
  }
  objc_msgSend_valueID(self, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isEncrypted = objc_msgSend_isEncrypted(v15, v16, v17, v18);

  v23 = v11 + 28;
  if (!isEncrypted)
    v23 = v11;
  v24 = v23 + 2;
  if (v23 >= 0x80)
  {
    do
    {
      ++v24;
      v25 = v23 >> 14;
      v23 >>= 7;
    }
    while (v25);
  }
  objc_msgSend_metadata(self, v20, v21, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_size(v26, v27, v28, v29);
  v31 = v30 + 2;
  if (v30 >= 0x80)
  {
    do
    {
      ++v31;
      v32 = v30 >> 14;
      v30 >>= 7;
    }
    while (v32);
  }

  if (a3)
    *a3 = v24 + v31 + 16;
  if (a4)
    *a4 = objc_retainAutorelease(v12);

  return v13;
}

- (void)populateAssetIfNecessaryWithMaxInlineSize:(unint64_t)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CKAsset *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  CKAsset *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  unint64_t v33;
  uint8_t buf[4];
  CKMergeableDelta *v35;
  __int16 v36;
  CKMergeableDelta *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  if (objc_msgSend_contentSize_error_(self, a2, (uint64_t)&v33, 0) && v33 > a3)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v5 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v35 = (CKMergeableDelta *)v33;
      v36 = 2112;
      v37 = self;
      _os_log_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_INFO, "Will use an asset for large mergeable delta with size %ld: %@", buf, 0x16u);
    }
    objc_msgSend__data(self, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURL(self, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v9)
    {
      v15 = [CKAsset alloc];
      objc_msgSend_identifier((void *)*MEMORY[0x1E0CEC4A0], v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend_initWithAssetContent_itemTypeHint_(v15, v20, (uint64_t)v9, (uint64_t)v19);
      objc_msgSend_setAsset_(self, v22, (uint64_t)v21, v23);

      objc_msgSend_set_data_(self, v24, 0, v25);
    }
    else if (v13)
    {
      v26 = [CKAsset alloc];
      v29 = (void *)objc_msgSend_initWithFileURL_(v26, v27, (uint64_t)v14, v28);
      objc_msgSend_setAsset_(self, v30, (uint64_t)v29, v31);

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v32 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = self;
        _os_log_fault_impl(&dword_18A5C5000, v32, OS_LOG_TYPE_FAULT, "Tried to convert a delta to an asset, but there was no data or file URL: %@", buf, 0xCu);
      }
    }

  }
}

- (void)unpopulateAsset
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  int v30;
  CKMergeableDelta *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend_asset(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    objc_msgSend_assetContent(v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v14 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
      {
        v30 = 138412290;
        v31 = self;
        _os_log_impl(&dword_18A5C5000, v14, OS_LOG_TYPE_INFO, "Converting asset back to data for %@", (uint8_t *)&v30, 0xCu);
      }
      objc_msgSend_assetContent(v9, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_set_data_(self, v19, (uint64_t)v18, v20);
    }
    else
    {
      objc_msgSend_fileURL(v9, v11, v12, v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
LABEL_15:
        objc_msgSend_setAsset_(self, v22, 0, v23);
        goto LABEL_16;
      }
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v24 = ck_log_facility_distributed_sync;
      if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
      {
        v30 = 138412290;
        v31 = self;
        _os_log_impl(&dword_18A5C5000, v24, OS_LOG_TYPE_INFO, "Converting asset back to file URL for %@", (uint8_t *)&v30, 0xCu);
      }
      objc_msgSend_fileURL(v9, v25, v26, v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFileURL_(self, v28, (uint64_t)v18, v29);
    }

    goto LABEL_15;
  }
LABEL_16:

}

+ (int64_t)suggestedDeltaSizeForContainer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  int64_t v36;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  uint8_t buf[16];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/suggested-mergeable-delta-size", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = a1;
  objc_sync_enter(v6);
  objc_msgSend_containerID(v4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_18A805198;
  v47 = sub_18A8051A8;
  objc_msgSend_objectForKeyedSubscript_((void *)qword_1ECD969D0, v11, (uint64_t)v10, v12);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1ECD969D8;
  objc_msgSend_containerID(v4, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v18, (uint64_t)v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v20, v21, v22, v23);
  v25 = v24;

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v26, v27, v28);
  v33 = (void *)v44[5];
  if (!v33 || v32 - v25 > 86400.0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v34 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18A5C5000, v34, OS_LOG_TYPE_INFO, "Will fetch suggested delta size from daemon", buf, 2u);
    }
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = sub_18A80528C;
    v38[3] = &unk_1E1F66590;
    v41 = &v43;
    v39 = v10;
    v40 = v4;
    objc_msgSend_getSynchronousContainerScopedDaemonProxyWithErrorHandler_daemonProxyHandler_(v40, v35, (uint64_t)&unk_1E1F58B18, (uint64_t)v38);

    v33 = (void *)v44[5];
  }
  v36 = objc_msgSend_integerValue(v33, v29, v30, v31);
  _Block_object_dispose(&v43, 8);

  objc_sync_exit(v6);
  os_activity_scope_leave(&state);

  return v36;
}

+ (unint64_t)maxInlineDeltaSize
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
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
  unint64_t v16;

  objc_msgSend_defaultContext(CKLogicalDeviceContext, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connection(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processScopedDaemonProxy(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_maxInlineMergeableDeltaSize(v12, v13, v14, v15);

  return v16;
}

- (CKMergeableDeltaMetadata)metadata
{
  return (CKMergeableDeltaMetadata *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CKMergeableValueID)valueID
{
  return (CKMergeableValueID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValueID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSData)_data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_data:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (CKAsset)asset
{
  return (CKAsset *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)encryptMetadataTernary
{
  return self->_encryptMetadataTernary;
}

- (void)setEncryptMetadataTernary:(int64_t)a3
{
  self->_encryptMetadataTernary = a3;
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEncryptedData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->__data, 0);
  objc_storeStrong((id *)&self->_valueID, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
