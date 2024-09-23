@implementation MPCRadioPlaybackIntentDataSource

- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, MPCModelRadioPlaybackContext *, _QWORD);
  id v6;
  MPCModelRadioPlaybackContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = (void (**)(id, MPCModelRadioPlaybackContext *, _QWORD))a4;
  v6 = a3;
  objc_msgSend(v6, "tracklistToken");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MPCModelRadioPlaybackContext);
  -[MPCModelRadioPlaybackContext setContinueListeningStation:](v7, "setContinueListeningStation:", objc_msgSend(v18, "continueListeningStation"));
  objc_msgSend(v18, "nowPlayingContentReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setNowPlayingContentReference:](v7, "setNowPlayingContentReference:", v8);

  objc_msgSend(v18, "seedContentReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setSeedContentReference:](v7, "setSeedContentReference:", v9);

  objc_msgSend(v18, "radioStationURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setStationURL:](v7, "setStationURL:", v10);

  objc_msgSend(v18, "radioStation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setRadioStation:](v7, "setRadioStation:", v11);

  objc_msgSend(v6, "playActivityRecommendationData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setPlayActivityRecommendationData:](v7, "setPlayActivityRecommendationData:", v12);

  objc_msgSend(v6, "playActivityFeatureName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setPlayActivityFeatureName:](v7, "setPlayActivityFeatureName:", v13);

  objc_msgSend(v6, "queueGroupingID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setPlayActivityQueueGroupingID:](v7, "setPlayActivityQueueGroupingID:", v14);

  -[MPCModelRadioPlaybackContext setActionAfterQueueLoad:](v7, "setActionAfterQueueLoad:", objc_msgSend(v6, "actionAfterQueueLoad"));
  objc_msgSend(v6, "siriAssetInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setSiriAssetInfo:](v7, "setSiriAssetInfo:", v15);

  objc_msgSend(v6, "siriReferenceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelRadioPlaybackContext setSiriReferenceIdentifier:](v7, "setSiriReferenceIdentifier:", v16);

  objc_msgSend(v6, "delegateTokenB");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCModelRadioPlaybackContext setDelegateTokenB:](v7, "setDelegateTokenB:", v17);
  v5[2](v5, v7, 0);

}

@end
