@implementation MPStoreModelRadioStationBuilder

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
  __int16 v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  MPIdentifierSet *v34;
  uint64_t v35;
  MPModelRadioStation *v36;
  MPIdentifierSet *v37;
  void *v38;
  void *v39;
  _QWORD v41[5];
  id v42;
  _QWORD v43[4];
  id v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*(_WORD *)&self->_requestedRadioStationProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationBeats1")))
      v13 = 2;
    else
      v13 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFFD | v13;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationName")))
      v14 = 4;
    else
      v14 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFFB | v14;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationEditorNotes")))
      v15 = 8;
    else
      v15 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFF7 | v15;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationShortEditorNotes")))
      v16 = 16;
    else
      v16 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFEF | v16;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationHasExplicitContent")))
      v17 = 32;
    else
      v17 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFDF | v17;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationType")))
      v18 = 64;
    else
      v18 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFFBF | v18;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationSubtype")))
      v19 = 128;
    else
      v19 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFF7F | v19;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationArtwork")))
      v20 = 256;
    else
      v20 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFEFF | v20;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationGlyph")))
      v21 = 512;
    else
      v21 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFDFF | v21;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationAttributionLabel")))
      v22 = 1024;
    else
      v22 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xFBFF | v22;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationProviderName")))
      v23 = 2048;
    else
      v23 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xF7FF | v23;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationLive")))
      v24 = 4096;
    else
      v24 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xEFFF | v24;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationStartingAirDate")))
      v25 = 0x2000;
    else
      v25 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xDFFF | v25;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationEndingAirDate")))
      v26 = 0x4000;
    else
      v26 = 0;
    *(_WORD *)&self->_requestedRadioStationProperties = *(_WORD *)&self->_requestedRadioStationProperties & 0xBFFF | v26;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRadioStationSubscriptionRequired")))
      v27 = -32767;
    else
      v27 = 1;
    *(_WORD *)&self->_requestedRadioStationProperties = v27 | *(_WORD *)&self->_requestedRadioStationProperties & 0x7FFE;

  }
  v28 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v43[3] = &unk_1E3163A58;
  v29 = v8;
  v44 = v29;
  v30 = (void *)MEMORY[0x19403A810](v43);
  v41[0] = v28;
  v41[1] = 3221225472;
  v41[2] = __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
  v41[3] = &unk_1E3154450;
  v41[4] = self;
  v31 = v29;
  v42 = v31;
  v32 = (void *)MEMORY[0x19403A810](v41);
  if (v9)
  {
    objc_msgSend(v9, "identifiers");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (MPIdentifierSet *)objc_msgSend(v33, "copyWithSource:block:", CFSTR("StorePlatform"), v30);
    v35 = objc_msgSend(v9, "copyWithIdentifiers:block:", v34, v32);
  }
  else
  {
    v36 = [MPModelRadioStation alloc];
    v37 = [MPIdentifierSet alloc];
    +[MPModelRadioStationKind identityKind](MPModelRadioStationKind, "identityKind");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MPIdentifierSet initWithSource:modelKind:block:](v37, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v33, v30);
    v35 = -[MPModelObject initWithIdentifiers:block:](v36, "initWithIdentifiers:block:", v34, v32);
  }
  v38 = (void *)v35;

  if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addStoreItemMetadata:", v31);

  }
  return v38;
}

void __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  objc_msgSend(v5, "radio");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stationStringID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
    v6[3] = &unk_1E3162BD0;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setRadioIdentifiersWithBlock:", v6);

  }
}

void __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "storeID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  MPStoreItemMetadataStringNormalizeStoreIDValue(v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStationStringID:", v4);

}

