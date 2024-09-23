@implementation MPStoreModelSocialPersonBuilder

void __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a2;
  objc_msgSend(v5, "universalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "socialProfileID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2;
    v6[3] = &unk_1E3163A30;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);

  }
}

uint64_t __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSocialProfileID:", *(_QWORD *)(a1 + 32));
}

void __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

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
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySocialPersonUncensoredName")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "nameRaw");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUncensoredName:", v6);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 8) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySocialPersonHandle")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHandle:", v7);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x20) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySocialPersonArtwork")) & 1) == 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4;
    v8[3] = &unk_1E3163A80;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v4, "setArtworkCatalogBlock:", v8);

  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x80) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySocialPersonIsPrivate")) & 1) == 0)
  {
    objc_msgSend(v4, "setPrivatePerson:", objc_msgSend(*(id *)(a1 + 40), "isPrivatePerson"));
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x40) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySocialPersonIsVerified")) & 1) == 0)
  {
    objc_msgSend(v4, "setVerified:", objc_msgSend(*(id *)(a1 + 40), "isVerifiedPerson"));
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 24) & 0x100) != 0
    && (objc_msgSend(v4, "hasLoadedValueForKey:", CFSTR("MPModelPropertySocialPersonHasLightweightProfile")) & 1) == 0)
  {
    objc_msgSend(v4, "setHasLightweightProfile:", objc_msgSend(*(id *)(a1 + 40), "isOnboardedPerson") ^ 1);
  }

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
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  MPIdentifierSet *v31;
  uint64_t v32;
  MPModelSocialPerson *v33;
  MPIdentifierSet *v34;
  void *v35;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*(_WORD *)&self->_requestedSocialPersonProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyPersonName")))
      v13 = 2;
    else
      v13 = 0;
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFFD | v13;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertySocialPersonUncensoredName")))
      v14 = 4;
    else
      v14 = 0;
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFFB | v14;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertySocialPersonHandle")))
      v15 = 8;
    else
      v15 = 0;
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFF7 | v15;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertySocialPersonBiography")))
      v16 = 16;
    else
      v16 = 0;
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFEF | v16;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertySocialPersonArtwork")))
      v17 = 32;
    else
      v17 = 0;
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFDF | v17;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertySocialPersonIsPrivate")))
      v18 = 128;
    else
      v18 = 0;
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFF7F | v18;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertySocialPersonIsVerified")))
      v19 = 64;
    else
      v19 = 0;
    *(_WORD *)&self->_requestedSocialPersonProperties = *(_WORD *)&self->_requestedSocialPersonProperties & 0xFFBF | v19;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertySocialPersonHasLightweightProfile")))
      v20 = 257;
    else
      v20 = 1;
    *(_WORD *)&self->_requestedSocialPersonProperties = v20 | *(_WORD *)&self->_requestedSocialPersonProperties & 0xFEFE;

  }
  objc_msgSend(v8, "storeID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  MPStoreItemMetadataStringNormalizeStoreIDValue(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v22, "length"))
  {
    objc_msgSend(v8, "socialProfileID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MPStoreItemMetadataStringNormalizeStoreIDValue(v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v24;
  }
  v25 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v39[3] = &unk_1E3163A58;
  v26 = v22;
  v40 = v26;
  v27 = (void *)MEMORY[0x19403A810](v39);
  v37[0] = v25;
  v37[1] = 3221225472;
  v37[2] = __99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_3;
  v37[3] = &unk_1E3163AA8;
  v37[4] = self;
  v28 = v8;
  v38 = v28;
  v29 = (void *)MEMORY[0x19403A810](v37);
  if (v9)
  {
    objc_msgSend(v9, "identifiers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (MPIdentifierSet *)objc_msgSend(v30, "copyWithSource:block:", CFSTR("StorePlatform"), v27);
    v32 = objc_msgSend(v9, "copyWithIdentifiers:block:", v31, v29);
  }
  else
  {
    v33 = [MPModelSocialPerson alloc];
    v34 = [MPIdentifierSet alloc];
    +[MPModelSocialPerson kind](MPModelSocialPerson, "kind");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[MPIdentifierSet initWithSource:modelKind:block:](v34, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v30, v27);
    v32 = -[MPModelObject initWithIdentifiers:block:](v33, "initWithIdentifiers:block:", v31, v29);
  }
  v35 = (void *)v32;

  return v35;
}

MPArtworkCatalog *__99__MPStoreModelSocialPersonBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  MPArtworkCatalog *v3;
  void *v4;
  MPArtworkCatalog *v5;

  objc_msgSend(*(id *)(a1 + 32), "avatarArtworkRequestToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "setCropStyle:", CFSTR("sr"));
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
  _QWORD v5[9];

  v5[8] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyPersonName");
  v5[1] = CFSTR("MPModelPropertySocialPersonUncensoredName");
  v5[2] = CFSTR("MPModelPropertySocialPersonHandle");
  v5[3] = CFSTR("MPModelPropertySocialPersonBiography");
  v5[4] = CFSTR("MPModelPropertySocialPersonArtwork");
  v5[5] = CFSTR("MPModelPropertySocialPersonIsPrivate");
  v5[6] = CFSTR("MPModelPropertySocialPersonIsVerified");
  v5[7] = CFSTR("MPModelPropertySocialPersonHasLightweightProfile");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
