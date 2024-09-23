@implementation MPServerObjectDatabaseStorePlatformImportRequest

- (MPServerObjectDatabaseStorePlatformImportRequest)initWithPayload:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPServerObjectDatabaseStorePlatformImportRequest;
  return (MPServerObjectDatabaseStorePlatformImportRequest *)-[MPServerObjectDatabaseImportRequest _initWithPayload:](&v4, sel__initWithPayload_, a3);
}

- (id)performWithDatabaseOperations:(id)a3 augmentingPayload:(id *)a4
{
  id v6;
  MPStorePlatformEntityTranslatorContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MPStorePlatformEntityTranslatorContext *v17;
  id v18;
  id v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  id v23;
  MPServerObjectDatabaseImportResult *v24;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  _QWORD v29[5];
  MPStorePlatformEntityTranslatorContext *v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MPStorePlatformEntityTranslatorContext);
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPServerObjectDatabaseImportRequest userIdentity](self, "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DSIDForUserIdentity:outError:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStorePlatformEntityTranslatorContext setPersonID:](v7, "setPersonID:", v11);

  -[MPStorePlatformEntityTranslatorContext personID](v7, "personID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (!v13)
    -[MPStorePlatformEntityTranslatorContext setPersonID:](v7, "setPersonID:", *MEMORY[0x1E0DDBEC8]);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__8917;
  v38 = __Block_byref_object_dispose__8918;
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPServerObjectDatabaseImportRequest payload](self, "payload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke;
  v29[3] = &unk_1E3154900;
  v29[4] = self;
  v17 = v7;
  v30 = v17;
  v33 = &v34;
  v18 = v6;
  v31 = v18;
  v19 = v14;
  v32 = v19;
  _MPServerObjectDatabaseMetadataImportEnumerateObjects(v15, a4, CFSTR("kind"), 0, 0, 0, 0, v29);

  v20 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(v19, "count");
    v22 = v35[5];
    *(_DWORD *)buf = 67109378;
    v41 = v21;
    v42 = 2114;
    v43 = v22;
    _os_log_impl(&dword_193B9B000, v20, OS_LOG_TYPE_DEFAULT, "SOD performWithDatabaseOperations: importing [Platform payload] childRelationsCount=%d collectionVersionHash=%{public}@", buf, 0x12u);
  }

  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_311;
  v26[3] = &unk_1E3154898;
  v23 = v18;
  v27 = v23;
  v28 = &v34;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v26);
  v24 = -[MPServerObjectDatabaseImportResult initWithAnnotatedPayload:playableAssetIdentifiers:error:]([MPServerObjectDatabaseImportResult alloc], "initWithAnnotatedPayload:playableAssetIdentifiers:error:", a4, 0, 0);

  _Block_object_dispose(&v34, 8);
  return v24;
}

