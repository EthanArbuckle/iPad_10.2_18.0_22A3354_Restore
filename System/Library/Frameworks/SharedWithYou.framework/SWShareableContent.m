@implementation SWShareableContent

- (SWShareableContent)initWithSourceSceneIdentifier:(id)a3 sourceBundleIdentifier:(id)a4 metadata:(id)a5 representations:(id)a6 highlightURL:(id)a7 initiatorHandle:(id)a8 initiatorNameComponents:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SWShareableContent *v22;
  uint64_t v23;
  NSString *sourceSceneIdentifier;
  uint64_t v25;
  NSString *sourceBundleIdentifier;
  uint64_t v27;
  LPLinkMetadata *metadata;
  uint64_t v29;
  NSArray *representations;
  uint64_t v31;
  NSURL *highlightURL;
  uint64_t v33;
  NSString *initiatorHandle;
  uint64_t v35;
  NSPersonNameComponents *initiatorNameComponents;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)SWShareableContent;
  v22 = -[SWShareableContent init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    sourceSceneIdentifier = v22->_sourceSceneIdentifier;
    v22->_sourceSceneIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    sourceBundleIdentifier = v22->_sourceBundleIdentifier;
    v22->_sourceBundleIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    metadata = v22->_metadata;
    v22->_metadata = (LPLinkMetadata *)v27;

    v29 = objc_msgSend(v18, "copy");
    representations = v22->_representations;
    v22->_representations = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    highlightURL = v22->_highlightURL;
    v22->_highlightURL = (NSURL *)v31;

    v33 = objc_msgSend(v20, "copy");
    initiatorHandle = v22->_initiatorHandle;
    v22->_initiatorHandle = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    initiatorNameComponents = v22->_initiatorNameComponents;
    v22->_initiatorNameComponents = (NSPersonNameComponents *)v35;

  }
  return v22;
}

- (id)description
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWShareableContent sourceSceneIdentifier](self, "sourceSceneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sourceSceneIdentifier=%@"), v4);

  -[SWShareableContent sourceBundleIdentifier](self, "sourceBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sourceBundleIdentifier=%@"), v5);

  -[SWShareableContent metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" metadata=%@"), v6);

  -[SWShareableContent representations](self, "representations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" representations=%@"), v7);

  -[SWShareableContent highlightURL](self, "highlightURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" highlightURL=%@"), v8);

  -[SWShareableContent initiatorHandle](self, "initiatorHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" initiatorHandle=%@"), v9);

  -[SWShareableContent initiatorNameComponents](self, "initiatorNameComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" initiatorNameComponents=%@"), v10);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (id)registeredTypeIdentifiers
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[SWShareableContent representations](self, "representations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SWShareableContent representations](self, "representations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "typeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)registeredOpenInPlaceTypeIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[SWShareableContent representations](self, "representations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SWShareableContent representations](self, "representations", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "preferredRepresentation") == 2)
        {
          objc_msgSend(v11, "typeIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (BOOL)hasRepresentationConformingToTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SWShareableContent itemProviders](self, "itemProviders", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasRepresentationConformingToTypeIdentifier:fileOptions:", v4, 0) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)canLoadObjectOfClass:(Class)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SWShareableContent itemProviders](self, "itemProviders", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "canLoadObjectOfClass:", a3) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)hasPossibleCollaborationRepresentation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SWShareableContent itemProviders](self, "itemProviders", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "sl_hasPossibleCollaborationRepresentation") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)loadRepresentationForTypeIdentifier:(id)a3 itemProviderIndex:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  -[SWShareableContent representationProvider](self, "representationProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SWShareableContent representationProvider](self, "representationProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadRepresentationForContent:typeIdentifier:itemProviderIndex:completionHandler:", self, v11, a4, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

- (NSItemProvider)itemProvider
{
  void *v2;
  void *v3;

  -[SWShareableContent itemProviders](self, "itemProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSItemProvider *)v3;
}

- (NSArray)itemProviders
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t);
  void *v11;
  SWShareableContent *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWShareableContent representations](self, "representations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __35__SWShareableContent_itemProviders__block_invoke;
  v11 = &unk_1E2873FD0;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return (NSArray *)v6;
}

