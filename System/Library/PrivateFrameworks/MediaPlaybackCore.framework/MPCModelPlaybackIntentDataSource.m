@implementation MPCModelPlaybackIntentDataSource

- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, MPCModelPlaybackContext *, _QWORD);
  MPCModelPlaybackContext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v5 = (void (**)(id, MPCModelPlaybackContext *, _QWORD))a4;
  v6 = objc_alloc_init(MPCModelPlaybackContext);
  objc_msgSend(v22, "tracklistToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setRequest:](v6, "setRequest:", v8);

  objc_msgSend(v7, "startItemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setStartItemIdentifiers:](v6, "setStartItemIdentifiers:", v9);

  objc_msgSend(v22, "startTimeModifications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setStartTimeModifications:](v6, "setStartTimeModifications:", v10);

  objc_msgSend(v22, "endTimeModifications");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setEndTimeModifications:](v6, "setEndTimeModifications:", v11);

  v12 = objc_msgSend(v22, "shuffleMode");
  if (v12 >= 3)
    v13 = 1000;
  else
    v13 = v12;
  -[MPCModelPlaybackContext setShuffleType:](v6, "setShuffleType:", v13);
  v14 = objc_msgSend(v22, "repeatMode");
  if (v14 > 2)
    v15 = 3;
  else
    v15 = qword_210ED93B8[v14];
  -[MPCModelPlaybackContext setRepeatType:](v6, "setRepeatType:", v15);
  objc_msgSend(v22, "playActivityRecommendationData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityRecommendationData:](v6, "setPlayActivityRecommendationData:", v16);

  objc_msgSend(v22, "playActivityFeatureName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityFeatureName:](v6, "setPlayActivityFeatureName:", v17);

  objc_msgSend(v22, "queueGroupingID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setPlayActivityQueueGroupingID:](v6, "setPlayActivityQueueGroupingID:", v18);

  -[MPCModelPlaybackContext setActionAfterQueueLoad:](v6, "setActionAfterQueueLoad:", objc_msgSend(v22, "actionAfterQueueLoad"));
  objc_msgSend(v22, "siriAssetInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setSiriAssetInfo:](v6, "setSiriAssetInfo:", v19);

  objc_msgSend(v22, "siriReferenceIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setSiriReferenceIdentifier:](v6, "setSiriReferenceIdentifier:", v20);

  objc_msgSend(v22, "delegateTokenB");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCModelPlaybackContext setDelegateTokenB:](v6, "setDelegateTokenB:", v21);

  v5[2](v5, v6, 0);
}

@end
