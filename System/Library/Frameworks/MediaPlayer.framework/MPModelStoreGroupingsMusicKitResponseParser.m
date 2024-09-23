@implementation MPModelStoreGroupingsMusicKitResponseParser

- (MPModelStoreGroupingsMusicKitResponseParser)initWithRawResponseOutput:(id)a3 sectionBuilder:(id)a4 contentItemBuilder:(id)a5 filteredFCKinds:(id)a6 userIdentity:(id)a7 rootObjectIdentifier:(id)a8 options:(unint64_t)a9 storeURLBag:(id)a10
{
  id v17;
  id v18;
  MPModelStoreGroupingsMusicKitResponseParser *v19;
  MPModelStoreGroupingsMusicKitResponseParser *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v17 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)MPModelStoreGroupingsMusicKitResponseParser;
  v19 = -[MPModelStoreGroupingsMusicKitResponseParser init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong(&v19->_rawResponseOutput, a3);
    objc_storeStrong((id *)&v20->_sectionBuilder, a4);
    objc_storeStrong((id *)&v20->_contentItemBuilder, a5);
    objc_storeStrong((id *)&v20->_filteredFCKinds, a6);
    objc_storeStrong((id *)&v20->_userIdentity, a7);
    objc_storeStrong((id *)&v20->_rootObjectIdentifier, a8);
    v20->_options = a9;
    objc_storeStrong((id *)&v20->_storeURLBag, a10);
  }

  return v20;
}

- (MPSectionedCollection)results
{
  int64_t *p_parseOnceToken;
  int64_t parseOnceToken;
  _QWORD block[5];

  parseOnceToken = self->_parseOnceToken;
  p_parseOnceToken = &self->_parseOnceToken;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MPModelStoreGroupingsMusicKitResponseParser_results__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  if (parseOnceToken != -1)
    dispatch_once(p_parseOnceToken, block);
  return self->_results;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  if ((self->_options & 1) != 0)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("; createIndependentSectionsForLiveRadioStations = %@"), v7);
  if ((self->_options & 2) != 0)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("; useOneLevelHeroListHierarchy = %@"), v8);
  if ((self->_options & 4) != 0)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("; disallowEmptyTitleSections = %@"), v9);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)_parsedSectionedCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t i;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  NSObject *rawResponseOutput;
  void *v31;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  const char *v38;
  void *v39;
  _BOOL4 v40;
  const char *v41;
  NSObject *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  NSObject *v55;
  __int16 v56;
  NSObject *v57;
  _BYTE v58[128];
  _QWORD v59[8];

  v59[5] = *MEMORY[0x1E0C80C00];
  +[MPMediaAPIParserLayer layerWithKey:ofType:](MPMediaAPIParserLayer, "layerWithKey:ofType:", CFSTR("data"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v3;
  +[MPMediaAPIParserLayer layerWithFirstObjectOfType:](MPMediaAPIParserLayer, "layerWithFirstObjectOfType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v4;
  +[MPMediaAPIParserLayer layerWithKey:ofType:](MPMediaAPIParserLayer, "layerWithKey:ofType:", CFSTR("relationships"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v5;
  +[MPMediaAPIParserLayer layerWithKey:ofType:](MPMediaAPIParserLayer, "layerWithKey:ofType:", CFSTR("tabs"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v6;
  +[MPMediaAPIParserLayer layerWithKey:ofType:](MPMediaAPIParserLayer, "layerWithKey:ofType:", CFSTR("data"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_NSIsNSDictionary() & 1) == 0)
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      rawResponseOutput = self->_rawResponseOutput;
      *(_DWORD *)buf = 138543362;
      v55 = rawResponseOutput;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "Can't parse because input has unexpected type: %{public}@", buf, 0xCu);
    }
    v31 = 0;
    goto LABEL_62;
  }
  v9 = self->_rawResponseOutput;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v44 = v8;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  v12 = v9;
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v50;
    v12 = v9;
    do
    {
      v15 = v9;
      for (i = 0; i != v13; ++i)
      {
        v17 = v12;
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v18, "key");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v18, "key");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKey:](v12, "objectForKey:", v20);
          v12 = objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v18, "key");
              v33 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v55 = v33;
              v56 = 2114;
              v57 = v17;
              _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "Can't parse because %{public}@ property doesn't exist: %{public}@", buf, 0x16u);

            }
