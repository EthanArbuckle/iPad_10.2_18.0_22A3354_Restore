@implementation MRNowPlayingControllerConfiguration

- (MRNowPlayingControllerConfiguration)initWithOutputDeviceUID:(id)a3
{
  id v4;
  MRDestination *v5;
  MRNowPlayingControllerConfiguration *v6;

  v4 = a3;
  if (!v4)
  {
    +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = -[MRDestination initWithOutputDeviceUID:]([MRDestination alloc], "initWithOutputDeviceUID:", v4);
  v6 = -[MRNowPlayingControllerConfiguration initWithDestination:](self, "initWithDestination:", v5);

  return v6;
}

- (MRNowPlayingControllerConfiguration)initWithEndpoint:(id)a3
{
  id v4;
  MRDestination *v5;
  MRNowPlayingControllerConfiguration *v6;

  v4 = a3;
  v5 = -[MRDestination initWithEndpoint:]([MRDestination alloc], "initWithEndpoint:", v4);

  v6 = -[MRNowPlayingControllerConfiguration initWithDestination:](self, "initWithDestination:", v5);
  return v6;
}

- (MRNowPlayingControllerConfiguration)initWithOrigin:(id)a3
{
  id v4;
  MRDestination *v5;
  MRNowPlayingControllerConfiguration *v6;

  v4 = a3;
  v5 = -[MRDestination initWithOrigin:]([MRDestination alloc], "initWithOrigin:", v4);

  v6 = -[MRNowPlayingControllerConfiguration initWithDestination:](self, "initWithDestination:", v5);
  return v6;
}

- (MRNowPlayingControllerConfiguration)initWithDestination:(id)a3
{
  id v4;
  MRNowPlayingControllerConfiguration *v5;
  uint64_t v6;
  MRDestination *destination;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRNowPlayingControllerConfiguration;
  v5 = -[MRNowPlayingControllerConfiguration init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "copy");
    }
    else
    {
      +[MRDestination localDestination](MRDestination, "localDestination");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    destination = v5->_destination;
    v5->_destination = (MRDestination *)v6;

  }
  return v5;
}

