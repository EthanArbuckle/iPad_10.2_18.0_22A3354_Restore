@implementation MPStoreModelPlaylistBuilder

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  objc_msgSend(v5, "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adamID");

  if (!v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10;
    v6[3] = &unk_1E3163A30;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

  }
}

MPArtworkCatalog *__95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  MPArtworkCatalog *v3;
  void *v4;
  MPArtworkCatalog *v5;

  objc_msgSend(*(id *)(a1 + 32), "artworkRequestToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "setCropStyle:", *MEMORY[0x1E0DDBDC0]);
    v3 = [MPArtworkCatalog alloc];
    +[MPStoreArtworkDataSource sharedStoreArtworkDataSource](MPStoreArtworkDataSource, "sharedStoreArtworkDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MPArtworkCatalog initWithToken:dataSource:](v3, "initWithToken:dataSource:", v2, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  int v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  MPIdentifierSet *v42;
  id v43;
  MPModelCurator *v44;
  MPModelCurator *v45;
  MPIdentifierSet *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, void *);
  void *v50;
  uint64_t v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 2) != 0
    && (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistName")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistTrackCount")) & 1) == 0)
  {
    objc_msgSend(v4, "setTrackCount:", objc_msgSend(*(id *)(a1 + 40), "trackCount"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistEditorNotes")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "editorNotes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEditorNotes:", v6);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistShortEditorNotes")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "shortEditorNotes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShortEditorNotes:", v7);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistDescriptionText")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "editorNotes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v4, "setDescriptionText:", v8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "descriptionText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDescriptionText:", v9);

    }
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistCloudVersionHash")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "versionHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCloudVersionHash:", v10);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistVersionHash")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "versionHash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVersionHash:", v11);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistReleaseDateComponents")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "releaseDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[MPStoreItemMetadata storeServerCalendar](MPStoreItemMetadata, "storeServerCalendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "components:fromDate:", 28, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setReleaseDateComponents:", v14);

    }
    else
    {
      objc_msgSend(v4, "setReleaseDateComponents:", 0);
    }

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistLastModifiedDateComponents")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "lastModifiedDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      +[MPStoreItemMetadata storeServerCalendar](MPStoreItemMetadata, "storeServerCalendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "components:fromDate:", 3145980, v15);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v4, "setLastModifiedDateComponents:", v17);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistTraits")) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "supportsSing"))
      v18 = 256;
    else
      v18 = 0;
    objc_msgSend(*(id *)(a1 + 40), "audioTraits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "containsObject:", CFSTR("spatial")))
      v18 |= 8uLL;
    if (objc_msgSend(v19, "containsObject:", CFSTR("atmos")))
      v18 |= 0x10uLL;
    if (objc_msgSend(v19, "containsObject:", CFSTR("surround")))
      v20 = v18 | 0x20;
    else
      v20 = v18;
    objc_msgSend(v4, "setTraits:", v20);

  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if ((v21 & 0xC00) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "childStoreItemMetadatas");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (v24)
      {
        v25 = v24;
        v26 = 0;
        v27 = 0;
        v28 = *(_QWORD *)v62;
        while (2)
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v62 != v28)
              objc_enumerationMutation(v23);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "isExplicitContent"))
              v26 = 1;
            else
              v27 = 1;
            if ((v26 & 1) != 0 || (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 8) == 0)
            {
              if ((v27 & 1) != 0)
                goto LABEL_72;
              if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 4) == 0)
              {
                v27 = 0;
LABEL_72:

                v30 = v26 & 1;
                v31 = v27 != 0;
                goto LABEL_73;
              }
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
          if (v25)
            continue;
          break;
        }
      }
      else
      {
        v26 = 0;
        LOBYTE(v27) = 0;
      }

      v30 = v26 & 1;
      v31 = v27 & 1;
    }
    else
    {
      v30 = objc_msgSend(*(id *)(a1 + 40), "isExplicitContent");
      v31 = v30 ^ 1;
    }
