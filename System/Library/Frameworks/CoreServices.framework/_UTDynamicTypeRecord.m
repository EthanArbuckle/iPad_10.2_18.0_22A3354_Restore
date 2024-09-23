@implementation _UTDynamicTypeRecord

- (id)pedigreeWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(id *)a6
{
  void *Pedigree;
  void *v7;
  id v8;
  void *v9;

  Pedigree = (void *)_UTDynamicGetPedigree((uint64_t)a3, (__CFString *)self->_identifier);
  v7 = Pedigree;
  if (Pedigree)
  {
    v8 = Pedigree;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isDynamic
{
  return 1;
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[_UTDynamicTypeRecord isChildOfTypeIdentifier:](self, "isChildOfTypeIdentifier:", v4))
  {
    v5 = 1;
    v6 = v4;
  }
  else
  {
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UTDynamicTypeRecord pedigree](self, "pedigree");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v5 = objc_msgSend(v7, "containsObject:", v6);
    else
      v5 = 0;

  }
  return v5;
}

- (void)_LSRecord_resolve_pedigree
{
  id v2;

  v2 = -[_UTDynamicTypeRecord pedigree](self, "pedigree");
}

- (id)pedigree
{
  return __LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)a2, sel_pedigreeWithContext_tableID_unitID_unitBytes_);
}

- (BOOL)isChildOfTypeIdentifier:(id)a3
{
  const __CFString *identifier;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  identifier = (const __CFString *)self->_identifier;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48___UTDynamicTypeRecord_isChildOfTypeIdentifier___block_invoke;
  v6[3] = &unk_1E10464B0;
  v6[4] = a3;
  v6[5] = &v7;
  _UTDynamicEnumerateParentIdentifiers(identifier, (uint64_t)v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)_initWithContext:(LSContext *)a3 dynamicUTI:(id)a4
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UTDynamicTypeRecord;
  v5 = -[LSRecord _initWithContext:tableID:unitID:](&v9, sel__initWithContext_tableID_unitID_);
  if (v5)
  {
    v6 = objc_msgSend(a4, "copy");
    v7 = (void *)v5[4];
    v5[4] = v6;

  }
  return v5;
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UTDynamicTypeRecord;
  -[LSRecord _persistentIdentifierWithContext:tableID:unitID:unitBytes:](&v12, sel__persistentIdentifierWithContext_tableID_unitID_unitBytes_, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[NSString dataUsingEncoding:](self->_identifier, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "appendData:", v9);

  v10 = (void *)objc_msgSend(v8, "copy");
  return v10;
}

- (id)preferredTagOfClass:(id)a3
{
  return _UTDynamicGetFirstTag((const __CFString *)self->_identifier, (const __CFString *)a3);
}

- (id)tagSpecification
{
  void *TagSpecification;
  void *v3;

  TagSpecification = (void *)_UTDynamicGetTagSpecification((const __CFString *)self->_identifier);
  if (TagSpecification)
    +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, TagSpecification);
  else
    _LSLazyPropertyListGetSharedEmptyPropertyList();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)version
{
  return 0;
}

- (BOOL)isDeclared
{
  return 0;
}

- (BOOL)isWildcard
{
  return 0;
}

- (BOOL)isInPublicDomain
{
  return 0;
}

- (BOOL)isExported
{
  return 0;
}

- (BOOL)isImported
{
  return 0;
}

- (BOOL)isActive
{
  return 0;
}

- (BOOL)isCoreType
{
  return 0;
}

- (id)declaringBundleRecord
{
  return 0;
}

- (id)declaration
{
  id v3;
  void *TagSpecification;
  void *ParentIdentifiers;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("UTTypeIdentifier"));
  TagSpecification = (void *)_UTDynamicGetTagSpecification((const __CFString *)self->_identifier);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", TagSpecification, CFSTR("UTTypeTagSpecification"));

  ParentIdentifiers = (void *)_UTDynamicGetParentIdentifiers((const __CFString *)self->_identifier);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", ParentIdentifiers, CFSTR("UTTypeConformsTo"));

  +[_LSLazyPropertyList lazyPropertyListWithPropertyList:]((uint64_t)_LSLazyPropertyList, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)referenceURL
{
  return 0;
}

- (id)parentTypeIdentifiers
{
  void *ParentIdentifiers;
  id v3;
  void *v4;

  ParentIdentifiers = (void *)_UTDynamicGetParentIdentifiers((const __CFString *)self->_identifier);
  if (ParentIdentifiers)
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", ParentIdentifiers);
  else
    v3 = objc_alloc_init(MEMORY[0x1E0C99E40]);
  v4 = v3;

  return v4;
}

- (id)childTypeIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)_localizedDescription
{
  return 0;
}

- (id)_declaringBundleBookmark
{
  return 0;
}

- (id)_delegatePath
{
  return 0;
}

- (void)_enumerateRelatedTypeUnitsOrDynamicIdsWithContext:(LSContext *)a3 unitID:(unsigned int)a4 maximumDegreeOfSeparation:(int64_t)a5 block:(id)a6
{
  uint64_t v6;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  _LSDatabase *db;
  _QWORD v16[7];
  _QWORD v17[2];
  int v18;
  char v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[10];
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a5 - 1;
  if (a5 >= 1)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x5812000000;
    v29[3] = __Block_byref_object_copy__239;
    v29[4] = __Block_byref_object_dispose__240;
    memset(&v29[5], 0, 40);
    v30 = 1065353216;
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[_UTDynamicTypeRecord parentTypeIdentifiers](self, "parentTypeIdentifiers", a3, *(_QWORD *)&a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v22;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(__CFString **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        v20 = 0;
        if (_UTTypeIdentifierIsDynamic(v13))
        {
          v14 = (void *)MEMORY[0x186DAE7A0]();
          if ((objc_msgSend(0, "containsObject:", v13) & 1) == 0)
          {
            objc_msgSend(0, "addObject:", v13);
            v17[0] = v13;
            v17[1] = 1;
            v18 = 0;
            v19 = 0;
            (*((void (**)(id, _QWORD *, uint64_t *))a6 + 2))(a6, v17, v26 + 3);
          }
          objc_autoreleasePoolPop(v14);
        }
        else if (_UTGetActiveTypeForCFStringIdentifier(a3->db, v13, &v20))
        {
          db = a3->db;
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __113___UTDynamicTypeRecord__enumerateRelatedTypeUnitsOrDynamicIdsWithContext_unitID_maximumDegreeOfSeparation_block___block_invoke;
          v16[3] = &unk_1E10464D8;
          v16[4] = a6;
          v16[5] = v29;
          v16[6] = &v25;
          _UTTypeSearchConformsToTypesWithBlock((uint64_t)db, v20, v6, 0, (uint64_t)v16);
        }
        if (*((_BYTE *)v26 + 24))
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(v29, 8);
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)&v29[6]);
  }
}

+ (id)_propertyClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UTDynamicTypeRecord;
  -[LSRecord encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
}

- (_UTDynamicTypeRecord)initWithCoder:(id)a3
{
  _UTDynamicTypeRecord *v4;
  uint64_t v5;
  NSString *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UTDynamicTypeRecord;
  v4 = -[LSRecord initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v5;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UTDynamicTypeRecord;
  v4 = -[LSRecord copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 4, self->_identifier);
  return v5;
}

@end
