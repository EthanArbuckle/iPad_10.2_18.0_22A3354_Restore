@implementation MRProtocolMessage

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientConnection);
  objc_storeStrong((id *)&self->_transportOptions, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_replyIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_underlyingCodableMessage, 0);
  objc_storeStrong((id *)&self->_protobufData, 0);
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (MRProtocolClientConnection)clientConnection
{
  return (MRProtocolClientConnection *)objc_loadWeakRetained((id *)&self->_clientConnection);
}

- (NSError)error
{
  return self->_error;
}

- (NSData)protobufData
{
  NSData *protobufData;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  _MRMediaRemoteMessageProtobuf *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSError *error;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSData *v17;
  NSData *v18;
  void *v20;

  protobufData = self->_protobufData;
  if (!protobufData)
  {
    v5 = -[MRProtocolMessage type](self, "type");
    if (!v5)
    {
      v6 = objc_opt_class();
      if (v6 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRProtocolMessage.m"), 615, CFSTR("Message does not have a valid type. Did you forget to implement the type method?"));

      }
    }
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(_MRMediaRemoteMessageProtobuf);
    -[_MRMediaRemoteMessageProtobuf setType:](v8, "setType:", v5);
    -[MRProtocolMessage replyIdentifier](self, "replyIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRMediaRemoteMessageProtobuf setReplyIdentifier:](v8, "setReplyIdentifier:", v9);

    -[MRProtocolMessage uniqueIdentifier](self, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRMediaRemoteMessageProtobuf setUniqueIdentifier:](v8, "setUniqueIdentifier:", v10);

    v11 = -[MRProtocolMessage timestamp](self, "timestamp");
    if (v11)
      -[_MRMediaRemoteMessageProtobuf setTimestamp:](v8, "setTimestamp:", (unint64_t)(MRTimeUtilitiesGetProcessorTimeScale() * (double)v11));
    error = self->_error;
    if (error)
    {
      -[NSError domain](error, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("kMRMediaRemoteFrameworkErrorDomain"));

      if (v14)
      {
        -[NSError mr_protobuf](self->_error, "mr_protobuf");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRMediaRemoteMessageProtobuf setError:](v8, "setError:", v15);

        -[_MRMediaRemoteMessageProtobuf setErrorCode:](v8, "setErrorCode:", -[NSError code](self->_error, "code"));
        -[NSError localizedDescription](self->_error, "localizedDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_MRMediaRemoteMessageProtobuf setErrorDescription:](v8, "setErrorDescription:", v16);

      }
    }
    switch(v5)
    {
      case 1uLL:
        -[_MRMediaRemoteMessageProtobuf setSendCommandMessage:](v8, "setSendCommandMessage:", v7);
        break;
      case 2uLL:
        -[_MRMediaRemoteMessageProtobuf setSendCommandResultMessage:](v8, "setSendCommandResultMessage:", v7);
        break;
      case 3uLL:
        -[_MRMediaRemoteMessageProtobuf setGetStateMessage:](v8, "setGetStateMessage:", v7);
        break;
      case 4uLL:
        -[_MRMediaRemoteMessageProtobuf setSetStateMessage:](v8, "setSetStateMessage:", v7);
        break;
      case 5uLL:
        -[_MRMediaRemoteMessageProtobuf setSetArtworkMessage:](v8, "setSetArtworkMessage:", v7);
        break;
      case 6uLL:
        -[_MRMediaRemoteMessageProtobuf setRegisterHIDDeviceMessage:](v8, "setRegisterHIDDeviceMessage:", v7);
        break;
      case 7uLL:
        -[_MRMediaRemoteMessageProtobuf setRegisterHIDDeviceResultMessage:](v8, "setRegisterHIDDeviceResultMessage:", v7);
        break;
      case 8uLL:
        -[_MRMediaRemoteMessageProtobuf setSendHIDEventMessage:](v8, "setSendHIDEventMessage:", v7);
        break;
      case 0xAuLL:
        -[_MRMediaRemoteMessageProtobuf setSendVirtualTouchEventMessage:](v8, "setSendVirtualTouchEventMessage:", v7);
        break;
      case 0xBuLL:
        -[_MRMediaRemoteMessageProtobuf setNotificationMessage:](v8, "setNotificationMessage:", v7);
        break;
      case 0xFuLL:
      case 0x25uLL:
        -[_MRMediaRemoteMessageProtobuf setDeviceInfoMessage:](v8, "setDeviceInfoMessage:", v7);
        break;
      case 0x10uLL:
        -[_MRMediaRemoteMessageProtobuf setClientUpdatesConfigMessage:](v8, "setClientUpdatesConfigMessage:", v7);
        break;
      case 0x11uLL:
        -[_MRMediaRemoteMessageProtobuf setMasterVolumeControlCapabilitiesDidChangeMessage:](v8, "setMasterVolumeControlCapabilitiesDidChangeMessage:", v7);
        break;
      case 0x12uLL:
        -[_MRMediaRemoteMessageProtobuf setGameController:](v8, "setGameController:", v7);
        break;
      case 0x13uLL:
        -[_MRMediaRemoteMessageProtobuf setRegisterGameController:](v8, "setRegisterGameController:", v7);
        break;
      case 0x14uLL:
        -[_MRMediaRemoteMessageProtobuf setRegisterGameControllerResponse:](v8, "setRegisterGameControllerResponse:", v7);
        break;
      case 0x15uLL:
        -[_MRMediaRemoteMessageProtobuf setUnregisterGameController:](v8, "setUnregisterGameController:", v7);
        break;
      case 0x16uLL:
        -[_MRMediaRemoteMessageProtobuf setRegisterForGameControllerEvents:](v8, "setRegisterForGameControllerEvents:", v7);
        break;
      case 0x17uLL:
        -[_MRMediaRemoteMessageProtobuf setKeyboardMessage:](v8, "setKeyboardMessage:", v7);
        break;
      case 0x18uLL:
        -[_MRMediaRemoteMessageProtobuf setGetKeyboardMessage:](v8, "setGetKeyboardMessage:", v7);
        break;
      case 0x19uLL:
        -[_MRMediaRemoteMessageProtobuf setTextInputMessage:](v8, "setTextInputMessage:", v7);
        break;
      case 0x1AuLL:
        -[_MRMediaRemoteMessageProtobuf setGetVoiceInputDevicesMessage:](v8, "setGetVoiceInputDevicesMessage:", v7);
        break;
      case 0x1BuLL:
        -[_MRMediaRemoteMessageProtobuf setGetVoiceInputDevicesResponseMessage:](v8, "setGetVoiceInputDevicesResponseMessage:", v7);
        break;
      case 0x1CuLL:
        -[_MRMediaRemoteMessageProtobuf setRegisterVoiceInputDeviceMessage:](v8, "setRegisterVoiceInputDeviceMessage:", v7);
        break;
      case 0x1DuLL:
        -[_MRMediaRemoteMessageProtobuf setRegisterVoiceInputDeviceResponseMessage:](v8, "setRegisterVoiceInputDeviceResponseMessage:", v7);
        break;
      case 0x1EuLL:
        -[_MRMediaRemoteMessageProtobuf setSetRecordingStateMessage:](v8, "setSetRecordingStateMessage:", v7);
        break;
      case 0x1FuLL:
        -[_MRMediaRemoteMessageProtobuf setSendVoiceInputMessage:](v8, "setSendVoiceInputMessage:", v7);
        break;
      case 0x20uLL:
        -[_MRMediaRemoteMessageProtobuf setPlaybackQueueRequest:](v8, "setPlaybackQueueRequest:", v7);
        break;
      case 0x21uLL:
        -[_MRMediaRemoteMessageProtobuf setTransactionPackets:](v8, "setTransactionPackets:", v7);
        break;
      case 0x22uLL:
        -[_MRMediaRemoteMessageProtobuf setCryptoPairingMessage:](v8, "setCryptoPairingMessage:", v7);
        break;
      case 0x23uLL:
        -[_MRMediaRemoteMessageProtobuf setGameControllerProperties:](v8, "setGameControllerProperties:", v7);
        break;
      case 0x24uLL:
        -[_MRMediaRemoteMessageProtobuf setReadyStateMessage:](v8, "setReadyStateMessage:", v7);
        break;
      case 0x26uLL:
        -[_MRMediaRemoteMessageProtobuf setConnectionState:](v8, "setConnectionState:", v7);
        break;
      case 0x27uLL:
        -[_MRMediaRemoteMessageProtobuf setSendButtonEventMessage:](v8, "setSendButtonEventMessage:", v7);
        break;
      case 0x28uLL:
        -[_MRMediaRemoteMessageProtobuf setSetHiliteModeMessage:](v8, "setSetHiliteModeMessage:", v7);
        break;
      case 0x29uLL:
        -[_MRMediaRemoteMessageProtobuf setWakeDeviceMessage:](v8, "setWakeDeviceMessage:", v7);
        break;
      case 0x2AuLL:
        -[_MRMediaRemoteMessageProtobuf setGenericMessage:](v8, "setGenericMessage:", v7);
        break;
      case 0x2BuLL:
        -[_MRMediaRemoteMessageProtobuf setSendPackedVirtualTouchEventMessage:](v8, "setSendPackedVirtualTouchEventMessage:", v7);
        break;
      case 0x2CuLL:
        -[_MRMediaRemoteMessageProtobuf setSendLyricsEventMessage:](v8, "setSendLyricsEventMessage:", v7);
        break;
      case 0x2EuLL:
        -[_MRMediaRemoteMessageProtobuf setSetNowPlayingClientMessage:](v8, "setSetNowPlayingClientMessage:", v7);
        break;
      case 0x2FuLL:
        -[_MRMediaRemoteMessageProtobuf setSetNowPlayingPlayerMessage:](v8, "setSetNowPlayingPlayerMessage:", v7);
        break;
      case 0x30uLL:
        -[_MRMediaRemoteMessageProtobuf setModifyOutputContextRequestMessage:](v8, "setModifyOutputContextRequestMessage:", v7);
        break;
      case 0x31uLL:
        -[_MRMediaRemoteMessageProtobuf setGetVolumeMessage:](v8, "setGetVolumeMessage:", v7);
        break;
      case 0x32uLL:
        -[_MRMediaRemoteMessageProtobuf setGetVolumeResultMessage:](v8, "setGetVolumeResultMessage:", v7);
        break;
      case 0x33uLL:
        -[_MRMediaRemoteMessageProtobuf setSetVolumeMessage:](v8, "setSetVolumeMessage:", v7);
        break;
      case 0x34uLL:
        -[_MRMediaRemoteMessageProtobuf setVolumeDidChangeMessage:](v8, "setVolumeDidChangeMessage:", v7);
        break;
      case 0x35uLL:
        -[_MRMediaRemoteMessageProtobuf setRemoveClientMessage:](v8, "setRemoveClientMessage:", v7);
        break;
      case 0x36uLL:
        -[_MRMediaRemoteMessageProtobuf setRemovePlayerMessage:](v8, "setRemovePlayerMessage:", v7);
        break;
      case 0x37uLL:
        -[_MRMediaRemoteMessageProtobuf setUpdateClientMessage:](v8, "setUpdateClientMessage:", v7);
        break;
      case 0x38uLL:
        -[_MRMediaRemoteMessageProtobuf setUpdateContentItemMessage:](v8, "setUpdateContentItemMessage:", v7);
        break;
      case 0x39uLL:
        -[_MRMediaRemoteMessageProtobuf setUpdateContentItemArtworkMessage:](v8, "setUpdateContentItemArtworkMessage:", v7);
        break;
      case 0x3AuLL:
        -[_MRMediaRemoteMessageProtobuf setUpdatePlayerMessage:](v8, "setUpdatePlayerMessage:", v7);
        break;
      case 0x3BuLL:
        -[_MRMediaRemoteMessageProtobuf setPromptForRouteAuthorizationMessage:](v8, "setPromptForRouteAuthorizationMessage:", v7);
        break;
      case 0x3CuLL:
        -[_MRMediaRemoteMessageProtobuf setPromptForRouteAuthorizationResponseMessage:](v8, "setPromptForRouteAuthorizationResponseMessage:", v7);
        break;
      case 0x3DuLL:
        -[_MRMediaRemoteMessageProtobuf setPresentRouteAuthorizationStatusMessage:](v8, "setPresentRouteAuthorizationStatusMessage:", v7);
        break;
      case 0x3EuLL:
        -[_MRMediaRemoteMessageProtobuf setGetVolumeControlCapabilitiesMessage:](v8, "setGetVolumeControlCapabilitiesMessage:", v7);
        break;
      case 0x3FuLL:
        -[_MRMediaRemoteMessageProtobuf setGetVolumeControlCapabilitiesResultMessage:](v8, "setGetVolumeControlCapabilitiesResultMessage:", v7);
        break;
      case 0x40uLL:
        -[_MRMediaRemoteMessageProtobuf setVolumeControlCapabilitiesDidChangeMessage:](v8, "setVolumeControlCapabilitiesDidChangeMessage:", v7);
        break;
      case 0x41uLL:
        -[_MRMediaRemoteMessageProtobuf setUpdateOutputDevicesMessage:](v8, "setUpdateOutputDevicesMessage:", v7);
        break;
      case 0x42uLL:
      case 0x45uLL:
        -[_MRMediaRemoteMessageProtobuf setRemoveOutputDevicesMessage:](v8, "setRemoveOutputDevicesMessage:", v7);
        break;
      case 0x43uLL:
        -[_MRMediaRemoteMessageProtobuf setRemoteTextInputMessage:](v8, "setRemoteTextInputMessage:", v7);
        break;
      case 0x44uLL:
        -[_MRMediaRemoteMessageProtobuf setGetRemoteTextInputSessionMessage:](v8, "setGetRemoteTextInputSessionMessage:", v7);
        break;
      case 0x46uLL:
        -[_MRMediaRemoteMessageProtobuf setPlaybackSessionRequestMessage:](v8, "setPlaybackSessionRequestMessage:", v7);
        break;
      case 0x47uLL:
        -[_MRMediaRemoteMessageProtobuf setPlaybackSessionResponseMessage:](v8, "setPlaybackSessionResponseMessage:", v7);
        break;
      case 0x48uLL:
        -[_MRMediaRemoteMessageProtobuf setSetDefaultSupportedCommandsMessage:](v8, "setSetDefaultSupportedCommandsMessage:", v7);
        break;
      case 0x49uLL:
        -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateRequestMessage:](v8, "setPlaybackSessionMigrateRequestMessage:", v7);
        break;
      case 0x4AuLL:
        -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateResponseMessage:](v8, "setPlaybackSessionMigrateResponseMessage:", v7);
        break;
      case 0x4BuLL:
        -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateBeginMessage:](v8, "setPlaybackSessionMigrateBeginMessage:", v7);
        break;
      case 0x4CuLL:
        -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateEndMessage:](v8, "setPlaybackSessionMigrateEndMessage:", v7);
        break;
      case 0x4DuLL:
        -[_MRMediaRemoteMessageProtobuf setUpdateActiveSystemEndpointMessage:](v8, "setUpdateActiveSystemEndpointMessage:", v7);
        break;
      case 0x65uLL:
        -[_MRMediaRemoteMessageProtobuf setDiscoveryModeMessage:](v8, "setDiscoveryModeMessage:", v7);
        break;
      case 0x66uLL:
        -[_MRMediaRemoteMessageProtobuf setUpdateEndpointsMessage:](v8, "setUpdateEndpointsMessage:", v7);
        break;
      case 0x67uLL:
        -[_MRMediaRemoteMessageProtobuf setRemoveEndpointsMessage:](v8, "setRemoveEndpointsMessage:", v7);
        break;
      case 0x68uLL:
        -[_MRMediaRemoteMessageProtobuf setPlayerClientPropertiesMessage:](v8, "setPlayerClientPropertiesMessage:", v7);
        break;
      case 0x69uLL:
        -[_MRMediaRemoteMessageProtobuf setOriginClientPropertiesMessage:](v8, "setOriginClientPropertiesMessage:", v7);
        break;
      case 0x6AuLL:
        -[_MRMediaRemoteMessageProtobuf setAudioFadeMessage:](v8, "setAudioFadeMessage:", v7);
        break;
      case 0x6BuLL:
        -[_MRMediaRemoteMessageProtobuf setAudioFadeResponseMessage:](v8, "setAudioFadeResponseMessage:", v7);
        break;
      case 0x6CuLL:
        -[_MRMediaRemoteMessageProtobuf setDiscoveryUpdateEndpointsMessage:](v8, "setDiscoveryUpdateEndpointsMessage:", v7);
        break;
      case 0x6DuLL:
        -[_MRMediaRemoteMessageProtobuf setDiscoveryUpdateOutputDevicesMessage:](v8, "setDiscoveryUpdateOutputDevicesMessage:", v7);
        break;
      case 0x6EuLL:
        -[_MRMediaRemoteMessageProtobuf setSetListeningModeMessage:](v8, "setSetListeningModeMessage:", v7);
        break;
      case 0x78uLL:
        -[_MRMediaRemoteMessageProtobuf setConfigureConnectionMessage:](v8, "setConfigureConnectionMessage:", v7);
        break;
      case 0x79uLL:
        -[_MRMediaRemoteMessageProtobuf setCreateHostedEndpointRequest:](v8, "setCreateHostedEndpointRequest:", v7);
        break;
      case 0x7AuLL:
        -[_MRMediaRemoteMessageProtobuf setCreateHostedEndpointResponse:](v8, "setCreateHostedEndpointResponse:", v7);
        break;
      case 0x7DuLL:
        -[_MRMediaRemoteMessageProtobuf setAdjustVolumeMessage:](v8, "setAdjustVolumeMessage:", v7);
        break;
      case 0x7EuLL:
        -[_MRMediaRemoteMessageProtobuf setGetVolumeMutedMessage:](v8, "setGetVolumeMutedMessage:", v7);
        break;
      case 0x7FuLL:
        -[_MRMediaRemoteMessageProtobuf setGetVolumeMutedResultMessage:](v8, "setGetVolumeMutedResultMessage:", v7);
        break;
      case 0x80uLL:
        -[_MRMediaRemoteMessageProtobuf setSetVolumeMutedMessage:](v8, "setSetVolumeMutedMessage:", v7);
        break;
      case 0x81uLL:
        -[_MRMediaRemoteMessageProtobuf setVolumeMutedDidChangeMessage:](v8, "setVolumeMutedDidChangeMessage:", v7);
        break;
      case 0x82uLL:
        -[_MRMediaRemoteMessageProtobuf setSetConversationDetectionEnabledMessage:](v8, "setSetConversationDetectionEnabledMessage:", v7);
        break;
      case 0x83uLL:
        -[_MRMediaRemoteMessageProtobuf setPlayerClientParticipantsUpdateMessage:](v8, "setPlayerClientParticipantsUpdateMessage:", v7);
        break;
      case 0x84uLL:
        -[_MRMediaRemoteMessageProtobuf setRequestGroupSessionMessage:](v8, "setRequestGroupSessionMessage:", v7);
        break;
      default:
        break;
    }
    -[_MRMediaRemoteMessageProtobuf data](v8, "data");
    v17 = (NSData *)objc_claimAutoreleasedReturnValue();
    v18 = self->_protobufData;
    self->_protobufData = v17;

    protobufData = self->_protobufData;
  }
  return protobufData;
}

