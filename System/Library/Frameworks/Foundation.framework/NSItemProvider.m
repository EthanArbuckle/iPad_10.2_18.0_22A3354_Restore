@implementation NSItemProvider

- (NSItemProvider)init
{
  NSItemProvider *v2;
  NSItemProvider *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSItemProvider;
  v2 = -[NSItemProvider init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NSItemProvider _commonInitGenerateUUID:](v2, "_commonInitGenerateUUID:", 1);
  return v3;
}

- (void)_commonInitGenerateUUID:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  self->_typeOrder = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  self->_representationByType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_preferredRepresentationByType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_metadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v3)
    self->_UUID = objc_alloc_init(NSUUID);
}

- (void)registerDataRepresentationForTypeIdentifier:(NSString *)typeIdentifier visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler
{
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke;
  v7[3] = &unk_1E0F501B0;
  v7[4] = loadHandler;
  -[NSItemProvider _addRepresentationType:preferredRepresentation:visibility:loader:](self, "_addRepresentationType:preferredRepresentation:visibility:loader:", typeIdentifier, 0, visibility, v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_preferredRepresentationByType, "setObject:forKeyedSubscript:", &off_1E0FBDED8, typeIdentifier);
}

- (void)_addRepresentationType:(id)a3 preferredRepresentation:(int64_t)a4 visibility:(int64_t)a5 loader:(id)a6
{
  NSItemProviderRepresentation *v8;

  v8 = -[NSItemProviderRepresentation initWithType_v2:preferredRepresentation:loader:]([NSItemProviderRepresentation alloc], "initWithType_v2:preferredRepresentation:loader:", a3, a4, a6);
  -[NSItemProviderRepresentation setVisibility:](v8, "setVisibility:", a5);
  -[NSItemProvider _setItemRepresentation:](self, "_setItemRepresentation:", v8);

}

- (void)_setItemRepresentation:(id)a3
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(a3, "typeIdentifier");
  -[NSMutableOrderedSet addObject:](self->_typeOrder, "addObject:", v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_representationByType, "setObject:forKeyedSubscript:", a3, v5);
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_preferredRepresentationByType, "objectForKeyedSubscript:", v5);
  if (v6)
    objc_msgSend(a3, "setPreferredRepresentation:", objc_msgSend(v6, "unsignedIntegerValue"));
  else
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_preferredRepresentationByType, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "preferredRepresentation")), v5);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataTransferDelegate);
}

- (void)_addRepresentationType_v2:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
  -[NSItemProvider _addRepresentationType:preferredRepresentation:visibility:loader:](self, "_addRepresentationType:preferredRepresentation:visibility:loader:", a3, a4, 0, a5);
}

- (id)_representationForType:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](-[NSItemProvider _representationByType](self, "_representationByType"), "objectForKeyedSubscript:", a3);
}

- (NSMutableDictionary)_representationByType
{
  return self->_representationByType;
}

- (id)_representationConformingToType:(id)a3
{
  id result;

  result = (id)_bestMatchType((uint64_t)a3, (void *)-[NSMutableOrderedSet array](-[NSItemProvider _typeOrder](self, "_typeOrder"), "array"), (uint64_t)&__block_literal_global_288);
  if (result)
    return -[NSItemProvider _representationForType:](self, "_representationForType:", result);
  return result;
}

- (NSMutableOrderedSet)_typeOrder
{
  return self->_typeOrder;
}

- (id)_metadataValueForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSItemProvider;
  -[NSItemProvider dealloc](&v3, sel_dealloc);
}

- (NSArray)registeredTypeIdentifiers
{
  return -[NSItemProvider registeredTypeIdentifiersWithFileOptions:](self, "registeredTypeIdentifiersWithFileOptions:", 0);
}

- (NSArray)registeredTypeIdentifiersWithFileOptions:(NSItemProviderFileOptions)fileOptions
{
  if ((fileOptions & 1) != 0)
    return (NSArray *)-[NSItemProvider _availableTypesWithFilterBlock:](self, "_availableTypesWithFilterBlock:", &__block_literal_global_42);
  else
    return (NSArray *)-[NSItemProvider _availableTypes](self, "_availableTypes");
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (id)_availableTypes
{
  return (id)objc_msgSend((id)-[NSMutableOrderedSet array](self->_typeOrder, "array"), "copy");
}

- (BOOL)_hasRepresentationOfType:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](-[NSItemProvider _typeOrder](self, "_typeOrder"), "containsObject:", a3);
}

- (BOOL)_hasRepresentationConformingToType:(id)a3
{
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[NSItemProvider _typeOrder](self, "_typeOrder");
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (((uint64_t (*)(uint64_t, uint64_t))off_1ECD04CF0)(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (uint64_t)a3))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (id)_availableTypesWithFilterBlock:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = -[NSItemProvider _availableTypes](self, "_availableTypes");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", v11);
        if (v12 && (*((unsigned int (**)(id, id))a3 + 2))(a3, v12))
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v8);
  }
  return v6;
}

- (void)_addRepresentationType:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke;
  v5[3] = &unk_1E0F501B0;
  v5[4] = a5;
  -[NSItemProvider _addRepresentationType_v2:preferredRepresentation:loader:](self, "_addRepresentationType_v2:preferredRepresentation:loader:", a3, a4, v5);
}

uint64_t __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke_2;
  v8[3] = &unk_1E0F50188;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, v8, a4, a5, a6);
}

uint64_t __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(_QWORD, NSItemRepresentationLoadResult *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:](NSItemRepresentationLoadResult, "resultWithData:urlWrapper:cleanupHandler:error:", a2, a3, a5, a4));
}

- (id)representations
{
  return (id)-[NSMutableDictionary allValues](self->_representationByType, "allValues");
}

- (void)_setMetadataValue:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *metadata;

  metadata = self->_metadata;
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](metadata, "setObject:forKeyedSubscript:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](metadata, "removeObjectForKey:", a4);
}

- (void)setSuggestedName:(NSString *)suggestedName
{
  NSString *v5;

  objc_sync_enter(self);
  v5 = self->_suggestedName;
  if (v5 != suggestedName)
  {
    self->_suggestedName = (NSString *)-[NSString copy](suggestedName, "copy");

    self->_sanitizedSuggestedName = 0;
  }
  objc_sync_exit(self);
}

- (NSString)_sanitizedSuggestedName
{
  NSString *sanitizedSuggestedName;
  NSString *v4;
  NSString *suggestedName;

  objc_sync_enter(self);
  sanitizedSuggestedName = self->_sanitizedSuggestedName;
  if (sanitizedSuggestedName)
  {
    v4 = sanitizedSuggestedName;
  }
  else
  {
    suggestedName = self->_suggestedName;
    if (suggestedName)
    {
      v4 = _NSIPSanitizedFilename(suggestedName);
      self->_sanitizedSuggestedName = v4;
    }
    else
    {
      v4 = 0;
    }
  }
  objc_sync_exit(self);
  return v4;
}

BOOL __59__NSItemProvider_registeredTypeIdentifiersWithFileOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "preferredRepresentation") == 2;
}

- (BOOL)hasRepresentationConformingToTypeIdentifier:(NSString *)typeIdentifier fileOptions:(NSItemProviderFileOptions)fileOptions
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((fileOptions & 1) != 0)
  {
    v7 = -[NSItemProvider _availableTypes](self, "_availableTypes");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
          if (objc_msgSend(v11, "preferredRepresentation") == 2)
          {
            v12 = objc_msgSend(v11, "typeIdentifier");
            if (((uint64_t (*)(uint64_t, uint64_t))off_1ECD04CF0)(v12, (uint64_t)typeIdentifier))
            {
              LOBYTE(v6) = 1;
              return v6;
            }
          }
          ++v10;
        }
        while (v8 != v10);
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        v8 = v6;
        if (v6)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v6) = -[NSItemProvider _hasRepresentationConformingToType:](self, "_hasRepresentationConformingToType:", typeIdentifier);
  }
  return v6;
}

uint64_t __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke_2;
  v8[3] = &unk_1E0F501F8;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v8, a3, a4, a5, a6);
}

uint64_t __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSItemRepresentationLoadResult *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:](NSItemRepresentationLoadResult, "resultWithData:urlWrapper:cleanupHandler:error:", a2, 0, 0, a3));
}

- (void)registerFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier fileOptions:(NSItemProviderFileOptions)fileOptions visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler
{
  __objc2_class **v8;
  uint64_t v9;

  if ((fileOptions & 1) != 0)
    v8 = &off_1E0FBDEF0;
  else
    v8 = &off_1E0FBDF08;
  LOBYTE(v9) = fileOptions == 0;
  -[NSItemProvider _addRepresentationType:preferredRepresentation:visibility:loader:](self, "_addRepresentationType:preferredRepresentation:visibility:loader:", COERCE_DOUBLE(3221225472), MEMORY[0x1E0C809B0], 3221225472, __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke, &unk_1E0F50298, typeIdentifier, loadHandler, v9, *MEMORY[0x1E0C80C00]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_preferredRepresentationByType, "setObject:forKeyedSubscript:", v8, typeIdentifier);
}

uint64_t __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[6];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2;
  v5[3] = &unk_1E0F50270;
  v6 = *(_BYTE *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = a3;
  return (*(uint64_t (**)(uint64_t, _QWORD *))(v3 + 16))(v3, v5);
}