LABEL_73:
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 8) != 0
      && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistHasExplicitContent")) & 1) == 0)
    {
      objc_msgSend(v4, "setHasExplicitContent:", v30);
    }
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 4) != 0
      && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistHasCleanContent")) & 1) == 0)
    {
      objc_msgSend(v4, "setHasCleanContent:", v31);
    }

    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  }
  if ((v21 & 0x1000) != 0 && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistType")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "playlistType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "isEqualToString:", CFSTR("editorial")))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isChart"))
        v33 = 8;
      else
        v33 = 4;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("external")) & 1) != 0)
    {
      v33 = 5;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("user-shared")) & 1) != 0)
    {
      v33 = 6;
    }
    else if (objc_msgSend(v32, "isEqualToString:", CFSTR("personal-mix")))
    {
      v33 = 7;
    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(v4, "setType:", v33);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistLibraryAdded")) & 1) == 0)
  {
    objc_msgSend(v4, "setLibraryAdded:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistKeepLocalEnableState")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalEnableState:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatus")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalManagedStatus:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatusReason")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalManagedStatusReason:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistKeepLocalConstraints")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalConstraints:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistIsOwner")) & 1) == 0)
  {
    objc_msgSend(v4, "setOwner:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistCuratorPlaylist")) & 1) == 0)
  {
    objc_msgSend(v4, "setCuratorPlaylist:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistPublicPlaylist")) & 1) == 0)
  {
    objc_msgSend(v4, "setPublicPlaylist:", 1);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistVisiblePlaylist")) & 1) == 0)
  {
    objc_msgSend(v4, "setVisiblePlaylist:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistSubscribed")) & 1) == 0)
  {
    objc_msgSend(v4, "setSubscribed:", 1);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistUserEditableComponents")) & 1) == 0)
  {
    objc_msgSend(v4, "setUserEditableComponents:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistShareURL")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "URL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShareURL:", v34);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistShareShortURL")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "shortURL");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShareShortURL:", v35);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistIsFavorite")) & 1) == 0)
  {
    objc_msgSend(v4, "setIsFavorite:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistIsFavoriteSongsPlaylist")) & 1) == 0)
  {
    objc_msgSend(v4, "setIsFavoriteSongsPlaylist:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistIsDisliked")) & 1) == 0)
  {
    objc_msgSend(v4, "setIsDisliked:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistDateFavorited")) & 1) == 0)
  {
    objc_msgSend(v4, "setDateFavorited:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistArtwork")) & 1) == 0)
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v59[3] = &unk_1E31553F0;
    v60 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setArtworkCatalogBlock:", v59);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistEditorialArtwork")) & 1) == 0)
  {
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v57[3] = &unk_1E31553F0;
    v58 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setEditorialArtworkCatalogBlock:", v57);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistTracksTiledArtwork")) & 1) == 0)
  {
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7;
    v55[3] = &unk_1E3160188;
    v56 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setTiledArtworkCatalogBlock:", v55);

  }
  v36 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v36 + 32) & 1) != 0)
  {
    v37 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9;
    v53[3] = &unk_1E3163A58;
    v54 = *(id *)(a1 + 40);
    v38 = (void *)MEMORY[0x19403A810](v53);
    v47 = v37;
    v48 = 3221225472;
    v49 = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_11;
    v50 = &unk_1E315C2D0;
    v39 = *(void **)(a1 + 40);
    v51 = *(_QWORD *)(a1 + 32);
    v52 = v39;
    v40 = (void *)MEMORY[0x19403A810](&v47);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipPlaylistCurator"), v47, v48, v49, v50, v51))
    {
      objc_msgSend(*(id *)(a1 + 48), "curator");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "identifiers");
      v42 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
      v43 = -[MPIdentifierSet copyWithSource:block:](v42, "copyWithSource:block:", CFSTR("StorePlatform"), v38);
      v44 = (MPModelCurator *)objc_msgSend(v41, "copyWithIdentifiers:block:", v43, v40);

    }
    else
    {
      v45 = [MPModelCurator alloc];
      v46 = [MPIdentifierSet alloc];
      +[MPModelCuratorActualKind identityKind](MPModelCuratorActualKind, "identityKind");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[MPIdentifierSet initWithSource:modelKind:block:](v46, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v41, v38);
      v44 = -[MPModelObject initWithIdentifiers:block:](v45, "initWithIdentifiers:block:", v42, v40);
    }

    objc_msgSend(v4, "setCurator:", v44);
    v36 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_BYTE *)(v36 + 28) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistCoverArtworkRecipe")) & 1) == 0)
  {
    objc_msgSend(v4, "setCoverArtworkRecipe:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistIsCollaborative")) & 1) == 0)
  {
    objc_msgSend(v4, "setCollaborative:", objc_msgSend(*(id *)(a1 + 40), "isCollaborative"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistCollaborationSharingMode")) & 1) == 0)
  {
    objc_msgSend(v4, "setCollaborationSharingMode:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistCollaborationMode")) & 1) == 0)
  {
    objc_msgSend(v4, "setCollaborationMode:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistCollaboratorPermissions")) & 1) == 0)
  {
    objc_msgSend(v4, "setCollaboratorPermissions:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistCollaborationInvitationURL")) & 1) == 0)
  {
    objc_msgSend(v4, "setCollaborationInvitationURL:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 29) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate")) & 1) == 0)
  {
    objc_msgSend(v4, "setCollaborationInvitationURLExpirationDate:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 29) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistCollaborationJoinRequestIsPending")) & 1) == 0)
  {
    objc_msgSend(v4, "setCollaborationJoinRequestIsPending:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 29) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPlaylistCollaboratorStatus")) & 1) == 0)
  {
    objc_msgSend(v4, "setCollaboratorStatus:", 0);
  }

}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(a1[4], "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "globalPlaylistID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    v5 = objc_msgSend(a1[5], "length");

    if (v5)
      objc_msgSend(v9, "setGlobalPlaylistID:", a1[5]);
  }
  objc_msgSend(a1[4], "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "universalCloudLibraryID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    v8 = objc_msgSend(a1[6], "length");

    if (v8)
      objc_msgSend(v9, "setUniversalCloudLibraryID:", a1[6]);
  }

}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_11(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "curatorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v4);

    v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32);
  }
  if ((v3 & 4) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "curatorHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHandle:", v5);

  }
}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "curatorID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdamID:", MPStoreItemMetadataInt64NormalizeStoreIDValue(v4));

}

