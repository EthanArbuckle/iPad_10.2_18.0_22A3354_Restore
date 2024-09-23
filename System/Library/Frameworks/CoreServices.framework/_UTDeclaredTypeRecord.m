@implementation _UTDeclaredTypeRecord

- (id)identifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return (id)_CSStringCopyCFString();
}

- (id)parentTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8;
  _LSDatabase *db;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  LSContext *v18;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  db = a3->db;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __83___UTDeclaredTypeRecord_parentTypeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke;
  v16 = &unk_1E1046218;
  v18 = a3;
  v10 = v8;
  v17 = v10;
  _UTTypeSearchConformsToTypesWithBlock((uint64_t)db, a5, 1, 0, (uint64_t)&v13);
  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

- (id)versionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  if ((a6->var2 & 0x100) == 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6->var4, *(_QWORD *)&a4, *(_QWORD *)&a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)referenceURLWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  void *v6;
  void *v7;

  v6 = (void *)_CSStringCopyCFString();
  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
  else
    v7 = 0;

  return v7;
}

- (id)declaringBundleRecord
{
  void *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_weakDeclaringBundleRecord);
  if (!WeakRetained)
  {
    -[_UTDeclaredTypeRecord _declaringBundleRecord](self, "_declaringBundleRecord");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  return WeakRetained;
}

- (unsigned)_rawFlagsWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return a6->var2;
}

- (id)_delegatePathWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if ((a6->var2 & 0x2000) != 0)
  {
    v11 = 0;
  }
  else
  {
    v8 = (void *)_CSStringCopyCFString();
    if (v8)
    {
      if (_LSBundleGet(a3->db, a6->var5) && (v9 = (void *)_CSStringCopyCFString(), (v10 = v9) != 0))
      {
        objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = v8;
      }
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (id)_declaringBundleRecordWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id WeakRetained;
  _DWORD *v10;
  _LSDatabase *db;
  unsigned int var5;
  _DWORD *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakDeclaringBundleRecord);

  if (WeakRetained)
  {
LABEL_2:
    v10 = 0;
    return v10;
  }
  db = a3->db;
  var5 = a6->var5;
  if ((a6->var2 & 0x2000) == 0)
  {
    v10 = (_DWORD *)_LSBundleGet(db, var5);
    if (!v10)
      return v10;
    v14 = v10;
    v15 = v10[42];
    switch(v15)
    {
      case 11:
        +[LSBundleRecord coreTypesBundleRecord](LSBundleRecord, "coreTypesBundleRecord");
        v10 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        return v10;
      case 8:
        v10 = -[LSBundleRecord _initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:]([LSBundleRecord alloc], "_initWithNode:bundleIdentifier:context:tableID:unitID:bundleBaseData:error:", 0, 0, a3, *(unsigned int *)(-[_LSDatabase schema]((uint64_t)a3->db) + 4), a6->var5, v10, 0);
        return v10;
      case 2:
        v10 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]([LSApplicationRecord alloc], "_initWithContext:bundleID:bundleData:error:", a3, a6->var5, v10, 0);
        return v10;
    }
    _LSRecordLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v14[42];
      -[_UTDeclaredTypeRecord identifier](self, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v20 = v17;
      v21 = 2114;
      v22 = v18;
      _os_log_impl(&dword_182882000, v16, OS_LOG_TYPE_ERROR, "Unexpected bundle class %lu declaring type %{public}@", buf, 0x16u);

    }
    goto LABEL_2;
  }
  v10 = (_DWORD *)_LSGetPlugin((uint64_t)db, var5);
  if (v10)
    v10 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]([LSApplicationExtensionRecord alloc], "_initWithContext:pluginID:pluginData:error:", a3, a6->var5, v10, 0);
  return v10;
}

- (void)_LSRecord_resolve_tagSpecification
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord tagSpecification](self, "tagSpecification");
}

- (void)_LSRecord_resolve_identifier
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord identifier](self, "identifier");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakDeclaringBundleRecord);
}

- (BOOL)isDynamic
{
  return 0;
}

- (void)_LSRecord_resolve__declaringBundleRecord
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord _declaringBundleRecord](self, "_declaringBundleRecord");
}

- (LSBundleRecord)_declaringBundleRecord
{
  return (LSBundleRecord *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__declaringBundleRecordWithContext_tableID_unitID_unitBytes_);
}

- (void)_detachFromContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UTDeclaredTypeRecord;
  -[UTTypeRecord _detachFromContext:tableID:unitID:unitBytes:](&v11, sel__detachFromContext_tableID_unitID_unitBytes_, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__declaringBundleRecord);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "detach");

  -[LSRecord _resolvedPropertyValueForGetter:](self, "_resolvedPropertyValueForGetter:", sel__localizedDescription);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "detach");

}

