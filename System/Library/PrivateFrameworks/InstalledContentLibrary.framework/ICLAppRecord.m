@implementation ICLAppRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLAppRecord)initWithCoder:(id)a3
{
  id v4;
  ICLAppRecord *v5;
  uint64_t v6;
  NSURL *parallelPlaceholderURL;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *driverKitExtensionURLs;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *stashedVersions;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICLAppRecord;
  v5 = -[ICLPlaceholderRecord initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parallelPlaceholderURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    parallelPlaceholderURL = v5->_parallelPlaceholderURL;
    v5->_parallelPlaceholderURL = (NSURL *)v6;

    v5->_isUpdatedSystemApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isUpdatedSystemApp"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("driverKitExtensionURLs"));
    v11 = objc_claimAutoreleasedReturnValue();
    driverKitExtensionURLs = v5->_driverKitExtensionURLs;
    v5->_driverKitExtensionURLs = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("stashedVersions"));
    v16 = objc_claimAutoreleasedReturnValue();
    stashedVersions = v5->_stashedVersions;
    v5->_stashedVersions = (NSArray *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICLAppRecord;
  v4 = a3;
  -[ICLPlaceholderRecord encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[ICLAppRecord parallelPlaceholderURL](self, "parallelPlaceholderURL", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parallelPlaceholderURL"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp"), CFSTR("isUpdatedSystemApp"));
  -[ICLAppRecord driverKitExtensionURLs](self, "driverKitExtensionURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("driverKitExtensionURLs"));

  -[ICLAppRecord stashedVersions](self, "stashedVersions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("stashedVersions"));

}

- (ICLAppRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4;
  ICLAppRecord *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  ICLStashedAppRecord *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  ICLStashedAppRecord *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ICLAppRecord;
  v5 = -[ICLPlaceholderRecord initWithLegacyRecordDictionary:](&v33, sel_initWithLegacyRecordDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ParallelPlaceholderPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLAppRecord setParallelPlaceholderURL:](v5, "setParallelPlaceholderURL:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsUpdatedSystemApp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLAppRecord setIsUpdatedSystemApp:](v5, "setIsUpdatedSystemApp:", MIBooleanValue(v10, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DriverKitExtensionPaths"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (v13)
    {
      objc_opt_class();
      if (MIArrayContainsOnlyClass(v13))
      {
        v28 = v8;
        v14 = (void *)objc_opt_new();
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v15 = v13;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v30;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v30 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v19), 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v20);

              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          }
          while (v17);
        }

        v21 = (void *)objc_msgSend(v14, "copy");
        -[ICLAppRecord setDriverKitExtensionURLs:](v5, "setDriverKitExtensionURLs:", v21);

        v8 = v28;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StashedVersionInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    if (v24)
    {
      v25 = -[ICLStashedAppRecord initWithLegacyRecordDictionary:]([ICLStashedAppRecord alloc], "initWithLegacyRecordDictionary:", v24);
      v34 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLAppRecord setStashedVersions:](v5, "setStashedVersions:", v26);

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICLAppRecord;
  v5 = -[ICLPlaceholderRecord copyWithZone:](&v13, sel_copyWithZone_);
  -[ICLAppRecord parallelPlaceholderURL](self, "parallelPlaceholderURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setParallelPlaceholderURL:", v7);

  objc_msgSend(v5, "setIsUpdatedSystemApp:", -[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp"));
  -[ICLAppRecord driverKitExtensionURLs](self, "driverKitExtensionURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setDriverKitExtensionURLs:", v9);

  -[ICLAppRecord stashedVersions](self, "stashedVersions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setStashedVersions:", v11);

  return v5;
}

- (id)legacyRecordDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v27.receiver = self;
  v27.super_class = (Class)ICLAppRecord;
  -[ICLPlaceholderRecord legacyRecordDictionary](&v27, sel_legacyRecordDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[ICLAppRecord parallelPlaceholderURL](self, "parallelPlaceholderURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ParallelPlaceholderPath"));

  if (-[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp"))
    v7 = MEMORY[0x1E0C9AAB0];
  else
    v7 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("IsUpdatedSystemApp"));
  -[ICLAppRecord driverKitExtensionURLs](self, "driverKitExtensionURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "path", (_QWORD)v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v13);
    }

    v17 = (void *)objc_msgSend(v10, "copy");
    if (v17)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("DriverKitExtensionPaths"));

  }
  -[ICLAppRecord stashedVersions](self, "stashedVersions", (_QWORD)v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "legacyRecordDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("StashedVersionInfo"));

  }
  v21 = (void *)objc_msgSend(v3, "copy");

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  ICLAppRecord *v4;
  ICLAppRecord *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _BOOL4 v9;
  BOOL v10;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;
  objc_super v18;

  v4 = (ICLAppRecord *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18.receiver = self;
      v18.super_class = (Class)ICLAppRecord;
      if (-[ICLPlaceholderRecord isEqual:](&v18, sel_isEqual_, v4))
      {
        v5 = v4;
        -[ICLAppRecord parallelPlaceholderURL](self, "parallelPlaceholderURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLAppRecord parallelPlaceholderURL](v5, "parallelPlaceholderURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = MICompareObjects(v6, v7);

        if (v8)
        {
          v9 = -[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp");
          if (v9 == -[ICLAppRecord isUpdatedSystemApp](v5, "isUpdatedSystemApp"))
          {
            -[ICLAppRecord driverKitExtensionURLs](self, "driverKitExtensionURLs");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICLAppRecord driverKitExtensionURLs](v5, "driverKitExtensionURLs");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = MICompareObjects(v12, v13);

            if (v14)
            {
              -[ICLAppRecord stashedVersions](self, "stashedVersions");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICLAppRecord stashedVersions](v5, "stashedVersions");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = MICompareObjects(v15, v16);

              if (v17)
              {
                v10 = 1;
                goto LABEL_15;
              }
              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
LABEL_14:
                v10 = 0;
LABEL_15:

                goto LABEL_16;
              }
            }
            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_14;
            }
          }
          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_14;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_14;
        }
        MOLogWrite();
        goto LABEL_14;
      }
    }
    v10 = 0;
  }
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v3 = -[ICLAppRecord isUpdatedSystemApp](self, "isUpdatedSystemApp");
  -[ICLAppRecord parallelPlaceholderURL](self, "parallelPlaceholderURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[ICLAppRecord stashedVersions](self, "stashedVersions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  -[ICLAppRecord driverKitExtensionURLs](self, "driverKitExtensionURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  v11.receiver = self;
  v11.super_class = (Class)ICLAppRecord;
  return v9 ^ -[ICLPlaceholderRecord hash](&v11, sel_hash);
}

- (NSURL)parallelPlaceholderURL
{
  return self->_parallelPlaceholderURL;
}

- (void)setParallelPlaceholderURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (BOOL)isUpdatedSystemApp
{
  return self->_isUpdatedSystemApp;
}

- (void)setIsUpdatedSystemApp:(BOOL)a3
{
  self->_isUpdatedSystemApp = a3;
}

- (NSArray)driverKitExtensionURLs
{
  return self->_driverKitExtensionURLs;
}

- (void)setDriverKitExtensionURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSArray)stashedVersions
{
  return self->_stashedVersions;
}

- (void)setStashedVersions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedVersions, 0);
  objc_storeStrong((id *)&self->_driverKitExtensionURLs, 0);
  objc_storeStrong((id *)&self->_parallelPlaceholderURL, 0);
}

@end