uint64_t __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  MPIdentifierSet *v25;
  void *v26;
  MPIdentifierSet *v27;
  uint64_t v28;
  MPServerObjectDatabaseMediaAPIImportChildRelation *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  NSObject *v53;
  char v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  +[MPStorePlatformEntityTranslator translatorForKind:](MPStorePlatformEntityTranslator, "translatorForKind:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "identifiersForPayload:context:", v12, *(_QWORD *)(a1 + 40));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a8 = v15;
    v56 = v15;
    if (v15)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("versionHash"));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        v19 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          v66 = v20;
          v67 = 2114;
          v68 = v11;
          _os_log_impl(&dword_193B9B000, v19, OS_LOG_TYPE_DEFAULT, "SOD performWithDatabaseOperations: SP payload contains collectionPlaylistVersionHash=%{public}@ for type=%{public}@", buf, 0x16u);
        }

      }
      v52 = v14;
      v55 = v12;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("childrenIds"));
      v21 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject count](v21, "count"))
      {
        v22 = 0;
        do
        {
          -[NSObject objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_childKeyForParentType:type:", v11, CFSTR("song"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = [MPIdentifierSet alloc];
            +[MPModelSongKind identityKind](MPModelSongKind, "identityKind");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_296;
            v62[3] = &unk_1E3162A70;
            v63 = v23;
            v64 = *(id *)(a1 + 40);
            v27 = -[MPIdentifierSet initWithSource:modelKind:block:](v25, "initWithSource:modelKind:block:", CFSTR("ServerObjectDatabase-ImportRequest"), v26, v62);

            v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
            if (v28)
            {
              if (!v22)
              {
                objc_msgSend(*(id *)(a1 + 48), "removeRelationshipsForParentIdentifiers:childKey:", v56, v24);
                v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
              }
              objc_msgSend(*(id *)(a1 + 48), "relateIdentifiers:toParentIdentifiers:parentVersionHash:childKey:order:", v27, v56, v28, v24, v22);
            }
            else
            {
              v29 = -[MPServerObjectDatabaseMediaAPIImportChildRelation initWithItemIdentifiers:parentIdentifiers:childKey:relativeOrder:]([MPServerObjectDatabaseMediaAPIImportChildRelation alloc], "initWithItemIdentifiers:parentIdentifiers:childKey:relativeOrder:", v27, v56, v24, v22);
              objc_msgSend(*(id *)(a1 + 56), "addObject:", v29);

            }
          }

          ++v22;
        }
        while (v22 < -[NSObject count](v21, "count"));
      }
      v30 = v12;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("children"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_NSIsNSDictionary() & 1) != 0)
      {
        v51 = v31;
        v32 = (void *)objc_msgSend(v31, "mutableCopy");
        objc_msgSend(v32, "allKeys");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "count"))
        {
          v34 = 0;
          v54 = 0;
          v53 = v21;
          do
          {
            objc_msgSend(v33, "objectAtIndexedSubscript:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKeyedSubscript:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (_NSIsNSDictionary())
            {
              v37 = (void *)objc_msgSend(v36, "mutableCopy");
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("artwork"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v38)
              {
                objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("artwork"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v53;
                objc_msgSend(v37, "setObject:forKeyedSubscript:", v39, CFSTR("artwork"));

                objc_msgSend(v32, "setObject:forKeyedSubscript:", v37, v35);
                v54 = 1;
              }

            }
            ++v34;
          }
          while (v34 < objc_msgSend(v33, "count"));
          if ((v54 & 1) != 0)
          {
            v40 = (void *)objc_msgSend(v55, "mutableCopy");
            objc_msgSend(v40, "setObject:forKeyedSubscript:", v32, CFSTR("children"));

            v55 = v40;
          }
        }

        v30 = v55;
        v31 = v51;
      }
      objc_msgSend(v30, "valueForKey:", CFSTR("extendedAssetUrls"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        v43 = v41;
      }
      else
      {
        objc_msgSend(v30, "valueForKeyPath:", CFSTR("assetUrls"));
        v43 = (id)objc_claimAutoreleasedReturnValue();
      }
      v46 = v43;

      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_4;
      v57[3] = &unk_1E3154820;
      v58 = *(id *)(a1 + 48);
      v44 = v56;
      v47 = *(_QWORD *)(a1 + 32);
      v59 = v44;
      v60 = v47;
      v12 = v30;
      v61 = v12;
      objc_msgSend(v46, "enumerateKeysAndObjectsUsingBlock:", v57);
      v48 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "expirationDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v48, "importObject:type:identifiers:source:expiration:", v12, v11, v44, 2, v49);

      v14 = v52;
LABEL_38:

      goto LABEL_39;
    }
    v44 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_unsupportedStorePlatformKinds");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v44, "containsObject:", v11) & 1) == 0)
    {
      objc_msgSend(v44, "addObject:", v11);
      v21 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v11;
        _os_log_impl(&dword_193B9B000, v21, OS_LOG_TYPE_FAULT, "Encountered unsupported StorePlatform kind: %@", buf, 0xCu);
      }
      v45 = 0;
      goto LABEL_38;
    }
  }
  v45 = 0;
