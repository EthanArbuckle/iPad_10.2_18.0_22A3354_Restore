@implementation ECEmailAddress

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_groupList, 0);
}

- (id)_initWithComponents:(id)a3
{
  id v4;
  ECEmailAddress *v5;
  uint64_t v6;
  ECEmailAddressComponents *components;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECEmailAddress;
  v5 = -[ECEmailAddress init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    components = v5->_components;
    v5->_components = (ECEmailAddressComponents *)v6;

    v5->_hash = -1;
  }

  return v5;
}

- (BOOL)_createComponentsFrom:(id)a3
{
  id v4;
  ECEmailAddressComponents *v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  v5 = -[ECEmailAddressComponents initWithString:]([ECEmailAddressComponents alloc], "initWithString:", v4);
  v6 = -[ECEmailAddressComponents _nts_isValidDomain](v5, "_nts_isValidDomain");
  v7 = v6;
  if (self)
    v8 = v6;
  else
    v8 = 0;
  if (v8)
  {
    objc_storeStrong((id *)&self->_components, v5);
    self->_hash = -1;
  }

  return v7;
}

- (ECEmailAddress)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ECEmailAddress *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_stringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ECEmailAddress initWithString:](self, "initWithString:", v5);

  return v6;
}

+ (id)emailAddressWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  return v5;
}

- (ECEmailAddress)initWithString:(id)a3
{
  id v4;
  void *v5;
  ECEmailAddress *v6;
  id v7;
  ECEmailAddress *v8;
  _QWORD v10[4];
  ECEmailAddress *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__ECEmailAddress_initWithString___block_invoke;
  v10[3] = &unk_1E7120D30;
  v6 = self;
  v11 = v6;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v5, "_cachedEmailAddressForString:generator:", v7, v10);
  v8 = (ECEmailAddress *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_cachedEmailAddressForString:(id)a3 generator:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if (sharedCache_onceToken != -1)
      dispatch_once(&sharedCache_onceToken, &__block_literal_global_237);
    v7 = (id)sharedCache_cache;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__ECEmailAddress__cachedEmailAddressForString_generator___block_invoke;
    v11[3] = &unk_1E7120D78;
    v12 = v6;
    objc_msgSend(v7, "objectForKey:generator:", v5, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ECEmailAddress stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_stringValue"));

}

- (NSString)stringValue
{
  ECEmailAddressFormatter *v3;
  void *v4;

  v3 = objc_alloc_init(ECEmailAddressFormatter);
  -[ECEmailAddressFormatter setShouldIncludeDisplayName:](v3, "setShouldIncludeDisplayName:", 1);
  -[ECEmailAddressFormatter stringFromEmailAddress:](v3, "stringFromEmailAddress:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)groupList
{
  ECEmailAddress *v2;
  NSArray *groupList;
  void *v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *v7;

  v2 = self;
  objc_sync_enter(v2);
  groupList = v2->_groupList;
  if (!groupList)
  {
    -[ECEmailAddressComponents groupList](v2->_components, "groupList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_map:", &__block_literal_global_5);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v2->_groupList;
    v2->_groupList = (NSArray *)v5;

    groupList = v2->_groupList;
  }
  v7 = groupList;
  objc_sync_exit(v2);

  return v7;
}

id __57__ECEmailAddress__cachedEmailAddressForString_generator___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id __33__ECEmailAddress_initWithString___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)ECEmailAddress;
  v2 = objc_msgSendSuper2(&v5, sel_init);
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "_createComponentsFrom:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ECEmailAddress;
  if (-[ECEmailAddress respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

+ (id)emailAddressesFromStrings:(id)a3 invalidAddresses:(id *)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v14;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        +[ECEmailAddress emailAddressWithString:](ECEmailAddress, "emailAddressWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);
        else
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ECEmailAddress stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECEmailAddress components](self, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@ components=%@"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)ef_publicDescription
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[ECEmailAddress groupList](self, "groupList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isInternal");

    v16 = (void *)MEMORY[0x1E0D1EF48];
    if (v15)
    {
      -[ECEmailAddress simpleAddress](self, "simpleAddress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ECEmailAddress localPart](self, "localPart");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ECEmailAddress domain](self, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ec_partiallyRedactedStringForAddress:localPart:domain:", v17, v18, v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      goto LABEL_19;
    }
    -[ECEmailAddress simpleAddress](self, "simpleAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fullyRedactedStringForString:", v17);
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v6 = (void *)v21;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternal");

  if (!v5)
  {
    objc_msgSend(v3, "ef_compactMapSelector:", sel_simpleAddress);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsJoinedByString:", &stru_1E7123500);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1EF48], "fullyRedactedStringForString:", v17);
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((v10 & 1) == 0)
          objc_msgSend(v6, "appendString:", CFSTR(", "), (_QWORD)v23);
        objc_msgSend(v12, "ef_publicDescription", (_QWORD)v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v13);

        v10 = 0;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v10 = 0;
    }
    while (v8);
  }

  objc_msgSend(v6, "appendString:", CFSTR("]"));
LABEL_19:

  return (NSString *)v6;
}

- (unint64_t)hash
{
  unint64_t result;

  result = self->_hash;
  if (result == -1)
  {
    result = -[ECEmailAddressComponents hash](self->_components, "hash");
    self->_hash = result;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  ECEmailAddress *v4;
  ECEmailAddress *v5;
  ECEmailAddressComponents *components;
  void *v7;
  char v8;

  v4 = (ECEmailAddress *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    components = self->_components;
    -[ECEmailAddress components](v5, "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ECEmailAddressComponents isEqual:](components, "isEqual:", v7);

  }
  else
  {
LABEL_5:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECEmailAddress.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[otherAddress isKindOfClass:ECEmailAddress.class]"));

  }
  -[ECEmailAddress simpleAddress](self, "simpleAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simpleAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  return v8;
}

id __27__ECEmailAddress_groupList__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "emailAddressValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valueForUndefinedKey:(id)a3
{
  -[ECEmailAddressComponents valueForKey:](self->_components, "valueForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)highLevelDomain
{
  void *v2;
  void *v3;

  -[ECEmailAddress domain](self, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_lp_highLevelDomainFromHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (ECEmailAddressComponents)components
{
  return self->_components;
}

@end
