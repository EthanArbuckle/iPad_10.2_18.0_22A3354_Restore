@implementation MPRadioStationRemotePlaybackQueue(MPCAdditions)

- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:
{
  void (**v5)(id, MPCModelRadioPlaybackContext *, _QWORD);
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MPCModelRadioPlaybackContext *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v5 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v6 = objc_alloc(MEMORY[0x24BDDC988]);
  v7 = objc_alloc(MEMORY[0x24BDDC758]);
  objc_msgSend(MEMORY[0x24BDDC990], "identityKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __97__MPRadioStationRemotePlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke;
  v22[3] = &unk_24CAB7EB8;
  v22[4] = a1;
  v22[5] = &v23;
  v9 = (void *)objc_msgSend(v7, "initWithSource:modelKind:block:", CFSTR("MRQueue-Radio"), v8, v22);
  v10 = (void *)objc_msgSend(v6, "initWithIdentifiers:block:", v9, &__block_literal_global_127);

  if (*((_BYTE *)v24 + 24))
  {
    v11 = objc_alloc_init(MPCModelRadioPlaybackContext);
    objc_msgSend(a1, "siriReferenceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setSiriReferenceIdentifier:](v11, "setSiriReferenceIdentifier:", v12);

    -[MPCModelRadioPlaybackContext setRadioStation:](v11, "setRadioStation:", v10);
    if (objc_msgSend(a1, "isRequestingImmediatePlayback"))
      v13 = 20;
    else
      v13 = 0;
    -[MPCModelRadioPlaybackContext setActionAfterQueueLoad:](v11, "setActionAfterQueueLoad:", v13);
    objc_msgSend(a1, "siriRecommendationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setPlayActivityRecommendationData:](v11, "setPlayActivityRecommendationData:", v15);

    objc_msgSend(a1, "siriAssetInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setSiriAssetInfo:](v11, "setSiriAssetInfo:", v16);

    objc_msgSend(a1, "featureName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setPlayActivityFeatureName:](v11, "setPlayActivityFeatureName:", v17);

    objc_msgSend(a1, "queueGroupingID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setPlayActivityQueueGroupingID:](v11, "setPlayActivityQueueGroupingID:", v18);

    objc_msgSend(a1, "siriWHAMetricsInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setSiriWHAMetricsInfo:](v11, "setSiriWHAMetricsInfo:", v19);

    objc_msgSend(a1, "privateListeningOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setPrivateListeningOverride:](v11, "setPrivateListeningOverride:", v20);

    objc_msgSend(a1, "userIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelRadioPlaybackContext setUserIdentity:](v11, "setUserIdentity:", v21);

    v5[2](v5, v11, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 3000, CFSTR("Missing both station string ID and station ID queue %@"), a1);
    v11 = (MPCModelRadioPlaybackContext *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, MPCModelRadioPlaybackContext *, MPCModelRadioPlaybackContext *))v5)[2](v5, 0, v11);
  }

  _Block_object_dispose(&v23, 8);
}

@end
