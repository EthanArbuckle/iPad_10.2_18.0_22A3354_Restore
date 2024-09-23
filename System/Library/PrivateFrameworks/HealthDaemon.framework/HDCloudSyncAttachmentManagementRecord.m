@implementation HDCloudSyncAttachmentManagementRecord

- (id)initInZoneID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDCloudSyncAttachmentManagementRecord *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDForZoneID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("AttachmentManagementRecord"), v5);
  v7 = -[HDCloudSyncAttachmentManagementRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v6, 1);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCodableAttachmentManagementRecord setUuid:](v7->_underlyingAttachmentManagementRecord, "setUuid:", v9);

  }
  return v7;
}

- (HDCloudSyncAttachmentManagementRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncAttachmentManagementRecord *v4;
  HDCloudSyncAttachmentManagementRecord *v5;
  void *v6;
  HDCloudSyncCodableAttachmentManagementRecord *v7;
  HDCloudSyncCodableAttachmentManagementRecord *v8;
  NSObject *v9;
  HDCloudSyncAttachmentManagementRecord *v10;
  HDCloudSyncCodableAttachmentManagementRecord *v11;
  HDCloudSyncCodableAttachmentManagementRecord *underlyingAttachmentManagementRecord;
  __int16 v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncAttachmentManagementRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v15, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableAttachmentManagementRecord);
    underlyingAttachmentManagementRecord = v5->_underlyingAttachmentManagementRecord;
    v5->_underlyingAttachmentManagementRecord = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableAttachmentManagementRecord initWithData:]([HDCloudSyncCodableAttachmentManagementRecord alloc], "initWithData:", v6);
  v8 = v5->_underlyingAttachmentManagementRecord;
  v5->_underlyingAttachmentManagementRecord = v7;

  if (v5->_underlyingAttachmentManagementRecord)
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
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying attachment management message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordIDForZoneID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), CFSTR("AttachmentManagement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", v5, v4);

  return v6;
}

+ (BOOL)isAttachmentManagementRecordID:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AttachmentManagement"));

  return v4;
}

+ (BOOL)isAttachmentManagementRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AttachmentManagementRecord"));

  return v4;
}

- (NSUUID)UUID
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HDCloudSyncCodableAttachmentManagementRecord uuid](self->_underlyingAttachmentManagementRecord, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("AttachmentManagementRecord");
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
  return (id)-[HDCloudSyncCodableAttachmentManagementRecord data](self->_underlyingAttachmentManagementRecord, "data");
}

- (id)printDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncAttachmentManagementRecord UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("+ UUID: %@\n+--------------------------------------------------"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAttachmentManagementRecord, 0);
}

@end