LABEL_46:
            v8 = v44;
            v9 = v15;
            goto LABEL_60;
          }
        }
        else
        {
          -[NSObject firstObject](v12, "firstObject");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v55 = v17;
              _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "Can't parse because array doesn't contain anything: %{public}@", buf, 0xCu);
            }
            goto LABEL_46;
          }
        }
        v21 = objc_msgSend(v18, "type");
        if (v21 == 1)
        {
          if ((_NSIsNSDictionary() & 1) == 0)
          {
            objc_msgSend(v18, "key");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = os_log_create("com.apple.amp.mediaplayer", "Default");
            v40 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
            if (!v39)
            {
              v8 = v44;
              v9 = v15;
              if (!v40)
                goto LABEL_59;
              *(_DWORD *)buf = 138543362;
              v55 = v12;
              v41 = "Can't parse because array first object is not of expected (NSDictionary) type: %{public}@";
              goto LABEL_58;
            }
            v8 = v44;
            v9 = v15;
            if (v40)
            {
              objc_msgSend(v18, "key");
              v37 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v55 = v37;
              v56 = 2114;
              v57 = v12;
              v38 = "Can't parse because %{public}@ property is not of expected (NSDictionary) type: %{public}@";
LABEL_53:
              _os_log_impl(&dword_193B9B000, v35, OS_LOG_TYPE_ERROR, v38, buf, 0x16u);

            }
LABEL_59:

LABEL_60:
            v31 = 0;
            goto LABEL_61;
          }
        }
        else if (!v21 && (_NSIsNSArray() & 1) == 0)
        {
          objc_msgSend(v18, "key");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = os_log_create("com.apple.amp.mediaplayer", "Default");
          v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
          if (v34)
          {
            v8 = v44;
            v9 = v15;
            if (v36)
            {
              objc_msgSend(v18, "key");
              v37 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v55 = v37;
              v56 = 2114;
              v57 = v12;
              v38 = "Can't parse because %{public}@ property is not of expected (NSArray) type: %{public}@";
              goto LABEL_53;
            }
            goto LABEL_59;
          }
          v8 = v44;
          v9 = v15;
          if (!v36)
            goto LABEL_59;
          *(_DWORD *)buf = 138543362;
          v55 = v12;
          v41 = "Can't parse because array first object is not of expected (NSArray) type: %{public}@";
LABEL_58:
          _os_log_impl(&dword_193B9B000, v35, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
          goto LABEL_59;
        }

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      v9 = v15;
    }
    while (v13);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v22 = v12;
  v23 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  v17 = v22;
  if (!v23)
    goto LABEL_43;
  v24 = v23;
  v43 = v9;
  v25 = *(_QWORD *)v46;
  while (2)
  {
    for (j = 0; j != v24; ++j)
    {
      if (*(_QWORD *)v46 != v25)
        objc_enumerationMutation(v22);
      v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
      if (self->_rootObjectIdentifier)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "objectForKey:", CFSTR("attributes"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!_NSIsNSDictionary())
          goto LABEL_33;
        objc_msgSend(v28, "objectForKey:", CFSTR("token"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!_NSIsNSString()
          || !objc_msgSend(v29, "isEqualToString:", self->_rootObjectIdentifier))
        {
          goto LABEL_32;
        }

      }
      objc_msgSend(v27, "objectForKey:", CFSTR("relationships"), v43);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_NSIsNSDictionary())
        goto LABEL_33;
      objc_msgSend(v28, "objectForKey:", CFSTR("children"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        objc_msgSend(v29, "objectForKey:", CFSTR("data"));
        v17 = objc_claimAutoreleasedReturnValue();
        if ((_NSIsNSArray() & 1) != 0)
        {

          goto LABEL_42;
        }

      }
LABEL_32:

LABEL_33:
    }
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v24)
      continue;
    break;
  }
  v17 = v22;