void __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(id *, void *);
  void *v16;
  id v17;
  id v18;
  id v19;

  v3 = a2;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v16 = &unk_1E31574D0;
  v11 = v3;
  v17 = v11;
  v18 = *(id *)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  objc_msgSend(v11, "setUniversalStoreIdentifiersWithBlock:", &v13);
  objc_msgSend(v11, "personalizedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "DSIDForUserIdentity:outError:", *(_QWORD *)(a1 + 48), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v11, "setPersonalStoreIdentifiersWithPersonID:block:", v7, &__block_literal_global_11705);
  objc_msgSend(*(id *)(a1 + 56), "versionHash", v11, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVersionHash:", v10);

}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  $CB2FAD4226395B17356672C841304CF9 *p_requestedPlaylistProperties;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  char v102;
  char v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  id v108;
  void *v109;
  MPStoreModelPlaylistBuilder *v110;
  id v111;
  id v112;
  id v113;
  void *v114;
  void *v115;
  MPIdentifierSet *v116;
  uint64_t v117;
  MPModelPlaylist *v118;
  MPIdentifierSet *v119;
  void *v120;
  void *v121;
  id v123;
  id v124;
  _QWORD v125[5];
  id v126;
  id v127;
  _QWORD v128[4];
  id v129;
  id v130;
  id v131;
  id v132;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_requestedPlaylistProperties = &self->_requestedPlaylistProperties;
  v124 = v8;
  if ((*(_BYTE *)&self->_requestedPlaylistProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "properties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistName"));
    v15 = 2;
    if (!v14)
      v15 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFFDLL | v15;
    v16 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistTrackCount"));
    v17 = 4;
    if (!v16)
      v17 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFFBLL | v17;
    v18 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistEditorNotes"));
    v19 = 8;
    if (!v18)
      v19 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFF7 | v19;
    v20 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistShortEditorNotes"));
    v21 = 16;
    if (!v20)
      v21 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFEFLL | v21;
    v22 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistReleaseDateComponents"));
    v23 = 32;
    if (!v22)
      v23 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFDFLL | v23;
    v24 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistLastModifiedDateComponents"));
    v25 = 64;
    if (!v24)
      v25 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFFBFLL | v25;
    v26 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistArtwork"));
    v27 = 128;
    if (!v26)
      v27 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFF7FLL | v27;
    v28 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistEditorialArtwork"));
    v29 = 256;
    if (!v28)
      v29 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFEFFLL | v29;
    v30 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistTracksTiledArtwork"));
    v31 = 512;
    if (!v30)
      v31 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFDFFLL | v31;
    v32 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistLibraryAdded"));
    v33 = 0x2000;
    if (!v32)
      v33 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFDFFFLL | v33;
    v34 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistKeepLocalEnableState"));
    v35 = 0x4000;
    if (!v34)
      v35 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFBFFFLL | v35;
    v36 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatus"));
    v37 = 0x8000;
    if (!v36)
      v37 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFF7FFFLL | v37;
    v38 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatusReason"));
    v39 = 0x10000;
    if (!v38)
      v39 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFEFFFFLL | v39;
    v40 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistKeepLocalConstraints"));
    v41 = 0x20000;
    if (!v40)
      v41 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFDFFFFLL | v41;
    v42 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistHasCleanContent"));
    v43 = 1024;
    if (!v42)
      v43 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFFBFFLL | v43;
    v44 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistHasExplicitContent"));
    v45 = 2048;
    if (!v44)
      v45 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFF7FFLL | v45;
    v46 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistType"));
    v47 = 4096;
    if (!v46)
      v47 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFFEFFFLL | v47;
    v48 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistIsOwner"));
    v49 = 0x80000;
    if (!v48)
      v49 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFF7FFFFLL | v49;
    v50 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistCuratorPlaylist"));
    v51 = 0x40000;
    if (!v50)
      v51 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFFBFFFFLL | v51;
    v52 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistPublicPlaylist"));
    v53 = 0x100000;
    if (!v52)
      v53 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFEFFFFFLL | v53;
    v54 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistVisiblePlaylist"));
    v55 = 0x200000;
    if (!v54)
      v55 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFDFFFFFLL | v55;
    v56 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistSubscribed"));
    v57 = 0x400000;
    if (!v56)
      v57 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFFBFFFFFLL | v57;
    v58 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistUserEditableComponents"));
    v59 = 0x800000;
    if (!v58)
      v59 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFF7FFFFFLL | v59;
    v60 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistShareURL"));
    v61 = 0x1000000;
    if (!v60)
      v61 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFEFFFFFFLL | v61;
    v62 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistShareShortURL"));
    v63 = 0x2000000;
    if (!v62)
      v63 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFDFFFFFFLL | v63;
    v64 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistDescriptionText"));
    v65 = 0x4000000;
    if (!v64)
      v65 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFFBFFFFFFLL | v65;
    v66 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistCloudVersionHash"));
    v67 = 0x8000000;
    if (!v66)
      v67 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFF7FFFFFFLL | v67;
    v68 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistTraits"));
    v69 = 0x10000000;
    if (!v68)
      v69 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFEFFFFFFFLL | v69;
    v70 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistVersionHash"));
    v71 = 0x20000000;
    if (!v70)
      v71 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFDFFFFFFFLL | v71;
    v72 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistIsFavorite"));
    v73 = 0x40000000;
    if (!v72)
      v73 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFFBFFFFFFFLL | v73;
    v74 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistIsDisliked"));
    v75 = 0x80000000;
    if (!v74)
      v75 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFF7FFFFFFFLL | v75;
    v76 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistDateFavorited"));
    v77 = 0x100000000;
    if (!v76)
      v77 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFEFFFFFFFFLL | v77;
    v78 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistIsFavoriteSongsPlaylist"));
    v79 = 0x200000000;
    if (!v78)
      v79 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFDFFFFFFFFLL | v79;
    v80 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistCoverArtworkRecipe"));
    v81 = 0x400000000;
    if (!v80)
      v81 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFFBFFFFFFFFLL | v81;
    v82 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistIsCollaborative"));
    v83 = 0x800000000;
    if (!v82)
      v83 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFF7FFFFFFFFLL | v83;
    v84 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistCollaborationSharingMode"));
    v85 = 0x1000000000;
    if (!v84)
      v85 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFEFFFFFFFFFLL | v85;
    v86 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistCollaborationMode"));
    v87 = 0x2000000000;
    if (!v86)
      v87 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFDFFFFFFFFFLL | v87;
    v88 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistCollaboratorPermissions"));
    v89 = 0x4000000000;
    if (!v88)
      v89 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFFBFFFFFFFFFLL | v89;
    v90 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistCollaborationInvitationURL"));
    v91 = 0x8000000000;
    if (!v90)
      v91 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFF7FFFFFFFFFLL | v91;
    v92 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate"));
    v93 = 0x10000000000;
    if (!v92)
      v93 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFEFFFFFFFFFFLL | v93;
    v94 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistCollaborationJoinRequestIsPending"));
    v95 = 0x20000000000;
    if (!v94)
      v95 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFDFFFFFFFFFFLL | v95;
    v96 = objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPlaylistCollaboratorStatus"));
    v97 = 0x40000000000;
    if (!v96)
      v97 = 0;
    *(_QWORD *)p_requestedPlaylistProperties = *(_QWORD *)p_requestedPlaylistProperties & 0xFFFFFBFFFFFFFFFFLL | v97;
    objc_msgSend(v12, "relationships");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "objectForKey:", CFSTR("MPModelRelationshipPlaylistCurator"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v99;
    if (v99)
    {
      objc_msgSend(v99, "properties");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedPlaylistProperties.curator |= 1u;
      if (objc_msgSend(v101, "containsObject:", CFSTR("MPModelPropertyPersonName")))
        v102 = 2;
      else
        v102 = 0;
      *(_BYTE *)&self->_requestedPlaylistProperties.curator = *(_BYTE *)&self->_requestedPlaylistProperties.curator & 0xFD | v102;
      if (objc_msgSend(v101, "containsObject:", CFSTR("MPModelPropertyCuratorHandle")))
        v103 = 4;
      else
        v103 = 0;
      *(_BYTE *)&self->_requestedPlaylistProperties.curator = *(_BYTE *)&self->_requestedPlaylistProperties.curator & 0xFB | v103;

    }
    *(_QWORD *)p_requestedPlaylistProperties |= 1uLL;

    v8 = v124;
  }
  objc_msgSend(v8, "cloudUniversalLibraryID");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeID");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  MPStoreItemMetadataStringNormalizeStoreIDValue(v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v106, "length") || objc_msgSend(v104, "length"))
  {
    v107 = MEMORY[0x1E0C809B0];
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
    v128[3] = &unk_1E31553C8;
    v129 = v106;
    v130 = v104;
    v123 = v10;
    v131 = v10;
    v108 = v8;
    v132 = v108;
    v109 = (void *)MEMORY[0x19403A810](v128);
    v125[0] = v107;
    v125[1] = 3221225472;
    v125[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
    v125[3] = &unk_1E3155418;
    v110 = self;
    v125[4] = self;
    v111 = v108;
    v126 = v111;
    v112 = v9;
    v113 = v9;
    v127 = v113;
    v114 = (void *)MEMORY[0x19403A810](v125);
    if (v113)
    {
      objc_msgSend(v113, "identifiers");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = (MPIdentifierSet *)objc_msgSend(v115, "copyWithSource:block:", CFSTR("StorePlatform"), v109);
      v117 = objc_msgSend(v113, "copyWithIdentifiers:block:", v116, v114);
    }
    else
    {
      v118 = [MPModelPlaylist alloc];
      v119 = [MPIdentifierSet alloc];
      +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = -[MPIdentifierSet initWithSource:modelKind:block:](v119, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v115, v109);
      v117 = -[MPModelObject initWithIdentifiers:block:](v118, "initWithIdentifiers:block:", v116, v114);
    }
    v120 = (void *)v117;

    if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](v110, "preventStoreItemMetadataCaching"))
    {
      +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "addStoreItemMetadata:", v111);

    }
    v9 = v112;
    v10 = v123;
    v8 = v124;
  }
  else
  {
    v120 = 0;
  }

  return v120;
}

