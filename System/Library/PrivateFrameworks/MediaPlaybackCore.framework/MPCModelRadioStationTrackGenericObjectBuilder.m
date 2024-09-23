@implementation MPCModelRadioStationTrackGenericObjectBuilder

- (MPCModelRadioStationTrackGenericObjectBuilder)initWithRequestedProperties:(id)a3
{
  id v4;
  MPCModelRadioStationTrackGenericObjectBuilder *v5;
  uint64_t v6;
  MPPropertySet *requestedProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCModelRadioStationTrackGenericObjectBuilder;
  v5 = -[MPCModelRadioStationTrackGenericObjectBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestedProperties = v5->_requestedProperties;
    v5->_requestedProperties = (MPPropertySet *)v6;

  }
  return v5;
}

- (id)genericObjectForRadioStationTrack:(id)a3 radioStationContainsVideo:(BOOL)a4 containerUniqueID:(id)a5 userIdentity:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  MPModelStorePlatformMetadataGenericObjectBuilder *v15;
  MPModelStorePlatformMetadataGenericObjectBuilder *storePlatformBuilder;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD v45[5];
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!self->_storePlatformBuilder)
  {
    v13 = objc_alloc(MEMORY[0x24BDDCA20]);
    -[MPCModelRadioStationTrackGenericObjectBuilder requestedProperties](self, "requestedProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (MPModelStorePlatformMetadataGenericObjectBuilder *)objc_msgSend(v13, "initWithRequestedProperties:", v14);
    storePlatformBuilder = self->_storePlatformBuilder;
    self->_storePlatformBuilder = v15;

  }
  if ((*(_BYTE *)&self->_requestedSongProperties & 1) == 0)
  {
    -[MPCModelRadioStationTrackGenericObjectBuilder requestedProperties](self, "requestedProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "relationships");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BDDC2F8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "properties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "containsObject:", *MEMORY[0x24BDDC168]))
      v21 = 2;
    else
      v21 = 0;
    *(_BYTE *)&self->_requestedSongProperties = *(_BYTE *)&self->_requestedSongProperties & 0xFD | v21;

    objc_msgSend(v19, "properties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "containsObject:", *MEMORY[0x24BDDCD28]))
      v23 = 4;
    else
      v23 = 0;
    *(_BYTE *)&self->_requestedSongProperties = *(_BYTE *)&self->_requestedSongProperties & 0xFB | v23;

    objc_msgSend(v19, "relationships");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", *MEMORY[0x24BDDC3B0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      *(_BYTE *)&self->_requestedSongProperties.playbackPosition |= 1u;
      objc_msgSend(v25, "properties");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "containsObject:", *MEMORY[0x24BDDBEE0]))
        v28 = 2;
      else
        v28 = 0;
      *(_BYTE *)&self->_requestedSongProperties.playbackPosition = *(_BYTE *)&self->_requestedSongProperties.playbackPosition & 0xFD | v28;
      if (objc_msgSend(v27, "containsObject:", *MEMORY[0x24BDDBEF0]))
        v29 = 4;
      else
        v29 = 0;
      *(_BYTE *)&self->_requestedSongProperties.playbackPosition = *(_BYTE *)&self->_requestedSongProperties.playbackPosition & 0xFB | v29;
      if (objc_msgSend(v27, "containsObject:", *MEMORY[0x24BDDBEE8]))
        v30 = 8;
      else
        v30 = 0;
      *(_BYTE *)&self->_requestedSongProperties.playbackPosition = *(_BYTE *)&self->_requestedSongProperties.playbackPosition & 0xF7 | v30;
      if (objc_msgSend(v27, "containsObject:", *MEMORY[0x24BDDBEF8]))
        v31 = 16;
      else
        v31 = 0;
      *(_BYTE *)&self->_requestedSongProperties.playbackPosition = *(_BYTE *)&self->_requestedSongProperties.playbackPosition & 0xEF | v31;
      if (objc_msgSend(v27, "containsObject:", *MEMORY[0x24BDDBF00]))
        v32 = 32;
      else
        v32 = 0;
      *(_BYTE *)&self->_requestedSongProperties.playbackPosition = *(_BYTE *)&self->_requestedSongProperties.playbackPosition & 0xDF | v32;
      if (objc_msgSend(v27, "containsObject:", *MEMORY[0x24BDDBF08]))
        v33 = 64;
      else
        v33 = 0;
      *(_BYTE *)&self->_requestedSongProperties.playbackPosition = *(_BYTE *)&self->_requestedSongProperties.playbackPosition & 0xBF | v33;
      if (objc_msgSend(v27, "containsObject:", *MEMORY[0x24BDDBF10]))
        v34 = 0x80;
      else
        v34 = 0;
      *(_BYTE *)&self->_requestedSongProperties.playbackPosition = v34 & 0x80 | *(_BYTE *)&self->_requestedSongProperties.playbackPosition & 0x7F;

    }
    *(_BYTE *)&self->_requestedSongProperties |= 1u;

  }
  objc_msgSend(v10, "storePlatformMetadata");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    -[MPModelStorePlatformMetadataGenericObjectBuilder genericObjectForStorePlatformMetadata:radioStationContainsVideo:userIdentity:](self->_storePlatformBuilder, "genericObjectForStorePlatformMetadata:radioStationContainsVideo:userIdentity:", v35, v8, v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  if (objc_msgSend(v36, "type") == 1 && (*(_BYTE *)&self->_requestedSongProperties.playbackPosition & 1) != 0)
  {
    objc_msgSend(v36, "song");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "identifiers");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke;
    v47[3] = &unk_24CAB2F30;
    v48 = v11;
    v39 = v10;
    v49 = v39;
    v50 = v35;
    v51 = v12;
    v40 = (void *)objc_msgSend(v38, "copyWithSource:block:", CFSTR("RadioStationTrack"), v47);

    objc_msgSend(v36, "song");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_4;
    v45[3] = &unk_24CAB2F80;
    v45[4] = self;
    v46 = v39;
    v42 = (void *)objc_msgSend(v41, "copyWithIdentifiers:block:", v40, v45);

    objc_msgSend(MEMORY[0x24BDDC890], "genericObjectWithModelObject:", v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v43;
  }

  return v36;
}

