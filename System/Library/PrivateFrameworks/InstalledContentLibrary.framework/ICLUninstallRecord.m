@implementation ICLUninstallRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLUninstallRecord)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICLUninstallRecord;
  return -[ICLUninstallRecord init](&v3, sel_init);
}

- (ICLUninstallRecord)initWithCoder:(id)a3
{
  id v4;
  ICLUninstallRecord *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLUninstallRecord;
  v5 = -[ICLUninstallRecord init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    v5->_isPlaceholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPlaceholder"));
    v5->_hasParallelPlaceholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasParallelPlaceholder"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ICLUninstallRecord bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("bundleIdentifier"));

  objc_msgSend(v5, "encodeBool:forKey:", -[ICLUninstallRecord isPlaceholder](self, "isPlaceholder"), CFSTR("isPlaceholder"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ICLUninstallRecord hasParallelPlaceholder](self, "hasParallelPlaceholder"), CFSTR("hasParallelPlaceholder"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[ICLUninstallRecord bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleIdentifier:", v7);

  objc_msgSend(v5, "setIsPlaceholder:", -[ICLUninstallRecord isPlaceholder](self, "isPlaceholder"));
  objc_msgSend(v5, "setHasParallelPlaceholder:", -[ICLUninstallRecord hasParallelPlaceholder](self, "hasParallelPlaceholder"));
  return v5;
}

- (NSDictionary)legacyDictionary
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[ICLUninstallRecord bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0C9AE78]);

  v5 = -[ICLUninstallRecord isPlaceholder](self, "isPlaceholder");
  v6 = MEMORY[0x1E0C9AAA0];
  v7 = MEMORY[0x1E0C9AAB0];
  if (v5)
    v8 = MEMORY[0x1E0C9AAB0];
  else
    v8 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("IsPlaceholder"));
  if (-[ICLUninstallRecord hasParallelPlaceholder](self, "hasParallelPlaceholder"))
    v9 = v7;
  else
    v9 = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("HasParallelPlaceholder"));
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v10;
}

- (BOOL)isEqual:(id)a3
{
  ICLUninstallRecord *v4;
  ICLUninstallRecord *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _BOOL4 v9;
  BOOL v10;
  _BOOL4 v12;

  v4 = (ICLUninstallRecord *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ICLUninstallRecord bundleIdentifier](self, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLUninstallRecord bundleIdentifier](v5, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        v9 = -[ICLUninstallRecord isPlaceholder](self, "isPlaceholder");
        if (v9 == -[ICLUninstallRecord isPlaceholder](v5, "isPlaceholder"))
        {
          v12 = -[ICLUninstallRecord hasParallelPlaceholder](self, "hasParallelPlaceholder");
          if (v12 == -[ICLUninstallRecord hasParallelPlaceholder](v5, "hasParallelPlaceholder"))
          {
            v10 = 1;
            goto LABEL_14;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_13:
            v10 = 0;
LABEL_14:

            goto LABEL_15;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_13;
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_13;
      }
      MOLogWrite();
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[ICLUninstallRecord isPlaceholder](self, "isPlaceholder");
  v4 = -[ICLUninstallRecord hasParallelPlaceholder](self, "hasParallelPlaceholder");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  -[ICLUninstallRecord bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v6;

  return v8;
}

+ (id)uninstallRecordArrayToDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "legacyDictionary", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v7);
    }

    v18 = CFSTR("UninstalledAppInfoArray");
    v11 = (void *)objc_msgSend(v4, "copy");
    v19 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)hasParallelPlaceholder
{
  return self->_hasParallelPlaceholder;
}

- (void)setHasParallelPlaceholder:(BOOL)a3
{
  self->_hasParallelPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
