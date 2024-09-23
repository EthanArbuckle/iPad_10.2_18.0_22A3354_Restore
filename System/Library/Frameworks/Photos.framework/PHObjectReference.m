@implementation PHObjectReference

- (PHObjectReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PHObjectReference *v9;
  PHObjectReference *v10;
  uint64_t v11;
  NSString *localIdentifier;
  uint64_t v13;
  NSURL *libraryURL;
  uint64_t v15;
  NSString *representedType;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)PHObjectReference;
    v10 = -[PHObjectReference init](&v18, sel_init);
    if (v10)
    {
      v11 = objc_msgSend(v6, "copy");
      localIdentifier = v10->_localIdentifier;
      v10->_localIdentifier = (NSString *)v11;

      v13 = objc_msgSend(v8, "copy");
      libraryURL = v10->_libraryURL;
      v10->_libraryURL = (NSURL *)v13;

      objc_msgSend((id)objc_opt_class(), "representedType");
      v15 = objc_claimAutoreleasedReturnValue();
      representedType = v10->_representedType;
      v10->_representedType = (NSString *)v15;

    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (PHObjectReference)initWithDictionary:(id)a3 referenceType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PHObjectReference *v12;
  PHObjectReference *v13;
  uint64_t v14;
  NSString *representedType;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("libraryURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = 0;
    if (v8 && v10)
    {
      v13 = -[PHObjectReference initWithLocalIdentifier:libraryURL:](self, "initWithLocalIdentifier:libraryURL:", v8, v10);
      if (v13)
      {
        v14 = objc_msgSend(v6, "copy");
        representedType = v13->_representedType;
        v13->_representedType = (NSString *)v14;

      }
      self = v13;
      v12 = self;
    }
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }

  return v12;
}

- (id)dictionaryForReferenceType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E08];
  -[PHObjectReference localIdentifier](self, "localIdentifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObjectReference libraryURL](self, "libraryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, CFSTR("localIdentifier"), v7, CFSTR("libraryURL"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PHObjectReference representedType](self, "representedType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObjectReference localIdentifier](self, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHObjectReference libraryURL](self, "libraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: pasteboardType: %@; localIdentifier: %@; libraryURL: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  uint64_t v10;

  v6 = (void (**)(id, void *, _QWORD))a4;
  -[PHObjectReference dictionaryForReferenceType:](self, "dictionaryForReferenceType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 100, 0, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8, v10);

  return 0;
}

- (NSString)representedType
{
  return self->_representedType;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSURL)libraryURL
{
  return self->_libraryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_representedType, 0);
}

+ (id)referenceForObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "photoLibraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithLocalIdentifier:libraryURL:", v6, v8);

  return v9;
}

+ (NSString)representedType
{
  return (NSString *)CFSTR("com.apple.photos.object-reference");
}

+ (id)filteredObjectReferences:(id)a3 inPhotoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "photoLibraryURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, &v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "libraryURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);
        }
        objc_msgSend(v15, "addObject:", v13);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, &v27, 16);
    }
    while (v10);
  }

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__29802;
  v31 = __Block_byref_object_dispose__29803;
  v32 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__PHObjectReference_filteredObjectReferences_inPhotoLibrary___block_invoke;
  v20[3] = &unk_1E35DC308;
  v16 = v19;
  v21 = v16;
  v22 = &v27;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v20);
  v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v17;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "representedType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "representedType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:referenceType:", v9, v8);
  else
    v10 = 0;

  return v10;
}

void __61__PHObjectReference_filteredObjectReferences_inPhotoLibrary___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(MEMORY[0x1E0D73208], "fileURL:isEqualToFileURL:", *(_QWORD *)(a1 + 32), a2))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

@end