LABEL_42:
  v9 = v43;
LABEL_43:

  -[MPModelStoreGroupingsMusicKitResponseParser _parsedEditorialElements:](self, "_parsedEditorialElements:", v17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v44;
LABEL_61:

LABEL_62:
  return v31;
}

- (id)_parsedEditorialElements:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v5)
  {
    v19 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(obj);
        -[MPModelStoreGroupingsMusicKitResponseParser _parsedEditorialElementX:](self, "_parsedEditorialElementX:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v35 != v9)
                objc_enumerationMutation(v7);
              v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_msgSend(v11, "firstSection");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "appendSection:", v12);

              objc_msgSend(v11, "allItems");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "appendItems:", v13);

            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v8);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v5);
  }

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4468;
  v28 = __Block_byref_object_dispose__4469;
  v29 = (id)objc_opt_new();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __72__MPModelStoreGroupingsMusicKitResponseParser__parsedEditorialElements___block_invoke;
  v23[3] = &unk_1E3153CE0;
  v23[4] = &v30;
  v23[5] = &v24;
  objc_msgSend(v4, "enumerateSectionsUsingBlock:", v23);
  if (*((_BYTE *)v31 + 24))
  {
    v15 = (void *)v25[5];
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __72__MPModelStoreGroupingsMusicKitResponseParser__parsedEditorialElements___block_invoke_2;
    v21[3] = &unk_1E315DBB0;
    v22 = v4;
    objc_msgSend(v15, "enumerateIndexesUsingBlock:", v21);

  }
  if (objc_msgSend(v4, "numberOfSections"))
    v16 = (void *)objc_msgSend(v4, "copy");
  else
    v16 = 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

