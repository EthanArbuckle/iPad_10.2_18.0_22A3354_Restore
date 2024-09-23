@implementation CKDWrappingContext

- (CKDWrappingContext)initWithRecordID:(id)a3 fieldName:(id)a4
{
  return (CKDWrappingContext *)objc_msgSend_initWithRecordID_fieldName_mergeableDeltaID_fileSignature_referenceSignature_(self, a2, (uint64_t)a3, a4, 0, 0, 0);
}

- (CKDWrappingContext)initWithRecordID:(id)a3 fieldName:(id)a4 mergeableDeltaID:(id)a5 fileSignature:(id)a6 referenceSignature:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CKDWrappingContext *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  CKDWrappingContext *v23;
  NSObject *v24;
  id v26;
  id v27;
  objc_super v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v27 = a7;
  if (v13 && v14)
  {
    v28.receiver = self;
    v28.super_class = (Class)CKDWrappingContext;
    v17 = -[CKDWrappingContext init](&v28, sel_init);
    if (v17)
    {
      v18 = (id)CKProcessIndexedArrayKey();
      v19 = 0;
      v20 = v19;
      if (v19)
      {
        v26 = v16;
        v21 = v15;
        v22 = v19;

        v14 = v22;
        v15 = v21;
        v16 = v26;
      }
      objc_storeStrong((id *)&v17->_recordID, a3);
      objc_storeStrong((id *)&v17->_fieldName, v14);
      objc_storeStrong((id *)&v17->_mergeableDeltaID, a5);
      objc_storeStrong((id *)&v17->_fileSignature, a6);
      objc_storeStrong((id *)&v17->_referenceSignature, a7);

    }
    self = v17;
    v23 = self;
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v24 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v13;
      v31 = 2114;
      v32 = v14;
      _os_log_fault_impl(&dword_1BE990000, v24, OS_LOG_TYPE_FAULT, "Wrapping context requires a non-nil recordID and field. RecordID: %@, field: %{public}@", buf, 0x16u);
    }
    v23 = 0;
  }

  return v23;
}

- (id)assetContextString
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  void *v57;
  const char *v58;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  objc_msgSend_fileSignature(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v7 = (void *)v4,
        objc_msgSend_referenceSignature(self, v5, v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_FAULT))
    {
      v60 = v11;
      objc_msgSend_fileSignature(self, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_referenceSignature(self, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v68 = v63;
      v69 = 2112;
      v70 = v66;
      _os_log_fault_impl(&dword_1BE990000, v60, OS_LOG_TYPE_FAULT, "Invalid wrapping context for generating asset context string. File signature: %@. Reference signature: %@.", buf, 0x16u);

    }
  }
  v12 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend_recordID(self, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fieldName(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v12, v29, (uint64_t)CFSTR("%@-%@-%@"), v19, v25, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_mergeableDeltaID(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend_mergeableDeltaID(self, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueID(v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mergeableDeltaID(self, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deltaIdentifier(v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v30, v49, (uint64_t)CFSTR("-%@-%@"), v42, v48);

  }
  objc_msgSend_fileSignature(self, v34, v35);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v50, v51, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_referenceSignature(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v55, v56, 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v30, v58, (uint64_t)CFSTR("-%@-%@"), v52, v57);

  return v30;
}

- (id)encryptedDataContextString
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_recordID(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fieldName(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v21, (uint64_t)CFSTR("%@-%@-%@"), v11, v17, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (CKMergeableDeltaID)mergeableDeltaID
{
  return self->_mergeableDeltaID;
}

- (void)setMergeableDeltaID:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableDeltaID, a3);
}

- (NSData)fileSignature
{
  return self->_fileSignature;
}

- (void)setFileSignature:(id)a3
{
  objc_storeStrong((id *)&self->_fileSignature, a3);
}

- (NSData)referenceSignature
{
  return self->_referenceSignature;
}

- (void)setReferenceSignature:(id)a3
{
  objc_storeStrong((id *)&self->_referenceSignature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_fileSignature, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaID, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