void __35__SWShareableContent_itemProviders__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD aBlock[7];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v5, "suggestedFileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuggestedName:", v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "representations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __35__SWShareableContent_itemProviders__block_invoke_2;
        aBlock[3] = &unk_1E2873FA8;
        aBlock[4] = *(_QWORD *)(a1 + 32);
        aBlock[5] = v12;
        aBlock[6] = a3;
        v13 = _Block_copy(aBlock);
        objc_msgSend(v12, "typeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_addRepresentationType_v2:preferredRepresentation:loader:", v14, objc_msgSend(v12, "preferredRepresentation"), v13);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
}

uint64_t __35__SWShareableContent_itemProviders__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "typeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__SWShareableContent_itemProviders__block_invoke_3;
  v10[3] = &unk_1E2873F80;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v5, "loadRepresentationForTypeIdentifier:itemProviderIndex:completionHandler:", v6, v7, v10);

  return 0;
}

void __35__SWShareableContent_itemProviders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a2;
  v17 = v5;
  if (v5)
  {
    objc_msgSend(v5, "urlWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3910]);
      objc_msgSend(v17, "urlWrapper");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "urlWrapper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "initWithURL:readonly:", v9, objc_msgSend(v10, "isReadonly"));

    }
    else
    {
      v11 = 0;
    }

    v13 = (void *)MEMORY[0x1E0CB36D0];
    objc_msgSend(v17, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resultWithData:urlWrapper:cleanupHandler:error:", v14, v11, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setArchivedObjectClass:", objc_msgSend(v17, "archivedObjectClass"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB36D0], "resultWithError:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWShareableContent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  SWShareableContent *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_opt_class();
    NSStringFromSelector(sel_sourceSceneIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_opt_class();
    NSStringFromSelector(sel_sourceBundleIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_opt_class();
    NSStringFromSelector(sel_metadata);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_registeredTypeIdentifiers);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_opt_class();
    NSStringFromSelector(sel_highlightURL);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_opt_class();
    NSStringFromSelector(sel_initiatorHandle);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_opt_class();
    NSStringFromSelector(sel_initiatorNameComponents);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[SWShareableContent initWithSourceSceneIdentifier:sourceBundleIdentifier:metadata:representations:highlightURL:initiatorHandle:initiatorNameComponents:](self, "initWithSourceSceneIdentifier:sourceBundleIdentifier:metadata:representations:highlightURL:initiatorHandle:initiatorNameComponents:", v7, v10, v13, v18, v21, v24, v27);
    v28 = self;
  }
  else
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB28A8];
    v34 = *MEMORY[0x1E0CB2938];
    v35[0] = CFSTR("This type only supports encoding and decoding via NSXPCCoder.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 4866, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v32);

    v28 = 0;
  }

  return v28;
}

- (void)encodeWithCoder:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SWShareableContent sourceSceneIdentifier](self, "sourceSceneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_sourceSceneIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

    -[SWShareableContent sourceBundleIdentifier](self, "sourceBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_sourceBundleIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

    -[SWShareableContent metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_metadata);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

    -[SWShareableContent representations](self, "representations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_representations);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

    -[SWShareableContent highlightURL](self, "highlightURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_highlightURL);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

    -[SWShareableContent initiatorHandle](self, "initiatorHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_initiatorHandle);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

    -[SWShareableContent initiatorNameComponents](self, "initiatorNameComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_initiatorNameComponents);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB28A8];
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = CFSTR("This type only supports encoding and decoding via NSXPCCoder.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 4866, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v22);

  }
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (NSURL)highlightURL
{
  return self->_highlightURL;
}

- (NSString)initiatorHandle
{
  return self->_initiatorHandle;
}

- (NSPersonNameComponents)initiatorNameComponents
{
  return self->_initiatorNameComponents;
}

- (NSString)sourceSceneIdentifier
{
  return self->_sourceSceneIdentifier;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSArray)representations
{
  return self->_representations;
}

- (SWShareableContentRepresentationProvider)representationProvider
{
  return self->_representationProvider;
}

- (void)setRepresentationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_representationProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representationProvider, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_initiatorNameComponents, 0);
  objc_storeStrong((id *)&self->_initiatorHandle, 0);
  objc_storeStrong((id *)&self->_highlightURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
