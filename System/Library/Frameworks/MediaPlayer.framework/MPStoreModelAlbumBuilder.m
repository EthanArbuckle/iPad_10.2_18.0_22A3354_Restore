@implementation MPStoreModelAlbumBuilder

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1, void *a2)
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
    v6[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7;
    v6[3] = &unk_1E3163A30;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

  }
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "artistStoreID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdamID:", MPStoreItemMetadataInt64NormalizeStoreIDValue(v4));

}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  v15 = a2;
  objc_msgSend(v15, "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adamID");

  objc_msgSend(v15, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formerAdamIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v16[3] = &unk_1E3153E40;
  v19 = v4;
  v17 = *(id *)(a1 + 32);
  v7 = v6;
  v18 = v7;
  objc_msgSend(v15, "setUniversalStoreIdentifiersWithBlock:", v16);
  objc_msgSend(v15, "personalizedStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "DSIDForUserIdentity:outError:", *(_QWORD *)(a1 + 40), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v15, "setPersonalStoreIdentifiersWithPersonID:block:", v11, &__block_literal_global_4701);
  objc_msgSend(*(id *)(a1 + 32), "versionHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setVersionHash:", v14);

}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (!*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "storeID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdamID:", MPStoreItemMetadataInt64NormalizeStoreIDValue(v3));

  }
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "formerStoreAdamIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormerAdamIDs:", v4);

  }
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) & 2) != 0)
  {
    v7 = v3;
    v5 = objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPersonName"));
    v4 = v7;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "artistName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setName:", v6);

      v4 = v7;
    }
  }

}

