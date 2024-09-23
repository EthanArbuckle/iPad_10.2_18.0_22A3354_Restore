@implementation MPCPlayerResponse

+ (id)builderProtocol
{
  return &unk_254A9B5B0;
}

- (BOOL)isSharedListeningSession
{
  return self->_sharedListeningSession;
}

- (MPCPlayerResponse)initWithRequest:(id)a3 middleware:(id)a4
{
  MPCPlayerResponse *v4;
  MPCPlayerResponseTracklist *v5;
  MPCPlayerResponseTracklist *tracklist;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MPCVideoView *videoView;
  void *v15;
  void *v16;
  uint64_t v17;
  MPCVideoOutput *videoOutput;
  void *v19;
  void *v20;
  uint64_t v21;
  MPCMediaRemoteController *controller;
  uint64_t v23;
  MPCPlayerPath *playerPath;
  void *v25;
  void *v26;
  uint64_t v27;
  ICMusicSubscriptionStatus *requestingUserSubscriptionStatus;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)MPCPlayerResponse;
  v4 = -[MPResponse initWithRequest:middleware:](&v30, sel_initWithRequest_middleware_, a3, a4);
  if (v4)
  {
    v5 = -[MPCPlayerResponseTracklist initWithResponse:]([MPCPlayerResponseTracklist alloc], "initWithResponse:", v4);
    tracklist = v4->_tracklist;
    v4->_tracklist = v5;

    -[MPResponse builder](v4, "builder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPResponse chain](v4, "chain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_state = objc_msgSend(v7, "playerState:chain:", 0, v8);

    -[MPResponse builder](v4, "builder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPResponse chain](v4, "chain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_sharedListeningSession = objc_msgSend(v9, "playerIsSharedListeningSession:chain:", 0, v10);

    -[MPResponse builder](v4, "builder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPResponse chain](v4, "chain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playerVideoView:chain:", 0, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    videoView = v4->_videoView;
    v4->_videoView = (MPCVideoView *)v13;

    -[MPResponse builder](v4, "builder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPResponse chain](v4, "chain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "videoOutput:chain:", 0, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    videoOutput = v4->_videoOutput;
    v4->_videoOutput = (MPCVideoOutput *)v17;

    -[MPResponse builder](v4, "builder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPResponse chain](v4, "chain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "controller:chain:", 0, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    controller = v4->_controller;
    v4->_controller = (MPCMediaRemoteController *)v21;

    -[MPCMediaRemoteController resolvedPlayerPath](v4->_controller, "resolvedPlayerPath");
    v23 = objc_claimAutoreleasedReturnValue();
    playerPath = v4->_playerPath;
    v4->_playerPath = (MPCPlayerPath *)v23;

    -[MPResponse builder](v4, "builder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPResponse chain](v4, "chain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "requestingUserSubscriptionStatus:chain:", 0, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    requestingUserSubscriptionStatus = v4->_requestingUserSubscriptionStatus;
    v4->_requestingUserSubscriptionStatus = (ICMusicSubscriptionStatus *)v27;

  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPCPlayerResponse;
  -[MPResponse description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" playerPath=%@"), self->_playerPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v3, "length") - 1, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MPCVideoOutput)videoOutput
{
  return self->_videoOutput;
}

- (id)pause
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;

  -[MPCPlayerResponse _commandRequestForMediaRemoteCommand:](self, "_commandRequestForMediaRemoteCommand:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPResponse request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disablePlaybackStateValidation");

  if (v5)
    goto LABEL_4;
  if (-[MPCPlayerResponse state](self, "state") != 2)
  {
    v7 = 0;
    goto LABEL_7;
  }
  if (v3)
  {
LABEL_4:
    v6 = v3;
  }
  else
  {
    -[MPCPlayerResponse _commandRequestForMediaRemoteCommand:](self, "_commandRequestForMediaRemoteCommand:", 2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_7:

  return v7;
}

- (int64_t)state
{
  return self->_state;
}

- (id)play
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[MPCPlayerResponse _commandRequestForMediaRemoteCommand:](self, "_commandRequestForMediaRemoteCommand:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPResponse request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disablePlaybackStateValidation");

  if (v5)
    goto LABEL_5;
  if (-[MPCPlayerResponse state](self, "state") != 2)
  {
    if (!v3)
    {
      -[MPCPlayerResponse _commandRequestForMediaRemoteCommand:](self, "_commandRequestForMediaRemoteCommand:", 2);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_5:
    v7 = v3;
LABEL_6:
    v6 = v7;
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)_commandRequestForMediaRemoteCommand:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  int v7;
  MPCPlayerCommandRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  MPCPlayerCommandRequest *v12;

  v3 = *(_QWORD *)&a3;
  -[MPResponse builder](self, "builder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPResponse chain](self, "chain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "playerCommandEnabled:command:chain:", 0, v3, v6);

  if (v7)
  {
    v8 = [MPCPlayerCommandRequest alloc];
    -[MPCPlayerResponse controller](self, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPResponse request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v8, "initWithMediaRemoteCommand:options:controller:label:", v3, 0, v9, v11);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (MPCPlayerResponseTracklist)tracklist
{
  return self->_tracklist;
}

- (MPCMediaRemoteController)controller
{
  return self->_controller;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_requestingUserSubscriptionStatus, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_tracklist, 0);
}

- (id)prepare
{
  void *v2;
  unint64_t v4;
  unint64_t v5;
  int v6;
  MPCPlayerCommandRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  MPCPlayerCommandRequest *v11;

  v4 = -[MPCPlayerResponse state](self, "state");
  v5 = v4;
  if (v4 <= 6 && ((1 << v4) & 0x53) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[MPResponse request](self, "request");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "disablePlaybackStateValidation");
  }
  if (v5 > 6 || ((1 << v5) & 0x53) == 0)
  {

    if (v6)
      goto LABEL_8;
LABEL_10:
    v11 = 0;
    return v11;
  }
  if (!v6)
    goto LABEL_10;
LABEL_8:
  v7 = [MPCPlayerCommandRequest alloc];
  -[MPCPlayerResponse controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPResponse request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MPCPlayerCommandRequest initWithMediaRemoteCommand:options:controller:label:](v7, "initWithMediaRemoteCommand:options:controller:label:", 132, 0, v8, v10);

  return v11;
}

- (id)stop
{
  void *v3;
  int v4;
  void *v5;

  if (-[MPCPlayerResponse state](self, "state") == 2
    || (-[MPResponse request](self, "request"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "disablePlaybackStateValidation"),
        v3,
        v4))
  {
    -[MPCPlayerResponse _commandRequestForMediaRemoteCommand:](self, "_commandRequestForMediaRemoteCommand:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)createSharedSessionWithIntentHandler:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BEC8838];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBlock:", &__block_literal_global_6840);
  -[MPCPlayerResponse createSharedSessionWithIdentity:intentHandler:](self, "createSharedSessionWithIdentity:intentHandler:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createSharedSessionWithIdentity:(id)a3 intentHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[MPCPlayerResponse _commandRequestForMediaRemoteCommand:](self, "_commandRequestForMediaRemoteCommand:", 25020);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mpc_jsonValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCommandOptionValue:forKey:", v9, CFSTR("com.apple.music.live-link-identity-json"));

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__MPCPlayerResponse_createSharedSessionWithIdentity_intentHandler___block_invoke;
  v13[3] = &unk_24CAB3DA0;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "setStatusTransformer:", v13);

  return v8;
}

- (id)leaveSession
{
  return -[MPCPlayerResponse _commandRequestForMediaRemoteCommand:](self, "_commandRequestForMediaRemoteCommand:", 139);
}

- (id)_stateDumpObject
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCPlayerResponse;
  -[MPResponse _stateDumpObject](&v8, sel__stateDumpObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = self->_state - 1;
  if (v5 > 5)
    v6 = CFSTR("MPCPlayerStateUnknown");
  else
    v6 = off_24CAB3DC0[v5];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("state"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_tracklist, CFSTR("tracklist"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_playerPath, CFSTR("playerPath"));
  return v4;
}

- (NSArray)participants
{
  return self->_participants;
}

- (ICMusicSubscriptionStatus)requestingUserSubscriptionStatus
{
  return self->_requestingUserSubscriptionStatus;
}

- (void)setPlayerPath:(id)a3
{
  objc_storeStrong((id *)&self->_playerPath, a3);
}

- (MPCVideoView)videoView
{
  return self->_videoView;
}

- (void)setVideoView:(id)a3
{
  objc_storeStrong((id *)&self->_videoView, a3);
}

- (void)setVideoOutput:(id)a3
{
  objc_storeStrong((id *)&self->_videoOutput, a3);
}

id __67__MPCPlayerResponse_createSharedSessionWithIdentity_intentHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = a2;
  objc_msgSend(v3, "customDataType");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v4 == CFSTR("com.apple.music.shared-session-url-components")
    || (v5 = v4,
        v6 = -[__CFString isEqual:](v4, "isEqual:", CFSTR("com.apple.music.shared-session-url-components")),
        v5,
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x24BDD1808];
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v3, "customData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithData:encoding:", v9, 4);
    objc_msgSend(v7, "componentsWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "queryItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "msv_firstWhere:", &__block_literal_global_260);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "queryItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "msv_firstWhere:", &__block_literal_global_263);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[MPCPlaybackSharedListeningProperties propertiesWithSessionIdentifier:sessionKey:](MPCPlaybackSharedListeningProperties, "propertiesWithSessionIdentifier:sessionKey:", v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCPlaybackIntent sharedSessionIntentWithProperties:identity:](MPCPlaybackIntent, "sharedSessionIntentWithProperties:identity:", v18, *(_QWORD *)(a1 + 32));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(MEMORY[0x24BDDCB80], "successStatus");
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = v3;
  }

  return v20;
}

uint64_t __67__MPCPlayerResponse_createSharedSessionWithIdentity_intentHandler___block_invoke_3(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("key"))
    v4 = 1;
  else
    v4 = -[__CFString isEqual:](v2, "isEqual:", CFSTR("key"));

  return v4;
}

uint64_t __67__MPCPlayerResponse_createSharedSessionWithIdentity_intentHandler___block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("id"))
    v4 = 1;
  else
    v4 = -[__CFString isEqual:](v2, "isEqual:", CFSTR("id"));

  return v4;
}

@end
