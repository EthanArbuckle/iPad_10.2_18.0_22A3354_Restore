@implementation MPStoreModelCuratorBuilder

void __94__MPStoreModelCuratorBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  v5 = a2;
  objc_msgSend(v5, "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adamID");

  if (!v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __94__MPStoreModelCuratorBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
    v6[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);
  }

}

uint64_t __94__MPStoreModelCuratorBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAdamID:", *(_QWORD *)(a1 + 32));
}

void __94__MPStoreModelCuratorBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

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
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyCuratorShortName")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "shortName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShortName:", v6);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyPersonHasSocialPosts")) & 1) == 0)
  {
    objc_msgSend(v4, "setHasSocialPosts:", objc_msgSend(*(id *)(a1 + 40), "hasSocialPosts"));
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x10) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyCuratorEditorNotes")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "editorNotes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEditorNotes:", v7);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyCuratorShortEditorNotes")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "shortEditorNotes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShortEditorNotes:", v8);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyCuratorKind")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "itemKind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("iTunesBrand")) & 1) != 0)
    {
      v10 = 1;
    }
    else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("brand")) & 1) != 0)
    {
      v10 = 2;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("activity")))
    {
      v10 = 3;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v4, "setCuratorKind:", v10);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyCuratorSubKind")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "iTunesBrandType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Curator")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Genre")) & 1) != 0)
    {
      v12 = 2;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("Show")))
    {
      v12 = 3;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v4, "setCuratorSubKind:", v12);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x100) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyCuratorEditorialArtwork")) & 1) == 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __94__MPStoreModelCuratorBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
    v15[3] = &unk_1E315C2A0;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setEditorialArtworkCatalogBlock:", v15);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x200) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertyCuratorBrandLogoArtwork")) & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __94__MPStoreModelCuratorBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5;
    v13[3] = &unk_1E315C2A0;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setBrandLogoArtworkCatalogBlock:", v13);

  }
}

