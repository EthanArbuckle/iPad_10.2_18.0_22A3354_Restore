@implementation CKDMarkAssetBrokenURLRequest

- (CKDMarkAssetBrokenURLRequest)initWithOperation:(id)a3 assetOrPackageMetadata:(id)a4 writeRepairRecord:(BOOL)a5
{
  id v9;
  CKDMarkAssetBrokenURLRequest *v10;
  CKDMarkAssetBrokenURLRequest *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDMarkAssetBrokenURLRequest;
  v10 = -[CKDURLRequest initWithOperation:](&v13, sel_initWithOperation_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_metadata, a4);
    v11->_writeRepairRecord = a5;
  }

  return v11;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDMarkAssetBrokenURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v9, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_metadata(self, v5, v6, v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("metadata"));

}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_metadata(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setModifyRecordIDs_(v4, v13, (uint64_t)v12);

  v14.receiver = self;
  v14.super_class = (Class)CKDMarkAssetBrokenURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v14, sel_fillOutRequestProperties_, v4);

}

- (id)requestOperationClasses
{
  const char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateRequestOperations
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  char v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  void *v81;
  _QWORD v83[2];

  v83[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_operationType(self, a2, v2);
  objc_msgSend_operationRequestWithType_(self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend_setMarkAssetBrokenRequest_(v6, v8, (uint64_t)v7);

  objc_msgSend_markAssetBrokenRequest(v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadata(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend_metadata(self, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend_setIsPackage_(v11, v18, 1);
    objc_msgSend_fileSignatures(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend_mutableCopy(v22, v23, v24);
    objc_msgSend_setFileSignatures_(v11, v26, (uint64_t)v25);

    objc_msgSend_referenceSignatures(v19, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_mutableCopy(v29, v30, v31);
  }
  else
  {
    objc_opt_class();
    v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) == 0)
      goto LABEL_6;
    objc_msgSend_metadata(self, v35, v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_listIndex(v19, v37, v38);
    objc_msgSend_setListIndex_(v11, v40, v39);
    v41 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_fileSignature(v19, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObject_(v41, v45, (uint64_t)v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFileSignatures_(v11, v47, (uint64_t)v46);

    v48 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_referenceSignature(v19, v49, v50);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithObject_(v48, v51, (uint64_t)v29);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v32;
  objc_msgSend_setReferenceSignatures_(v11, v33, v32);

LABEL_6:
  objc_msgSend_translator(self, v35, v36);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadata(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pRecordIdentifierFromRecordID_(v53, v60, (uint64_t)v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBrokenAssetRecordID_(v11, v62, (uint64_t)v61);

  objc_msgSend_metadata(self, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fieldName(v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFieldName_(v11, v69, (uint64_t)v68);

  objc_msgSend_metadata(self, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordType(v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAffectedRecordType_(v11, v76, (uint64_t)v75);

  if ((objc_msgSend_writeRepairRecord(self, v77, v78) & 1) == 0)
    objc_msgSend_setSkipWriteMissingAssetStatusRecord_(v11, v79, 1);

  v83[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v80, (uint64_t)v83, 1);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  return v81;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int hasMissingAssetStatusRecord;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  const char *v27;
  uint64_t v28;
  void *v29;
  id v31;

  v4 = a3;
  if (objc_msgSend_hasMarkAssetBrokenResponse(v4, v5, v6)
    && (objc_msgSend_markAssetBrokenResponse(v4, v7, v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        hasMissingAssetStatusRecord = objc_msgSend_hasMissingAssetStatusRecord(v9, v10, v11),
        v9,
        hasMissingAssetStatusRecord))
  {
    objc_msgSend_translator(self, v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_markAssetBrokenResponse(v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_missingAssetStatusRecord(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend_recordIDFromPRecordIdentifier_error_(v13, v20, (uint64_t)v19, &v31);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (uint64_t)v31;

  }
  else
  {
    v22 = 0;
    v21 = 0;
  }
  if (!(v22 | v21))
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v7, *MEMORY[0x1E0C947D8], 2006, CFSTR("Invalid data received from server"));
    v22 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_assetBrokenBlock(self, v7, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_assetBrokenBlock(self, v24, v25);
    v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v26)[2](v26, v21, v29);

  }
  return (id)v22;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend_assetBrokenBlock(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_assetBrokenBlock(self, v7, v8);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v13, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v12);

  }
}

- (id)assetBrokenBlock
{
  return self->_assetBrokenBlock;
}

- (void)setAssetBrokenBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (CKUploadRequestMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (BOOL)writeRepairRecord
{
  return self->_writeRepairRecord;
}

- (void)setWriteRepairRecord:(BOOL)a3
{
  self->_writeRepairRecord = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_assetBrokenBlock, 0);
}

@end
