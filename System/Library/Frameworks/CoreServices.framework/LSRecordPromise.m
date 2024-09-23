@implementation LSRecordPromise

+ (id)new
{
  abort();
}

- (LSRecordPromise)init
{
  abort();
}

- (LSRecordPromise)initWithRecord:(id)a3 error:(id *)a4
{
  LSRecordPromise *v7;
  void *v8;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSRecord.mm"), 795, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("record != nil"));

  }
  os_unfair_recursive_lock_lock_with_options();
  if (*((_QWORD *)a3 + 2))
  {
    v7 = -[LSRecordPromise _initWithRecord:](self, "_initWithRecord:", a3);
  }
  else
  {
    if (a4)
    {
      v12 = *MEMORY[0x1E0CB2938];
      v13[0] = CFSTR("provided record was not attached");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[LSRecordPromise initWithRecord:error:]", 800, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v7 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v7;
}

- (id)fulfillReturningError:(id *)a3
{
  _LSDatabase *v5;
  LaunchServices::Record *v6;
  NSObject *v7;
  _LSDServiceDomain *v8;
  NSData *pi;
  unsigned __int8 *v10;
  id v11;
  objc_class *SubclassForTable;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _LSDServiceDomain *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v24;
  uint8_t buf[16];
  void **v26;
  id v27;
  char v28;
  id v29;
  _LSDatabase *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = self->_db;
  v29 = 0;
  v30 = v5;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  if ((_LSSetLocalDatabaseIfNewer(self->_db) & 1) != 0)
  {
    v6 = (LaunchServices::Record *)&v30;
  }
  else
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "database in LSRecordPromise is out of date. Using current database.", buf, 2u);
    }

    +[_LSDServiceDomain defaultServiceDomain]();
    v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v6 = (LaunchServices::Record *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v8, 0);

    if (!v6)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v18 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v19 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v26, v18, 0);

      if (!v19)
      {
        v11 = v29;
        if (a3)
          goto LABEL_16;
        goto LABEL_18;
      }
      v11 = 0;
LABEL_15:
      if (a3)
      {
LABEL_16:
        v11 = objc_retainAutorelease(v11);
        v13 = 0;
        *a3 = v11;
        goto LABEL_19;
      }
LABEL_18:
      v13 = 0;
      goto LABEL_19;
    }
  }
  pi = self->_pi;
  v24 = 0;
  v10 = _LSCheckRecordPISizeAndVersionReturningPIInnerBytes(pi, &v24);
  v11 = v24;
  if (!v10)
    goto LABEL_15;
  SubclassForTable = (objc_class *)LaunchServices::Record::findSubclassForTable(v6, (LSContext *)*((unsigned int *)v10 + 2));
  if (!SubclassForTable)
  {
    v31 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bogus table %d"), *((unsigned int *)v10 + 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10810, (uint64_t)"-[LSRecordPromise fulfillReturningError:]", 839, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v17;
    if (!a3)
      goto LABEL_18;
    goto LABEL_16;
  }
  v13 = (void *)objc_msgSend([SubclassForTable alloc], "_initWithContext:persistentIdentifier:", v6, self->_pi);
  if (!v13)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[LSRecordPromise fulfillReturningError:]", 835, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v14;
    if (!a3)
      goto LABEL_18;
    goto LABEL_16;
  }
LABEL_19:
  v20 = v13;
  if (v26 && v28)
    _LSContextDestroy(v26);
  v21 = v27;
  v26 = 0;
  v27 = 0;

  v28 = 0;
  v22 = v29;
  v29 = 0;

  return v20;
}

- (id)_initWithRecord:(id)a3
{
  LSRecordPromise *v5;
  id v6;
  id *v7;
  id *v8;
  id v9;
  id v10;
  uint64_t v11;
  NSData *pi;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)LSRecordPromise;
  v5 = -[LSRecordPromise init](&v14, sel_init);
  if (v5)
  {
    v6 = a3;
    os_unfair_recursive_lock_lock_with_options();
    v7 = (id *)v6;
    v8 = v7;
    v9 = v7[2];
    if ((*((_BYTE *)v7 + 31) & 0x40) == 0 && !v9)
      __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v7, a2);
    if (v9)
    {
      CSStoreGetUnit();
      v10 = v8[2];
    }
    else
    {
      v10 = 0;
    }

    os_unfair_recursive_lock_unlock();
    objc_storeStrong((id *)&v5->_db, v10);
    objc_msgSend(v8, "persistentIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    pi = v5->_pi;
    v5->_pi = (NSData *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (LaunchServices::Record::checkForExfiltrationRisk((LaunchServices::Record *)a3, (NSCoder *)a2))
  {
    v8 = *MEMORY[0x1E0CB2938];
    v9[0] = CFSTR("This process may not encode instances of LSRecordPromise. This class is only for use by InstallCoordination.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[LSRecordPromise encodeWithCoder:]", 883, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "failWithError:", v6);

  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_db->store, CFSTR("store"));
    _LSDatabaseGetNode((uint64_t)self->_db);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "encodeObject:forKey:", v7, CFSTR("node"));

    objc_msgSend(a3, "encodeBool:forKey:", ((unint64_t)_LSDatabaseGetSessionKey((uint64_t)self->_db) >> 32) & 1, CFSTR("systemSession"));
    objc_msgSend(a3, "encodeInt64:forKey:", _LSDatabaseGetSessionKey((uint64_t)self->_db), CFSTR("userID"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_pi, CFSTR("persistentIdentifier"));
  }
}

- (LSRecordPromise)initWithCoder:(id)a3
{
  LSRecordPromise *v4;
  const void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id *v11;
  id v12;
  LSRecordPromise *result;
  void *v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)LSRecordPromise;
  v4 = -[LSRecordPromise init](&v16, sel_init);
  if (!v4)
    return 0;
  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", _CSStoreGetXPCClass(), CFSTR("store"));
  v5 = (const void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("node"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("userID"));
  if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("systemSession")))
    v8 = 0x100000000;
  else
    v8 = 0;
  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentIdentifier"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5 && v6 && v9)
  {
    v15 = 0;
    v11 = _LSDatabaseCreate(v6, (void *)(v8 & 0xFFFFFFFF00000000 | v7), v5, &v15);
    v12 = v15;
    if (v11)
    {
      objc_storeStrong((id *)&v4->_db, v11);
      objc_storeStrong((id *)&v4->_pi, v10);
    }
    else
    {
      objc_msgSend(a3, "failWithError:", v12);

      v4 = 0;
    }

    goto LABEL_15;
  }
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4865, (uint64_t)"-[LSRecordPromise initWithCoder:]", 917, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "failWithError:", v14);

  v4 = 0;
  result = 0;
  if (v5)
  {
LABEL_15:
    CFRelease(v5);
    return v4;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pi, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