MPArtworkCatalog *__92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  void *v1;
  MPArtworkCatalog *v2;
  void *v3;
  MPArtworkCatalog *v4;

  objc_msgSend(*(id *)(a1 + 32), "artworkRequestToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = [MPArtworkCatalog alloc];
    +[MPStoreArtworkDataSource sharedStoreArtworkDataSource](MPStoreArtworkDataSource, "sharedStoreArtworkDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MPArtworkCatalog initWithToken:dataSource:](v2, "initWithToken:dataSource:", v1, v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  $8C0CBDCD37B38425772D94A24C81815E *p_requestedAlbumProperties;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  MPIdentifierSet *v61;
  uint64_t v62;
  MPModelAlbum *v63;
  MPIdentifierSet *v64;
  void *v65;
  void *v66;
  id v68;
  _QWORD v69[5];
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_requestedAlbumProperties = &self->_requestedAlbumProperties;
  if ((*(_BYTE *)&self->_requestedAlbumProperties & 1) == 0)
  {
    v68 = v9;
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "properties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumTitle")))
      v14 = 4;
    else
      v14 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFFB | v14;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumTrackCount")))
      v15 = 8;
    else
      v15 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFF7 | v15;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumMaximumItemTrackNumber")))
      v16 = 16;
    else
      v16 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFEF | v16;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumDiscCount")))
      v17 = 32;
    else
      v17 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFDF | v17;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumHasCleanContent")))
      v18 = 64;
    else
      v18 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFBF | v18;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumHasExplicitContent")))
      v19 = 128;
    else
      v19 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFF7F | v19;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumLibraryAdded")))
      v20 = 256;
    else
      v20 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFEFF | v20;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumKeepLocalEnableState")))
      v21 = 512;
    else
      v21 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFDFF | v21;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus")))
      v22 = 1024;
    else
      v22 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFBFF | v22;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason")))
      v23 = 2048;
    else
      v23 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFF7FF | v23;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumKeepLocalConstraints")))
      v24 = 4096;
    else
      v24 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFEFFF | v24;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumLibraryAddEligible")))
      v25 = 0x2000;
    else
      v25 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFDFFF | v25;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumIsCompilation")))
      v26 = 0x4000;
    else
      v26 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFBFFF | v26;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumIsClassical")))
      v27 = 0x8000;
    else
      v27 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFF7FFF | v27;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumReleaseDateComponents")))
      v28 = 0x10000;
    else
      v28 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFEFFFF | v28;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumArtwork")))
      v29 = 0x20000;
    else
      v29 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFDFFFF | v29;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumYear")))
      v30 = 0x40000;
    else
      v30 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFBFFFF | v30;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumCopyrightText")))
      v31 = 2;
    else
      v31 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFFFFFFD | v31;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumPreorder")))
      v32 = 0x80000;
    else
      v32 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFF7FFFF | v32;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumEditorNotes")))
      v33 = 0x100000;
    else
      v33 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFEFFFFF | v33;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumShortEditorNotes")))
      v34 = 0x200000;
    else
      v34 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFDFFFFF | v34;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumVolumeNormalization")))
      v35 = 0x400000;
    else
      v35 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFFBFFFFF | v35;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumSongPopularity")))
      v36 = 0x800000;
    else
      v36 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFF7FFFFF | v36;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumTraits")))
      v37 = 0x2000000;
    else
      v37 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFDFFFFFF | v37;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumVersionHash")))
      v38 = 0x4000000;
    else
      v38 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFBFFFFFF | v38;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumClassicalExperienceAvailable")))
      v39 = 0x8000000;
    else
      v39 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xF7FFFFFF | v39;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumIsFavorite")))
      v40 = 0x10000000;
    else
      v40 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xEFFFFFFF | v40;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumIsDisliked")))
      v41 = 0x20000000;
    else
      v41 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xDFFFFFFF | v41;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyAlbumDateFavorited")))
      v42 = 0x40000000;
    else
      v42 = 0;
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xBFFFFFFF | v42;
    objc_msgSend(v12, "relationships");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKey:", CFSTR("MPModelRelationshipAlbumArtist"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v44)
    {
      objc_msgSend(v44, "properties");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedAlbumProperties.artist |= 1u;
      if (objc_msgSend(v46, "containsObject:", CFSTR("MPModelPropertyPersonName")))
        v47 = 2;
      else
        v47 = 0;
      *(_BYTE *)&self->_requestedAlbumProperties.artist = *(_BYTE *)&self->_requestedAlbumProperties.artist & 0xFD | v47;

    }
    objc_msgSend(v43, "objectForKey:", CFSTR("MPModelRelationshipAlbumGenre"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
    {
      objc_msgSend(v48, "properties");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedAlbumProperties.genre |= 1u;
      if (objc_msgSend(v50, "containsObject:", CFSTR("MPModelPropertyGenreName")))
        v51 = 2;
      else
        v51 = 0;
      *(_BYTE *)&self->_requestedAlbumProperties.genre = *(_BYTE *)&self->_requestedAlbumProperties.genre & 0xFD | v51;

    }
    objc_msgSend(v43, "objectForKey:", CFSTR("MPModelRelationshipAlbumRepresentativeSong"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)p_requestedAlbumProperties = *(_DWORD *)p_requestedAlbumProperties & 0xFEFFFFFF | ((v52 != 0) << 24);

    *(_DWORD *)p_requestedAlbumProperties |= 1u;
    v9 = v68;
  }
  v53 = MEMORY[0x1E0C809B0];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v72[3] = &unk_1E3162A70;
  v54 = v8;
  v73 = v54;
  v55 = v10;
  v74 = v55;
  v56 = (void *)MEMORY[0x19403A810](v72);
  v69[0] = v53;
  v69[1] = 3221225472;
  v69[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v69[3] = &unk_1E3153EB0;
  v69[4] = self;
  v57 = v54;
  v70 = v57;
  v58 = v9;
  v71 = v58;
  v59 = (void *)MEMORY[0x19403A810](v69);
  if (v58)
  {
    objc_msgSend(v58, "identifiers");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (MPIdentifierSet *)objc_msgSend(v60, "copyWithSource:block:", CFSTR("StorePlatform"), v56);
    v62 = objc_msgSend(v58, "copyWithIdentifiers:block:", v61, v59);
  }
  else
  {
    v63 = [MPModelAlbum alloc];
    v64 = [MPIdentifierSet alloc];
    +[MPModelAlbumKind identityKind](MPModelAlbumKind, "identityKind");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[MPIdentifierSet initWithSource:modelKind:block:](v64, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v60, v56);
    v62 = -[MPModelObject initWithIdentifiers:block:](v63, "initWithIdentifiers:block:", v61, v59);
  }
  v65 = (void *)v62;

  if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addStoreItemMetadata:", v57);

  }
  return v65;
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  MPIdentifierSet *v46;
  id v47;
  MPModelArtist *v48;
  MPModelArtist *v49;
  MPIdentifierSet *v50;
  void *v51;
  void *v52;
  void *v53;
  MPModelGenre *v54;
  MPModelGenre *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  BOOL v68;
  id v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id obj;
  _QWORD v76[4];
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[5];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 4) != 0
    && (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumTitle")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v5);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumTrackCount")) & 1) == 0)
  {
    objc_msgSend(v4, "setTrackCount:", objc_msgSend(*(id *)(a1 + 40), "trackCount"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumDiscCount")) & 1) == 0)
  {
    objc_msgSend(v4, "setDiscCount:", objc_msgSend(*(id *)(a1 + 40), "discCount"));
  }
  v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if ((v6 & 0x20D0) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "childStoreItemMetadatas");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v73 = v7;
      v74 = v4;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      obj = v7;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        LOBYTE(v11) = 0;
        v12 = 0;
        v13 = 0;
        v14 = *(_QWORD *)v91;
LABEL_14:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v91 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v15);
          if (objc_msgSend(v16, "isExplicitContent", v73, v74))
            v13 = 1;
          else
            v12 = 1;
          if ((v11 & 1) != 0)
            v11 = 1;
          else
            v11 = objc_msgSend(v16, "isStoreRedownloadable");
          v17 = objc_msgSend(v16, "trackNumber");
          if (v10 <= v17)
            v10 = v17;
          v18 = *(_QWORD *)(a1 + 32);
          if ((v13 & 1) != 0 || (*(_BYTE *)(v18 + 24) & 0x80) == 0)
          {
            v19 = *(_DWORD *)(v18 + 24);
            if ((v12 & 1) != 0 || (v19 & 0x40) == 0)
            {
              v20 = (v19 & 0x2000) != 0 ? v11 : 1;
              v21 = v19 & 0x10;
              if (v20 == 1 && v21 == 0)
                break;
            }
          }
          if (v9 == ++v15)
          {
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
            if (v9)
              goto LABEL_14;
            break;
          }
        }
      }
      else
      {
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
      }

      v24 = v12 & 1;
      v23 = v13 & 1;
      v7 = v73;
      v4 = v74;
    }
    else
    {
      v23 = objc_msgSend(*(id *)(a1 + 40), "isExplicitContent");
      v24 = v23 ^ 1;
      v11 = objc_msgSend(*(id *)(a1 + 40), "isStoreRedownloadable");
      v10 = 0;
    }
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 0x80) != 0
      && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumHasExplicitContent")) & 1) == 0)
    {
      objc_msgSend(v4, "setHasExplicitContent:", v23);
    }
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 0x40) != 0
      && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumHasCleanContent")) & 1) == 0)
    {
      objc_msgSend(v4, "setHasCleanContent:", v24);
    }
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 0x20) != 0
      && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumLibraryAddEligible")) & 1) == 0)
    {
      objc_msgSend(v4, "setLibraryAddEligible:", v11);
    }
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 0x10) != 0
      && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumMaximumItemTrackNumber")) & 1) == 0)
    {
      objc_msgSend(v4, "setMaximumItemTrackNumber:", v10);
    }

    v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  }
  if ((v6 & 0x100000) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumEditorNotes")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "editorNotes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEditorNotes:", v25);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumShortEditorNotes")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "shortEditorNotes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShortEditorNotes:", v26);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumLibraryAdded")) & 1) == 0)
  {
    objc_msgSend(v4, "setLibraryAdded:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumKeepLocalEnableState")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalEnableState:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalManagedStatus:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalManagedStatusReason:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumKeepLocalConstraints")) & 1) == 0)
  {
    objc_msgSend(v4, "setKeepLocalConstraints:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumIsCompilation")) & 1) == 0)
  {
    objc_msgSend(v4, "setCompilation:", objc_msgSend(*(id *)(a1 + 40), "isCompilation"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumIsClassical")) & 1) == 0)
  {
    objc_msgSend(v4, "setClassical:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumCopyrightText")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "copyrightText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCopyrightText:", v27);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 1) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumReleaseDateComponents")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "releaseDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      +[MPStoreItemMetadata storeServerCalendar](MPStoreItemMetadata, "storeServerCalendar");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "components:fromDate:", 1048604, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setReleaseDateComponents:", v30);

    }
    else
    {
      objc_msgSend(v4, "setReleaseDateComponents:", 0);
    }

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumYear")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "releaseDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      +[MPStoreItemMetadata storeServerCalendar](MPStoreItemMetadata, "storeServerCalendar");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "component:fromDate:", 4, v31);

    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(v4, "setYear:", v33, v73, v74);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumPreorder")) & 1) == 0)
  {
    objc_msgSend(v4, "setPreorder:", objc_msgSend(*(id *)(a1 + 40), "isPreorder"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumIsFavorite")) & 1) == 0)
  {
    objc_msgSend(v4, "setIsFavorite:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumIsDisliked")) & 1) == 0)
  {
    objc_msgSend(v4, "setIsDisliked:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumDateFavorited")) & 1) == 0)
  {
    objc_msgSend(v4, "setDateFavorited:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumArtwork")) & 1) == 0)
  {
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v88[3] = &unk_1E3153E88;
    v89 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setArtworkCatalogBlock:", v88);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 26) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumVolumeNormalization")) & 1) == 0)
  {
    LODWORD(v34) = 1.0;
    objc_msgSend(v4, "setVolumeNormalization:", v34);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 2) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumTraits")) & 1) == 0)
  {
    v35 = objc_msgSend(*(id *)(a1 + 40), "isMasteredForiTunes");
    +[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEnhancedAudioAvailable");

    if (v37)
    {
      objc_msgSend(*(id *)(a1 + 40), "audioTraits");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "containsObject:", CFSTR("spatial")))
        v39 = v35 | 8;
      else
        v39 = v35;
      if (objc_msgSend(v38, "containsObject:", CFSTR("atmos"), v73, v74))
        v39 |= 0x10uLL;
      if (objc_msgSend(v38, "containsObject:", CFSTR("surround")))
        v39 |= 0x20uLL;
      if (objc_msgSend(v38, "containsObject:", CFSTR("lossless")))
        v39 |= 2uLL;
      if (objc_msgSend(v38, "containsObject:", CFSTR("hi-res-lossless")))
        v35 = v39 | 4;
      else
        v35 = v39;

    }
    objc_msgSend(v4, "setTraits:", v35, v73, v74);
  }
  v40 = *(_BYTE **)(a1 + 32);
  if ((v40[28] & 1) != 0)
  {
    v41 = MEMORY[0x1E0C809B0];
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v86[3] = &unk_1E3163A58;
    v87 = *(id *)(a1 + 40);
    v42 = (void *)MEMORY[0x19403A810](v86);
    v84[0] = v41;
    v84[1] = 3221225472;
    v84[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_8;
    v84[3] = &unk_1E3161C58;
    v43 = *(void **)(a1 + 40);
    v84[4] = *(_QWORD *)(a1 + 32);
    v85 = v43;
    v44 = (void *)MEMORY[0x19403A810](v84);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipAlbumArtist")))
    {
      objc_msgSend(*(id *)(a1 + 48), "artist");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "identifiers");
      v46 = (MPIdentifierSet *)objc_claimAutoreleasedReturnValue();
      v47 = -[MPIdentifierSet copyWithSource:block:](v46, "copyWithSource:block:", CFSTR("StorePlatform"), v42);
      v48 = (MPModelArtist *)objc_msgSend(v45, "copyWithIdentifiers:block:", v47, v44);

    }
    else
    {
      v49 = [MPModelArtist alloc];
      v50 = [MPIdentifierSet alloc];
      +[MPModelArtistKind identityKind](MPModelArtistKind, "identityKind");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[MPIdentifierSet initWithSource:modelKind:block:](v50, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v45, v42);
      v48 = -[MPModelObject initWithIdentifiers:block:](v49, "initWithIdentifiers:block:", v46, v44);
    }

    objc_msgSend(v4, "setArtist:", v48);
    v40 = *(_BYTE **)(a1 + 32);
  }
  if ((v40[32] & 1) != 0)
  {
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9;
    v82[3] = &unk_1E3161CA8;
    v82[4] = v40;
    v83 = *(id *)(a1 + 40);
    v51 = (void *)MEMORY[0x19403A810](v82);
    if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipAlbumGenre")))
    {
      objc_msgSend(*(id *)(a1 + 48), "genre");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "identifiers");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (MPModelGenre *)objc_msgSend(v52, "copyWithIdentifiers:block:", v53, v51);

    }
    else
    {
      v55 = [MPModelGenre alloc];
      +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = -[MPModelObject initWithIdentifiers:block:](v55, "initWithIdentifiers:block:", v52, v51);
    }

    objc_msgSend(v4, "setGenre:", v54);
    v40 = *(_BYTE **)(a1 + 32);
  }
  if ((v40[26] & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumSongPopularity")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "childStoreItemMetadatas");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v56, "count"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v58 = v56;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v60; ++i)
        {
          if (*(_QWORD *)v79 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          objc_msgSend(v63, "storeID", v73, v74);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          MPStoreItemMetadataNumberNormalizeStoreIDValue(v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v63, "popularity");
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = (void *)v66;
          if (v65)
            v68 = v66 == 0;
          else
            v68 = 1;
          if (!v68)
            objc_msgSend(v57, "setObject:forKey:", v66, v65);

        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
      }
      while (v60);
    }

    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10;
    v76[3] = &unk_1E3160008;
    v69 = v57;
    v77 = v69;
    objc_msgSend(v4, "setSongPopularityBlock:", v76);

  }
  v70 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if ((v70 & 0x1000000) != 0)
  {
    objc_msgSend(v4, "setRepresentativeSong:", 0);
    v70 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
  }
  if ((v70 & 0x4000000) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyAlbumVersionHash")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "versionHash");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVersionHash:", v71);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 27) & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "classicalURL");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClassicalExperienceAvailable:", v72 != 0);

  }
}