void __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  MPArtworkCatalog *(*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v3 = a2;
  v4 = v3;
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 2) != 0
    && (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationBeats1")) & 1) == 0)
  {
    objc_msgSend(v4, "setBeats1:", objc_msgSend(*(id *)(a1 + 40), "isBeats1"));
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationName")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationEditorNotes")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "editorNotes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEditorNotes:", v6);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationShortEditorNotes")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "shortEditorNotes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShortEditorNotes:", v7);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationHasExplicitContent")) & 1) == 0)
  {
    objc_msgSend(v4, "setHasExplicitContent:", objc_msgSend(*(id *)(a1 + 40), "isExplicitContent"));
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x800) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationProviderName")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "radioStationProviderName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProviderName:", v8);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x1000) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationLive")) & 1) == 0)
  {
    objc_msgSend(v4, "setLive:", objc_msgSend(*(id *)(a1 + 40), "isLive"));
  }
  if (*(__int16 *)(*(_QWORD *)(a1 + 32) + 24) < 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationSubscriptionRequired")) & 1) == 0)
  {
    objc_msgSend(v4, "setSubscriptionRequired:", objc_msgSend(*(id *)(a1 + 40), "radioStationIsSubscriptionOnly"));
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationType")) & 1) == 0)
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "radioStationTypeID") - 1;
    if (v9 > 9)
      v10 = 0;
    else
      v10 = qword_193F09920[v9];
    objc_msgSend(v4, "setType:", v10);
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationSubtype")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "radioStationSubtype");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Episode")) & 1) != 0)
    {
      v12 = 1;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("Shoutcast")))
    {
      v12 = 2;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v4, "setSubtype:", v12);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x100) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationArtwork")) & 1) == 0)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
    v21[3] = &unk_1E3154428;
    v22 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setArtworkCatalogBlock:", v21);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x200) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationGlyph")) & 1) == 0)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v19 = &unk_1E3154428;
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setStationGlyphBlock:", &v16);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x400) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationAttributionLabel")) & 1) == 0)
  {
    objc_msgSend(v4, "setAttributionLabel:", 0);
  }
  if ((objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationEvents"), v16, v17, v18, v19) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "radioStationEvents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStationEvents:", v13);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x2000) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationStartingAirDate")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "startingAirDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStartingAirDate:", v14);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x4000) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRadioStationEndingAirDate")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "endingAirDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEndingAirDate:", v15);

  }
  objc_msgSend(v4, "setContainsVideo:", 0);

}

MPArtworkCatalog *__99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1)
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
    objc_msgSend(v1, "setCropStyle:", *MEMORY[0x1E0DDBDB8]);
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

+ (id)allSupportedProperties
{
  void *v2;
  void *v3;
  _QWORD v5[16];

  v5[15] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyRadioStationBeats1");
  v5[1] = CFSTR("MPModelPropertyRadioStationName");
  v5[2] = CFSTR("MPModelPropertyRadioStationEditorNotes");
  v5[3] = CFSTR("MPModelPropertyRadioStationShortEditorNotes");
  v5[4] = CFSTR("MPModelPropertyRadioStationHasExplicitContent");
  v5[5] = CFSTR("MPModelPropertyRadioStationType");
  v5[6] = CFSTR("MPModelPropertyRadioStationSubtype");
  v5[7] = CFSTR("MPModelPropertyRadioStationStartingAirDate");
  v5[8] = CFSTR("MPModelPropertyRadioStationEndingAirDate");
  v5[9] = CFSTR("MPModelPropertyRadioStationArtwork");
  v5[10] = CFSTR("MPModelPropertyRadioStationGlyph");
  v5[11] = CFSTR("MPModelPropertyRadioStationAttributionLabel");
  v5[12] = CFSTR("MPModelPropertyRadioStationProviderName");
  v5[13] = CFSTR("MPModelPropertyRadioStationLive");
  v5[14] = CFSTR("MPModelPropertyRadioStationSubscriptionRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

MPArtworkCatalog *__99__MPStoreModelRadioStationBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  MPArtworkCatalog *v3;
  void *v4;
  MPArtworkCatalog *v5;

  objc_msgSend(*(id *)(a1 + 32), "stationGlyphRequestToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "setCropStyle:", *MEMORY[0x1E0DDBDB8]);
    objc_msgSend(v2, "setFormat:", *MEMORY[0x1E0DDBDD0]);
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

@end
