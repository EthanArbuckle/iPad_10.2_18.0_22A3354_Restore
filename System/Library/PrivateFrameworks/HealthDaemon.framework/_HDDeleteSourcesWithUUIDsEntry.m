@implementation _HDDeleteSourcesWithUUIDsEntry

- (_HDDeleteSourcesWithUUIDsEntry)initWithUUIDs:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  _HDDeleteSourcesWithUUIDsEntry *v8;
  uint64_t v9;
  NSSet *UUIDs;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HDDeleteSourcesWithUUIDsEntry;
  v8 = -[_HDDeleteSourcesWithUUIDsEntry init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    UUIDs = v8->_UUIDs;
    v8->_UUIDs = (NSSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v11;

  }
  return v8;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  __int128 v21;
  id obj;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v29;
    *(_QWORD *)&v8 = 138543362;
    v21 = v8;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v12, "UUIDs", v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "database");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __59___HDDeleteSourcesWithUUIDsEntry_applyEntries_withProfile___block_invoke;
        v23[3] = &unk_1E6CEB3F8;
        v24 = v6;
        v16 = v13;
        v25 = v16;
        v17 = v14;
        v26 = v17;
        v18 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSampleEntity, "performWriteTransactionWithHealthDatabase:error:block:", v15, &v27, v23);
        v19 = v27;

        if (!v18)
        {
          _HKInitializeLogging();
          v20 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v33 = v19;
            _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "Unable to delete source/samples for journaled source: %{public}@", buf, 0xCu);
          }
          if ((objc_msgSend(v19, "hk_isTransactionInterruptedError") & 1) != 0)
          {

            goto LABEL_14;
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_14:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDDeleteSourcesWithUUIDsEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _HDDeleteSourcesWithUUIDsEntry *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("UUIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BundleIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[_HDDeleteSourcesWithUUIDsEntry initWithUUIDs:bundleIdentifier:](self, "initWithUUIDs:bundleIdentifier:", v8, v9);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *UUIDs;
  id v5;

  UUIDs = self->_UUIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUIDs, CFSTR("UUIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("BundleIdentifier"));

}

- (NSSet)UUIDs
{
  return self->_UUIDs;
}

- (void)setUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_UUIDs, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_UUIDs, 0);
}

@end
