@implementation HDCloudSyncAttachmentRecord

+ (id)recordWithAttachment:(id)a3 fileHandle:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  HDCloudSyncAttachmentRecord *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id *v37;
  id *v39;
  id v40;
  uint8_t buf[4];
  id *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [HDCloudSyncAttachmentRecord alloc];
  v13 = v11;
  v14 = v10;
  if (!v12)
  {
    v37 = 0;
    goto LABEL_16;
  }
  v15 = v9;
  v16 = (void *)objc_opt_class();
  objc_msgSend(v13, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "recordIDForAttachmentIdentifier:zoneID:", v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncAttachmentRecord"), v19);
  objc_msgSend(v13, "encryptionKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(v13, "encryptionKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v24 = -[HDCloudSyncAttachmentRecord initWithCKRecord:schemaVersion:](v12, "initWithCKRecord:schemaVersion:", v20, 1);
  if (v24)
  {
    v39 = a6;
    objc_msgSend(v13, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24[3], "setFileName:", v25);

    objc_msgSend(v24[3], "setFileSize:", objc_msgSend(v13, "size"));
    objc_msgSend(v13, "type");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24[3], "setMimeType:", v26);

    objc_msgSend(v13, "fileHash");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24[3], "setFileHash:", v27);

    objc_msgSend(v13, "creationDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    objc_msgSend(v24[3], "setCreationDate:");

    objc_msgSend(v13, "metadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hk_codableMetadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "data");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24[3], "setMetadata:", v31);

    objc_msgSend(v24[3], "setEncryptionKey:", v21);
    if ((unint64_t)objc_msgSend(v13, "size") > 0x61A8)
    {
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithFileDescriptor:", objc_msgSend(v14, "fileDescriptor"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v36, CFSTR("CloudSyncAttachmentAsset"));

    }
    else
    {
      v40 = 0;
      objc_msgSend(v14, "readDataToEndOfFileAndReturnError:", &v40);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v40;
      v34 = v33;
      if (!v32 && v33)
      {
        _HKInitializeLogging();
        v35 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v42 = v24;
          v43 = 2114;
          v44 = v34;
          _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Failed to read data from file handle to set asset data, %{public}@", buf, 0x16u);
        }
        if (v39)
          *v39 = objc_retainAutorelease(v34);
        else
          _HKLogDroppedError();

        v37 = 0;
        goto LABEL_15;
      }
      objc_msgSend(v24[3], "setAssetData:", v32);

    }
  }
  v37 = v24;
LABEL_15:

LABEL_16:
  return v37;
}

- (HDCloudSyncAttachmentRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncAttachmentRecord *v4;
  HDCloudSyncAttachmentRecord *v5;
  void *v6;
  HDCloudSyncCodableAttachment *v7;
  HDCloudSyncCodableAttachment *v8;
  NSObject *v9;
  HDCloudSyncAttachmentRecord *v10;
  HDCloudSyncCodableAttachment *v11;
  HDCloudSyncCodableAttachment *underlyingAttachment;
  __int16 v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncAttachmentRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v15, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableAttachment);
    underlyingAttachment = v5->_underlyingAttachment;
    v5->_underlyingAttachment = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableAttachment initWithData:]([HDCloudSyncCodableAttachment alloc], "initWithData:", v6);
  v8 = v5->_underlyingAttachment;
  v5->_underlyingAttachment = v7;

  if (v5->_underlyingAttachment)
  {
LABEL_8:

LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
  {
    v14[0] = 0;
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying attachment message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordIDForAttachmentIdentifier:(id)a3 zoneID:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("CloudSyncAttachment"), CFSTR("/"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v7, v6);

  return v8;
}

+ (BOOL)isAttachmentRecordID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("CloudSyncAttachment"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isAttachmentRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncAttachmentRecord"));

  return v4;
}

+ (id)attachmentIdentifierForRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(a1, "isAttachmentRecordID:", v4))
  {
    objc_msgSend(v4, "recordName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)attachmentIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HDCloudSyncRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (HDAttachment)attachment
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  HDAttachment *v19;
  HDAttachment *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  HDCloudSyncAttachmentRecord *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncCodableAttachment encryptionKey](self->_underlyingAttachment, "encryptionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    -[HDCloudSyncCodableAttachment encryptionKey](self->_underlyingAttachment, "encryptionKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v6, &v24);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v24;

    if (!v7)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2114;
        v28 = v8;
        _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Unable to decode encryption key: %{public}@", buf, 0x16u);
      }
    }

    v23 = (void *)v7;
  }
  else
  {
    v23 = 0;
  }
  v21 = [HDAttachment alloc];
  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HDCloudSyncAttachmentRecord attachmentIdentifier](self, "attachmentIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "initWithUUIDString:", v22);
  -[HDCloudSyncCodableAttachment fileName](self->_underlyingAttachment, "fileName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachment mimeType](self->_underlyingAttachment, "mimeType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachment fileHash](self->_underlyingAttachment, "fileHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HDCloudSyncCodableAttachment fileSize](self->_underlyingAttachment, "fileSize");
  -[HDCloudSyncCodableAttachment creationDate](self->_underlyingAttachment, "creationDate");
  HDDecodeDateForValue();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachment metadata](self->_underlyingAttachment, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDAttachment initWithIdentifier:name:type:hash:size:creationDate:metadata:encryptionKey:](v21, "initWithIdentifier:name:type:hash:size:creationDate:metadata:encryptionKey:", v11, v12, v13, v14, v15, v16, v18, v23);

  return v19;
}

- (BOOL)hasAssetData
{
  return -[HDCloudSyncCodableAttachment hasAssetData](self->_underlyingAttachment, "hasAssetData");
}

- (NSData)assetData
{
  return -[HDCloudSyncCodableAttachment assetData](self->_underlyingAttachment, "assetData");
}

- (NSURL)assetURL
{
  void *v2;
  void *v3;
  void *v4;

  -[HDCloudSyncRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CloudSyncAttachmentAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (int64_t)fileSize
{
  return -[HDCloudSyncCodableAttachment fileSize](self->_underlyingAttachment, "fileSize");
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("CloudSyncAttachmentRecord");
}

+ (BOOL)hasFutureSchema:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v3 && objc_msgSend(v3, "integerValue") > 1;

  return v5;
}

- (id)serializeUnderlyingMessage
{
  return (id)-[HDCloudSyncCodableAttachment data](self->_underlyingAttachment, "data");
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncAttachmentRecord attachmentIdentifier](self, "attachmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachment fileName](self->_underlyingAttachment, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDCloudSyncCodableAttachment fileSize](self->_underlyingAttachment, "fileSize");
  -[HDCloudSyncCodableAttachment mimeType](self->_underlyingAttachment, "mimeType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachment fileHash](self->_underlyingAttachment, "fileHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachment creationDate](self->_underlyingAttachment, "creationDate");
  HDDecodeDateForValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("+ Identifier: %@\n+ File name: %@\n+ File size: %lld\n+ Mime type: %@\n+ File hash: %@\n+ Creation date: %@\n+--------------------------------------------------"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)unitTest_setFileURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0C94BB8];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithFileURL:", v5);

  -[HDCloudSyncRecord record](self, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("CloudSyncAttachmentAsset"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAttachment, 0);
}

@end
