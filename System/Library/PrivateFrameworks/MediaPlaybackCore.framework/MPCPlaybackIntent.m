@implementation MPCPlaybackIntent

- (void)setShuffleMode:(int64_t)a3
{
  self->_shuffleMode = a3;
}

- (void)setTracklistToken:(id)a3
{
  objc_storeStrong((id *)&self->_tracklistToken, a3);
}

- (void)setTracklistSource:(int64_t)a3
{
  self->_tracklistSource = a3;
}

- (MPCPlaybackIntent)init
{
  MPCPlaybackIntent *v2;
  MPCPlaybackIntent *v3;
  NSDictionary *startTimeModifications;
  NSDictionary *v5;
  NSDictionary *endTimeModifications;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCPlaybackIntent;
  v2 = -[MPCPlaybackIntent init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shuffleMode = -1;
    v2->_repeatMode = -1;
    v2->_actionAfterQueueLoad = 20;
    startTimeModifications = v2->_startTimeModifications;
    v5 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    v2->_startTimeModifications = (NSDictionary *)MEMORY[0x24BDBD1B8];

    endTimeModifications = v3->_endTimeModifications;
    v3->_endTimeModifications = v5;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MPCPlaybackIntent;
  -[MPCPlaybackIntent description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_tracklistSource);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR(" source=%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertString:atIndex:", v7, objc_msgSend(v4, "length") - 1);

  return v4;
}

- (MPCPlaybackIntentDataSource)tracklistDataSource
{
  MPCPlaybackIntentDataSource *resolvedTracklistDataSource;
  MPCPlaybackIntentDataSource *v4;
  MPCPlaybackIntentDataSource *v5;

  resolvedTracklistDataSource = self->_resolvedTracklistDataSource;
  if (!resolvedTracklistDataSource)
  {
    objc_msgSend((id)objc_opt_class(), "tracklistDataSourceForSource:", self->_tracklistSource);
    v4 = (MPCPlaybackIntentDataSource *)objc_claimAutoreleasedReturnValue();
    v5 = self->_resolvedTracklistDataSource;
    self->_resolvedTracklistDataSource = v4;

    resolvedTracklistDataSource = self->_resolvedTracklistDataSource;
  }
  return resolvedTracklistDataSource;
}

- (void)getRemotePlaybackQueueDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__MPCPlaybackIntent_getRemotePlaybackQueueDataWithCompletion___block_invoke;
  v6[3] = &unk_24CAB3788;
  v7 = v4;
  v5 = v4;
  -[MPCPlaybackIntent getRemotePlaybackQueueWithDestination:completion:](self, "getRemotePlaybackQueueWithDestination:completion:", 3, v6);

}

- (void)getRemotePlaybackQueueWithDestination:(int64_t)a3 completion:(id)a4
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackIntent.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[MPCPlaybackIntent tracklistDataSource](self, "tracklistDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "forcedIntentDestination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = objc_msgSend(v10, "intValue");
      if (v11 && v11 <= 3)
      {
        v13 = v11;
        a3 = v11;
        v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v18 = v13;
          _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, "Using overridden playback destination from defaults: %d", buf, 8u);
        }

      }
    }
    objc_msgSend(v8, "getRemotePlaybackQueueFromIntent:destination:completion:", self, a3, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v15);

  }
}

- (void)getRepresentativeObjectWithProperties:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackIntent.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[MPCPlaybackIntent tracklistDataSource](self, "tracklistDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __70__MPCPlaybackIntent_getRepresentativeObjectWithProperties_completion___block_invoke;
    v12[3] = &unk_24CAB37B0;
    v13 = v8;
    objc_msgSend(v9, "getRepresentativeObjectFromIntent:properties:completion:", self, v7, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v10);

  }
}

- (void)getArchiveWithConfiguration:(id)a3 completion:(id)a4
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackIntent.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[MPCPlaybackIntent tracklistDataSource](self, "tracklistDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "getArchiveFromIntent:configuration:completion:", self, v11, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);

  }
}

