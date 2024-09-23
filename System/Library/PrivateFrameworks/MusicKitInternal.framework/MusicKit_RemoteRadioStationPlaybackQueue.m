@implementation MusicKit_RemoteRadioStationPlaybackQueue

- (MusicKit_RemoteRadioStationPlaybackQueue)initWithItem:(id)a3 replaceQueueIntent:(int64_t)a4
{
  id v6;
  MusicKit_RemoteRadioStationPlaybackQueue *v7;
  uint64_t v8;
  MPModelRadioStation *underlyingStation;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_RemoteRadioStationPlaybackQueue;
  v7 = -[MusicKit_RemotePlaybackQueue initWithReplaceQueueIntent:](&v11, sel_initWithReplaceQueueIntent_, a4);
  if (v7)
  {
    objc_msgSend(v6, "_underlyingModelObject");
    v8 = objc_claimAutoreleasedReturnValue();
    underlyingStation = v7->_underlyingStation;
    v7->_underlyingStation = (MPModelRadioStation *)v8;

  }
  return v7;
}

- (void)setQueueWithPath:(id)a3 sessionID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *ExternalRepresentation;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[3];
  _QWORD v33[5];

  v33[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MPModelRadioStation identifiers](self->_underlyingStation, "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "radio");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stationStringID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetRadioStationIDType();
  MRSystemAppPlaybackQueueSetRadioStationStringIdentifier();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v15 = (void *)getMPRemotePlaybackQueueClass_softClass;
  v31 = getMPRemotePlaybackQueueClass_softClass;
  if (!getMPRemotePlaybackQueueClass_softClass)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __getMPRemotePlaybackQueueClass_block_invoke;
    v27[3] = &unk_1E9C05688;
    v27[4] = &v28;
    __getMPRemotePlaybackQueueClass_block_invoke((uint64_t)v27);
    v15 = (void *)v29[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v28, 8);
  objc_msgSend(v16, "queueWithMediaRemotePlaybackQueue:", v14);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "_mediaRemotePlaybackQueue");
  -[MusicKit_RemotePlaybackQueue convertReplaceQueueIntentToMRIntent:](self, "convertReplaceQueueIntentToMRIntent:", -[MusicKit_RemotePlaybackQueue replaceQueueIntent](self, "replaceQueueIntent"));
  MRSystemAppPlaybackQueueSetReplaceIntent();
  MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
  v18 = v9;
  v19 = v18;
  if (!v18)
  {
    +[MusicKit_PlayerPathSessionManager sharedSessionManager](MusicKit_PlayerPathSessionManager, "sharedSessionManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sessionIDForPlayerPath:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  v22 = *MEMORY[0x1E0D4CBD8];
  v32[0] = *MEMORY[0x1E0D4CD20];
  v32[1] = v22;
  v33[0] = ExternalRepresentation;
  v33[1] = v19;
  v32[2] = *MEMORY[0x1E0D4CB98];
  v33[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mrPlayerPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  v25 = v10;
  MRMediaRemoteSendCommandToPlayerWithResult();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingStation, 0);
}

@end
