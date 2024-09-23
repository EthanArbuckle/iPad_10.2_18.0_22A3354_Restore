@implementation MPLibraryObjectDatabase

- (MPLibraryObjectDatabase)initWithLibrary:(id)a3
{
  id v5;
  MPLibraryObjectDatabase *v6;
  MPLibraryObjectDatabase *v7;
  uint64_t v8;
  MSVSQLDatabase *msvDatabase;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPLibraryObjectDatabase;
  v6 = -[MPLibraryObjectDatabase init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_library, a3);
    objc_msgSend(v5, "msvDatabase");
    v8 = objc_claimAutoreleasedReturnValue();
    msvDatabase = v7->_msvDatabase;
    v7->_msvDatabase = (MSVSQLDatabase *)v8;

  }
  return v7;
}

- (id)identifiersMatchingIdentifierSet:(id)a3 propertySet:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__11546;
  v13 = __Block_byref_object_dispose__11547;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__MPLibraryObjectDatabase_identifiersMatchingIdentifierSet_propertySet_options_error___block_invoke;
  v8[3] = &unk_1E3155100;
  v8[4] = self;
  v8[5] = &v9;
  -[MPLibraryObjectDatabase _enumerateRequestsForSupportedTypesWithPropertySet:identifiers:block:](self, "_enumerateRequestsForSupportedTypesWithPropertySet:identifiers:block:", a4, a3, v8, a6);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)modelObjectMatchingIdentifierSet:(id)a3 propertySet:(id)a4 error:(id *)a5
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11546;
  v12 = __Block_byref_object_dispose__11547;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__MPLibraryObjectDatabase_modelObjectMatchingIdentifierSet_propertySet_error___block_invoke;
  v7[3] = &unk_1E3155100;
  v7[4] = self;
  v7[5] = &v8;
  -[MPLibraryObjectDatabase _enumerateRequestsForSupportedTypesWithPropertySet:identifiers:block:](self, "_enumerateRequestsForSupportedTypesWithPropertySet:identifiers:block:", a4, a3, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)tokenForIdentifiers:(id)a3 propertySet:(id)a4 options:(unint64_t)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18[0] = CFSTR("MPModelRelationshipGenericSong");
  v18[1] = CFSTR("MPModelRelationshipGenericAlbum");
  v18[2] = CFSTR("MPModelRelationshipGenericPlaylist");
  v18[3] = CFSTR("MPModelRelationshipGenericTVEpisode");
  v18[4] = CFSTR("MPModelRelationshipGenericMovie");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v7);
      -[MPLibraryObjectDatabase _lookupDeviceIdentifiersForIdentifiers:asRelationship:]((uint64_t)self, v6, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (id)identifiersForTokens:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  unint64_t i;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  MPLibraryObjectDatabase *v27;
  id v28;
  id v29;
  SEL v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v22 = a3;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, objc_msgSend(v22, "count"));
  objc_msgSend(MEMORY[0x1E0D4D060], "dictionaryWithDefaultValue:", &__block_literal_global_10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2;
  v31[3] = &unk_1E3155148;
  v8 = v5;
  v32 = v8;
  v9 = v21;
  v33 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v31);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v6, "count"); ++i)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_3;
  v25[3] = &unk_1E31551C0;
  v13 = v6;
  v26 = v13;
  v27 = self;
  v14 = v9;
  v28 = v14;
  v15 = v10;
  v29 = v15;
  v30 = a2;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v25);
  objc_msgSend(v15, "indexesOfObjectsPassingTest:", &__block_literal_global_34_11527);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2_35;
  v23[3] = &unk_1E315DBB0;
  v17 = v15;
  v24 = v17;
  objc_msgSend(v16, "enumerateIndexesUsingBlock:", v23);
  v18 = v24;
  v19 = v17;

  return v19;
}

