@implementation MPStoreModelArtistBuilder

uint64_t __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7(uint64_t result, void *a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(result + 32) + 28) & 2) != 0)
    return objc_msgSend(a2, "setName:", *(_QWORD *)(result + 40));
  return result;
}

MPArtworkCatalog *__93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
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

void __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MPModelGenre *v13;
  MPModelGenre *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a2;
  v4 = v3;
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 2) != 0
    && (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPersonName")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyArtistHasBiography")) & 1) == 0)
  {
    objc_msgSend(v4, "setHasBiography:", objc_msgSend(*(id *)(a1 + 40), "hasArtistBiography"));
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPersonHasSocialPosts")) & 1) == 0)
  {
    objc_msgSend(v4, "setHasSocialPosts:", objc_msgSend(*(id *)(a1 + 40), "hasSocialPosts"));
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyArtistArtwork")) & 1) == 0)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v25[3] = &unk_1E3156BC8;
    v26 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setArtworkCatalogBlock:", v25);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyArtistEditorialArtwork")) & 1) == 0)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v23[3] = &unk_1E3156BC8;
    v24 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setEditorialArtworkCatalogBlock:", v23);

  }
  v6 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v6 + 28) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "genreNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_7;
      v20 = &unk_1E3161CA8;
      v21 = *(_QWORD *)(a1 + 32);
      v22 = v8;
      v9 = (void *)MEMORY[0x19403A810](&v17);
      if (objc_msgSend(*(id *)(a1 + 48), "hasLoadedValueForKey:", CFSTR("MPModelRelationshipArtistGenre"), v17, v18, v19, v20, v21)&& (objc_msgSend(*(id *)(a1 + 48), "genre"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = v10;
        objc_msgSend(v10, "identifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (MPModelGenre *)objc_msgSend(v11, "copyWithIdentifiers:block:", v12, v9);

      }
      else
      {
        v14 = [MPModelGenre alloc];
        +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[MPModelObject initWithIdentifiers:block:](v14, "initWithIdentifiers:block:", v11, v9);
      }

    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v4, "setGenre:", v13);

    v6 = *(_QWORD *)(a1 + 32);
  }
  v15 = *(_WORD *)(v6 + 24);
  if ((v15 & 0x40) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "classicalURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setClassicalExperienceAvailable:", v16 != 0);

    v15 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 24);
    if ((v15 & 0x80) == 0)
    {
LABEL_27:
      if ((v15 & 0x100) == 0)
        goto LABEL_28;
      goto LABEL_34;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(v4, "setIsFavorite:", 0);
  v15 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 24);
  if ((v15 & 0x100) == 0)
  {
LABEL_28:
    if ((v15 & 0x200) == 0)
      goto LABEL_29;
LABEL_35:
    objc_msgSend(v4, "setDateFavorited:", 0);
    if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x400) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_34:
  objc_msgSend(v4, "setIsDisliked:", 0);
  v15 = *(_WORD *)(*(_QWORD *)(a1 + 32) + 24);
  if ((v15 & 0x200) != 0)
    goto LABEL_35;
LABEL_29:
  if ((v15 & 0x400) != 0)
LABEL_30:
    objc_msgSend(v4, "setLibraryAdded:", 0);
LABEL_31:

}

void __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "storeID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdamID:", MPStoreItemMetadataInt64NormalizeStoreIDValue(v4));

}

