@implementation DDSAssertion

- (DDSAssertion)initWithQuery:(id)a3
{
  id v5;
  DDSAssertion *v6;
  DDSAssertion *v7;
  NSMutableSet *v8;
  NSMutableSet *descriptors;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DDSAssertion;
  v6 = -[DDSAssertion init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_query, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    descriptors = v7->_descriptors;
    v7->_descriptors = v8;

  }
  return v7;
}

- (id)addDescriptorWithAssertionID:(id)a3 clientID:(id)a4 policy:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  DDSAssertDescriptor *v20;
  void *v21;
  NSObject *v22;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v25 = a5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[DDSAssertion descriptors](self, "descriptors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "assertionIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToString:", v8) & 1) != 0)
        {
          objc_msgSend(v15, "clientIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v9);

          if ((v18 & 1) != 0)
          {

            DefaultLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v31 = v8;
              _os_log_impl(&dword_1DA990000, v22, OS_LOG_TYPE_DEFAULT, "Descriptor with assertion id: %{public}@ already added.", buf, 0xCu);
            }

            v20 = 0;
            v19 = v25;
            goto LABEL_16;
          }
        }
        else
        {

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v12)
        continue;
      break;
    }
  }

  v19 = v25;
  v20 = -[DDSAssertDescriptor initWithPolicy:assertionID:clientID:]([DDSAssertDescriptor alloc], "initWithPolicy:assertionID:clientID:", v25, v8, v9);
  -[DDSAssertion descriptors](self, "descriptors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v20);

  -[DDSAssertion invalidateDescription](self, "invalidateDescription");
LABEL_16:

  return v20;
}

- (NSSet)clientIdentifiers
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[DDSAssertion descriptors](self, "descriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__DDSAssertion_clientIdentifiers__block_invoke;
  v7[3] = &unk_1EA141668;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSSet *)v5;
}

void __33__DDSAssertion_clientIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "clientIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (NSSet)assertionIdentifiers
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[DDSAssertion descriptors](self, "descriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__DDSAssertion_assertionIdentifiers__block_invoke;
  v7[3] = &unk_1EA141668;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSSet *)v5;
}

void __36__DDSAssertion_assertionIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "assertionIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)assertionIDsForClientID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[DDSAssertion descriptors](self, "descriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__DDSAssertion_assertionIDsForClientID___block_invoke;
  v12[3] = &unk_1EA141690;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __40__DDSAssertion_assertionIDsForClientID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v7, "assertionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (DDSAssetPolicy)policy
{
  DDSAssetPolicy *v3;
  void *v4;
  DDSAssetPolicy *v5;
  _QWORD v7[4];
  DDSAssetPolicy *v8;

  v3 = objc_alloc_init(DDSAssetPolicy);
  -[DDSAssetPolicy setPreferredDownloadFrequency:](v3, "setPreferredDownloadFrequency:", 0x7FFFFFFFLL);
  -[DDSAssertion descriptors](self, "descriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__DDSAssertion_policy__block_invoke;
  v7[3] = &unk_1EA141668;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __22__DDSAssertion_policy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a2, "policy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "downloadWithoutPower") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v8, "downloadWithoutPower");
  objc_msgSend(*(id *)(a1 + 32), "setDownloadWithoutPower:", v3);
  if ((objc_msgSend(*(id *)(a1 + 32), "downloadOverCellular") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v8, "downloadOverCellular");
  objc_msgSend(*(id *)(a1 + 32), "setDownloadOverCellular:", v4);
  v5 = objc_msgSend(*(id *)(a1 + 32), "preferredDownloadFrequency");
  v6 = objc_msgSend(v8, "preferredDownloadFrequency");
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  objc_msgSend(*(id *)(a1 + 32), "setPreferredDownloadFrequency:", v7);

}

- (void)removeDescriptorWithClientID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[DDSAssertion descriptors](self, "descriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __45__DDSAssertion_removeDescriptorWithClientID___block_invoke;
  v11 = &unk_1EA1416B8;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v8);

  -[DDSAssertion descriptors](self, "descriptors", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v15[5]);

  -[DDSAssertion invalidateDescription](self, "invalidateDescription");
  _Block_object_dispose(&v14, 8);

}

void __45__DDSAssertion_removeDescriptorWithClientID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)removeDescriptorWithAssertionID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[DDSAssertion descriptors](self, "descriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __48__DDSAssertion_removeDescriptorWithAssertionID___block_invoke;
  v11 = &unk_1EA1416B8;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v8);

  -[DDSAssertion descriptors](self, "descriptors", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v15[5]);

  -[DDSAssertion invalidateDescription](self, "invalidateDescription");
  _Block_object_dispose(&v14, 8);

}