- (MPPropertySet)requestedProperties
{
  return self->_requestedProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedProperties, 0);
  objc_storeStrong((id *)&self->_storePlatformBuilder, 0);
}

void __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v5 = a2;
  objc_msgSend(v5, "setContainerUniqueID:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_2;
  v6[3] = &unk_24CAB2EE8;
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "setUniversalStoreIdentifiersWithBlock:", v6);
  objc_msgSend(*(id *)(a1 + 56), "accountDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 56), "accountDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPersonalStoreIdentifiersWithPersonID:block:", v4, &__block_literal_global_3710);

  }
}

void __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_4(uint64_t a1, void *a2)
{
  char v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v8 = a2;
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(v8, "setTrackNumber:", 0);
    v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16);
  }
  if ((v3 & 4) != 0)
    objc_msgSend(v8, "setTrackCount:", 0);
  v4 = objc_alloc(MEMORY[0x24BDDC940]);
  objc_msgSend(MEMORY[0x24BDDC758], "emptyIdentifierSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_5;
  v9[3] = &unk_24CAB2F58;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v7 = (void *)objc_msgSend(v4, "initWithIdentifiers:block:", v5, v9);

  objc_msgSend(v8, "setPlaybackPosition:", v7);
}

void __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_5(uint64_t a1, void *a2)
{
  char v3;
  id v4;

  v4 = a2;
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "startTime");
    objc_msgSend(v4, "setBookmarkTime:");
    v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "setHasBeenPlayed:", 0);
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v4, "setShouldRememberBookmarkTime:", 0);
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v4, "setUserPlayCount:", 0);
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(v4, "setStopTime:", 0);
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v4, "setStartTime:", 0.0);
  v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20);
  if ((v3 & 0x20) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v3 & 0x40) != 0)
LABEL_8:
    objc_msgSend(v4, "setStoreUbiquitousIdentifier:", 0);
LABEL_9:

}

void __140__MPCModelRadioStationTrackGenericObjectBuilder_genericObjectForRadioStationTrack_radioStationContainsVideo_containerUniqueID_userIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "storeAdamID");
  objc_msgSend(v6, "setAdamID:", v3);
  objc_msgSend(*(id *)(a1 + 40), "formerStoreAdamIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v6, "setFormerAdamIDs:", v4);
  objc_msgSend(*(id *)(a1 + 40), "offerWithType:", *MEMORY[0x24BEC86B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "setSubscriptionAdamID:", v3);

}

@end
