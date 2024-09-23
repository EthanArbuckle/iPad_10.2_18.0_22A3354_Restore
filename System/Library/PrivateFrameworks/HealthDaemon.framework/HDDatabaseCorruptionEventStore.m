@implementation HDDatabaseCorruptionEventStore

- (HDDatabaseCorruptionEventStore)initWithDelegate:(id)a3
{
  id v4;
  HDDatabaseCorruptionEventStore *v5;
  HDDatabaseCorruptionEventStore *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDDatabaseCorruptionEventStore;
  v5 = -[HDDatabaseCorruptionEventStore init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

+ (id)corruptionEventKeyForProfileIdentifier:(id)a3 component:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  HDStringFromDatabaseComponentIdentifier(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("corruption."), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HDDatabaseUserDefaultsKeyForProfileIdentifier(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)TTREventKeyForProfileIdentifier:(id)a3 component:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  HDStringFromDatabaseComponentIdentifier(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("corruption-reported."), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HDDatabaseUserDefaultsKeyForProfileIdentifier(v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)outOfSpaceEventKey
{
  return CFSTR("databaseDetectedOutOfSpace");
}

+ (id)_migrationFailureEventKeyForProfileIdentifier:(unint64_t)a3 component:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a2;
  objc_opt_self();
  HDStringFromDatabaseComponentIdentifier(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("migration-failure"), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HDDatabaseUserDefaultsKeyForProfileIdentifier(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)persistCorruptionEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(v4, "profileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "corruptionEventKeyForProfileIdentifier:component:", v7, objc_msgSend(v4, "component"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v9)
    {
      -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "store:setObject:forKey:", self, v9, v8);

    }
    else
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v10;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Could not encode corruption event (%@); skipping",
          buf,
          0xCu);
      }
    }

  }
}

- (id)mostRecentCorruptionEventForProfileIdentifier:(id)a3 component:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "corruptionEventKeyForProfileIdentifier:component:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "store:objectForKey:", self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    if (!v10)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Could not decode corruption event (%@)", buf, 0xCu);
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)persistDeviceOutOfSpaceEvent
{
  void *v3;
  id v4;

  -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "store:setObject:forKey:", self, v3, CFSTR("databaseDetectedOutOfSpace"));

}

- (id)dateOfMostRecentDeviceOutOfSpaceEvent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store:objectForKey:", self, CFSTR("databaseDetectedOutOfSpace"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)persistMigrationFailureEventForProfile:(id)a3 component:(int64_t)a4 schemaVersion:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  +[HDDatabaseCorruptionEventStore _migrationFailureEventKeyForProfileIdentifier:component:]((uint64_t)HDDatabaseCorruptionEventStore, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("lastReportedDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("failedSchemaVersion");
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "store:setObject:forKey:", self, v10, v7);

}

- (id)mostRecentMigrationFailureEventForProfile:(id)a3 component:(int64_t)a4 schemaVersion:(int64_t *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  +[HDDatabaseCorruptionEventStore _migrationFailureEventKeyForProfileIdentifier:component:]((uint64_t)HDDatabaseCorruptionEventStore, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "store:objectForKey:", self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "valueForKey:", CFSTR("lastReportedDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("failedSchemaVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *a5 = objc_msgSend(v11, "integerValue");
      v12 = v10;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)mostRecentTTRAttemptForProfileIdentifier:(id)a3 component:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "TTREventKeyForProfileIdentifier:component:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "store:objectForKey:", self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (void)persistTTRAttempt:(id)a3 forProfileIdentifier:(id)a4 component:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "TTREventKeyForProfileIdentifier:component:", v8, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "store:setObject:forKey:", self, v9, v11);

}

- (void)persistObliterationForReason:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("reason");
  v9[1] = CFSTR("date");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "store:setObject:forKey:", self, v7, CFSTR("databaseObliterated"));

}

- (id)dateOfMostRecentObliteration:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[HDDatabaseCorruptionEventStore delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "store:objectForKey:", self, CFSTR("databaseObliterated"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    *a3 = 0;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reason"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = 0;
    if (v7 && v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (a3)
          *a3 = objc_retainAutorelease(v9);
        v10 = v7;
      }
      else
      {
        v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HDDatabaseCorruptionEventStoreDelegate)delegate
{
  return (HDDatabaseCorruptionEventStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