- (MPCPlaybackSharedListeningProperties)sharedListeningProperties
{
  void *v3;
  void *v4;

  if (-[MPCPlaybackIntent tracklistSource](self, "tracklistSource") == 100)
  {
    -[MPCPlaybackIntent tracklistToken](self, "tracklistToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedListeningProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (MPCPlaybackSharedListeningProperties *)v4;
}

- (NSDictionary)startTimeModifications
{
  return self->_startTimeModifications;
}

- (void)setStartTimeModifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)endTimeModifications
{
  return self->_endTimeModifications;
}

- (void)setEndTimeModifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)actionAfterQueueLoad
{
  return self->_actionAfterQueueLoad;
}

- (void)setActionAfterQueueLoad:(int64_t)a3
{
  self->_actionAfterQueueLoad = a3;
}

- (int64_t)shuffleMode
{
  return self->_shuffleMode;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (void)setRepeatMode:(int64_t)a3
{
  self->_repeatMode = a3;
}

- (NSNumber)privateListeningOverride
{
  return self->_privateListeningOverride;
}

- (void)setPrivateListeningOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)queueGroupingID
{
  return self->_queueGroupingID;
}

- (void)setQueueGroupingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)playActivityFeatureName
{
  return self->_playActivityFeatureName;
}

- (void)setPlayActivityFeatureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)playActivityRecommendationData
{
  return self->_playActivityRecommendationData;
}

- (void)setPlayActivityRecommendationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)siriAssetInfo
{
  return self->_siriAssetInfo;
}

- (void)setSiriAssetInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)siriReferenceIdentifier
{
  return self->_siriReferenceIdentifier;
}

- (void)setSiriReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)delegateTokenB
{
  return self->_delegateTokenB;
}

- (void)setDelegateTokenB:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)tracklistSource
{
  return self->_tracklistSource;
}

- (NSSecureCoding)tracklistToken
{
  return self->_tracklistToken;
}

- (BOOL)prefersEnqueuingUsingAirPlay
{
  return self->_prefersEnqueuingUsingAirPlay;
}

- (void)setPrefersEnqueuingUsingAirPlay:(BOOL)a3
{
  self->_prefersEnqueuingUsingAirPlay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracklistToken, 0);
  objc_storeStrong((id *)&self->_delegateTokenB, 0);
  objc_storeStrong((id *)&self->_siriReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_playActivityRecommendationData, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_privateListeningOverride, 0);
  objc_storeStrong((id *)&self->_endTimeModifications, 0);
  objc_storeStrong((id *)&self->_startTimeModifications, 0);
  objc_storeStrong((id *)&self->_resolvedTracklistDataSource, 0);
}

uint64_t __70__MPCPlaybackIntent_getRepresentativeObjectWithProperties_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__MPCPlaybackIntent_getRemotePlaybackQueueDataWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *ExternalRepresentation;
  id v9;

  v9 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC87B0]), "initWithName:", CFSTR("com.apple.amp.MPCPlaybackIntent.MediaSuggestion"));
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 60.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExpirationDate:", v6);

    objc_msgSend(MEMORY[0x24BEC87A8], "sharedService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAssertion:", v5);

    objc_msgSend(objc_retainAutorelease(v9), "_mediaRemotePlaybackQueue");
    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (id)intentFromModelRequest:(id)a3
{
  id v3;
  MPCPlaybackIntent *v4;
  MPCModelPlaybackIntentTracklistToken *v5;

  v3 = a3;
  v4 = objc_alloc_init(MPCPlaybackIntent);
  v5 = objc_alloc_init(MPCModelPlaybackIntentTracklistToken);
  -[MPCModelPlaybackIntentTracklistToken setRequest:](v5, "setRequest:", v3);

  -[MPCPlaybackIntent setTracklistToken:](v4, "setTracklistToken:", v5);
  -[MPCPlaybackIntent setTracklistSource:](v4, "setTracklistSource:", 3);

  return v4;
}

