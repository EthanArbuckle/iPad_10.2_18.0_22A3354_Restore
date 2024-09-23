@implementation MPCModelRadioStationBuilder

- (MPCModelRadioStationBuilder)initWithRequestedProperties:(id)a3
{
  id v4;
  MPCModelRadioStationBuilder *v5;
  uint64_t v6;
  MPPropertySet *requestedProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCModelRadioStationBuilder;
  v5 = -[MPCModelRadioStationBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestedProperties = v5->_requestedProperties;
    v5->_requestedProperties = (MPPropertySet *)v6;

  }
  return v5;
}

- (id)modelRadioStationForMetadata:(id)a3 userIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v31[5];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;

  v6 = a3;
  v7 = a4;
  if ((*(_BYTE *)&self->_requestedRadioStationProperties & 1) == 0)
  {
    -[MPCModelRadioStationBuilder requestedProperties](self, "requestedProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "properties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC008]))
      v10 = 2;
    else
      v10 = 0;
    *(_BYTE *)&self->_requestedRadioStationProperties = *(_BYTE *)&self->_requestedRadioStationProperties & 0xFD | v10;
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC050]))
      v11 = 4;
    else
      v11 = 0;
    *(_BYTE *)&self->_requestedRadioStationProperties = *(_BYTE *)&self->_requestedRadioStationProperties & 0xFB | v11;
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC010]))
      v12 = 8;
    else
      v12 = 0;
    *(_BYTE *)&self->_requestedRadioStationProperties = *(_BYTE *)&self->_requestedRadioStationProperties & 0xF7 | v12;
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC068]))
      v13 = 16;
    else
      v13 = 0;
    *(_BYTE *)&self->_requestedRadioStationProperties = *(_BYTE *)&self->_requestedRadioStationProperties & 0xEF | v13;
    self->_requestedRadioStationProperties.explicit = objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC048]);
    *((_BYTE *)&self->_requestedRadioStationProperties + 8) = *((_BYTE *)&self->_requestedRadioStationProperties + 8) & 0xFE | objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDBFF8]);
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDBFF0]))
      v14 = 2;
    else
      v14 = 0;
    *((_BYTE *)&self->_requestedRadioStationProperties + 8) = *((_BYTE *)&self->_requestedRadioStationProperties + 8) & 0xFD | v14;
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC000]))
      v15 = 4;
    else
      v15 = 0;
    *((_BYTE *)&self->_requestedRadioStationProperties + 8) = *((_BYTE *)&self->_requestedRadioStationProperties + 8) & 0xFB | v15;
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC080]))
      v16 = 8;
    else
      v16 = 0;
    *((_BYTE *)&self->_requestedRadioStationProperties + 8) = *((_BYTE *)&self->_requestedRadioStationProperties + 8) & 0xF7 | v16;
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC078]))
      v17 = 16;
    else
      v17 = 0;
    *((_BYTE *)&self->_requestedRadioStationProperties + 8) = *((_BYTE *)&self->_requestedRadioStationProperties + 8) & 0xEF | v17;
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC070]))
      v18 = 32;
    else
      v18 = 0;
    *((_BYTE *)&self->_requestedRadioStationProperties + 8) = *((_BYTE *)&self->_requestedRadioStationProperties + 8) & 0xDF | v18;
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC060]))
      v19 = 64;
    else
      v19 = 0;
    *((_BYTE *)&self->_requestedRadioStationProperties + 8) = *((_BYTE *)&self->_requestedRadioStationProperties + 8) & 0xBF | v19;
    if (objc_msgSend(v9, "containsObject:", *MEMORY[0x24BDDC058]))
      v20 = 0x80;
    else
      v20 = 0;
    *((_BYTE *)&self->_requestedRadioStationProperties + 8) = v20 & 0x80 | *((_BYTE *)&self->_requestedRadioStationProperties
                                                                           + 8) & 0x7F;
    *(_BYTE *)&self->_requestedRadioStationProperties |= 1u;

  }
  objc_msgSend(v6, "stationStringID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stationHash");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v6, "stationID");
  if (objc_msgSend(v21, "length") || objc_msgSend(v22, "length") | v23)
  {
    v24 = objc_alloc(MEMORY[0x24BDDC988]);
    v25 = objc_alloc(MEMORY[0x24BDDC758]);
    objc_msgSend(MEMORY[0x24BDDC990], "identityKind");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke;
    v33[3] = &unk_24CAB38F8;
    v34 = v7;
    v35 = v21;
    v36 = v22;
    v37 = v23;
    v28 = (void *)objc_msgSend(v25, "initWithSource:modelKind:block:", CFSTR("StorePlatform"), v26, v33);
    v31[0] = v27;
    v31[1] = 3221225472;
    v31[2] = __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_4;
    v31[3] = &unk_24CAB3948;
    v31[4] = self;
    v32 = v6;
    v29 = (void *)objc_msgSend(v24, "initWithIdentifiers:block:", v28, v31);

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (MPPropertySet)requestedProperties
{
  return self->_requestedProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedProperties, 0);
}