void __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a2;
  objc_msgSend(v10, "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adamID");

  if (!v4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
    v11[3] = &unk_1E3163A30;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v10, "setUniversalStoreIdentifiersWithBlock:", v11);

  }
  objc_msgSend(v10, "personalizedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "accountDSID");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (objc_msgSend(v9, "length"))
    objc_msgSend(v10, "setPersonalStoreIdentifiersWithPersonID:block:", v9, &__block_literal_global_15591);

}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  $08AEB1FF3D6278F09821128922787C49 *p_requestedArtistProperties;
  void *v12;
  void *v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  MPIdentifierSet *v37;
  uint64_t v38;
  MPModelArtist *v39;
  MPIdentifierSet *v40;
  void *v41;
  void *v42;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_requestedArtistProperties = &self->_requestedArtistProperties;
  if ((*(_WORD *)&self->_requestedArtistProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "properties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPersonName")))
      v14 = 2;
    else
      v14 = 0;
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFFD | v14;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyArtistHasBiography")))
      v15 = 4;
    else
      v15 = 0;
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFFB | v15;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyPersonHasSocialPosts")))
      v16 = 8;
    else
      v16 = 0;
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFF7 | v16;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyArtistArtwork")))
      v17 = 16;
    else
      v17 = 0;
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFEF | v17;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyArtistEditorialArtwork")))
      v18 = 32;
    else
      v18 = 0;
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFDF | v18;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyArtistClassicalExperienceAvailable")))
      v19 = 64;
    else
      v19 = 0;
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFFBF | v19;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyArtistIsFavorite")))
      v20 = 128;
    else
      v20 = 0;
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFF7F | v20;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyArtistIsDisliked")))
      v21 = 256;
    else
      v21 = 0;
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFEFF | v21;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyArtistDateFavorited")))
      v22 = 512;
    else
      v22 = 0;
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFDFF | v22;
    if (objc_msgSend(v13, "containsObject:", CFSTR("MPModelPropertyArtistLibraryAdded")))
      v23 = 1024;
    else
      v23 = 0;
    *(_WORD *)p_requestedArtistProperties = *(_WORD *)p_requestedArtistProperties & 0xFBFF | v23;
    objc_msgSend(v12, "relationships");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", CFSTR("MPModelRelationshipArtistGenre"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "properties");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)&self->_requestedArtistProperties.genre |= 1u;
      if (objc_msgSend(v27, "containsObject:", CFSTR("MPModelPropertyGenreName")))
        v28 = 2;
      else
        v28 = 0;
      *(_BYTE *)&self->_requestedArtistProperties.genre = *(_BYTE *)&self->_requestedArtistProperties.genre & 0xFD | v28;

    }
    *(_WORD *)p_requestedArtistProperties |= 1u;

  }
  v29 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v47[3] = &unk_1E3162A70;
  v30 = v8;
  v48 = v30;
  v31 = v10;
  v49 = v31;
  v32 = (void *)MEMORY[0x19403A810](v47);
  v44[0] = v29;
  v44[1] = 3221225472;
  v44[2] = __93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v44[3] = &unk_1E3156BF8;
  v44[4] = self;
  v33 = v30;
  v45 = v33;
  v34 = v9;
  v46 = v34;
  v35 = (void *)MEMORY[0x19403A810](v44);
  if (v34)
  {
    objc_msgSend(v34, "identifiers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (MPIdentifierSet *)objc_msgSend(v36, "copyWithSource:block:", CFSTR("StorePlatform"), v32);
    v38 = objc_msgSend(v34, "copyWithIdentifiers:block:", v37, v35);
  }
  else
  {
    v39 = [MPModelArtist alloc];
    v40 = [MPIdentifierSet alloc];
    +[MPModelArtistKind identityKind](MPModelArtistKind, "identityKind");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[MPIdentifierSet initWithSource:modelKind:block:](v40, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v36, v32);
    v38 = -[MPModelObject initWithIdentifiers:block:](v39, "initWithIdentifiers:block:", v37, v35);
  }
  v41 = (void *)v38;

  if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addStoreItemMetadata:", v33);

  }
  return v41;
}

+ (id)allSupportedProperties
{
  MPPropertySet *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MPPropertySet *v7;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v12[11];

  v12[10] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v12[0] = CFSTR("MPModelPropertyPersonName");
  v12[1] = CFSTR("MPModelPropertyArtistHasBiography");
  v12[2] = CFSTR("MPModelPropertyPersonHasSocialPosts");
  v12[3] = CFSTR("MPModelPropertyArtistArtwork");
  v12[4] = CFSTR("MPModelPropertyArtistEditorialArtwork");
  v12[5] = CFSTR("MPModelPropertyArtistClassicalExperienceAvailable");
  v12[6] = CFSTR("MPModelPropertyArtistIsFavorite");
  v12[7] = CFSTR("MPModelPropertyArtistIsDisliked");
  v12[8] = CFSTR("MPModelPropertyArtistDateFavorited");
  v12[9] = CFSTR("MPModelPropertyArtistLibraryAdded");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("MPModelPropertyGenreName");
  v10 = CFSTR("MPModelRelationshipArtistGenre");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, v6);

  return v7;
}

MPArtworkCatalog *__93__MPStoreModelArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1)
{
  void *v1;
  MPArtworkCatalog *v2;
  void *v3;
  MPArtworkCatalog *v4;

  objc_msgSend(*(id *)(a1 + 32), "artworkRequestTokenForEditorialArtworkKind:", CFSTR("bannerUber"));
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

@end