- (id)_parsedEditorialElementX:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  NSIndexSet *filteredFCKinds;
  unint64_t options;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NSIsNSDictionary())
  {
    v5 = v4;
    v6 = -[MPModelStoreGroupingsMusicKitResponseParser featuredContentKindForNode:](self, "featuredContentKindForNode:", v5);
    filteredFCKinds = self->_filteredFCKinds;
    if (filteredFCKinds && !-[NSIndexSet containsIndex:](filteredFCKinds, "containsIndex:", v6))
    {
      v17 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_22;
    }
    options = self->_options;
    if ((options & 1) != 0 && v6 == 488 || (options & 2) != 0 && v6 == 316)
    {
      v9 = (void *)objc_opt_new();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[MPModelStoreGroupingsMusicKitResponseParser childrenOfContentNode:](self, "childrenOfContentNode:", v5, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            -[MPModelStoreGroupingsMusicKitResponseParser _parsedEditorialElement:](self, "_parsedEditorialElement:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v9, "addObject:", v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v12);
      }

      v16 = objc_msgSend(v9, "copy");
    }
    else
    {
      -[MPModelStoreGroupingsMusicKitResponseParser _parsedEditorialElement:](self, "_parsedEditorialElement:", v5);
      v19 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v19;
      if (!v19)
      {
        v17 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_19;
      }
      v24 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v16;
LABEL_19:

LABEL_22:
    goto LABEL_23;
  }
  v17 = (void *)MEMORY[0x1E0C9AA60];
LABEL_23:

  return v17;
}

- (id)_parsedEditorialElement:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  NSIndexSet *filteredFCKinds;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  MPModelStoreBrowseSectionBuilder *sectionBuilder;
  uint64_t v46;
  MPModelStoreBrowseSectionBuilder *v47;
  void *v48;
  uint64_t v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  int64_t v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NSIsNSDictionary())
  {
    v5 = (void *)objc_opt_new();
    v60 = v4;
    v6 = -[MPModelStoreGroupingsMusicKitResponseParser featuredContentKindForNode:](self, "featuredContentKindForNode:");
    filteredFCKinds = self->_filteredFCKinds;
    if (filteredFCKinds && !-[NSIndexSet containsIndex:](filteredFCKinds, "containsIndex:", v6))
    {
      v10 = 0;
LABEL_75:

      goto LABEL_76;
    }
    objc_msgSend(v60, "objectForKey:", CFSTR("attributes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSDictionary())
    {
      v10 = 0;
LABEL_74:

      goto LABEL_75;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("name"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSString() & 1) != 0)
    {
      if (v9)
      {
LABEL_16:
        if (_parsedEditorialElement__onceToken == -1)
        {
          if (v9)
            goto LABEL_20;
        }
        else
        {
          dispatch_once(&_parsedEditorialElement__onceToken, &__block_literal_global_4453);
          if (v9)
            goto LABEL_20;
        }
        if ((self->_options & 4) == 0
          || (v12 = _parsedEditorialElement__featuredContentKindInWhichTitleCanBeIgnored,
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              LOBYTE(v12) = objc_msgSend((id)v12, "containsObject:", v13),
              v13,
              (v12 & 1) != 0))
        {
LABEL_20:
          objc_msgSend(v8, "objectForKey:", CFSTR("seeAllUrl"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_NSIsNSString() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
            v15 = objc_claimAutoreleasedReturnValue();

            v57 = v15;
            if (v15)
            {
LABEL_31:
              v58 = v6;
              v59 = v9;
              if (_NSIsNSDictionary())
              {
                objc_msgSend(v8, "objectForKey:", CFSTR("emphasize"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v18, "BOOLValue");

              }
              else
              {
                v53 = 0;
              }
              v55 = v4;
              v56 = v8;
              v54 = v5;
              -[MPModelStoreGroupingsMusicKitResponseParser childrenOfContentNode:](self, "childrenOfContentNode:", v60);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (void *)objc_opt_new();
              v21 = (void *)objc_opt_new();
              v65 = 0u;
              v66 = 0u;
              v67 = 0u;
              v68 = 0u;
              v22 = v19;
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
              if (!v23)
              {
                v26 = 1;
                goto LABEL_52;
              }
              v24 = v23;
              v25 = *(_QWORD *)v66;
              v26 = 1;
              while (1)
              {
                v27 = 0;
                do
                {
                  if (*(_QWORD *)v66 != v25)
                    objc_enumerationMutation(v22);
                  v28 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v27);
                  v29 = -[MPModelStoreGroupingsMusicKitResponseParser featuredContentKindCorrespondsToItem:](self, "featuredContentKindCorrespondsToItem:", v28);
                  if (!-[MPModelStoreGroupingsMusicKitResponseParser isContentNodeAnEditorialElement:](self, "isContentNodeAnEditorialElement:", v28))
                  {
                    -[MPModelStoreGroupingsMusicKitResponseParser attributesForContentNode:](self, "attributesForContentNode:", v60);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MPModelStoreGroupingsMusicKitResponseParser _parsedContentNode:uniformContentItemTypeResolver:additionalAttributesFromParent:](self, "_parsedContentNode:uniformContentItemTypeResolver:additionalAttributesFromParent:", v28, v20, v33);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_43:
                    v26 = 0;
                    if (!v32)
                      goto LABEL_45;
LABEL_44:
                    objc_msgSend(v21, "addObject:", v32);
                    goto LABEL_45;
                  }
                  if (v29)
                  {
                    -[MPModelStoreGroupingsMusicKitResponseParser firstChildOfContentNode:](self, "firstChildOfContentNode:", v28);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MPModelStoreGroupingsMusicKitResponseParser attributesForContentNode:](self, "attributesForContentNode:", v28);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MPModelStoreGroupingsMusicKitResponseParser _parsedContentNode:uniformContentItemTypeResolver:additionalAttributesFromParent:](self, "_parsedContentNode:uniformContentItemTypeResolver:additionalAttributesFromParent:", v30, v20, v31);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();

                    goto LABEL_43;
                  }
                  -[MPModelStoreGroupingsMusicKitResponseParser _parsedEditorialElement:](self, "_parsedEditorialElement:", v28);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v32)
                    goto LABEL_44;
LABEL_45:

                  ++v27;
                }
                while (v24 != v27);
                v34 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
                v24 = v34;
                if (!v34)
                {
LABEL_52:

                  -[MPModelStoreGroupingsMusicKitResponseParser linksForContentNode:](self, "linksForContentNode:", v60);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v21, "count") && objc_msgSend(v35, "count"))
                  {
                    v63 = 0u;
                    v64 = 0u;
                    v61 = 0u;
                    v62 = 0u;
                    v51 = v35;
                    v36 = v35;
                    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
                    if (v37)
                    {
                      v38 = v37;
                      v39 = *(_QWORD *)v62;
                      do
                      {
                        for (i = 0; i != v38; ++i)
                        {
                          if (*(_QWORD *)v62 != v39)
                            objc_enumerationMutation(v36);
                          -[MPModelStoreGroupingsMusicKitResponseParser linkSectionWithDictionary:](self, "linkSectionWithDictionary:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v41)
                            objc_msgSend(v21, "addObject:", v41);

                        }
                        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
                      }
                      while (v38);
                    }

                    v35 = v51;
                  }
                  if (objc_msgSend(v21, "count") || v58 == 332)
                  {
                    v52 = v35;
                    v5 = v54;
                    v4 = v55;
                    if (v58 == 489 || v58 == 383)
                    {
                      objc_msgSend(v21, "firstObject");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "radioStation");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v44 = 0;
                    }
                    sectionBuilder = self->_sectionBuilder;
                    v46 = objc_msgSend(v20, "uniformContentItemType");
                    LOBYTE(v50) = v26 & 1;
                    v47 = sectionBuilder;
                    v42 = v57;
                    -[MPModelStoreBrowseSectionBuilder modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:displaysAsGridCellInCarPlay:previouslyRetrievedNestedResponse:onlyContainsEditorialElements:featuredContentKind:modelObject:](v47, "modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:displaysAsGridCellInCarPlay:previouslyRetrievedNestedResponse:onlyContainsEditorialElements:featuredContentKind:modelObject:", v59, v57, v46, v58 == 323, v58 == 325, v53, 0, v50, v58, v44);
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "appendSection:", v48);
                    objc_msgSend(v54, "appendItems:", v21);
                    v10 = (void *)objc_msgSend(v54, "copy");

                    v35 = v52;
                  }
                  else
                  {
                    v10 = 0;
                    v5 = v54;
                    v4 = v55;
                    v42 = v57;
                  }

                  v8 = v56;
                  v9 = v59;
                  goto LABEL_73;
                }
              }
            }
          }
          else
          {

          }
          objc_msgSend(v8, "objectForKey:", CFSTR("link"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (_NSIsNSDictionary())
          {
            objc_msgSend(v16, "objectForKey:", CFSTR("url"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (_NSIsNSString())
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
              v57 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v57 = 0;
            }

          }
          else
          {
            v57 = 0;
            v17 = v16;
          }

          goto LABEL_31;
        }
        _MPLogCategoryDefault();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v72 = v60;
          _os_log_impl(&dword_193B9B000, v42, OS_LOG_TYPE_ERROR, "Dropping node without title: %{public}@", buf, 0xCu);
        }
        v10 = 0;
LABEL_73:

        goto LABEL_74;
      }
    }
    else
    {

    }
    objc_msgSend(v8, "objectForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v9 = v11;
    else
      v9 = 0;

    goto LABEL_16;
  }
  v10 = 0;