- (PBCodable)underlyingCodableMessage
{
  return self->_underlyingCodableMessage;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)replyIdentifier
{
  return self->_replyIdentifier;
}

+ (id)protocolMessageWithProtobufData:(id)a3 error:(id *)a4
{
  id v5;
  _MRMediaRemoteMessageProtobuf *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = -[_MRMediaRemoteMessageProtobuf initWithData:]([_MRMediaRemoteMessageProtobuf alloc], "initWithData:", v5);

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    switch(-[_MRMediaRemoteMessageProtobuf type](v6, "type"))
    {
      case 0:
      case 3:
      case 9:
      case 0x86:
        v7 = (objc_class *)objc_opt_class();
        v8 = 0;
        break;
      case 1:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf sendCommandMessage](v6, "sendCommandMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 2:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf sendCommandResultMessage](v6, "sendCommandResultMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 4:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setStateMessage](v6, "setStateMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 5:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setArtworkMessage](v6, "setArtworkMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 6:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf registerHIDDeviceMessage](v6, "registerHIDDeviceMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 7:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf registerHIDDeviceResultMessage](v6, "registerHIDDeviceResultMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 8:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf sendHIDEventMessage](v6, "sendHIDEventMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0xA:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf sendVirtualTouchEventMessage](v6, "sendVirtualTouchEventMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0xB:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf notificationMessage](v6, "notificationMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0xC:
      case 0xD:
      case 0xE:
      case 0x2D:
      case 0x4E:
      case 0x4F:
      case 0x50:
      case 0x51:
      case 0x52:
      case 0x53:
      case 0x54:
      case 0x55:
      case 0x56:
      case 0x57:
      case 0x58:
      case 0x59:
      case 0x5A:
      case 0x5B:
      case 0x5C:
      case 0x5D:
      case 0x5E:
      case 0x5F:
      case 0x60:
      case 0x61:
      case 0x62:
      case 0x63:
      case 0x64:
      case 0x6F:
      case 0x70:
      case 0x71:
      case 0x72:
      case 0x73:
      case 0x74:
      case 0x75:
      case 0x76:
      case 0x77:
      case 0x7B:
      case 0x7C:
      case 0x85:
        break;
      case 0xF:
      case 0x25:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf deviceInfoMessage](v6, "deviceInfoMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x10:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf clientUpdatesConfigMessage](v6, "clientUpdatesConfigMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x11:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf masterVolumeControlCapabilitiesDidChangeMessage](v6, "masterVolumeControlCapabilitiesDidChangeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x12:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf gameController](v6, "gameController");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x13:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf registerGameController](v6, "registerGameController");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x14:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf registerGameControllerResponse](v6, "registerGameControllerResponse");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x15:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf unregisterGameController](v6, "unregisterGameController");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x16:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf registerForGameControllerEvents](v6, "registerForGameControllerEvents");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x17:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf keyboardMessage](v6, "keyboardMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x18:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf getKeyboardMessage](v6, "getKeyboardMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x19:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf textInputMessage](v6, "textInputMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x1A:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf getVoiceInputDevicesMessage](v6, "getVoiceInputDevicesMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x1B:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf getVoiceInputDevicesResponseMessage](v6, "getVoiceInputDevicesResponseMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x1C:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf registerVoiceInputDeviceMessage](v6, "registerVoiceInputDeviceMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x1D:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf registerVoiceInputDeviceResponseMessage](v6, "registerVoiceInputDeviceResponseMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x1E:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setRecordingStateMessage](v6, "setRecordingStateMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x1F:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf sendVoiceInputMessage](v6, "sendVoiceInputMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x20:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf playbackQueueRequest](v6, "playbackQueueRequest");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x21:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf transactionPackets](v6, "transactionPackets");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x22:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf cryptoPairingMessage](v6, "cryptoPairingMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x23:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf gameControllerProperties](v6, "gameControllerProperties");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x24:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf readyStateMessage](v6, "readyStateMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x26:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf connectionState](v6, "connectionState");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x27:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf sendButtonEventMessage](v6, "sendButtonEventMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x28:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setHiliteModeMessage](v6, "setHiliteModeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x29:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf wakeDeviceMessage](v6, "wakeDeviceMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x2A:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf genericMessage](v6, "genericMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x2B:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf sendPackedVirtualTouchEventMessage](v6, "sendPackedVirtualTouchEventMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x2C:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf sendLyricsEventMessage](v6, "sendLyricsEventMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x2E:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setNowPlayingClientMessage](v6, "setNowPlayingClientMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x2F:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setNowPlayingPlayerMessage](v6, "setNowPlayingPlayerMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x30:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf modifyOutputContextRequestMessage](v6, "modifyOutputContextRequestMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x31:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf getVolumeMessage](v6, "getVolumeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x32:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf getVolumeResultMessage](v6, "getVolumeResultMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x33:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setVolumeMessage](v6, "setVolumeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x34:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf volumeDidChangeMessage](v6, "volumeDidChangeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x35:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf removeClientMessage](v6, "removeClientMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x36:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf removePlayerMessage](v6, "removePlayerMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x37:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf updateClientMessage](v6, "updateClientMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x38:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf updateContentItemMessage](v6, "updateContentItemMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x39:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf updateContentItemArtworkMessage](v6, "updateContentItemArtworkMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x3A:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf updatePlayerMessage](v6, "updatePlayerMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x3B:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf promptForRouteAuthorizationMessage](v6, "promptForRouteAuthorizationMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x3C:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf promptForRouteAuthorizationResponseMessage](v6, "promptForRouteAuthorizationResponseMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x3D:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf presentRouteAuthorizationStatusMessage](v6, "presentRouteAuthorizationStatusMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x3E:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf getVolumeControlCapabilitiesMessage](v6, "getVolumeControlCapabilitiesMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x3F:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf getVolumeControlCapabilitiesResultMessage](v6, "getVolumeControlCapabilitiesResultMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x40:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf volumeControlCapabilitiesDidChangeMessage](v6, "volumeControlCapabilitiesDidChangeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x41:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf updateOutputDevicesMessage](v6, "updateOutputDevicesMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x42:
      case 0x45:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf removeOutputDevicesMessage](v6, "removeOutputDevicesMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x43:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf remoteTextInputMessage](v6, "remoteTextInputMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x44:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf getRemoteTextInputSessionMessage](v6, "getRemoteTextInputSessionMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x46:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf playbackSessionRequestMessage](v6, "playbackSessionRequestMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x47:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf playbackSessionResponseMessage](v6, "playbackSessionResponseMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x48:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setDefaultSupportedCommandsMessage](v6, "setDefaultSupportedCommandsMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x49:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf playbackSessionMigrateRequestMessage](v6, "playbackSessionMigrateRequestMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x4A:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf playbackSessionMigrateResponseMessage](v6, "playbackSessionMigrateResponseMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x4B:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf playbackSessionMigrateBeginMessage](v6, "playbackSessionMigrateBeginMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x4C:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf playbackSessionMigrateEndMessage](v6, "playbackSessionMigrateEndMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x4D:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf updateActiveSystemEndpointMessage](v6, "updateActiveSystemEndpointMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x65:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf discoveryModeMessage](v6, "discoveryModeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x66:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf updateEndpointsMessage](v6, "updateEndpointsMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x67:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf removeEndpointsMessage](v6, "removeEndpointsMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x68:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf playerClientPropertiesMessage](v6, "playerClientPropertiesMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x69:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf originClientPropertiesMessage](v6, "originClientPropertiesMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x6A:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf audioFadeMessage](v6, "audioFadeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x6B:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf audioFadeResponseMessage](v6, "audioFadeResponseMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x6C:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf discoveryUpdateEndpointsMessage](v6, "discoveryUpdateEndpointsMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x6D:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf discoveryUpdateOutputDevicesMessage](v6, "discoveryUpdateOutputDevicesMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x6E:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setListeningModeMessage](v6, "setListeningModeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x78:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf configureConnectionMessage](v6, "configureConnectionMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x79:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf createHostedEndpointRequest](v6, "createHostedEndpointRequest");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x7A:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf createHostedEndpointResponse](v6, "createHostedEndpointResponse");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x7D:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf adjustVolumeMessage](v6, "adjustVolumeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x7E:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf getVolumeMutedMessage](v6, "getVolumeMutedMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x7F:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf getVolumeMutedResultMessage](v6, "getVolumeMutedResultMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x80:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setVolumeMutedMessage](v6, "setVolumeMutedMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x81:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf volumeMutedDidChangeMessage](v6, "volumeMutedDidChangeMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x82:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf setConversationDetectionEnabledMessage](v6, "setConversationDetectionEnabledMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x83:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf playerClientParticipantsUpdateMessage](v6, "playerClientParticipantsUpdateMessage");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      case 0x84:
        v7 = (objc_class *)objc_opt_class();
        -[_MRMediaRemoteMessageProtobuf requestGroupSessionMessage](v6, "requestGroupSessionMessage");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_97:
        v8 = (void *)v10;
        break;
      default:
        v8 = 0;
        break;
    }
    if (-[_MRMediaRemoteMessageProtobuf hasError](v6, "hasError")
      && (-[_MRMediaRemoteMessageProtobuf error](v6, "error"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "code"),
          v11,
          v12))
    {
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      -[_MRMediaRemoteMessageProtobuf error](v6, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mr_initWithProtobuf:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!-[_MRMediaRemoteMessageProtobuf errorCode](v6, "errorCode"))
      {
        v15 = 0;
        goto LABEL_105;
      }
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v17 = -[_MRMediaRemoteMessageProtobuf errorCode](v6, "errorCode");
      -[_MRMediaRemoteMessageProtobuf errorDescription](v6, "errorDescription");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v16, "initWithMRError:description:", v17, v13);
    }