+ (id)allSupportedProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPPropertySet *v7;
  _QWORD v9[2];
  const __CFString *v10;
  void *v11;
  _QWORD v12[42];

  v12[41] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v12[0] = CFSTR("MPModelPropertyPlaylistName");
  v12[1] = CFSTR("MPModelPropertyPlaylistTrackCount");
  v12[2] = CFSTR("MPModelPropertyPlaylistEditorNotes");
  v12[3] = CFSTR("MPModelPropertyPlaylistShortEditorNotes");
  v12[4] = CFSTR("MPModelPropertyPlaylistReleaseDateComponents");
  v12[5] = CFSTR("MPModelPropertyPlaylistLastModifiedDateComponents");
  v12[6] = CFSTR("MPModelPropertyPlaylistArtwork");
  v12[7] = CFSTR("MPModelPropertyPlaylistEditorialArtwork");
  v12[8] = CFSTR("MPModelPropertyPlaylistTracksTiledArtwork");
  v12[9] = CFSTR("MPModelPropertyPlaylistHasCleanContent");
  v12[10] = CFSTR("MPModelPropertyPlaylistHasExplicitContent");
  v12[11] = CFSTR("MPModelPropertyPlaylistType");
  v12[12] = CFSTR("MPModelPropertyPlaylistLibraryAdded");
  v12[13] = CFSTR("MPModelPropertyPlaylistKeepLocalEnableState");
  v12[14] = CFSTR("MPModelPropertyPlaylistKeepLocalManagedStatusReason");
  v12[15] = CFSTR("MPModelPropertyPlaylistKeepLocalConstraints");
  v12[16] = CFSTR("MPModelPropertyPlaylistIsOwner");
  v12[17] = CFSTR("MPModelPropertyPlaylistCuratorPlaylist");
  v12[18] = CFSTR("MPModelPropertyPlaylistPublicPlaylist");
  v12[19] = CFSTR("MPModelPropertyPlaylistVisiblePlaylist");
  v12[20] = CFSTR("MPModelPropertyPlaylistSubscribed");
  v12[21] = CFSTR("MPModelPropertyPlaylistUserEditableComponents");
  v12[22] = CFSTR("MPModelPropertyPlaylistShareURL");
  v12[23] = CFSTR("MPModelPropertyPlaylistShareShortURL");
  v12[24] = CFSTR("MPModelPropertyPlaylistDescriptionText");
  v12[25] = CFSTR("MPModelPropertyPlaylistCloudVersionHash");
  v12[26] = CFSTR("MPModelPropertyPlaylistVersionHash");
  v12[27] = CFSTR("MPModelPropertyPlaylistTraits");
  v12[28] = CFSTR("MPModelPropertyPlaylistIsFavorite");
  v12[29] = CFSTR("MPModelPropertyPlaylistIsDisliked");
  v12[30] = CFSTR("MPModelPropertyPlaylistDateFavorited");
  v12[31] = CFSTR("MPModelPropertyPlaylistIsFavoriteSongsPlaylist");
  v12[32] = CFSTR("MPModelPropertyPlaylistCoverArtworkRecipe");
  v12[33] = CFSTR("MPModelPropertyPlaylistIsCollaborative");
  v12[34] = CFSTR("MPModelPropertyPlaylistCollaborationSharingMode");
  v12[35] = CFSTR("MPModelPropertyPlaylistCollaborationMode");
  v12[36] = CFSTR("MPModelPropertyPlaylistCollaboratorPermissions");
  v12[37] = CFSTR("MPModelPropertyPlaylistCollaborationInvitationURL");
  v12[38] = CFSTR("MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate");
  v12[39] = CFSTR("MPModelPropertyPlaylistCollaborationJoinRequestIsPending");
  v12[40] = CFSTR("MPModelPropertyPlaylistCollaboratorStatus");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 41);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("MPModelPropertyPersonName");
  v9[1] = CFSTR("MPModelPropertyCuratorHandle");
  v10 = CFSTR("MPModelRelationshipPlaylistCurator");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, v6);

  return v7;
}