LABEL_76:

  return v10;
}

- (id)bagRoomURLRegularExpression
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[ICURLBag dictionaryForBagKey:](self->_storeURLBag, "dictionaryForBagKey:", *MEMORY[0x1E0DDBEA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("viewRoomUrlRegex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v9 = 0;
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v4, 0, &v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      if (v6)
      {
        v7 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v11 = v4;
          v12 = 2114;
          v13 = v6;
          _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_ERROR, "Regex cannot be generated from pattern: %{public}@ with error %{public}@", buf, 0x16u);
        }

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)musicAPIURLWithLinkURLString:(id)a3
{
  id v4;
  NSRegularExpression *storeBagLinkRegularExpression;
  NSRegularExpression *v6;
  NSRegularExpression *v7;
  NSRegularExpression *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_t v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    storeBagLinkRegularExpression = self->_storeBagLinkRegularExpression;
    if (storeBagLinkRegularExpression
      || (-[MPModelStoreGroupingsMusicKitResponseParser bagRoomURLRegularExpression](self, "bagRoomURLRegularExpression"), v6 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue(), v7 = self->_storeBagLinkRegularExpression, self->_storeBagLinkRegularExpression = v6, v7, (storeBagLinkRegularExpression = self->_storeBagLinkRegularExpression) != 0))
    {
      v8 = storeBagLinkRegularExpression;
      -[NSRegularExpression matchesInString:options:range:](v8, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v11 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v4;
          _os_log_impl(&dword_193B9B000, v11, OS_LOG_TYPE_ERROR, "No match found, URL is not supported: %{public}@", buf, 0xCu);
        }
        v17 = 0;
        goto LABEL_20;
      }
      -[ICURLBag stringForBagKey:](self->_storeURLBag, "stringForBagKey:", *MEMORY[0x1E0DDBE78]);
      v11 = objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSString() & 1) != 0)
      {
        v12 = objc_msgSend(v10, "rangeWithName:", CFSTR("identifier"));
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v4, "substringWithRange:", v12, v13);
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (os_log_t)v14;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/v1/editorial/%@/rooms/%@"), v11, v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            MusicURLWithPathUsingURLBag(v16, self->_storeURLBag, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
LABEL_20:

            goto LABEL_21;
          }
        }
        v15 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v10;
          v18 = "Match didn't capture an identifier: %{public}@";
          v19 = v15;
          v20 = 12;
          goto LABEL_17;
        }
      }
      else
      {
        v15 = os_log_create("com.apple.amp.mediaplayer", "Default");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v18 = "countryCode not found in bag";
          v19 = v15;
          v20 = 2;
LABEL_17:
          _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
        }
      }
      v17 = 0;
      goto LABEL_19;
    }
  }
  v17 = 0;