void __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2(uint64_t a1, void *a2, int a3, NSError *a4)
{
  NSError *v4;
  NSError *v6;
  NSSecurityScopedURLWrapper *v9;
  NSObject *v10;
  NSError *RepresentationError;
  uint64_t v12;
  int v13;
  NSFileCoordinator *v14;
  uint64_t v15;
  uint64_t v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  uint64_t v38;
  __int128 buf;
  id (*v40)(_QWORD *);
  void *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__13;
  v27 = __Block_byref_object_dispose__13;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__32;
  v21 = __Block_byref_object_dispose__33;
  v6 = a4;
  v22 = 0;
  if (!a2)
    goto LABEL_17;
  v6 = a4;
  if (a4)
    goto LABEL_17;
  if (!objc_msgSend(a2, "isFileURL"))
  {
    v10 = _NSOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = a2;
      _os_log_error_impl(&dword_1817D9000, v10, OS_LOG_TYPE_ERROR, "URL %@ is not a file:// URL.", (uint8_t *)&buf, 0xCu);
    }
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), 0);
    goto LABEL_16;
  }
  if (softLinkFPIsFileProviderBookmark((uint64_t)a2, 0))
  {
    v9 = -[NSSecurityScopedURLWrapper initWithURL:readonly:]([NSSecurityScopedURLWrapper alloc], "initWithURL:readonly:", a2, *(unsigned __int8 *)(a1 + 48));
    v6 = 0;
    v24[5] = (uint64_t)v9;
    goto LABEL_17;
  }
  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = (uint64_t)__97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_35;
  v16[3] = (uint64_t)&unk_1E0F50220;
  v16[4] = *(_QWORD *)(a1 + 32);
  v16[5] = (uint64_t)&v23;
  v16[6] = (uint64_t)&v17;
  if (!a3)
  {
    RepresentationError = __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_35(v16, a2);
LABEL_16:
    v6 = RepresentationError;
    goto LABEL_17;
  }
  v13 = objc_msgSend(a2, "startAccessingSecurityScopedResource");
  v14 = -[NSFileCoordinator initWithFilePresenter:]([NSFileCoordinator alloc], "initWithFilePresenter:", 0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3052000000;
  v36 = __Block_byref_object_copy__13;
  v37 = __Block_byref_object_dispose__13;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  *(_QWORD *)&buf = v12;
  *((_QWORD *)&buf + 1) = 3221225472;
  v40 = ___synchronousCoordinatedRead_block_invoke;
  v41 = &unk_1E0F50900;
  v42 = v16;
  v43 = &v33;
  v44 = &v29;
  -[NSFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:](v14, "coordinateReadingItemAtURL:options:error:byAccessor:", a2, 1, &v38, &buf);
  if (v13)
    objc_msgSend(a2, "stopAccessingSecurityScopedResource");

  v6 = (NSError *)v34[5];
  if (*((_BYTE *)v30 + 24))
    v6 = v6;
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
LABEL_17:
  if (!(v24[5] | (unint64_t)v6))
    v6 = _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), 0);
  if (v6)
  {
    if (v4)
    {
      v15 = *(_QWORD *)(a1 + 32);
      if (!-[NSString isEqualToString:](-[NSError domain](v4, "domain"), "isEqualToString:", CFSTR("NSItemProviderErrorDomain")))v4 = _NSIPCannotLoadRepresentationError(v15, (uint64_t)v4);
    }
  }
  (*(void (**)(_QWORD, NSItemRepresentationLoadResult *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:](NSItemRepresentationLoadResult, "resultWithData:urlWrapper:cleanupHandler:error:", 0, v24[5], v18[5], v4));

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

NSError *__97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_35(uint64_t *a1, void *a2)
{
  void *v3;
  _QWORD v5[5];
  char *v6;
  NSError *v7[2];

  v7[1] = *(NSError **)MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v6 = 0;
  v3 = _NSIPCloneURLToTemporaryFolder(a2, a1[4], 0, &v6, v7);
  if (!v3)
    return _NSIPCannotLoadRepresentationError(a1[4], 0);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = -[NSSecurityScopedURLWrapper initWithURL:readonly:]([NSSecurityScopedURLWrapper alloc], "initWithURL:readonly:", v3, 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2_36;
  v5[3] = &unk_1E0F4D2D8;
  v5[4] = v6;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = objc_msgSend(v5, "copy");
  return v7[0];
}

BOOL __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2_36(uint64_t a1)
{
  return -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);
}

- (NSProgress)loadDataRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler
{
  _NSIPCallbackSerialization *v7;
  id v8;
  uint64_t v9;
  NSProgress *v10;
  NSObject *v11;
  _QWORD v13[6];
  id v14;
  _QWORD block[8];
  id v16;
  _QWORD v17[8];
  id v18;
  id location;
  __int128 buf;
  uint64_t (*v21)(uint64_t);
  void *v22;
  _NSIPCallbackSerialization *v23;
  _QWORD *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(_NSIPCallbackSerialization);
  objc_initWeak(&location, v7);
  v8 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", typeIdentifier);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v17[3] = &unk_1E0F50310;
    v17[4] = typeIdentifier;
    v17[5] = v7;
    objc_copyWeak(&v18, &location);
    v17[6] = self;
    v17[7] = completionHandler;
    v10 = (NSProgress *)objc_msgSend(v8, "loadDataWithOptions_v2:completionHandler:", 0, v17);
    objc_destroyWeak(&v18);
    if (v10)
      goto LABEL_8;
  }
  else
  {
    v11 = _NSOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = typeIdentifier;
      _os_log_error_impl(&dword_1817D9000, v11, OS_LOG_TYPE_ERROR, "Cannot find representation conforming to type %@", (uint8_t *)&buf, 0xCu);
    }
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_46;
    block[3] = &unk_1E0F50338;
    block[4] = v7;
    objc_copyWeak(&v16, &location);
    block[6] = typeIdentifier;
    block[7] = completionHandler;
    block[5] = self;
    _NSIPDispatchAsyncCallback(block);
    objc_destroyWeak(&v16);
  }
  v10 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  -[NSProgress setCompletedUnitCount:](v10, "setCompletedUnitCount:", -[NSProgress totalUnitCount](v10, "totalUnitCount"));
LABEL_8:
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3_48;
  v13[3] = &unk_1E0F50360;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  v13[5] = v10;
  if (v7)
  {
    *(_QWORD *)&buf = v9;
    *((_QWORD *)&buf + 1) = 3221225472;
    v21 = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
    v22 = &unk_1E0F50148;
    v23 = v7;
    v24 = v13;
    _NSIPDispatchAsyncCallback(&buf);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v10;
}

void __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v4;
  NSError *RepresentationError;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[9];
  id v9[2];

  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = (NSError *)objc_msgSend(a2, "error");
  RepresentationError = v4;
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!-[NSString isEqualToString:](-[NSError domain](v4, "domain"), "isEqualToString:", CFSTR("NSItemProviderErrorDomain")))RepresentationError = _NSIPCannotLoadRepresentationError(v6, (uint64_t)RepresentationError);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_1E0F502E8;
  block[4] = *(_QWORD *)(a1 + 40);
  objc_copyWeak(v9, (id *)(a1 + 64));
  v7 = *(_QWORD *)(a1 + 56);
  block[5] = *(_QWORD *)(a1 + 48);
  block[6] = a2;
  block[7] = RepresentationError;
  block[8] = v7;
  _NSIPDispatchAsyncCallback(block);
  objc_destroyWeak(v9);
}

void __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_4;
  v5[3] = &unk_1E0F502C0;
  objc_copyWeak(&v6, (id *)(a1 + 72));
  v5[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, objc_msgSend(*(id *)(a1 + 48), "data"), *(_QWORD *)(a1 + 56));
  objc_destroyWeak(&v6);
}

uint64_t __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

void __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_46(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSError *RepresentationError;
  _QWORD v6[5];
  id v7;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2_47;
  v6[3] = &unk_1E0F502C0;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  v6[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v6;
    _NSIPDispatchAsyncCallback(block);
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 48), 0);
    (*(void (**)(uint64_t, _QWORD, NSError *))(v4 + 16))(v4, 0, RepresentationError);
  }
  objc_destroyWeak(&v7);
}

uint64_t __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2_47(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

uint64_t __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3_48(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 48));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:beganDataTransferTransactionUUID:progress:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
}

- (NSProgress)loadFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler
{
  _NSIPCallbackSerialization *v7;
  id v8;
  uint64_t v9;
  NSProgress *v10;
  NSObject *v11;
  _QWORD v13[6];
  id v14;
  _QWORD block[8];
  id v16;
  _QWORD v17[9];
  id v18;
  id location;
  __int128 buf;
  uint64_t (*v21)(uint64_t);
  void *v22;
  _NSIPCallbackSerialization *v23;
  _QWORD *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(_NSIPCallbackSerialization);
  objc_initWeak(&location, v7);
  v8 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", typeIdentifier);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v17[3] = &unk_1E0F505A8;
    v17[4] = typeIdentifier;
    v17[5] = v7;
    objc_copyWeak(&v18, &location);
    v17[7] = v8;
    v17[8] = completionHandler;
    v17[6] = self;
    v10 = (NSProgress *)objc_msgSend(v8, "loadFileCopyWithOptions_v2:completionHandler:", 0, v17);
    objc_destroyWeak(&v18);
    if (v10)
      goto LABEL_8;
  }
  else
  {
    v11 = _NSOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = typeIdentifier;
      _os_log_error_impl(&dword_1817D9000, v11, OS_LOG_TYPE_ERROR, "No appropriate representation found for type %@", (uint8_t *)&buf, 0xCu);
    }
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_51;
    block[3] = &unk_1E0F50338;
    block[4] = v7;
    objc_copyWeak(&v16, &location);
    block[6] = typeIdentifier;
    block[7] = completionHandler;
    block[5] = self;
    _NSIPDispatchAsyncCallback(block);
    objc_destroyWeak(&v16);
  }
  v10 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  -[NSProgress setCompletedUnitCount:](v10, "setCompletedUnitCount:", -[NSProgress totalUnitCount](v10, "totalUnitCount"));
