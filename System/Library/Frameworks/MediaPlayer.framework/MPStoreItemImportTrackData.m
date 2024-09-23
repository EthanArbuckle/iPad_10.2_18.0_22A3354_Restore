@implementation MPStoreItemImportTrackData

- (MPStoreItemImportTrackData)initWithImportElements:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MPStoreItemImportTrackData *v14;
  uint64_t v15;
  NSArray *importElements;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "storeItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPStoreItemImportTrackData.m"), 25, CFSTR("we should have a complete set of metadata here."));

        }
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v18.receiver = self;
  v18.super_class = (Class)MPStoreItemImportTrackData;
  v14 = -[ML3StoreItemTrackData initWithLookupItems:](&v18, sel_initWithLookupItems_, v6);
  if (v14)
  {
    v15 = objc_msgSend(v7, "copy");
    importElements = v14->_importElements;
    v14->_importElements = (NSArray *)v15;

  }
  return v14;
}

- (id)parsedStoreItemsImportProperties
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPStoreItemImportTrackData;
  -[ML3StoreItemTrackData parsedStoreItemsImportProperties](&v11, sel_parsedStoreItemsImportProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__MPStoreItemImportTrackData_parsedStoreItemsImportProperties__block_invoke;
  v9[3] = &unk_1E315AEE0;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)_associatedElementForPropertyDict:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_importElements;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E31E4CD8, (_QWORD)v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "longLongValue");
        v13 = objc_msgSend(v10, "storeItemID");

        if (v12 == v13)
          goto LABEL_12;
        objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E31E4CF0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "longLongValue");
        v16 = objc_msgSend(v10, "storeItemID");

        if (v15 != v16)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E31E4D08);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "longLongValue");
          v19 = objc_msgSend(v10, "storeItemID");

          if (v18 != v19)
            continue;
        }
LABEL_12:
        v20 = v10;
        goto LABEL_14;
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v20 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_14:

  return v20;
}

- (NSArray)importElements
{
  return self->_importElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importElements, 0);
}

void __62__MPStoreItemImportTrackData_parsedStoreItemsImportProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_associatedElementForPropertyDict:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v10, "additionalTrackMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(v10, "additionalTrackMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_importPropertiesDictFromImportMetadataDict:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addEntriesFromDictionary:", v9);
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

+ (id)_importPropertiesDictFromImportMetadataDict:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("MPStoreItemLibraryImportMetadataKeyAlbumLikedState");
  v13[1] = CFSTR("MPStoreItemLibraryImportMetadataKeyTrackLikedState");
  v14[0] = &unk_1E31E4CA8;
  v14[1] = &unk_1E31E4CC0;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__MPStoreItemImportTrackData__importPropertiesDictFromImportMetadataDict___block_invoke;
  v11[3] = &unk_1E315EFE8;
  v11[4] = v5;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __74__MPStoreItemImportTrackData__importPropertiesDictFromImportMetadataDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v7);
  }
  else
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "[MPStoreItemImportTrackData] Unknown import property for metadata key %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
}

@end