LABEL_21:

  return v17;
}

- (id)linkSectionWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("url"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPModelStoreGroupingsMusicKitResponseParser musicAPIURLWithLinkURLString:](self, "musicAPIURLWithLinkURLString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v11) = 0;
      -[MPModelStoreBrowseSectionBuilder modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:displaysAsGridCellInCarPlay:previouslyRetrievedNestedResponse:onlyContainsEditorialElements:featuredContentKind:modelObject:](self->_sectionBuilder, "modelObjectWithTitle:loadAdditionalContentURL:uniformContentItemType:isMemberOfChartSet:isBrick:displaysAsGridCellInCarPlay:previouslyRetrievedNestedResponse:onlyContainsEditorialElements:featuredContentKind:modelObject:", v5, v7, 16, 0, 0, 0, 0, v11, 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v4;
        _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "Dropping link without label: %{public}@", buf, 0xCu);
      }

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)featuredContentKindForNode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("attributes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("editorialElementKind"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = objc_msgSend(v5, "integerValue");
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)attributesForContentNode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("attributes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)firstChildOfContentNode:(id)a3
{
  void *v3;
  void *v4;

  -[MPModelStoreGroupingsMusicKitResponseParser childrenOfContentNode:](self, "childrenOfContentNode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)childrenOfContentNode:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("children"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v5 = v4;

      objc_msgSend(v5, "objectForKey:", CFSTR("data"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

      if (_NSIsNSArray())
      {
        v6 = v4;
        v4 = v6;
        if (v6)
        {
          v3 = v6;
LABEL_14:

          goto LABEL_15;
        }
      }
    }
    else
    {
      v5 = v3;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("contents"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSDictionary())
    {
      v7 = v3;

      objc_msgSend(v7, "objectForKey:", CFSTR("data"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (_NSIsNSArray())
      {
        v4 = v3;
        v3 = v4;
      }
      else
      {
        v4 = 0;
      }
      v5 = v7;
    }
    else
    {
      v4 = 0;
    }
    goto LABEL_14;
  }
  v4 = 0;
LABEL_15:

  return v4;
}

- (id)linksForContentNode:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("links"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
      v5 = v4;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)featuredContentKindCorrespondsToItem:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v7;

  v4 = a3;
  if (_NSIsNSDictionary())
  {
    v5 = -[MPModelStoreGroupingsMusicKitResponseParser featuredContentKindForNode:](self, "featuredContentKindForNode:", v4);
    v7 = v5 != 317 && v5 != 383;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isContentNodeAnEditorialElement:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("type"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
      v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("editorial-elements"));
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_parsedContentNode:(id)a3 uniformContentItemTypeResolver:(id)a4 additionalAttributesFromParent:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MPStoreItemMetadata *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_NSIsNSDictionary())
  {
    v11 = v8;
    objc_msgSend(v11, "objectForKey:", CFSTR("id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      MPStoreItemMetadataStringNormalizeStoreIDValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("type"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
          -[MPModelStoreBrowseContentItemBuilder contentItemTypeForMusicAPIType:](self->_contentItemBuilder, "contentItemTypeForMusicAPIType:", v15);
        objc_msgSend(v11, "objectForKey:", CFSTR("attributes"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v16;
        if (_NSIsNSDictionary())
        {
          v17 = (void *)objc_msgSend(v10, "mutableCopy");
          if (v17)
          {
            v18 = v17;
            objc_msgSend(v17, "addEntriesFromDictionary:", v16);
          }
          else
          {
            v18 = (void *)objc_msgSend(v16, "mutableCopy");
          }
          objc_msgSend(v18, "setObject:forKey:", v14, CFSTR("id"), v15, v16);
          objc_msgSend(v11, "objectForKey:", CFSTR("relationships"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v11, "objectForKey:", CFSTR("relationships"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKey:", v22, CFSTR("relationships"));

          }
          v20 = -[MPStoreItemMetadata initWithStoreMusicAPIDictionary:]([MPStoreItemMetadata alloc], "initWithStoreMusicAPIDictionary:", v18);

          v15 = v24;
        }
        else
        {
          v20 = 0;
        }
        objc_msgSend(v9, "addContentItemType:", -[MPModelStoreBrowseContentItemBuilder contentItemTypeForStoreItemMetadata:](self->_contentItemBuilder, "contentItemTypeForStoreItemMetadata:", v20));
        -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:userIdentity:](self->_contentItemBuilder, "modelObjectWithStoreItemMetadata:userIdentity:", v20, self->_userIdentity);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
    }
    else
    {
      v14 = 0;
    }
    v19 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v19 = 0;
LABEL_19:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootObjectIdentifier, 0);
  objc_storeStrong((id *)&self->_storeBagLinkRegularExpression, 0);
  objc_storeStrong((id *)&self->_storeURLBag, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_filteredFCKinds, 0);
  objc_storeStrong((id *)&self->_contentItemBuilder, 0);
  objc_storeStrong((id *)&self->_sectionBuilder, 0);
  objc_storeStrong(&self->_rawResponseOutput, 0);
}

void __71__MPModelStoreGroupingsMusicKitResponseParser__parsedEditorialElement___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E31E47E0, &unk_1E31E47F8, &unk_1E31E4810, &unk_1E31E4828, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_parsedEditorialElement__featuredContentKindInWhichTitleCanBeIgnored;
  _parsedEditorialElement__featuredContentKindInWhichTitleCanBeIgnored = v0;

}

uint64_t __72__MPModelStoreGroupingsMusicKitResponseParser__parsedEditorialElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "sectionType");
  if ((unint64_t)(result - 13) >= 2)
  {
    if (result == 12)
      return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addIndex:", a3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __72__MPModelStoreGroupingsMusicKitResponseParser__parsedEditorialElements___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeSectionAtIndex:", a2);
}

void __54__MPModelStoreGroupingsMusicKitResponseParser_results__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_parsedSectionedCollection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

@end