LABEL_8:
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_53;
  v13[3] = &unk_1E0F50360;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  v13[5] = v10;
  if (v7)
  {
    *(_QWORD *)&buf = v9;
    *((_QWORD *)&buf + 1) = 3221225472;
    v21 = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
    v22 = &unk_1E0F50148;
    v23 = v7;
    v24 = v13;
    _NSIPDispatchAsyncCallback(&buf);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v10;
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v4;
  NSError *RepresentationError;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSError *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[10];
  id v16;
  char *v17;
  _QWORD block[8];
  id v19;
  _BYTE buf[12];
  __int16 v21;
  NSError *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (NSError *)objc_msgSend(a2, "error");
  if (v4)
  {
    RepresentationError = v4;
    v6 = *(_QWORD *)(a1 + 32);
    if (!-[NSString isEqualToString:](-[NSError domain](v4, "domain"), "isEqualToString:", CFSTR("NSItemProviderErrorDomain")))RepresentationError = _NSIPCannotLoadRepresentationError(v6, (uint64_t)RepresentationError);
    v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      v21 = 2112;
      v22 = RepresentationError;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "Error copying file type %@. Error: %@", buf, 0x16u);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_49;
    block[3] = &unk_1E0F50338;
    block[4] = *(_QWORD *)(a1 + 40);
    objc_copyWeak(&v19, (id *)(a1 + 72));
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 64);
    block[6] = RepresentationError;
    block[7] = v9;
    block[5] = v8;
    _NSIPDispatchAsyncCallback(block);
    objc_destroyWeak(&v19);
  }
  else
  {
    *(_QWORD *)buf = 0;
    v17 = 0;
    v10 = _NSIPCloneURLToTemporaryFolder((void *)objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"), objc_msgSend(*(id *)(a1 + 56), "typeIdentifier"), (void *)objc_msgSend(*(id *)(a1 + 48), "_sanitizedSuggestedName"), &v17, (NSError **)buf);
    v11 = *(NSError **)buf;
    if (*(_QWORD *)buf)
    {
      v12 = *(_QWORD *)(a1 + 32);
      if ((objc_msgSend((id)objc_msgSend(*(id *)buf, "domain"), "isEqualToString:", CFSTR("NSItemProviderErrorDomain")) & 1) == 0)
        v11 = _NSIPCannotLoadRepresentationError(v12, (uint64_t)v11);
      *(_QWORD *)buf = v11;
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_4;
    v15[3] = &unk_1E0F503B0;
    v15[4] = *(_QWORD *)(a1 + 40);
    objc_copyWeak(&v16, (id *)(a1 + 72));
    v13 = *(_QWORD *)(a1 + 64);
    v15[5] = *(_QWORD *)(a1 + 48);
    v15[6] = v10;
    v15[7] = *(_QWORD *)buf;
    v15[8] = v17;
    v15[9] = v13;
    _NSIPDispatchAsyncCallback(v15);
    objc_destroyWeak(&v16);
  }
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_49(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_50;
  v5[3] = &unk_1E0F502C0;
  objc_copyWeak(&v6, (id *)(a1 + 64));
  v5[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, *(_QWORD *)(a1 + 48));
  objc_destroyWeak(&v6);
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_50(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_5;
  v5[3] = &unk_1E0F502C0;
  objc_copyWeak(&v6, (id *)(a1 + 80));
  v5[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }
  v4 = *(_QWORD *)(a1 + 72);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (*(_QWORD *)(a1 + 64))
    -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", *(_QWORD *)(a1 + 64), 0);
  objc_destroyWeak(&v6);
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_5(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_51(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSError *RepresentationError;
  _QWORD v6[5];
  id v7;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_52;
  v6[3] = &unk_1E0F502C0;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  v6[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v6;
    _NSIPDispatchAsyncCallback(block);
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 48), 0);
    (*(void (**)(uint64_t, _QWORD, NSError *))(v4 + 16))(v4, 0, RepresentationError);
  }
  objc_destroyWeak(&v7);
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_52(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_53(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 48));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:beganDataTransferTransactionUUID:progress:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
}

- (NSProgress)loadInPlaceFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler
{
  _NSIPCallbackSerialization *v7;
  NSProgress *v8;
  id v9;
  uint64_t v10;
  NSProgress *v11;
  id *v12;
  uint64_t v13;
  NSError *RepresentationError;
  NSObject *v15;
  _QWORD v17[6];
  id v18;
  _QWORD block[6];
  _QWORD v20[5];
  id v21;
  _QWORD v22[10];
  id v23;
  id location;
  __int128 buf;
  uint64_t (*v26)(uint64_t);
  void *v27;
  _NSIPCallbackSerialization *v28;
  _QWORD *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(_NSIPCallbackSerialization);
  objc_initWeak(&location, v7);
  v8 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  v9 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", typeIdentifier);
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v11 = +[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", 100);
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v22[3] = &unk_1E0F50440;
    v22[4] = self;
    v22[5] = v9;
    v22[6] = typeIdentifier;
    v22[7] = v7;
    v12 = &v23;
    objc_copyWeak(&v23, &location);
    v22[8] = v11;
    v22[9] = completionHandler;
    v13 = objc_msgSend(v9, "loadOpenInPlaceWithOptions_v2:completionHandler:", 0, v22);
    if (v13)
      -[NSProgress addChild:withPendingUnitCount:](v8, "addChild:withPendingUnitCount:", v13, 50);
    else
      -[NSProgress setCompletedUnitCount:](v8, "setCompletedUnitCount:", 50);
    -[NSProgress addChild:withPendingUnitCount:](v8, "addChild:withPendingUnitCount:", v11, 50);
  }
  else
  {
    -[NSProgress setCompletedUnitCount:](v8, "setCompletedUnitCount:", -[NSProgress totalUnitCount](v8, "totalUnitCount"));
    RepresentationError = _NSIPCannotLoadRepresentationError((uint64_t)typeIdentifier, 0);
    v15 = _NSOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = typeIdentifier;
      _os_log_error_impl(&dword_1817D9000, v15, OS_LOG_TYPE_ERROR, "Could not find suitable representation of type %@.", (uint8_t *)&buf, 0xCu);
    }
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_59;
    v20[3] = &unk_1E0F502C0;
    v12 = &v21;
    objc_copyWeak(&v21, &location);
    v20[4] = self;
    if (v7)
    {
      *(_QWORD *)&buf = v10;
      *((_QWORD *)&buf + 1) = 3221225472;
      v26 = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
      v27 = &unk_1E0F50148;
      v28 = v7;
      v29 = v20;
      _NSIPDispatchAsyncCallback(&buf);
    }
    if (completionHandler)
    {
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_60;
      block[3] = &unk_1E0F4E060;
      block[4] = RepresentationError;
      block[5] = completionHandler;
      _NSIPDispatchAsyncCallback(block);
    }
  }
  objc_destroyWeak(v12);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_61;
  v17[3] = &unk_1E0F50360;
  objc_copyWeak(&v18, &location);
  v17[4] = self;
  v17[5] = v8;
  if (v7)
  {
    *(_QWORD *)&buf = v10;
    *((_QWORD *)&buf + 1) = 3221225472;
    v26 = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
    v27 = &unk_1E0F50148;
    v28 = v7;
    v29 = v17;
    _NSIPDispatchAsyncCallback(&buf);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v8;
}

void __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *RepresentationError;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[11];
  id v13;
  char v14;
  char *v15;
  NSError *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  NSError *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  RepresentationError = (NSError *)objc_msgSend(a2, "error");
  v15 = 0;
  v16 = RepresentationError;
  if (objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url") && !RepresentationError)
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    if ((objc_msgSend(a2, "wasOpenedInPlace") & 1) == 0)
      v5 = _NSIPCloneURLToTemporaryFolder((void *)objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"), objc_msgSend(*(id *)(a1 + 40), "typeIdentifier"), (void *)objc_msgSend(*(id *)(a1 + 32), "_sanitizedSuggestedName"), &v15, &v16);
    v6 = objc_msgSend(a2, "wasOpenedInPlace");
    if (!v16)
      goto LABEL_13;
LABEL_11:
    v8 = _NSOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v16;
      _os_log_error_impl(&dword_1817D9000, v8, OS_LOG_TYPE_ERROR, "Failed to open in place representation of type %@. Error: %@", buf, 0x16u);
    }
    goto LABEL_13;
  }
  if (RepresentationError)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (!-[NSString isEqualToString:](-[NSError domain](RepresentationError, "domain"), "isEqualToString:", CFSTR("NSItemProviderErrorDomain")))RepresentationError = _NSIPCannotLoadRepresentationError(v7, (uint64_t)RepresentationError);
  }
  v5 = 0;
  v6 = 0;
  v16 = RepresentationError;
  if (RepresentationError)
    goto LABEL_11;
LABEL_13:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_55;
  block[3] = &unk_1E0F50418;
  block[4] = *(_QWORD *)(a1 + 56);
  objc_copyWeak(&v13, (id *)(a1 + 80));
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  block[5] = *(_QWORD *)(a1 + 32);
  block[6] = v9;
  v14 = v6;
  block[7] = v5;
  block[8] = v16;
  block[9] = v15;
  block[10] = v10;
  _NSIPDispatchAsyncCallback(block);
  objc_destroyWeak(&v13);
}

void __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_55(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_56;
  v6[3] = &unk_1E0F502C0;
  objc_copyWeak(&v7, (id *)(a1 + 88));
  v6[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v6;
    _NSIPDispatchAsyncCallback(block);
  }
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  v4 = *(_QWORD *)(a1 + 80);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 64));
  v5 = *(_QWORD *)(a1 + 72);
  if (v5)
    _NSIPCoordinatedDelete(v5, (uint64_t)&__block_literal_global_58);
  objc_destroyWeak(&v7);
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_56(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

void __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3)
      -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", a2, 0);
  }
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_59(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_60(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_61(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 48));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:beganDataTransferTransactionUUID:progress:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
}

