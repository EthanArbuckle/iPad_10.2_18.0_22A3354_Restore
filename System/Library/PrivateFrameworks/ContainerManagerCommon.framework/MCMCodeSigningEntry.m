@implementation MCMCodeSigningEntry

- (unint64_t)dataContainerClass
{
  return self->_dataContainerClass;
}

- (void)setChildBundleIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_childBundleIdentifiers, a3);
}

- (MCMCodeSigningEntry)initWithCodeSigningInfo:(id)a3
{
  return -[MCMCodeSigningEntry initWithCodeSigningInfo:andDataContainerClass:](self, "initWithCodeSigningInfo:andDataContainerClass:", a3, 0);
}

- (void)setRegisteredByKernel:(BOOL)a3
{
  self->_registeredByKernel = a3;
}

- (void)setRegisteredByCaller:(BOOL)a3
{
  self->_registeredByCaller = a3;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (void)setDataContainerClass:(unint64_t)a3
{
  self->_dataContainerClass = a3;
}

- (void)setAdvanceCopy:(BOOL)a3
{
  self->_advanceCopy = a3;
}

- (MCMCodeSigningEntry)initWithCodeSigningInfo:(id)a3 andDataContainerClass:(unint64_t)a4
{
  id v7;
  MCMCodeSigningEntry *v8;
  MCMCodeSigningEntry *v9;
  NSArray *childBundleIdentifiers;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCMCodeSigningEntry;
  v8 = -[MCMCodeSigningEntry init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_codeSigningInfo, a3);
    childBundleIdentifiers = v9->_childBundleIdentifiers;
    v9->_childBundleIdentifiers = 0;

    v9->_registeredByKernel = 0;
    *(_DWORD *)&v9->_invalid = 0;
    v9->_dataContainerClass = a4;
  }

  return v9;
}

- (NSDictionary)codeSigningInfo
{
  return self->_codeSigningInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_codeSigningInfo, 0);
}