- (void)_enumerateRequestsForSupportedTypesWithPropertySet:(id)a3 identifiers:(id)a4 block:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  MPModelLibraryRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void (**v25)(id, MPModelLibraryRequest *, _BYTE *);
  id obj;
  id v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];
  _QWORD v36[8];

  v36[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v28 = a4;
  v25 = (void (**)(id, MPModelLibraryRequest *, _BYTE *))a5;
  v36[0] = CFSTR("MPModelRelationshipGenericSong");
  v36[1] = CFSTR("MPModelRelationshipGenericAlbum");
  v36[2] = CFSTR("MPModelRelationshipGenericPlaylist");
  v36[3] = CFSTR("MPModelRelationshipGenericTVEpisode");
  v36[4] = CFSTR("MPModelRelationshipGenericMovie");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 5);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v7, "relationships");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (!v14)
        {
          +[MPLibraryObjectDatabase relationshipKinds]();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[MPLibraryObjectDatabase _lookupDeviceIdentifiersForIdentifiers:asRelationship:]((uint64_t)self, v28, v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = objc_alloc_init(MPModelLibraryRequest);
              v19 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v28, "humanDescription");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "stringWithFormat:", CFSTR("MPLibraryObjectRequest: %@: %@"), v11, v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPModelRequest setLabel:](v18, "setLabel:", v21);

              -[MPModelRequest setItemKind:](v18, "setItemKind:", v16);
              objc_msgSend(v7, "relationships");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", v11);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPModelRequest setItemProperties:](v18, "setItemProperties:", v23);

              v34 = v17;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
              v24 = objc_claimAutoreleasedReturnValue();
              -[MPModelLibraryRequest setAllowedItemIdentifiers:](v18, "setAllowedItemIdentifiers:", v24);

              -[MPModelLibraryRequest setSortUsingAllowedItemIdentifiers:](v18, "setSortUsingAllowedItemIdentifiers:", 1);
              v29 = 0;
              v25[2](v25, v18, &v29);
              LOBYTE(v24) = v29 == 0;

              if ((v24 & 1) == 0)
              {

                goto LABEL_15;
              }
            }

          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

}

- (MPMediaLibrary)library
{
  return self->_library;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryView, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_msvDatabase, 0);
}

+ (id)relationshipKinds
{
  objc_opt_self();
  if (+[MPLibraryObjectDatabase relationshipKinds]::onceToken != -1)
    dispatch_once(&+[MPLibraryObjectDatabase relationshipKinds]::onceToken, &__block_literal_global_11518);
  return (id)+[MPLibraryObjectDatabase relationshipKinds]::__relationshipKinds;
}