- (NSItemProvider)initWithObject:(id)object
{
  NSItemProvider *v4;
  NSItemProvider *v5;

  v4 = -[NSItemProvider init](self, "init");
  v5 = v4;
  if (v4)
    -[NSItemProvider registerObject:visibility:](v4, "registerObject:visibility:", object, 0);
  return v5;
}

- (void)registerObject:(id)object visibility:(NSItemProviderRepresentationVisibility)visibility
{
  char v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSItemProviderRepresentationVisibility v17;
  NSItemProviderRepresentationVisibility v18;
  void *v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  _QWORD v24[6];
  _QWORD v25[6];
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = objc_opt_respondsToSelector();
  v8 = object;
  if ((v7 & 1) == 0)
    v8 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend(v8, "writableTypeIdentifiersForItemProvider");
  v23 = objc_opt_respondsToSelector();
  v10 = objc_opt_respondsToSelector();
  objc_opt_class();
  v22 = objc_opt_respondsToSelector();
  objc_opt_class();
  v21 = objc_opt_respondsToSelector();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (!-[NSItemProvider _hasRepresentationOfType:](self, "_hasRepresentationOfType:", v15))
        {
          v16 = object;
          if ((v23 & 1) != 0)
          {
LABEL_12:
            v18 = objc_msgSend(v16, "itemProviderVisibilityForRepresentationWithTypeIdentifier:", v15);
            if (v18 <= visibility)
              v17 = visibility;
            else
              v17 = v18;
          }
          else
          {
            v17 = visibility;
            if ((v22 & 1) != 0)
            {
              v16 = (void *)objc_opt_class();
              goto LABEL_12;
            }
          }
          v19 = object;
          if ((v10 & 1) != 0)
          {
LABEL_18:
            v20 = objc_msgSend(v19, "_preferredRepresentationForItemProviderWritableTypeIdentifier:", v15);
            if (v20)
            {
              v24[0] = MEMORY[0x1E0C809B0];
              v24[1] = 3221225472;
              v24[2] = __44__NSItemProvider_registerObject_visibility___block_invoke_3;
              v24[3] = &unk_1E0F50490;
              v24[4] = object;
              v24[5] = v15;
              -[NSItemProvider registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:](self, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v15, v20 == 2, v17, v24);
              continue;
            }
          }
          else if ((v21 & 1) != 0)
          {
            v19 = (void *)objc_opt_class();
            goto LABEL_18;
          }
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __44__NSItemProvider_registerObject_visibility___block_invoke;
          v25[3] = &unk_1E0F50468;
          v25[4] = object;
          v25[5] = v15;
          -[NSItemProvider registerDataRepresentationForTypeIdentifier:visibility:loadHandler:](self, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v15, v17, v25);
          continue;
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    }
    while (v12);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSItemProvider _NSItemProviderDidRegisterObject:](self, "_NSItemProviderDidRegisterObject:", object);
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, NSError *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __44__NSItemProvider_registerObject_visibility___block_invoke_2;
  v8 = &unk_1E0F504B8;
  v9 = v2;
  v10 = a2;
  return objc_msgSend(v3, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:");
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke_2(uint64_t a1, uint64_t a2, NSError *RepresentationError)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, NSError *);
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 40);
  if (!a2 || RepresentationError)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), (uint64_t)RepresentationError);
    v4 = *(uint64_t (**)(uint64_t, uint64_t, NSError *))(v3 + 16);
    v5 = v3;
    a2 = 0;
  }
  else
  {
    v4 = *(uint64_t (**)(uint64_t, uint64_t, NSError *))(v3 + 16);
    v5 = *(_QWORD *)(a1 + 40);
  }
  return v4(v5, a2, RepresentationError);
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, NSError *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __44__NSItemProvider_registerObject_visibility___block_invoke_4;
  v8 = &unk_1E0F50530;
  v9 = v2;
  v10 = a2;
  return objc_msgSend(v3, "_loadFileRepresentationOfTypeIdentifier:forItemProviderCompletionHandler:");
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, NSError *RepresentationError)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, NSError *);
  uint64_t v7;

  v5 = *(_QWORD *)(a1 + 40);
  if (!a2 || RepresentationError)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), (uint64_t)RepresentationError);
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, NSError *))(v5 + 16);
    v7 = v5;
    a2 = 0;
  }
  else
  {
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, NSError *))(v5 + 16);
    v7 = *(_QWORD *)(a1 + 40);
  }
  return v6(v7, a2, a3, RepresentationError);
}

- (void)registerObjectOfClass:(id)aClass visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler
{
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSItemProviderRepresentationVisibility v16;
  NSItemProviderRepresentationVisibility v17;
  uint64_t v18;
  NSObject *v19;
  char v20;
  _QWORD v22[6];
  _QWORD v23[6];
  uint8_t buf[4];
  NSString *v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(aClass, "writableTypeIdentifiersForItemProvider");
    v20 = objc_opt_respondsToSelector();
    v9 = aClass;
    v10 = objc_opt_respondsToSelector();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v8);
          v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (!-[NSItemProvider _hasRepresentationOfType:](self, "_hasRepresentationOfType:", v15))
          {
            v16 = visibility;
            if ((v20 & 1) != 0)
            {
              v17 = objc_msgSend(v9, "itemProviderVisibilityForRepresentationWithTypeIdentifier:", v15);
              if (v17 <= visibility)
                v16 = visibility;
              else
                v16 = v17;
            }
            if ((v10 & 1) != 0
              && (v18 = objc_msgSend(v9, "_preferredRepresentationForItemProviderWritableTypeIdentifier:", v15)) != 0)
            {
              v22[0] = MEMORY[0x1E0C809B0];
              v22[1] = 3221225472;
              v22[2] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_4;
              v22[3] = &unk_1E0F50580;
              v22[4] = v15;
              v22[5] = loadHandler;
              -[NSItemProvider registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:](self, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v15, v18 == 2, v16, v22);
            }
            else
            {
              v23[0] = MEMORY[0x1E0C809B0];
              v23[1] = 3221225472;
              v23[2] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke;
              v23[3] = &unk_1E0F50508;
              v23[4] = v15;
              v23[5] = loadHandler;
              -[NSItemProvider registerDataRepresentationForTypeIdentifier:visibility:loadHandler:](self, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v15, v16, v23);
            }
          }
        }
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      }
      while (v12);
    }
  }
  else
  {
    v19 = _NSOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = NSStringFromClass((Class)aClass);
      _os_log_error_impl(&dword_1817D9000, v19, OS_LOG_TYPE_ERROR, "Ignoring registration of class %@ because it does not conform to the NSItemProviderWriting protocol.", buf, 0xCu);
    }
  }
}

NSProgress *__63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSProgress *v4;
  NSProgress *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSProgress *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  NSProgress *v16;
  uint64_t v17;
  NSProgress *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  v5 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_2;
  v15 = &unk_1E0F504E0;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v16 = v5;
  v17 = v7;
  v18 = v4;
  v19 = a2;
  v8 = (*(uint64_t (**)(void))(v6 + 16))();
  if (v8)
  {
    v9 = v8;
    v10 = v4;
  }
  else
  {
    v10 = v4;
    v9 = (uint64_t)v5;
  }
  -[NSProgress addChild:withPendingUnitCount:](v10, "addChild:withPendingUnitCount:", v9, 20);
  return v4;
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  NSProgress *v6;
  NSProgress *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSError *RepresentationError;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v6 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  v7 = v6;
  if (!a2 || a3)
  {
    -[NSProgress setCompletedUnitCount:](v6, "setCompletedUnitCount:", -[NSProgress totalUnitCount](v6, "totalUnitCount"));
    v13 = *(_QWORD *)(a1 + 56);
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 40), a3);
    (*(void (**)(uint64_t, _QWORD, NSError *))(v13 + 16))(v13, 0, RepresentationError);
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_3;
  v16[3] = &unk_1E0F504B8;
  v9 = *(_QWORD *)(a1 + 56);
  v16[4] = v6;
  v16[5] = v9;
  v10 = objc_msgSend(a2, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v8, v16);
  if (!v10)
  {
LABEL_6:
    v12 = *(void **)(a1 + 48);
    v11 = (uint64_t)v7;
    return objc_msgSend(v12, "addChild:withPendingUnitCount:", v11, 80);
  }
  v11 = v10;
  v12 = *(void **)(a1 + 48);
  return objc_msgSend(v12, "addChild:withPendingUnitCount:", v11, 80);
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