+ (id)intentFromQueueDescriptor:(id)a3
{
  id v3;
  MPCPlaybackIntent *v4;

  v3 = a3;
  v4 = objc_alloc_init(MPCPlaybackIntent);
  -[MPCPlaybackIntent setTracklistToken:](v4, "setTracklistToken:", v3);

  -[MPCPlaybackIntent setTracklistSource:](v4, "setTracklistSource:", 4);
  return v4;
}

+ (id)continueListeningRadioPlaybackIntent
{
  MPCRadioPlaybackIntentTracklistToken *v2;
  MPCPlaybackIntent *v3;

  v2 = objc_alloc_init(MPCRadioPlaybackIntentTracklistToken);
  -[MPCRadioPlaybackIntentTracklistToken setContinueListeningStation:](v2, "setContinueListeningStation:", 1);
  v3 = objc_alloc_init(MPCPlaybackIntent);
  -[MPCPlaybackIntent setTracklistSource:](v3, "setTracklistSource:", 1);
  -[MPCPlaybackIntent setTracklistToken:](v3, "setTracklistToken:", v2);
  -[MPCPlaybackIntent setPlayActivityFeatureName:](v3, "setPlayActivityFeatureName:", CFSTR("now_playing"));

  return v3;
}

+ (id)radioPlaybackIntentFromReference:(id)a3
{
  id v3;
  MPCRadioPlaybackIntentTracklistToken *v4;
  MPCPlaybackIntent *v5;

  v3 = a3;
  v4 = objc_alloc_init(MPCRadioPlaybackIntentTracklistToken);
  -[MPCRadioPlaybackIntentTracklistToken setSeedContentReference:](v4, "setSeedContentReference:", v3);

  v5 = objc_alloc_init(MPCPlaybackIntent);
  -[MPCPlaybackIntent setTracklistSource:](v5, "setTracklistSource:", 1);
  -[MPCPlaybackIntent setTracklistToken:](v5, "setTracklistToken:", v4);

  return v5;
}

