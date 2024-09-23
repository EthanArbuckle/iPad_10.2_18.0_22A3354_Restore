@implementation HDCloudSyncAttachmentReferenceRecord

- (HDCloudSyncAttachmentReferenceRecord)initWithAttachmentReference:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDCloudSyncAttachmentReferenceRecord *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordIDForReferenceIdentifier:zoneID:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncAttachmentReferenceRecord"), v11);
  v13 = -[HDCloudSyncAttachmentReferenceRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v12, 1);
  if (v13)
  {
    objc_msgSend(v6, "objectIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableAttachmentReference setObjectIdentifier:](v13->_underlyingReference, "setObjectIdentifier:", v14);

    objc_msgSend(v6, "schemaIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableAttachmentReference setSchemaIdentifier:](v13->_underlyingReference, "setSchemaIdentifier:", v15);

    -[HDCloudSyncCodableAttachmentReference setSchemaVersion:](v13->_underlyingReference, "setSchemaVersion:", objc_msgSend(v6, "schemaVersion"));
    objc_msgSend(v6, "attachmentIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableAttachmentReference setAttachmentIdentifier:](v13->_underlyingReference, "setAttachmentIdentifier:", v17);

    -[HDCloudSyncCodableAttachmentReference setType:](v13->_underlyingReference, "setType:", objc_msgSend(v6, "type"));
    objc_msgSend(v6, "creationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    -[HDCloudSyncCodableAttachmentReference setCreationDate:](v13->_underlyingReference, "setCreationDate:");

    -[HDCloudSyncCodableAttachmentReference setOptions:](v13->_underlyingReference, "setOptions:", objc_msgSend(v6, "options"));
    objc_msgSend(v6, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_codableMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableAttachmentReference setMetadata:](v13->_underlyingReference, "setMetadata:", v21);

  }
  return v13;
}

- (HDCloudSyncAttachmentReferenceRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncAttachmentReferenceRecord *v4;
  HDCloudSyncAttachmentReferenceRecord *v5;
  void *v6;
  HDCloudSyncCodableAttachmentReference *v7;
  HDCloudSyncCodableAttachmentReference *v8;
  NSObject *v9;
  HDCloudSyncAttachmentReferenceRecord *v10;
  HDCloudSyncCodableAttachmentReference *v11;
  HDCloudSyncCodableAttachmentReference *underlyingReference;
  __int16 v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncAttachmentReferenceRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v15, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableAttachmentReference);
    underlyingReference = v5->_underlyingReference;
    v5->_underlyingReference = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableAttachmentReference initWithData:]([HDCloudSyncCodableAttachmentReference alloc], "initWithData:", v6);
  v8 = v5->_underlyingReference;
  v5->_underlyingReference = v7;

  if (v5->_underlyingReference)
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
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying reference message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordIDForReferenceIdentifier:(id)a3 zoneID:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("CloudSyncAttachmentReference"), CFSTR("/"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v7, v6);

  return v8;
}

+ (BOOL)isAttachmentReferenceRecordID:(id)a3
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
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("CloudSyncAttachmentReference"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isAttachmentReferenceRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncAttachmentReferenceRecord"));

  return v4;
}

- (HDAttachmentReference)attachmentReference
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  HDAttachmentReferenceSchemaIdentifier *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HDAttachmentReferenceSchemaIdentifier *v12;
  HDAttachmentReference *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  HDAttachmentReference *v21;

  v3 = -[HDCloudSyncCodableAttachmentReference schemaVersion](self->_underlyingReference, "schemaVersion");
  v4 = -[HDCloudSyncCodableAttachmentReference type](self->_underlyingReference, "type");
  if (v3 <= 1)
    v5 = 1;
  else
    v5 = v3;
  if (!v4)
    v3 = v5;
  v6 = [HDAttachmentReferenceSchemaIdentifier alloc];
  -[HDCloudSyncCodableAttachmentReference schemaIdentifier](self->_underlyingReference, "schemaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachmentReference objectIdentifier](self->_underlyingReference, "objectIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HDCloudSyncCodableAttachmentReference attachmentIdentifier](self->_underlyingReference, "attachmentIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
  v12 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:](v6, "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", v7, v3, v8, v11);

  v13 = [HDAttachmentReference alloc];
  v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HDCloudSyncAttachmentReferenceRecord referenceIdentifier](self, "referenceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);
  -[HDCloudSyncCodableAttachmentReference creationDate](self->_underlyingReference, "creationDate");
  HDDecodeDateForValue();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HDCloudSyncCodableAttachmentReference options](self->_underlyingReference, "options");
  -[HDCloudSyncCodableAttachmentReference metadata](self->_underlyingReference, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableMetadataDictionary decodeMetadataFromData:](HDCodableMetadataDictionary, "decodeMetadataFromData:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:](v13, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:", v16, v12, v17, v18, v20, -[HDCloudSyncCodableAttachmentReference type](self->_underlyingReference, "type"), 1);

  return v21;
}

- (NSString)referenceIdentifier
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

- (NSString)attachmentIdentifier
{
  return -[HDCloudSyncCodableAttachmentReference attachmentIdentifier](self->_underlyingReference, "attachmentIdentifier");
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("CloudSyncAttachmentReferenceRecord");
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
  return (id)-[HDCloudSyncCodableAttachmentReference data](self->_underlyingReference, "data");
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
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncAttachmentReferenceRecord referenceIdentifier](self, "referenceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachmentReference objectIdentifier](self->_underlyingReference, "objectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachmentReference schemaIdentifier](self->_underlyingReference, "schemaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDCloudSyncCodableAttachmentReference schemaVersion](self->_underlyingReference, "schemaVersion");
  -[HDCloudSyncCodableAttachmentReference attachmentIdentifier](self->_underlyingReference, "attachmentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDCloudSyncCodableAttachmentReference type](self->_underlyingReference, "type");
  -[HDCloudSyncCodableAttachmentReference creationDate](self->_underlyingReference, "creationDate");
  HDDecodeDateForValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("+ Identifier: %@\n+ Object Identifier: %@\n+ Schema Identifier: %@\n+ Schema Version: %lld\n+ Attachment Identifier: %@\n+ Type: %lld\n+ Creation date: %@\n+--------------------------------------------------"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingReference, 0);
}

@end
