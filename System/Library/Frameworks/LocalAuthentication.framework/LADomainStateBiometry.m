@implementation LADomainStateBiometry

- (LADomainStateBiometry)initWithResult:(id)a3
{
  id v4;
  LADomainStateBiometry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSData *stateHash;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)LADomainStateBiometry;
  v5 = -[LADomainStateBiometry init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D442B8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D442C8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "BOOLValue");

          if (v17)
          {
            v5->_biometryType = objc_msgSend(v15, "integerValue");
            v18 = (void *)MEMORY[0x1E0D443D0];
            objc_msgSend(v9, "objectForKeyedSubscript:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "saltHash:withBundleID:", v19, v7);
            v20 = objc_claimAutoreleasedReturnValue();

            stateHash = v5->_stateHash;
            v5->_stateHash = (NSData *)v20;

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v12);
    }

    v4 = v23;
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[LADomainStateBiometry biometryType](self, "biometryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("biometryType: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[LADomainStateBiometry stateHash](self, "stateHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("stateHash: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("; "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)biometryType
{
  return self->_biometryType;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHash, 0);
}

@end