- (MPIdentifierSet)_lookupDeviceIdentifiersForIdentifiers:(void *)a3 asRelationship:
{
  void *v3;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  MPIdentifierSet *v17;
  void *v18;
  void *v19;
  void *v20;
  MPIdentifierSet *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  __CFString *v31;
  int v32;
  __CFString *v33;
  __CFString *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  unint64_t v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  MPIdentifierSet *v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  _QWORD v86[6];
  _QWORD v87[5];
  id v88;
  uint8_t v89[4];
  void *v90;
  __int16 v91;
  uint64_t v92;
  __int128 buf;
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[3];
  uint64_t v97;
  _QWORD v98[4];
  _QWORD v99[5];

  v99[3] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v84 = a3;
  v85 = v6;
  if (!a1)
  {
    v21 = 0;
    goto LABEL_77;
  }
  objc_msgSend(v6, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "databaseID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 16), "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v9;
  if (v10 == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = objc_msgSend(v10, "isEqual:", v11);

    if ((v13 & 1) == 0)
    {
      +[MPLibraryObjectDatabase relationshipKinds]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v84);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "opaqueID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v83 = v15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v83 = (id)objc_claimAutoreleasedReturnValue();
      }

      v99[0] = CFSTR("MPModelRelationshipGenericSong");
      v99[1] = CFSTR("MPModelRelationshipGenericTVEpisode");
      v99[2] = CFSTR("MPModelRelationshipGenericMovie");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "containsObject:", v84);

      if (v23)
      {
        objc_msgSend(v6, "universalStore");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v24, "purchasedAdamID");
        if (!v81)
        {
          objc_msgSend(v6, "universalStore");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v25, "adamID");

        }
        objc_msgSend(v6, "universalStore");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "subscriptionAdamID");
        if (!v27)
        {
          objc_msgSend(v6, "universalStore");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v28, "adamID");

        }
        if (v81)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
          v29 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = (uint64_t)v83;
        }
        v98[0] = v29;
        v80 = (void *)v29;
        if (v27)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v27);
          v39 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v39 = (uint64_t)v83;
        }
        v98[1] = v39;
        v79 = (void *)v39;
        objc_msgSend(v85, "personalizedStore");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "cloudID");
        if (v41)
        {
          v42 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v85, "personalizedStore");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "numberWithUnsignedLongLong:", objc_msgSend(v3, "cloudID"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v43 = v83;
        }
        v98[2] = v43;
        objc_msgSend(v85, "universalStore");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "universalCloudLibraryID");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v45;
        v47 = (uint64_t)v83;
        if (v45)
          v47 = v45;
        v98[3] = v47;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {

        }
        if (v27)

        v48 = CFSTR("SELECT item_pid FROM item_store WHERE store_item_id = ? OR subscription_store_item_id = ? OR store_saga_id = ? OR cloud_universal_library_id = ?");
        if (!v81)
        {
LABEL_56:
          if (objc_msgSend(v36, "count"))
          {
            v63 = os_log_create("com.apple.amp.mediaplayer", "Playback");
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = 138543362;
              *(_QWORD *)((char *)&buf + 4) = v85;
              _os_log_impl(&dword_193B9B000, v63, OS_LOG_TYPE_DEBUG, "XDLib: _lookupDeviceIdentifiersForIdentifiers: %{public}@ [start]", (uint8_t *)&buf, 0xCu);
            }

            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v94 = 0x2020000000;
            v95 = 0;
            objc_msgSend(*(id *)(a1 + 8), "statementWithString:error:", v48, 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = 0;
            while (v65 < objc_msgSend(v36, "count"))
            {
              objc_msgSend(v36, "objectAtIndexedSubscript:", v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = v66 == v67;

              if (v68)
              {
                objc_msgSend(v64, "bindNullValueToParameterAtIndex:", ++v65);
              }
              else if (_NSIsNSString())
              {
                objc_msgSend(v64, "bindStringValue:toParameterAtIndex:", v66, ++v65);
              }
              else if (_NSIsNSNumber())
              {
                objc_msgSend(v64, "bindInt64Value:toParameterAtIndex:", objc_msgSend(v66, "longLongValue"), ++v65);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", sel__lookupDeviceIdentifiersForIdentifiers_asRelationship_, a1, CFSTR("MPLibraryObjectDatabase.mm"), 253, CFSTR("Unexpected param type: %@"), objc_opt_class());

                ++v65;
              }

            }
            objc_msgSend(*(id *)(a1 + 8), "resultsForStatement:", v64);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "nextObject");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v71, "int64ValueAtColumnIndex:", 0);
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v72;
            objc_msgSend(v64, "invalidate");
            v73 = os_log_create("com.apple.amp.mediaplayer", "Playback");
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
            {
              v74 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
              *(_DWORD *)v89 = 138543618;
              v90 = v85;
              v91 = 2048;
              v92 = v74;
              _os_log_impl(&dword_193B9B000, v73, OS_LOG_TYPE_DEBUG, "XDLib: _lookupDeviceIdentifiersForIdentifiers: %{public}@ [ended] %lld", v89, 0x16u);
            }

            if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 24))
            {
              v75 = [MPIdentifierSet alloc];
              objc_msgSend(*(id *)(a1 + 16), "uniqueIdentifier");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(CFSTR("Library-MSV-"), "stringByAppendingString:", v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v86[0] = MEMORY[0x1E0C809B0];
              v86[1] = 3221225472;
              v86[2] = __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_55;
              v86[3] = &unk_1E315B218;
              v86[4] = a1;
              v86[5] = &buf;
              v21 = -[MPIdentifierSet initWithSource:modelKind:block:](v75, "initWithSource:modelKind:block:", v77, v82, v86);

            }
            else
            {
              v21 = 0;
            }

            _Block_object_dispose(&buf, 8);
            goto LABEL_76;
          }