MPArtworkCatalog *__94__MPStoreModelCuratorBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1)
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
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  MPModelCurator *v31;
  void *v32;
  uint64_t v33;
  MPModelCurator *v34;
  MPIdentifierSet *v35;
  MPIdentifierSet *v36;
  void *v37;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*(_WORD *)&self->_requestedCuratorProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPersonName")))
      v13 = 2;
    else
      v13 = 0;
    *(_WORD *)&self->_requestedCuratorProperties = *(_WORD *)&self->_requestedCuratorProperties & 0xFFFD | v13;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyCuratorShortName")))
      v14 = 4;
    else
      v14 = 0;
    *(_WORD *)&self->_requestedCuratorProperties = *(_WORD *)&self->_requestedCuratorProperties & 0xFFFB | v14;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPersonHasSocialPosts")))
      v15 = 8;
    else
      v15 = 0;
    *(_WORD *)&self->_requestedCuratorProperties = *(_WORD *)&self->_requestedCuratorProperties & 0xFFF7 | v15;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyCuratorEditorNotes")))
      v16 = 16;
    else
      v16 = 0;
    *(_WORD *)&self->_requestedCuratorProperties = *(_WORD *)&self->_requestedCuratorProperties & 0xFFEF | v16;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyCuratorShortEditorNotes")))
      v17 = 32;
    else
      v17 = 0;
    *(_WORD *)&self->_requestedCuratorProperties = *(_WORD *)&self->_requestedCuratorProperties & 0xFFDF | v17;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyCuratorKind")))
      v18 = 64;
    else
      v18 = 0;
    *(_WORD *)&self->_requestedCuratorProperties = *(_WORD *)&self->_requestedCuratorProperties & 0xFFBF | v18;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyCuratorSubKind")))
      v19 = 128;
    else
      v19 = 0;
    *(_WORD *)&self->_requestedCuratorProperties = *(_WORD *)&self->_requestedCuratorProperties & 0xFF7F | v19;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyCuratorEditorialArtwork")))
      v20 = 256;
    else
      v20 = 0;
    *(_WORD *)&self->_requestedCuratorProperties = *(_WORD *)&self->_requestedCuratorProperties & 0xFEFF | v20;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyCuratorBrandLogoArtwork")))
      v21 = 513;
    else
      v21 = 1;
    *(_WORD *)&self->_requestedCuratorProperties = v21 | *(_WORD *)&self->_requestedCuratorProperties & 0xFDFE;

  }
  objc_msgSend(v8, "storeID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v22);

  if (!v23)
  {
    objc_msgSend(v8, "curatorID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MPStoreItemMetadataInt64NormalizeStoreIDValue(v24);

  }
  v25 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __94__MPStoreModelCuratorBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v41[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
  v41[4] = v23;
  v26 = (void *)MEMORY[0x19403A810](v41);
  v39[0] = v25;
  v39[1] = 3221225472;
  v39[2] = __94__MPStoreModelCuratorBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
  v39[3] = &unk_1E315C2D0;
  v39[4] = self;
  v27 = v8;
  v40 = v27;
  v28 = (void *)MEMORY[0x19403A810](v39);
  if (v9)
  {
    objc_msgSend(v9, "identifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copyWithSource:block:", CFSTR("StorePlatform"), v26);
    v31 = (MPModelCurator *)objc_msgSend(v9, "copyWithIdentifiers:block:", v30, v28);
  }
  else
  {
    objc_msgSend(v27, "itemKind");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isEqualToString:", CFSTR("iTunesBrand")))
    {
      objc_msgSend(v27, "iTunesBrandType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "isEqualToString:", CFSTR("Curator")) & 1) != 0)
      {
        v33 = 1;
      }
      else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("Genre")) & 1) != 0)
      {
        v33 = 2;
      }
      else if (objc_msgSend(v32, "isEqualToString:", CFSTR("Show")))
      {
        v33 = 4;
      }
      else
      {
        v33 = 0;
      }

    }
    else if ((objc_msgSend(v29, "isEqualToString:", CFSTR("brand")) & 1) != 0)
    {
      v33 = 8;
    }
    else if (objc_msgSend(v29, "isEqualToString:", CFSTR("activity")))
    {
      v33 = 16;
    }
    else
    {
      v33 = 0;
    }
    v34 = [MPModelCurator alloc];
    v35 = [MPIdentifierSet alloc];
    +[MPModelCurator kindWithVariants:](MPModelCurator, "kindWithVariants:", v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[MPIdentifierSet initWithSource:modelKind:block:](v35, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v30, v26);
    v31 = -[MPModelObject initWithIdentifiers:block:](v34, "initWithIdentifiers:block:", v36, v28);

  }
  if (!-[MPStoreModelObjectBuilder preventStoreItemMetadataCaching](self, "preventStoreItemMetadataCaching"))
  {
    +[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addStoreItemMetadata:", v27);

  }
  return v31;
}

+ (id)allSupportedProperties
{
  void *v2;
  void *v3;
  _QWORD v5[9];

  v5[8] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyPersonName");
  v5[1] = CFSTR("MPModelPropertyCuratorShortName");
  v5[2] = CFSTR("MPModelPropertyPersonHasSocialPosts");
  v5[3] = CFSTR("MPModelPropertyCuratorEditorNotes");
  v5[4] = CFSTR("MPModelPropertyCuratorKind");
  v5[5] = CFSTR("MPModelPropertyCuratorSubKind");
  v5[6] = CFSTR("MPModelPropertyCuratorEditorialArtwork");
  v5[7] = CFSTR("MPModelPropertyCuratorBrandLogoArtwork");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

MPArtworkCatalog *__94__MPStoreModelCuratorBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_5(uint64_t a1)
{
  void *v1;
  MPArtworkCatalog *v2;
  void *v3;
  MPArtworkCatalog *v4;

  objc_msgSend(*(id *)(a1 + 32), "artworkRequestTokenForEditorialArtworkKind:", CFSTR("brandLogo"));
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