- (id)identifier
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_identifierWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_declaration
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord declaration](self, "declaration");
}

- (id)declaration
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_declarationWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_childTypeIdentifiers
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord childTypeIdentifiers](self, "childTypeIdentifiers");
}

- (id)childTypeIdentifiers
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_childTypeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__delegatePath
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord _delegatePath](self, "_delegatePath");
}

- (id)_delegatePath
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__delegatePathWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__declaringBundleBookmark
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord _declaringBundleBookmark](self, "_declaringBundleBookmark");
}

- (id)_declaringBundleBookmark
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__declaringBundleBookmarkWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve__localizedDescription
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord _localizedDescription](self, "_localizedDescription");
}

- (id)declarationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t EntryWithClass;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_UTDeclaredTypeRecord identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("UTTypeIdentifier"));

  -[_UTDeclaredTypeRecord version](self, "version");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("UTTypeVersion"));

  -[_UTDeclaredTypeRecord _localizedDescription](self, "_localizedDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultStringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("UTTypeDescription"));

  v14 = (void *)_CSStringCopyCFString();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("UTKEXTIdentifier"));

  -[_UTDeclaredTypeRecord tagSpecification](self, "tagSpecification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_expensiveDictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("UTTypeTagSpecification"));

  if (a6->var14)
  {
    EntryWithClass = _LSBindingListGetEntryWithClass(a3->db);
    if (EntryWithClass && (v18 = *(unsigned int *)(EntryWithClass + 4), (_DWORD)v18))
    {
      v19 = 0;
      v20 = EntryWithClass + 8;
      do
      {
        v20 += 4;
        v21 = (void *)_CSStringCopyCFString();
        v22 = v21;
        if (v21 && objc_msgSend(v21, "length"))
        {
          if (!v19)
            v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v19, "addObject:", v22);
        }

        --v18;
      }
      while (v18);
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("UTTypeConformsTo"));

  }
  -[_UTDeclaredTypeRecord referenceURL](self, "referenceURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "absoluteString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("UTTypeReferenceURL"));

  if (-[_UTDeclaredTypeRecord isWildcard](self, "isWildcard"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("UTTypeIsWildcard"));
  +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_localizedDescription
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel__localizedDescriptionWithContext_tableID_unitID_unitBytes_);
}

- (id)tagSpecification
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_tagSpecificationWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isWildcard
{
  return (-[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") >> 9) & 1;
}

- (unsigned)_rawFlags
{
  return __LSRECORD_GETTER__<unsigned int>(self, (LSRecord *)a2, sel__rawFlagsWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_version
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord version](self, "version");
}

- (id)version
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_versionWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_referenceURL
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord referenceURL](self, "referenceURL");
}

- (id)referenceURL
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_referenceURLWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  char v3;
  _QWORD v5[7];
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[6] = &v7;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50___UTDeclaredTypeRecord_conformsToTypeIdentifier___block_invoke;
  v6[3] = &unk_1E1046438;
  v6[4] = a3;
  v6[5] = &v7;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50___UTDeclaredTypeRecord_conformsToTypeIdentifier___block_invoke_2;
  v5[3] = &unk_1E1046460;
  v5[4] = self;
  v5[5] = a3;
  -[LSRecord _ifAttached:else:](self, "_ifAttached:else:", v6, v5);
  v3 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (BOOL)isDeclared
{
  return 1;
}

- (void)_LSRecord_resolve_parentTypeIdentifiers
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord parentTypeIdentifiers](self, "parentTypeIdentifiers");
}

- (id)parentTypeIdentifiers
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_parentTypeIdentifiersWithContext_tableID_unitID_unitBytes_);
}

- (void)_LSRecord_resolve_pedigree
{
  id v2;

  v2 = -[_UTDeclaredTypeRecord pedigree](self, "pedigree");
}

- (id)pedigree
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_pedigreeWithContext_tableID_unitID_unitBytes_);
}

- (id)_localizedDescriptionWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  return -[_LSLocalizedStringRecord _initWithContext:unitID:]([_LSLocalizedStringRecord alloc], "_initWithContext:unitID:", a3, _UTGetLocalizedDescription(a3->db, a5));
}

