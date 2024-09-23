@implementation MPStoreModelTVShowBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAssetProperties, 0);
  objc_storeStrong((id *)&self->_storeAssetBuilder, 0);
}

+ (id)allSupportedProperties
{
  void *v2;
  void *v3;
  _QWORD v5[10];

  v5[9] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyTVShowTitle");
  v5[1] = CFSTR("MPModelPropertyTVShowShortTitle");
  v5[2] = CFSTR("MPModelPropertyTVShowEditorNotes");
  v5[3] = CFSTR("MPModelPropertyTVShowShortEditorNotes");
  v5[4] = CFSTR("MPModelPropertyTVShowArtwork");
  v5[5] = CFSTR("MPModelPropertyTVShowEditorialArtwork");
  v5[6] = CFSTR("MPModelPropertyTVShowEpisodeCount");
  v5[7] = CFSTR("MPModelPropertyTVShowTagline");
  v5[8] = CFSTR("MPModelPropertyTVShowStoreCanonicalID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  MPIdentifierSet *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  MPModelTVShow *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  MPStoreModelTVShowBuilder *v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*(_WORD *)&self->_requestedTVShowProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyTVShowTitle")))
      v13 = 2;
    else
      v13 = 0;
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFFD | v13;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyTVShowShortTitle")))
      v14 = 4;
    else
      v14 = 0;
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFFB | v14;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyTVShowArtwork")))
      v15 = 64;
    else
      v15 = 0;
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFBF | v15;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyTVShowEditorialArtwork")))
      v16 = 32;
    else
      v16 = 0;
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFDF | v16;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyTVShowEditorNotes")))
      v17 = 8;
    else
      v17 = 0;
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFF7 | v17;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyTVShowShortEditorNotes")))
      v18 = 16;
    else
      v18 = 0;
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFFEF | v18;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyTVShowTagline")))
      v19 = 256;
    else
      v19 = 0;
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFEFF | v19;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyTVShowEpisodeCount")))
      v20 = 128;
    else
      v20 = 0;
    *(_WORD *)&self->_requestedTVShowProperties = *(_WORD *)&self->_requestedTVShowProperties & 0xFF7F | v20;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyTVShowStoreCanonicalID")))
      v21 = 513;
    else
      v21 = 1;
    *(_WORD *)&self->_requestedTVShowProperties = v21 | *(_WORD *)&self->_requestedTVShowProperties & 0xFDFE;

  }
  v22 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v44[3] = &unk_1E3163A58;
  v23 = v8;
  v45 = v23;
  v24 = (void *)MEMORY[0x19403A810](v44);
  v37 = v22;
  v38 = 3221225472;
  v39 = __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
  v40 = &unk_1E31542A0;
  v41 = self;
  v25 = v9;
  v42 = v25;
  v26 = v23;
  v43 = v26;
  v27 = (void *)MEMORY[0x19403A810](&v37);
  if (v25)
  {
    objc_msgSend(v25, "identifiers", v37, v38, v39, v40, v41, v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (MPIdentifierSet *)objc_msgSend(v28, "copyWithSource:block:", CFSTR("StorePlatform"), v24);
    v30 = objc_msgSend(v25, "copyWithIdentifiers:block:", v29, v27);
  }
  else
  {
    +[MPModelTVEpisode kindWithVariants:](MPModelTVEpisode, "kindWithVariants:", 2, v37, v38, v39, v40, v41, v42);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelTVSeason kindWithEpisodeKind:](MPModelTVSeason, "kindWithEpisodeKind:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPModelTVShow kindWithSeasonKind:](MPModelTVShow, "kindWithSeasonKind:", v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = [MPModelTVShow alloc];
    v29 = -[MPIdentifierSet initWithSource:modelKind:block:]([MPIdentifierSet alloc], "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v28, v24);
    v30 = -[MPModelObject initWithIdentifiers:block:](v33, "initWithIdentifiers:block:", v29, v27);
  }
  v34 = (void *)v30;

  if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addStoreItemMetadata:", v26);

  }
  return v34;
}

void __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  v2 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v2, "storeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v3);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
  v6[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v6[4] = v4;
  objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

}

void __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 40) & 2) != 0
    && (objc_msgSend(*(id *)(a1 + 40), "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVShowTitle")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v4);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 40) & 4) != 0
    && (objc_msgSend(*(id *)(a1 + 40), "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVShowShortTitle")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "shortName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShortTitle:", v5);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 40) & 0x80) != 0
    && (objc_msgSend(*(id *)(a1 + 40), "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVShowEpisodeCount")) & 1) == 0)
  {
    objc_msgSend(v3, "setEpisodesCount:", objc_msgSend(*(id *)(a1 + 48), "episodeCount"));
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 40) & 0x100) != 0
    && (objc_msgSend(*(id *)(a1 + 40), "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVShowTagline")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "editorNotesWithStyle:", CFSTR("tagline"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTagline:", v6);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 40) & 0x200) != 0
    && (objc_msgSend(*(id *)(a1 + 40), "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVShowStoreCanonicalID")) & 1) == 0)
  {
    objc_msgSend(v3, "setStoreCanonicalID:", &stru_1E3163D10);
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 40) & 0x40) != 0
    && (objc_msgSend(*(id *)(a1 + 40), "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVShowArtwork")) & 1) == 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
    v9[3] = &unk_1E3154278;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v3, "setArtworkCatalogBlock:", v9);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 40) & 0x20) != 0
    && (objc_msgSend(*(id *)(a1 + 40), "hasLoadedValueForKey:", CFSTR("MPModelPropertyTVShowEditorialArtwork")) & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v7[3] = &unk_1E3154278;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v3, "setEditorialArtworkCatalogBlock:", v7);

  }
}

MPArtworkCatalog *__93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1)
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

MPArtworkCatalog *__93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  MPArtworkCatalog *v3;
  void *v4;
  MPArtworkCatalog *v5;

  objc_msgSend(*(id *)(a1 + 32), "tvShowArtworkRequestToken");
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

uint64_t __93__MPStoreModelTVShowBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAdamID:", *(_QWORD *)(a1 + 32));
}

@end