LABEL_73:
          v21 = 0;
LABEL_76:

          goto LABEL_77;
        }
LABEL_55:

        goto LABEL_56;
      }
      v30 = (__CFString *)v84;
      v31 = CFSTR("MPModelRelationshipGenericAlbum");
      if (v30 == CFSTR("MPModelRelationshipGenericAlbum"))
      {

      }
      else
      {
        v32 = -[__CFString isEqual:](v30, "isEqual:", CFSTR("MPModelRelationshipGenericAlbum"));

        if (!v32)
        {
          v33 = v30;
          v34 = CFSTR("MPModelRelationshipGenericPlaylist");
          if (v33 == CFSTR("MPModelRelationshipGenericPlaylist"))
          {

          }
          else
          {
            v35 = -[__CFString isEqual:](v33, "isEqual:", CFSTR("MPModelRelationshipGenericPlaylist"));

            if (!v35)
            {
              v36 = 0;
              goto LABEL_73;
            }
          }
          objc_msgSend(v6, "personalizedStore");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v80, "cloudID");
          if (v52)
          {
            v53 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v6, "personalizedStore");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "numberWithUnsignedLongLong:", objc_msgSend(v3, "cloudID"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v54 = v83;
          }
          v96[0] = v54;
          objc_msgSend(v6, "universalStore");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "globalPlaylistID");
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = (void *)v56;
          v58 = (uint64_t)v83;
          if (v56)
            v58 = v56;
          v96[1] = v58;
          objc_msgSend(v6, "universalStore");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "universalCloudLibraryID");
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = (void *)v60;
          v62 = (uint64_t)v83;
          if (v60)
            v62 = v60;
          v96[2] = v62;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 3);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v52)
          {

          }
          v48 = CFSTR("SELECT container_pid FROM container WHERE store_cloud_id = ? OR cloud_global_id = ? OR cloud_universal_library_id = ?");
          goto LABEL_55;
        }
      }
      objc_msgSend(v6, "universalStore");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "subscriptionAdamID");
      if (v38)
      {

      }
      else
      {
        objc_msgSend(v6, "universalStore");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v49, "adamID");

        if (!v38)
        {
          v51 = 1;
          v50 = (uint64_t)v83;
LABEL_41:
          v80 = (void *)v50;
          v97 = v50;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = CFSTR("SELECT album_pid FROM item JOIN item_store USING (item_pid) WHERE store_playlist_id = ?");
          if ((v51 & 1) != 0)
            goto LABEL_56;
          goto LABEL_55;
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v38);
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = 0;
      goto LABEL_41;
    }
  }
  v17 = [MPIdentifierSet alloc];
  objc_msgSend(*(id *)(a1 + 16), "uniqueIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Library-FastPath"), "stringByAppendingString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelKind");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke;
  v87[3] = &unk_1E3162A70;
  v87[4] = a1;
  v88 = v6;
  v21 = -[MPIdentifierSet initWithSource:modelKind:block:](v17, "initWithSource:modelKind:block:", v19, v20, v87);

LABEL_77:
  return v21;
}

void __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_2;
  v5[3] = &unk_1E3162B80;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v3, v5);

}

void __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_55(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_2_56;
  v5[3] = &unk_1E315B1F0;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v3, v5);

}

uint64_t __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_2_56(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistentID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void __81__MPLibraryObjectDatabase__lookupDeviceIdentifiersForIdentifiers_asRelationship___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "library");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPersistentID:", objc_msgSend(v3, "persistentID"));

  objc_msgSend(*(id *)(a1 + 32), "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContainedPersistentID:", objc_msgSend(v4, "containedPersistentID"));

  objc_msgSend(*(id *)(a1 + 32), "library");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSyncID:", objc_msgSend(v5, "syncID"));

}