void __48__DDSAssertion_removeDescriptorWithAssertionID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "assertionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (DDSAssertion)init
{

  return 0;
}

- (DDSAssertion)initWithCoder:(id)a3
{
  id v4;
  DDSAssertion *v5;
  DDSAssertion *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  DDSAssetQuery *query;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDate *lastUpdated;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSMutableSet *descriptors;
  NSObject *v22;
  DDSAssertion *v23;
  id v25;
  objc_super v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DDSAssertion;
  v5 = -[DDSAssertion init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_opt_class();
    NSStringFromSelector(sel_query);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (DDSAssetQuery *)v9;

    v11 = objc_opt_class();
    NSStringFromSelector(sel_lastUpdated);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    NSStringFromSelector(sel_descriptors);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v17, v18, &v25);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v25;
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSMutableSet *)v19;

    v6 = v5;
    if (v20)
    {
      DefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[DDSAssertion initWithCoder:].cold.1((uint64_t)v20, v22);

      v6 = 0;
    }

  }
  v23 = v6;

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[DDSAssertion query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_query);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[DDSAssertion lastUpdated](self, "lastUpdated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_lastUpdated);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[DDSAssertion descriptors](self, "descriptors");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_descriptors);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)invalidateDescription
{
  NSString *description;

  description = self->_description;
  self->_description = 0;

}

- (id)description
{
  NSString *description;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  description = self->_description;
  if (!description)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = objc_opt_class();
    -[DDSAssertion query](self, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSAssertion policy](self, "policy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, query: %@, policy: %@>"), v5, self, v6, v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_description;
    self->_description = v8;

    description = self->_description;
  }
  return description;
}

- (id)dumpDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (DDS_IS_INTERNAL_INSTALL())
  {
    -[DDSAssertion query](self, "query");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dumpDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("[\n%@\n"), v5);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[DDSAssertion descriptors](self, "descriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "dumpDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    -[DDSAssertion lastUpdated](self, "lastUpdated");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    DDS_STRING_FROM_DATE(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\nUpdated: %@\n]"), v13);

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[DDSAssertion query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithQuery:", v5);

  if (v6)
  {
    -[DDSAssertion descriptors](self, "descriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDescriptors:", v7);

    -[DDSAssertion lastUpdated](self, "lastUpdated");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLastUpdated:", v8);

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[DDSAssertion isEqualToAssertion:](self, "isEqualToAssertion:", v4);

  return v5;
}

- (BOOL)isEqualToAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[DDSAssertion query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[DDSAssertion policy](self, "policy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "policy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[DDSAssertion lastUpdated](self, "lastUpdated");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastUpdated");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToDate:", v10))
      {
        -[DDSAssertion descriptors](self, "descriptors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "descriptors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[DDSAssertion query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DDSAssertion policy](self, "policy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DDSAssertion lastUpdated](self, "lastUpdated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[DDSAssertion descriptors](self, "descriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (DDSAssetQuery)query
{
  return self->_query;
}

- (NSMutableSet)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_descriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DA990000, a2, OS_LOG_TYPE_ERROR, "Error decoding descriptors: (%{public}@)", (uint8_t *)&v2, 0xCu);
}

@end