NSProgress *__63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSProgress *v4;
  NSProgress *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSProgress *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  NSProgress *v16;
  uint64_t v17;
  NSProgress *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  v5 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_5;
  v15 = &unk_1E0F50558;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v16 = v5;
  v17 = v7;
  v18 = v4;
  v19 = a2;
  v8 = (*(uint64_t (**)(void))(v6 + 16))();
  if (v8)
  {
    v9 = v8;
    v10 = v4;
  }
  else
  {
    v10 = v4;
    v9 = (uint64_t)v5;
  }
  -[NSProgress addChild:withPendingUnitCount:](v10, "addChild:withPendingUnitCount:", v9, 20);
  return v4;
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  NSProgress *v6;
  NSProgress *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSError *RepresentationError;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  v6 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
  v7 = v6;
  if (!a2 || a3)
  {
    -[NSProgress setCompletedUnitCount:](v6, "setCompletedUnitCount:", -[NSProgress totalUnitCount](v6, "totalUnitCount"));
    v13 = *(_QWORD *)(a1 + 56);
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 40), a3);
    (*(void (**)(uint64_t, _QWORD, _QWORD, NSError *))(v13 + 16))(v13, 0, 0, RepresentationError);
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_6;
  v16[3] = &unk_1E0F50530;
  v9 = *(_QWORD *)(a1 + 56);
  v16[4] = v6;
  v16[5] = v9;
  v10 = objc_msgSend(a2, "_loadFileRepresentationOfTypeIdentifier:forItemProviderCompletionHandler:", v8, v16);
  if (!v10)
  {
LABEL_6:
    v12 = *(void **)(a1 + 48);
    v11 = (uint64_t)v7;
    return objc_msgSend(v12, "addChild:withPendingUnitCount:", v11, 80);
  }
  v11 = v10;
  v12 = *(void **)(a1 + 48);
  return objc_msgSend(v12, "addChild:withPendingUnitCount:", v11, 80);
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)canLoadObjectOfClass:(id)aClass
{
  return _bestMatchConformingToTypes(-[NSItemProvider _readableTypeIdentifiersForItemProviderForClass:](self, "_readableTypeIdentifiersForItemProviderForClass:", aClass), -[NSItemProvider _availableTypes](self, "_availableTypes")) != 0;
}

- (NSProgress)loadObjectOfClass:(id)aClass completionHandler:(void *)completionHandler
{
  return (NSProgress *)-[NSItemProvider _loadObjectOfClass:options:completionHandler:](self, "_loadObjectOfClass:options:completionHandler:", aClass, 0, completionHandler);
}

- (id)_objectOfClass:(Class)a3 data:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  return (id)-[objc_class objectWithItemProviderData:typeIdentifier:error:](a3, "objectWithItemProviderData:typeIdentifier:error:", a4, a5, a6);
}

- (id)_readableTypeIdentifiersForItemProviderForClass:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[objc_class readableTypeIdentifiersForItemProvider](a3, "readableTypeIdentifiersForItemProvider");
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)_loadObjectOfClass:(Class)a3 options:(id)a4 completionHandler:(id)a5
{
  _NSIPCallbackSerialization *v9;
  id v10;
  uint64_t matched;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id *v16;
  uint64_t v17;
  NSError *v18;
  id *v19;
  NSProgress *v20;
  _QWORD v22[6];
  id v23;
  _QWORD block[8];
  id v25;
  _QWORD v26[8];
  id v27;
  _QWORD v28[9];
  id v29;
  _QWORD v30[9];
  id v31;
  id location;
  _QWORD v33[8];

  v33[6] = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(_NSIPCallbackSerialization);
  objc_initWeak(&location, v9);
  v10 = -[NSItemProvider _readableTypeIdentifiersForItemProviderForClass:](self, "_readableTypeIdentifiersForItemProviderForClass:", a3);
  matched = _bestMatchConformingToTypes(v10, -[NSItemProvider _availableTypes](self, "_availableTypes"));
  v12 = matched;
  v13 = MEMORY[0x1E0C809B0];
  if (!matched)
  {
    v18 = _NSIPUnavailableCoercionError(0, a3, 0);
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_7;
    block[3] = &unk_1E0F50338;
    block[4] = v9;
    v19 = &v25;
    objc_copyWeak(&v25, &location);
    block[6] = v18;
    block[7] = a5;
    block[5] = self;
    _NSIPDispatchAsyncCallback(block);
LABEL_11:
    objc_destroyWeak(v19);
LABEL_12:
    v20 = +[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 100);
    -[NSProgress setCompletedUnitCount:](v20, "setCompletedUnitCount:", -[NSProgress totalUnitCount](v20, "totalUnitCount"));
    goto LABEL_13;
  }
  v14 = _bestMatchType(matched, v10, (uint64_t)&__block_literal_global_289);
  v15 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", v12);
  if (!v15)
  {
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5_83;
    v26[3] = &unk_1E0F50338;
    v26[4] = v9;
    v19 = &v27;
    objc_copyWeak(&v27, &location);
    v26[6] = a3;
    v26[7] = a5;
    v26[5] = self;
    _NSIPDispatchAsyncCallback(v26);
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[objc_class _preferredRepresentationForItemProviderReadableTypeIdentifier:](a3, "_preferredRepresentationForItemProviderReadableTypeIdentifier:", v12))
  {
    v28[0] = v13;
    v28[1] = 3221225472;
    v28[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5;
    v28[3] = &unk_1E0F505A8;
    v28[4] = a3;
    v28[5] = v14;
    v28[6] = v9;
    v16 = &v29;
    objc_copyWeak(&v29, &location);
    v28[7] = self;
    v28[8] = a5;
    v17 = objc_msgSend(v15, "loadOpenInPlaceWithOptions_v2:completionHandler:", a4, v28);
  }
  else
  {
    v30[0] = v13;
    v30[1] = 3221225472;
    v30[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke;
    v30[3] = &unk_1E0F505A8;
    v30[4] = self;
    v30[5] = a3;
    v30[6] = v14;
    v30[7] = v9;
    v16 = &v31;
    objc_copyWeak(&v31, &location);
    v30[8] = a5;
    v17 = objc_msgSend(v15, "loadDataWithOptions_v2:completionHandler:", a4, v30);
  }
  v20 = (NSProgress *)v17;
  objc_destroyWeak(v16);
  if (!v20)
    goto LABEL_12;
LABEL_13:
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_9;
  v22[3] = &unk_1E0F50360;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  v22[5] = v20;
  if (v9)
  {
    v33[0] = v13;
    v33[1] = 3221225472;
    v33[2] = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
    v33[3] = &unk_1E0F50148;
    v33[4] = v9;
    v33[5] = v22;
    _NSIPDispatchAsyncCallback(v33);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v20;
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  objc_class *v7;
  NSError *v8;
  objc_class *v9;
  uint64_t v10;
  NSString *v11;
  _QWORD block[9];
  id v13;
  NSError *v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  NSError *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (NSError *)objc_msgSend(a2, "error");
  v14 = v4;
  if (!objc_msgSend(a2, "data") || v4)
  {
    if (!v4)
      goto LABEL_13;
    v9 = *(objc_class **)(a1 + 40);
    if (-[NSString isEqualToString:](-[NSError domain](v4, "domain"), "isEqualToString:", CFSTR("NSItemProviderErrorDomain")))
    {
      goto LABEL_13;
    }
    v8 = _NSIPUnavailableCoercionError(0, v9, (uint64_t)v4);
LABEL_12:
    v4 = v8;
LABEL_13:
    v5 = 0;
    v14 = v4;
    goto LABEL_14;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "_objectOfClass:data:typeIdentifier:error:", *(_QWORD *)(a1 + 40), objc_msgSend(a2, "data"), *(_QWORD *)(a1 + 48), &v14);
  if (!v5)
  {
    v6 = _NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromClass(*(Class *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v14;
      _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "Could not instantiate class %@. Error: %@", buf, 0x16u);
    }
    v4 = v14;
    if (!v14)
      goto LABEL_13;
    v7 = *(objc_class **)(a1 + 40);
    if (-[NSString isEqualToString:](-[NSError domain](v14, "domain"), "isEqualToString:", CFSTR("NSItemProviderErrorDomain")))
    {
      goto LABEL_13;
    }
    v8 = _NSIPUnavailableCoercionError(0, v7, (uint64_t)v4);
    goto LABEL_12;
  }
LABEL_14:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3;
  block[3] = &unk_1E0F502E8;
  block[4] = *(_QWORD *)(a1 + 56);
  objc_copyWeak(&v13, (id *)(a1 + 72));
  v10 = *(_QWORD *)(a1 + 64);
  block[5] = *(_QWORD *)(a1 + 32);
  block[6] = v5;
  block[7] = v14;
  block[8] = v10;
  _NSIPDispatchAsyncCallback(block);
  objc_destroyWeak(&v13);
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4;
  v5[3] = &unk_1E0F502C0;
  objc_copyWeak(&v6, (id *)(a1 + 72));
  v5[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_destroyWeak(&v6);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  Class *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  _QWORD v14[9];
  id v15;
  _QWORD v16[6];
  _QWORD v17[6];
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a2, "error");
  v5 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  v6 = MEMORY[0x1E0C809B0];
  if (v5 && !objc_msgSend(a2, "error"))
  {
    v7 = (Class *)(a1 + 32);
    v11 = objc_msgSend(*(id *)(a1 + 32), "_objectWithItemProviderFileURL:typeIdentifier:isInPlace:error:", objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"), *(_QWORD *)(a1 + 40), objc_msgSend(a2, "wasOpenedInPlace"), 0);
    if (v11)
    {
      v9 = v11;
      goto LABEL_8;
    }
    v12 = _NSOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromClass(*v7);
      *(_DWORD *)buf = 138412546;
      v19 = v13;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "Could not instantiate class %@. Error: %@", buf, 0x16u);
    }
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_79;
    v17[3] = &unk_1E0F50388;
    v8 = v17;
  }
  else
  {
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_2_80;
    v16[3] = &unk_1E0F50388;
    v7 = (Class *)(a1 + 32);
    v8 = v16;
  }
  v8[4] = *v7;
  v8[5] = v4;
  if (v4
    && (objc_msgSend((id)objc_msgSend(v4, "domain"), "isEqualToString:", CFSTR("NSItemProviderErrorDomain")) & 1) == 0)
  {
    v4 = (void *)((uint64_t (*)(_QWORD *, void *))v8[2])(v8, v4);
  }
  v9 = 0;
LABEL_8:
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3_81;
  v14[3] = &unk_1E0F502E8;
  v14[4] = *(_QWORD *)(a1 + 48);
  objc_copyWeak(&v15, (id *)(a1 + 72));
  v10 = *(_QWORD *)(a1 + 64);
  v14[5] = *(_QWORD *)(a1 + 56);
  v14[6] = v9;
  v14[7] = v4;
  v14[8] = v10;
  _NSIPDispatchAsyncCallback(v14);
  objc_destroyWeak(&v15);
}

NSError *__63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_79(uint64_t a1)
{
  return _NSIPUnavailableCoercionError(0, *(objc_class **)(a1 + 32), *(_QWORD *)(a1 + 40));
}

NSError *__63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_2_80(uint64_t a1)
{
  return _NSIPUnavailableCoercionError(0, *(objc_class **)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3_81(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4_82;
  v5[3] = &unk_1E0F502C0;
  objc_copyWeak(&v6, (id *)(a1 + 72));
  v5[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_destroyWeak(&v6);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4_82(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5_83(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSError *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_6;
  v6[3] = &unk_1E0F502C0;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  v6[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v6;
    _NSIPDispatchAsyncCallback(block);
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    v5 = _NSIPUnavailableCoercionError(0, *(objc_class **)(a1 + 48), 0);
    (*(void (**)(uint64_t, _QWORD, NSError *))(v4 + 16))(v4, 0, v5);
  }
  objc_destroyWeak(&v7);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_6(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_8;
  v5[3] = &unk_1E0F502C0;
  objc_copyWeak(&v6, (id *)(a1 + 64));
  v5[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, *(_QWORD *)(a1 + 48));
  objc_destroyWeak(&v6);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_8(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_9(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 48));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:beganDataTransferTransactionUUID:progress:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSItemProvider;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {types = %@}"), -[NSItemProvider description](&v3, sel_description), -[NSItemProvider registeredTypeIdentifiers](self, "registeredTypeIdentifiers"));
}

- (BOOL)hasItemConformingToTypeIdentifier:(NSString *)typeIdentifier
{
  return -[NSItemProvider hasRepresentationConformingToTypeIdentifier:fileOptions:](self, "hasRepresentationConformingToTypeIdentifier:fileOptions:", typeIdentifier, 0);
}

- (NSItemProvider)initWithItem:(id)item typeIdentifier:(NSString *)typeIdentifier
{
  NSItemProvider *v6;
  NSItemProvider *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v6 = -[NSItemProvider init](self, "init");
  v7 = v6;
  if (item && v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__NSItemProvider_initWithItem_typeIdentifier___block_invoke;
    v9[3] = &unk_1E0F505D0;
    v9[4] = item;
    -[NSItemProvider registerItemForTypeIdentifier:loadHandler:](v6, "registerItemForTypeIdentifier:loadHandler:", typeIdentifier, v9);
  }
  return v7;
}

uint64_t __46__NSItemProvider_initWithItem_typeIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
}

- (NSItemProvider)initWithContentsOfURL:(NSURL *)fileURL
{
  NSItemProvider *v4;
  NSString *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v4 = -[NSItemProvider init](self, "init");
  if (v4)
  {
    if (-[NSURL isFileURL](fileURL, "isFileURL"))
    {
      v5 = -[NSURL pathExtension](fileURL, "pathExtension");
      v6 = _MergedGlobals_85();
      v7 = (id)((uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1ECD04CF8)(v6, (uint64_t)v5, 0);
      if (!v7)
        v7 = (id)off_1ECD04CE0();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __40__NSItemProvider_initWithContentsOfURL___block_invoke;
      v9[3] = &unk_1E0F505F8;
      v9[4] = fileURL;
      -[NSItemProvider registerDataRepresentationForTypeIdentifier:visibility:loadHandler:](v4, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v7, 0, v9);
    }
    -[NSItemProvider registerObject:visibility:](v4, "registerObject:visibility:", fileURL, 0);
  }
  return v4;
}

uint64_t __40__NSItemProvider_initWithContentsOfURL___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v3 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", *(_QWORD *)(a1 + 32), 1, v5);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(a2 + 16))(a2, v3, v5[0]);
  return 0;
}

- (void)registerItemForTypeIdentifier:(NSString *)typeIdentifier loadHandler:(NSItemProviderLoadHandler)loadHandler
{
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke;
  v4[3] = &unk_1E0F50648;
  v4[4] = typeIdentifier;
  v4[5] = loadHandler;
  -[NSItemProvider _addRepresentationType_v2:preferredRepresentation:loader:](self, "_addRepresentationType_v2:preferredRepresentation:loader:", typeIdentifier, 0, v4);
}

uint64_t __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSString *v5;
  void *v6;

  v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("com.apple.Foundation.NSItemProviderExpectedClass"));
  if (v4)
  {
    v5 = (NSString *)v4;
    v6 = (void *)objc_msgSend(a2, "mutableCopy");
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("com.apple.Foundation.NSItemProviderExpectedClass"));
    v6;
    NSClassFromString(v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return 0;
}

id __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke_2(uint64_t a1, void *a2, NSError *RepresentationError)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  NSSecurityScopedURLWrapper *v11;
  NSData *v12;
  uint64_t (*v13)(void);
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = off_1ECD04CE8();
    if (((uint64_t (*)(uint64_t, uint64_t))off_1ECD04CF0)(v6, v7))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke_3;
      v14[3] = &unk_1E0F501F8;
      v8 = *(_QWORD *)(a1 + 32);
      v14[4] = *(_QWORD *)(a1 + 40);
      return (id)objc_msgSend(a2, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v8, v14);
    }
    v11 = -[NSSecurityScopedURLWrapper initWithURL:readonly:]([NSSecurityScopedURLWrapper alloc], "initWithURL:readonly:", a2, 0);
    v10 = 0;
  }
  else
  {
    if (!_NSIsNSData())
    {
      v12 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
      if (!v12)
      {
        RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), 0);
        v12 = 0;
      }
      -[NSItemRepresentationLoadResult setArchivedObjectClass:](+[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:](NSItemRepresentationLoadResult, "resultWithData:urlWrapper:cleanupHandler:error:", v12, 0, 0, RepresentationError), "setArchivedObjectClass:", objc_msgSend(a2, "classForCoder"));
      v13 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      return (id)v13();
    }
    v10 = a2;
    v11 = 0;
  }
  +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:](NSItemRepresentationLoadResult, "resultWithData:urlWrapper:cleanupHandler:error:", v10, v11, 0, 0);
  v13 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  return (id)v13();
}

