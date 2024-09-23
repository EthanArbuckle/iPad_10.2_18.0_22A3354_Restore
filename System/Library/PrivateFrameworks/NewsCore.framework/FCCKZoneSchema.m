@implementation FCCKZoneSchema

+ (id)zoneWithName:(uint64_t)a1
{
  id v2;
  id *v3;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C94A30])
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("use defaultZoneWithRecords: for the default zone"));
    v6 = 136315906;
    v7 = "+[FCCKZoneSchema zoneWithName:]";
    v8 = 2080;
    v9 = "FCCKZoneSchema.m";
    v10 = 1024;
    v11 = 16;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);

  }
  v3 = -[FCCKZoneSchema initWithZoneName:options:staticRecordNames:]((id *)[FCCKZoneSchema alloc], v2, 0, 0);

  return v3;
}

- (id)initWithZoneName:(char)a3 options:(void *)a4 staticRecordNames:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)FCCKZoneSchema;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      if ((a3 & 6) == 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("zone-wide PCS is required for the secure container"));
        *(_DWORD *)buf = 136315906;
        v19 = "-[FCCKZoneSchema initWithZoneName:options:staticRecordNames:]";
        v20 = 2080;
        v21 = "FCCKZoneSchema.m";
        v22 = 1024;
        v23 = 53;
        v24 = 2114;
        v25 = v16;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      objc_storeStrong(a1 + 2, a2);
      v10 = objc_alloc(MEMORY[0x1E0C95098]);
      v11 = objc_msgSend(v10, "initWithZoneName:ownerName:", v8, *MEMORY[0x1E0C94730]);
      v12 = a1[3];
      a1[3] = (id)v11;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = a1[4];
      a1[4] = (id)v13;

      *((_BYTE *)a1 + 8) = a3 & 1;
      *((_BYTE *)a1 + 9) = (a3 & 2) != 0;
      *((_BYTE *)a1 + 10) = (a3 & 4) != 0;
    }
  }

  return a1;
}

+ (id)zoneWithName:(char)a3 options:(void *)a4 staticRecordNames:
{
  id v6;
  id v7;
  id *v8;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  objc_opt_self();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C94A30])
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("use defaultZoneWithRecords: for the default zone"));
    v11 = 136315906;
    v12 = "+[FCCKZoneSchema zoneWithName:options:staticRecordNames:]";
    v13 = 2080;
    v14 = "FCCKZoneSchema.m";
    v15 = 1024;
    v16 = 27;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);

  }
  v8 = -[FCCKZoneSchema initWithZoneName:options:staticRecordNames:]((id *)[FCCKZoneSchema alloc], v6, a3, v7);

  return v8;
}

+ (id)defaultZoneWithStaticRecordNames:(int)a3 shouldUseSecureContainer:
{
  id v4;
  FCCKZoneSchema *v5;
  char v6;
  id *v7;

  v4 = a2;
  objc_opt_self();
  v5 = [FCCKZoneSchema alloc];
  if (a3)
    v6 = 6;
  else
    v6 = 0;
  v7 = -[FCCKZoneSchema initWithZoneName:options:staticRecordNames:]((id *)&v5->super.isa, (void *)*MEMORY[0x1E0C94A30], v6, v4);

  return v7;
}

- (FCCKZoneSchema)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCKZoneSchema init]";
    v9 = 2080;
    v10 = "FCCKZoneSchema.m";
    v11 = 1024;
    v12 = 44;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCCKZoneSchema init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BYTE *v7;
  _BYTE *v8;
  NSString *zoneName;
  uint64_t v10;
  NSString *v11;
  char v12;
  char shouldUseSecureContainer;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    v12 = 0;
    goto LABEL_16;
  }
  v7 = v6;
  v8 = v7;
  if (self)
    zoneName = self->_zoneName;
  else
    zoneName = 0;
  v10 = *((_QWORD *)v7 + 2);
  v11 = zoneName;
  if (!-[NSString isEqualToString:](v11, "isEqualToString:", v10))
    goto LABEL_13;
  if (self)
  {
    if (self->_shouldEncryptRecordNames != (v8[8] != 0) || self->_shouldUseZoneWidePCS != (v8[9] != 0))
      goto LABEL_13;
    shouldUseSecureContainer = self->_shouldUseSecureContainer;
LABEL_18:
    v12 = shouldUseSecureContainer ^ (v8[10] == 0);
    goto LABEL_14;
  }
  shouldUseSecureContainer = v8[8];
  if (!shouldUseSecureContainer)
  {
    v12 = 0;
    if (v8[9])
      goto LABEL_14;
    goto LABEL_18;
  }
LABEL_13:
  v12 = 0;
LABEL_14:

LABEL_16:
  return v12;
}

- (unint64_t)hash
{
  FCCKZoneSchema *v2;
  unint64_t v3;
  _BOOL8 shouldEncryptRecordNames;
  void *v5;
  uint64_t v6;
  _BOOL8 shouldUseZoneWidePCS;
  void *v8;
  uint64_t v9;
  _BOOL8 shouldUseSecureContainer;
  void *v11;
  unint64_t v12;

  v2 = self;
  if (self)
    self = (FCCKZoneSchema *)self->_zoneName;
  v3 = -[FCCKZoneSchema hash](self, "hash");
  if (v2)
    shouldEncryptRecordNames = v2->_shouldEncryptRecordNames;
  else
    shouldEncryptRecordNames = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", shouldEncryptRecordNames);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  if (v2)
    shouldUseZoneWidePCS = v2->_shouldUseZoneWidePCS;
  else
    shouldUseZoneWidePCS = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", shouldUseZoneWidePCS);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  if (v2)
    shouldUseSecureContainer = v2->_shouldUseSecureContainer;
  else
    shouldUseSecureContainer = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", shouldUseSecureContainer);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6 ^ v3 ^ v9 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticRecordNames, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end
