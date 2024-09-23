@implementation MPCModelRadioPersonalizationRequest

- (MPCModelRadioPersonalizationRequest)init
{
  id v3;
  MPCModelRadioPersonalizationRequest *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDDCBB0]);
  v4 = -[MPCModelRadioPersonalizationRequest initWithRadioStationTracks:](self, "initWithRadioStationTracks:", v3);

  return v4;
}

- (MPCModelRadioPersonalizationRequest)initWithRadioStationTracks:(id)a3
{
  id v4;
  MPCModelRadioPersonalizationRequest *v5;
  uint64_t v6;
  MPSectionedCollection *radioStationTracks;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPCModelRadioPersonalizationRequest;
  v5 = -[MPCModelRadioPersonalizationRequest init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    radioStationTracks = v5->_radioStationTracks;
    v5->_radioStationTracks = (MPSectionedCollection *)v6;

    objc_msgSend(MEMORY[0x24BDDC9D8], "kindWithVariants:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDDC890];
    v15 = *MEMORY[0x24BDDC2F8];
    v16[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "kindWithRelationshipKinds:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPersonalizationRequest setItemKind:](v5, "setItemKind:", v11);

    objc_msgSend(MEMORY[0x24BDDC990], "identityKind");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPersonalizationRequest setSectionKind:](v5, "setSectionKind:", v12);

  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[6];
  id v15;
  os_signpost_id_t v16;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v6 = os_signpost_id_make_with_pointer(v5, self);

  if (-[MPCModelRadioPersonalizationRequest analyticsSignpostsEnabled](self, "analyticsSignpostsEnabled"))
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ModelRadioPersonalizationRequest", ", buf, 2u);
    }

  }
  v9 = (void *)-[MPCModelRadioPersonalizationRequest copy](self, "copy");
  v10 = objc_alloc(MEMORY[0x24BDDC6F0]);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke;
  v14[3] = &unk_24CABACD0;
  v14[4] = v9;
  v14[5] = self;
  v15 = v4;
  v16 = v6;
  v11 = v4;
  v12 = (void *)objc_msgSend(v10, "initWithStartHandler:", v14);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPCModelRadioPersonalizationRequest;
  v5 = -[MPCModelRadioPersonalizationRequest copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[MPSectionedCollection copyWithZone:](self->_radioStationTracks, "copyWithZone:", a3);
    v7 = (void *)v5[8];
    v5[8] = v6;

  }
  return v5;
}

- (BOOL)analyticsSignpostsEnabled
{
  return self->_analyticsSignpostsEnabled;
}

- (void)setAnalyticsSignpostsEnabled:(BOOL)a3
{
  self->_analyticsSignpostsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioStationTracks, 0);
}

void __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  MPCModelRadioStationTrackGenericObjectBuilder *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  int8x16_t v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[7];
  id v28;
  MPCModelRadioStationTrackGenericObjectBuilder *v29;
  id v30;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "modelClass");

  objc_msgSend(*(id *)(a1 + 32), "itemProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "requiredStoreLibraryPersonalizationProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertySetByCombiningWithPropertySet:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  v9 = -[MPCModelRadioStationTrackGenericObjectBuilder initWithRequestedProperties:]([MPCModelRadioStationTrackGenericObjectBuilder alloc], "initWithRequestedProperties:", v6);
  v10 = (void *)MEMORY[0x24BDD14E0];
  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v11, "totalItemCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  v14 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  v15 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_2;
  v27[3] = &unk_24CAB53E0;
  v27[4] = v13;
  v27[5] = v14;
  v27[6] = v11;
  v28 = v12;
  v29 = v9;
  v16 = v3;
  v30 = v16;
  v17 = v12;
  objc_msgSend(v11, "enumerateSectionsUsingBlock:", v27);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC60]), "initWithUnpersonalizedRequest:unpersonalizedContentDescriptors:", *(_QWORD *)(a1 + 32), v13);
  objc_msgSend(v18, "setRepresentedObjects:", v14);
  objc_msgSend(v18, "setMatchAlbumArtistsOnNameAndStoreID:", 0);
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_6;
  v22[3] = &unk_24CAB5408;
  v19 = *(id *)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 56);
  v25 = v19;
  v26 = v20;
  v23 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v24 = v16;
  v21 = v16;
  objc_msgSend(v18, "performWithResponseHandler:", v22);

}