void __44__MPLibraryObjectDatabase_relationshipKinds__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[MPModelSong kindWithVariants:options:](MPModelSong, "kindWithVariants:options:", 7, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelAlbum kindWithSongKind:](MPModelAlbum, "kindWithSongKind:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[MPModelPlaylist kindWithPlaylistEntryKind:options:](MPModelPlaylist, "kindWithPlaylistEntryKind:options:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("MPModelRelationshipGenericSong");
  v7[1] = CFSTR("MPModelRelationshipGenericAlbum");
  v8[0] = v0;
  v8[1] = v1;
  v7[2] = CFSTR("MPModelRelationshipGenericPlaylist");
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)+[MPLibraryObjectDatabase relationshipKinds]::__relationshipKinds;
  +[MPLibraryObjectDatabase relationshipKinds]::__relationshipKinds = v5;

}

void __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSMapTable *v9;
  void *v10;
  void *v11;
  const void *v12;
  NSMapTable *v13;
  void *v14;
  id v15;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v15 = v5;
  objc_msgSend(v5, "modelKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIndex:", a3);

  v9 = *(NSMapTable **)(a1 + 40);
  objc_msgSend(v15, "library");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSMapGet(v9, (const void *)objc_msgSend(v10, "persistentID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v12 = (const void *)objc_claimAutoreleasedReturnValue();
    v13 = *(NSMapTable **)(a1 + 40);
    objc_msgSend(v15, "library");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSMapInsert(v13, (const void *)objc_msgSend(v14, "persistentID"), v12);

    v11 = (void *)v12;
  }
  objc_msgSend(v11, "addIndex:", a3);

}

void __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  MPMediaLibraryEntityTranslationContext *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MPMediaLibraryView *v15;
  void *v16;
  void *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  id v20;
  MPMediaLibraryEntityTranslationContext *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  MPMediaLibraryEntityTranslationContext *v34;
  id v35;
  id v36;
  _BYTE *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  _BYTE buf[24];
  char v43;
  uint8_t v44[4];
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v31 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectsAtIndexes:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "msv_compactDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "XDLib: identifiersForTokens: [start] %{public}@ %{public}@", buf, 0x16u);

  }
  v9 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v9, "setMediaLibrary:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  -[MPMediaLibraryEntityTranslationContext setModelKind:](v9, "setModelKind:", v5);
  -[MPMediaLibraryEntityTranslationContext setAllowedEntityIdentifiers:](v9, "setAllowedEntityIdentifiers:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "userIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaLibraryEntityTranslationContext setPersonID:](v9, "setPersonID:", v11);

  -[MPMediaLibraryEntityTranslationContext setSortUsingAllowedEntityIdentifiers:](v9, "setSortUsingAllowedEntityIdentifiers:", 1);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "modelKind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v13, "modelClass"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 4);
  +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v14, "entityQueryForPropertySet:sortDescriptors:context:view:", v16, MEMORY[0x1E0C9AA60], v9, v15);
  }
  else
  {
    v40 = 0;
    v41 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v43 = 0;
  v38 = v40;
  v39 = v41;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
  }
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_19;
  v32[3] = &unk_1E3155198;
  v20 = v14;
  v33 = v20;
  v21 = v9;
  v34 = v21;
  v35 = *(id *)(a1 + 48);
  v36 = *(id *)(a1 + 56);
  v37 = buf;
  -[MPMediaLibraryView performCoreQuery:withCompletion:](v15, "performCoreQuery:withCompletion:", &v38, v32);
  v22 = v39;
  if (v39)
  {
    v23 = (unint64_t *)&v39->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("MPLibraryObjectDatabase.mm"), 172, CFSTR("MLCore library queries should be guaranteed no-escape"));

  }
  v25 = os_log_create("com.apple.amp.mediaplayer", "Playback");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v17, "msv_compactDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v44 = 138543618;
    v45 = v5;
    v46 = 2114;
    v47 = v26;
    _os_log_impl(&dword_193B9B000, v25, OS_LOG_TYPE_DEBUG, "XDLib: identifiersForTokens: [ended] %{public}@ %{public}@", v44, 0x16u);

  }
  _Block_object_dispose(buf, 8);

  v27 = v41;
  if (v41)
  {
    v28 = (unint64_t *)&v41->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

}

