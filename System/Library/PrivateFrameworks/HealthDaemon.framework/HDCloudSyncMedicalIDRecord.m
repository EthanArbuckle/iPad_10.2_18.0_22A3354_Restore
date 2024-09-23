@implementation HDCloudSyncMedicalIDRecord

- (id)initInSyncCircle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDCloudSyncMedicalIDRecord *v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C95098], "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "recordIDWithZoneID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncMedicalIDRecord"), v7);
  v9 = -[HDCloudSyncMedicalIDRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v8, 1);

  return v9;
}

- (id)initInZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDCloudSyncMedicalIDRecord *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "recordIDWithZoneID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("CloudSyncMedicalIDRecord"), v5);
  v7 = -[HDCloudSyncMedicalIDRecord initWithCKRecord:schemaVersion:](self, "initWithCKRecord:schemaVersion:", v6, 1);

  return v7;
}

- (HDCloudSyncMedicalIDRecord)initWithCKRecord:(id)a3 schemaVersion:(int64_t)a4
{
  HDCloudSyncMedicalIDRecord *v4;
  HDCloudSyncMedicalIDRecord *v5;
  void *v6;
  HDCloudSyncCodableMedicalID *v7;
  HDCloudSyncCodableMedicalID *v8;
  NSObject *v9;
  HDCloudSyncMedicalIDRecord *v10;
  HDCloudSyncCodableMedicalID *v11;
  HDCloudSyncCodableMedicalID *underlyingCodableMedicalIDMessage;
  __int16 v14[8];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDCloudSyncMedicalIDRecord;
  v4 = -[HDCloudSyncRecord initWithCKRecord:schemaVersion:](&v15, sel_initWithCKRecord_schemaVersion_, a3, a4);
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  -[HDCloudSyncRecord underlyingMessage](v4, "underlyingMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = objc_alloc_init(HDCloudSyncCodableMedicalID);
    underlyingCodableMedicalIDMessage = v5->_underlyingCodableMedicalIDMessage;
    v5->_underlyingCodableMedicalIDMessage = v11;

    goto LABEL_8;
  }
  v7 = -[HDCloudSyncCodableMedicalID initWithData:]([HDCloudSyncCodableMedicalID alloc], "initWithData:", v6);
  v8 = v5->_underlyingCodableMedicalIDMessage;
  v5->_underlyingCodableMedicalIDMessage = v7;

  if (v5->_underlyingCodableMedicalIDMessage)
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
    _os_log_fault_impl(&dword_1B7802000, v9, OS_LOG_TYPE_FAULT, "Failed to decode underlying Medical ID message.", (uint8_t *)v14, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

+ (id)recordIDWithZoneID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0C95070];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRecordName:zoneID:", CFSTR("CloudSyncMedicalID"), v4);

  return v5;
}

+ (BOOL)isMedicalIDRecord:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncMedicalIDRecord"));

  return v4;
}

- (void)setMedicalIDData:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[HDCloudSyncCodableMedicalID setMedicalIDData:](self->_underlyingCodableMedicalIDMessage, "setMedicalIDData:", v4);

}

- (HDCodableMedicalIDData)medicalIDData
{
  return -[HDCloudSyncCodableMedicalID medicalIDData](self->_underlyingCodableMedicalIDMessage, "medicalIDData");
}

- (NSArray)medicalIDLogs
{
  void *v2;
  void *v3;

  -[HDCloudSyncCodableMedicalID medicalIDLogs](self->_underlyingCodableMedicalIDMessage, "medicalIDLogs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addMedicalIDEvent:(id)a3
{
  HDCloudSyncCodableMedicalID *underlyingCodableMedicalIDMessage;
  id v5;
  HDCloudSyncCodableLog *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  underlyingCodableMedicalIDMessage = self->_underlyingCodableMedicalIDMessage;
  v5 = a3;
  -[HDCloudSyncCodableMedicalID medicalIDLogs](underlyingCodableMedicalIDMessage, "medicalIDLogs");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HDCloudSyncCodableLog);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  -[HDCloudSyncCodableLog setTimeStamp:](v6, "setTimeStamp:");

  v8 = (void *)objc_msgSend(v5, "copy");
  -[HDCloudSyncCodableLog setEvent:](v6, "setEvent:", v8);

  if (v11)
  {
    if ((unint64_t)objc_msgSend(v11, "count") >= 5)
      objc_msgSend(v11, "removeObjectAtIndex:", 0);
    v9 = v11;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  v12 = v9;
  objc_msgSend(v9, "addObject:", v6);
  v10 = (void *)objc_msgSend(v12, "mutableCopy");
  -[HDCloudSyncCodableMedicalID setMedicalIDLogs:](self->_underlyingCodableMedicalIDMessage, "setMedicalIDLogs:", v10);

}

- (id)printDescription
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncMedicalIDRecord medicalIDData](self, "medicalIDData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateSaved");
  if (v5 == 0.0)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("| MedicalID Data Modified Date: %@"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HDCloudSyncMedicalIDRecord medicalIDData](self, "medicalIDData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateSaved");
    HDDecodeDateForValue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("| MedicalID Data Modified Date: %@"), v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n | MedicalID Log:\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HDCloudSyncMedicalIDRecord medicalIDLogs](self, "medicalIDLogs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "event");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeStamp");
        HDDecodeDateForValue();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("| Event: %@ | TimeStamp: %@"), v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "appendString:", v18);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+%@%@\n+--------------------------------------------------"), v21, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (BOOL)requiresUnderlyingMessage
{
  return 1;
}

+ (id)recordType
{
  return CFSTR("CloudSyncMedicalIDRecord");
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
  return (id)-[HDCloudSyncCodableMedicalID data](self->_underlyingCodableMedicalIDMessage, "data");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingCodableMedicalIDMessage, 0);
}

@end