void __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) & 2) != 0)
  {
    v2 = *(void **)(a1 + 40);
    v3 = a2;
    objc_msgSend(v2, "genreNames");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setName:", v4);

  }
}

+ (id)allSupportedProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MPPropertySet *v9;
  const __CFString *v11;
  const __CFString *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[30];

  v15[29] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v15[0] = CFSTR("MPModelPropertyAlbumTitle");
  v15[1] = CFSTR("MPModelPropertyAlbumTrackCount");
  v15[2] = CFSTR("MPModelPropertyAlbumMaximumItemTrackNumber");
  v15[3] = CFSTR("MPModelPropertyAlbumDiscCount");
  v15[4] = CFSTR("MPModelPropertyAlbumHasCleanContent");
  v15[5] = CFSTR("MPModelPropertyAlbumHasExplicitContent");
  v15[6] = CFSTR("MPModelPropertyAlbumIsCompilation");
  v15[7] = CFSTR("MPModelPropertyAlbumIsClassical");
  v15[8] = CFSTR("MPModelPropertyAlbumReleaseDateComponents");
  v15[9] = CFSTR("MPModelPropertyAlbumArtwork");
  v15[10] = CFSTR("MPModelPropertyAlbumLibraryAddEligible");
  v15[11] = CFSTR("MPModelPropertyAlbumYear");
  v15[12] = CFSTR("MPModelPropertyAlbumLibraryAdded");
  v15[13] = CFSTR("MPModelPropertyAlbumKeepLocalEnableState");
  v15[14] = CFSTR("MPModelPropertyAlbumKeepLocalManagedStatus");
  v15[15] = CFSTR("MPModelPropertyAlbumKeepLocalManagedStatusReason");
  v15[16] = CFSTR("MPModelPropertyAlbumKeepLocalConstraints");
  v15[17] = CFSTR("MPModelPropertyAlbumCopyrightText");
  v15[18] = CFSTR("MPModelPropertyAlbumPreorder");
  v15[19] = CFSTR("MPModelPropertyAlbumEditorNotes");
  v15[20] = CFSTR("MPModelPropertyAlbumShortEditorNotes");
  v15[21] = CFSTR("MPModelPropertyAlbumVolumeNormalization");
  v15[22] = CFSTR("MPModelPropertyAlbumSongPopularity");
  v15[23] = CFSTR("MPModelPropertyAlbumTraits");
  v15[24] = CFSTR("MPModelPropertyAlbumVersionHash");
  v15[25] = CFSTR("MPModelPropertyAlbumClassicalExperienceAvailable");
  v15[26] = CFSTR("MPModelPropertyAlbumIsFavorite");
  v15[27] = CFSTR("MPModelPropertyAlbumIsDisliked");
  v15[28] = CFSTR("MPModelPropertyAlbumDateFavorited");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("MPModelPropertyPersonName");
  v13[0] = CFSTR("MPModelRelationshipAlbumArtist");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("MPModelRelationshipAlbumGenre");
  v14[0] = v5;
  v11 = CFSTR("MPModelPropertyGenreName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, v8);

  return v9;
}

id __92__MPStoreModelAlbumBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "universalStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "adamID");

  if (!v6)
    goto LABEL_3;
  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "universalStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v9, "adamID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_3:
    objc_msgSend(v4, "universalStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "purchasedAdamID");

    if (!v13)
      goto LABEL_5;
    v14 = *(void **)(a1 + 32);
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "universalStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithLongLong:", objc_msgSend(v16, "purchasedAdamID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_5:
      objc_msgSend(v4, "universalStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "subscriptionAdamID");

      if (v19)
      {
        v20 = *(void **)(a1 + 32);
        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "universalStore");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithLongLong:", objc_msgSend(v22, "subscriptionAdamID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }
    }
  }

  return v11;
}

@end