LABEL_39:

  return v45;
}

void __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_311(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (!objc_msgSend(v11, "relativeOrder"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v11, "parentIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "childKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeRelationshipsForParentIdentifiers:childKey:", v4, v5);

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v11, "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parentIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    v9 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  else
    v9 = &stru_1E3163D10;
  objc_msgSend(v11, "childKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relateIdentifiers:toParentIdentifiers:parentVersionHash:childKey:order:", v7, v8, v9, v10, objc_msgSend(v11, "relativeOrder"));

}

void __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_296(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_2;
  v6[3] = &unk_1E3163A30;
  v7 = *(id *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setUniversalStoreIdentifiersWithBlock:", v6);
  objc_msgSend(*(id *)(a1 + 40), "personID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonalStoreIdentifiersWithPersonID:block:", v5, &__block_literal_global_299);

}

void __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (_NSIsNSString() && _NSIsNSString())
  {
    v7 = v5;
    if ((objc_msgSend(&unk_1E31E58D8, "containsObject:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(&unk_1E31E58F0, "containsObject:", v7) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(&unk_1E31E5908, "containsObject:", v7) & 1) != 0)
    {
      v8 = 3;
    }
    else if (objc_msgSend(&unk_1E31E5920, "containsObject:", v7))
    {
      v8 = 4;
    }
    else
    {
      v8 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v8 && v13)
    {
      v15 = *(void **)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "assetURLExpirationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "importAssetURL:forIdentifiers:flavor:expirationDate:", v14, v16, v8, v17);
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("enhancedHls")) || !v14)
        goto LABEL_25;
      objc_msgSend(*(id *)(a1 + 56), "valueForKey:", CFSTR("redeliveryTargetId"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = objc_msgSend(v17, "longLongValue");
      else
        v18 = 0;
      v19 = *MEMORY[0x1E0DDBDD8];
      v20 = *(void **)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "assetURLExpirationDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "importHLSAssetURL:keyCertificateURL:keyServerURL:redeliveryId:protocolType:isiTunesStoreStream:forIdentifiers:expirationDate:", v14, 0, 0, v18, v19, 1, v21, v22);

    }
LABEL_25:

    goto LABEL_26;
  }
  v9 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    *(_DWORD *)buf = 138544130;
    v24 = v10;
    v25 = 2114;
    v26 = (id)objc_opt_class();
    v27 = 2114;
    v28 = v5;
    v29 = 2114;
    v30 = v6;
    v12 = v26;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_FAULT, "Encountered unsupported data type in assetURLs [StorePlatform]: flavorStringType=%{public}@ urlStringType=%{public}@ flavorString=%{public}@ urlString=%{public}@", buf, 0x2Au);

  }
LABEL_26:

}

void __100__MPServerObjectDatabaseStorePlatformImportRequest_performWithDatabaseOperations_augmentingPayload___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v2, "longLongValue"));

}

+ (id)_unsupportedParentChildRelationships
{
  if (_unsupportedParentChildRelationships_onceToken_313 != -1)
    dispatch_once(&_unsupportedParentChildRelationships_onceToken_313, &__block_literal_global_314);
  return (id)_unsupportedParentChildRelationships_unsupportedParentChildRelationships_312;
}

+ (id)_unsupportedStorePlatformKinds
{
  if (_unsupportedStorePlatformKinds_onceToken != -1)
    dispatch_once(&_unsupportedStorePlatformKinds_onceToken, &__block_literal_global_315);
  return (id)_unsupportedStorePlatformKinds_unsupportedKinds;
}

