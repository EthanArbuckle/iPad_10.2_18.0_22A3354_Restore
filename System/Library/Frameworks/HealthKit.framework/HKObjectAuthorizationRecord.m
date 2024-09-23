@implementation HKObjectAuthorizationRecord

- (HKObjectAuthorizationRecord)init
{
  HKObjectAuthorizationRecord *v2;
  HKObjectAuthorizationRecord *v3;
  NSUUID *objectUUID;
  NSUUID *sourceUUID;
  NSUUID *sessionUUID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKObjectAuthorizationRecord;
  v2 = -[HKObjectAuthorizationRecord init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objectUUID = v2->_objectUUID;
    v2->_objectUUID = 0;

    sourceUUID = v3->_sourceUUID;
    v3->_sourceUUID = 0;

    sessionUUID = v3->_sessionUUID;
    v3->_sessionUUID = 0;

    v3->_status = 0;
    v3->_modificationDate = CFAbsoluteTimeGetCurrent();
  }
  return v3;
}

- (HKObjectAuthorizationRecord)initWithObjectUUID:(id)a3 sourceUUID:(id)a4 sessionUUID:(id)a5 status:(int64_t)a6 modificationDate:(double)a7
{
  id v13;
  id v14;
  id v15;
  HKObjectAuthorizationRecord *v16;
  HKObjectAuthorizationRecord *v17;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = -[HKObjectAuthorizationRecord init](self, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_objectUUID, a3);
    objc_storeStrong((id *)&v17->_sourceUUID, a4);
    objc_storeStrong((id *)&v17->_sessionUUID, a5);
    v17->_status = a6;
    v17->_modificationDate = a7;
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t status;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_objectUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_sourceUUID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_sessionUUID, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_modificationDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<Object: %@ Source: %@ Session: %@ Status: %ld Mod: %@>"), v4, v5, v6, status, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSUUID hash](self->_sourceUUID, "hash");
  v4 = -[NSUUID hash](self->_objectUUID, "hash") ^ v3;
  return v4 ^ -[NSUUID hash](self->_sessionUUID, "hash") ^ self->_status ^ (unint64_t)self->_modificationDate;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  NSUUID *sourceUUID;
  NSUUID *v6;
  NSUUID *objectUUID;
  NSUUID *v8;
  NSUUID *sessionUUID;
  NSUUID *v10;
  BOOL v11;

  v4 = (double *)a3;
  objc_opt_class();
  v11 = (objc_opt_isKindOfClass() & 1) != 0
     && ((sourceUUID = self->_sourceUUID, v6 = (NSUUID *)*((_QWORD *)v4 + 2), sourceUUID == v6)
      || v6 && -[NSUUID isEqual:](sourceUUID, "isEqual:"))
     && ((objectUUID = self->_objectUUID, v8 = (NSUUID *)*((_QWORD *)v4 + 1), objectUUID == v8)
      || v8 && -[NSUUID isEqual:](objectUUID, "isEqual:"))
     && ((sessionUUID = self->_sessionUUID, v10 = (NSUUID *)*((_QWORD *)v4 + 3), sessionUUID == v10)
      || v10 && -[NSUUID isEqual:](sessionUUID, "isEqual:"))
     && self->_status == *((_QWORD *)v4 + 4)
     && self->_modificationDate == v4[5];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKObjectAuthorizationRecord)initWithCoder:(id)a3
{
  id v4;
  HKObjectAuthorizationRecord *v5;
  double v6;
  uint64_t v7;
  NSUUID *sourceUUID;
  uint64_t v9;
  NSUUID *objectUUID;
  uint64_t v11;
  NSUUID *sessionUUID;
  unint64_t v13;
  HKObjectAuthorizationRecord *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSUUID *v18;
  NSUUID *v19;
  id v20;
  void *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  NSUUID *v27;
  __int16 v28;
  NSUUID *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKObjectAuthorizationRecord;
  v5 = -[HKObjectAuthorizationRecord init](&v23, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mod"));
  v5->_modificationDate = v6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
  v7 = objc_claimAutoreleasedReturnValue();
  sourceUUID = v5->_sourceUUID;
  v5->_sourceUUID = (NSUUID *)v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("oid"));
  v9 = objc_claimAutoreleasedReturnValue();
  objectUUID = v5->_objectUUID;
  v5->_objectUUID = (NSUUID *)v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionid"));
  v11 = objc_claimAutoreleasedReturnValue();
  sessionUUID = v5->_sessionUUID;
  v5->_sessionUUID = (NSUUID *)v11;

  if (!v5->_sourceUUID || !v5->_objectUUID)
  {
    _HKInitializeLogging();
    v15 = (void *)HKLogDatabase;
    if (os_log_type_enabled((os_log_t)HKLogDatabase, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = (void *)objc_opt_class();
      v19 = v5->_objectUUID;
      v18 = v5->_sourceUUID;
      *(_DWORD *)buf = 138543874;
      v25 = v17;
      v26 = 2114;
      v27 = v18;
      v28 = 2114;
      v29 = v19;
      v20 = v17;
      _os_log_error_impl(&dword_19A0E6000, v16, OS_LOG_TYPE_ERROR, "Decoded %{public}@ has incomplete source and object IDs: %{public}@, %{public}@", buf, 0x20u);

    }
    goto LABEL_10;
  }
  v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stat"));
  v5->_status = v13;
  if (v13 >= 3)
  {
    _HKInitializeLogging();
    v21 = (void *)HKLogDatabase;
    if (os_log_type_enabled((os_log_t)HKLogDatabase, OS_LOG_TYPE_ERROR))
      -[HKObjectAuthorizationRecord initWithCoder:].cold.1(v21, (uint64_t)v5, &v5->_status);
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
LABEL_5:
  v14 = v5;
LABEL_11:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sourceUUID;
  id v5;

  sourceUUID = self->_sourceUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceUUID, CFSTR("sid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objectUUID, CFSTR("oid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionUUID, CFSTR("sessionid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("stat"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("mod"), self->_modificationDate);

}

- (NSUUID)objectUUID
{
  return self->_objectUUID;
}

- (void)setObjectUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSUUID)sourceUUID
{
  return self->_sourceUUID;
}

- (void)setSourceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(double)a3
{
  self->_modificationDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_objectUUID, 0);
}

- (void)initWithCoder:(uint64_t *)a3 .cold.1(void *a1, uint64_t a2, uint64_t *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = (void *)objc_opt_class();
  v6 = *a3;
  v8 = 138543618;
  v9 = v5;
  v10 = 2048;
  v11 = v6;
  v7 = v5;
  _os_log_error_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_ERROR, "Decoded %{public}@ has invalid authorization status: %ld", (uint8_t *)&v8, 0x16u);

}

@end
