@implementation MPModelStoreBrowseRoomMusicKitResponseParser

- (MPModelStoreBrowseRoomMusicKitResponseParser)initWithRawResponseOutput:(id)a3 sectionBuilder:(id)a4 contentItemBuilder:(id)a5 filteredFCKinds:(id)a6 userIdentity:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MPModelStoreBrowseRoomMusicKitResponseParser *v17;
  MPModelStoreBrowseRoomMusicKitResponseParser *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MPModelStoreBrowseRoomMusicKitResponseParser;
  v17 = -[MPModelStoreBrowseRoomMusicKitResponseParser init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong(&v17->_rawResponseOutput, a3);
    objc_storeStrong((id *)&v18->_sectionBuilder, a4);
    objc_storeStrong((id *)&v18->_contentItemBuilder, a5);
    objc_storeStrong((id *)&v18->_filteredFCKinds, a6);
    objc_storeStrong((id *)&v18->_userIdentity, a7);
  }

  return v18;
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
  block[2] = __55__MPModelStoreBrowseRoomMusicKitResponseParser_results__block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  if (parseOnceToken != -1)
    dispatch_once(p_parseOnceToken, block);
  return self->_results;
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
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *rawResponseOutput;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  _BOOL4 v31;
  const char *v32;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  NSObject *v40;
  __int16 v41;
  NSObject *v42;
  _BYTE v43[128];
  _QWORD v44[7];

  v44[5] = *MEMORY[0x1E0C80C00];
  +[MPMediaAPIParserLayer layerWithKey:ofType:](MPMediaAPIParserLayer, "layerWithKey:ofType:", CFSTR("data"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v3;
  +[MPMediaAPIParserLayer layerWithFirstObjectOfType:](MPMediaAPIParserLayer, "layerWithFirstObjectOfType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v4;
  +[MPMediaAPIParserLayer layerWithKey:ofType:](MPMediaAPIParserLayer, "layerWithKey:ofType:", CFSTR("relationships"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v5;
  +[MPMediaAPIParserLayer layerWithKey:ofType:](MPMediaAPIParserLayer, "layerWithKey:ofType:", CFSTR("contents"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v6;
  +[MPMediaAPIParserLayer layerWithKey:ofType:](MPMediaAPIParserLayer, "layerWithKey:ofType:", CFSTR("data"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_NSIsNSDictionary() & 1) != 0)
  {
    v9 = self->_rawResponseOutput;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    v12 = v9;
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v36;
      v12 = v9;
      v34 = v8;
LABEL_4:
      v15 = 0;
      while (1)
      {
        v16 = v12;
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
        objc_msgSend(v17, "key");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v17, "key");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKey:](v16, "objectForKey:", v19);
          v12 = objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v17, "key");
              v24 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v40 = v24;
              v41 = 2114;
              v42 = v16;
              _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "Can't parse because %{public}@ property doesn't exist: %{public}@", buf, 0x16u);

            }
LABEL_26:
            v8 = v34;
            goto LABEL_40;
          }
        }
        else
        {
          -[NSObject firstObject](v16, "firstObject");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            v12 = os_log_create("com.apple.amp.mediaplayer", "Default");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v40 = v16;
              _os_log_impl(&dword_193B9B000, v12, OS_LOG_TYPE_ERROR, "Can't parse because array doesn't contain anything: %{public}@", buf, 0xCu);
            }
            goto LABEL_26;
          }
        }
        v20 = objc_msgSend(v17, "type");
        if (v20 == 1)
        {
          if ((_NSIsNSDictionary() & 1) == 0)
          {
            objc_msgSend(v17, "key");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = os_log_create("com.apple.amp.mediaplayer", "Default");
            v31 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
            if (!v30)
            {
              v8 = v34;
              if (!v31)
                goto LABEL_39;
              *(_DWORD *)buf = 138543362;
              v40 = v12;
              v32 = "Can't parse because array first object is not of expected (NSDictionary) type: %{public}@";
              goto LABEL_38;
            }
            v8 = v34;
            if (v31)
            {
              objc_msgSend(v17, "key");
              v28 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v40 = v28;
              v41 = 2114;
              v42 = v12;
              v29 = "Can't parse because %{public}@ property is not of expected (NSDictionary) type: %{public}@";
LABEL_33:
              _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_ERROR, v29, buf, 0x16u);

            }
LABEL_39:

LABEL_40:
            v21 = 0;
            goto LABEL_41;
          }
        }
        else if (!v20 && (_NSIsNSArray() & 1) == 0)
        {
          objc_msgSend(v17, "key");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = os_log_create("com.apple.amp.mediaplayer", "Default");
          v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          if (v25)
          {
            v8 = v34;
            if (v27)
            {
              objc_msgSend(v17, "key");
              v28 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v40 = v28;
              v41 = 2114;
              v42 = v12;
              v29 = "Can't parse because %{public}@ property is not of expected (NSArray) type: %{public}@";
              goto LABEL_33;
            }
            goto LABEL_39;
          }
          v8 = v34;
          if (!v27)
            goto LABEL_39;
          *(_DWORD *)buf = 138543362;
          v40 = v12;
          v32 = "Can't parse because array first object is not of expected (NSArray) type: %{public}@";
LABEL_38:
          _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
          goto LABEL_39;
        }

        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          v8 = v34;
          if (v13)
            goto LABEL_4;
          break;
        }
      }
    }

    -[MPModelStoreBrowseRoomMusicKitResponseParser _parsedElements:](self, "_parsedElements:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12;
LABEL_41:

  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      rawResponseOutput = self->_rawResponseOutput;
      *(_DWORD *)buf = 138543362;
      v40 = rawResponseOutput;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "Can't parse because input has unexpected type: %{public}@", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (id)_parsedElements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendSection:", v6);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[MPModelStoreBrowseRoomMusicKitResponseParser _parsedContentNode:additionalAttributesFromParent:](self, "_parsedContentNode:additionalAttributesFromParent:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), 0, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "appendItem:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "numberOfSections"))
    v13 = (void *)objc_msgSend(v5, "copy");
  else
    v13 = 0;

  return v13;
}

