@implementation MRClientUpdatesConfigMessage

- (MRClientUpdatesConfigMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6;
  MRClientUpdatesConfigMessage *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *subscribedPlayerPaths;
  MRPlayerPath *v13;
  void *v14;
  MRPlayerPath *v15;
  uint64_t v16;
  NSArray *v17;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRClientUpdatesConfigMessage;
  v7 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](&v19, sel_initWithUnderlyingCodableMessage_error_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "subscribedPlayerPaths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(v6, "subscribedPlayerPaths");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mr_map:", &__block_literal_global_0);
      v11 = objc_claimAutoreleasedReturnValue();
      subscribedPlayerPaths = v7->_subscribedPlayerPaths;
      v7->_subscribedPlayerPaths = (NSArray *)v11;
    }
    else
    {
      v13 = [MRPlayerPath alloc];
      +[MROrigin localOrigin](MROrigin, "localOrigin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[MRClient anyClient](MRClient, "anyClient");
      subscribedPlayerPaths = (void *)objc_claimAutoreleasedReturnValue();
      +[MRPlayer anyPlayer](MRPlayer, "anyPlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MRPlayerPath initWithOrigin:client:player:](v13, "initWithOrigin:client:player:", v10, subscribedPlayerPaths, v14);
      v20[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v7->_subscribedPlayerPaths;
      v7->_subscribedPlayerPaths = (NSArray *)v16;

    }
  }

  return v7;
}

MRPlayerPath *__71__MRClientUpdatesConfigMessage_initWithUnderlyingCodableMessage_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRPlayerPath *v3;

  v2 = a2;
  v3 = -[MRPlayerPath initWithProtobuf:]([MRPlayerPath alloc], "initWithProtobuf:", v2);

  return v3;
}

- (MRClientUpdatesConfigMessage)initWithNowPlayingUpdates:(BOOL)a3 artworkUpdates:(BOOL)a4 volumeUpdates:(BOOL)a5 keyboardUpdates:(BOOL)a6 outputDeviceUpdates:(BOOL)a7 systemEndpointUpdates:(BOOL)a8 subscribedPlayerPaths:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  id v16;
  MRClientUpdatesConfigMessage *v17;
  uint64_t v18;
  NSArray *subscribedPlayerPaths;
  _MRClientUpdatesConfigurationProtobuf *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v16 = a9;
  v24.receiver = self;
  v24.super_class = (Class)MRClientUpdatesConfigMessage;
  v17 = -[MRProtocolMessage init](&v24, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v16, "copy");
    subscribedPlayerPaths = v17->_subscribedPlayerPaths;
    v17->_subscribedPlayerPaths = (NSArray *)v18;

    v20 = objc_alloc_init(_MRClientUpdatesConfigurationProtobuf);
    -[_MRClientUpdatesConfigurationProtobuf setNowPlayingUpdates:](v20, "setNowPlayingUpdates:", v14);
    -[_MRClientUpdatesConfigurationProtobuf setArtworkUpdates:](v20, "setArtworkUpdates:", v13);
    -[_MRClientUpdatesConfigurationProtobuf setVolumeUpdates:](v20, "setVolumeUpdates:", v12);
    -[_MRClientUpdatesConfigurationProtobuf setKeyboardUpdates:](v20, "setKeyboardUpdates:", v11);
    -[_MRClientUpdatesConfigurationProtobuf setOutputDeviceUpdates:](v20, "setOutputDeviceUpdates:", v10);
    -[_MRClientUpdatesConfigurationProtobuf setSystemEndpointUpdates:](v20, "setSystemEndpointUpdates:", v9);
    -[NSArray mr_map:](v17->_subscribedPlayerPaths, "mr_map:", &__block_literal_global_9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");
    -[_MRClientUpdatesConfigurationProtobuf setSubscribedPlayerPaths:](v20, "setSubscribedPlayerPaths:", v22);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v17, "setUnderlyingCodableMessage:", v20);
  }

  return v17;
}

uint64_t __167__MRClientUpdatesConfigMessage_initWithNowPlayingUpdates_artworkUpdates_volumeUpdates_keyboardUpdates_outputDeviceUpdates_systemEndpointUpdates_subscribedPlayerPaths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

- (BOOL)nowPlayingUpdates
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nowPlayingUpdates");

  return v3;
}

- (BOOL)artworkUpdates
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "artworkUpdates");

  return v3;
}

- (BOOL)volumeUpdates
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "volumeUpdates");

  return v3;
}

- (BOOL)keyboardUpdates
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardUpdates");

  return v3;
}

- (BOOL)outputDeviceUpdates
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "outputDeviceUpdates");

  return v3;
}

- (BOOL)systemEndpointUpdates
{
  void *v2;
  char v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "systemEndpointUpdates");

  return v3;
}

- (unint64_t)type
{
  return 16;
}

- (NSArray)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedPlayerPaths, 0);
}

@end