uint64_t __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[NSItemRepresentationLoadResult setArchivedObjectClass:](+[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:](NSItemRepresentationLoadResult, "resultWithData:urlWrapper:cleanupHandler:error:", a2, 0, 0, a3), "setArchivedObjectClass:", objc_opt_class());
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadItemForTypeIdentifier:(NSString *)typeIdentifier options:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandler)completionHandler
{
  NSObject *v9;
  NSDictionary *v10;
  Class v11;
  NSDictionary *v12;
  NSDictionary *v13;
  _QWORD v14[9];
  Class aClass;
  uint8_t buf[8];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  aClass = 0;
  if (!_NSIPGetExpectedClassFromCompletionBlock(completionHandler, &aClass, 0))
  {
    v9 = _NSOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1817D9000, v9, OS_LOG_TYPE_ERROR, "Cannot figure out the expected value class in an NSItemProvider completion handler. Falling back to returning the default class.", buf, 2u);
    }
  }
  v10 = options;
  v11 = aClass;
  if (aClass)
  {
    if (options)
      v12 = (NSDictionary *)-[NSDictionary mutableCopy](options, "mutableCopy");
    else
      v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v12;
    -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", NSStringFromClass(aClass), CFSTR("com.apple.Foundation.NSItemProviderExpectedClass"));

    v11 = aClass;
    v10 = v13;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__NSItemProvider_loadItemForTypeIdentifier_options_completionHandler___block_invoke;
  v14[3] = &unk_1E0F50670;
  v14[4] = self;
  v14[5] = v11;
  v14[6] = typeIdentifier;
  v14[7] = v10;
  v14[8] = completionHandler;
  _asyncDispatchBlockWithOptions(options, v14);
}

void __70__NSItemProvider_loadItemForTypeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_loadItemOfClass:forTypeIdentifier:options:coerceForCoding:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));

}

