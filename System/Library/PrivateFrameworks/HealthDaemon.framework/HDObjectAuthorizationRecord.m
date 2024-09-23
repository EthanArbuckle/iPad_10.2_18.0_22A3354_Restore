@implementation HDObjectAuthorizationRecord

- (HDObjectAuthorizationRecord)init
{
  HDObjectAuthorizationRecord *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDObjectAuthorizationRecord;
  result = -[HDObjectAuthorizationRecord init](&v3, sel_init);
  if (result)
    result->_status = 0;
  return result;
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

- (HDObjectAuthorizationRecord)initWithCoder:(id)a3
{
  id v4;
  HDObjectAuthorizationRecord *v5;
  double v6;
  uint64_t v7;
  NSUUID *sourceUUID;
  uint64_t v9;
  NSUUID *objectUUID;
  uint64_t v11;
  NSUUID *sessionUUID;
  unint64_t v13;
  HDObjectAuthorizationRecord *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSUUID *v18;
  NSUUID *v19;
  id v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  void *v24;
  void *v25;
  int64_t status;
  objc_super v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  NSUUID *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HDObjectAuthorizationRecord;
  v5 = -[HDObjectAuthorizationRecord init](&v28, sel_init);
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
    v15 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      v17 = (void *)objc_opt_class();
      v19 = v5->_objectUUID;
      v18 = v5->_sourceUUID;
      *(_DWORD *)buf = 138543874;
      v30 = v17;
      v31 = 2114;
      v32 = (int64_t)v18;
      v33 = 2114;
      v34 = v19;
      v20 = v17;
      v21 = "Decoded %{public}@ has incomplete source and object IDs: %{public}@, %{public}@";
      v22 = v16;
      v23 = 32;
LABEL_10:
      _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);

    }
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stat"));
  v5->_status = v13;
  if (v13 >= 3)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v16 = v24;
      v25 = (void *)objc_opt_class();
      status = v5->_status;
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      v31 = 2048;
      v32 = status;
      v20 = v25;
      v21 = "Decoded %{public}@ has invalid authorization status: %ld";
      v22 = v16;
      v23 = 22;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
LABEL_5:
  v14 = v5;
LABEL_12:

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

@end