void __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2_35(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replaceObjectAtIndex:withObject:", a2);

}

BOOL __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_32(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _BOOL8 v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3 == v2;

  return v4;
}

void __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  mlcore::EntityQueryResult *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  unint64_t i;
  _QWORD *v11;
  void *v12;
  NSMapTable *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t *v17;
  unint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  mlcore::EntityQueryResult *v23;
  std::__shared_weak_count *v24;

  v19 = a3;
  if (!v19)
  {
    v5 = *(mlcore::EntityQueryResult **)a2;
    if (*(_QWORD *)a2)
    {
      v6 = *(std::__shared_weak_count **)(a2 + 8);
      v23 = *(mlcore::EntityQueryResult **)a2;
      v24 = v6;
      if (v6)
      {
        p_shared_owners = (unint64_t *)&v6->__shared_owners_;
        do
          v8 = __ldxr(p_shared_owners);
        while (__stxr(v8 + 1, p_shared_owners));
      }
      v9 = 0;
      for (i = 0; i < mlcore::EntityQueryResult::entityCount(v5); ++i)
      {
        v11 = (_QWORD *)mlcore::EntityQueryResult::propertyCaches(v5);
        if (0x84BDA12F684BDA13 * ((uint64_t)(v11[1] - *v11) >> 3) <= i)
          std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
        objc_msgSend(*(id *)(a1 + 32), "identifiersForPropertyCache:context:", *v11 + v9, *(_QWORD *)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(NSMapTable **)(a1 + 48);
        objc_msgSend(v12, "library");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NSMapGet(v13, (const void *)objc_msgSend(v14, "persistentID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2_20;
        v20[3] = &unk_1E3155170;
        v21 = *(id *)(a1 + 56);
        v16 = v12;
        v22 = v16;
        objc_msgSend(v15, "enumerateIndexesUsingBlock:", v20);

        v9 += 216;
      }
      if (v6)
      {
        v17 = (unint64_t *)&v6->__shared_owners_;
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
          std::__shared_weak_count::__release_weak(v6);
        }
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

}

uint64_t __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke_2_20(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", a2, *(_QWORD *)(a1 + 40));
}

id __48__MPLibraryObjectDatabase_identifiersForTokens___block_invoke()
{
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __78__MPLibraryObjectDatabase_modelObjectMatchingIdentifierSet_propertySet_error___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5;
  uint64_t v6;
  MPMediaLibraryEntityTranslationContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MPMediaLibraryView *v14;
  void *v15;
  void *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  id v19;
  MPMediaLibraryEntityTranslationContext *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  MPMediaLibraryEntityTranslationContext *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  std::__shared_weak_count *v50;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v30 = v5;
  if (v6)
  {
    v7 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
    -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v7, "setMediaLibrary:", *(_QWORD *)(v6 + 16));
    objc_msgSend(v30, "itemKind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setModelKind:](v7, "setModelKind:", v8);

    objc_msgSend(v30, "allowedItemIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setAllowedEntityIdentifiers:](v7, "setAllowedEntityIdentifiers:", v9);

    objc_msgSend(*(id *)(v6 + 16), "userIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setPersonID:](v7, "setPersonID:", v11);

    objc_msgSend(v30, "itemKind");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v12, "modelClass"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", *(_QWORD *)(v6 + 16), 4);
    objc_msgSend(v30, "itemProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allowedItemIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v13, "propertiesQueryForPropertySet:scopedContainers:allowedItemIdentifiers:view:", v15, MEMORY[0x1E0C9AA60], v16, v14);
    }
    else
    {
      v49 = 0;
      v50 = 0;
    }

    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__11546;
    v35 = __Block_byref_object_dispose__11547;
    v36 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    v43 = v49;
    v44 = v50;
    if (v50)
    {
      p_shared_owners = (unint64_t *)&v50->__shared_owners_;
      do
        v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __45__MPLibraryObjectDatabase__runObjectRequest___block_invoke;
    v37[3] = &unk_1E3155250;
    v19 = v13;
    v38 = v19;
    v41 = &v31;
    v39 = v30;
    v20 = v7;
    v40 = v20;
    v42 = &v45;
    -[MPMediaLibraryView performCoreQuery:withCompletion:](v14, "performCoreQuery:withCompletion:", &v43, v37);
    v21 = v44;
    if (v44)
    {
      v22 = (unint64_t *)&v44->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    if (!*((_BYTE *)v46 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__runObjectRequest_, v6, CFSTR("MPLibraryObjectDatabase.mm"), 368, CFSTR("MLCore library queries should be guaranteed no-escape"));

    }
    +[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v32[5]);
    v6 = objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v31, 8);

    v24 = v50;
    if (v50)
    {
      v25 = (unint64_t *)&v50->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }

  }
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v6;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

void __45__MPLibraryObjectDatabase__runObjectRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  mlcore::PropertiesQueryResult *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t *v23;
  unint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  mlcore::PropertiesQueryResult *v28;
  std::__shared_weak_count *v29;
  char **v30;
  char v31;

  v5 = a3;
  if (!v5)
  {
    v6 = *(mlcore::PropertiesQueryResult **)a2;
    if (*(_QWORD *)a2)
    {
      v7 = *(std::__shared_weak_count **)(a2 + 8);
      v28 = v6;
      v29 = v7;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
      }
      v10 = (uint64_t *)mlcore::PropertiesQueryResult::allResults(v6);
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v11 = *v10;
      v12 = v10[1];
      v30 = &v25;
      v31 = 0;
      if (v12 != v11)
      {
        v13 = 0x84BDA12F684BDA13 * ((v12 - v11) >> 3);
        if (v13 >= 0x12F684BDA12F685)
          std::vector<mlcore::ModelPropertyBase *>::__throw_length_error[abi:ne180100]();
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<mlcore::PropertyCache>>(v13);
        v15 = 0;
        v25 = v14;
        v26 = v14;
        v27 = &v14[216 * v16];
        do
        {
          mlcore::PropertyCache::PropertyCache();
          v15 += 216;
        }
        while (v11 + v15 != v12);
        v26 = &v14[v15];
        if (&v14[v15] != v25)
        {
          v17 = objc_msgSend(*(id *)(a1 + 32), "entityClass");
          v18 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "itemProperties");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26 == v25)
            std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
          objc_msgSend(v18, "objectForPropertySet:entityClass:propertyCache:context:", v19, v17);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v22 = *(void **)(v21 + 40);
          *(_QWORD *)(v21 + 40) = v20;

        }
      }
      v30 = &v25;
      std::vector<mlcore::PropertyCache>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
      if (v7)
      {
        v23 = (unint64_t *)&v7->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

}

void __86__MPLibraryObjectDatabase_identifiersMatchingIdentifierSet_propertySet_options_error___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  MPMediaLibraryEntityTranslationContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MPMediaLibraryView *v17;
  void *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  id v21;
  MPMediaLibraryEntityTranslationContext *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  uint8_t v50[4];
  uint64_t v51;
  __int128 buf;
  void (*v53)(uint64_t, uint64_t, void *);
  void *v54;
  id v55;
  MPMediaLibraryEntityTranslationContext *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v35 = v5;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v35, "allowedItemIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "msv_compactDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_193B9B000, v7, OS_LOG_TYPE_DEBUG, "XDLib: _runIdentifiersRequest: [start] %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v10 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
    -[MPMediaLibraryEntityTranslationContext setMediaLibrary:](v10, "setMediaLibrary:", *(_QWORD *)(v6 + 16));
    objc_msgSend(v35, "itemKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setModelKind:](v10, "setModelKind:", v11);

    objc_msgSend(v35, "allowedItemIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setAllowedEntityIdentifiers:](v10, "setAllowedEntityIdentifiers:", v12);

    objc_msgSend(*(id *)(v6 + 16), "userIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPMediaLibraryEntityTranslationContext setPersonID:](v10, "setPersonID:", v14);

    -[MPMediaLibraryEntityTranslationContext setSortUsingAllowedEntityIdentifiers:](v10, "setSortUsingAllowedEntityIdentifiers:", 1);
    objc_msgSend(v35, "itemKind");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPMediaLibraryEntityTranslator translatorForMPModelClass:](MPMediaLibraryEntityTranslator, "translatorForMPModelClass:", objc_msgSend(v15, "modelClass"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[MPMediaLibraryView initWithLibrary:filteringOptions:]([MPMediaLibraryView alloc], "initWithLibrary:filteringOptions:", *(_QWORD *)(v6 + 16), 4);
    +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v16, "entityQueryForPropertySet:sortDescriptors:context:view:", v18, MEMORY[0x1E0C9AA60], v10, v17);
    }
    else
    {
      v48 = 0;
      v49 = 0;
    }

    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__11546;
    v40 = __Block_byref_object_dispose__11547;
    v41 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v42 = v48;
    v43 = v49;
    if (v49)
    {
      p_shared_owners = (unint64_t *)&v49->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
    }
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v53 = __50__MPLibraryObjectDatabase__runIdentifiersRequest___block_invoke;
    v54 = &unk_1E3155228;
    v57 = &v36;
    v21 = v16;
    v55 = v21;
    v22 = v10;
    v56 = v22;
    v58 = &v44;
    -[MPMediaLibraryView performCoreQuery:withCompletion:](v17, "performCoreQuery:withCompletion:", &v42, &buf);
    v23 = v43;
    if (v43)
    {
      v24 = (unint64_t *)&v43->__shared_owners_;
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    if (!*((_BYTE *)v45 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel__runIdentifiersRequest_, v6, CFSTR("MPLibraryObjectDatabase.mm"), 336, CFSTR("MLCore library queries should be guaranteed no-escape"));

    }
    v26 = os_log_create("com.apple.amp.mediaplayer", "Playback");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = v37[5];
      *(_DWORD *)v50 = 138543362;
      v51 = v27;
      _os_log_impl(&dword_193B9B000, v26, OS_LOG_TYPE_DEBUG, "XDLib: _runIdentifiersRequest: [ended] %{public}@", v50, 0xCu);
    }

    v28 = (id)v37[5];
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v36, 8);

    v29 = v49;
    if (v49)
    {
      v30 = (unint64_t *)&v49->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }

  }
  else
  {
    v28 = 0;
  }

  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v33 = *(void **)(v32 + 40);
  *(_QWORD *)(v32 + 40) = v28;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

void __50__MPLibraryObjectDatabase__runIdentifiersRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  mlcore::EntityQueryResult *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v18[5];
  void **v19;

  v5 = a3;
  if (!v5)
  {
    v6 = *(mlcore::EntityQueryResult **)a2;
    if (*(_QWORD *)a2)
    {
      v7 = *(std::__shared_weak_count **)(a2 + 8);
      v18[3] = v6;
      v18[4] = v7;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
      }
      mlcore::EntityQueryResult::allEntities(v6);
      v11 = v18[0];
      v10 = v18[1];
      v19 = (void **)v18;
      std::vector<std::shared_ptr<mlcore::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v19);
      if (v10 != v11)
      {
        v12 = (_QWORD *)mlcore::EntityQueryResult::propertyCaches(v6);
        if (v12[1] == *v12)
          std::vector<mlcore::PropertyCache>::__throw_out_of_range[abi:ne180100]();
        objc_msgSend(*(id *)(a1 + 32), "identifiersForPropertyCache:context:");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

      }
      if (v7)
      {
        v16 = (unint64_t *)&v7->__shared_owners_;
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

}

@end
