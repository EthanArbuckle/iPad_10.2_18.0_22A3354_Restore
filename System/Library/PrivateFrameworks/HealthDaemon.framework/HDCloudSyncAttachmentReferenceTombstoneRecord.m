@implementation HDCloudSyncAttachmentReferenceTombstoneRecord

- (HDCloudSyncAttachmentReferenceTombstoneRecord)initWithOwnerIdentifier:(id)a3 recordIndex:(int64_t)a4 zoneID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HDCloudSyncAttachmentReferenceTombstoneRecord *v12;

  v8 = a5;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDForOwnerIdentifier:recordIndex:zoneID:", v9, a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncReferenceTombstoneRecord"), v10);
  v12 = -[HDCloudSyncAttachmentReferenceTombstoneRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v11, 1);

  return v12;
}

- (HDCloudSyncAttachmentReferenceTombstoneRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncAttachmentReferenceTombstoneRecord *v4;
  HDCloudSyncAttachmentReferenceTombstoneRecord *v5;
  void *v6;
  HDCloudSyncCodableAttachmentReferenceTombstones *v7;
  HDCloudSyncCodableAttachmentReferenceTombstones *v8;
  NSObject *v9;
  HDCloudSyncAttachmentReferenceTombstoneRecord *v10;
  HDCloudSyncCodableAttachmentReferenceTombstones *v11;
  HDCloudSyncCodableAttachmentReferenceTombstones *underlyingReferenceTombstones;
  __int16 v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncAttachmentReferenceTombstoneRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v15, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableAttachmentReferenceTombstones);
    underlyingReferenceTombstones = v5->_underlyingReferenceTombstones;
    v5->_underlyingReferenceTombstones = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableAttachmentReferenceTombstones initWithData:]([HDCloudSyncCodableAttachmentReferenceTombstones alloc], "initWithData:", v6);
  v8 = v5->_underlyingReferenceTombstones;
  v5->_underlyingReferenceTombstones = v7;

  if (v5->_underlyingReferenceTombstones)
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

+ (id)recordIDForOwnerIdentifier:(id)a3 recordIndex:(int64_t)a4 zoneID:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@%@%@%lld"), CFSTR("CloudSyncReferenceTombstone"), CFSTR("/"), a3, CFSTR("/"), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v9, v8);

  return v10;
}

+ (BOOL)isAttachmentReferenceTombstoneRecordID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 3)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("CloudSyncReferenceTombstone"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isAttachmentReferenceTombstoneRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncReferenceTombstoneRecord"));

  return v4;
}

- (NSString)ownerIdentifier
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

- (int64_t)recordIndex
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[HDCloudSyncRecord record](self, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (int64_t)attachmentReferenceTombstoneCount
{
  void *v2;
  int64_t v3;

  -[HDCloudSyncCodableAttachmentReferenceTombstones attachmentReferenceTombstones](self->_underlyingReferenceTombstones, "attachmentReferenceTombstones");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSArray)attachmentReferenceTombstones
{
  void *v2;
  void *v3;

  -[HDCloudSyncCodableAttachmentReferenceTombstones attachmentReferenceTombstones](self->_underlyingReferenceTombstones, "attachmentReferenceTombstones");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_159);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

HDAttachmentReference *__78__HDCloudSyncAttachmentReferenceTombstoneRecord_attachmentReferenceTombstones__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDAttachmentReference *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDAttachmentReference *v9;

  v2 = a2;
  v3 = [HDAttachmentReference alloc];
  v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v2, "referenceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);
  +[HDAttachmentReferenceSchemaIdentifier tombstoneSchemaIdentifier](HDAttachmentReferenceSchemaIdentifier, "tombstoneSchemaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creationDate");

  HDDecodeDateForValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:](v3, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:", v6, v7, v8, 0, 0, 1, 1);

  return v9;
}

- (void)addAttachmentReferenceTombstone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDCloudSyncCodableAttachmentReferenceTombstone *v9;

  v4 = a3;
  v9 = objc_alloc_init(HDCloudSyncCodableAttachmentReferenceTombstone);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachmentReferenceTombstone setReferenceIdentifier:](v9, "setReferenceIdentifier:", v6);

  objc_msgSend(v4, "schemaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachmentReferenceTombstone setSchemaIdentifier:](v9, "setSchemaIdentifier:", v7);

  objc_msgSend(v4, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  -[HDCloudSyncCodableAttachmentReferenceTombstone setCreationDate:](v9, "setCreationDate:");

  -[HDCloudSyncCodableAttachmentReferenceTombstones addAttachmentReferenceTombstone:](self->_underlyingReferenceTombstones, "addAttachmentReferenceTombstone:", v9);
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("CloudSyncReferenceTombstoneRecord");
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
  return (id)-[HDCloudSyncCodableAttachmentReferenceTombstones data](self->_underlyingReferenceTombstones, "data");
}

+ (BOOL)shouldSerializeUnderlyingMessageAsProtected
{
  return 1;
}

- (id)printDescription
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HDCloudSyncAttachmentReferenceTombstoneRecord attachmentReferenceTombstones](self, "attachmentReferenceTombstones");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "schemaIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "creationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("| Reference Identifier: %@| Schema Identifier: %@| Creation Date: %@"), v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "appendString:", v14);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+ Tombstones: %@\n+--------------------------------------------------"), v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingReferenceTombstones, 0);
}

@end