+ (id)radioPlaybackIntentFromAlbum:(id)a3
{
  void *v4;
  void *v5;

  +[MPCModelRadioContentReference referenceWithMPModelObject:](MPCModelRadioContentReference, "referenceWithMPModelObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "radioPlaybackIntentFromReference:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)radioPlaybackIntentFromArtist:(id)a3
{
  void *v4;
  void *v5;

  +[MPCModelRadioContentReference referenceWithMPModelObject:](MPCModelRadioContentReference, "referenceWithMPModelObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "radioPlaybackIntentFromReference:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)radioPlaybackIntentFromSong:(id)a3
{
  void *v4;
  void *v5;

  +[MPCModelRadioContentReference referenceWithMPModelObject:](MPCModelRadioContentReference, "referenceWithMPModelObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "radioPlaybackIntentFromReference:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)radioPlaybackIntentWithStation:(id)a3
{
  id v3;
  MPCRadioPlaybackIntentTracklistToken *v4;
  MPCPlaybackIntent *v5;

  v3 = a3;
  v4 = objc_alloc_init(MPCRadioPlaybackIntentTracklistToken);
  -[MPCRadioPlaybackIntentTracklistToken setRadioStation:](v4, "setRadioStation:", v3);

  v5 = objc_alloc_init(MPCPlaybackIntent);
  -[MPCPlaybackIntent setTracklistSource:](v5, "setTracklistSource:", 1);
  -[MPCPlaybackIntent setTracklistToken:](v5, "setTracklistToken:", v4);

  return v5;
}

+ (id)radioPlaybackIntentWithStationStringID:(id)a3
{
  id v3;
  MPCRadioPlaybackIntentTracklistToken *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  MPCPlaybackIntent *v11;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  v4 = objc_alloc_init(MPCRadioPlaybackIntentTracklistToken);
  v5 = objc_alloc(MEMORY[0x24BDDC988]);
  v6 = objc_alloc(MEMORY[0x24BDDC758]);
  objc_msgSend(MEMORY[0x24BDDC990], "identityKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__MPCPlaybackIntent_radioPlaybackIntentWithStationStringID___block_invoke;
  v13[3] = &unk_24CAB8A40;
  v14 = v3;
  v8 = v3;
  v9 = (void *)objc_msgSend(v6, "initWithSource:modelKind:block:", CFSTR("MPCPlaybackIntent"), v7, v13);
  v10 = (void *)objc_msgSend(v5, "initWithIdentifiers:block:", v9, &__block_literal_global_5371);
  -[MPCRadioPlaybackIntentTracklistToken setRadioStation:](v4, "setRadioStation:", v10);

  v11 = objc_alloc_init(MPCPlaybackIntent);
  -[MPCPlaybackIntent setTracklistSource:](v11, "setTracklistSource:", 1);
  -[MPCPlaybackIntent setTracklistToken:](v11, "setTracklistToken:", v4);

  return v11;
}

+ (id)radioPlaybackIntentWithStationURL:(id)a3
{
  id v3;
  MPCRadioPlaybackIntentTracklistToken *v4;
  MPCPlaybackIntent *v5;

  v3 = a3;
  v4 = objc_alloc_init(MPCRadioPlaybackIntentTracklistToken);
  -[MPCRadioPlaybackIntentTracklistToken setRadioStationURL:](v4, "setRadioStationURL:", v3);

  v5 = objc_alloc_init(MPCPlaybackIntent);
  -[MPCPlaybackIntent setTracklistSource:](v5, "setTracklistSource:", 1);
  -[MPCPlaybackIntent setTracklistToken:](v5, "setTracklistToken:", v4);

  return v5;
}

+ (void)buildSharedSessionIntentWithIntent:(id)a3 identity:(id)a4 extendedStatusCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  MPCSharedListeningPlaybackIntentDataSource *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(MPCSharedListeningPlaybackIntentDataSource);
  -[MPCSharedListeningPlaybackIntentDataSource buildSharedSessionIntentWithIntent:identity:completion:](v10, "buildSharedSessionIntentWithIntent:identity:completion:", v9, v8, v7);

}

+ (id)sharedSessionIntentWithProperties:(id)a3 identity:(id)a4
{
  id v5;
  id v6;
  MPCSharedListeningPlaybackIntentTracklistToken *v7;
  MPCPlaybackIntent *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MPCSharedListeningPlaybackIntentTracklistToken);
  -[MPCSharedListeningPlaybackIntentTracklistToken setSharedListeningProperties:](v7, "setSharedListeningProperties:", v6);

  -[MPCSharedListeningPlaybackIntentTracklistToken setIdentity:](v7, "setIdentity:", v5);
  v8 = objc_alloc_init(MPCPlaybackIntent);
  -[MPCPlaybackIntent setTracklistSource:](v8, "setTracklistSource:", 100);
  -[MPCPlaybackIntent setTracklistToken:](v8, "setTracklistToken:", v7);

  return v8;
}

+ (id)tracklistDataSourceForSource:(int64_t)a3
{
  id v3;
  __objc2_class **v4;

  v3 = 0;
  v4 = off_24CAA2F20;
  switch(a3)
  {
    case 1:
      goto LABEL_9;
    case 2:
    case 5:
      return v3;
    case 3:
      v4 = off_24CAA2DD0;
      goto LABEL_9;
    case 4:
      v4 = off_24CAA2F18;
      goto LABEL_9;
    case 6:
      v4 = off_24CAA37B0;
      goto LABEL_9;
    default:
      if (a3 == 100)
      {
        v4 = off_24CAA2F78;
      }
      else
      {
        if (a3 != 500)
          return v3;
        v4 = off_24CAA2EE8;
      }
LABEL_9:
      v3 = objc_alloc_init(*v4);
      return v3;
  }
}

void __60__MPCPlaybackIntent_radioPlaybackIntentWithStationStringID___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__MPCPlaybackIntent_radioPlaybackIntentWithStationStringID___block_invoke_2;
  v3[3] = &unk_24CAB8A18;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "setRadioIdentifiersWithBlock:", v3);

}

uint64_t __60__MPCPlaybackIntent_radioPlaybackIntentWithStationStringID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStationStringID:", *(_QWORD *)(a1 + 32));
}

@end
