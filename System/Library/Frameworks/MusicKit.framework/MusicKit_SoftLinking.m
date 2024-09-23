@implementation MusicKit_SoftLinking

+ (id)identifierSetFromLegacyModelObject:(id)a3
{
  return (id)objc_msgSend(a3, "identifiers");
}

+ (id)_identifierSetWithCatalogID:(id)a3 libraryID:(id)a4 cloudAlbumLibraryID:(id)a5 cloudID:(id)a6 reportingAdamID:(id)a7 purchasedAdamID:(id)a8 assetAdamID:(id)a9 deviceLocalID:(id)a10 possibleDeviceLocalID:(id)a11 occurrenceID:(id)a12 containedDeviceLocalID:(id)a13 syncID:(id)a14 playbackID:(id)a15 formerIDs:(id)a16 modelObjectType:(int64_t)a17 source:(int64_t)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;

  v47 = a3;
  v23 = a4;
  v46 = a5;
  v45 = a6;
  v49 = a7;
  v48 = a8;
  v24 = a9;
  v25 = a10;
  v42 = a11;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v29 = a15;
  v30 = a16;
  +[MusicKit_SoftLinking_MPModelKind _modelKindForModelObjectType:](MusicKit_SoftLinking_MPModelKind, "_modelKindForModelObjectType:", a17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v25;
  v41 = v24;
  v39 = v28;
  if (v31)
  {
    objc_msgSend(a1, "rawSourceFromSource:", a18);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_alloc((Class)getMPIdentifierSetClass());
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __295__MusicKit_SoftLinking_MusicKit_SoftLinking_MPIdentifierSet___identifierSetWithCatalogID_libraryID_cloudAlbumLibraryID_cloudID_reportingAdamID_purchasedAdamID_assetAdamID_deviceLocalID_possibleDeviceLocalID_occurrenceID_containedDeviceLocalID_syncID_playbackID_formerIDs_modelObjectType_source___block_invoke;
    v50[3] = &unk_24CD1D1B8;
    v51 = v47;
    v52 = v23;
    v53 = v49;
    v54 = v48;
    v55 = v24;
    v56 = v30;
    v57 = v26;
    v58 = v25;
    v59 = v27;
    v60 = v28;
    v65 = a1;
    v32 = v42;
    v61 = v42;
    v62 = v29;
    v33 = v46;
    v63 = v46;
    v34 = v45;
    v64 = v45;
    v44 = (id)objc_msgSend(v37, "initWithSource:modelKind:musicKitBlock:", v38, v31, v50);

    v35 = v47;
  }
  else
  {
    objc_msgSend(a1, "emptyIdentifierSet");
    v32 = v42;
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v46;
    v35 = v47;
    v34 = v45;
  }

  return v44;
}

