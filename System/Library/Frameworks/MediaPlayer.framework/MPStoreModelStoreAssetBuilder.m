@implementation MPStoreModelStoreAssetBuilder

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
  char v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MPModelStoreAsset *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  MPStoreModelStoreAssetBuilder *v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*(_BYTE *)&self->_requestedStoreAssetProperties & 1) == 0)
  {
    -[MPStoreModelObjectBuilder requestedPropertySet](self, "requestedPropertySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyStoreAssetEndpointType")))
      v13 = 2;
    else
      v13 = 0;
    *(_BYTE *)&self->_requestedStoreAssetProperties = *(_BYTE *)&self->_requestedStoreAssetProperties & 0xFD | v13;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyStoreAssetRedownloadParameters")))
      v14 = 4;
    else
      v14 = 0;
    *(_BYTE *)&self->_requestedStoreAssetProperties = *(_BYTE *)&self->_requestedStoreAssetProperties & 0xFB | v14;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyStoreAssetRedownloadable")))
      v15 = 8;
    else
      v15 = 0;
    *(_BYTE *)&self->_requestedStoreAssetProperties = *(_BYTE *)&self->_requestedStoreAssetProperties & 0xF7 | v15;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyStoreAssetAccountIdentifier")))
      v16 = 16;
    else
      v16 = 0;
    *(_BYTE *)&self->_requestedStoreAssetProperties = *(_BYTE *)&self->_requestedStoreAssetProperties & 0xEF | v16;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyStoreAssetShouldReportPlayEvents")))
      v17 = 32;
    else
      v17 = 0;
    *(_BYTE *)&self->_requestedStoreAssetProperties = *(_BYTE *)&self->_requestedStoreAssetProperties & 0xDF | v17;
    if (objc_msgSend(v12, "containsObject:", CFSTR("MPModelPropertyStoreAssetSubscriptionRequired")))
      v18 = 65;
    else
      v18 = 1;
    *(_BYTE *)&self->_requestedStoreAssetProperties = v18 | *(_BYTE *)&self->_requestedStoreAssetProperties & 0xBE;

  }
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __97__MPStoreModelStoreAssetBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke;
  v29 = &unk_1E315AE10;
  v19 = v8;
  v30 = v19;
  v31 = self;
  v20 = (void *)MEMORY[0x19403A810](&v26);
  if (v9)
  {
    objc_msgSend(v9, "identifiers", v26, v27, v28, v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v9, "copyWithIdentifiers:block:", v21, v20);
  }
  else
  {
    v23 = [MPModelStoreAsset alloc];
    +[MPIdentifierSet emptyIdentifierSet](MPIdentifierSet, "emptyIdentifierSet", v26, v27, v28, v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[MPModelObject initWithIdentifiers:block:](v23, "initWithIdentifiers:block:", v21, v20);
  }
  v24 = (void *)v22;

  return v24;
}

void __97__MPStoreModelStoreAssetBuilder_modelObjectWithStoreItemMetadata_sourceModelObject_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "hasSubscriptionOffer");
  v4 = objc_msgSend(*(id *)(a1 + 32), "isStoreRedownloadable");
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 8) != 0
    && (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelPropertyStoreAssetRedownloadable")) & 1) == 0)
  {
    objc_msgSend(v9, "setRedownloadable:", v4);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 2) != 0
    && (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelPropertyStoreAssetEndpointType")) & 1) == 0)
  {
    if ((_DWORD)v4)
      v5 = 3;
    else
      v5 = 0;
    objc_msgSend(v9, "setEndpointType:", v5);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 4) != 0
    && (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelPropertyStoreAssetRedownloadParameters")) & 1) == 0)
  {
    objc_msgSend(v9, "setRedownloadParameters:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 0x10) != 0
    && (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelPropertyStoreAssetAccountIdentifier")) & 1) == 0)
  {
    objc_msgSend(v9, "setAccountIdentifier:", 0);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 0x20) != 0
    && (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelPropertyStoreAssetShouldReportPlayEvents")) & 1) == 0)
  {
    objc_msgSend(v9, "setShouldReportPlayEvents:", objc_msgSend(*(id *)(a1 + 32), "shouldReportPlayEvents"));
  }
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) & 0x40) != 0
    && (objc_msgSend(v9, "hasLoadedValueForKey:", CFSTR("MPModelPropertyStoreAssetSubscriptionRequired")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "videoSubtype");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "itemKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("tvEpisode")))
      v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("tvtrailer")) ^ 1;
    else
      v8 = 1;
    objc_msgSend(v9, "setSubscriptionRequired:", v3 & v8);

  }
}

+ (id)allSupportedProperties
{
  void *v2;
  void *v3;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("MPModelPropertyStoreAssetEndpointType");
  v5[1] = CFSTR("MPModelPropertyStoreAssetRedownloadParameters");
  v5[2] = CFSTR("MPModelPropertyStoreAssetRedownloadable");
  v5[3] = CFSTR("MPModelPropertyStoreAssetAccountIdentifier");
  v5[4] = CFSTR("MPModelPropertyStoreAssetShouldReportPlayEvents");
  v5[5] = CFSTR("MPModelPropertyStoreAssetSubscriptionRequired");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
