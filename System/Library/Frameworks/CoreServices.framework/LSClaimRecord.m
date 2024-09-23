@implementation LSClaimRecord

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  id v7;
  id v8;

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__claimingBundleRecord, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v7, "detach");

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedName);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v8, "detach");

}

- (unsigned)role
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel_roleWithContext_tableID_unitID_unitBytes_);
}

- (unsigned)roleWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return a6->var4;
}

- (id)_claimingBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id WeakRetained;
  _DWORD *v9;
  _DWORD *v10;
  objc_class *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakClaimingBundleRecord);

  if (WeakRetained)
  {
    v9 = 0;
  }
  else
  {
    v9 = (_DWORD *)_LSBundleGet(a3->db, a6->var5);
    if (v9)
    {
      v10 = v9;
      v11 = (objc_class *)objc_opt_class();
      if (v10[42] == 2)
        v11 = (objc_class *)objc_opt_class();
      v9 = (_DWORD *)objc_msgSend([v11 alloc], "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", 0, 0, a3, a3->db->schema.bundleTable, a6->var5, v10, 0);
    }
  }
  return v9;
}

- (id)_localizedNameWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return -[_LSLocalizedStringRecord _initWithContext:unitID:]([_LSLocalizedStringRecord alloc], "_initWithContext:unitID:", a3, a6->var6);
}

- (unint64_t)_flags
{
  return __LSRECORD_GETTER__<unsigned long long>(self, (LSRecord *)a2, sel__flagsWithContext_tableID_unitID_unitBytes_);
}

- (unint64_t)_flagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return a6->var2;
}

- (void)_LSRecord_resolve__localizedName
{
  id v2;

  v2 = -[LSClaimRecord _localizedName](self, "_localizedName");
}

- (_LSLocalizedStringRecord)_localizedName
{
  return (_LSLocalizedStringRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedNameWithContext_tableID_unitID_unitBytes_);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakClaimingBundleRecord);
}

- (void)_LSRecord_resolve_typeIdentifiers
{
  id v2;

  v2 = -[LSClaimRecord typeIdentifiers](self, "typeIdentifiers");
}

- (NSArray)typeIdentifiers
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_typeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_URLSchemes
{
  id v2;

  v2 = -[LSClaimRecord URLSchemes](self, "URLSchemes");
}

- (NSArray)URLSchemes
{
  return (NSArray *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_URLSchemesWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_handlerRank
{
  id v2;

  v2 = -[LSClaimRecord handlerRank](self, "handlerRank");
}

- (NSString)handlerRank
{
  return (NSString *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_handlerRankWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__claimingBundleRecord
{
  id v2;

  v2 = -[LSClaimRecord _claimingBundleRecord](self, "_claimingBundleRecord");
}

- (LSBundleRecord)_claimingBundleRecord
{
  return (LSBundleRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__claimingBundleRecordWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconResourceBundleURL
{
  id v2;

  v2 = -[LSClaimRecord iconResourceBundleURL](self, "iconResourceBundleURL");
}

- (NSURL)iconResourceBundleURL
{
  return (NSURL *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconResourceBundleURLWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_iconDictionary
{
  id v2;

  v2 = -[LSClaimRecord iconDictionary](self, "iconDictionary");
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_iconDictionaryWithContext_tableID_unitID_unitBytes_);
}

- (id)iconResourceBundleURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!a6->var9 && !a6->var8[0] || !a6->var10)
    goto LABEL_9;
  v7 = (void *)_CSStringCopyCFString();
  -[LSClaimRecord claimingBundleRecord](self, "claimingBundleRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || !v7)
  {

LABEL_9:
    -[LSClaimRecord claimingBundleRecord](self, "claimingBundleRecord", a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  objc_msgSend(v9, "URLByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_9;
  return v10;
}

- (LSBundleRecord)claimingBundleRecord
{
  void *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakClaimingBundleRecord);
  if (!WeakRetained)
  {
    -[LSClaimRecord _claimingBundleRecord](self, "_claimingBundleRecord");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (LSBundleRecord *)WeakRetained;
}

- (id)handlerRankWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return _LSCopyHandlerRankStringFromNumericHandlerRank(a6->var3);
}

- (id)iconDictionaryWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  unsigned int var9;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned int *var8;
  void *v13;

  var9 = a6->var9;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (var9)
  {
    v9 = (void *)_CSStringCopyCFString();
    if (v9)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("CFBundleIconName"));
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  var8 = a6->var8;
  do
  {
    if (!var8[v11])
      break;
    v13 = (void *)_CSStringCopyCFString();
    if (v13)
      objc_msgSend(v10, "addObject:", v13);
    ++v11;

  }
  while (v11 != 8);
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("CFBundleIconFiles"));

  return v8;
}

+ (id)_propertyClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)typeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__LSClaimRecord_typeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke;
  v12[3] = &unk_1E1042428;
  v9 = v8;
  v13 = v9;
  _LSEnumerateClaimedTypes((uint64_t)a3, (uint64_t)a6, v12);
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (id)URLSchemesWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__LSClaimRecord_URLSchemesWithContext_tableID_unitID_unitBytes___block_invoke;
  v12[3] = &unk_1E1042428;
  v9 = v8;
  v13 = v9;
  _LSEnumerateClaimedSchemes((uint64_t)a3, (uint64_t)a6, v12);
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

uint64_t __64__LSClaimRecord_URLSchemesWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __69__LSClaimRecord_typeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  -[LSClaimRecord _localizedName](self, "_localizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)localizedNameWithPreferredLocalizations:(id)a3
{
  void *v4;
  void *v5;

  -[LSClaimRecord _localizedName](self, "_localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValueWithPreferredLocalizations:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)defaultShareModeCollaboration
{
  return (-[LSClaimRecord _flags](self, "_flags") >> 11) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LSClaimRecord;
  v4 = -[LSRecord copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakClaimingBundleRecord);
    objc_storeWeak(v4 + 4, WeakRetained);

  }
  return v4;
}

@end