- (void)_loadItemOfClass:(Class)a3 forTypeIdentifier:(id)a4 options:(id)a5 coerceForCoding:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSError *RepresentationError;
  id v16;
  void *v17;
  _NSIPCallbackSerialization *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v23[6];
  _QWORD v24[6];
  id v25;
  _QWORD v26[11];
  id v27;
  id location;
  _QWORD v29[6];
  _QWORD v30[7];
  _QWORD v31[6];
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (-[NSItemProvider hasItemConformingToTypeIdentifier:](self, "hasItemConformingToTypeIdentifier:", a4))
  {
    v12 = objc_opt_class();
    if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", v12))
    {
      v13 = off_1ECD04CE8();
      if (((uint64_t (*)(uint64_t, uint64_t))off_1ECD04CF0)((uint64_t)a4, v13))
      {
        v14 = objc_opt_class();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke;
        v31[3] = &unk_1E0F50698;
        v31[4] = a4;
        v31[5] = a7;
        -[NSItemProvider _loadObjectOfClass:options:completionHandler:](self, "_loadObjectOfClass:options:completionHandler:", v14, a5, v31);
      }
      else
      {
        v22 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", a4);
        if (v22)
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_4;
          v30[3] = &unk_1E0F506C0;
          v30[5] = a3;
          v30[6] = a7;
          v30[4] = v12;
          objc_msgSend(v22, "loadWithOptions_v2:completionHandler:", a5, v30);
        }
        else if (a7)
        {
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_7;
          v29[3] = &unk_1E0F4E060;
          v29[4] = a3;
          v29[5] = a7;
          _NSIPDispatchAsyncCallback(v29);
        }
      }
    }
    else
    {
      v16 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", a4);
      if (v16)
      {
        v17 = v16;
        v18 = objc_alloc_init(_NSIPCallbackSerialization);
        objc_initWeak(&location, v18);
        v19 = -[NSItemProvider _readableTypeIdentifiersForItemProviderForClass:](self, "_readableTypeIdentifiersForItemProviderForClass:", a3);
        v20 = MEMORY[0x1E0C809B0];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_8;
        v26[3] = &unk_1E0F50758;
        v26[4] = a4;
        v26[5] = a3;
        v26[6] = v19;
        v26[7] = v17;
        v26[8] = v18;
        objc_copyWeak(&v27, &location);
        v26[9] = self;
        v26[10] = a7;
        v21 = objc_msgSend(v17, "loadWithOptions_v2:completionHandler:", a5, v26);
        v24[0] = v20;
        v24[1] = 3221225472;
        v24[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_14;
        v24[3] = &unk_1E0F50360;
        objc_copyWeak(&v25, &location);
        v24[4] = self;
        v24[5] = v21;
        if (v18)
        {
          block[0] = v20;
          block[1] = 3221225472;
          block[2] = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
          block[3] = &unk_1E0F50148;
          block[4] = v18;
          block[5] = v24;
          _NSIPDispatchAsyncCallback(block);
        }

        objc_destroyWeak(&v25);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
      else
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_15;
        v23[3] = &unk_1E0F4E060;
        v23[4] = a4;
        v23[5] = a7;
        _NSIPDispatchAsyncCallback(v23);
      }
    }
  }
  else
  {
    RepresentationError = _NSIPCannotLoadRepresentationError((uint64_t)a4, 0);
    if (a7)
      (*((void (**)(id, _QWORD, NSError *))a7 + 2))(a7, 0, RepresentationError);
  }
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke(uint64_t a1, uint64_t a2, NSError *a3)
{
  NSError *RepresentationError;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[8];

  RepresentationError = a3;
  v8[7] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!-[NSString isEqualToString:](-[NSError domain](a3, "domain"), "isEqualToString:", CFSTR("NSItemProviderErrorDomain")))RepresentationError = _NSIPCannotLoadRepresentationError(v6, (uint64_t)RepresentationError);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_3;
    v8[3] = &unk_1E0F4DF70;
    v8[5] = RepresentationError;
    v8[6] = v7;
    v8[4] = a2;
    _NSIPDispatchAsyncCallback(v8);
  }
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_4(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD block[7];
  _QWORD v10[6];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  if (objc_msgSend(a2, "urlWrapper"))
  {
    v4 = (id)objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  }
  else
  {
    v5 = (void *)objc_msgSend(a2, "archivedObjectClass");
    if (!objc_msgSend(v5, "isSubclassOfClass:", a1[4]))
    {
      v6 = a1[6];
      if (!v6)
        return;
      v8 = 0;
      goto LABEL_11;
    }
    v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v5, objc_msgSend(a2, "data"), v11);
  }
  v6 = a1[6];
  if (!v6)
    return;
  if (!v4)
  {
    v8 = v11[0];
LABEL_11:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_6;
    block[3] = &unk_1E0F4DF70;
    block[5] = v8;
    block[6] = v6;
    block[4] = a1[5];
    v7 = block;
    goto LABEL_12;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_5;
  v10[3] = &unk_1E0F4E060;
  v10[4] = v4;
  v10[5] = v6;
  v7 = v10;
LABEL_12:
  _NSIPDispatchAsyncCallback(v7);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_6(uint64_t *a1)
{
  uint64_t v1;
  NSError *v2;

  v1 = a1[6];
  v2 = _NSIPUnexpectedValueClassError(a1[4], a1[5]);
  return (*(uint64_t (**)(uint64_t, _QWORD, NSError *))(v1 + 16))(v1, 0, v2);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  NSError *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = _NSIPUnexpectedValueClassError(*(_QWORD *)(a1 + 32), 0);
  return (*(uint64_t (**)(uint64_t, _QWORD, NSError *))(v1 + 16))(v1, 0, v2);
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSKeyedUnarchiver *v11;
  uint64_t v12;
  id v13;
  NSError *RepresentationError;
  void *v15;
  objc_class *v16;
  _QWORD v17[10];
  id v18;
  _QWORD v19[2];
  NSError *(*v20)(uint64_t, uint64_t);
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "error");
  v28[0] = v4;
  v5 = objc_msgSend(a2, "cleanupHandler");
  v6 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v7 = 0;
LABEL_3:
    v19[0] = v6;
    v19[1] = 3221225472;
    v20 = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_11;
    v21 = &unk_1E0F50248;
    v22 = *(_QWORD *)(a1 + 32);
    if ((objc_msgSend((id)objc_msgSend((id)v4, "domain"), "isEqualToString:", CFSTR("NSItemProviderErrorDomain")) & 1) == 0)
      v4 = (uint64_t)v20((uint64_t)v19, v4);
    v28[0] = v4;
    goto LABEL_6;
  }
  if (objc_msgSend(a2, "data"))
  {
    v9 = objc_msgSend(a2, "archivedObjectClass");
    if (v9)
    {
      v10 = v9;
      v11 = -[NSKeyedUnarchiver initForReadingFromData:error:]([NSKeyedUnarchiver alloc], "initForReadingFromData:error:", objc_msgSend(a2, "data"), 0);
      -[NSKeyedUnarchiver setRequiresSecureCoding:](v11, "setRequiresSecureCoding:", 0);
      v7 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:](v11, "decodeObjectOfClass:forKey:", v10, CFSTR("root"));

      if (v7)
        goto LABEL_15;
      v7 = objc_msgSend(MEMORY[0x1E0C99E98], "objectWithItemProviderData:typeIdentifier:error:", objc_msgSend(a2, "data"), *(_QWORD *)(a1 + 32), 0);
      if (v7)
        goto LABEL_15;
    }
    v12 = objc_msgSend(a2, "data");
  }
  else
  {
    if (!objc_msgSend(a2, "urlWrapper"))
    {
      RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), 0);
LABEL_22:
      v4 = (uint64_t)RepresentationError;
      v7 = 0;
      v28[0] = RepresentationError;
      goto LABEL_35;
    }
    v12 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  }
  v7 = v12;
  if (!v12)
  {
    v4 = 0;
    goto LABEL_35;
  }
LABEL_15:
  if (!*(_QWORD *)(a1 + 40) || (objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  v13 = +[_NSItemProviderTypeCoercion typeCoercionForValue:targetClass:](_NSItemProviderTypeCoercion, "typeCoercionForValue:targetClass:", v7, *(_QWORD *)(a1 + 40));
  if (v13)
  {
    v7 = objc_msgSend(v13, "coerceValueError:", v28);
    v4 = v28[0];
    if (v7 | v28[0])
      goto LABEL_35;
    RepresentationError = _NSIPUnexpectedValueClassError(*(_QWORD *)(a1 + 40), 0);
    goto LABEL_22;
  }
  if (qword_1ECD099E8 != -1)
    dispatch_once(&qword_1ECD099E8, &__block_literal_global_98);
  if (_MergedGlobals_7_1 && (objc_msgSend(*(id *)(a1 + 40), "isSubclassOfClass:") & 1) != 0
    || qword_1ECD099E0 && (objc_msgSend(*(id *)(a1 + 40), "isSubclassOfClass:") & 1) != 0
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v4 = 0;
    v7 = 0;
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_10;
    v23[3] = &unk_1E0F50708;
    v15 = *(void **)(a1 + 48);
    v23[4] = *(_QWORD *)(a1 + 56);
    v23[5] = &v24;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);
    if (*((_BYTE *)v25 + 24))
      v7 = objc_msgSend(*(id *)(a1 + 40), "objectWithItemProviderData:typeIdentifier:error:", objc_msgSend(a2, "data"), objc_msgSend(*(id *)(a1 + 56), "typeIdentifier"), v28);
    else
      v7 = 0;
    _Block_object_dispose(&v24, 8);
    v4 = v28[0];
  }
LABEL_35:
  if (!(v7 | v4))
  {
    v16 = (objc_class *)objc_opt_class();
    v4 = (uint64_t)_NSIPUnavailableCoercionError(v16, *(objc_class **)(a1 + 40), 0);
    v28[0] = v4;
  }
  if (v4)
    goto LABEL_3;
LABEL_6:
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_12;
  v17[3] = &unk_1E0F50730;
  v17[4] = *(_QWORD *)(a1 + 64);
  objc_copyWeak(&v18, (id *)(a1 + 88));
  v8 = *(_QWORD *)(a1 + 80);
  v17[5] = *(_QWORD *)(a1 + 72);
  v17[6] = v7;
  v17[7] = v28[0];
  v17[8] = v8;
  v17[9] = v5;
  _NSIPDispatchAsyncCallback(v17);
  objc_destroyWeak(&v18);
}