- (id)_parsedContentNode:(id)a3 additionalAttributesFromParent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MPStoreItemMetadata *v17;
  void *v18;
  void *v19;
  void *v21;

  v6 = a3;
  v7 = a4;
  if (_NSIsNSDictionary())
  {
    v8 = v6;
    objc_msgSend(v8, "objectForKey:", CFSTR("id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      MPStoreItemMetadataStringNormalizeStoreIDValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("type"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
          -[MPModelStoreBrowseContentItemBuilder contentItemTypeForMusicAPIType:](self->_contentItemBuilder, "contentItemTypeForMusicAPIType:", v12);
        objc_msgSend(v8, "objectForKey:", CFSTR("attributes"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSDictionary())
        {
          v21 = v12;
          v14 = (void *)objc_msgSend(v7, "mutableCopy");
          if (v14)
          {
            v15 = v14;
            objc_msgSend(v14, "addEntriesFromDictionary:", v13);
          }
          else
          {
            v15 = (void *)objc_msgSend(v13, "mutableCopy");
          }
          objc_msgSend(v15, "setObject:forKey:", v11, CFSTR("id"));
          objc_msgSend(v8, "objectForKey:", CFSTR("relationships"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v8, "objectForKey:", CFSTR("relationships"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKey:", v19, CFSTR("relationships"));

          }
          v17 = -[MPStoreItemMetadata initWithStoreMusicAPIDictionary:]([MPStoreItemMetadata alloc], "initWithStoreMusicAPIDictionary:", v15);

          v12 = v21;
        }
        else
        {
          v17 = 0;
        }
        -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:userIdentity:](self->_contentItemBuilder, "modelObjectWithStoreItemMetadata:userIdentity:", v17, self->_userIdentity);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
    }
    else
    {
      v11 = 0;
    }
    v16 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_filteredFCKinds, 0);
  objc_storeStrong((id *)&self->_contentItemBuilder, 0);
  objc_storeStrong((id *)&self->_sectionBuilder, 0);
  objc_storeStrong(&self->_rawResponseOutput, 0);
}

void __55__MPModelStoreBrowseRoomMusicKitResponseParser_results__block_invoke(uint64_t a1)
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
