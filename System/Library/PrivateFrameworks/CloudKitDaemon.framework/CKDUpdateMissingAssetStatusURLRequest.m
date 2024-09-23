@implementation CKDUpdateMissingAssetStatusURLRequest

- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 unrecoveredRepairRecordID:(id)a4
{
  return (CKDUpdateMissingAssetStatusURLRequest *)objc_msgSend_initWithOperation_repairRecordID_recovered_package_sizes_putReceipts_(self, a2, (uint64_t)a3, a4, 0, 0, 0, 0);
}

- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 recoveredAssetRepairRecordID:(id)a4 size:(unint64_t)a5 putReceipt:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  CKDUpdateMissingAssetStatusURLRequest *v20;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v22 = v12;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)&v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (CKDUpdateMissingAssetStatusURLRequest *)(id)objc_msgSend_initWithOperation_repairRecordID_recovered_package_sizes_putReceipts_(self, v19, (uint64_t)v10, v11, 1, 0, v17, v18);

  }
  else
  {
    v20 = (CKDUpdateMissingAssetStatusURLRequest *)(id)objc_msgSend_initWithOperation_repairRecordID_recovered_package_sizes_putReceipts_(self, v16, (uint64_t)v10, v11, 1, 0, v17, MEMORY[0x1E0C9AA60]);
  }

  return v20;
}

- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 recoveredPackageRepairRecordID:(id)a4 sizes:(id)a5 putReceipts:(id)a6
{
  return (CKDUpdateMissingAssetStatusURLRequest *)objc_msgSend_initWithOperation_repairRecordID_recovered_package_sizes_putReceipts_(self, a2, (uint64_t)a3, a4, 1, 1, a5, a6);
}

- (CKDUpdateMissingAssetStatusURLRequest)initWithOperation:(id)a3 repairRecordID:(id)a4 recovered:(BOOL)a5 package:(BOOL)a6 sizes:(id)a7 putReceipts:(id)a8
{
  id v15;
  id v16;
  id v17;
  CKDUpdateMissingAssetStatusURLRequest *v18;
  CKDUpdateMissingAssetStatusURLRequest *v19;
  objc_super v21;

  v15 = a4;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)CKDUpdateMissingAssetStatusURLRequest;
  v18 = -[CKDURLRequest initWithOperation:](&v21, sel_initWithOperation_, a3);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_repairRecordID, a4);
    v19->_recovered = a5;
    v19->_isPackage = a6;
    objc_storeStrong((id *)&v19->_assetSizes, a7);
    objc_storeStrong((id *)&v19->_assetPutReceipts, a8);
  }

  return v19;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKDUpdateMissingAssetStatusURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v13, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_repairRecordID(self, v5, v6, v13.receiver, v13.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("repairRecordID"));

  objc_msgSend_assetSizes(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, CFSTR("assetSizes"));

}

- (void)fillOutRequestProperties:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_repairRecordID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setModifyRecordIDs_(v4, v10, (uint64_t)v9);

  v11.receiver = self;
  v11.super_class = (Class)CKDUpdateMissingAssetStatusURLRequest;
  -[CKDURLRequest fillOutRequestProperties:](&v11, sel_fillOutRequestProperties_, v4);

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
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  void *v62;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_operationType(self, a2, v2);
  objc_msgSend_operationRequestWithType_(self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend_setUpdateMissingAssetStatusRequest_(v6, v8, (uint64_t)v7);

  objc_msgSend_updateMissingAssetStatusRequest(v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_translator(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairRecordID(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pRecordIdentifierFromRecordID_(v14, v18, (uint64_t)v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMissingAssetStatusRecordID_(v11, v20, (uint64_t)v19);

  v23 = objc_msgSend_recovered(self, v21, v22);
  objc_msgSend_setRecovered_(v11, v24, v23);
  if (objc_msgSend_recovered(self, v25, v26))
  {
    if ((objc_msgSend_isPackage(self, v27, v28) & 1) != 0)
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend_assetSizes(self, v29, v30, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v64, v69, 16);
      if (v33)
      {
        v36 = v33;
        v37 = *(_QWORD *)v65;
        do
        {
          v38 = 0;
          do
          {
            if (*(_QWORD *)v65 != v37)
              objc_enumerationMutation(v31);
            v39 = objc_msgSend_unsignedIntegerValue(*(void **)(*((_QWORD *)&v64 + 1) + 8 * v38), v34, v35);
            objc_msgSend_addPackageAssetSize_(v11, v40, v39);
            ++v38;
          }
          while (v36 != v38);
          v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v64, v69, 16);
        }
        while (v36);
      }

      objc_msgSend_assetPutReceipts(self, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend_mutableCopy(v43, v44, v45);
      objc_msgSend_setPackagePutReceipts_(v11, v47, (uint64_t)v46);
    }
    else
    {
      objc_msgSend_assetSizes(self, v29, v30);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend_unsignedIntegerValue(v51, v52, v53);
      objc_msgSend_setAssetSize_(v11, v55, v54);

      objc_msgSend_assetPutReceipts(self, v56, v57);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v43, v58, v59);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssetPutReceipt_(v11, v60, (uint64_t)v46);
    }

  }
  v68 = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v61, (uint64_t)&v68, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  return 0;
}

- (CKRecordID)repairRecordID
{
  return self->_repairRecordID;
}

- (void)setRepairRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (BOOL)recovered
{
  return self->_recovered;
}

- (void)setRecovered:(BOOL)a3
{
  self->_recovered = a3;
}

- (BOOL)isPackage
{
  return self->_isPackage;
}

- (void)setIsPackage:(BOOL)a3
{
  self->_isPackage = a3;
}

- (NSArray)assetSizes
{
  return self->_assetSizes;
}

- (void)setAssetSizes:(id)a3
{
  objc_storeStrong((id *)&self->_assetSizes, a3);
}

- (NSArray)assetPutReceipts
{
  return self->_assetPutReceipts;
}

- (void)setAssetPutReceipts:(id)a3
{
  objc_storeStrong((id *)&self->_assetPutReceipts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPutReceipts, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_repairRecordID, 0);
}

@end