+ (id)identifierSetWithCatalogID:(id)a3 libraryID:(id)a4 cloudAlbumLibraryID:(id)a5 cloudID:(id)a6 reportingAdamID:(id)a7 purchasedAdamID:(id)a8 assetAdamID:(id)a9 deviceLocalID:(id)a10 occurrenceID:(id)a11 containedDeviceLocalID:(id)a12 syncID:(id)a13 playbackID:(id)a14 formerIDs:(id)a15 modelObjectType:(int64_t)a16 source:(int64_t)a17
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  id v33;
  id v35;
  id v36;
  id v38;
  id v39;
  id v41;

  v39 = a15;
  v36 = a14;
  v33 = a13;
  v29 = a12;
  v31 = a11;
  v41 = a10;
  v19 = a9;
  v30 = a8;
  v20 = a7;
  v21 = a6;
  v35 = a5;
  v38 = a4;
  v22 = a3;
  v23 = (void *)objc_opt_class();
  v24 = v21;
  v25 = v21;
  v26 = v20;
  objc_msgSend(v23, "_identifierSetWithCatalogID:libraryID:cloudAlbumLibraryID:cloudID:reportingAdamID:purchasedAdamID:assetAdamID:deviceLocalID:possibleDeviceLocalID:occurrenceID:containedDeviceLocalID:syncID:playbackID:formerIDs:modelObjectType:source:", v22, v38, v35, v24, v20, v30, v19, v41, 0, v31, v29, v33, v36, v39, a16, a17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)identifierSetWithIdentifier:(id)a3 modelObjectType:(int64_t)a4 specificLibraryDatabaseID:(id)a5 isPossibleLibraryPersistentID:(BOOL)a6 source:(int64_t)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  MusicKit_SoftLinking_CatalogID *v15;
  id v16;
  MusicKit_SoftLinking_CatalogID *v17;
  id v18;
  uint64_t v19;
  id v20;
  MusicKit_SoftLinking_DeviceLocalID *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  MusicKit_SoftLinking_DeviceLocalID *v27;
  MusicKit_SoftLinking_DeviceLocalID *v28;
  void *v29;
  MusicKit_SoftLinking_CatalogID *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  v14 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v14, "numberFromString:", v12);
  v15 = (MusicKit_SoftLinking_CatalogID *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (a4 > 18)
    {
      v20 = 0;
      if ((unint64_t)(a4 - 19) > 1)
      {
LABEL_23:
        v34 = v20;
        v32 = v12;
        v33 = 0;
        v16 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      if (!a4)
      {
        v33 = v12;
        v34 = 0;
        v16 = 0;
        v32 = 0;
        v15 = 0;
        goto LABEL_27;
      }
      if (a4 != 15)
      {
        v20 = 0;
        if (a4 != 17)
          goto LABEL_23;
        if (objc_msgSend(v12, "containsString:", CFSTR("_")))
        {
          v20 = v12;
          v15 = 0;
          goto LABEL_23;
        }
        goto LABEL_21;
      }
    }
    if (objc_msgSend(v12, "hasPrefix:", CFSTR("pl.")))
    {
      v15 = -[MusicKit_SoftLinking_CatalogID initWithValue:kind:]([MusicKit_SoftLinking_CatalogID alloc], "initWithValue:kind:", v12, 2);
LABEL_22:
      v20 = 0;
      goto LABEL_23;
    }
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  v16 = v12;
  if (a4 == 25)
  {
    v17 = [MusicKit_SoftLinking_CatalogID alloc];
    v18 = v16;
    v19 = 5;
  }
  else if (a4 == 27)
  {
    v17 = [MusicKit_SoftLinking_CatalogID alloc];
    v18 = v16;
    v19 = 3;
  }
  else if (v8)
  {
    v17 = [MusicKit_SoftLinking_CatalogID alloc];
    v18 = v16;
    v19 = 8;
  }
  else
  {
    v17 = [MusicKit_SoftLinking_CatalogID alloc];
    v18 = v16;
    if (a4)
      v19 = 6;
    else
      v19 = 0;
  }
  v15 = -[MusicKit_SoftLinking_CatalogID initWithValue:kind:](v17, "initWithValue:kind:", v18, v19);
  v33 = 0;
  v34 = 0;
  v32 = 0;
LABEL_27:
  v21 = (MusicKit_SoftLinking_DeviceLocalID *)objc_msgSend(v16, "longLongValue");
  v35 = v13;
  v36 = v12;
  if (v21)
  {
    v31 = v15;
    v22 = v13;
    if (!objc_msgSend(v22, "length"))
    {
      v38 = 0;
      v39 = &v38;
      v40 = 0x2050000000;
      v23 = (void *)getMPMediaLibraryClass_softClass_0;
      v41 = getMPMediaLibraryClass_softClass_0;
      if (!getMPMediaLibraryClass_softClass_0)
      {
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __getMPMediaLibraryClass_block_invoke_0;
        v37[3] = &unk_24CD1CC68;
        v37[4] = &v38;
        __getMPMediaLibraryClass_block_invoke_0((uint64_t)v37);
        v23 = (void *)v39[3];
      }
      v24 = objc_retainAutorelease(v23);
      _Block_object_dispose(&v38, 8);
      objc_msgSend(v24, "deviceMediaLibrary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "uniqueIdentifier");
      v26 = objc_claimAutoreleasedReturnValue();

      v22 = (id)v26;
    }
    v27 = -[MusicKit_SoftLinking_DeviceLocalID initWithValue:databaseID:]([MusicKit_SoftLinking_DeviceLocalID alloc], "initWithValue:databaseID:", v21, v22);
    if (v8)
      v28 = 0;
    else
      v28 = v27;
    if (v8)
      v21 = v27;
    else
      v21 = 0;

    v15 = v31;
  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(a1, "_identifierSetWithCatalogID:libraryID:cloudAlbumLibraryID:cloudID:reportingAdamID:purchasedAdamID:assetAdamID:deviceLocalID:possibleDeviceLocalID:occurrenceID:containedDeviceLocalID:syncID:playbackID:formerIDs:modelObjectType:source:", v15, v32, v33, v16, 0, 0, 0, v28, v21, v34, 0, 0, 0, 0, a4, a7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)emptyIdentifierSet
{
  return (id)objc_msgSend(getMPIdentifierSetClass(), "emptyIdentifierSet");
}

+ (int64_t)_libraryPersistentIDForStringValue:(id)a3
{
  return objc_msgSend(a3, "msv_unsignedLongLongValue");
}

+ (BOOL)_isEntitledToUserDSID
{
  if (_isEntitledToUserDSID_sOnceToken != -1)
    dispatch_once(&_isEntitledToUserDSID_sOnceToken, &__block_literal_global_111);
  return _isEntitledToUserDSID_sIsEntitledToUserDSID;
}

+ (id)rawSourceFromSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return CFSTR("MusicKit_Unknown");
  else
    return *(&off_24CD1D290 + a3 - 1);
}

+ (id)recentlySearchedArchivedDataForUnderlyingIdentifierSet:(id)a3 modelObjectType:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  +[MusicKit_SoftLinking_MPModelKind _modelKindForModelObjectType:](MusicKit_SoftLinking_MPModelKind, "_modelKindForModelObjectType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  getMPIdentifierSetClass();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "personalizedStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    if (!v11)
    {
      v10 = v9;
      if (v8)
      {
        +[MusicKit_SoftLinking rawSourceFromSource:](MusicKit_SoftLinking, "rawSourceFromSource:", 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc((Class)getMPIdentifierSetClass()), "initWithSource:modelKind:block:", v12, v8, &__block_literal_global_149);
        objc_msgSend(v9, "unionSet:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  objc_msgSend(v10, "archivedDataWithError:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)recentlySearchedUnarchiveUnderlyingIdentifierSetWithData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = a3;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", getMPIdentifierSetClass(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (int64_t)audioTraitsForRawValue:(int64_t)a3
{
  objc_msgSend(a1, "_ensureConsistencyOfUnderlyingOptionSetsForAudioTraits");
  return a3 & 0x31 | (4 * (((unint64_t)a3 >> 1) & 1)) | ((unint64_t)a3 >> 1) & 2;
}

+ (int64_t)rawValueForAudioTraits:(int64_t)a3
{
  objc_msgSend(a1, "_ensureConsistencyOfUnderlyingOptionSetsForAudioTraits");
  return a3 & 0x31 | ((unint64_t)a3 >> 1) & 2 | (4 * (((unint64_t)a3 >> 1) & 1));
}

+ (id)storeArtworkTokenWithImageArtworkInfo:(id)a3 cropStyle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v7 = (void *)getMPStoreArtworkRequestTokenClass_softClass;
  v16 = getMPStoreArtworkRequestTokenClass_softClass;
  if (!getMPStoreArtworkRequestTokenClass_softClass)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __getMPStoreArtworkRequestTokenClass_block_invoke;
    v12[3] = &unk_24CD1CC68;
    v12[4] = &v13;
    __getMPStoreArtworkRequestTokenClass_block_invoke((uint64_t)v12);
    v7 = (void *)v14[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v8, "tokenWithImageArtworkInfo:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "setCropStyle:", v6);

  return v10;
}

+ (id)artworkCatalogWithDataSourceShortDescription:(id)a3 dataSourceIdentifier:(id)a4 tokenParameters:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(getMPArtworkCatalogClass_0(), "artworkCatalogWithDataSourceShortDescription:dataSourceIdentifier:tokenParameters:", v9, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)artworkCatalogWithStoreArtworkToken:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = objc_alloc((Class)getMPArtworkCatalogClass_0());
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getMPStoreArtworkDataSourceClass_softClass;
  v14 = getMPStoreArtworkDataSourceClass_softClass;
  if (!getMPStoreArtworkDataSourceClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getMPStoreArtworkDataSourceClass_block_invoke;
    v10[3] = &unk_24CD1CC68;
    v10[4] = &v11;
    __getMPStoreArtworkDataSourceClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v6, "sharedStoreArtworkDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithToken:dataSource:", v3, v7);

  return v8;
}

+ (id)artworkCatalogWithCoverArtworkToken:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)getMPArtworkCatalogClass_0());
  +[MusicKit_SoftLinking_CoverArtworkDataSource sharedDataSource](MusicKit_SoftLinking_CoverArtworkDataSource, "sharedDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithToken:dataSource:", v3, v5);

  return v6;
}

+ (double)luminanceForColor:(CGColor *)a3
{
  void (*v4)(CGColor *);
  double result;
  _Unwind_Exception *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (void (*)(CGColor *))getUISColorLuminanceSymbolLoc_ptr;
  v11 = getUISColorLuminanceSymbolLoc_ptr;
  if (!getUISColorLuminanceSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getUISColorLuminanceSymbolLoc_block_invoke;
    v7[3] = &unk_24CD1CC68;
    v7[4] = &v8;
    __getUISColorLuminanceSymbolLoc_block_invoke((uint64_t)v7);
    v4 = (void (*)(CGColor *))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    v6 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  v4(a3);
  return result;
}

@end