Class __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_9()
{
  Class result;

  _MergedGlobals_7_1 = (uint64_t)objc_getClass("UIImage");
  result = objc_getClass("NSImage");
  qword_1ECD099E0 = (uint64_t)result;
  return result;
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t result;

  v6 = objc_msgSend(*(id *)(a1 + 32), "typeIdentifier");
  result = off_1ECD04CF0(v6);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

NSError *__95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return _NSIPCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), a2);
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_13;
  v6[3] = &unk_1E0F502C0;
  objc_copyWeak(&v7, (id *)(a1 + 80));
  v6[4] = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_1E0F50148;
    block[4] = v2;
    block[5] = v6;
    _NSIPDispatchAsyncCallback(block);
  }
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 72);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  objc_destroyWeak(&v7);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_13(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:finishedDataTransferTransactionUUID:", *(_QWORD *)(a1 + 32), v4);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_14(uint64_t a1)
{
  _QWORD *Weak;
  void *v3;
  uint64_t v4;

  Weak = objc_loadWeak((id *)(a1 + 48));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "dataTransferDelegate");
  if (Weak)
    v4 = Weak[3];
  else
    v4 = 0;
  return objc_msgSend(v3, "itemProvider:beganDataTransferTransactionUUID:progress:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_15(uint64_t result)
{
  uint64_t v1;
  NSError *RepresentationError;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(_QWORD *)(result + 32), 0);
    return (*(uint64_t (**)(uint64_t, _QWORD, NSError *))(v1 + 16))(v1, 0, RepresentationError);
  }
  return result;
}

- (void)_loadPreviewImageOfClass:(Class)a3 options:(id)a4 coerceForCoding:(BOOL)a5 completionHandler:(id)a6
{
  _QWORD v6[8];
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__NSItemProvider__loadPreviewImageOfClass_options_coerceForCoding_completionHandler___block_invoke;
  v6[3] = &unk_1E0F50780;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a6;
  v7 = a5;
  _asyncDispatchBlockWithOptions(a4, v6);
}

uint64_t __85__NSItemProvider__loadPreviewImageOfClass_options_coerceForCoding_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[1];
  if (v3)
    return objc_msgSend(v2, "_loadItemOfClass:withLoadHandler:options:coerceForCoding:completionHandler:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  _NSIPCannotLoadPreviewError(0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)_loadItemOfClass:(Class)a3 withLoadHandler:(id)a4 options:(id)a5 coerceForCoding:(BOOL)a6 completionHandler:(id)a7
{
  _QWORD v7[6];
  BOOL v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__NSItemProvider__loadItemOfClass_withLoadHandler_options_coerceForCoding_completionHandler___block_invoke;
  v7[3] = &unk_1E0F507A8;
  v7[4] = a3;
  v7[5] = a7;
  v8 = a6;
  (*((void (**)(id, _QWORD *, Class, id))a4 + 2))(a4, v7, a3, a5);
}

uint64_t __93__NSItemProvider__loadItemOfClass_withLoadHandler_options_coerceForCoding_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  v8[0] = 0;
  if (a2)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = +[_NSItemProviderTypeCoercion typeCoercionForValue:targetClass:](_NSItemProviderTypeCoercion, "typeCoercionForValue:targetClass:", a2, *(_QWORD *)(a1 + 32));
        v7 = v6;
        if ((!*(_BYTE *)(a1 + 48) || objc_msgSend(v6, "shouldCoerceForCoding"))
          && !objc_msgSend(v7, "coerceValueError:", v8)
          && !v8[0])
        {
          v8[0] = _NSIPUnexpectedValueClassError(*(_QWORD *)(a1 + 32), 0);
        }
      }
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setUserInfo:", (id)-[NSDictionary copy](self->_userInfo, "copy"));
  objc_msgSend(v4, "setPreviewImageHandler:", (id)objc_msgSend(self->_previewImageHandler, "copy"));
  objc_msgSend(v4, "set_loadOperator:", self->_loadOperator);
  objc_msgSend(v4, "set_representationByType:", (id)-[NSMutableDictionary mutableCopy](-[NSItemProvider _representationByType](self, "_representationByType"), "mutableCopy"));
  objc_msgSend(v4, "set_typeOrder:", (id)-[NSMutableOrderedSet mutableCopy](-[NSItemProvider _typeOrder](self, "_typeOrder"), "mutableCopy"));
  objc_msgSend(v4, "set_preferredRepresentationByType:", (id)-[NSMutableDictionary mutableCopy](-[NSItemProvider _preferredRepresentationByType](self, "_preferredRepresentationByType"), "mutableCopy"));

  v4[2] = (id)-[NSMutableDictionary mutableCopy](self->_metadata, "mutableCopy");
  v4[9] = (id)-[NSString copy](self->_suggestedName, "copy");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSItemProvider)initWithCoder:(id)a3
{
  NSItemProvider *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[6];
  const __CFString *v23;
  NSString *v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("This object may only be decoded by an NSXPCCoder."), 0));
  }
  v5 = -[NSItemProvider init](self, "init");
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = objc_msgSend(&unk_1E0FCD090, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v27;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v27 != v9)
              objc_enumerationMutation(&unk_1E0FCD090);
            v11 = NSClassFromString(*(NSString **)(*((_QWORD *)&v26 + 1) + 8 * v10));
            if (v11)
              objc_msgSend(v6, "addObject:", v11);
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(&unk_1E0FCD090, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        }
        while (v8);
      }
      v12 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v6, CFSTR("loadOperator"));
    }
    else
    {
      v12 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("loadOperator"));
    }
    v13 = (void *)v12;
    v14 = (void *)objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("typeIdentifiers"));
    if (v13)
    {
      v15 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __32__NSItemProvider_initWithCoder___block_invoke;
      v22[3] = &unk_1E0F507F8;
      v22[4] = v5;
      v22[5] = v13;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v22);
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __32__NSItemProvider_initWithCoder___block_invoke_3;
      v21[3] = &unk_1E0F505D0;
      v21[4] = v13;
      v5->_previewImageHandler = (id)objc_msgSend(v21, "copy");
    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __32__NSItemProvider_initWithCoder___block_invoke_4;
      v20[3] = &unk_1E0F50860;
      v20[4] = v5;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);
    }
    v5->_loadOperator = (_NSItemProviderLoading *)v13;
    v16 = objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("metadata"));
    if (v16)
      -[NSMutableDictionary setDictionary:](v5->_metadata, "setDictionary:", v16);
    -[NSItemProvider setUserInfo:](v5, "setUserInfo:", objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("userInfo")));
    v17 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_self(), CFSTR("suggestedName"));
    if (v17 && (objc_opt_self(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected class '%@' for key '%@'"), objc_opt_class(), CFSTR("suggestedName"));
      v23 = CFSTR("NSLocalizedDescription");
      v24 = v18;
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1)));
      return 0;
    }
    else
    {
      v5->_suggestedName = (NSString *)objc_msgSend(v17, "copy");
    }
  }
  return v5;
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__NSItemProvider_initWithCoder___block_invoke_2;
  v4[3] = &unk_1E0F507D0;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v4[5] = a2;
  return objc_msgSend(v2, "registerItemForTypeIdentifier:loadHandler:", a2, v4);
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadItemForTypeIdentifier:completionHandler:expectedValueClass:options:", *(_QWORD *)(a1 + 40), a2, a3, a4);
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadPreviewImageWithCompletionHandler:expectedValueClass:options:", a2, a3, a4);
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerItemForTypeIdentifier:loadHandler:", a2, &__block_literal_global_113);
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *v5;
  NSDictionary *userInfo;
  _NSItemProviderLoading *loadOperator;
  NSMutableDictionary *metadata;
  NSString *suggestedName;

  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("This object may only be encoded by an NSXPCCoder."), 0));
  v5 = -[NSItemProvider registeredTypeIdentifiers](self, "registeredTypeIdentifiers");
  if (v5)
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("typeIdentifiers"));
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(a3, "encodeObject:forKey:", userInfo, CFSTR("userInfo"));
  loadOperator = self->_loadOperator;
  if (loadOperator)
    objc_msgSend(a3, "encodeObject:forKey:", loadOperator, CFSTR("loadOperator"));
  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(a3, "encodeObject:forKey:", metadata, CFSTR("metadata"));
  suggestedName = self->_suggestedName;
  if (suggestedName)
    objc_msgSend(a3, "encodeObject:forKey:", suggestedName, CFSTR("suggestedName"));
}

- (_NSItemProviderLoading)_loadOperator
{
  return (_NSItemProviderLoading *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_loadOperator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)set_representationByType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)set_typeOrder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSArray)_representations
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)_preferredRepresentationByType
{
  return self->_preferredRepresentationByType;
}

- (void)set_preferredRepresentationByType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSUUID)_UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSItemProviderDataTransferDelegate)dataTransferDelegate
{
  return (NSItemProviderDataTransferDelegate *)objc_loadWeak((id *)&self->_dataTransferDelegate);
}

- (void)setDataTransferDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dataTransferDelegate, a3);
}

- (NSItemProviderLoadHandler)previewImageHandler
{
  return self->_previewImageHandler;
}

- (void)setPreviewImageHandler:(NSItemProviderLoadHandler)previewImageHandler
{
  id v3;

  v3 = self->_previewImageHandler;
  if (v3 != previewImageHandler)
  {

    self->_previewImageHandler = (id)objc_msgSend(previewImageHandler, "copy");
  }
}

- (void)loadPreviewImageWithOptions:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandler)completionHandler
{
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  if (!_NSIPGetExpectedClassFromCompletionBlock(completionHandler, &v8, 0))
  {
    v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "Cannot derive expected value class from a NSItemProvider preview completion handler.", buf, 2u);
    }
  }
  -[NSItemProvider _loadPreviewImageOfClass:options:coerceForCoding:completionHandler:](self, "_loadPreviewImageOfClass:options:coerceForCoding:completionHandler:", v8, options, 0, completionHandler);
}

@end