- (MRPlaybackQueueRequest)playbackQueueRequest
{
  MRPlaybackQueueRequest *playbackQueueRequest;
  void *v4;

  playbackQueueRequest = self->_playbackQueueRequest;
  if (playbackQueueRequest)
    return playbackQueueRequest;
  if (-[MRNowPlayingControllerConfiguration requestPlaybackQueue](self, "requestPlaybackQueue"))
  {
    +[MRPlaybackQueueRequest defaultPlaybackQueueRequest](MRPlaybackQueueRequest, "defaultPlaybackQueueRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (MRPlaybackQueueRequest *)v4;
}

- (id)description
{
  MRNowPlayingControllerConfiguration *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p - %@"), objc_opt_class(), v2, v2->_destination);
  v4 = v3;
  if (v2->_label)
    objc_msgSend(v3, "appendFormat:", CFSTR("label: %@"), v2->_label);
  if (v2->_playbackQueueRequest)
    objc_msgSend(v4, "appendFormat:", CFSTR("playbackQueueRequest=%@ (using default request: %u)"), v2->_playbackQueueRequest, v2->_requestPlaybackQueue);
  if (v2->_requestSupportedCommands)
    objc_msgSend(v4, "appendFormat:", CFSTR("supportedCommands: %u "), 1);
  if (v2->_requestPlaybackState)
    objc_msgSend(v4, "appendFormat:", CFSTR("playbackState: %u "), 1);
  if (v2->_requestLastPlayingDate)
    objc_msgSend(v4, "appendFormat:", CFSTR("lastPlayingDate: %u "), 1);
  if (v2->_requestClientProperties)
    objc_msgSend(v4, "appendFormat:", CFSTR("clientProperties %u"), 1);
  if (v2->_discoveryPredicate)
  {
    v5 = (void *)MEMORY[0x194036C44]();
    objc_msgSend(v4, "appendFormat:", CFSTR("discoveryPredicate %@"), v5);

  }
  if (-[MRNowPlayingControllerConfiguration isSingleShot](v2, "isSingleShot"))
    objc_msgSend(v4, "appendString:", CFSTR("singleShot"));
  if (-[MRNowPlayingControllerConfiguration wantsChangeCallbacksDuringInitialLoad](v2, "wantsChangeCallbacksDuringInitialLoad"))
  {
    objc_msgSend(v4, "appendString:", CFSTR("wantsChangeCallbacksDuringInitialLoad"));
  }
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  objc_sync_exit(v2);

  return v4;
}

- (id)debugDescription
{
  MRNowPlayingControllerConfiguration *v2;
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  MRPlaybackQueueRequest *playbackQueueRequest;
  void *v11;
  void *v12;
  NSString *label;
  uint64_t v15;
  id v16;

  v2 = self;
  objc_sync_enter(v2);
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  v15 = objc_opt_class();
  label = v2->_label;
  MRCreateIndentedDebugDescriptionFromObject(v2->_destination);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_requestSupportedCommands)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (v2->_requestPlaybackState)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (v2->_requestLastPlayingDate)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (v2->_requestClientProperties)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (v2->_wantsChangeCallbacksDuringInitialLoad)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (v2->_singleShot)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  playbackQueueRequest = v2->_playbackQueueRequest;
  v11 = (void *)MEMORY[0x194036C44](v2->_discoveryPredicate);
  v12 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("<%@: %p {\n   label = %@\n   destination = %@\n   playbackQueueRequest = %@\n   requestSupportedCommands = %@\n   requestPlaybackState = %@\n   requestLastPlayingdate = %@\n   requestClientProperties = %@\n   wantsChangeCallbacksDuringInitialLoad = %@\n   isSingleShot = %@\n   discoveryPredicate = %@\n}>\n"), v15, v2, label, v3, playbackQueueRequest, v4, v5, v6, v7, v8, v9, v11);

  objc_sync_exit(v2);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MRNowPlayingControllerConfiguration destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v7;

  -[MRNowPlayingControllerConfiguration playbackQueueRequest](self, "playbackQueueRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  *(_BYTE *)(v5 + 8) = -[MRNowPlayingControllerConfiguration requestSupportedCommands](self, "requestSupportedCommands");
  *(_BYTE *)(v5 + 9) = -[MRNowPlayingControllerConfiguration requestPlaybackState](self, "requestPlaybackState");
  *(_BYTE *)(v5 + 10) = -[MRNowPlayingControllerConfiguration requestLastPlayingDate](self, "requestLastPlayingDate");
  *(_BYTE *)(v5 + 12) = -[MRNowPlayingControllerConfiguration requestPlaybackQueue](self, "requestPlaybackQueue");
  *(_BYTE *)(v5 + 11) = -[MRNowPlayingControllerConfiguration requestClientProperties](self, "requestClientProperties");
  *(_BYTE *)(v5 + 14) = -[MRNowPlayingControllerConfiguration isSingleShot](self, "isSingleShot");
  -[MRNowPlayingControllerConfiguration label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  -[MRNowPlayingControllerConfiguration discoveryPredicate](self, "discoveryPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copy");
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  *(_BYTE *)(v5 + 13) = -[MRNowPlayingControllerConfiguration wantsChangeCallbacksDuringInitialLoad](self, "wantsChangeCallbacksDuringInitialLoad");
  return (id)v5;
}

- (MRDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)requestSupportedCommands
{
  return self->_requestSupportedCommands;
}

- (void)setRequestSupportedCommands:(BOOL)a3
{
  self->_requestSupportedCommands = a3;
}

- (BOOL)requestPlaybackState
{
  return self->_requestPlaybackState;
}

- (void)setRequestPlaybackState:(BOOL)a3
{
  self->_requestPlaybackState = a3;
}

- (BOOL)requestLastPlayingDate
{
  return self->_requestLastPlayingDate;
}

- (void)setRequestLastPlayingDate:(BOOL)a3
{
  self->_requestLastPlayingDate = a3;
}

- (BOOL)requestClientProperties
{
  return self->_requestClientProperties;
}

- (void)setRequestClientProperties:(BOOL)a3
{
  self->_requestClientProperties = a3;
}

- (BOOL)requestPlaybackQueue
{
  return self->_requestPlaybackQueue;
}

- (void)setRequestPlaybackQueue:(BOOL)a3
{
  self->_requestPlaybackQueue = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)wantsChangeCallbacksDuringInitialLoad
{
  return self->_wantsChangeCallbacksDuringInitialLoad;
}

- (void)setWantsChangeCallbacksDuringInitialLoad:(BOOL)a3
{
  self->_wantsChangeCallbacksDuringInitialLoad = a3;
}

- (BOOL)isSingleShot
{
  return self->_singleShot;
}

- (void)setSingleShot:(BOOL)a3
{
  self->_singleShot = a3;
}

- (id)discoveryPredicate
{
  return self->_discoveryPredicate;
}

- (void)setDiscoveryPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setPlaybackQueueRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackQueueRequest, 0);
  objc_storeStrong(&self->_discoveryPredicate, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