- (MCMCodeSigningEntry)initWithSerializedDictionary:(id)a3
{
  id v4;
  MCMCodeSigningEntry *v5;
  uint64_t v6;
  NSDictionary *codeSigningInfo;
  uint64_t v8;
  NSArray *childBundleIdentifiers;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMCodeSigningEntry;
  v5 = -[MCMCodeSigningEntry init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CodeSigningInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    codeSigningInfo = v5->_codeSigningInfo;
    v5->_codeSigningInfo = (NSDictionary *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChildBundleIds"));
    v8 = objc_claimAutoreleasedReturnValue();
    childBundleIdentifiers = v5->_childBundleIdentifiers;
    v5->_childBundleIdentifiers = (NSArray *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Invalid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_invalid = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Placeholder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_placeholder = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AdvanceCopy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_advanceCopy = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RegisteredByCaller"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_registeredByCaller = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RegisteredByKernel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_registeredByKernel = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DataContainerClass"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dataContainerClass = objc_msgSend(v15, "unsignedLongLongValue");

  }
  return v5;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[MCMCodeSigningEntry codeSigningInfo](self, "codeSigningInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("CodeSigningInfo"));

  -[MCMCodeSigningEntry childBundleIdentifiers](self, "childBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ChildBundleIds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCMCodeSigningEntry isInvalid](self, "isInvalid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Invalid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCMCodeSigningEntry isPlaceholder](self, "isPlaceholder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Placeholder"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCMCodeSigningEntry isAdvanceCopy](self, "isAdvanceCopy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("AdvanceCopy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCMCodeSigningEntry isRegisteredByCaller](self, "isRegisteredByCaller"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("RegisteredByCaller"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCMCodeSigningEntry isRegisteredByKernel](self, "isRegisteredByKernel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("RegisteredByKernel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MCMCodeSigningEntry dataContainerClass](self, "dataContainerClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("DataContainerClass"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MCMCodeSigningEntry *v5;
  MCMCodeSigningEntry *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  unint64_t v22;

  v5 = (MCMCodeSigningEntry *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[MCMCodeSigningEntry codeSigningInfo](self, "codeSigningInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (-[MCMCodeSigningEntry codeSigningInfo](v6, "codeSigningInfo"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[MCMCodeSigningEntry codeSigningInfo](self, "codeSigningInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMCodeSigningEntry codeSigningInfo](v6, "codeSigningInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

        if (v7)
        {

          if (!v10)
            goto LABEL_22;
        }
        else
        {

          if ((v10 & 1) == 0)
            goto LABEL_22;
        }
      }
      -[MCMCodeSigningEntry childBundleIdentifiers](self, "childBundleIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (-[MCMCodeSigningEntry childBundleIdentifiers](v6, "childBundleIdentifiers"),
            (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[MCMCodeSigningEntry childBundleIdentifiers](self, "childBundleIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMCodeSigningEntry childBundleIdentifiers](v6, "childBundleIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToArray:", v14);

        if (v12)
        {

          if (!v15)
            goto LABEL_22;
        }
        else
        {

          if ((v15 & 1) == 0)
            goto LABEL_22;
        }
      }
      v16 = -[MCMCodeSigningEntry isInvalid](self, "isInvalid");
      if (v16 == -[MCMCodeSigningEntry isInvalid](v6, "isInvalid"))
      {
        v17 = -[MCMCodeSigningEntry isPlaceholder](self, "isPlaceholder");
        if (v17 == -[MCMCodeSigningEntry isPlaceholder](v6, "isPlaceholder"))
        {
          v18 = -[MCMCodeSigningEntry isAdvanceCopy](self, "isAdvanceCopy");
          if (v18 == -[MCMCodeSigningEntry isAdvanceCopy](v6, "isAdvanceCopy"))
          {
            v19 = -[MCMCodeSigningEntry isRegisteredByCaller](self, "isRegisteredByCaller");
            if (v19 == -[MCMCodeSigningEntry isRegisteredByCaller](v6, "isRegisteredByCaller"))
            {
              v20 = -[MCMCodeSigningEntry isRegisteredByKernel](self, "isRegisteredByKernel");
              if (v20 == -[MCMCodeSigningEntry isRegisteredByKernel](v6, "isRegisteredByKernel"))
              {
                v22 = -[MCMCodeSigningEntry dataContainerClass](self, "dataContainerClass");
                v11 = v22 == -[MCMCodeSigningEntry dataContainerClass](v6, "dataContainerClass");
                goto LABEL_23;
              }
            }
          }
        }
      }
LABEL_22:
      v11 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v11 = 0;
  }
LABEL_24:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;

  -[MCMCodeSigningEntry codeSigningInfo](self, "codeSigningInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MCMCodeSigningEntry childBundleIdentifiers](self, "childBundleIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  if (-[MCMCodeSigningEntry isInvalid](self, "isInvalid"))
    v7 = 2;
  else
    v7 = 0;
  if (-[MCMCodeSigningEntry isPlaceholder](self, "isPlaceholder"))
    v8 = 4;
  else
    v8 = 0;
  if (-[MCMCodeSigningEntry isRegisteredByCaller](self, "isRegisteredByCaller"))
    v9 = 8;
  else
    v9 = 0;
  v10 = -[MCMCodeSigningEntry dataContainerClass](self, "dataContainerClass") != 0;
  if (-[MCMCodeSigningEntry isAdvanceCopy](self, "isAdvanceCopy"))
    v11 = 32;
  else
    v11 = 0;
  if (-[MCMCodeSigningEntry isRegisteredByKernel](self, "isRegisteredByKernel"))
    v12 = 64;
  else
    v12 = 0;

  return v7 + (v6 ^ v4) + v8 + v9 + 16 * v10 + v11 + v12;
}

- (id)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__MCMCodeSigningEntry_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (void)setCodeSigningInfo:(id)a3
{
  objc_storeStrong((id *)&self->_codeSigningInfo, a3);
}

- (NSArray)childBundleIdentifiers
{
  return self->_childBundleIdentifiers;
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (BOOL)isAdvanceCopy
{
  return self->_advanceCopy;
}

- (BOOL)isRegisteredByCaller
{
  return self->_registeredByCaller;
}

- (BOOL)isRegisteredByKernel
{
  return self->_registeredByKernel;
}

id __34__MCMCodeSigningEntry_description__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isInvalid"))
    v7 = 89;
  else
    v7 = 78;
  v22 = v7;
  if (objc_msgSend(*(id *)(a1 + 32), "isPlaceholder"))
    v8 = 89;
  else
    v8 = 78;
  if (objc_msgSend(*(id *)(a1 + 32), "isAdvanceCopy"))
    v9 = 89;
  else
    v9 = 78;
  if (objc_msgSend(*(id *)(a1 + 32), "isRegisteredByCaller"))
    v10 = 89;
  else
    v10 = 78;
  if (objc_msgSend(*(id *)(a1 + 32), "isRegisteredByKernel"))
    v11 = 89;
  else
    v11 = 78;
  v12 = objc_msgSend(*(id *)(a1 + 32), "dataContainerClass");
  objc_msgSend(*(id *)(a1 + 32), "childBundleIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v13, "redactedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "codeSigningInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "redactedDescription");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v4;
    v19 = (void *)v17;
    objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@ invalid: %c, placeholder: %c, advanceCopy: %c, regByCaller: %c, regByKernel: %c, dataClass: %llu, childBundles: %@, CSinfo: %@>"), v6, v22, v8, v9, v10, v11, v12, v15, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "codeSigningInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ invalid: %c, placeholder: %c, advanceCopy: %c, regByCaller: %c, regByKernel: %c, dataClass: %llu, childBundles: %@, CSinfo: %@>"), v6, v22, v8, v9, v10, v11, v12, v14, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

@end