- (id)childTypeIdentifiersWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  id v8;
  _LSDatabase *db;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  LSContext *v18;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  db = a3->db;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __82___UTDeclaredTypeRecord_childTypeIdentifiersWithContext_tableID_unitID_unitBytes___block_invoke;
  v16 = &unk_1E1046218;
  v18 = a3;
  v10 = v8;
  v17 = v10;
  _UTTypeSearchConformingTypesWithBlock(db, a5, 1, 0, (uint64_t)&v13);
  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

- (id)_declaringBundleBookmarkWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  int *BundleBaseData;
  void *v8;
  void *v9;

  BundleBaseData = (int *)_UTTypeGetBundleBaseData(a3->db, (uint64_t)a6);
  if (BundleBaseData)
  {
    _LSAliasGet(a3->db, *BundleBaseData);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)pedigreeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  void *PedigreeInternal;
  void *v7;
  id v8;
  void *v9;

  PedigreeInternal = (void *)_UTTypeGetPedigreeInternal((uint64_t *)a3, a5);
  v7 = PedigreeInternal;
  if (PedigreeInternal)
  {
    v8 = PedigreeInternal;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)tagSpecificationWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  unsigned int EntryCount;
  void *v9;
  unsigned int i;
  _DWORD *EntryAtIndex;
  void *v12;
  id v13;
  uint64_t v14;
  _DWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;

  if (!a6->var13)
    goto LABEL_21;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  EntryCount = _LSBindingListGetEntryCount();
  v9 = v22;
  if (EntryCount)
  {
    for (i = 0; i != EntryCount; ++i)
    {
      EntryAtIndex = _LSBindingListGetEntryAtIndex(a3->db, a6->var13, i);
      if (EntryAtIndex)
      {
        v12 = (void *)_CSStringCopyCFString();
        if (v12)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v14 = EntryAtIndex[1];
          if ((_DWORD)v14)
          {
            v15 = EntryAtIndex + 2;
            do
            {
              ++v15;
              v16 = (void *)_CSStringCopyCFString();
              if (v16)
                objc_msgSend(v13, "addObject:", v16);

              --v14;
            }
            while (v14);
          }
          v9 = v22;
          if (objc_msgSend(v13, "count"))
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v13);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v19 = (void *)objc_msgSend(v13, "copy");
            }
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, v12);

          }
        }

      }
    }
  }
  if (v9)
  {
    +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_21:
    _LSLazyPropertyListGetSharedEmptyPropertyList();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v20;
}

- (void)_enumerateRelatedTypeStructuresWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6
{
  _LSDatabase *v6;
  uint64_t v7;
  _LSDatabase *db;
  _QWORD v9[6];
  _QWORD v10[6];

  if (a5 < 1)
  {
    if (a5 < 0)
    {
      if (a5 == 0x8000000000000000)
        v7 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v7 = -a5;
      db = a3->db;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __107___UTDeclaredTypeRecord__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke_2;
      v9[3] = &unk_1E1046410;
      v9[4] = a6;
      v9[5] = a3;
      _UTTypeSearchConformingTypesWithBlock(db, a4, v7, 0, (uint64_t)v9);
    }
  }
  else
  {
    v6 = a3->db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __107___UTDeclaredTypeRecord__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke;
    v10[3] = &unk_1E1046410;
    v10[4] = a6;
    v10[5] = a3;
    _UTTypeSearchConformsToTypesWithBlock((uint64_t)v6, a4, a5, 0, (uint64_t)v10);
  }
}

- (BOOL)isInPublicDomain
{
  return (-[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") >> 1) & 1;
}

- (BOOL)isExported
{
  return (-[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") >> 4) & 1;
}

- (BOOL)isImported
{
  return (-[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") & 0x10) == 0;
}

- (BOOL)isActive
{
  return -[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") & 1;
}

- (BOOL)isCoreType
{
  return (-[_UTDeclaredTypeRecord _rawFlags](self, "_rawFlags") >> 5) & 1;
}

- (void)_enumerateRelatedTypeUnitsOrDynamicIdsWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __114___UTDeclaredTypeRecord__enumerateRelatedTypeUnitsOrDynamicIdsWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke;
  v6[3] = &unk_1E1046488;
  v6[4] = a6;
  -[_UTDeclaredTypeRecord _enumerateRelatedTypeStructuresWithContext:unitID:maximumDegreeOfSeparation:block:](self, "_enumerateRelatedTypeStructuresWithContext:unitID:maximumDegreeOfSeparation:block:", a3, *(_QWORD *)&a4, a5, v6);
}

+ (id)_propertyClasses
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UTDeclaredTypeRecord;
  v4 = -[LSRecord copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakDeclaringBundleRecord);
    objc_storeWeak(v4 + 4, WeakRetained);

  }
  return v4;
}

@end