void __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "accountDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonalStoreIdentifiersWithPersonID:block:", v5, &__block_literal_global_5758);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_3;
  v8[3] = &unk_24CAB38D0;
  v9 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v4, "setRadioIdentifiersWithBlock:", v8);

}

void __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(v5 + 8);
  if ((v6 & 2) != 0)
  {
    objc_msgSend(v3, "setBeats1:", 0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_BYTE *)(v5 + 8);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)(v5 + 8) & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 40), "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v9);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(v5 + 8);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 40), "descriptionText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditorNotes:", v10);

  v5 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v5 + 8) & 0x10) != 0)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "descriptionText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShortEditorNotes:", v7);

    v5 = *(_QWORD *)(a1 + 32);
  }
LABEL_6:
  if (*(_DWORD *)(v5 + 12))
  {
    objc_msgSend(v4, "setHasExplicitContent:", 0);
    v5 = *(_QWORD *)(a1 + 32);
  }
  v8 = *(_BYTE *)(v5 + 16);
  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "artworkInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "responseDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v11, "responseArray");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v14 = v15;
      }
      else
      {
        objc_msgSend(v11, "artworkURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "absoluteString");
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_5;
    v28[3] = &unk_24CAB3920;
    v29 = v14;
    v18 = v14;
    objc_msgSend(v4, "setArtworkCatalogBlock:", v28);

    v5 = *(_QWORD *)(a1 + 32);
    v8 = *(_BYTE *)(v5 + 16);
    if ((v8 & 2) == 0)
    {
LABEL_10:
      if ((v8 & 4) == 0)
        goto LABEL_11;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)(v5 + 16) & 2) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v4, "setAllowsItemLiking:", objc_msgSend(*(id *)(a1 + 40), "allowsItemLiking"));
  v5 = *(_QWORD *)(a1 + 32);
  v8 = *(_BYTE *)(v5 + 16);
  if ((v8 & 4) == 0)
  {
LABEL_11:
    if ((v8 & 8) == 0)
      goto LABEL_30;
LABEL_26:
    v20 = objc_msgSend(*(id *)(a1 + 40), "type") - 1;
    if (v20 > 9)
      v21 = 0;
    else
      v21 = qword_210ED92D0[v20];
    objc_msgSend(v4, "setType:", v21);
    v5 = *(_QWORD *)(a1 + 32);
    goto LABEL_30;
  }
LABEL_25:
  objc_msgSend(*(id *)(a1 + 40), "attributionLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributionLabel:", v19);

  v5 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v5 + 16) & 8) != 0)
    goto LABEL_26;
LABEL_30:
  if ((*(_BYTE *)(v5 + 16) & 0x10) != 0)
  {
    v22 = objc_msgSend(*(id *)(a1 + 40), "subtype");
    if (v22 <= 2)
      objc_msgSend(v4, "setSubtype:", v22);
  }
  v23 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16);
  if ((v23 & 0x20) == 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) & 0x40) == 0)
      goto LABEL_35;
LABEL_38:
    objc_msgSend(*(id *)(a1 + 40), "providerResource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "url");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProviderUniversalLink:", v25);

    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) & 0x80) == 0)
      goto LABEL_36;
LABEL_39:
    objc_msgSend(*(id *)(a1 + 40), "providerResource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProviderBundleIdentifier:", v27);

    goto LABEL_36;
  }
  objc_msgSend(v4, "setSubscriptionRequired:", objc_msgSend(*(id *)(a1 + 40), "isSubscriptionRequired"));
  v23 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16);
  if ((v23 & 0x40) != 0)
    goto LABEL_38;
LABEL_35:
  if (v23 < 0)
    goto LABEL_39;
LABEL_36:
  objc_msgSend(v4, "setContainsVideo:", objc_msgSend(*(id *)(a1 + 40), "containsVideo"));

}

id __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDDCC40], "artworkRequestTokenForStorePlatformArtworkValue:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = objc_alloc(MEMORY[0x24BDDC6D8]);
    objc_msgSend(MEMORY[0x24BDDCC00], "sharedStoreArtworkDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithToken:dataSource:", v1, v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __73__MPCModelRadioStationBuilder_modelRadioStationForMetadata_userIdentity___block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setStationStringID:", v3);
  objc_msgSend(v4, "setStationHash:", a1[5]);
  objc_msgSend(v4, "setStationID:", a1[6]);

}

@end