+ (id)_childKeyForParentType:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("song")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("album")))
    {
      v8 = CFSTR("MPModelChildSongAlbum");
LABEL_19:
      v9 = v8;
      goto LABEL_20;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("artist")))
    {
      v8 = CFSTR("MPModelChildSongArtists");
      goto LABEL_19;
    }
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("album")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("song")))
    {
      v8 = CFSTR("MPModelChildAlbumSongs");
      goto LABEL_19;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("artist")))
    {
      v8 = CFSTR("MPModelChildAlbumArtists");
      goto LABEL_19;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("record-labels")))
    {
      v8 = CFSTR("MPModelChildAlbumRecordLabels");
      goto LABEL_19;
    }
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("artist"))
    && objc_msgSend(v7, "isEqualToString:", CFSTR("album")))
  {
    v8 = CFSTR("MPModelChildArtistAlbums");
    goto LABEL_19;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("playlist"))
    && objc_msgSend(v7, "isEqualToString:", CFSTR("song")))
  {
    v8 = CFSTR("MPModelChildPlaylistEntries");
    goto LABEL_19;
  }
  objc_msgSend(a1, "_unsupportedParentChildRelationships");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v19[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("|"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "containsObject:", v13) & 1) == 0)
  {
    objc_msgSend(v11, "addObject:", v13);
    v14 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_193B9B000, v14, OS_LOG_TYPE_ERROR, "Encountered unexpected store platform relationship parent=%@ type=%@", (uint8_t *)&v15, 0x16u);
    }

  }
  v8 = 0;
LABEL_20:

  return v8;
}

+ (id)_entityTypeForObject:(id)a3
{
  void *v3;
  void *v4;
  __CFString **v5;
  __CFString *v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kind"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v7 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("song")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("musicVideo")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("uploadedAudio")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("uploadedVideo")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericSong;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("playlist")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericPlaylist;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("artist")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericArtist;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("album")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericAlbum;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("radioStation")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericRadioStation;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tvEpisode")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericTVEpisode;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tvSeason")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericTVSeason;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tvShow")) & 1) != 0)
  {
    v5 = MPModelRelationshipGenericTVShow;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("movie")))
    {
      v6 = 0;
      goto LABEL_8;
    }
    v5 = MPModelRelationshipGenericMovie;
  }
  v6 = *v5;
LABEL_8:
  +[MPServerObjectDatabaseEntityType entityTypeWithServerEntityType:genericObjectRelationshipKey:](MPServerObjectDatabaseEntityType, "entityTypeWithServerEntityType:genericObjectRelationshipKey:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v7;
}

uint64_t __82__MPServerObjectDatabaseStorePlatformImportRequest__unsupportedStorePlatformKinds__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)_unsupportedStorePlatformKinds_unsupportedKinds;
  _unsupportedStorePlatformKinds_unsupportedKinds = (uint64_t)v0;

  objc_msgSend((id)_unsupportedStorePlatformKinds_unsupportedKinds, "addObject:", CFSTR("activity"));
  objc_msgSend((id)_unsupportedStorePlatformKinds_unsupportedKinds, "addObject:", CFSTR("radioStation"));
  objc_msgSend((id)_unsupportedStorePlatformKinds_unsupportedKinds, "addObject:", CFSTR("editorial"));
  objc_msgSend((id)_unsupportedStorePlatformKinds_unsupportedKinds, "addObject:", CFSTR("streaming"));
  objc_msgSend((id)_unsupportedStorePlatformKinds_unsupportedKinds, "addObject:", CFSTR("user"));
  objc_msgSend((id)_unsupportedStorePlatformKinds_unsupportedKinds, "addObject:", CFSTR("artistOnly"));
  objc_msgSend((id)_unsupportedStorePlatformKinds_unsupportedKinds, "addObject:", CFSTR("iTunesBrand"));
  return objc_msgSend((id)_unsupportedStorePlatformKinds_unsupportedKinds, "addObject:", CFSTR("showBrand"));
}

void __88__MPServerObjectDatabaseStorePlatformImportRequest__unsupportedParentChildRelationships__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)_unsupportedParentChildRelationships_unsupportedParentChildRelationships_312;
  _unsupportedParentChildRelationships_unsupportedParentChildRelationships_312 = (uint64_t)v0;

}

@end