void __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  __int128 v16;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendSection:", v5);
  objc_msgSend(*(id *)(a1 + 40), "appendSection:", v5);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_3;
  v11[3] = &unk_24CAB53B8;
  v6 = *(void **)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(void **)(a1 + 72);
  v12 = v7;
  v13 = v8;
  v14 = v5;
  v15 = v9;
  v16 = *(_OWORD *)(a1 + 32);
  v10 = v5;
  objc_msgSend(v6, "enumerateItemsInSectionAtIndex:usingBlock:", a3, v11);

}

void __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  MPCModelRadioPersonalizationResponse *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  os_signpost_id_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = -[MPCModelRadioPersonalizationResponse initWithRequest:personalizationResponse:]([MPCModelRadioPersonalizationResponse alloc], "initWithRequest:personalizationResponse:", *(_QWORD *)(a1 + 40), v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (objc_msgSend(*(id *)(a1 + 32), "analyticsSignpostsEnabled"))
    {
      v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      v9 = v8;
      v10 = *(_QWORD *)(a1 + 64);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        LOWORD(v13) = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v9, OS_SIGNPOST_INTERVAL_END, v10, "ModelRadioPersonalizationRequest", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
      }

    }
LABEL_11:

    goto LABEL_12;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (objc_msgSend(*(id *)(a1 + 32), "analyticsSignpostsEnabled"))
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    v7 = (MPCModelRadioPersonalizationResponse *)v11;
    v12 = *(_QWORD *)(a1 + 64);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v13 = 138543362;
      v14 = v6;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, &v7->super.super, OS_SIGNPOST_INTERVAL_END, v12, "ModelRadioPersonalizationRequest", "error=%{public}@", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v6);

}

void __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  v14 = a2;
  v3 = objc_msgSend(v14, "storeAdamID");
  v4 = objc_alloc(MEMORY[0x24BDDC758]);
  objc_msgSend(MEMORY[0x24BDDC9E0], "identityKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_4;
  v15[3] = &__block_descriptor_40_e49_v16__0__MPIdentifierSet_MPMutableIdentifierSet__8l;
  v15[4] = v3;
  v6 = (void *)objc_msgSend(v4, "initWithSource:modelKind:block:", CFSTR("RadioPersonalization"), v5, v15);

  MPContainerUniqueIDPrefix();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x212BD17DC](v7, objc_msgSend(*(id *)(a1 + 32), "countForObject:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  v9 = *(void **)(a1 + 40);
  v10 = objc_msgSend(*(id *)(a1 + 48), "containsVideo");
  objc_msgSend(*(id *)(a1 + 56), "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "genericObjectForRadioStationTrack:radioStationContainsVideo:containerUniqueID:userIdentity:", v14, v10, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCC58]), "initWithModel:personalizationStyle:", v12, 1);
    objc_msgSend(*(id *)(a1 + 64), "appendItem:", v13);
    objc_msgSend(*(id *)(a1 + 72), "appendItem:", v14);

  }
}

uint64_t __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_4(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_5;
  v3[3] = &__block_descriptor_40_e46_v16__0___MPMutableUniversalStoreIdentifiers__8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setUniversalStoreIdentifiersWithBlock:", v3);
}

uint64_t __71__MPCModelRadioPersonalizationRequest_newOperationWithResponseHandler___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSubscriptionAdamID:", *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

+ (BOOL)requiresNetwork
{
  return 0;
}

@end
