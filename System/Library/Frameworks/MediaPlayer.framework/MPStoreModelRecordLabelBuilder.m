@implementation MPStoreModelRecordLabelBuilder

+ (id)allSupportedProperties
{
  MPPropertySet *v2;
  void *v3;
  MPPropertySet *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v6[0] = CFSTR("MPModelPropertyRecordLabelName");
  v6[1] = CFSTR("MPModelPropertyRecordLabelDescriptionText");
  v6[2] = CFSTR("MPModelPropertyRecordLabelShortDescriptionText");
  v6[3] = CFSTR("MPModelPropertyRecordLabelArtwork");
  v6[4] = CFSTR("MPModelPropertyRecordLabelEditorialArtwork");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPPropertySet initWithProperties:relationships:](v2, "initWithProperties:relationships:", v3, 0);

  return v4;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  MPIdentifierSet *v25;
  uint64_t v26;
  MPModelRecordLabel *v27;
  MPIdentifierSet *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  MPStoreModelRecordLabelBuilder *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*(_BYTE *)&self->_requestedRecordLabelProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRecordLabelName")))
      v13 = 2;
    else
      v13 = 0;
    *(_BYTE *)&self->_requestedRecordLabelProperties = *(_BYTE *)&self->_requestedRecordLabelProperties & 0xFD | v13;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRecordLabelDescriptionText")))
      v14 = 4;
    else
      v14 = 0;
    *(_BYTE *)&self->_requestedRecordLabelProperties = *(_BYTE *)&self->_requestedRecordLabelProperties & 0xFB | v14;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRecordLabelShortDescriptionText")))
      v15 = 8;
    else
      v15 = 0;
    *(_BYTE *)&self->_requestedRecordLabelProperties = *(_BYTE *)&self->_requestedRecordLabelProperties & 0xF7 | v15;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRecordLabelArtwork")))
      v16 = 16;
    else
      v16 = 0;
    *(_BYTE *)&self->_requestedRecordLabelProperties = *(_BYTE *)&self->_requestedRecordLabelProperties & 0xEF | v16;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyRecordLabelEditorialArtwork")))
      v17 = 33;
    else
      v17 = 1;
    *(_BYTE *)&self->_requestedRecordLabelProperties = v17 | *(_BYTE *)&self->_requestedRecordLabelProperties & 0xDE;

  }
  v18 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v38[3] = &unk_1E3162A70;
  v19 = v8;
  v39 = v19;
  v20 = v10;
  v40 = v20;
  v21 = (void *)MEMORY[0x19403A810](v38);
  v32 = v18;
  v33 = 3221225472;
  v34 = __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v35 = &unk_1E3159808;
  v36 = self;
  v22 = v19;
  v37 = v22;
  v23 = (void *)MEMORY[0x19403A810](&v32);
  if (v9)
  {
    objc_msgSend(v9, "identifiers", v32, v33, v34, v35, v36);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (MPIdentifierSet *)objc_msgSend(v24, "copyWithSource:block:", CFSTR("StorePlatform"), v21);
    v26 = objc_msgSend(v9, "copyWithIdentifiers:block:", v25, v23);
  }
  else
  {
    v27 = [MPModelRecordLabel alloc];
    v28 = [MPIdentifierSet alloc];
    +[MPModelArtistKind identityKind](MPModelArtistKind, "identityKind", v32, v33, v34, v35, v36);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MPIdentifierSet initWithSource:modelKind:block:](v28, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v24, v21);
    v26 = -[MPModelObject initWithIdentifiers:block:](v27, "initWithIdentifiers:block:", v25, v23);
  }
  v29 = (void *)v26;

  if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addStoreItemMetadata:", v22);

  }
  return v29;
}

void __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
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
    v11[2] = __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
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
    objc_msgSend(v10, "setPersonalStoreIdentifiersWithPersonID:block:", v9, &__block_literal_global_24323);

}

void __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 2) != 0
    && (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRecordLabelName")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRecordLabelDescriptionText")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "descriptionText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDescriptionText:", v6);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRecordLabelShortDescriptionText")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "shortDescriptionText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShortDescriptionText:", v7);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRecordLabelArtwork")) & 1) == 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v10[3] = &unk_1E31597E0;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setArtworkCatalogBlock:", v10);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyRecordLabelEditorialArtwork")) & 1) == 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6;
    v8[3] = &unk_1E31597E0;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setEditorialArtworkCatalogBlock:", v8);

  }
}

MPArtworkCatalog *__98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
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

MPArtworkCatalog *__98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_6(uint64_t a1)
{
  void *v1;
  MPArtworkCatalog *v2;
  void *v3;
  MPArtworkCatalog *v4;

  objc_msgSend(*(id *)(a1 + 32), "artworkRequestTokenForEditorialArtworkKind:", CFSTR("subscriptionCover"));
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

void __98__MPStoreModelRecordLabelBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
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

@end