MPArtworkCatalog *__95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  MPArtworkCatalog *v3;
  void *v4;
  MPArtworkCatalog *v5;

  objc_msgSend(*(id *)(a1 + 32), "artworkRequestTokenForEditorialArtworkKind:", CFSTR("subscriptionCover"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "setCropStyle:", CFSTR("fc"));
    v3 = [MPArtworkCatalog alloc];
    +[MPStoreArtworkDataSource sharedStoreArtworkDataSource](MPStoreArtworkDataSource, "sharedStoreArtworkDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MPArtworkCatalog initWithToken:dataSource:](v3, "initWithToken:dataSource:", v2, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

MPArtworkCatalog *__95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MPTiledArtworkRequest *v7;
  MPArtworkCatalog *v8;
  void *v9;
  MPArtworkCatalog *v10;
  _QWORD v12[4];
  id v13;

  v7 = objc_alloc_init(MPTiledArtworkRequest);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8;
  v12[3] = &unk_1E315D988;
  v13 = *(id *)(a1 + 32);
  -[MPTiledArtworkRequest setArtworkCatalogsBlock:](v7, "setArtworkCatalogsBlock:", v12);
  -[MPTiledArtworkRequest setAllowsSynchronousArtworkCatalogsBlockExecution:](v7, "setAllowsSynchronousArtworkCatalogsBlockExecution:", 1);
  -[MPTiledArtworkRequest setNumberOfRows:](v7, "setNumberOfRows:", a3);
  -[MPTiledArtworkRequest setNumberOfColumns:](v7, "setNumberOfColumns:", a4);
  v8 = [MPArtworkCatalog alloc];
  +[MPTiledArtworkDataSource sharedDataSource](MPTiledArtworkDataSource, "sharedDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MPArtworkCatalog initWithToken:dataSource:](v8, "initWithToken:dataSource:", v7, v9);

  return v10;
}

id __95__MPStoreModelPlaylistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  MPArtworkCatalog *v11;
  void *v12;
  MPArtworkCatalog *v13;
  unint64_t v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(*(id *)(a1 + 32), "artworkTrackIDs");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(a1 + 32), "childStorePlatformDictionaryForArtworkTrackID:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "artworkRequestTokenForStorePlatformDictionary:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = [MPArtworkCatalog alloc];
        +[MPStoreArtworkDataSource sharedStoreArtworkDataSource](MPStoreArtworkDataSource, "sharedStoreArtworkDataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[MPArtworkCatalog initWithToken:dataSource:](v11, "initWithToken:dataSource:", v10, v12);

        if (v13)
        {
          if (!v6)
            v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v6, "addObject:", v13);
        }

      }
      v14 = objc_msgSend(v6, "count");

      if (v14 >= a2)
        break;
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v5)
          goto LABEL_4;
        break;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