LABEL_105:
    v9 = (void *)objc_msgSend([v7 alloc], "initWithUnderlyingCodableMessage:error:", v8, v15);
    objc_msgSend(v9, "setTimestamp:", -[_MRMediaRemoteMessageProtobuf timestamp](v6, "timestamp"));
    -[_MRMediaRemoteMessageProtobuf replyIdentifier](v6, "replyIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReplyIdentifier:", v18);

    -[_MRMediaRemoteMessageProtobuf uniqueIdentifier](v6, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUniqueIdentifier:", v19);

    goto LABEL_106;
  }
  v9 = 0;
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 2, CFSTR("Message is corrupted."));
LABEL_106:

  return v9;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (void)setReplyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MRProtocolMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  MRProtocolMessage *v9;
  MRProtocolMessage *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[MRProtocolMessage init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_underlyingCodableMessage, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (MRProtocolMessage)init
{
  MRProtocolMessage *v2;
  void *v3;
  uint64_t v4;
  NSString *uniqueIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRProtocolMessage;
  v2 = -[MRProtocolMessage init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v2->_uniqueIdentifier;
    v2->_uniqueIdentifier = (NSString *)v4;

  }
  return v2;
}

- (void)setUnderlyingCodableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingCodableMessage, a3);
}

+ (unint64_t)currentProtocolVersion
{
  return 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("\n<%@, "), objc_opt_class());
  if (-[MRProtocolMessage timestamp](self, "timestamp"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Timestamp=<%llu>, "), -[MRProtocolMessage timestamp](self, "timestamp"));
  -[MRProtocolMessage error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MRProtocolMessage error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Error=<%@>, "), v5);

  }
  -[MRProtocolMessage uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MRProtocolMessage uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("UniqueIdentifier=<%@>, "), v7);

  }
  -[MRProtocolMessage replyIdentifier](self, "replyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MRProtocolMessage replyIdentifier](self, "replyIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("ReplyIdentifier=<%@> "), v9);

  }
  if (MSVDeviceOSIsInternalInstall())
  {
    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\nMessage: %@\n"), v10);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("\nMessage: REDACTED\n"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (unint64_t)encryptionType
{
  return 1;
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)shouldLog
{
  return 1;
}

- (BOOL)reply
{
  return -[MRProtocolMessage replyWithMessage:](self, "replyWithMessage:", 0);
}

- (BOOL)replyWithMessage:(id)a3
{
  MRProtocolMessage *v4;
  void *v5;
  NSString *replyIdentifier;
  MRProtocolMessage *v7;
  void *Error;
  BOOL v9;
  NSObject *v10;

  v4 = (MRProtocolMessage *)a3;
  -[MRProtocolMessage clientConnection](self, "clientConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _MRLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MRProtocolMessage replyWithMessage:].cold.1();
    goto LABEL_10;
  }
  replyIdentifier = self->_replyIdentifier;
  if (!replyIdentifier)
  {
    _MRLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MRProtocolMessage replyWithMessage:].cold.2();
LABEL_10:

    v9 = 0;
    goto LABEL_11;
  }
  if (!v4)
  {
    v7 = [MRProtocolMessage alloc];
    Error = (void *)MRMediaRemoteCreateError(1);
    v4 = -[MRProtocolMessage initWithUnderlyingCodableMessage:error:](v7, "initWithUnderlyingCodableMessage:error:", 0, Error);

    replyIdentifier = self->_replyIdentifier;
  }
  -[MRProtocolMessage setReplyIdentifier:](v4, "setReplyIdentifier:", replyIdentifier);
  v9 = 1;
  -[MRProtocolMessage setIsOutgoingReply:](v4, "setIsOutgoingReply:", 1);
  objc_msgSend(v5, "sendMessage:", v4);
  self->_replied = 1;
LABEL_11:

  return v9;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MRProtocolMessageOptions)transportOptions
{
  return self->_transportOptions;
}

- (void)setTransportOptions:(id)a3
{
  objc_storeStrong((id *)&self->_transportOptions, a3);
}

- (void)setClientConnection:(id)a3
{
  objc_storeWeak((id *)&self->_clientConnection, a3);
}

- (BOOL)isIncomingReply
{
  return self->_isIncomingReply;
}

- (void)setIsIncomingReply:(BOOL)a3
{
  self->_isIncomingReply = a3;
}

- (BOOL)isOutgoingReply
{
  return self->_isOutgoingReply;
}

- (void)setIsOutgoingReply:(BOOL)a3
{
  self->_isOutgoingReply = a3;
}

- (void)replyWithMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "Could not send reply message because there is no client %{public}@ ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)replyWithMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "Could not send reply because the message was not expecting a reply: %{public}@ ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
