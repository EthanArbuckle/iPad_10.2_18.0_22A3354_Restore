@implementation MPStoreModelCreditsArtistBuilder

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
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = [MPPropertySet alloc];
  v12[0] = CFSTR("MPModelPropertyPersonName");
  v12[1] = CFSTR("MPModelPropertyCreditsArtistArtwork");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("MPModelPropertyPersonName");
  v10 = CFSTR("MPModelRelationshipCreditsArtistRelatedArtist");
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

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  MPIdentifierSet *v22;
  uint64_t v23;
  MPModelCreditsArtist *v24;
  MPIdentifierSet *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  MPStoreModelCreditsArtistBuilder *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*(_BYTE *)&self->_requestedCreditsArtistProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPersonName")))
      v13 = 2;
    else
      v13 = 0;
    *(_BYTE *)&self->_requestedCreditsArtistProperties = *(_BYTE *)&self->_requestedCreditsArtistProperties & 0xFD | v13;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyCreditsArtistArtwork")))
      v14 = 5;
    else
      v14 = 1;
    *(_BYTE *)&self->_requestedCreditsArtistProperties = v14 | *(_BYTE *)&self->_requestedCreditsArtistProperties & 0xFA;

  }
  v15 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v35[3] = &unk_1E3162A70;
  v16 = v8;
  v36 = v16;
  v17 = v10;
  v37 = v17;
  v18 = (void *)MEMORY[0x19403A810](v35);
  v29 = v15;
  v30 = 3221225472;
  v31 = __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
  v32 = &unk_1E315E5A8;
  v33 = self;
  v19 = v16;
  v34 = v19;
  v20 = (void *)MEMORY[0x19403A810](&v29);
  if (v9)
  {
    objc_msgSend(v9, "identifiers", v29, v30, v31, v32, v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (MPIdentifierSet *)objc_msgSend(v21, "copyWithSource:block:", CFSTR("StorePlatform"), v18);
    v23 = objc_msgSend(v9, "copyWithIdentifiers:block:", v22, v20);
  }
  else
  {
    v24 = [MPModelCreditsArtist alloc];
    v25 = [MPIdentifierSet alloc];
    +[MPModelArtistKind identityKind](MPModelArtistKind, "identityKind", v29, v30, v31, v32, v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[MPIdentifierSet initWithSource:modelKind:block:](v25, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v21, v18);
    v23 = -[MPModelObject initWithIdentifiers:block:](v24, "initWithIdentifiers:block:", v22, v20);
  }
  v26 = (void *)v23;

  if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addStoreItemMetadata:", v19);

  }
  return v26;
}

void __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
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
    v11[2] = __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
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
    objc_msgSend(v10, "setPersonalStoreIdentifiersWithPersonID:block:", v9, &__block_literal_global_38982);

}

void __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = v3;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 2) != 0
    && (objc_msgSend(v3, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPersonName")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 4) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyCreditsArtistArtwork")) & 1) == 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v6[3] = &unk_1E315E580;
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setArtworkCatalogBlock:", v6);

  }
}

MPArtworkCatalog *__100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
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

void __100__MPStoreModelCreditsArtistBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
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
