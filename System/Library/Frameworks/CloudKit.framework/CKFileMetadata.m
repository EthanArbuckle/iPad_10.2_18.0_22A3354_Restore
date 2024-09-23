@implementation CKFileMetadata

- (CKFileMetadata)initWithDeviceID:(id)a3 fileID:(id)a4 generationID:(id)a5 modTimeInSeconds:(id)a6 fileSize:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  CKFileMetadata *v20;
  uint64_t v21;
  NSNumber *deviceID;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSNumber *fileID;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSNumber *generationID;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSNumber *modTimeInSeconds;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSNumber *fileSize;
  objc_super v44;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)CKFileMetadata;
  v20 = -[CKFileMetadata init](&v44, sel_init);
  if (v20)
  {
    v21 = objc_msgSend_copy(v12, v17, v18, v19);
    deviceID = v20->_deviceID;
    v20->_deviceID = (NSNumber *)v21;

    v26 = objc_msgSend_copy(v13, v23, v24, v25);
    fileID = v20->_fileID;
    v20->_fileID = (NSNumber *)v26;

    v31 = objc_msgSend_copy(v14, v28, v29, v30);
    generationID = v20->_generationID;
    v20->_generationID = (NSNumber *)v31;

    v36 = objc_msgSend_copy(v15, v33, v34, v35);
    modTimeInSeconds = v20->_modTimeInSeconds;
    v20->_modTimeInSeconds = (NSNumber *)v36;

    v41 = objc_msgSend_copy(v16, v38, v39, v40);
    fileSize = v20->_fileSize;
    v20->_fileSize = (NSNumber *)v41;

  }
  return v20;
}

- (CKFileMetadata)initWithFileSize:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKFileMetadata *v8;
  uint64_t v9;
  NSNumber *fileSize;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKFileMetadata;
  v8 = -[CKFileMetadata init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    fileSize = v8->_fileSize;
    v8->_fileSize = (NSNumber *)v9;

  }
  return v8;
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
  id v30;

  v30 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_deviceID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v30, v9, (uint64_t)v8, (uint64_t)CFSTR("DeviceID"));

  objc_msgSend_fileID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v30, v14, (uint64_t)v13, (uint64_t)CFSTR("FileID"));

  objc_msgSend_generationID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v30, v19, (uint64_t)v18, (uint64_t)CFSTR("GenerationID"));

  objc_msgSend_modTimeInSeconds(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v30, v24, (uint64_t)v23, (uint64_t)CFSTR("ModTimeInSeconds"));

  objc_msgSend_fileSize(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v30, v29, (uint64_t)v28, (uint64_t)CFSTR("FileSize"));

  objc_autoreleasePoolPop(v4);
}

- (CKFileMetadata)initWithCoder:(id)a3
{
  id v4;
  CKFileMetadata *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSNumber *deviceID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSNumber *fileID;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSNumber *generationID;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSNumber *modTimeInSeconds;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSNumber *fileSize;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CKFileMetadata;
  v5 = -[CKFileMetadata init](&v28, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("DeviceID"));
    v9 = objc_claimAutoreleasedReturnValue();
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSNumber *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("FileID"));
    v13 = objc_claimAutoreleasedReturnValue();
    fileID = v5->_fileID;
    v5->_fileID = (NSNumber *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("GenerationID"));
    v17 = objc_claimAutoreleasedReturnValue();
    generationID = v5->_generationID;
    v5->_generationID = (NSNumber *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("ModTimeInSeconds"));
    v21 = objc_claimAutoreleasedReturnValue();
    modTimeInSeconds = v5->_modTimeInSeconds;
    v5->_modTimeInSeconds = (NSNumber *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("FileSize"));
    v25 = objc_claimAutoreleasedReturnValue();
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v25;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
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

- (NSNumber)modTimeInSeconds
{
  return self->_modTimeInSeconds;
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_modTimeInSeconds, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_fileID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
