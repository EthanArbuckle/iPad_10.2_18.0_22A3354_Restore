@implementation _HDSeriesFreezeJournalEntry

- (_HDSeriesFreezeJournalEntry)initWithSeriesUUID:(id)a3 metadata:(id)a4 class:(Class)a5
{
  id v9;
  id v10;
  _HDSeriesFreezeJournalEntry *v11;
  uint64_t v12;
  NSUUID *seriesUUID;
  uint64_t v14;
  NSDictionary *metadata;
  void *v17;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HDSeriesFreezeJournalEntry.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("seriesClass != Nil"));

  }
  if ((-[objc_class conformsToProtocol:](a5, "conformsToProtocol:", &unk_1EF1D57E0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HDSeriesFreezeJournalEntry.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[seriesClass conformsToProtocol:@protocol(_HDSeriesFreezeJournalEntrySeries)]"));

  }
  v19.receiver = self;
  v19.super_class = (Class)_HDSeriesFreezeJournalEntry;
  v11 = -[_HDSeriesFreezeJournalEntry init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    seriesUUID = v11->_seriesUUID;
    v11->_seriesUUID = (NSUUID *)v12;

    v14 = objc_msgSend(v10, "copy");
    metadata = v11->_metadata;
    v11->_metadata = (NSDictionary *)v14;

    objc_storeStrong((id *)&v11->_seriesClass, a5);
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - freeze %@"), v5, self->_seriesUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "seriesClass");
        objc_msgSend(v11, "seriesUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "metadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        v15 = objc_msgSend(v12, "freezeSeriesWithIdentifier:metadata:profile:error:", v13, v14, v6, &v29);
        v16 = v29;

        if ((v15 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            v24 = v17;
            v25 = (void *)objc_opt_class();
            v26 = v25;
            objc_msgSend(v11, "seriesUUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v35 = v25;
            v36 = 2112;
            v37 = v27;
            v38 = 2114;
            v39 = v16;
            _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%@: *** Failed to freeze series: %@ %{public}@", buf, 0x20u);

          }
          if ((objc_msgSend(v16, "hk_isTransactionInterruptedError") & 1) != 0)
          {

            goto LABEL_15;
          }
          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = objc_opt_class();
          objc_msgSend(v11, "seriesUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("%@-%@"), v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "daemon");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "autoBugCaptureReporter");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "reportJournalFailureWithErrorDescription:provenance:error:", v21, 0, v16);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDSeriesFreezeJournalEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  Class v9;
  _HDSeriesFreezeJournalEntry *v10;
  NSObject *v11;
  int v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("meta"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seriesClass"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  v9 = NSClassFromString(v8);
  if (v9)
  {
    self = -[_HDSeriesFreezeJournalEntry initWithSeriesUUID:metadata:class:](self, "initWithSeriesUUID:metadata:class:", v5, v7, v9);
    v10 = self;
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v13 = 138543362;
      v14 = v8;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Failed to instantiate series freeze journal entry: unable to find subclass '%{public}@'", (uint8_t *)&v13, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HDSeriesFreezeJournalEntry;
  v4 = a3;
  -[HDJournalEntry encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_seriesUUID, CFSTR("sid"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_metadata, CFSTR("meta"));
  NSStringFromClass(self->_seriesClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("seriesClass"));

}

- (NSUUID)seriesUUID
{
  return self->_seriesUUID;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (Class)seriesClass
{
  return self->_seriesClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesClass, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_seriesUUID, 0);
}

@end
