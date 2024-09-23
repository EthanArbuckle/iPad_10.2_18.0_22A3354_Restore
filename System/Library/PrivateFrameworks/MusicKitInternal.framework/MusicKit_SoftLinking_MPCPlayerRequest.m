@implementation MusicKit_SoftLinking_MPCPlayerRequest

- (MusicKit_SoftLinking_MPCPlayerRequest)initWithPath:(id)a3
{
  id v4;
  MusicKit_SoftLinking_MPCPlayerRequest *v5;
  void *v6;
  objc_class *v7;
  MPCPlayerRequest *v8;
  MPCPlayerRequest *underlyingPlayerRequest;
  MPCPlayerRequest *v10;
  void *v11;
  MPCPlayerRequest *v12;
  void *v13;
  MPCPlayerRequest *v14;
  void *v15;
  MPCPlayerRequest *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MusicKit_SoftLinking_MPCPlayerRequest;
  v5 = -[MusicKit_SoftLinking_MPCPlayerRequest init](&v19, sel_init);
  if (v5)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v6 = (void *)getMPCPlayerRequestClass_softClass;
    v24 = getMPCPlayerRequestClass_softClass;
    if (!getMPCPlayerRequestClass_softClass)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __getMPCPlayerRequestClass_block_invoke;
      v20[3] = &unk_1E9C05688;
      v20[4] = &v21;
      __getMPCPlayerRequestClass_block_invoke((uint64_t)v20);
      v6 = (void *)v22[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v21, 8);
    v8 = (MPCPlayerRequest *)objc_alloc_init(v7);
    underlyingPlayerRequest = v5->_underlyingPlayerRequest;
    v5->_underlyingPlayerRequest = v8;

    v10 = v5->_underlyingPlayerRequest;
    objc_msgSend(v4, "_musicKit_self_playerPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayerRequest setPlayerPath:](v10, "setPlayerPath:", v11);

    v12 = v5->_underlyingPlayerRequest;
    objc_msgSend(MEMORY[0x1E0CCDE60], "_playbackItemSupportedProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayerRequest setPlayingItemProperties:](v12, "setPlayingItemProperties:", v13);

    v14 = v5->_underlyingPlayerRequest;
    objc_msgSend(MEMORY[0x1E0CCDE60], "_playbackItemSupportedProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayerRequest setQueueItemProperties:](v14, "setQueueItemProperties:", v15);

    v16 = v5->_underlyingPlayerRequest;
    objc_msgSend(MEMORY[0x1E0CCDE60], "_playbackSectionSupportedProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlayerRequest setQueueSectionProperties:](v16, "setQueueSectionProperties:", v17);

    -[MPCPlayerRequest setQualityOfService:](v5->_underlyingPlayerRequest, "setQualityOfService:", 25);
  }

  return v5;
}

- (MusicKit_SoftLinking_MPCPlayerRequest)initWithUnderlyingPlayerRequest:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPCPlayerRequest *v6;
  MusicKit_SoftLinking_MPCPlayerRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPCPlayerRequest;
  v6 = -[MusicKit_SoftLinking_MPCPlayerRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingPlayerRequest, a3);

  return v7;
}

- (MusicKit_SoftLinking_MPCPlayerPath)playerPath
{
  return (MusicKit_SoftLinking_MPCPlayerPath *)-[MPCPlayerRequest playerPath](self->_underlyingPlayerRequest, "playerPath");
}

- (int64_t)forwardCount
{
  int64_t v2;

  -[MPCPlayerRequest tracklistRange](self->_underlyingPlayerRequest, "tracklistRange");
  return v2;
}

- (void)setForwardCount:(int64_t)a3
{
  -[MPCPlayerRequest setTracklistRange:](self->_underlyingPlayerRequest, "setTracklistRange:", -[MusicKit_SoftLinking_MPCPlayerRequest historyCount](self, "historyCount"), a3);
}

- (int64_t)historyCount
{
  return -[MPCPlayerRequest tracklistRange](self->_underlyingPlayerRequest, "tracklistRange");
}

- (void)setHistoryCount:(int64_t)a3
{
  -[MPCPlayerRequest setTracklistRange:](self->_underlyingPlayerRequest, "setTracklistRange:", a3, -[MusicKit_SoftLinking_MPCPlayerRequest forwardCount](self, "forwardCount"));
}

- (void)setPlayerPath:(id)a3
{
  -[MPCPlayerRequest setPlayerPath:](self->_underlyingPlayerRequest, "setPlayerPath:", a3);
}

- (MPCPlayerRequest)_underlyingPlayerRequest
{
  return self->_underlyingPlayerRequest;
}

- (void)performWithCompletion:(id)a3
{
  id v4;
  MPCPlayerRequest *underlyingPlayerRequest;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  underlyingPlayerRequest = self->_underlyingPlayerRequest;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__MusicKit_SoftLinking_MPCPlayerRequest_performWithCompletion___block_invoke;
  v8[3] = &unk_1E9C058D0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = (id)-[MPCPlayerRequest performWithCompletion:](underlyingPlayerRequest, "performWithCompletion:", v8);

}

- (id)_errorFromUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v5 = (_QWORD *)getMPCPlayerEnqueueErrorDomainSymbolLoc_ptr;
  v15 = getMPCPlayerEnqueueErrorDomainSymbolLoc_ptr;
  if (!getMPCPlayerEnqueueErrorDomainSymbolLoc_ptr)
  {
    v6 = (void *)MediaPlaybackCoreLibrary_0();
    v5 = dlsym(v6, "MPCPlayerEnqueueErrorDomain");
    v13[3] = (uint64_t)v5;
    getMPCPlayerEnqueueErrorDomainSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v12, 8);
  if (!v5)
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
  v7 = objc_msgSend(v4, "isEqual:", *v5, v12);

  v8 = v3;
  if (v7)
  {
    v9 = objc_msgSend(v3, "code");
    if ((unint64_t)(v9 - 1) > 4)
      v10 = 0;
    else
      v10 = qword_1D76A1040[v9 - 1];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MusicKit_SoftLinking_MPCPlayerEnqueueErrorDomain"), v10, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPlayerRequest, 0);
}

@end
