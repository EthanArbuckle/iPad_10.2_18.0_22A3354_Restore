@implementation _LSLocalizedStringRecord

- (id)_allUnsanitizedStringValuesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LocalizedString *)a6
{
  return LaunchServices::LocalizedString::getAllUnsafeLocalizations((LaunchServices::LocalizedString *)a6, a3->db, 0, 0, 0);
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v7;
  uint64_t v8;
  objc_super v11;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  -[_LSLocalizedStringRecord _allUnsanitizedStringValues](self, "_allUnsanitizedStringValues");

  -[_LSLocalizedStringRecord _missingBundleLocs](self, "_missingBundleLocs");
  v11.receiver = self;
  v11.super_class = (Class)_LSLocalizedStringRecord;
  -[LSRecord _detachFromContext:tableID:unitID:unitBytes:](&v11, sel__detachFromContext_tableID_unitID_unitBytes_, a3, v8, v7, a6);
}

- (id)_missingBundleLocsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const LocalizedString *)a6
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  LaunchServices::LocalizedString::getBundleLocs((LaunchServices::LocalizedString *)a6, a3->db);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C99E20]);
  if (v7)
    v9 = v7;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_LSLocalizedStringRecord _allUnsanitizedStringValues](self, "_allUnsanitizedStringValues", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(v10, "removeObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  objc_msgSend(v10, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSDictionary)_allUnsanitizedStringValues
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__allUnsanitizedStringValuesWithContext_tableID_unitID_unitBytes_);
}

- (NSArray)_missingBundleLocs
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__missingBundleLocsWithContext_tableID_unitID_unitBytes_);
}

- (id)_initWithContext:(LSContext *)a3 unitID:(unsigned int)a4
{
  uint64_t v4;
  uint64_t localizedStringTable;
  objc_super v9;

  v4 = *(_QWORD *)&a4;
  if (LaunchServices::LocalizedString::Get((LaunchServices::LocalizedString *)a3->db, *(_LSDatabase **)&a4))
  {
    localizedStringTable = a3->db->schema.localizedStringTable;
    v9.receiver = self;
    v9.super_class = (Class)_LSLocalizedStringRecord;
    return -[LSRecord _initWithContext:tableID:unitID:](&v9, sel__initWithContext_tableID_unitID_, a3, localizedStringTable, v4);
  }
  else
  {

    return 0;
  }
}

- (void)_LSRecord_resolve__missingBundleLocs
{
  id v2;

  v2 = -[_LSLocalizedStringRecord _missingBundleLocs](self, "_missingBundleLocs");
}

- (void)_LSRecord_resolve__allUnsanitizedStringValues
{
  id v2;

  v2 = -[_LSLocalizedStringRecord _allUnsanitizedStringValues](self, "_allUnsanitizedStringValues");
}

- (NSString)defaultStringValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__32;
  v14 = __Block_byref_object_dispose__32;
  v15 = 0;
  v3 = (void *)MEMORY[0x186DAE7A0](self, a2);
  v8[5] = &v10;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46___LSLocalizedStringRecord_defaultStringValue__block_invoke;
  v9[3] = &unk_1E10444A8;
  v9[4] = &v10;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46___LSLocalizedStringRecord_defaultStringValue__block_invoke_2;
  v8[3] = &unk_1E1040240;
  v8[4] = self;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v9, v8);
  if (v11[5])
  {
    objc_msgSend((id)objc_opt_class(), "sanitizeString:", v11[5]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v11[5];
    v11[5] = v4;

  }
  objc_autoreleasePoolPop(v3);
  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSString *)v6;
}

- (NSString)stringValue
{
  return (NSString *)-[_LSLocalizedStringRecord stringValueWithPreferredLocalizations:](self, "stringValueWithPreferredLocalizations:", 0);
}

- (id)stringValueWithPreferredLocalizations:(id)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__32;
  v17 = __Block_byref_object_dispose__32;
  v18 = 0;
  v6 = (void *)MEMORY[0x186DAE7A0]();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke;
  v12[3] = &unk_1E1044430;
  v12[4] = a3;
  v12[5] = &v13;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2;
  v11[3] = &unk_1E1044458;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v13;
  v11[7] = a2;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v12, v11);
  if (v14[5])
  {
    objc_msgSend((id)objc_opt_class(), "sanitizeString:", v14[5]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v14[5];
    v14[5] = v7;

  }
  objc_autoreleasePoolPop(v6);
  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

+ (id)sanitizeString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  _LSBalanceBiDiControlCharacters();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _LSReplaceForbiddenCharacters(v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_propertyClasses
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)allStringValues
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;

  -[_LSLocalizedStringRecord _allUnsanitizedStringValues](self, "_allUnsanitizedStringValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v3);
    v5 = objc_opt_class();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __43___LSLocalizedStringRecord_allStringValues__block_invoke;
    v14 = &unk_1E1044480;
    v16 = v5;
    v6 = v4;
    v15 = v6;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v11);
    v7 = (void *)objc_msgSend(v6, "copy", v11, v12, v13, v14);

  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x1E0C9AA70];
  v9 = v8;

  return v9;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[_LSLocalizedStringRecord stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> \"%@\"), v4, self, v5);

  return v6;
}

@end
