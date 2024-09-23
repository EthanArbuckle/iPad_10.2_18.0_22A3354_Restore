@implementation CKFileOpenInfo

- (CKFileOpenInfo)initWithUUID:(id)a3 path:(id)a4 deviceID:(id)a5 fileID:(id)a6 generationID:(id)a7 shouldReadRawEncryptedData:(BOOL)a8 fileHandle:(id)a9 assetDownloadStagingInfo:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  CKFileOpenInfo *v25;
  uint64_t v26;
  NSString *UUID;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString *path;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSNumber *deviceID;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSNumber *fileID;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSNumber *generationID;
  objc_super v50;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v50.receiver = self;
  v50.super_class = (Class)CKFileOpenInfo;
  v25 = -[CKFileOpenInfo init](&v50, sel_init);
  if (v25)
  {
    v26 = objc_msgSend_copy(v15, v22, v23, v24);
    UUID = v25->_UUID;
    v25->_UUID = (NSString *)v26;

    v31 = objc_msgSend_copy(v16, v28, v29, v30);
    path = v25->_path;
    v25->_path = (NSString *)v31;

    v36 = objc_msgSend_copy(v17, v33, v34, v35);
    deviceID = v25->_deviceID;
    v25->_deviceID = (NSNumber *)v36;

    v41 = objc_msgSend_copy(v18, v38, v39, v40);
    fileID = v25->_fileID;
    v25->_fileID = (NSNumber *)v41;

    v46 = objc_msgSend_copy(v19, v43, v44, v45);
    generationID = v25->_generationID;
    v25->_generationID = (NSNumber *)v46;

    v25->_shouldReadRawEncryptedData = a8;
    objc_storeStrong((id *)&v25->_fileHandle, a9);
    objc_storeStrong((id *)&v25->_assetDownloadStagingInfo, a10);
  }

  return v25;
}

- (CKFileOpenInfo)initWithPath:(id)a3
{
  return (CKFileOpenInfo *)objc_msgSend_initWithUUID_path_deviceID_fileID_generationID_shouldReadRawEncryptedData_fileHandle_assetDownloadStagingInfo_(self, a2, 0, (uint64_t)a3, 0, 0, 0, 0, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t RawEncryptedData;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  id v40;

  v40 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_UUID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v40, v9, (uint64_t)v8, (uint64_t)CFSTR("UUID"));

  objc_msgSend_path(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v40, v14, (uint64_t)v13, (uint64_t)CFSTR("path"));

  objc_msgSend_deviceID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v40, v19, (uint64_t)v18, (uint64_t)CFSTR("deviceID"));

  objc_msgSend_fileID(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v40, v24, (uint64_t)v23, (uint64_t)CFSTR("fileID"));

  objc_msgSend_generationID(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v40, v29, (uint64_t)v28, (uint64_t)CFSTR("generationID"));

  RawEncryptedData = objc_msgSend_shouldReadRawEncryptedData(self, v30, v31, v32);
  objc_msgSend_encodeBool_forKey_(v40, v34, RawEncryptedData, (uint64_t)CFSTR("shouldReadRawEncryptedData"));
  objc_msgSend_assetDownloadStagingInfo(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v40, v39, (uint64_t)v38, (uint64_t)CFSTR("AssetDownloadStagingInfo"));

  objc_autoreleasePoolPop(v4);
}

- (CKFileOpenInfo)initWithCoder:(id)a3
{
  id v4;
  CKFileOpenInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *UUID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *path;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSNumber *deviceID;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSNumber *fileID;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSNumber *generationID;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  CKAssetDownloadStagingInfo *assetDownloadStagingInfo;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKFileOpenInfo;
  v5 = -[CKFileOpenInfo init](&v34, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("UUID"));
    v9 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("path"));
    v13 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("deviceID"));
    v17 = objc_claimAutoreleasedReturnValue();
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSNumber *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("fileID"));
    v21 = objc_claimAutoreleasedReturnValue();
    fileID = v5->_fileID;
    v5->_fileID = (NSNumber *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("generationID"));
    v25 = objc_claimAutoreleasedReturnValue();
    generationID = v5->_generationID;
    v5->_generationID = (NSNumber *)v25;

    v5->_shouldReadRawEncryptedData = objc_msgSend_decodeBoolForKey_(v4, v27, (uint64_t)CFSTR("shouldReadRawEncryptedData"), v28);
    v29 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, (uint64_t)CFSTR("AssetDownloadStagingInfo"));
    v31 = objc_claimAutoreleasedReturnValue();
    assetDownloadStagingInfo = v5->_assetDownloadStagingInfo;
    v5->_assetDownloadStagingInfo = (CKAssetDownloadStagingInfo *)v31;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
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
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;

  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], a2, 6, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_UUID(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v10, (uint64_t)CFSTR("UUID=%@"), v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v4, v13, (uint64_t)v12, v14);

  objc_msgSend_deviceID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_deviceID(self, v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v24, (uint64_t)CFSTR("deviceID=%@"), v25, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v27, (uint64_t)v26, v28);

  }
  objc_msgSend_fileID(self, v19, v20, v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_fileID(self, v30, v31, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v33, v35, (uint64_t)CFSTR("fileID=%@"), v36, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v38, (uint64_t)v37, v39);

  }
  objc_msgSend_generationID(self, v30, v31, v32);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_generationID(self, v41, v42, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v44, v46, (uint64_t)CFSTR("generationID=%@"), v47, v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v49, (uint64_t)v48, v50);

  }
  objc_msgSend_path(self, v41, v42, v43);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    v55 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_path(self, v52, v53, v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKSanitizedPath(v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v55, v61, (uint64_t)CFSTR("path=\"%@\"), v62, v60);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v64, (uint64_t)v63, v65);

  }
  objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v52, 1, v54);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_shouldReadRawEncryptedData(self, v67, v68, v69))
    objc_msgSend_addObject_(v66, v70, (uint64_t)CFSTR("read-encrypted"), v72);
  if (objc_msgSend_count(v66, v70, v71, v72))
  {
    v75 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_componentsJoinedByString_(v66, v73, (uint64_t)CFSTR("|"), v74);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v75, v77, (uint64_t)CFSTR("flags=%@"), v78, v76);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v80, (uint64_t)v79, v81);

  }
  objc_msgSend_componentsJoinedByString_(v4, v73, (uint64_t)CFSTR(", "), v74);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  return v82;
}

- (id)description
{
  return (id)((uint64_t (*)(CKFileOpenInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)path
{
  return self->_path;
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (NSNumber)fileID
{
  return self->_fileID;
}

- (NSNumber)generationID
{
  return self->_generationID;
}

- (BOOL)shouldReadRawEncryptedData
{
  return self->_shouldReadRawEncryptedData;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (CKAssetDownloadStagingInfo)assetDownloadStagingInfo
{
  return self->_assetDownloadStagingInfo;
}

- (CKAssetDownloadStagingManager)assetDownloadStagingManager
{
  return (CKAssetDownloadStagingManager *)objc_loadWeakRetained((id *)&self->_assetDownloadStagingManager);
}

- (void)setAssetDownloadStagingManager:(id)a3
{
  objc_storeWeak((id *)&self->_assetDownloadStagingManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetDownloadStagingManager);
  objc_storeStrong((id *)&self->_assetDownloadStagingInfo, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
