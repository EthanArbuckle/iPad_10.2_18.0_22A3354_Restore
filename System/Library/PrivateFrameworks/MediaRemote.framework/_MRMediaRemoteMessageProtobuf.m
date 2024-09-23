@implementation _MRMediaRemoteMessageProtobuf

- (BOOL)readFrom:(id)a3
{
  return _MRMediaRemoteMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setReplyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_replyIdentifier, a3);
}

- (void)setGetVolumeMutedResultMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getVolumeMutedResultMessage, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 0;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)replyIdentifier
{
  return self->_replyIdentifier;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (_MRGetVolumeMutedResultMessageProtobuf)getVolumeMutedResultMessage
{
  return self->_getVolumeMutedResultMessage;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeDeviceMessage, 0);
  objc_storeStrong((id *)&self->_volumeMutedDidChangeMessage, 0);
  objc_storeStrong((id *)&self->_volumeDidChangeMessage, 0);
  objc_storeStrong((id *)&self->_volumeControlCapabilitiesDidChangeMessage, 0);
  objc_storeStrong((id *)&self->_updatePlayerMessage, 0);
  objc_storeStrong((id *)&self->_updateOutputDevicesMessage, 0);
  objc_storeStrong((id *)&self->_updateEndpointsMessage, 0);
  objc_storeStrong((id *)&self->_updateContentItemMessage, 0);
  objc_storeStrong((id *)&self->_updateContentItemArtworkMessage, 0);
  objc_storeStrong((id *)&self->_updateClientMessage, 0);
  objc_storeStrong((id *)&self->_updateActiveSystemEndpointMessage, 0);
  objc_storeStrong((id *)&self->_unregisterGameController, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionPackets, 0);
  objc_storeStrong((id *)&self->_textInputMessage, 0);
  objc_storeStrong((id *)&self->_setVolumeMutedMessage, 0);
  objc_storeStrong((id *)&self->_setVolumeMessage, 0);
  objc_storeStrong((id *)&self->_setStateMessage, 0);
  objc_storeStrong((id *)&self->_setRecordingStateMessage, 0);
  objc_storeStrong((id *)&self->_setNowPlayingPlayerMessage, 0);
  objc_storeStrong((id *)&self->_setNowPlayingClientMessage, 0);
  objc_storeStrong((id *)&self->_setListeningModeMessage, 0);
  objc_storeStrong((id *)&self->_setHiliteModeMessage, 0);
  objc_storeStrong((id *)&self->_setDefaultSupportedCommandsMessage, 0);
  objc_storeStrong((id *)&self->_setConversationDetectionEnabledMessage, 0);
  objc_storeStrong((id *)&self->_setArtworkMessage, 0);
  objc_storeStrong((id *)&self->_sendVoiceInputMessage, 0);
  objc_storeStrong((id *)&self->_sendVirtualTouchEventMessage, 0);
  objc_storeStrong((id *)&self->_sendPackedVirtualTouchEventMessage, 0);
  objc_storeStrong((id *)&self->_sendLyricsEventMessage, 0);
  objc_storeStrong((id *)&self->_sendHIDReportMessage, 0);
  objc_storeStrong((id *)&self->_sendHIDEventMessage, 0);
  objc_storeStrong((id *)&self->_sendCommandResultMessage, 0);
  objc_storeStrong((id *)&self->_sendCommandMessage, 0);
  objc_storeStrong((id *)&self->_sendButtonEventMessage, 0);
  objc_storeStrong((id *)&self->_requestGroupSessionMessage, 0);
  objc_storeStrong((id *)&self->_replyIdentifier, 0);
  objc_storeStrong((id *)&self->_removePlayerMessage, 0);
  objc_storeStrong((id *)&self->_removeOutputDevicesMessage, 0);
  objc_storeStrong((id *)&self->_removeEndpointsMessage, 0);
  objc_storeStrong((id *)&self->_removeClientMessage, 0);
  objc_storeStrong((id *)&self->_remoteTextInputMessage, 0);
  objc_storeStrong((id *)&self->_registerVoiceInputDeviceResponseMessage, 0);
  objc_storeStrong((id *)&self->_registerVoiceInputDeviceMessage, 0);
  objc_storeStrong((id *)&self->_registerHIDDeviceResultMessage, 0);
  objc_storeStrong((id *)&self->_registerHIDDeviceMessage, 0);
  objc_storeStrong((id *)&self->_registerGameControllerResponse, 0);
  objc_storeStrong((id *)&self->_registerGameController, 0);
  objc_storeStrong((id *)&self->_registerForGameControllerEvents, 0);
  objc_storeStrong((id *)&self->_readyStateMessage, 0);
  objc_storeStrong((id *)&self->_promptForRouteAuthorizationResponseMessage, 0);
  objc_storeStrong((id *)&self->_promptForRouteAuthorizationMessage, 0);
  objc_storeStrong((id *)&self->_presentRouteAuthorizationStatusMessage, 0);
  objc_storeStrong((id *)&self->_playerClientPropertiesMessage, 0);
  objc_storeStrong((id *)&self->_playerClientParticipantsUpdateMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionResponseMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionRequestMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionMigrateResponseMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionMigrateRequestMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionMigrateEndMessage, 0);
  objc_storeStrong((id *)&self->_playbackSessionMigrateBeginMessage, 0);
  objc_storeStrong((id *)&self->_playbackQueueRequest, 0);
  objc_storeStrong((id *)&self->_originClientPropertiesMessage, 0);
  objc_storeStrong((id *)&self->_notificationMessage, 0);
  objc_storeStrong((id *)&self->_modifyOutputContextRequestMessage, 0);
  objc_storeStrong((id *)&self->_masterVolumeControlCapabilitiesDidChangeMessage, 0);
  objc_storeStrong((id *)&self->_keyboardMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeResultMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeMutedResultMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeMutedMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeControlCapabilitiesResultMessage, 0);
  objc_storeStrong((id *)&self->_getVolumeControlCapabilitiesMessage, 0);
  objc_storeStrong((id *)&self->_getVoiceInputDevicesResponseMessage, 0);
  objc_storeStrong((id *)&self->_getVoiceInputDevicesMessage, 0);
  objc_storeStrong((id *)&self->_getStateMessage, 0);
  objc_storeStrong((id *)&self->_getRemoteTextInputSessionMessage, 0);
  objc_storeStrong((id *)&self->_getKeyboardMessage, 0);
  objc_storeStrong((id *)&self->_genericMessage, 0);
  objc_storeStrong((id *)&self->_gameControllerProperties, 0);
  objc_storeStrong((id *)&self->_gameController, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_discoveryUpdateOutputDevicesMessage, 0);
  objc_storeStrong((id *)&self->_discoveryUpdateEndpointsMessage, 0);
  objc_storeStrong((id *)&self->_discoveryModeMessage, 0);
  objc_storeStrong((id *)&self->_deviceInfoMessage, 0);
  objc_storeStrong((id *)&self->_cryptoPairingMessage, 0);
  objc_storeStrong((id *)&self->_createHostedEndpointResponse, 0);
  objc_storeStrong((id *)&self->_createHostedEndpointRequest, 0);
  objc_storeStrong((id *)&self->_contentItemsChangedNotificationMessage, 0);
  objc_storeStrong((id *)&self->_connectionState, 0);
  objc_storeStrong((id *)&self->_configureConnectionMessage, 0);
  objc_storeStrong((id *)&self->_clientUpdatesConfigMessage, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_audioFadeResponseMessage, 0);
  objc_storeStrong((id *)&self->_audioFadeMessage, 0);
  objc_storeStrong((id *)&self->_adjustVolumeMessage, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_replyIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_authenticationToken)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_sendCommandMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sendCommandResultMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getStateMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setStateMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setArtworkMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_registerHIDDeviceMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_registerHIDDeviceResultMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sendHIDEventMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sendHIDReportMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sendVirtualTouchEventMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_notificationMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_contentItemsChangedNotificationMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_deviceInfoMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_clientUpdatesConfigMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_masterVolumeControlCapabilitiesDidChangeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_gameController)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_registerGameController)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_registerGameControllerResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_unregisterGameController)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_registerForGameControllerEvents)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_keyboardMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getKeyboardMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_textInputMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getVoiceInputDevicesMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getVoiceInputDevicesResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_registerVoiceInputDeviceMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_registerVoiceInputDeviceResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setRecordingStateMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sendVoiceInputMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_playbackQueueRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_transactionPackets)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_cryptoPairingMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_gameControllerProperties)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_readyStateMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_connectionState)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sendButtonEventMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setHiliteModeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_wakeDeviceMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_genericMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sendPackedVirtualTouchEventMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sendLyricsEventMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setNowPlayingClientMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setNowPlayingPlayerMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_modifyOutputContextRequestMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getVolumeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getVolumeResultMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setVolumeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_volumeDidChangeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_removeClientMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_removePlayerMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_updateClientMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_updateContentItemMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_updateContentItemArtworkMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_updatePlayerMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_promptForRouteAuthorizationMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_promptForRouteAuthorizationResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_presentRouteAuthorizationStatusMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getVolumeControlCapabilitiesMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getVolumeControlCapabilitiesResultMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_volumeControlCapabilitiesDidChangeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_updateOutputDevicesMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_removeOutputDevicesMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_remoteTextInputMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getRemoteTextInputSessionMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_playbackSessionRequestMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_playbackSessionResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setDefaultSupportedCommandsMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_playbackSessionMigrateRequestMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_playbackSessionMigrateResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_playbackSessionMigrateBeginMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_playbackSessionMigrateEndMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_updateActiveSystemEndpointMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_discoveryModeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_updateEndpointsMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_removeEndpointsMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_uniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_playerClientPropertiesMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_originClientPropertiesMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_audioFadeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_audioFadeResponseMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_discoveryUpdateEndpointsMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_discoveryUpdateOutputDevicesMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setListeningModeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_configureConnectionMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_createHostedEndpointRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_createHostedEndpointResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_adjustVolumeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getVolumeMutedMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_getVolumeMutedResultMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setVolumeMutedMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_volumeMutedDidChangeMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_setConversationDetectionEnabledMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_playerClientParticipantsUpdateMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_requestGroupSessionMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("Unknown");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("SendCommand");
      return v3;
    case 2:
      return CFSTR("SendCommandResult");
    case 3:
      return CFSTR("GetState");
    case 4:
      return CFSTR("SetState");
    case 5:
      return CFSTR("SetArtwork");
    case 6:
      return CFSTR("RegisterHIDDevice");
    case 7:
      return CFSTR("RegisterHIDDeviceResult");
    case 8:
      return CFSTR("SendHIDEvent");
    case 9:
      return CFSTR("SendHIDReport");
    case 10:
      return CFSTR("SendVirtualTouchEvent");
    case 11:
      return CFSTR("Notification");
    case 15:
      return CFSTR("DeviceInfo");
    case 16:
      return CFSTR("ClientUpdatesConfiguration");
    case 17:
      return CFSTR("LegacyVolumeControlCapabilitiesDidChange");
    case 18:
      return CFSTR("GameController");
    case 19:
      return CFSTR("RegisterGameController");
    case 20:
      return CFSTR("RegisterGameControllerResponse");
    case 21:
      return CFSTR("UnregisterGameController");
    case 22:
      return CFSTR("RegisterForGameControllerEvents");
    case 23:
      return CFSTR("Keyboard");
    case 24:
      return CFSTR("GetKeyboardSession");
    case 25:
      return CFSTR("TextInput");
    case 26:
      return CFSTR("GetVoiceInputDevices");
    case 27:
      return CFSTR("GetVoiceInputDevicesResponse");
    case 28:
      return CFSTR("RegisterVoiceInputDevice");
    case 29:
      return CFSTR("RegisterVoiceInputDeviceResponse");
    case 30:
      return CFSTR("SetVoiceInputRecordingState");
    case 31:
      return CFSTR("SendVoiceInput");
    case 32:
      return CFSTR("PlaybackQueueRequest");
    case 33:
      return CFSTR("Transaction");
    case 34:
      return CFSTR("CryptoPairing");
    case 35:
      return CFSTR("GameControllerProperties");
    case 36:
      return CFSTR("SetReadyState");
    case 37:
      return CFSTR("DeviceInfoUpdate");
    case 38:
      return CFSTR("SetConnectionState");
    case 39:
      return CFSTR("SendButtonEvent");
    case 40:
      return CFSTR("SetHiliteMode");
    case 41:
      return CFSTR("WakeDevice");
    case 42:
      return CFSTR("Generic");
    case 43:
      return CFSTR("SendPackedVirtualTouchEvent");
    case 44:
      return CFSTR("SendLyricsEventMessage");
    case 46:
      return CFSTR("SetNowPlayingClient");
    case 47:
      return CFSTR("SetNowPlayingPlayer");
    case 48:
      return CFSTR("ModifyOutputContextRequest");
    case 49:
      return CFSTR("GetVolume");
    case 50:
      return CFSTR("GetVolumeResult");
    case 51:
      return CFSTR("SetVolume");
    case 52:
      return CFSTR("VolumeDidChange");
    case 53:
      return CFSTR("RemoveClient");
    case 54:
      return CFSTR("RemovePlayer");
    case 55:
      return CFSTR("UpdateClient");
    case 56:
      return CFSTR("UpdateContentItems");
    case 57:
      return CFSTR("UpdateContentItemArtwork");
    case 58:
      return CFSTR("UpdatePlayer");
    case 59:
      return CFSTR("PromptForRouteAuthorization");
    case 60:
      return CFSTR("PromptForRouteAuthorizationResponse");
    case 61:
      return CFSTR("PresentRouteAuthorizationStatus");
    case 62:
      return CFSTR("GetVolumeControlCapabilities");
    case 63:
      return CFSTR("GetVolumeControlCapabilitiesResult");
    case 64:
      return CFSTR("VolumeControlCapabilitiesDidChange");
    case 65:
      return CFSTR("UpdateOutputDevices");
    case 66:
      return CFSTR("RemoveOutputDevices");
    case 67:
      return CFSTR("RemoteTextInput");
    case 68:
      return CFSTR("GetRemoteTextInputSession");
    case 69:
      return CFSTR("RemoveFromParentGroup");
    case 70:
      return CFSTR("PlaybackSessionRequest");
    case 71:
      return CFSTR("PlaybackSessionResponse");
    case 72:
      return CFSTR("SetDefaultSupportedCommands");
    case 73:
      return CFSTR("PlaybackSessionMigrateRequest");
    case 74:
      return CFSTR("PlaybackSessionMigrateResponse");
    case 75:
      return CFSTR("PlaybackSessionMigrateBegin");
    case 76:
      return CFSTR("PlaybackSessionMigrateEnd");
    case 77:
      return CFSTR("UpdateActiveSystemEndpoint");
    case 101:
      return CFSTR("SetDiscoveryMode");
    case 102:
      return CFSTR("UpdateEndpoints");
    case 103:
      return CFSTR("RemoveEndpoints");
    case 104:
      return CFSTR("SetPlayerClientProperties");
    case 105:
      return CFSTR("SetOriginClientProperties");
    case 106:
      return CFSTR("AudioFade");
    case 107:
      return CFSTR("AudioFadeResponse");
    case 108:
      return CFSTR("DiscoveryUpdateEndpoints");
    case 109:
      return CFSTR("DiscoveryUpdateOutputDevices");
    case 110:
      return CFSTR("SetListeningMode");
    case 120:
      return CFSTR("ConfigureConnection");
    case 121:
      return CFSTR("CreatedHostedEndpointRequest");
    case 122:
      return CFSTR("CreatedHostedEndpointResponse");
    case 125:
      return CFSTR("AdjustVolume");
    case 126:
      return CFSTR("GetVolumeMuted");
    case 127:
      return CFSTR("GetVolumeMutedResult");
    case 128:
      return CFSTR("SetVolumeMuted");
    case 129:
      return CFSTR("VolumeMutedDidChange");
    case 130:
      return CFSTR("SetConversationDetectionEnabled");
    case 131:
      return CFSTR("PlayerClientParticipantsUpdate");
    case 132:
      return CFSTR("RequestGroupSession");
    case 133:
      return CFSTR("ConfigureConnectionService");
    case 134:
      return CFSTR("LastMessageType");
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendCommand")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendCommandResult")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetState")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetState")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetArtwork")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RegisterHIDDevice")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RegisterHIDDeviceResult")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendHIDEvent")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendHIDReport")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendVirtualTouchEvent")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Notification")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DeviceInfo")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClientUpdatesConfiguration")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LegacyVolumeControlCapabilitiesDidChange")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GameController")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RegisterGameController")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RegisterGameControllerResponse")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnregisterGameController")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RegisterForGameControllerEvents")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Keyboard")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetKeyboardSession")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TextInput")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetVoiceInputDevices")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetVoiceInputDevicesResponse")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RegisterVoiceInputDevice")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RegisterVoiceInputDeviceResponse")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetVoiceInputRecordingState")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendVoiceInput")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlaybackQueueRequest")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Transaction")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CryptoPairing")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GameControllerProperties")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetReadyState")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DeviceInfoUpdate")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetConnectionState")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendButtonEvent")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetHiliteMode")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WakeDevice")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Generic")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendPackedVirtualTouchEvent")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendLyricsEventMessage")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetNowPlayingClient")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetNowPlayingPlayer")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ModifyOutputContextRequest")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetVolume")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetVolumeResult")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetVolume")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VolumeDidChange")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoveClient")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemovePlayer")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpdateClient")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpdateContentItems")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpdateContentItemArtwork")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpdatePlayer")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PromptForRouteAuthorization")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PromptForRouteAuthorizationResponse")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PresentRouteAuthorizationStatus")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetVolumeControlCapabilities")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetVolumeControlCapabilitiesResult")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VolumeControlCapabilitiesDidChange")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpdateOutputDevices")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoveOutputDevices")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoteTextInput")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetRemoteTextInputSession")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoveFromParentGroup")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlaybackSessionRequest")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlaybackSessionResponse")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetDefaultSupportedCommands")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlaybackSessionMigrateRequest")) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlaybackSessionMigrateResponse")) & 1) != 0)
  {
    v4 = 74;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlaybackSessionMigrateBegin")) & 1) != 0)
  {
    v4 = 75;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlaybackSessionMigrateEnd")) & 1) != 0)
  {
    v4 = 76;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpdateActiveSystemEndpoint")) & 1) != 0)
  {
    v4 = 77;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetDiscoveryMode")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpdateEndpoints")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoveEndpoints")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetPlayerClientProperties")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetOriginClientProperties")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AudioFade")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AudioFadeResponse")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DiscoveryUpdateEndpoints")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DiscoveryUpdateOutputDevices")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetListeningMode")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfigureConnection")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CreatedHostedEndpointRequest")) & 1) != 0)
  {
    v4 = 121;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CreatedHostedEndpointResponse")) & 1) != 0)
  {
    v4 = 122;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdjustVolume")) & 1) != 0)
  {
    v4 = 125;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetVolumeMuted")) & 1) != 0)
  {
    v4 = 126;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GetVolumeMutedResult")) & 1) != 0)
  {
    v4 = 127;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetVolumeMuted")) & 1) != 0)
  {
    v4 = 128;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VolumeMutedDidChange")) & 1) != 0)
  {
    v4 = 129;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SetConversationDetectionEnabled")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlayerClientParticipantsUpdate")) & 1) != 0)
  {
    v4 = 131;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequestGroupSession")) & 1) != 0)
  {
    v4 = 132;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfigureConnectionService")) & 1) != 0)
  {
    v4 = 133;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LastMessageType")))
  {
    v4 = 134;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasReplyIdentifier
{
  return self->_replyIdentifier != 0;
}

- (BOOL)hasAuthenticationToken
{
  return self->_authenticationToken != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasSendCommandMessage
{
  return self->_sendCommandMessage != 0;
}

- (BOOL)hasSendCommandResultMessage
{
  return self->_sendCommandResultMessage != 0;
}

- (BOOL)hasSetStateMessage
{
  return self->_setStateMessage != 0;
}

- (BOOL)hasNotificationMessage
{
  return self->_notificationMessage != 0;
}

- (BOOL)hasContentItemsChangedNotificationMessage
{
  return self->_contentItemsChangedNotificationMessage != 0;
}

- (BOOL)hasDeviceInfoMessage
{
  return self->_deviceInfoMessage != 0;
}

- (BOOL)hasClientUpdatesConfigMessage
{
  return self->_clientUpdatesConfigMessage != 0;
}

- (BOOL)hasPlaybackQueueRequest
{
  return self->_playbackQueueRequest != 0;
}

- (BOOL)hasConnectionState
{
  return self->_connectionState != 0;
}

- (BOOL)hasGetVolumeMessage
{
  return self->_getVolumeMessage != 0;
}

- (BOOL)hasGetVolumeResultMessage
{
  return self->_getVolumeResultMessage != 0;
}

- (BOOL)hasSetVolumeMessage
{
  return self->_setVolumeMessage != 0;
}

- (BOOL)hasVolumeDidChangeMessage
{
  return self->_volumeDidChangeMessage != 0;
}

- (BOOL)hasUpdateContentItemMessage
{
  return self->_updateContentItemMessage != 0;
}

- (BOOL)hasSetDefaultSupportedCommandsMessage
{
  return self->_setDefaultSupportedCommandsMessage != 0;
}

- (BOOL)hasGetStateMessage
{
  return self->_getStateMessage != 0;
}

- (BOOL)hasSetArtworkMessage
{
  return self->_setArtworkMessage != 0;
}

- (BOOL)hasRegisterHIDDeviceMessage
{
  return self->_registerHIDDeviceMessage != 0;
}

- (BOOL)hasRegisterHIDDeviceResultMessage
{
  return self->_registerHIDDeviceResultMessage != 0;
}

- (BOOL)hasSendHIDEventMessage
{
  return self->_sendHIDEventMessage != 0;
}

- (BOOL)hasSendHIDReportMessage
{
  return self->_sendHIDReportMessage != 0;
}

- (BOOL)hasSendVirtualTouchEventMessage
{
  return self->_sendVirtualTouchEventMessage != 0;
}

- (BOOL)hasMasterVolumeControlCapabilitiesDidChangeMessage
{
  return self->_masterVolumeControlCapabilitiesDidChangeMessage != 0;
}

- (BOOL)hasGameController
{
  return self->_gameController != 0;
}

- (BOOL)hasRegisterGameController
{
  return self->_registerGameController != 0;
}

- (BOOL)hasRegisterGameControllerResponse
{
  return self->_registerGameControllerResponse != 0;
}

- (BOOL)hasUnregisterGameController
{
  return self->_unregisterGameController != 0;
}

- (BOOL)hasRegisterForGameControllerEvents
{
  return self->_registerForGameControllerEvents != 0;
}

- (BOOL)hasKeyboardMessage
{
  return self->_keyboardMessage != 0;
}

- (BOOL)hasGetKeyboardMessage
{
  return self->_getKeyboardMessage != 0;
}

- (BOOL)hasTextInputMessage
{
  return self->_textInputMessage != 0;
}

- (BOOL)hasGetVoiceInputDevicesMessage
{
  return self->_getVoiceInputDevicesMessage != 0;
}

- (BOOL)hasGetVoiceInputDevicesResponseMessage
{
  return self->_getVoiceInputDevicesResponseMessage != 0;
}

- (BOOL)hasRegisterVoiceInputDeviceMessage
{
  return self->_registerVoiceInputDeviceMessage != 0;
}

- (BOOL)hasRegisterVoiceInputDeviceResponseMessage
{
  return self->_registerVoiceInputDeviceResponseMessage != 0;
}

- (BOOL)hasSetRecordingStateMessage
{
  return self->_setRecordingStateMessage != 0;
}

- (BOOL)hasSendVoiceInputMessage
{
  return self->_sendVoiceInputMessage != 0;
}

- (BOOL)hasTransactionPackets
{
  return self->_transactionPackets != 0;
}

- (BOOL)hasCryptoPairingMessage
{
  return self->_cryptoPairingMessage != 0;
}

- (BOOL)hasGameControllerProperties
{
  return self->_gameControllerProperties != 0;
}

- (BOOL)hasReadyStateMessage
{
  return self->_readyStateMessage != 0;
}

- (BOOL)hasSendButtonEventMessage
{
  return self->_sendButtonEventMessage != 0;
}

- (BOOL)hasSetHiliteModeMessage
{
  return self->_setHiliteModeMessage != 0;
}

- (BOOL)hasWakeDeviceMessage
{
  return self->_wakeDeviceMessage != 0;
}

- (BOOL)hasGenericMessage
{
  return self->_genericMessage != 0;
}

- (BOOL)hasSendPackedVirtualTouchEventMessage
{
  return self->_sendPackedVirtualTouchEventMessage != 0;
}

- (BOOL)hasSendLyricsEventMessage
{
  return self->_sendLyricsEventMessage != 0;
}

- (BOOL)hasSetNowPlayingClientMessage
{
  return self->_setNowPlayingClientMessage != 0;
}

- (BOOL)hasSetNowPlayingPlayerMessage
{
  return self->_setNowPlayingPlayerMessage != 0;
}

- (BOOL)hasModifyOutputContextRequestMessage
{
  return self->_modifyOutputContextRequestMessage != 0;
}

- (BOOL)hasRemoveClientMessage
{
  return self->_removeClientMessage != 0;
}

- (BOOL)hasRemovePlayerMessage
{
  return self->_removePlayerMessage != 0;
}

- (BOOL)hasUpdateClientMessage
{
  return self->_updateClientMessage != 0;
}

- (BOOL)hasUpdateContentItemArtworkMessage
{
  return self->_updateContentItemArtworkMessage != 0;
}

- (BOOL)hasUpdatePlayerMessage
{
  return self->_updatePlayerMessage != 0;
}

- (BOOL)hasPromptForRouteAuthorizationMessage
{
  return self->_promptForRouteAuthorizationMessage != 0;
}

- (BOOL)hasPromptForRouteAuthorizationResponseMessage
{
  return self->_promptForRouteAuthorizationResponseMessage != 0;
}

- (BOOL)hasPresentRouteAuthorizationStatusMessage
{
  return self->_presentRouteAuthorizationStatusMessage != 0;
}

- (BOOL)hasGetVolumeControlCapabilitiesMessage
{
  return self->_getVolumeControlCapabilitiesMessage != 0;
}

- (BOOL)hasGetVolumeControlCapabilitiesResultMessage
{
  return self->_getVolumeControlCapabilitiesResultMessage != 0;
}

- (BOOL)hasVolumeControlCapabilitiesDidChangeMessage
{
  return self->_volumeControlCapabilitiesDidChangeMessage != 0;
}

- (BOOL)hasUpdateOutputDevicesMessage
{
  return self->_updateOutputDevicesMessage != 0;
}

- (BOOL)hasRemoveOutputDevicesMessage
{
  return self->_removeOutputDevicesMessage != 0;
}

- (BOOL)hasRemoteTextInputMessage
{
  return self->_remoteTextInputMessage != 0;
}

- (BOOL)hasGetRemoteTextInputSessionMessage
{
  return self->_getRemoteTextInputSessionMessage != 0;
}

- (BOOL)hasPlaybackSessionRequestMessage
{
  return self->_playbackSessionRequestMessage != 0;
}

- (BOOL)hasPlaybackSessionResponseMessage
{
  return self->_playbackSessionResponseMessage != 0;
}

- (BOOL)hasPlaybackSessionMigrateRequestMessage
{
  return self->_playbackSessionMigrateRequestMessage != 0;
}

- (BOOL)hasPlaybackSessionMigrateResponseMessage
{
  return self->_playbackSessionMigrateResponseMessage != 0;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (BOOL)hasPlaybackSessionMigrateBeginMessage
{
  return self->_playbackSessionMigrateBeginMessage != 0;
}

- (BOOL)hasPlaybackSessionMigrateEndMessage
{
  return self->_playbackSessionMigrateEndMessage != 0;
}

- (BOOL)hasUpdateActiveSystemEndpointMessage
{
  return self->_updateActiveSystemEndpointMessage != 0;
}

- (BOOL)hasDiscoveryModeMessage
{
  return self->_discoveryModeMessage != 0;
}

- (BOOL)hasUpdateEndpointsMessage
{
  return self->_updateEndpointsMessage != 0;
}

- (BOOL)hasRemoveEndpointsMessage
{
  return self->_removeEndpointsMessage != 0;
}

- (BOOL)hasPlayerClientPropertiesMessage
{
  return self->_playerClientPropertiesMessage != 0;
}

- (BOOL)hasOriginClientPropertiesMessage
{
  return self->_originClientPropertiesMessage != 0;
}

- (BOOL)hasAudioFadeMessage
{
  return self->_audioFadeMessage != 0;
}

- (BOOL)hasAudioFadeResponseMessage
{
  return self->_audioFadeResponseMessage != 0;
}

- (BOOL)hasDiscoveryUpdateEndpointsMessage
{
  return self->_discoveryUpdateEndpointsMessage != 0;
}

- (BOOL)hasDiscoveryUpdateOutputDevicesMessage
{
  return self->_discoveryUpdateOutputDevicesMessage != 0;
}

- (BOOL)hasSetListeningModeMessage
{
  return self->_setListeningModeMessage != 0;
}

- (BOOL)hasConfigureConnectionMessage
{
  return self->_configureConnectionMessage != 0;
}

- (BOOL)hasCreateHostedEndpointRequest
{
  return self->_createHostedEndpointRequest != 0;
}

- (BOOL)hasCreateHostedEndpointResponse
{
  return self->_createHostedEndpointResponse != 0;
}

- (BOOL)hasAdjustVolumeMessage
{
  return self->_adjustVolumeMessage != 0;
}

- (BOOL)hasGetVolumeMutedMessage
{
  return self->_getVolumeMutedMessage != 0;
}

- (BOOL)hasGetVolumeMutedResultMessage
{
  return self->_getVolumeMutedResultMessage != 0;
}

- (BOOL)hasSetVolumeMutedMessage
{
  return self->_setVolumeMutedMessage != 0;
}

- (BOOL)hasVolumeMutedDidChangeMessage
{
  return self->_volumeMutedDidChangeMessage != 0;
}

- (BOOL)hasSetConversationDetectionEnabledMessage
{
  return self->_setConversationDetectionEnabledMessage != 0;
}

- (BOOL)hasPlayerClientParticipantsUpdateMessage
{
  return self->_playerClientParticipantsUpdateMessage != 0;
}

- (BOOL)hasRequestGroupSessionMessage
{
  return self->_requestGroupSessionMessage != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRMediaRemoteMessageProtobuf;
  -[_MRMediaRemoteMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRMediaRemoteMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __CFString *v4;
  NSString *replyIdentifier;
  NSString *authenticationToken;
  char has;
  void *v8;
  void *v9;
  NSString *uniqueIdentifier;
  _MRSendCommandMessageProtobuf *sendCommandMessage;
  void *v12;
  _MRSendCommandResultMessageProtobuf *sendCommandResultMessage;
  void *v14;
  _MRSetStateMessageProtobuf *setStateMessage;
  void *v16;
  _MRNotificationMessageProtobuf *notificationMessage;
  void *v18;
  _MRPlaybackQueueProtobuf *contentItemsChangedNotificationMessage;
  void *v20;
  _MRDeviceInfoMessageProtobuf *deviceInfoMessage;
  void *v22;
  _MRClientUpdatesConfigurationProtobuf *clientUpdatesConfigMessage;
  void *v24;
  _MRPlaybackQueueRequestProtobuf *playbackQueueRequest;
  void *v26;
  _MRSetConnectionStateMessageProtobuf *connectionState;
  void *v28;
  _MRGetVolumeMessageProtobuf *getVolumeMessage;
  void *v30;
  _MRGetVolumeResultMessageProtobuf *getVolumeResultMessage;
  void *v32;
  _MRSetVolumeMessageProtobuf *setVolumeMessage;
  void *v34;
  _MRVolumeDidChangeMessageProtobuf *volumeDidChangeMessage;
  void *v36;
  _MRUpdateContentItemMessageProtobuf *updateContentItemMessage;
  void *v38;
  _MRSetStateMessageProtobuf *setDefaultSupportedCommandsMessage;
  void *v40;
  _MRGetStateMessageProtobuf *getStateMessage;
  void *v42;
  _MRErrorProtobuf *error;
  void *v44;
  _MRSetArtworkMessageProtobuf *setArtworkMessage;
  void *v46;
  _MRRegisterHIDDeviceMessageProtobuf *registerHIDDeviceMessage;
  void *v48;
  _MRRegisterHIDDeviceResultMessageProtobuf *registerHIDDeviceResultMessage;
  void *v50;
  _MRSendHIDEventMessageProtobuf *sendHIDEventMessage;
  void *v52;
  _MRSendHIDReportMessageProtobuf *sendHIDReportMessage;
  void *v54;
  _MRSendVirtualTouchEventMessageProtobuf *sendVirtualTouchEventMessage;
  void *v56;
  _MRVolumeControlAvailabilityProtobuf *masterVolumeControlCapabilitiesDidChangeMessage;
  void *v58;
  _MRGameControllerMessageProtobuf *gameController;
  void *v60;
  _MRRegisterGameControllerMessageProtobuf *registerGameController;
  void *v62;
  _MRRegisterGameControllerResponseMessageProtobuf *registerGameControllerResponse;
  void *v64;
  _MRUnregisterGameControllerMessageProtobuf *unregisterGameController;
  void *v66;
  _MRRegisterForGameControllerEventsMessageProtobuf *registerForGameControllerEvents;
  void *v68;
  _MRKeyboardMessageProtobuf *keyboardMessage;
  void *v70;
  _MRGetKeyboardSessionProtobuf *getKeyboardMessage;
  void *v72;
  _MRTextInputMessageProtobuf *textInputMessage;
  void *v74;
  _MRGetVoiceInputDevicesMessageProtobuf *getVoiceInputDevicesMessage;
  void *v76;
  _MRGetVoiceInputDevicesResponseMessageProtobuf *getVoiceInputDevicesResponseMessage;
  void *v78;
  _MRRegisterVoiceInputDeviceMessageProtobuf *registerVoiceInputDeviceMessage;
  void *v80;
  _MRRegisterVoiceInputDeviceResponseMessageProtobuf *registerVoiceInputDeviceResponseMessage;
  void *v82;
  _MRSetRecordingStateMessageProtobuf *setRecordingStateMessage;
  void *v84;
  _MRSendVoiceInputMessageProtobuf *sendVoiceInputMessage;
  void *v86;
  _MRTransactionMessageProtobuf *transactionPackets;
  void *v88;
  _MRCryptoPairingMessageProtobuf *cryptoPairingMessage;
  void *v90;
  _MRGameControllerPropertiesMessageProtobuf *gameControllerProperties;
  void *v92;
  _MRSetReadyStateMessageProtobuf *readyStateMessage;
  void *v94;
  _MRSendButtonEventMessageProtobuf *sendButtonEventMessage;
  void *v96;
  _MRSetHiliteModeMessageProtobuf *setHiliteModeMessage;
  void *v98;
  _MRWakeDeviceMessageProtobuf *wakeDeviceMessage;
  void *v100;
  _MRGenericMessageProtobuf *genericMessage;
  void *v102;
  _MRSendPackedVirtualTouchEventMessageProtobuf *sendPackedVirtualTouchEventMessage;
  void *v104;
  _MRSendLyricsEventMessageProtobuf *sendLyricsEventMessage;
  void *v106;
  _MRSetNowPlayingClientMessageProtobuf *setNowPlayingClientMessage;
  void *v108;
  _MRSetNowPlayingPlayerMessageProtobuf *setNowPlayingPlayerMessage;
  void *v110;
  _MRAVModifyOutputContextRequestProtobuf *modifyOutputContextRequestMessage;
  void *v112;
  _MRRemoveClientMessageProtobuf *removeClientMessage;
  void *v114;
  _MRRemovePlayerMessageProtobuf *removePlayerMessage;
  void *v116;
  _MRUpdateClientMessageProtobuf *updateClientMessage;
  void *v118;
  _MRUpdateContentItemArtworkMessageProtobuf *updateContentItemArtworkMessage;
  void *v120;
  _MRUpdatePlayerMessageProtobuf *updatePlayerMessage;
  void *v122;
  _MRPromptForRouteAuthorizationMessageProtobuf *promptForRouteAuthorizationMessage;
  void *v124;
  _MRPromptForRouteAuthorizationResponseMessageProtobuf *promptForRouteAuthorizationResponseMessage;
  void *v126;
  _MRPresentRouteAuthorizationStatusMessageProtobuf *presentRouteAuthorizationStatusMessage;
  void *v128;
  _MRGetVolumeControlCapabilitiesMessageProtobuf *getVolumeControlCapabilitiesMessage;
  void *v130;
  _MRGetVolumeControlCapabilitiesResultMessageProtobuf *getVolumeControlCapabilitiesResultMessage;
  void *v132;
  _MRVolumeControlCapabilitiesDidChangeMessageProtobuf *volumeControlCapabilitiesDidChangeMessage;
  void *v134;
  _MRUpdateOutputDevicesMessageProtobuf *updateOutputDevicesMessage;
  void *v136;
  _MRRemoveOutputDevicesMessageProtobuf *removeOutputDevicesMessage;
  void *v138;
  _MRRemoteTextInputMessageProtobuf *remoteTextInputMessage;
  void *v140;
  _MRGetRemoteTextInputSessionProtobuf *getRemoteTextInputSessionMessage;
  void *v142;
  _MRPlaybackSessionRequestMessageProtobuf *playbackSessionRequestMessage;
  void *v144;
  _MRPlaybackSessionResponseMessageProtobuf *playbackSessionResponseMessage;
  void *v146;
  _MRPlaybackSessionMigrateRequestMessageProtobuf *playbackSessionMigrateRequestMessage;
  void *v148;
  _MRPlaybackSessionMigrateResponseMessageProtobuf *playbackSessionMigrateResponseMessage;
  void *v150;
  NSString *errorDescription;
  _MRPlaybackSessionMigrateBeginMessageProtobuf *playbackSessionMigrateBeginMessage;
  void *v153;
  _MRPlaybackSessionMigrateEndMessageProtobuf *playbackSessionMigrateEndMessage;
  void *v155;
  _MRUpdateActiveSystemEndpointMessageProtobuf *updateActiveSystemEndpointMessage;
  void *v157;
  _MRSetDiscoveryModeProtobufMessage *discoveryModeMessage;
  void *v159;
  _MRUpdateEndpointsMessageProtobuf *updateEndpointsMessage;
  void *v161;
  _MRRemoveEndpointsMessageProtobuf *removeEndpointsMessage;
  void *v163;
  _MRPlayerClientPropertiesMessageProtobuf *playerClientPropertiesMessage;
  void *v165;
  _MROriginClientPropertiesMessageProtobuf *originClientPropertiesMessage;
  void *v167;
  _MRAudioFadeMessageProtobuf *audioFadeMessage;
  void *v169;
  _MRAudioFadeResponseMessageProtobuf *audioFadeResponseMessage;
  void *v171;
  _MRDiscoveryUpdateEndpointsProtobufMessage *discoveryUpdateEndpointsMessage;
  void *v173;
  _MRDiscoveryUpdateOutputDevicesProtobufMessage *discoveryUpdateOutputDevicesMessage;
  void *v175;
  _MRSetListeningModeMessageProtobuf *setListeningModeMessage;
  void *v177;
  _MRConfigureConnectionMessageProtobuf *configureConnectionMessage;
  void *v179;
  _MRCreateHostedEndpointRequestProtobuf *createHostedEndpointRequest;
  void *v181;
  _MRCreateHostedEndpointResponseProtobuf *createHostedEndpointResponse;
  void *v183;
  _MRAdjustVolumeMessageProtobuf *adjustVolumeMessage;
  void *v185;
  _MRGetVolumeMutedMessageProtobuf *getVolumeMutedMessage;
  void *v187;
  _MRGetVolumeMutedResultMessageProtobuf *getVolumeMutedResultMessage;
  void *v189;
  _MRSetVolumeMutedMessageProtobuf *setVolumeMutedMessage;
  void *v191;
  _MRVolumeMutedDidChangeMessageProtobuf *volumeMutedDidChangeMessage;
  void *v193;
  _MRSetConversationDetectionEnabledMessageProtobuf *setConversationDetectionEnabledMessage;
  void *v195;
  _MRPlayerClientParticipantsUpdateMessageProtobuf *playerClientParticipantsUpdateMessage;
  void *v197;
  _MRRequestGroupSessionMessageProtobuf *requestGroupSessionMessage;
  void *v199;
  id v200;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = CFSTR("Unknown");
    switch(self->_type)
    {
      case 0:
        break;
      case 1:
        v4 = CFSTR("SendCommand");
        break;
      case 2:
        v4 = CFSTR("SendCommandResult");
        break;
      case 3:
        v4 = CFSTR("GetState");
        break;
      case 4:
        v4 = CFSTR("SetState");
        break;
      case 5:
        v4 = CFSTR("SetArtwork");
        break;
      case 6:
        v4 = CFSTR("RegisterHIDDevice");
        break;
      case 7:
        v4 = CFSTR("RegisterHIDDeviceResult");
        break;
      case 8:
        v4 = CFSTR("SendHIDEvent");
        break;
      case 9:
        v4 = CFSTR("SendHIDReport");
        break;
      case 0xA:
        v4 = CFSTR("SendVirtualTouchEvent");
        break;
      case 0xB:
        v4 = CFSTR("Notification");
        break;
      case 0xF:
        v4 = CFSTR("DeviceInfo");
        break;
      case 0x10:
        v4 = CFSTR("ClientUpdatesConfiguration");
        break;
      case 0x11:
        v4 = CFSTR("LegacyVolumeControlCapabilitiesDidChange");
        break;
      case 0x12:
        v4 = CFSTR("GameController");
        break;
      case 0x13:
        v4 = CFSTR("RegisterGameController");
        break;
      case 0x14:
        v4 = CFSTR("RegisterGameControllerResponse");
        break;
      case 0x15:
        v4 = CFSTR("UnregisterGameController");
        break;
      case 0x16:
        v4 = CFSTR("RegisterForGameControllerEvents");
        break;
      case 0x17:
        v4 = CFSTR("Keyboard");
        break;
      case 0x18:
        v4 = CFSTR("GetKeyboardSession");
        break;
      case 0x19:
        v4 = CFSTR("TextInput");
        break;
      case 0x1A:
        v4 = CFSTR("GetVoiceInputDevices");
        break;
      case 0x1B:
        v4 = CFSTR("GetVoiceInputDevicesResponse");
        break;
      case 0x1C:
        v4 = CFSTR("RegisterVoiceInputDevice");
        break;
      case 0x1D:
        v4 = CFSTR("RegisterVoiceInputDeviceResponse");
        break;
      case 0x1E:
        v4 = CFSTR("SetVoiceInputRecordingState");
        break;
      case 0x1F:
        v4 = CFSTR("SendVoiceInput");
        break;
      case 0x20:
        v4 = CFSTR("PlaybackQueueRequest");
        break;
      case 0x21:
        v4 = CFSTR("Transaction");
        break;
      case 0x22:
        v4 = CFSTR("CryptoPairing");
        break;
      case 0x23:
        v4 = CFSTR("GameControllerProperties");
        break;
      case 0x24:
        v4 = CFSTR("SetReadyState");
        break;
      case 0x25:
        v4 = CFSTR("DeviceInfoUpdate");
        break;
      case 0x26:
        v4 = CFSTR("SetConnectionState");
        break;
      case 0x27:
        v4 = CFSTR("SendButtonEvent");
        break;
      case 0x28:
        v4 = CFSTR("SetHiliteMode");
        break;
      case 0x29:
        v4 = CFSTR("WakeDevice");
        break;
      case 0x2A:
        v4 = CFSTR("Generic");
        break;
      case 0x2B:
        v4 = CFSTR("SendPackedVirtualTouchEvent");
        break;
      case 0x2C:
        v4 = CFSTR("SendLyricsEventMessage");
        break;
      case 0x2E:
        v4 = CFSTR("SetNowPlayingClient");
        break;
      case 0x2F:
        v4 = CFSTR("SetNowPlayingPlayer");
        break;
      case 0x30:
        v4 = CFSTR("ModifyOutputContextRequest");
        break;
      case 0x31:
        v4 = CFSTR("GetVolume");
        break;
      case 0x32:
        v4 = CFSTR("GetVolumeResult");
        break;
      case 0x33:
        v4 = CFSTR("SetVolume");
        break;
      case 0x34:
        v4 = CFSTR("VolumeDidChange");
        break;
      case 0x35:
        v4 = CFSTR("RemoveClient");
        break;
      case 0x36:
        v4 = CFSTR("RemovePlayer");
        break;
      case 0x37:
        v4 = CFSTR("UpdateClient");
        break;
      case 0x38:
        v4 = CFSTR("UpdateContentItems");
        break;
      case 0x39:
        v4 = CFSTR("UpdateContentItemArtwork");
        break;
      case 0x3A:
        v4 = CFSTR("UpdatePlayer");
        break;
      case 0x3B:
        v4 = CFSTR("PromptForRouteAuthorization");
        break;
      case 0x3C:
        v4 = CFSTR("PromptForRouteAuthorizationResponse");
        break;
      case 0x3D:
        v4 = CFSTR("PresentRouteAuthorizationStatus");
        break;
      case 0x3E:
        v4 = CFSTR("GetVolumeControlCapabilities");
        break;
      case 0x3F:
        v4 = CFSTR("GetVolumeControlCapabilitiesResult");
        break;
      case 0x40:
        v4 = CFSTR("VolumeControlCapabilitiesDidChange");
        break;
      case 0x41:
        v4 = CFSTR("UpdateOutputDevices");
        break;
      case 0x42:
        v4 = CFSTR("RemoveOutputDevices");
        break;
      case 0x43:
        v4 = CFSTR("RemoteTextInput");
        break;
      case 0x44:
        v4 = CFSTR("GetRemoteTextInputSession");
        break;
      case 0x45:
        v4 = CFSTR("RemoveFromParentGroup");
        break;
      case 0x46:
        v4 = CFSTR("PlaybackSessionRequest");
        break;
      case 0x47:
        v4 = CFSTR("PlaybackSessionResponse");
        break;
      case 0x48:
        v4 = CFSTR("SetDefaultSupportedCommands");
        break;
      case 0x49:
        v4 = CFSTR("PlaybackSessionMigrateRequest");
        break;
      case 0x4A:
        v4 = CFSTR("PlaybackSessionMigrateResponse");
        break;
      case 0x4B:
        v4 = CFSTR("PlaybackSessionMigrateBegin");
        break;
      case 0x4C:
        v4 = CFSTR("PlaybackSessionMigrateEnd");
        break;
      case 0x4D:
        v4 = CFSTR("UpdateActiveSystemEndpoint");
        break;
      case 0x65:
        v4 = CFSTR("SetDiscoveryMode");
        break;
      case 0x66:
        v4 = CFSTR("UpdateEndpoints");
        break;
      case 0x67:
        v4 = CFSTR("RemoveEndpoints");
        break;
      case 0x68:
        v4 = CFSTR("SetPlayerClientProperties");
        break;
      case 0x69:
        v4 = CFSTR("SetOriginClientProperties");
        break;
      case 0x6A:
        v4 = CFSTR("AudioFade");
        break;
      case 0x6B:
        v4 = CFSTR("AudioFadeResponse");
        break;
      case 0x6C:
        v4 = CFSTR("DiscoveryUpdateEndpoints");
        break;
      case 0x6D:
        v4 = CFSTR("DiscoveryUpdateOutputDevices");
        break;
      case 0x6E:
        v4 = CFSTR("SetListeningMode");
        break;
      case 0x78:
        v4 = CFSTR("ConfigureConnection");
        break;
      case 0x79:
        v4 = CFSTR("CreatedHostedEndpointRequest");
        break;
      case 0x7A:
        v4 = CFSTR("CreatedHostedEndpointResponse");
        break;
      case 0x7D:
        v4 = CFSTR("AdjustVolume");
        break;
      case 0x7E:
        v4 = CFSTR("GetVolumeMuted");
        break;
      case 0x7F:
        v4 = CFSTR("GetVolumeMutedResult");
        break;
      case 0x80:
        v4 = CFSTR("SetVolumeMuted");
        break;
      case 0x81:
        v4 = CFSTR("VolumeMutedDidChange");
        break;
      case 0x82:
        v4 = CFSTR("SetConversationDetectionEnabled");
        break;
      case 0x83:
        v4 = CFSTR("PlayerClientParticipantsUpdate");
        break;
      case 0x84:
        v4 = CFSTR("RequestGroupSession");
        break;
      case 0x85:
        v4 = CFSTR("ConfigureConnectionService");
        break;
      case 0x86:
        v4 = CFSTR("LastMessageType");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  replyIdentifier = self->_replyIdentifier;
  if (replyIdentifier)
    objc_msgSend(v3, "setObject:forKey:", replyIdentifier, CFSTR("replyIdentifier"));
  authenticationToken = self->_authenticationToken;
  if (authenticationToken)
    objc_msgSend(v3, "setObject:forKey:", authenticationToken, CFSTR("authenticationToken"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_errorCode);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("errorCode"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp"));

  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  sendCommandMessage = self->_sendCommandMessage;
  if (sendCommandMessage)
  {
    -[_MRSendCommandMessageProtobuf dictionaryRepresentation](sendCommandMessage, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sendCommandMessage"));

  }
  sendCommandResultMessage = self->_sendCommandResultMessage;
  if (sendCommandResultMessage)
  {
    -[_MRSendCommandResultMessageProtobuf dictionaryRepresentation](sendCommandResultMessage, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("sendCommandResultMessage"));

  }
  setStateMessage = self->_setStateMessage;
  if (setStateMessage)
  {
    -[_MRSetStateMessageProtobuf dictionaryRepresentation](setStateMessage, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("setStateMessage"));

  }
  notificationMessage = self->_notificationMessage;
  if (notificationMessage)
  {
    -[_MRNotificationMessageProtobuf dictionaryRepresentation](notificationMessage, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("notificationMessage"));

  }
  contentItemsChangedNotificationMessage = self->_contentItemsChangedNotificationMessage;
  if (contentItemsChangedNotificationMessage)
  {
    -[_MRPlaybackQueueProtobuf dictionaryRepresentation](contentItemsChangedNotificationMessage, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("contentItemsChangedNotificationMessage"));

  }
  deviceInfoMessage = self->_deviceInfoMessage;
  if (deviceInfoMessage)
  {
    -[_MRDeviceInfoMessageProtobuf dictionaryRepresentation](deviceInfoMessage, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("deviceInfoMessage"));

  }
  clientUpdatesConfigMessage = self->_clientUpdatesConfigMessage;
  if (clientUpdatesConfigMessage)
  {
    -[_MRClientUpdatesConfigurationProtobuf dictionaryRepresentation](clientUpdatesConfigMessage, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("clientUpdatesConfigMessage"));

  }
  playbackQueueRequest = self->_playbackQueueRequest;
  if (playbackQueueRequest)
  {
    -[_MRPlaybackQueueRequestProtobuf dictionaryRepresentation](playbackQueueRequest, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("playbackQueueRequest"));

  }
  connectionState = self->_connectionState;
  if (connectionState)
  {
    -[_MRSetConnectionStateMessageProtobuf dictionaryRepresentation](connectionState, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("connectionState"));

  }
  getVolumeMessage = self->_getVolumeMessage;
  if (getVolumeMessage)
  {
    -[_MRGetVolumeMessageProtobuf dictionaryRepresentation](getVolumeMessage, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("getVolumeMessage"));

  }
  getVolumeResultMessage = self->_getVolumeResultMessage;
  if (getVolumeResultMessage)
  {
    -[_MRGetVolumeResultMessageProtobuf dictionaryRepresentation](getVolumeResultMessage, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("getVolumeResultMessage"));

  }
  setVolumeMessage = self->_setVolumeMessage;
  if (setVolumeMessage)
  {
    -[_MRSetVolumeMessageProtobuf dictionaryRepresentation](setVolumeMessage, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("setVolumeMessage"));

  }
  volumeDidChangeMessage = self->_volumeDidChangeMessage;
  if (volumeDidChangeMessage)
  {
    -[_MRVolumeDidChangeMessageProtobuf dictionaryRepresentation](volumeDidChangeMessage, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("volumeDidChangeMessage"));

  }
  updateContentItemMessage = self->_updateContentItemMessage;
  if (updateContentItemMessage)
  {
    -[_MRUpdateContentItemMessageProtobuf dictionaryRepresentation](updateContentItemMessage, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("updateContentItemMessage"));

  }
  setDefaultSupportedCommandsMessage = self->_setDefaultSupportedCommandsMessage;
  if (setDefaultSupportedCommandsMessage)
  {
    -[_MRSetStateMessageProtobuf dictionaryRepresentation](setDefaultSupportedCommandsMessage, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("setDefaultSupportedCommandsMessage"));

  }
  getStateMessage = self->_getStateMessage;
  if (getStateMessage)
  {
    -[_MRGetStateMessageProtobuf dictionaryRepresentation](getStateMessage, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("getStateMessage"));

  }
  error = self->_error;
  if (error)
  {
    -[_MRErrorProtobuf dictionaryRepresentation](error, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("error"));

  }
  setArtworkMessage = self->_setArtworkMessage;
  if (setArtworkMessage)
  {
    -[_MRSetArtworkMessageProtobuf dictionaryRepresentation](setArtworkMessage, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("setArtworkMessage"));

  }
  registerHIDDeviceMessage = self->_registerHIDDeviceMessage;
  if (registerHIDDeviceMessage)
  {
    -[_MRRegisterHIDDeviceMessageProtobuf dictionaryRepresentation](registerHIDDeviceMessage, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("registerHIDDeviceMessage"));

  }
  registerHIDDeviceResultMessage = self->_registerHIDDeviceResultMessage;
  if (registerHIDDeviceResultMessage)
  {
    -[_MRRegisterHIDDeviceResultMessageProtobuf dictionaryRepresentation](registerHIDDeviceResultMessage, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("registerHIDDeviceResultMessage"));

  }
  sendHIDEventMessage = self->_sendHIDEventMessage;
  if (sendHIDEventMessage)
  {
    -[_MRSendHIDEventMessageProtobuf dictionaryRepresentation](sendHIDEventMessage, "dictionaryRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("sendHIDEventMessage"));

  }
  sendHIDReportMessage = self->_sendHIDReportMessage;
  if (sendHIDReportMessage)
  {
    -[_MRSendHIDReportMessageProtobuf dictionaryRepresentation](sendHIDReportMessage, "dictionaryRepresentation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("sendHIDReportMessage"));

  }
  sendVirtualTouchEventMessage = self->_sendVirtualTouchEventMessage;
  if (sendVirtualTouchEventMessage)
  {
    -[_MRSendVirtualTouchEventMessageProtobuf dictionaryRepresentation](sendVirtualTouchEventMessage, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("sendVirtualTouchEventMessage"));

  }
  masterVolumeControlCapabilitiesDidChangeMessage = self->_masterVolumeControlCapabilitiesDidChangeMessage;
  if (masterVolumeControlCapabilitiesDidChangeMessage)
  {
    -[_MRVolumeControlAvailabilityProtobuf dictionaryRepresentation](masterVolumeControlCapabilitiesDidChangeMessage, "dictionaryRepresentation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("masterVolumeControlCapabilitiesDidChangeMessage"));

  }
  gameController = self->_gameController;
  if (gameController)
  {
    -[_MRGameControllerMessageProtobuf dictionaryRepresentation](gameController, "dictionaryRepresentation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("gameController"));

  }
  registerGameController = self->_registerGameController;
  if (registerGameController)
  {
    -[_MRRegisterGameControllerMessageProtobuf dictionaryRepresentation](registerGameController, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("registerGameController"));

  }
  registerGameControllerResponse = self->_registerGameControllerResponse;
  if (registerGameControllerResponse)
  {
    -[_MRRegisterGameControllerResponseMessageProtobuf dictionaryRepresentation](registerGameControllerResponse, "dictionaryRepresentation");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("registerGameControllerResponse"));

  }
  unregisterGameController = self->_unregisterGameController;
  if (unregisterGameController)
  {
    -[_MRUnregisterGameControllerMessageProtobuf dictionaryRepresentation](unregisterGameController, "dictionaryRepresentation");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("unregisterGameController"));

  }
  registerForGameControllerEvents = self->_registerForGameControllerEvents;
  if (registerForGameControllerEvents)
  {
    -[_MRRegisterForGameControllerEventsMessageProtobuf dictionaryRepresentation](registerForGameControllerEvents, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("registerForGameControllerEvents"));

  }
  keyboardMessage = self->_keyboardMessage;
  if (keyboardMessage)
  {
    -[_MRKeyboardMessageProtobuf dictionaryRepresentation](keyboardMessage, "dictionaryRepresentation");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("keyboardMessage"));

  }
  getKeyboardMessage = self->_getKeyboardMessage;
  if (getKeyboardMessage)
  {
    -[_MRGetKeyboardSessionProtobuf dictionaryRepresentation](getKeyboardMessage, "dictionaryRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("getKeyboardMessage"));

  }
  textInputMessage = self->_textInputMessage;
  if (textInputMessage)
  {
    -[_MRTextInputMessageProtobuf dictionaryRepresentation](textInputMessage, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("textInputMessage"));

  }
  getVoiceInputDevicesMessage = self->_getVoiceInputDevicesMessage;
  if (getVoiceInputDevicesMessage)
  {
    -[_MRGetVoiceInputDevicesMessageProtobuf dictionaryRepresentation](getVoiceInputDevicesMessage, "dictionaryRepresentation");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("getVoiceInputDevicesMessage"));

  }
  getVoiceInputDevicesResponseMessage = self->_getVoiceInputDevicesResponseMessage;
  if (getVoiceInputDevicesResponseMessage)
  {
    -[_MRGetVoiceInputDevicesResponseMessageProtobuf dictionaryRepresentation](getVoiceInputDevicesResponseMessage, "dictionaryRepresentation");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("getVoiceInputDevicesResponseMessage"));

  }
  registerVoiceInputDeviceMessage = self->_registerVoiceInputDeviceMessage;
  if (registerVoiceInputDeviceMessage)
  {
    -[_MRRegisterVoiceInputDeviceMessageProtobuf dictionaryRepresentation](registerVoiceInputDeviceMessage, "dictionaryRepresentation");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("registerVoiceInputDeviceMessage"));

  }
  registerVoiceInputDeviceResponseMessage = self->_registerVoiceInputDeviceResponseMessage;
  if (registerVoiceInputDeviceResponseMessage)
  {
    -[_MRRegisterVoiceInputDeviceResponseMessageProtobuf dictionaryRepresentation](registerVoiceInputDeviceResponseMessage, "dictionaryRepresentation");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("registerVoiceInputDeviceResponseMessage"));

  }
  setRecordingStateMessage = self->_setRecordingStateMessage;
  if (setRecordingStateMessage)
  {
    -[_MRSetRecordingStateMessageProtobuf dictionaryRepresentation](setRecordingStateMessage, "dictionaryRepresentation");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("setRecordingStateMessage"));

  }
  sendVoiceInputMessage = self->_sendVoiceInputMessage;
  if (sendVoiceInputMessage)
  {
    -[_MRSendVoiceInputMessageProtobuf dictionaryRepresentation](sendVoiceInputMessage, "dictionaryRepresentation");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v86, CFSTR("sendVoiceInputMessage"));

  }
  transactionPackets = self->_transactionPackets;
  if (transactionPackets)
  {
    -[_MRTransactionMessageProtobuf dictionaryRepresentation](transactionPackets, "dictionaryRepresentation");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("transactionPackets"));

  }
  cryptoPairingMessage = self->_cryptoPairingMessage;
  if (cryptoPairingMessage)
  {
    -[_MRCryptoPairingMessageProtobuf dictionaryRepresentation](cryptoPairingMessage, "dictionaryRepresentation");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("cryptoPairingMessage"));

  }
  gameControllerProperties = self->_gameControllerProperties;
  if (gameControllerProperties)
  {
    -[_MRGameControllerPropertiesMessageProtobuf dictionaryRepresentation](gameControllerProperties, "dictionaryRepresentation");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("gameControllerProperties"));

  }
  readyStateMessage = self->_readyStateMessage;
  if (readyStateMessage)
  {
    -[_MRSetReadyStateMessageProtobuf dictionaryRepresentation](readyStateMessage, "dictionaryRepresentation");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("readyStateMessage"));

  }
  sendButtonEventMessage = self->_sendButtonEventMessage;
  if (sendButtonEventMessage)
  {
    -[_MRSendButtonEventMessageProtobuf dictionaryRepresentation](sendButtonEventMessage, "dictionaryRepresentation");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v96, CFSTR("sendButtonEventMessage"));

  }
  setHiliteModeMessage = self->_setHiliteModeMessage;
  if (setHiliteModeMessage)
  {
    -[_MRSetHiliteModeMessageProtobuf dictionaryRepresentation](setHiliteModeMessage, "dictionaryRepresentation");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("setHiliteModeMessage"));

  }
  wakeDeviceMessage = self->_wakeDeviceMessage;
  if (wakeDeviceMessage)
  {
    -[_MRWakeDeviceMessageProtobuf dictionaryRepresentation](wakeDeviceMessage, "dictionaryRepresentation");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v100, CFSTR("wakeDeviceMessage"));

  }
  genericMessage = self->_genericMessage;
  if (genericMessage)
  {
    -[_MRGenericMessageProtobuf dictionaryRepresentation](genericMessage, "dictionaryRepresentation");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v102, CFSTR("genericMessage"));

  }
  sendPackedVirtualTouchEventMessage = self->_sendPackedVirtualTouchEventMessage;
  if (sendPackedVirtualTouchEventMessage)
  {
    -[_MRSendPackedVirtualTouchEventMessageProtobuf dictionaryRepresentation](sendPackedVirtualTouchEventMessage, "dictionaryRepresentation");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v104, CFSTR("sendPackedVirtualTouchEventMessage"));

  }
  sendLyricsEventMessage = self->_sendLyricsEventMessage;
  if (sendLyricsEventMessage)
  {
    -[_MRSendLyricsEventMessageProtobuf dictionaryRepresentation](sendLyricsEventMessage, "dictionaryRepresentation");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v106, CFSTR("sendLyricsEventMessage"));

  }
  setNowPlayingClientMessage = self->_setNowPlayingClientMessage;
  if (setNowPlayingClientMessage)
  {
    -[_MRSetNowPlayingClientMessageProtobuf dictionaryRepresentation](setNowPlayingClientMessage, "dictionaryRepresentation");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v108, CFSTR("setNowPlayingClientMessage"));

  }
  setNowPlayingPlayerMessage = self->_setNowPlayingPlayerMessage;
  if (setNowPlayingPlayerMessage)
  {
    -[_MRSetNowPlayingPlayerMessageProtobuf dictionaryRepresentation](setNowPlayingPlayerMessage, "dictionaryRepresentation");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v110, CFSTR("setNowPlayingPlayerMessage"));

  }
  modifyOutputContextRequestMessage = self->_modifyOutputContextRequestMessage;
  if (modifyOutputContextRequestMessage)
  {
    -[_MRAVModifyOutputContextRequestProtobuf dictionaryRepresentation](modifyOutputContextRequestMessage, "dictionaryRepresentation");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v112, CFSTR("modifyOutputContextRequestMessage"));

  }
  removeClientMessage = self->_removeClientMessage;
  if (removeClientMessage)
  {
    -[_MRRemoveClientMessageProtobuf dictionaryRepresentation](removeClientMessage, "dictionaryRepresentation");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v114, CFSTR("removeClientMessage"));

  }
  removePlayerMessage = self->_removePlayerMessage;
  if (removePlayerMessage)
  {
    -[_MRRemovePlayerMessageProtobuf dictionaryRepresentation](removePlayerMessage, "dictionaryRepresentation");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v116, CFSTR("removePlayerMessage"));

  }
  updateClientMessage = self->_updateClientMessage;
  if (updateClientMessage)
  {
    -[_MRUpdateClientMessageProtobuf dictionaryRepresentation](updateClientMessage, "dictionaryRepresentation");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v118, CFSTR("updateClientMessage"));

  }
  updateContentItemArtworkMessage = self->_updateContentItemArtworkMessage;
  if (updateContentItemArtworkMessage)
  {
    -[_MRUpdateContentItemArtworkMessageProtobuf dictionaryRepresentation](updateContentItemArtworkMessage, "dictionaryRepresentation");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v120, CFSTR("updateContentItemArtworkMessage"));

  }
  updatePlayerMessage = self->_updatePlayerMessage;
  if (updatePlayerMessage)
  {
    -[_MRUpdatePlayerMessageProtobuf dictionaryRepresentation](updatePlayerMessage, "dictionaryRepresentation");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v122, CFSTR("updatePlayerMessage"));

  }
  promptForRouteAuthorizationMessage = self->_promptForRouteAuthorizationMessage;
  if (promptForRouteAuthorizationMessage)
  {
    -[_MRPromptForRouteAuthorizationMessageProtobuf dictionaryRepresentation](promptForRouteAuthorizationMessage, "dictionaryRepresentation");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v124, CFSTR("promptForRouteAuthorizationMessage"));

  }
  promptForRouteAuthorizationResponseMessage = self->_promptForRouteAuthorizationResponseMessage;
  if (promptForRouteAuthorizationResponseMessage)
  {
    -[_MRPromptForRouteAuthorizationResponseMessageProtobuf dictionaryRepresentation](promptForRouteAuthorizationResponseMessage, "dictionaryRepresentation");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v126, CFSTR("promptForRouteAuthorizationResponseMessage"));

  }
  presentRouteAuthorizationStatusMessage = self->_presentRouteAuthorizationStatusMessage;
  if (presentRouteAuthorizationStatusMessage)
  {
    -[_MRPresentRouteAuthorizationStatusMessageProtobuf dictionaryRepresentation](presentRouteAuthorizationStatusMessage, "dictionaryRepresentation");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v128, CFSTR("presentRouteAuthorizationStatusMessage"));

  }
  getVolumeControlCapabilitiesMessage = self->_getVolumeControlCapabilitiesMessage;
  if (getVolumeControlCapabilitiesMessage)
  {
    -[_MRGetVolumeControlCapabilitiesMessageProtobuf dictionaryRepresentation](getVolumeControlCapabilitiesMessage, "dictionaryRepresentation");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v130, CFSTR("getVolumeControlCapabilitiesMessage"));

  }
  getVolumeControlCapabilitiesResultMessage = self->_getVolumeControlCapabilitiesResultMessage;
  if (getVolumeControlCapabilitiesResultMessage)
  {
    -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf dictionaryRepresentation](getVolumeControlCapabilitiesResultMessage, "dictionaryRepresentation");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v132, CFSTR("getVolumeControlCapabilitiesResultMessage"));

  }
  volumeControlCapabilitiesDidChangeMessage = self->_volumeControlCapabilitiesDidChangeMessage;
  if (volumeControlCapabilitiesDidChangeMessage)
  {
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf dictionaryRepresentation](volumeControlCapabilitiesDidChangeMessage, "dictionaryRepresentation");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v134, CFSTR("volumeControlCapabilitiesDidChangeMessage"));

  }
  updateOutputDevicesMessage = self->_updateOutputDevicesMessage;
  if (updateOutputDevicesMessage)
  {
    -[_MRUpdateOutputDevicesMessageProtobuf dictionaryRepresentation](updateOutputDevicesMessage, "dictionaryRepresentation");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v136, CFSTR("updateOutputDevicesMessage"));

  }
  removeOutputDevicesMessage = self->_removeOutputDevicesMessage;
  if (removeOutputDevicesMessage)
  {
    -[_MRRemoveOutputDevicesMessageProtobuf dictionaryRepresentation](removeOutputDevicesMessage, "dictionaryRepresentation");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v138, CFSTR("removeOutputDevicesMessage"));

  }
  remoteTextInputMessage = self->_remoteTextInputMessage;
  if (remoteTextInputMessage)
  {
    -[_MRRemoteTextInputMessageProtobuf dictionaryRepresentation](remoteTextInputMessage, "dictionaryRepresentation");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v140, CFSTR("remoteTextInputMessage"));

  }
  getRemoteTextInputSessionMessage = self->_getRemoteTextInputSessionMessage;
  if (getRemoteTextInputSessionMessage)
  {
    -[_MRGetRemoteTextInputSessionProtobuf dictionaryRepresentation](getRemoteTextInputSessionMessage, "dictionaryRepresentation");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v142, CFSTR("getRemoteTextInputSessionMessage"));

  }
  playbackSessionRequestMessage = self->_playbackSessionRequestMessage;
  if (playbackSessionRequestMessage)
  {
    -[_MRPlaybackSessionRequestMessageProtobuf dictionaryRepresentation](playbackSessionRequestMessage, "dictionaryRepresentation");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v144, CFSTR("playbackSessionRequestMessage"));

  }
  playbackSessionResponseMessage = self->_playbackSessionResponseMessage;
  if (playbackSessionResponseMessage)
  {
    -[_MRPlaybackSessionResponseMessageProtobuf dictionaryRepresentation](playbackSessionResponseMessage, "dictionaryRepresentation");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v146, CFSTR("playbackSessionResponseMessage"));

  }
  playbackSessionMigrateRequestMessage = self->_playbackSessionMigrateRequestMessage;
  if (playbackSessionMigrateRequestMessage)
  {
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf dictionaryRepresentation](playbackSessionMigrateRequestMessage, "dictionaryRepresentation");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v148, CFSTR("playbackSessionMigrateRequestMessage"));

  }
  playbackSessionMigrateResponseMessage = self->_playbackSessionMigrateResponseMessage;
  if (playbackSessionMigrateResponseMessage)
  {
    -[_MRPlaybackSessionMigrateResponseMessageProtobuf dictionaryRepresentation](playbackSessionMigrateResponseMessage, "dictionaryRepresentation");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v150, CFSTR("playbackSessionMigrateResponseMessage"));

  }
  errorDescription = self->_errorDescription;
  if (errorDescription)
    objc_msgSend(v3, "setObject:forKey:", errorDescription, CFSTR("errorDescription"));
  playbackSessionMigrateBeginMessage = self->_playbackSessionMigrateBeginMessage;
  if (playbackSessionMigrateBeginMessage)
  {
    -[_MRPlaybackSessionMigrateBeginMessageProtobuf dictionaryRepresentation](playbackSessionMigrateBeginMessage, "dictionaryRepresentation");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v153, CFSTR("playbackSessionMigrateBeginMessage"));

  }
  playbackSessionMigrateEndMessage = self->_playbackSessionMigrateEndMessage;
  if (playbackSessionMigrateEndMessage)
  {
    -[_MRPlaybackSessionMigrateEndMessageProtobuf dictionaryRepresentation](playbackSessionMigrateEndMessage, "dictionaryRepresentation");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v155, CFSTR("playbackSessionMigrateEndMessage"));

  }
  updateActiveSystemEndpointMessage = self->_updateActiveSystemEndpointMessage;
  if (updateActiveSystemEndpointMessage)
  {
    -[_MRUpdateActiveSystemEndpointMessageProtobuf dictionaryRepresentation](updateActiveSystemEndpointMessage, "dictionaryRepresentation");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v157, CFSTR("updateActiveSystemEndpointMessage"));

  }
  discoveryModeMessage = self->_discoveryModeMessage;
  if (discoveryModeMessage)
  {
    -[_MRSetDiscoveryModeProtobufMessage dictionaryRepresentation](discoveryModeMessage, "dictionaryRepresentation");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v159, CFSTR("discoveryModeMessage"));

  }
  updateEndpointsMessage = self->_updateEndpointsMessage;
  if (updateEndpointsMessage)
  {
    -[_MRUpdateEndpointsMessageProtobuf dictionaryRepresentation](updateEndpointsMessage, "dictionaryRepresentation");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v161, CFSTR("updateEndpointsMessage"));

  }
  removeEndpointsMessage = self->_removeEndpointsMessage;
  if (removeEndpointsMessage)
  {
    -[_MRRemoveEndpointsMessageProtobuf dictionaryRepresentation](removeEndpointsMessage, "dictionaryRepresentation");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v163, CFSTR("removeEndpointsMessage"));

  }
  playerClientPropertiesMessage = self->_playerClientPropertiesMessage;
  if (playerClientPropertiesMessage)
  {
    -[_MRPlayerClientPropertiesMessageProtobuf dictionaryRepresentation](playerClientPropertiesMessage, "dictionaryRepresentation");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v165, CFSTR("playerClientPropertiesMessage"));

  }
  originClientPropertiesMessage = self->_originClientPropertiesMessage;
  if (originClientPropertiesMessage)
  {
    -[_MROriginClientPropertiesMessageProtobuf dictionaryRepresentation](originClientPropertiesMessage, "dictionaryRepresentation");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v167, CFSTR("originClientPropertiesMessage"));

  }
  audioFadeMessage = self->_audioFadeMessage;
  if (audioFadeMessage)
  {
    -[_MRAudioFadeMessageProtobuf dictionaryRepresentation](audioFadeMessage, "dictionaryRepresentation");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v169, CFSTR("audioFadeMessage"));

  }
  audioFadeResponseMessage = self->_audioFadeResponseMessage;
  if (audioFadeResponseMessage)
  {
    -[_MRAudioFadeResponseMessageProtobuf dictionaryRepresentation](audioFadeResponseMessage, "dictionaryRepresentation");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v171, CFSTR("audioFadeResponseMessage"));

  }
  discoveryUpdateEndpointsMessage = self->_discoveryUpdateEndpointsMessage;
  if (discoveryUpdateEndpointsMessage)
  {
    -[_MRDiscoveryUpdateEndpointsProtobufMessage dictionaryRepresentation](discoveryUpdateEndpointsMessage, "dictionaryRepresentation");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v173, CFSTR("discoveryUpdateEndpointsMessage"));

  }
  discoveryUpdateOutputDevicesMessage = self->_discoveryUpdateOutputDevicesMessage;
  if (discoveryUpdateOutputDevicesMessage)
  {
    -[_MRDiscoveryUpdateOutputDevicesProtobufMessage dictionaryRepresentation](discoveryUpdateOutputDevicesMessage, "dictionaryRepresentation");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v175, CFSTR("discoveryUpdateOutputDevicesMessage"));

  }
  setListeningModeMessage = self->_setListeningModeMessage;
  if (setListeningModeMessage)
  {
    -[_MRSetListeningModeMessageProtobuf dictionaryRepresentation](setListeningModeMessage, "dictionaryRepresentation");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v177, CFSTR("setListeningModeMessage"));

  }
  configureConnectionMessage = self->_configureConnectionMessage;
  if (configureConnectionMessage)
  {
    -[_MRConfigureConnectionMessageProtobuf dictionaryRepresentation](configureConnectionMessage, "dictionaryRepresentation");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v179, CFSTR("configureConnectionMessage"));

  }
  createHostedEndpointRequest = self->_createHostedEndpointRequest;
  if (createHostedEndpointRequest)
  {
    -[_MRCreateHostedEndpointRequestProtobuf dictionaryRepresentation](createHostedEndpointRequest, "dictionaryRepresentation");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v181, CFSTR("createHostedEndpointRequest"));

  }
  createHostedEndpointResponse = self->_createHostedEndpointResponse;
  if (createHostedEndpointResponse)
  {
    -[_MRCreateHostedEndpointResponseProtobuf dictionaryRepresentation](createHostedEndpointResponse, "dictionaryRepresentation");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v183, CFSTR("createHostedEndpointResponse"));

  }
  adjustVolumeMessage = self->_adjustVolumeMessage;
  if (adjustVolumeMessage)
  {
    -[_MRAdjustVolumeMessageProtobuf dictionaryRepresentation](adjustVolumeMessage, "dictionaryRepresentation");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v185, CFSTR("adjustVolumeMessage"));

  }
  getVolumeMutedMessage = self->_getVolumeMutedMessage;
  if (getVolumeMutedMessage)
  {
    -[_MRGetVolumeMutedMessageProtobuf dictionaryRepresentation](getVolumeMutedMessage, "dictionaryRepresentation");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v187, CFSTR("getVolumeMutedMessage"));

  }
  getVolumeMutedResultMessage = self->_getVolumeMutedResultMessage;
  if (getVolumeMutedResultMessage)
  {
    -[_MRGetVolumeMutedResultMessageProtobuf dictionaryRepresentation](getVolumeMutedResultMessage, "dictionaryRepresentation");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v189, CFSTR("getVolumeMutedResultMessage"));

  }
  setVolumeMutedMessage = self->_setVolumeMutedMessage;
  if (setVolumeMutedMessage)
  {
    -[_MRSetVolumeMutedMessageProtobuf dictionaryRepresentation](setVolumeMutedMessage, "dictionaryRepresentation");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v191, CFSTR("setVolumeMutedMessage"));

  }
  volumeMutedDidChangeMessage = self->_volumeMutedDidChangeMessage;
  if (volumeMutedDidChangeMessage)
  {
    -[_MRVolumeMutedDidChangeMessageProtobuf dictionaryRepresentation](volumeMutedDidChangeMessage, "dictionaryRepresentation");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v193, CFSTR("volumeMutedDidChangeMessage"));

  }
  setConversationDetectionEnabledMessage = self->_setConversationDetectionEnabledMessage;
  if (setConversationDetectionEnabledMessage)
  {
    -[_MRSetConversationDetectionEnabledMessageProtobuf dictionaryRepresentation](setConversationDetectionEnabledMessage, "dictionaryRepresentation");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v195, CFSTR("setConversationDetectionEnabledMessage"));

  }
  playerClientParticipantsUpdateMessage = self->_playerClientParticipantsUpdateMessage;
  if (playerClientParticipantsUpdateMessage)
  {
    -[_MRPlayerClientParticipantsUpdateMessageProtobuf dictionaryRepresentation](playerClientParticipantsUpdateMessage, "dictionaryRepresentation");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v197, CFSTR("playerClientParticipantsUpdateMessage"));

  }
  requestGroupSessionMessage = self->_requestGroupSessionMessage;
  if (requestGroupSessionMessage)
  {
    -[_MRRequestGroupSessionMessageProtobuf dictionaryRepresentation](requestGroupSessionMessage, "dictionaryRepresentation");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v199, CFSTR("requestGroupSessionMessage"));

  }
  v200 = v3;

  return v200;
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[176] = self->_type;
    *((_BYTE *)v4 + 816) |= 4u;
  }
  v6 = v4;
  if (self->_replyIdentifier)
  {
    objc_msgSend(v4, "setReplyIdentifier:");
    v4 = v6;
  }
  if (self->_authenticationToken)
  {
    objc_msgSend(v6, "setAuthenticationToken:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[36] = self->_errorCode;
    *((_BYTE *)v4 + 816) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_timestamp;
    *((_BYTE *)v4 + 816) |= 1u;
  }
  if (self->_sendCommandMessage)
  {
    objc_msgSend(v6, "setSendCommandMessage:");
    v4 = v6;
  }
  if (self->_sendCommandResultMessage)
  {
    objc_msgSend(v6, "setSendCommandResultMessage:");
    v4 = v6;
  }
  if (self->_getStateMessage)
  {
    objc_msgSend(v6, "setGetStateMessage:");
    v4 = v6;
  }
  if (self->_setStateMessage)
  {
    objc_msgSend(v6, "setSetStateMessage:");
    v4 = v6;
  }
  if (self->_setArtworkMessage)
  {
    objc_msgSend(v6, "setSetArtworkMessage:");
    v4 = v6;
  }
  if (self->_registerHIDDeviceMessage)
  {
    objc_msgSend(v6, "setRegisterHIDDeviceMessage:");
    v4 = v6;
  }
  if (self->_registerHIDDeviceResultMessage)
  {
    objc_msgSend(v6, "setRegisterHIDDeviceResultMessage:");
    v4 = v6;
  }
  if (self->_sendHIDEventMessage)
  {
    objc_msgSend(v6, "setSendHIDEventMessage:");
    v4 = v6;
  }
  if (self->_sendHIDReportMessage)
  {
    objc_msgSend(v6, "setSendHIDReportMessage:");
    v4 = v6;
  }
  if (self->_sendVirtualTouchEventMessage)
  {
    objc_msgSend(v6, "setSendVirtualTouchEventMessage:");
    v4 = v6;
  }
  if (self->_notificationMessage)
  {
    objc_msgSend(v6, "setNotificationMessage:");
    v4 = v6;
  }
  if (self->_contentItemsChangedNotificationMessage)
  {
    objc_msgSend(v6, "setContentItemsChangedNotificationMessage:");
    v4 = v6;
  }
  if (self->_deviceInfoMessage)
  {
    objc_msgSend(v6, "setDeviceInfoMessage:");
    v4 = v6;
  }
  if (self->_clientUpdatesConfigMessage)
  {
    objc_msgSend(v6, "setClientUpdatesConfigMessage:");
    v4 = v6;
  }
  if (self->_masterVolumeControlCapabilitiesDidChangeMessage)
  {
    objc_msgSend(v6, "setMasterVolumeControlCapabilitiesDidChangeMessage:");
    v4 = v6;
  }
  if (self->_gameController)
  {
    objc_msgSend(v6, "setGameController:");
    v4 = v6;
  }
  if (self->_registerGameController)
  {
    objc_msgSend(v6, "setRegisterGameController:");
    v4 = v6;
  }
  if (self->_registerGameControllerResponse)
  {
    objc_msgSend(v6, "setRegisterGameControllerResponse:");
    v4 = v6;
  }
  if (self->_unregisterGameController)
  {
    objc_msgSend(v6, "setUnregisterGameController:");
    v4 = v6;
  }
  if (self->_registerForGameControllerEvents)
  {
    objc_msgSend(v6, "setRegisterForGameControllerEvents:");
    v4 = v6;
  }
  if (self->_keyboardMessage)
  {
    objc_msgSend(v6, "setKeyboardMessage:");
    v4 = v6;
  }
  if (self->_getKeyboardMessage)
  {
    objc_msgSend(v6, "setGetKeyboardMessage:");
    v4 = v6;
  }
  if (self->_textInputMessage)
  {
    objc_msgSend(v6, "setTextInputMessage:");
    v4 = v6;
  }
  if (self->_getVoiceInputDevicesMessage)
  {
    objc_msgSend(v6, "setGetVoiceInputDevicesMessage:");
    v4 = v6;
  }
  if (self->_getVoiceInputDevicesResponseMessage)
  {
    objc_msgSend(v6, "setGetVoiceInputDevicesResponseMessage:");
    v4 = v6;
  }
  if (self->_registerVoiceInputDeviceMessage)
  {
    objc_msgSend(v6, "setRegisterVoiceInputDeviceMessage:");
    v4 = v6;
  }
  if (self->_registerVoiceInputDeviceResponseMessage)
  {
    objc_msgSend(v6, "setRegisterVoiceInputDeviceResponseMessage:");
    v4 = v6;
  }
  if (self->_setRecordingStateMessage)
  {
    objc_msgSend(v6, "setSetRecordingStateMessage:");
    v4 = v6;
  }
  if (self->_sendVoiceInputMessage)
  {
    objc_msgSend(v6, "setSendVoiceInputMessage:");
    v4 = v6;
  }
  if (self->_playbackQueueRequest)
  {
    objc_msgSend(v6, "setPlaybackQueueRequest:");
    v4 = v6;
  }
  if (self->_transactionPackets)
  {
    objc_msgSend(v6, "setTransactionPackets:");
    v4 = v6;
  }
  if (self->_cryptoPairingMessage)
  {
    objc_msgSend(v6, "setCryptoPairingMessage:");
    v4 = v6;
  }
  if (self->_gameControllerProperties)
  {
    objc_msgSend(v6, "setGameControllerProperties:");
    v4 = v6;
  }
  if (self->_readyStateMessage)
  {
    objc_msgSend(v6, "setReadyStateMessage:");
    v4 = v6;
  }
  if (self->_connectionState)
  {
    objc_msgSend(v6, "setConnectionState:");
    v4 = v6;
  }
  if (self->_sendButtonEventMessage)
  {
    objc_msgSend(v6, "setSendButtonEventMessage:");
    v4 = v6;
  }
  if (self->_setHiliteModeMessage)
  {
    objc_msgSend(v6, "setSetHiliteModeMessage:");
    v4 = v6;
  }
  if (self->_wakeDeviceMessage)
  {
    objc_msgSend(v6, "setWakeDeviceMessage:");
    v4 = v6;
  }
  if (self->_genericMessage)
  {
    objc_msgSend(v6, "setGenericMessage:");
    v4 = v6;
  }
  if (self->_sendPackedVirtualTouchEventMessage)
  {
    objc_msgSend(v6, "setSendPackedVirtualTouchEventMessage:");
    v4 = v6;
  }
  if (self->_sendLyricsEventMessage)
  {
    objc_msgSend(v6, "setSendLyricsEventMessage:");
    v4 = v6;
  }
  if (self->_setNowPlayingClientMessage)
  {
    objc_msgSend(v6, "setSetNowPlayingClientMessage:");
    v4 = v6;
  }
  if (self->_setNowPlayingPlayerMessage)
  {
    objc_msgSend(v6, "setSetNowPlayingPlayerMessage:");
    v4 = v6;
  }
  if (self->_modifyOutputContextRequestMessage)
  {
    objc_msgSend(v6, "setModifyOutputContextRequestMessage:");
    v4 = v6;
  }
  if (self->_getVolumeMessage)
  {
    objc_msgSend(v6, "setGetVolumeMessage:");
    v4 = v6;
  }
  if (self->_getVolumeResultMessage)
  {
    objc_msgSend(v6, "setGetVolumeResultMessage:");
    v4 = v6;
  }
  if (self->_setVolumeMessage)
  {
    objc_msgSend(v6, "setSetVolumeMessage:");
    v4 = v6;
  }
  if (self->_volumeDidChangeMessage)
  {
    objc_msgSend(v6, "setVolumeDidChangeMessage:");
    v4 = v6;
  }
  if (self->_removeClientMessage)
  {
    objc_msgSend(v6, "setRemoveClientMessage:");
    v4 = v6;
  }
  if (self->_removePlayerMessage)
  {
    objc_msgSend(v6, "setRemovePlayerMessage:");
    v4 = v6;
  }
  if (self->_updateClientMessage)
  {
    objc_msgSend(v6, "setUpdateClientMessage:");
    v4 = v6;
  }
  if (self->_updateContentItemMessage)
  {
    objc_msgSend(v6, "setUpdateContentItemMessage:");
    v4 = v6;
  }
  if (self->_updateContentItemArtworkMessage)
  {
    objc_msgSend(v6, "setUpdateContentItemArtworkMessage:");
    v4 = v6;
  }
  if (self->_updatePlayerMessage)
  {
    objc_msgSend(v6, "setUpdatePlayerMessage:");
    v4 = v6;
  }
  if (self->_promptForRouteAuthorizationMessage)
  {
    objc_msgSend(v6, "setPromptForRouteAuthorizationMessage:");
    v4 = v6;
  }
  if (self->_promptForRouteAuthorizationResponseMessage)
  {
    objc_msgSend(v6, "setPromptForRouteAuthorizationResponseMessage:");
    v4 = v6;
  }
  if (self->_presentRouteAuthorizationStatusMessage)
  {
    objc_msgSend(v6, "setPresentRouteAuthorizationStatusMessage:");
    v4 = v6;
  }
  if (self->_getVolumeControlCapabilitiesMessage)
  {
    objc_msgSend(v6, "setGetVolumeControlCapabilitiesMessage:");
    v4 = v6;
  }
  if (self->_getVolumeControlCapabilitiesResultMessage)
  {
    objc_msgSend(v6, "setGetVolumeControlCapabilitiesResultMessage:");
    v4 = v6;
  }
  if (self->_volumeControlCapabilitiesDidChangeMessage)
  {
    objc_msgSend(v6, "setVolumeControlCapabilitiesDidChangeMessage:");
    v4 = v6;
  }
  if (self->_updateOutputDevicesMessage)
  {
    objc_msgSend(v6, "setUpdateOutputDevicesMessage:");
    v4 = v6;
  }
  if (self->_removeOutputDevicesMessage)
  {
    objc_msgSend(v6, "setRemoveOutputDevicesMessage:");
    v4 = v6;
  }
  if (self->_remoteTextInputMessage)
  {
    objc_msgSend(v6, "setRemoteTextInputMessage:");
    v4 = v6;
  }
  if (self->_getRemoteTextInputSessionMessage)
  {
    objc_msgSend(v6, "setGetRemoteTextInputSessionMessage:");
    v4 = v6;
  }
  if (self->_playbackSessionRequestMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionRequestMessage:");
    v4 = v6;
  }
  if (self->_playbackSessionResponseMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionResponseMessage:");
    v4 = v6;
  }
  if (self->_setDefaultSupportedCommandsMessage)
  {
    objc_msgSend(v6, "setSetDefaultSupportedCommandsMessage:");
    v4 = v6;
  }
  if (self->_playbackSessionMigrateRequestMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionMigrateRequestMessage:");
    v4 = v6;
  }
  if (self->_playbackSessionMigrateResponseMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionMigrateResponseMessage:");
    v4 = v6;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v6, "setErrorDescription:");
    v4 = v6;
  }
  if (self->_playbackSessionMigrateBeginMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionMigrateBeginMessage:");
    v4 = v6;
  }
  if (self->_playbackSessionMigrateEndMessage)
  {
    objc_msgSend(v6, "setPlaybackSessionMigrateEndMessage:");
    v4 = v6;
  }
  if (self->_updateActiveSystemEndpointMessage)
  {
    objc_msgSend(v6, "setUpdateActiveSystemEndpointMessage:");
    v4 = v6;
  }
  if (self->_discoveryModeMessage)
  {
    objc_msgSend(v6, "setDiscoveryModeMessage:");
    v4 = v6;
  }
  if (self->_updateEndpointsMessage)
  {
    objc_msgSend(v6, "setUpdateEndpointsMessage:");
    v4 = v6;
  }
  if (self->_removeEndpointsMessage)
  {
    objc_msgSend(v6, "setRemoveEndpointsMessage:");
    v4 = v6;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v6, "setUniqueIdentifier:");
    v4 = v6;
  }
  if (self->_playerClientPropertiesMessage)
  {
    objc_msgSend(v6, "setPlayerClientPropertiesMessage:");
    v4 = v6;
  }
  if (self->_originClientPropertiesMessage)
  {
    objc_msgSend(v6, "setOriginClientPropertiesMessage:");
    v4 = v6;
  }
  if (self->_audioFadeMessage)
  {
    objc_msgSend(v6, "setAudioFadeMessage:");
    v4 = v6;
  }
  if (self->_audioFadeResponseMessage)
  {
    objc_msgSend(v6, "setAudioFadeResponseMessage:");
    v4 = v6;
  }
  if (self->_discoveryUpdateEndpointsMessage)
  {
    objc_msgSend(v6, "setDiscoveryUpdateEndpointsMessage:");
    v4 = v6;
  }
  if (self->_discoveryUpdateOutputDevicesMessage)
  {
    objc_msgSend(v6, "setDiscoveryUpdateOutputDevicesMessage:");
    v4 = v6;
  }
  if (self->_setListeningModeMessage)
  {
    objc_msgSend(v6, "setSetListeningModeMessage:");
    v4 = v6;
  }
  if (self->_error)
  {
    objc_msgSend(v6, "setError:");
    v4 = v6;
  }
  if (self->_configureConnectionMessage)
  {
    objc_msgSend(v6, "setConfigureConnectionMessage:");
    v4 = v6;
  }
  if (self->_createHostedEndpointRequest)
  {
    objc_msgSend(v6, "setCreateHostedEndpointRequest:");
    v4 = v6;
  }
  if (self->_createHostedEndpointResponse)
  {
    objc_msgSend(v6, "setCreateHostedEndpointResponse:");
    v4 = v6;
  }
  if (self->_adjustVolumeMessage)
  {
    objc_msgSend(v6, "setAdjustVolumeMessage:");
    v4 = v6;
  }
  if (self->_getVolumeMutedMessage)
  {
    objc_msgSend(v6, "setGetVolumeMutedMessage:");
    v4 = v6;
  }
  if (self->_getVolumeMutedResultMessage)
  {
    objc_msgSend(v6, "setGetVolumeMutedResultMessage:");
    v4 = v6;
  }
  if (self->_setVolumeMutedMessage)
  {
    objc_msgSend(v6, "setSetVolumeMutedMessage:");
    v4 = v6;
  }
  if (self->_volumeMutedDidChangeMessage)
  {
    objc_msgSend(v6, "setVolumeMutedDidChangeMessage:");
    v4 = v6;
  }
  if (self->_setConversationDetectionEnabledMessage)
  {
    objc_msgSend(v6, "setSetConversationDetectionEnabledMessage:");
    v4 = v6;
  }
  if (self->_playerClientParticipantsUpdateMessage)
  {
    objc_msgSend(v6, "setPlayerClientParticipantsUpdateMessage:");
    v4 = v6;
  }
  if (self->_requestGroupSessionMessage)
  {
    objc_msgSend(v6, "setRequestGroupSessionMessage:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char has;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  id v140;
  void *v141;
  id v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  void *v147;
  id v148;
  void *v149;
  uint64_t v150;
  void *v151;
  id v152;
  void *v153;
  id v154;
  void *v155;
  id v156;
  void *v157;
  id v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  void *v163;
  uint64_t v164;
  void *v165;
  id v166;
  void *v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  id v172;
  void *v173;
  id v174;
  void *v175;
  id v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  void *v181;
  id v182;
  void *v183;
  id v184;
  void *v185;
  id v186;
  void *v187;
  id v188;
  void *v189;
  id v190;
  void *v191;
  id v192;
  void *v193;
  id v194;
  void *v195;
  id v196;
  void *v197;
  id v198;
  void *v199;
  id v200;
  void *v201;
  id v202;
  void *v203;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 704) = self->_type;
    *(_BYTE *)(v5 + 816) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_replyIdentifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 512);
  *(_QWORD *)(v6 + 512) = v7;

  v9 = -[NSString copyWithZone:](self->_authenticationToken, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 144) = self->_errorCode;
    *(_BYTE *)(v6 + 816) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_timestamp;
    *(_BYTE *)(v6 + 816) |= 1u;
  }
  v12 = -[_MRSendCommandMessageProtobuf copyWithZone:](self->_sendCommandMessage, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 536);
  *(_QWORD *)(v6 + 536) = v12;

  v14 = -[_MRSendCommandResultMessageProtobuf copyWithZone:](self->_sendCommandResultMessage, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 544);
  *(_QWORD *)(v6 + 544) = v14;

  v16 = -[_MRGetStateMessageProtobuf copyWithZone:](self->_getStateMessage, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 200);
  *(_QWORD *)(v6 + 200) = v16;

  v18 = -[_MRSetStateMessageProtobuf copyWithZone:](self->_setStateMessage, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 664);
  *(_QWORD *)(v6 + 664) = v18;

  v20 = -[_MRSetArtworkMessageProtobuf copyWithZone:](self->_setArtworkMessage, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 600);
  *(_QWORD *)(v6 + 600) = v20;

  v22 = -[_MRRegisterHIDDeviceMessageProtobuf copyWithZone:](self->_registerHIDDeviceMessage, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 440);
  *(_QWORD *)(v6 + 440) = v22;

  v24 = -[_MRRegisterHIDDeviceResultMessageProtobuf copyWithZone:](self->_registerHIDDeviceResultMessage, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 448);
  *(_QWORD *)(v6 + 448) = v24;

  v26 = -[_MRSendHIDEventMessageProtobuf copyWithZone:](self->_sendHIDEventMessage, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 552);
  *(_QWORD *)(v6 + 552) = v26;

  v28 = -[_MRSendHIDReportMessageProtobuf copyWithZone:](self->_sendHIDReportMessage, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 560);
  *(_QWORD *)(v6 + 560) = v28;

  v30 = -[_MRSendVirtualTouchEventMessageProtobuf copyWithZone:](self->_sendVirtualTouchEventMessage, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 584);
  *(_QWORD *)(v6 + 584) = v30;

  v32 = -[_MRNotificationMessageProtobuf copyWithZone:](self->_notificationMessage, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 296);
  *(_QWORD *)(v6 + 296) = v32;

  v34 = -[_MRPlaybackQueueProtobuf copyWithZone:](self->_contentItemsChangedNotificationMessage, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v34;

  v36 = -[_MRDeviceInfoMessageProtobuf copyWithZone:](self->_deviceInfoMessage, "copyWithZone:", a3);
  v37 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v36;

  v38 = -[_MRClientUpdatesConfigurationProtobuf copyWithZone:](self->_clientUpdatesConfigMessage, "copyWithZone:", a3);
  v39 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v38;

  v40 = -[_MRVolumeControlAvailabilityProtobuf copyWithZone:](self->_masterVolumeControlCapabilitiesDidChangeMessage, "copyWithZone:", a3);
  v41 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v40;

  v42 = -[_MRGameControllerMessageProtobuf copyWithZone:](self->_gameController, "copyWithZone:", a3);
  v43 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v42;

  v44 = -[_MRRegisterGameControllerMessageProtobuf copyWithZone:](self->_registerGameController, "copyWithZone:", a3);
  v45 = *(void **)(v6 + 424);
  *(_QWORD *)(v6 + 424) = v44;

  v46 = -[_MRRegisterGameControllerResponseMessageProtobuf copyWithZone:](self->_registerGameControllerResponse, "copyWithZone:", a3);
  v47 = *(void **)(v6 + 432);
  *(_QWORD *)(v6 + 432) = v46;

  v48 = -[_MRUnregisterGameControllerMessageProtobuf copyWithZone:](self->_unregisterGameController, "copyWithZone:", a3);
  v49 = *(void **)(v6 + 720);
  *(_QWORD *)(v6 + 720) = v48;

  v50 = -[_MRRegisterForGameControllerEventsMessageProtobuf copyWithZone:](self->_registerForGameControllerEvents, "copyWithZone:", a3);
  v51 = *(void **)(v6 + 416);
  *(_QWORD *)(v6 + 416) = v50;

  v52 = -[_MRKeyboardMessageProtobuf copyWithZone:](self->_keyboardMessage, "copyWithZone:", a3);
  v53 = *(void **)(v6 + 272);
  *(_QWORD *)(v6 + 272) = v52;

  v54 = -[_MRGetKeyboardSessionProtobuf copyWithZone:](self->_getKeyboardMessage, "copyWithZone:", a3);
  v55 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v54;

  v56 = -[_MRTextInputMessageProtobuf copyWithZone:](self->_textInputMessage, "copyWithZone:", a3);
  v57 = *(void **)(v6 + 688);
  *(_QWORD *)(v6 + 688) = v56;

  v58 = -[_MRGetVoiceInputDevicesMessageProtobuf copyWithZone:](self->_getVoiceInputDevicesMessage, "copyWithZone:", a3);
  v59 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v58;

  v60 = -[_MRGetVoiceInputDevicesResponseMessageProtobuf copyWithZone:](self->_getVoiceInputDevicesResponseMessage, "copyWithZone:", a3);
  v61 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v60;

  v62 = -[_MRRegisterVoiceInputDeviceMessageProtobuf copyWithZone:](self->_registerVoiceInputDeviceMessage, "copyWithZone:", a3);
  v63 = *(void **)(v6 + 456);
  *(_QWORD *)(v6 + 456) = v62;

  v64 = -[_MRRegisterVoiceInputDeviceResponseMessageProtobuf copyWithZone:](self->_registerVoiceInputDeviceResponseMessage, "copyWithZone:", a3);
  v65 = *(void **)(v6 + 464);
  *(_QWORD *)(v6 + 464) = v64;

  v66 = -[_MRSetRecordingStateMessageProtobuf copyWithZone:](self->_setRecordingStateMessage, "copyWithZone:", a3);
  v67 = *(void **)(v6 + 656);
  *(_QWORD *)(v6 + 656) = v66;

  v68 = -[_MRSendVoiceInputMessageProtobuf copyWithZone:](self->_sendVoiceInputMessage, "copyWithZone:", a3);
  v69 = *(void **)(v6 + 592);
  *(_QWORD *)(v6 + 592) = v68;

  v70 = -[_MRPlaybackQueueRequestProtobuf copyWithZone:](self->_playbackQueueRequest, "copyWithZone:", a3);
  v71 = *(void **)(v6 + 312);
  *(_QWORD *)(v6 + 312) = v70;

  v72 = -[_MRTransactionMessageProtobuf copyWithZone:](self->_transactionPackets, "copyWithZone:", a3);
  v73 = *(void **)(v6 + 696);
  *(_QWORD *)(v6 + 696) = v72;

  v74 = -[_MRCryptoPairingMessageProtobuf copyWithZone:](self->_cryptoPairingMessage, "copyWithZone:", a3);
  v75 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v74;

  v76 = -[_MRGameControllerPropertiesMessageProtobuf copyWithZone:](self->_gameControllerProperties, "copyWithZone:", a3);
  v77 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v76;

  v78 = -[_MRSetReadyStateMessageProtobuf copyWithZone:](self->_readyStateMessage, "copyWithZone:", a3);
  v79 = *(void **)(v6 + 408);
  *(_QWORD *)(v6 + 408) = v78;

  v80 = -[_MRSetConnectionStateMessageProtobuf copyWithZone:](self->_connectionState, "copyWithZone:", a3);
  v81 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v80;

  v82 = -[_MRSendButtonEventMessageProtobuf copyWithZone:](self->_sendButtonEventMessage, "copyWithZone:", a3);
  v83 = *(void **)(v6 + 528);
  *(_QWORD *)(v6 + 528) = v82;

  v84 = -[_MRSetHiliteModeMessageProtobuf copyWithZone:](self->_setHiliteModeMessage, "copyWithZone:", a3);
  v85 = *(void **)(v6 + 624);
  *(_QWORD *)(v6 + 624) = v84;

  v86 = -[_MRWakeDeviceMessageProtobuf copyWithZone:](self->_wakeDeviceMessage, "copyWithZone:", a3);
  v87 = *(void **)(v6 + 808);
  *(_QWORD *)(v6 + 808) = v86;

  v88 = -[_MRGenericMessageProtobuf copyWithZone:](self->_genericMessage, "copyWithZone:", a3);
  v89 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v88;

  v90 = -[_MRSendPackedVirtualTouchEventMessageProtobuf copyWithZone:](self->_sendPackedVirtualTouchEventMessage, "copyWithZone:", a3);
  v91 = *(void **)(v6 + 576);
  *(_QWORD *)(v6 + 576) = v90;

  v92 = -[_MRSendLyricsEventMessageProtobuf copyWithZone:](self->_sendLyricsEventMessage, "copyWithZone:", a3);
  v93 = *(void **)(v6 + 568);
  *(_QWORD *)(v6 + 568) = v92;

  v94 = -[_MRSetNowPlayingClientMessageProtobuf copyWithZone:](self->_setNowPlayingClientMessage, "copyWithZone:", a3);
  v95 = *(void **)(v6 + 640);
  *(_QWORD *)(v6 + 640) = v94;

  v96 = -[_MRSetNowPlayingPlayerMessageProtobuf copyWithZone:](self->_setNowPlayingPlayerMessage, "copyWithZone:", a3);
  v97 = *(void **)(v6 + 648);
  *(_QWORD *)(v6 + 648) = v96;

  v98 = -[_MRAVModifyOutputContextRequestProtobuf copyWithZone:](self->_modifyOutputContextRequestMessage, "copyWithZone:", a3);
  v99 = *(void **)(v6 + 288);
  *(_QWORD *)(v6 + 288) = v98;

  v100 = -[_MRGetVolumeMessageProtobuf copyWithZone:](self->_getVolumeMessage, "copyWithZone:", a3);
  v101 = *(void **)(v6 + 240);
  *(_QWORD *)(v6 + 240) = v100;

  v102 = -[_MRGetVolumeResultMessageProtobuf copyWithZone:](self->_getVolumeResultMessage, "copyWithZone:", a3);
  v103 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v102;

  v104 = -[_MRSetVolumeMessageProtobuf copyWithZone:](self->_setVolumeMessage, "copyWithZone:", a3);
  v105 = *(void **)(v6 + 672);
  *(_QWORD *)(v6 + 672) = v104;

  v106 = -[_MRVolumeDidChangeMessageProtobuf copyWithZone:](self->_volumeDidChangeMessage, "copyWithZone:", a3);
  v107 = *(void **)(v6 + 792);
  *(_QWORD *)(v6 + 792) = v106;

  v108 = -[_MRRemoveClientMessageProtobuf copyWithZone:](self->_removeClientMessage, "copyWithZone:", a3);
  v109 = *(void **)(v6 + 480);
  *(_QWORD *)(v6 + 480) = v108;

  v110 = -[_MRRemovePlayerMessageProtobuf copyWithZone:](self->_removePlayerMessage, "copyWithZone:", a3);
  v111 = *(void **)(v6 + 504);
  *(_QWORD *)(v6 + 504) = v110;

  v112 = -[_MRUpdateClientMessageProtobuf copyWithZone:](self->_updateClientMessage, "copyWithZone:", a3);
  v113 = *(void **)(v6 + 736);
  *(_QWORD *)(v6 + 736) = v112;

  v114 = -[_MRUpdateContentItemMessageProtobuf copyWithZone:](self->_updateContentItemMessage, "copyWithZone:", a3);
  v115 = *(void **)(v6 + 752);
  *(_QWORD *)(v6 + 752) = v114;

  v116 = -[_MRUpdateContentItemArtworkMessageProtobuf copyWithZone:](self->_updateContentItemArtworkMessage, "copyWithZone:", a3);
  v117 = *(void **)(v6 + 744);
  *(_QWORD *)(v6 + 744) = v116;

  v118 = -[_MRUpdatePlayerMessageProtobuf copyWithZone:](self->_updatePlayerMessage, "copyWithZone:", a3);
  v119 = *(void **)(v6 + 776);
  *(_QWORD *)(v6 + 776) = v118;

  v120 = -[_MRPromptForRouteAuthorizationMessageProtobuf copyWithZone:](self->_promptForRouteAuthorizationMessage, "copyWithZone:", a3);
  v121 = *(void **)(v6 + 392);
  *(_QWORD *)(v6 + 392) = v120;

  v122 = -[_MRPromptForRouteAuthorizationResponseMessageProtobuf copyWithZone:](self->_promptForRouteAuthorizationResponseMessage, "copyWithZone:", a3);
  v123 = *(void **)(v6 + 400);
  *(_QWORD *)(v6 + 400) = v122;

  v124 = -[_MRPresentRouteAuthorizationStatusMessageProtobuf copyWithZone:](self->_presentRouteAuthorizationStatusMessage, "copyWithZone:", a3);
  v125 = *(void **)(v6 + 384);
  *(_QWORD *)(v6 + 384) = v124;

  v126 = -[_MRGetVolumeControlCapabilitiesMessageProtobuf copyWithZone:](self->_getVolumeControlCapabilitiesMessage, "copyWithZone:", a3);
  v127 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v126;

  v128 = -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf copyWithZone:](self->_getVolumeControlCapabilitiesResultMessage, "copyWithZone:", a3);
  v129 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = v128;

  v130 = -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf copyWithZone:](self->_volumeControlCapabilitiesDidChangeMessage, "copyWithZone:", a3);
  v131 = *(void **)(v6 + 784);
  *(_QWORD *)(v6 + 784) = v130;

  v132 = -[_MRUpdateOutputDevicesMessageProtobuf copyWithZone:](self->_updateOutputDevicesMessage, "copyWithZone:", a3);
  v133 = *(void **)(v6 + 768);
  *(_QWORD *)(v6 + 768) = v132;

  v134 = -[_MRRemoveOutputDevicesMessageProtobuf copyWithZone:](self->_removeOutputDevicesMessage, "copyWithZone:", a3);
  v135 = *(void **)(v6 + 496);
  *(_QWORD *)(v6 + 496) = v134;

  v136 = -[_MRRemoteTextInputMessageProtobuf copyWithZone:](self->_remoteTextInputMessage, "copyWithZone:", a3);
  v137 = *(void **)(v6 + 472);
  *(_QWORD *)(v6 + 472) = v136;

  v138 = -[_MRGetRemoteTextInputSessionProtobuf copyWithZone:](self->_getRemoteTextInputSessionMessage, "copyWithZone:", a3);
  v139 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v138;

  v140 = -[_MRPlaybackSessionRequestMessageProtobuf copyWithZone:](self->_playbackSessionRequestMessage, "copyWithZone:", a3);
  v141 = *(void **)(v6 + 352);
  *(_QWORD *)(v6 + 352) = v140;

  v142 = -[_MRPlaybackSessionResponseMessageProtobuf copyWithZone:](self->_playbackSessionResponseMessage, "copyWithZone:", a3);
  v143 = *(void **)(v6 + 360);
  *(_QWORD *)(v6 + 360) = v142;

  v144 = -[_MRSetStateMessageProtobuf copyWithZone:](self->_setDefaultSupportedCommandsMessage, "copyWithZone:", a3);
  v145 = *(void **)(v6 + 616);
  *(_QWORD *)(v6 + 616) = v144;

  v146 = -[_MRPlaybackSessionMigrateRequestMessageProtobuf copyWithZone:](self->_playbackSessionMigrateRequestMessage, "copyWithZone:", a3);
  v147 = *(void **)(v6 + 336);
  *(_QWORD *)(v6 + 336) = v146;

  v148 = -[_MRPlaybackSessionMigrateResponseMessageProtobuf copyWithZone:](self->_playbackSessionMigrateResponseMessage, "copyWithZone:", a3);
  v149 = *(void **)(v6 + 344);
  *(_QWORD *)(v6 + 344) = v148;

  v150 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  v151 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v150;

  v152 = -[_MRPlaybackSessionMigrateBeginMessageProtobuf copyWithZone:](self->_playbackSessionMigrateBeginMessage, "copyWithZone:", a3);
  v153 = *(void **)(v6 + 320);
  *(_QWORD *)(v6 + 320) = v152;

  v154 = -[_MRPlaybackSessionMigrateEndMessageProtobuf copyWithZone:](self->_playbackSessionMigrateEndMessage, "copyWithZone:", a3);
  v155 = *(void **)(v6 + 328);
  *(_QWORD *)(v6 + 328) = v154;

  v156 = -[_MRUpdateActiveSystemEndpointMessageProtobuf copyWithZone:](self->_updateActiveSystemEndpointMessage, "copyWithZone:", a3);
  v157 = *(void **)(v6 + 728);
  *(_QWORD *)(v6 + 728) = v156;

  v158 = -[_MRSetDiscoveryModeProtobufMessage copyWithZone:](self->_discoveryModeMessage, "copyWithZone:", a3);
  v159 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v158;

  v160 = -[_MRUpdateEndpointsMessageProtobuf copyWithZone:](self->_updateEndpointsMessage, "copyWithZone:", a3);
  v161 = *(void **)(v6 + 760);
  *(_QWORD *)(v6 + 760) = v160;

  v162 = -[_MRRemoveEndpointsMessageProtobuf copyWithZone:](self->_removeEndpointsMessage, "copyWithZone:", a3);
  v163 = *(void **)(v6 + 488);
  *(_QWORD *)(v6 + 488) = v162;

  v164 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v165 = *(void **)(v6 + 712);
  *(_QWORD *)(v6 + 712) = v164;

  v166 = -[_MRPlayerClientPropertiesMessageProtobuf copyWithZone:](self->_playerClientPropertiesMessage, "copyWithZone:", a3);
  v167 = *(void **)(v6 + 376);
  *(_QWORD *)(v6 + 376) = v166;

  v168 = -[_MROriginClientPropertiesMessageProtobuf copyWithZone:](self->_originClientPropertiesMessage, "copyWithZone:", a3);
  v169 = *(void **)(v6 + 304);
  *(_QWORD *)(v6 + 304) = v168;

  v170 = -[_MRAudioFadeMessageProtobuf copyWithZone:](self->_audioFadeMessage, "copyWithZone:", a3);
  v171 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v170;

  v172 = -[_MRAudioFadeResponseMessageProtobuf copyWithZone:](self->_audioFadeResponseMessage, "copyWithZone:", a3);
  v173 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v172;

  v174 = -[_MRDiscoveryUpdateEndpointsProtobufMessage copyWithZone:](self->_discoveryUpdateEndpointsMessage, "copyWithZone:", a3);
  v175 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v174;

  v176 = -[_MRDiscoveryUpdateOutputDevicesProtobufMessage copyWithZone:](self->_discoveryUpdateOutputDevicesMessage, "copyWithZone:", a3);
  v177 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v176;

  v178 = -[_MRSetListeningModeMessageProtobuf copyWithZone:](self->_setListeningModeMessage, "copyWithZone:", a3);
  v179 = *(void **)(v6 + 632);
  *(_QWORD *)(v6 + 632) = v178;

  v180 = -[_MRErrorProtobuf copyWithZone:](self->_error, "copyWithZone:", a3);
  v181 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v180;

  v182 = -[_MRConfigureConnectionMessageProtobuf copyWithZone:](self->_configureConnectionMessage, "copyWithZone:", a3);
  v183 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v182;

  v184 = -[_MRCreateHostedEndpointRequestProtobuf copyWithZone:](self->_createHostedEndpointRequest, "copyWithZone:", a3);
  v185 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v184;

  v186 = -[_MRCreateHostedEndpointResponseProtobuf copyWithZone:](self->_createHostedEndpointResponse, "copyWithZone:", a3);
  v187 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v186;

  v188 = -[_MRAdjustVolumeMessageProtobuf copyWithZone:](self->_adjustVolumeMessage, "copyWithZone:", a3);
  v189 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v188;

  v190 = -[_MRGetVolumeMutedMessageProtobuf copyWithZone:](self->_getVolumeMutedMessage, "copyWithZone:", a3);
  v191 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = v190;

  v192 = -[_MRGetVolumeMutedResultMessageProtobuf copyWithZone:](self->_getVolumeMutedResultMessage, "copyWithZone:", a3);
  v193 = *(void **)(v6 + 256);
  *(_QWORD *)(v6 + 256) = v192;

  v194 = -[_MRSetVolumeMutedMessageProtobuf copyWithZone:](self->_setVolumeMutedMessage, "copyWithZone:", a3);
  v195 = *(void **)(v6 + 680);
  *(_QWORD *)(v6 + 680) = v194;

  v196 = -[_MRVolumeMutedDidChangeMessageProtobuf copyWithZone:](self->_volumeMutedDidChangeMessage, "copyWithZone:", a3);
  v197 = *(void **)(v6 + 800);
  *(_QWORD *)(v6 + 800) = v196;

  v198 = -[_MRSetConversationDetectionEnabledMessageProtobuf copyWithZone:](self->_setConversationDetectionEnabledMessage, "copyWithZone:", a3);
  v199 = *(void **)(v6 + 608);
  *(_QWORD *)(v6 + 608) = v198;

  v200 = -[_MRPlayerClientParticipantsUpdateMessageProtobuf copyWithZone:](self->_playerClientParticipantsUpdateMessage, "copyWithZone:", a3);
  v201 = *(void **)(v6 + 368);
  *(_QWORD *)(v6 + 368) = v200;

  v202 = -[_MRRequestGroupSessionMessageProtobuf copyWithZone:](self->_requestGroupSessionMessage, "copyWithZone:", a3);
  v203 = *(void **)(v6 + 520);
  *(_QWORD *)(v6 + 520) = v202;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *replyIdentifier;
  NSString *authenticationToken;
  _MRSendCommandMessageProtobuf *sendCommandMessage;
  _MRSendCommandResultMessageProtobuf *sendCommandResultMessage;
  _MRGetStateMessageProtobuf *getStateMessage;
  _MRSetStateMessageProtobuf *setStateMessage;
  _MRSetArtworkMessageProtobuf *setArtworkMessage;
  _MRRegisterHIDDeviceMessageProtobuf *registerHIDDeviceMessage;
  _MRRegisterHIDDeviceResultMessageProtobuf *registerHIDDeviceResultMessage;
  _MRSendHIDEventMessageProtobuf *sendHIDEventMessage;
  _MRSendHIDReportMessageProtobuf *sendHIDReportMessage;
  _MRSendVirtualTouchEventMessageProtobuf *sendVirtualTouchEventMessage;
  _MRNotificationMessageProtobuf *notificationMessage;
  _MRPlaybackQueueProtobuf *contentItemsChangedNotificationMessage;
  _MRDeviceInfoMessageProtobuf *deviceInfoMessage;
  _MRClientUpdatesConfigurationProtobuf *clientUpdatesConfigMessage;
  _MRVolumeControlAvailabilityProtobuf *masterVolumeControlCapabilitiesDidChangeMessage;
  _MRGameControllerMessageProtobuf *gameController;
  _MRRegisterGameControllerMessageProtobuf *registerGameController;
  _MRRegisterGameControllerResponseMessageProtobuf *registerGameControllerResponse;
  _MRUnregisterGameControllerMessageProtobuf *unregisterGameController;
  _MRRegisterForGameControllerEventsMessageProtobuf *registerForGameControllerEvents;
  _MRKeyboardMessageProtobuf *keyboardMessage;
  _MRGetKeyboardSessionProtobuf *getKeyboardMessage;
  _MRTextInputMessageProtobuf *textInputMessage;
  _MRGetVoiceInputDevicesMessageProtobuf *getVoiceInputDevicesMessage;
  _MRGetVoiceInputDevicesResponseMessageProtobuf *getVoiceInputDevicesResponseMessage;
  _MRRegisterVoiceInputDeviceMessageProtobuf *registerVoiceInputDeviceMessage;
  _MRRegisterVoiceInputDeviceResponseMessageProtobuf *registerVoiceInputDeviceResponseMessage;
  _MRSetRecordingStateMessageProtobuf *setRecordingStateMessage;
  _MRSendVoiceInputMessageProtobuf *sendVoiceInputMessage;
  _MRPlaybackQueueRequestProtobuf *playbackQueueRequest;
  _MRTransactionMessageProtobuf *transactionPackets;
  _MRCryptoPairingMessageProtobuf *cryptoPairingMessage;
  _MRGameControllerPropertiesMessageProtobuf *gameControllerProperties;
  _MRSetReadyStateMessageProtobuf *readyStateMessage;
  _MRSetConnectionStateMessageProtobuf *connectionState;
  _MRSendButtonEventMessageProtobuf *sendButtonEventMessage;
  _MRSetHiliteModeMessageProtobuf *setHiliteModeMessage;
  _MRWakeDeviceMessageProtobuf *wakeDeviceMessage;
  _MRGenericMessageProtobuf *genericMessage;
  _MRSendPackedVirtualTouchEventMessageProtobuf *sendPackedVirtualTouchEventMessage;
  _MRSendLyricsEventMessageProtobuf *sendLyricsEventMessage;
  _MRSetNowPlayingClientMessageProtobuf *setNowPlayingClientMessage;
  _MRSetNowPlayingPlayerMessageProtobuf *setNowPlayingPlayerMessage;
  _MRAVModifyOutputContextRequestProtobuf *modifyOutputContextRequestMessage;
  _MRGetVolumeMessageProtobuf *getVolumeMessage;
  _MRGetVolumeResultMessageProtobuf *getVolumeResultMessage;
  _MRSetVolumeMessageProtobuf *setVolumeMessage;
  _MRVolumeDidChangeMessageProtobuf *volumeDidChangeMessage;
  _MRRemoveClientMessageProtobuf *removeClientMessage;
  _MRRemovePlayerMessageProtobuf *removePlayerMessage;
  _MRUpdateClientMessageProtobuf *updateClientMessage;
  _MRUpdateContentItemMessageProtobuf *updateContentItemMessage;
  _MRUpdateContentItemArtworkMessageProtobuf *updateContentItemArtworkMessage;
  _MRUpdatePlayerMessageProtobuf *updatePlayerMessage;
  _MRPromptForRouteAuthorizationMessageProtobuf *promptForRouteAuthorizationMessage;
  _MRPromptForRouteAuthorizationResponseMessageProtobuf *promptForRouteAuthorizationResponseMessage;
  _MRPresentRouteAuthorizationStatusMessageProtobuf *presentRouteAuthorizationStatusMessage;
  _MRGetVolumeControlCapabilitiesMessageProtobuf *getVolumeControlCapabilitiesMessage;
  _MRGetVolumeControlCapabilitiesResultMessageProtobuf *getVolumeControlCapabilitiesResultMessage;
  _MRVolumeControlCapabilitiesDidChangeMessageProtobuf *volumeControlCapabilitiesDidChangeMessage;
  _MRUpdateOutputDevicesMessageProtobuf *updateOutputDevicesMessage;
  _MRRemoveOutputDevicesMessageProtobuf *removeOutputDevicesMessage;
  _MRRemoteTextInputMessageProtobuf *remoteTextInputMessage;
  _MRGetRemoteTextInputSessionProtobuf *getRemoteTextInputSessionMessage;
  _MRPlaybackSessionRequestMessageProtobuf *playbackSessionRequestMessage;
  _MRPlaybackSessionResponseMessageProtobuf *playbackSessionResponseMessage;
  _MRSetStateMessageProtobuf *setDefaultSupportedCommandsMessage;
  _MRPlaybackSessionMigrateRequestMessageProtobuf *playbackSessionMigrateRequestMessage;
  _MRPlaybackSessionMigrateResponseMessageProtobuf *playbackSessionMigrateResponseMessage;
  NSString *errorDescription;
  _MRPlaybackSessionMigrateBeginMessageProtobuf *playbackSessionMigrateBeginMessage;
  _MRPlaybackSessionMigrateEndMessageProtobuf *playbackSessionMigrateEndMessage;
  _MRUpdateActiveSystemEndpointMessageProtobuf *updateActiveSystemEndpointMessage;
  _MRSetDiscoveryModeProtobufMessage *discoveryModeMessage;
  _MRUpdateEndpointsMessageProtobuf *updateEndpointsMessage;
  _MRRemoveEndpointsMessageProtobuf *removeEndpointsMessage;
  NSString *uniqueIdentifier;
  _MRPlayerClientPropertiesMessageProtobuf *playerClientPropertiesMessage;
  _MROriginClientPropertiesMessageProtobuf *originClientPropertiesMessage;
  _MRAudioFadeMessageProtobuf *audioFadeMessage;
  _MRAudioFadeResponseMessageProtobuf *audioFadeResponseMessage;
  _MRDiscoveryUpdateEndpointsProtobufMessage *discoveryUpdateEndpointsMessage;
  _MRDiscoveryUpdateOutputDevicesProtobufMessage *discoveryUpdateOutputDevicesMessage;
  _MRSetListeningModeMessageProtobuf *setListeningModeMessage;
  _MRErrorProtobuf *error;
  _MRConfigureConnectionMessageProtobuf *configureConnectionMessage;
  _MRCreateHostedEndpointRequestProtobuf *createHostedEndpointRequest;
  _MRCreateHostedEndpointResponseProtobuf *createHostedEndpointResponse;
  _MRAdjustVolumeMessageProtobuf *adjustVolumeMessage;
  _MRGetVolumeMutedMessageProtobuf *getVolumeMutedMessage;
  _MRGetVolumeMutedResultMessageProtobuf *getVolumeMutedResultMessage;
  _MRSetVolumeMutedMessageProtobuf *setVolumeMutedMessage;
  _MRVolumeMutedDidChangeMessageProtobuf *volumeMutedDidChangeMessage;
  _MRSetConversationDetectionEnabledMessageProtobuf *setConversationDetectionEnabledMessage;
  _MRPlayerClientParticipantsUpdateMessageProtobuf *playerClientParticipantsUpdateMessage;
  _MRRequestGroupSessionMessageProtobuf *requestGroupSessionMessage;
  char v103;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_213;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 816) & 4) == 0 || self->_type != *((_DWORD *)v4 + 176))
      goto LABEL_213;
  }
  else if ((*((_BYTE *)v4 + 816) & 4) != 0)
  {
LABEL_213:
    v103 = 0;
    goto LABEL_214;
  }
  replyIdentifier = self->_replyIdentifier;
  if ((unint64_t)replyIdentifier | *((_QWORD *)v4 + 64)
    && !-[NSString isEqual:](replyIdentifier, "isEqual:"))
  {
    goto LABEL_213;
  }
  authenticationToken = self->_authenticationToken;
  if ((unint64_t)authenticationToken | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](authenticationToken, "isEqual:"))
      goto LABEL_213;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 816) & 2) == 0 || self->_errorCode != *((_DWORD *)v4 + 36))
      goto LABEL_213;
  }
  else if ((*((_BYTE *)v4 + 816) & 2) != 0)
  {
    goto LABEL_213;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 816) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_213;
  }
  else if ((*((_BYTE *)v4 + 816) & 1) != 0)
  {
    goto LABEL_213;
  }
  sendCommandMessage = self->_sendCommandMessage;
  if ((unint64_t)sendCommandMessage | *((_QWORD *)v4 + 67)
    && !-[_MRSendCommandMessageProtobuf isEqual:](sendCommandMessage, "isEqual:"))
  {
    goto LABEL_213;
  }
  sendCommandResultMessage = self->_sendCommandResultMessage;
  if ((unint64_t)sendCommandResultMessage | *((_QWORD *)v4 + 68))
  {
    if (!-[_MRSendCommandResultMessageProtobuf isEqual:](sendCommandResultMessage, "isEqual:"))
      goto LABEL_213;
  }
  getStateMessage = self->_getStateMessage;
  if ((unint64_t)getStateMessage | *((_QWORD *)v4 + 25))
  {
    if (!-[_MRGetStateMessageProtobuf isEqual:](getStateMessage, "isEqual:"))
      goto LABEL_213;
  }
  setStateMessage = self->_setStateMessage;
  if ((unint64_t)setStateMessage | *((_QWORD *)v4 + 83))
  {
    if (!-[_MRSetStateMessageProtobuf isEqual:](setStateMessage, "isEqual:"))
      goto LABEL_213;
  }
  setArtworkMessage = self->_setArtworkMessage;
  if ((unint64_t)setArtworkMessage | *((_QWORD *)v4 + 75))
  {
    if (!-[_MRSetArtworkMessageProtobuf isEqual:](setArtworkMessage, "isEqual:"))
      goto LABEL_213;
  }
  registerHIDDeviceMessage = self->_registerHIDDeviceMessage;
  if ((unint64_t)registerHIDDeviceMessage | *((_QWORD *)v4 + 55))
  {
    if (!-[_MRRegisterHIDDeviceMessageProtobuf isEqual:](registerHIDDeviceMessage, "isEqual:"))
      goto LABEL_213;
  }
  registerHIDDeviceResultMessage = self->_registerHIDDeviceResultMessage;
  if ((unint64_t)registerHIDDeviceResultMessage | *((_QWORD *)v4 + 56))
  {
    if (!-[_MRRegisterHIDDeviceResultMessageProtobuf isEqual:](registerHIDDeviceResultMessage, "isEqual:"))
      goto LABEL_213;
  }
  sendHIDEventMessage = self->_sendHIDEventMessage;
  if ((unint64_t)sendHIDEventMessage | *((_QWORD *)v4 + 69))
  {
    if (!-[_MRSendHIDEventMessageProtobuf isEqual:](sendHIDEventMessage, "isEqual:"))
      goto LABEL_213;
  }
  sendHIDReportMessage = self->_sendHIDReportMessage;
  if ((unint64_t)sendHIDReportMessage | *((_QWORD *)v4 + 70))
  {
    if (!-[_MRSendHIDReportMessageProtobuf isEqual:](sendHIDReportMessage, "isEqual:"))
      goto LABEL_213;
  }
  sendVirtualTouchEventMessage = self->_sendVirtualTouchEventMessage;
  if ((unint64_t)sendVirtualTouchEventMessage | *((_QWORD *)v4 + 73))
  {
    if (!-[_MRSendVirtualTouchEventMessageProtobuf isEqual:](sendVirtualTouchEventMessage, "isEqual:"))
      goto LABEL_213;
  }
  notificationMessage = self->_notificationMessage;
  if ((unint64_t)notificationMessage | *((_QWORD *)v4 + 37))
  {
    if (!-[_MRNotificationMessageProtobuf isEqual:](notificationMessage, "isEqual:"))
      goto LABEL_213;
  }
  contentItemsChangedNotificationMessage = self->_contentItemsChangedNotificationMessage;
  if ((unint64_t)contentItemsChangedNotificationMessage | *((_QWORD *)v4 + 9))
  {
    if (!-[_MRPlaybackQueueProtobuf isEqual:](contentItemsChangedNotificationMessage, "isEqual:"))
      goto LABEL_213;
  }
  deviceInfoMessage = self->_deviceInfoMessage;
  if ((unint64_t)deviceInfoMessage | *((_QWORD *)v4 + 13))
  {
    if (!-[_MRDeviceInfoMessageProtobuf isEqual:](deviceInfoMessage, "isEqual:"))
      goto LABEL_213;
  }
  clientUpdatesConfigMessage = self->_clientUpdatesConfigMessage;
  if ((unint64_t)clientUpdatesConfigMessage | *((_QWORD *)v4 + 6))
  {
    if (!-[_MRClientUpdatesConfigurationProtobuf isEqual:](clientUpdatesConfigMessage, "isEqual:"))
      goto LABEL_213;
  }
  masterVolumeControlCapabilitiesDidChangeMessage = self->_masterVolumeControlCapabilitiesDidChangeMessage;
  if ((unint64_t)masterVolumeControlCapabilitiesDidChangeMessage | *((_QWORD *)v4 + 35))
  {
    if (!-[_MRVolumeControlAvailabilityProtobuf isEqual:](masterVolumeControlCapabilitiesDidChangeMessage, "isEqual:"))
      goto LABEL_213;
  }
  gameController = self->_gameController;
  if ((unint64_t)gameController | *((_QWORD *)v4 + 20))
  {
    if (!-[_MRGameControllerMessageProtobuf isEqual:](gameController, "isEqual:"))
      goto LABEL_213;
  }
  registerGameController = self->_registerGameController;
  if ((unint64_t)registerGameController | *((_QWORD *)v4 + 53))
  {
    if (!-[_MRRegisterGameControllerMessageProtobuf isEqual:](registerGameController, "isEqual:"))
      goto LABEL_213;
  }
  registerGameControllerResponse = self->_registerGameControllerResponse;
  if ((unint64_t)registerGameControllerResponse | *((_QWORD *)v4 + 54))
  {
    if (!-[_MRRegisterGameControllerResponseMessageProtobuf isEqual:](registerGameControllerResponse, "isEqual:"))
      goto LABEL_213;
  }
  unregisterGameController = self->_unregisterGameController;
  if ((unint64_t)unregisterGameController | *((_QWORD *)v4 + 90))
  {
    if (!-[_MRUnregisterGameControllerMessageProtobuf isEqual:](unregisterGameController, "isEqual:"))
      goto LABEL_213;
  }
  registerForGameControllerEvents = self->_registerForGameControllerEvents;
  if ((unint64_t)registerForGameControllerEvents | *((_QWORD *)v4 + 52))
  {
    if (!-[_MRRegisterForGameControllerEventsMessageProtobuf isEqual:](registerForGameControllerEvents, "isEqual:"))
      goto LABEL_213;
  }
  keyboardMessage = self->_keyboardMessage;
  if ((unint64_t)keyboardMessage | *((_QWORD *)v4 + 34))
  {
    if (!-[_MRKeyboardMessageProtobuf isEqual:](keyboardMessage, "isEqual:"))
      goto LABEL_213;
  }
  getKeyboardMessage = self->_getKeyboardMessage;
  if ((unint64_t)getKeyboardMessage | *((_QWORD *)v4 + 23))
  {
    if (!-[_MRGetKeyboardSessionProtobuf isEqual:](getKeyboardMessage, "isEqual:"))
      goto LABEL_213;
  }
  textInputMessage = self->_textInputMessage;
  if ((unint64_t)textInputMessage | *((_QWORD *)v4 + 86))
  {
    if (!-[_MRTextInputMessageProtobuf isEqual:](textInputMessage, "isEqual:"))
      goto LABEL_213;
  }
  getVoiceInputDevicesMessage = self->_getVoiceInputDevicesMessage;
  if ((unint64_t)getVoiceInputDevicesMessage | *((_QWORD *)v4 + 26))
  {
    if (!-[_MRGetVoiceInputDevicesMessageProtobuf isEqual:](getVoiceInputDevicesMessage, "isEqual:"))
      goto LABEL_213;
  }
  getVoiceInputDevicesResponseMessage = self->_getVoiceInputDevicesResponseMessage;
  if ((unint64_t)getVoiceInputDevicesResponseMessage | *((_QWORD *)v4 + 27))
  {
    if (!-[_MRGetVoiceInputDevicesResponseMessageProtobuf isEqual:](getVoiceInputDevicesResponseMessage, "isEqual:"))
      goto LABEL_213;
  }
  registerVoiceInputDeviceMessage = self->_registerVoiceInputDeviceMessage;
  if ((unint64_t)registerVoiceInputDeviceMessage | *((_QWORD *)v4 + 57))
  {
    if (!-[_MRRegisterVoiceInputDeviceMessageProtobuf isEqual:](registerVoiceInputDeviceMessage, "isEqual:"))
      goto LABEL_213;
  }
  registerVoiceInputDeviceResponseMessage = self->_registerVoiceInputDeviceResponseMessage;
  if ((unint64_t)registerVoiceInputDeviceResponseMessage | *((_QWORD *)v4 + 58))
  {
    if (!-[_MRRegisterVoiceInputDeviceResponseMessageProtobuf isEqual:](registerVoiceInputDeviceResponseMessage, "isEqual:"))goto LABEL_213;
  }
  setRecordingStateMessage = self->_setRecordingStateMessage;
  if ((unint64_t)setRecordingStateMessage | *((_QWORD *)v4 + 82))
  {
    if (!-[_MRSetRecordingStateMessageProtobuf isEqual:](setRecordingStateMessage, "isEqual:"))
      goto LABEL_213;
  }
  sendVoiceInputMessage = self->_sendVoiceInputMessage;
  if ((unint64_t)sendVoiceInputMessage | *((_QWORD *)v4 + 74))
  {
    if (!-[_MRSendVoiceInputMessageProtobuf isEqual:](sendVoiceInputMessage, "isEqual:"))
      goto LABEL_213;
  }
  playbackQueueRequest = self->_playbackQueueRequest;
  if ((unint64_t)playbackQueueRequest | *((_QWORD *)v4 + 39))
  {
    if (!-[_MRPlaybackQueueRequestProtobuf isEqual:](playbackQueueRequest, "isEqual:"))
      goto LABEL_213;
  }
  transactionPackets = self->_transactionPackets;
  if ((unint64_t)transactionPackets | *((_QWORD *)v4 + 87))
  {
    if (!-[_MRTransactionMessageProtobuf isEqual:](transactionPackets, "isEqual:"))
      goto LABEL_213;
  }
  cryptoPairingMessage = self->_cryptoPairingMessage;
  if ((unint64_t)cryptoPairingMessage | *((_QWORD *)v4 + 12))
  {
    if (!-[_MRCryptoPairingMessageProtobuf isEqual:](cryptoPairingMessage, "isEqual:"))
      goto LABEL_213;
  }
  gameControllerProperties = self->_gameControllerProperties;
  if ((unint64_t)gameControllerProperties | *((_QWORD *)v4 + 21))
  {
    if (!-[_MRGameControllerPropertiesMessageProtobuf isEqual:](gameControllerProperties, "isEqual:"))
      goto LABEL_213;
  }
  readyStateMessage = self->_readyStateMessage;
  if ((unint64_t)readyStateMessage | *((_QWORD *)v4 + 51))
  {
    if (!-[_MRSetReadyStateMessageProtobuf isEqual:](readyStateMessage, "isEqual:"))
      goto LABEL_213;
  }
  connectionState = self->_connectionState;
  if ((unint64_t)connectionState | *((_QWORD *)v4 + 8))
  {
    if (!-[_MRSetConnectionStateMessageProtobuf isEqual:](connectionState, "isEqual:"))
      goto LABEL_213;
  }
  sendButtonEventMessage = self->_sendButtonEventMessage;
  if ((unint64_t)sendButtonEventMessage | *((_QWORD *)v4 + 66))
  {
    if (!-[_MRSendButtonEventMessageProtobuf isEqual:](sendButtonEventMessage, "isEqual:"))
      goto LABEL_213;
  }
  setHiliteModeMessage = self->_setHiliteModeMessage;
  if ((unint64_t)setHiliteModeMessage | *((_QWORD *)v4 + 78))
  {
    if (!-[_MRSetHiliteModeMessageProtobuf isEqual:](setHiliteModeMessage, "isEqual:"))
      goto LABEL_213;
  }
  wakeDeviceMessage = self->_wakeDeviceMessage;
  if ((unint64_t)wakeDeviceMessage | *((_QWORD *)v4 + 101))
  {
    if (!-[_MRWakeDeviceMessageProtobuf isEqual:](wakeDeviceMessage, "isEqual:"))
      goto LABEL_213;
  }
  genericMessage = self->_genericMessage;
  if ((unint64_t)genericMessage | *((_QWORD *)v4 + 22))
  {
    if (!-[_MRGenericMessageProtobuf isEqual:](genericMessage, "isEqual:"))
      goto LABEL_213;
  }
  sendPackedVirtualTouchEventMessage = self->_sendPackedVirtualTouchEventMessage;
  if ((unint64_t)sendPackedVirtualTouchEventMessage | *((_QWORD *)v4 + 72))
  {
    if (!-[_MRSendPackedVirtualTouchEventMessageProtobuf isEqual:](sendPackedVirtualTouchEventMessage, "isEqual:"))
      goto LABEL_213;
  }
  sendLyricsEventMessage = self->_sendLyricsEventMessage;
  if ((unint64_t)sendLyricsEventMessage | *((_QWORD *)v4 + 71))
  {
    if (!-[_MRSendLyricsEventMessageProtobuf isEqual:](sendLyricsEventMessage, "isEqual:"))
      goto LABEL_213;
  }
  setNowPlayingClientMessage = self->_setNowPlayingClientMessage;
  if ((unint64_t)setNowPlayingClientMessage | *((_QWORD *)v4 + 80))
  {
    if (!-[_MRSetNowPlayingClientMessageProtobuf isEqual:](setNowPlayingClientMessage, "isEqual:"))
      goto LABEL_213;
  }
  setNowPlayingPlayerMessage = self->_setNowPlayingPlayerMessage;
  if ((unint64_t)setNowPlayingPlayerMessage | *((_QWORD *)v4 + 81))
  {
    if (!-[_MRSetNowPlayingPlayerMessageProtobuf isEqual:](setNowPlayingPlayerMessage, "isEqual:"))
      goto LABEL_213;
  }
  modifyOutputContextRequestMessage = self->_modifyOutputContextRequestMessage;
  if ((unint64_t)modifyOutputContextRequestMessage | *((_QWORD *)v4 + 36))
  {
    if (!-[_MRAVModifyOutputContextRequestProtobuf isEqual:](modifyOutputContextRequestMessage, "isEqual:"))
      goto LABEL_213;
  }
  getVolumeMessage = self->_getVolumeMessage;
  if ((unint64_t)getVolumeMessage | *((_QWORD *)v4 + 30))
  {
    if (!-[_MRGetVolumeMessageProtobuf isEqual:](getVolumeMessage, "isEqual:"))
      goto LABEL_213;
  }
  getVolumeResultMessage = self->_getVolumeResultMessage;
  if ((unint64_t)getVolumeResultMessage | *((_QWORD *)v4 + 33))
  {
    if (!-[_MRGetVolumeResultMessageProtobuf isEqual:](getVolumeResultMessage, "isEqual:"))
      goto LABEL_213;
  }
  setVolumeMessage = self->_setVolumeMessage;
  if ((unint64_t)setVolumeMessage | *((_QWORD *)v4 + 84))
  {
    if (!-[_MRSetVolumeMessageProtobuf isEqual:](setVolumeMessage, "isEqual:"))
      goto LABEL_213;
  }
  volumeDidChangeMessage = self->_volumeDidChangeMessage;
  if ((unint64_t)volumeDidChangeMessage | *((_QWORD *)v4 + 99))
  {
    if (!-[_MRVolumeDidChangeMessageProtobuf isEqual:](volumeDidChangeMessage, "isEqual:"))
      goto LABEL_213;
  }
  removeClientMessage = self->_removeClientMessage;
  if ((unint64_t)removeClientMessage | *((_QWORD *)v4 + 60))
  {
    if (!-[_MRRemoveClientMessageProtobuf isEqual:](removeClientMessage, "isEqual:"))
      goto LABEL_213;
  }
  removePlayerMessage = self->_removePlayerMessage;
  if ((unint64_t)removePlayerMessage | *((_QWORD *)v4 + 63))
  {
    if (!-[_MRRemovePlayerMessageProtobuf isEqual:](removePlayerMessage, "isEqual:"))
      goto LABEL_213;
  }
  updateClientMessage = self->_updateClientMessage;
  if ((unint64_t)updateClientMessage | *((_QWORD *)v4 + 92))
  {
    if (!-[_MRUpdateClientMessageProtobuf isEqual:](updateClientMessage, "isEqual:"))
      goto LABEL_213;
  }
  updateContentItemMessage = self->_updateContentItemMessage;
  if ((unint64_t)updateContentItemMessage | *((_QWORD *)v4 + 94))
  {
    if (!-[_MRUpdateContentItemMessageProtobuf isEqual:](updateContentItemMessage, "isEqual:"))
      goto LABEL_213;
  }
  updateContentItemArtworkMessage = self->_updateContentItemArtworkMessage;
  if ((unint64_t)updateContentItemArtworkMessage | *((_QWORD *)v4 + 93))
  {
    if (!-[_MRUpdateContentItemArtworkMessageProtobuf isEqual:](updateContentItemArtworkMessage, "isEqual:"))
      goto LABEL_213;
  }
  updatePlayerMessage = self->_updatePlayerMessage;
  if ((unint64_t)updatePlayerMessage | *((_QWORD *)v4 + 97))
  {
    if (!-[_MRUpdatePlayerMessageProtobuf isEqual:](updatePlayerMessage, "isEqual:"))
      goto LABEL_213;
  }
  promptForRouteAuthorizationMessage = self->_promptForRouteAuthorizationMessage;
  if ((unint64_t)promptForRouteAuthorizationMessage | *((_QWORD *)v4 + 49))
  {
    if (!-[_MRPromptForRouteAuthorizationMessageProtobuf isEqual:](promptForRouteAuthorizationMessage, "isEqual:"))
      goto LABEL_213;
  }
  promptForRouteAuthorizationResponseMessage = self->_promptForRouteAuthorizationResponseMessage;
  if ((unint64_t)promptForRouteAuthorizationResponseMessage | *((_QWORD *)v4 + 50))
  {
    if (!-[_MRPromptForRouteAuthorizationResponseMessageProtobuf isEqual:](promptForRouteAuthorizationResponseMessage, "isEqual:"))goto LABEL_213;
  }
  presentRouteAuthorizationStatusMessage = self->_presentRouteAuthorizationStatusMessage;
  if ((unint64_t)presentRouteAuthorizationStatusMessage | *((_QWORD *)v4 + 48))
  {
    if (!-[_MRPresentRouteAuthorizationStatusMessageProtobuf isEqual:](presentRouteAuthorizationStatusMessage, "isEqual:"))goto LABEL_213;
  }
  getVolumeControlCapabilitiesMessage = self->_getVolumeControlCapabilitiesMessage;
  if ((unint64_t)getVolumeControlCapabilitiesMessage | *((_QWORD *)v4 + 28))
  {
    if (!-[_MRGetVolumeControlCapabilitiesMessageProtobuf isEqual:](getVolumeControlCapabilitiesMessage, "isEqual:"))
      goto LABEL_213;
  }
  getVolumeControlCapabilitiesResultMessage = self->_getVolumeControlCapabilitiesResultMessage;
  if ((unint64_t)getVolumeControlCapabilitiesResultMessage | *((_QWORD *)v4 + 29))
  {
    if (!-[_MRGetVolumeControlCapabilitiesResultMessageProtobuf isEqual:](getVolumeControlCapabilitiesResultMessage, "isEqual:"))goto LABEL_213;
  }
  volumeControlCapabilitiesDidChangeMessage = self->_volumeControlCapabilitiesDidChangeMessage;
  if ((unint64_t)volumeControlCapabilitiesDidChangeMessage | *((_QWORD *)v4 + 98))
  {
    if (!-[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf isEqual:](volumeControlCapabilitiesDidChangeMessage, "isEqual:"))goto LABEL_213;
  }
  updateOutputDevicesMessage = self->_updateOutputDevicesMessage;
  if ((unint64_t)updateOutputDevicesMessage | *((_QWORD *)v4 + 96))
  {
    if (!-[_MRUpdateOutputDevicesMessageProtobuf isEqual:](updateOutputDevicesMessage, "isEqual:"))
      goto LABEL_213;
  }
  removeOutputDevicesMessage = self->_removeOutputDevicesMessage;
  if ((unint64_t)removeOutputDevicesMessage | *((_QWORD *)v4 + 62))
  {
    if (!-[_MRRemoveOutputDevicesMessageProtobuf isEqual:](removeOutputDevicesMessage, "isEqual:"))
      goto LABEL_213;
  }
  remoteTextInputMessage = self->_remoteTextInputMessage;
  if ((unint64_t)remoteTextInputMessage | *((_QWORD *)v4 + 59))
  {
    if (!-[_MRRemoteTextInputMessageProtobuf isEqual:](remoteTextInputMessage, "isEqual:"))
      goto LABEL_213;
  }
  getRemoteTextInputSessionMessage = self->_getRemoteTextInputSessionMessage;
  if ((unint64_t)getRemoteTextInputSessionMessage | *((_QWORD *)v4 + 24))
  {
    if (!-[_MRGetRemoteTextInputSessionProtobuf isEqual:](getRemoteTextInputSessionMessage, "isEqual:"))
      goto LABEL_213;
  }
  playbackSessionRequestMessage = self->_playbackSessionRequestMessage;
  if ((unint64_t)playbackSessionRequestMessage | *((_QWORD *)v4 + 44))
  {
    if (!-[_MRPlaybackSessionRequestMessageProtobuf isEqual:](playbackSessionRequestMessage, "isEqual:"))
      goto LABEL_213;
  }
  playbackSessionResponseMessage = self->_playbackSessionResponseMessage;
  if ((unint64_t)playbackSessionResponseMessage | *((_QWORD *)v4 + 45))
  {
    if (!-[_MRPlaybackSessionResponseMessageProtobuf isEqual:](playbackSessionResponseMessage, "isEqual:"))
      goto LABEL_213;
  }
  setDefaultSupportedCommandsMessage = self->_setDefaultSupportedCommandsMessage;
  if ((unint64_t)setDefaultSupportedCommandsMessage | *((_QWORD *)v4 + 77))
  {
    if (!-[_MRSetStateMessageProtobuf isEqual:](setDefaultSupportedCommandsMessage, "isEqual:"))
      goto LABEL_213;
  }
  playbackSessionMigrateRequestMessage = self->_playbackSessionMigrateRequestMessage;
  if ((unint64_t)playbackSessionMigrateRequestMessage | *((_QWORD *)v4 + 42))
  {
    if (!-[_MRPlaybackSessionMigrateRequestMessageProtobuf isEqual:](playbackSessionMigrateRequestMessage, "isEqual:"))
      goto LABEL_213;
  }
  playbackSessionMigrateResponseMessage = self->_playbackSessionMigrateResponseMessage;
  if ((unint64_t)playbackSessionMigrateResponseMessage | *((_QWORD *)v4 + 43))
  {
    if (!-[_MRPlaybackSessionMigrateResponseMessageProtobuf isEqual:](playbackSessionMigrateResponseMessage, "isEqual:"))goto LABEL_213;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](errorDescription, "isEqual:"))
      goto LABEL_213;
  }
  playbackSessionMigrateBeginMessage = self->_playbackSessionMigrateBeginMessage;
  if ((unint64_t)playbackSessionMigrateBeginMessage | *((_QWORD *)v4 + 40))
  {
    if (!-[_MRPlaybackSessionMigrateBeginMessageProtobuf isEqual:](playbackSessionMigrateBeginMessage, "isEqual:"))
      goto LABEL_213;
  }
  playbackSessionMigrateEndMessage = self->_playbackSessionMigrateEndMessage;
  if ((unint64_t)playbackSessionMigrateEndMessage | *((_QWORD *)v4 + 41))
  {
    if (!-[_MRPlaybackSessionMigrateEndMessageProtobuf isEqual:](playbackSessionMigrateEndMessage, "isEqual:"))
      goto LABEL_213;
  }
  updateActiveSystemEndpointMessage = self->_updateActiveSystemEndpointMessage;
  if ((unint64_t)updateActiveSystemEndpointMessage | *((_QWORD *)v4 + 91))
  {
    if (!-[_MRUpdateActiveSystemEndpointMessageProtobuf isEqual:](updateActiveSystemEndpointMessage, "isEqual:"))
      goto LABEL_213;
  }
  discoveryModeMessage = self->_discoveryModeMessage;
  if ((unint64_t)discoveryModeMessage | *((_QWORD *)v4 + 14))
  {
    if (!-[_MRSetDiscoveryModeProtobufMessage isEqual:](discoveryModeMessage, "isEqual:"))
      goto LABEL_213;
  }
  updateEndpointsMessage = self->_updateEndpointsMessage;
  if ((unint64_t)updateEndpointsMessage | *((_QWORD *)v4 + 95))
  {
    if (!-[_MRUpdateEndpointsMessageProtobuf isEqual:](updateEndpointsMessage, "isEqual:"))
      goto LABEL_213;
  }
  removeEndpointsMessage = self->_removeEndpointsMessage;
  if ((unint64_t)removeEndpointsMessage | *((_QWORD *)v4 + 61))
  {
    if (!-[_MRRemoveEndpointsMessageProtobuf isEqual:](removeEndpointsMessage, "isEqual:"))
      goto LABEL_213;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((_QWORD *)v4 + 89))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:"))
      goto LABEL_213;
  }
  playerClientPropertiesMessage = self->_playerClientPropertiesMessage;
  if ((unint64_t)playerClientPropertiesMessage | *((_QWORD *)v4 + 47))
  {
    if (!-[_MRPlayerClientPropertiesMessageProtobuf isEqual:](playerClientPropertiesMessage, "isEqual:"))
      goto LABEL_213;
  }
  originClientPropertiesMessage = self->_originClientPropertiesMessage;
  if ((unint64_t)originClientPropertiesMessage | *((_QWORD *)v4 + 38))
  {
    if (!-[_MROriginClientPropertiesMessageProtobuf isEqual:](originClientPropertiesMessage, "isEqual:"))
      goto LABEL_213;
  }
  audioFadeMessage = self->_audioFadeMessage;
  if ((unint64_t)audioFadeMessage | *((_QWORD *)v4 + 3))
  {
    if (!-[_MRAudioFadeMessageProtobuf isEqual:](audioFadeMessage, "isEqual:"))
      goto LABEL_213;
  }
  audioFadeResponseMessage = self->_audioFadeResponseMessage;
  if ((unint64_t)audioFadeResponseMessage | *((_QWORD *)v4 + 4))
  {
    if (!-[_MRAudioFadeResponseMessageProtobuf isEqual:](audioFadeResponseMessage, "isEqual:"))
      goto LABEL_213;
  }
  discoveryUpdateEndpointsMessage = self->_discoveryUpdateEndpointsMessage;
  if ((unint64_t)discoveryUpdateEndpointsMessage | *((_QWORD *)v4 + 15))
  {
    if (!-[_MRDiscoveryUpdateEndpointsProtobufMessage isEqual:](discoveryUpdateEndpointsMessage, "isEqual:"))
      goto LABEL_213;
  }
  discoveryUpdateOutputDevicesMessage = self->_discoveryUpdateOutputDevicesMessage;
  if ((unint64_t)discoveryUpdateOutputDevicesMessage | *((_QWORD *)v4 + 16))
  {
    if (!-[_MRDiscoveryUpdateOutputDevicesProtobufMessage isEqual:](discoveryUpdateOutputDevicesMessage, "isEqual:"))
      goto LABEL_213;
  }
  setListeningModeMessage = self->_setListeningModeMessage;
  if ((unint64_t)setListeningModeMessage | *((_QWORD *)v4 + 79))
  {
    if (!-[_MRSetListeningModeMessageProtobuf isEqual:](setListeningModeMessage, "isEqual:"))
      goto LABEL_213;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 17))
  {
    if (!-[_MRErrorProtobuf isEqual:](error, "isEqual:"))
      goto LABEL_213;
  }
  configureConnectionMessage = self->_configureConnectionMessage;
  if ((unint64_t)configureConnectionMessage | *((_QWORD *)v4 + 7))
  {
    if (!-[_MRConfigureConnectionMessageProtobuf isEqual:](configureConnectionMessage, "isEqual:"))
      goto LABEL_213;
  }
  createHostedEndpointRequest = self->_createHostedEndpointRequest;
  if ((unint64_t)createHostedEndpointRequest | *((_QWORD *)v4 + 10))
  {
    if (!-[_MRCreateHostedEndpointRequestProtobuf isEqual:](createHostedEndpointRequest, "isEqual:"))
      goto LABEL_213;
  }
  createHostedEndpointResponse = self->_createHostedEndpointResponse;
  if ((unint64_t)createHostedEndpointResponse | *((_QWORD *)v4 + 11))
  {
    if (!-[_MRCreateHostedEndpointResponseProtobuf isEqual:](createHostedEndpointResponse, "isEqual:"))
      goto LABEL_213;
  }
  adjustVolumeMessage = self->_adjustVolumeMessage;
  if ((unint64_t)adjustVolumeMessage | *((_QWORD *)v4 + 2))
  {
    if (!-[_MRAdjustVolumeMessageProtobuf isEqual:](adjustVolumeMessage, "isEqual:"))
      goto LABEL_213;
  }
  getVolumeMutedMessage = self->_getVolumeMutedMessage;
  if ((unint64_t)getVolumeMutedMessage | *((_QWORD *)v4 + 31))
  {
    if (!-[_MRGetVolumeMutedMessageProtobuf isEqual:](getVolumeMutedMessage, "isEqual:"))
      goto LABEL_213;
  }
  getVolumeMutedResultMessage = self->_getVolumeMutedResultMessage;
  if ((unint64_t)getVolumeMutedResultMessage | *((_QWORD *)v4 + 32))
  {
    if (!-[_MRGetVolumeMutedResultMessageProtobuf isEqual:](getVolumeMutedResultMessage, "isEqual:"))
      goto LABEL_213;
  }
  setVolumeMutedMessage = self->_setVolumeMutedMessage;
  if ((unint64_t)setVolumeMutedMessage | *((_QWORD *)v4 + 85))
  {
    if (!-[_MRSetVolumeMutedMessageProtobuf isEqual:](setVolumeMutedMessage, "isEqual:"))
      goto LABEL_213;
  }
  volumeMutedDidChangeMessage = self->_volumeMutedDidChangeMessage;
  if ((unint64_t)volumeMutedDidChangeMessage | *((_QWORD *)v4 + 100))
  {
    if (!-[_MRVolumeMutedDidChangeMessageProtobuf isEqual:](volumeMutedDidChangeMessage, "isEqual:"))
      goto LABEL_213;
  }
  setConversationDetectionEnabledMessage = self->_setConversationDetectionEnabledMessage;
  if ((unint64_t)setConversationDetectionEnabledMessage | *((_QWORD *)v4 + 76))
  {
    if (!-[_MRSetConversationDetectionEnabledMessageProtobuf isEqual:](setConversationDetectionEnabledMessage, "isEqual:"))goto LABEL_213;
  }
  playerClientParticipantsUpdateMessage = self->_playerClientParticipantsUpdateMessage;
  if ((unint64_t)playerClientParticipantsUpdateMessage | *((_QWORD *)v4 + 46))
  {
    if (!-[_MRPlayerClientParticipantsUpdateMessageProtobuf isEqual:](playerClientParticipantsUpdateMessage, "isEqual:"))goto LABEL_213;
  }
  requestGroupSessionMessage = self->_requestGroupSessionMessage;
  if ((unint64_t)requestGroupSessionMessage | *((_QWORD *)v4 + 65))
    v103 = -[_MRRequestGroupSessionMessageProtobuf isEqual:](requestGroupSessionMessage, "isEqual:");
  else
    v103 = 1;
LABEL_214:

  return v103;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  NSUInteger v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  NSUInteger v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_replyIdentifier, "hash");
  v5 = -[NSString hash](self->_authenticationToken, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_errorCode;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v7 = 2654435761u * self->_timestamp;
LABEL_9:
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[_MRSendCommandMessageProtobuf hash](self->_sendCommandMessage, "hash");
  v10 = v8 ^ v9 ^ -[_MRSendCommandResultMessageProtobuf hash](self->_sendCommandResultMessage, "hash");
  v11 = -[_MRGetStateMessageProtobuf hash](self->_getStateMessage, "hash");
  v12 = v11 ^ -[_MRSetStateMessageProtobuf hash](self->_setStateMessage, "hash");
  v13 = v12 ^ -[_MRSetArtworkMessageProtobuf hash](self->_setArtworkMessage, "hash");
  v14 = v10 ^ v13 ^ -[_MRRegisterHIDDeviceMessageProtobuf hash](self->_registerHIDDeviceMessage, "hash");
  v15 = -[_MRRegisterHIDDeviceResultMessageProtobuf hash](self->_registerHIDDeviceResultMessage, "hash");
  v16 = v15 ^ -[_MRSendHIDEventMessageProtobuf hash](self->_sendHIDEventMessage, "hash");
  v17 = v16 ^ -[_MRSendHIDReportMessageProtobuf hash](self->_sendHIDReportMessage, "hash");
  v18 = v17 ^ -[_MRSendVirtualTouchEventMessageProtobuf hash](self->_sendVirtualTouchEventMessage, "hash");
  v19 = v14 ^ v18 ^ -[_MRNotificationMessageProtobuf hash](self->_notificationMessage, "hash");
  v20 = -[_MRPlaybackQueueProtobuf hash](self->_contentItemsChangedNotificationMessage, "hash");
  v21 = v20 ^ -[_MRDeviceInfoMessageProtobuf hash](self->_deviceInfoMessage, "hash");
  v22 = v21 ^ -[_MRClientUpdatesConfigurationProtobuf hash](self->_clientUpdatesConfigMessage, "hash");
  v23 = v22 ^ -[_MRVolumeControlAvailabilityProtobuf hash](self->_masterVolumeControlCapabilitiesDidChangeMessage, "hash");
  v24 = v23 ^ -[_MRGameControllerMessageProtobuf hash](self->_gameController, "hash");
  v25 = v19 ^ v24 ^ -[_MRRegisterGameControllerMessageProtobuf hash](self->_registerGameController, "hash");
  v26 = -[_MRRegisterGameControllerResponseMessageProtobuf hash](self->_registerGameControllerResponse, "hash");
  v27 = v26 ^ -[_MRUnregisterGameControllerMessageProtobuf hash](self->_unregisterGameController, "hash");
  v28 = v27 ^ -[_MRRegisterForGameControllerEventsMessageProtobuf hash](self->_registerForGameControllerEvents, "hash");
  v29 = v28 ^ -[_MRKeyboardMessageProtobuf hash](self->_keyboardMessage, "hash");
  v30 = v29 ^ -[_MRGetKeyboardSessionProtobuf hash](self->_getKeyboardMessage, "hash");
  v31 = v30 ^ -[_MRTextInputMessageProtobuf hash](self->_textInputMessage, "hash");
  v32 = v25 ^ v31 ^ -[_MRGetVoiceInputDevicesMessageProtobuf hash](self->_getVoiceInputDevicesMessage, "hash");
  v33 = -[_MRGetVoiceInputDevicesResponseMessageProtobuf hash](self->_getVoiceInputDevicesResponseMessage, "hash");
  v34 = v33 ^ -[_MRRegisterVoiceInputDeviceMessageProtobuf hash](self->_registerVoiceInputDeviceMessage, "hash");
  v35 = v34 ^ -[_MRRegisterVoiceInputDeviceResponseMessageProtobuf hash](self->_registerVoiceInputDeviceResponseMessage, "hash");
  v36 = v35 ^ -[_MRSetRecordingStateMessageProtobuf hash](self->_setRecordingStateMessage, "hash");
  v37 = v36 ^ -[_MRSendVoiceInputMessageProtobuf hash](self->_sendVoiceInputMessage, "hash");
  v38 = v37 ^ -[_MRPlaybackQueueRequestProtobuf hash](self->_playbackQueueRequest, "hash");
  v39 = v38 ^ -[_MRTransactionMessageProtobuf hash](self->_transactionPackets, "hash");
  v40 = v32 ^ v39 ^ -[_MRCryptoPairingMessageProtobuf hash](self->_cryptoPairingMessage, "hash");
  v41 = -[_MRGameControllerPropertiesMessageProtobuf hash](self->_gameControllerProperties, "hash");
  v42 = v41 ^ -[_MRSetReadyStateMessageProtobuf hash](self->_readyStateMessage, "hash");
  v43 = v42 ^ -[_MRSetConnectionStateMessageProtobuf hash](self->_connectionState, "hash");
  v44 = v43 ^ -[_MRSendButtonEventMessageProtobuf hash](self->_sendButtonEventMessage, "hash");
  v45 = v44 ^ -[_MRSetHiliteModeMessageProtobuf hash](self->_setHiliteModeMessage, "hash");
  v46 = v45 ^ -[_MRWakeDeviceMessageProtobuf hash](self->_wakeDeviceMessage, "hash");
  v47 = v46 ^ -[_MRGenericMessageProtobuf hash](self->_genericMessage, "hash");
  v48 = v47 ^ -[_MRSendPackedVirtualTouchEventMessageProtobuf hash](self->_sendPackedVirtualTouchEventMessage, "hash");
  v49 = v40 ^ v48 ^ -[_MRSendLyricsEventMessageProtobuf hash](self->_sendLyricsEventMessage, "hash");
  v50 = -[_MRSetNowPlayingClientMessageProtobuf hash](self->_setNowPlayingClientMessage, "hash");
  v51 = v50 ^ -[_MRSetNowPlayingPlayerMessageProtobuf hash](self->_setNowPlayingPlayerMessage, "hash");
  v52 = v51 ^ -[_MRAVModifyOutputContextRequestProtobuf hash](self->_modifyOutputContextRequestMessage, "hash");
  v53 = v52 ^ -[_MRGetVolumeMessageProtobuf hash](self->_getVolumeMessage, "hash");
  v54 = v53 ^ -[_MRGetVolumeResultMessageProtobuf hash](self->_getVolumeResultMessage, "hash");
  v55 = v54 ^ -[_MRSetVolumeMessageProtobuf hash](self->_setVolumeMessage, "hash");
  v56 = v55 ^ -[_MRVolumeDidChangeMessageProtobuf hash](self->_volumeDidChangeMessage, "hash");
  v57 = v56 ^ -[_MRRemoveClientMessageProtobuf hash](self->_removeClientMessage, "hash");
  v58 = v57 ^ -[_MRRemovePlayerMessageProtobuf hash](self->_removePlayerMessage, "hash");
  v59 = v49 ^ v58 ^ -[_MRUpdateClientMessageProtobuf hash](self->_updateClientMessage, "hash");
  v60 = -[_MRUpdateContentItemMessageProtobuf hash](self->_updateContentItemMessage, "hash");
  v61 = v60 ^ -[_MRUpdateContentItemArtworkMessageProtobuf hash](self->_updateContentItemArtworkMessage, "hash");
  v62 = v61 ^ -[_MRUpdatePlayerMessageProtobuf hash](self->_updatePlayerMessage, "hash");
  v63 = v62 ^ -[_MRPromptForRouteAuthorizationMessageProtobuf hash](self->_promptForRouteAuthorizationMessage, "hash");
  v64 = v63 ^ -[_MRPromptForRouteAuthorizationResponseMessageProtobuf hash](self->_promptForRouteAuthorizationResponseMessage, "hash");
  v65 = v64 ^ -[_MRPresentRouteAuthorizationStatusMessageProtobuf hash](self->_presentRouteAuthorizationStatusMessage, "hash");
  v66 = v65 ^ -[_MRGetVolumeControlCapabilitiesMessageProtobuf hash](self->_getVolumeControlCapabilitiesMessage, "hash");
  v67 = v66 ^ -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf hash](self->_getVolumeControlCapabilitiesResultMessage, "hash");
  v68 = v67 ^ -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf hash](self->_volumeControlCapabilitiesDidChangeMessage, "hash");
  v69 = v68 ^ -[_MRUpdateOutputDevicesMessageProtobuf hash](self->_updateOutputDevicesMessage, "hash");
  v70 = v59 ^ v69 ^ -[_MRRemoveOutputDevicesMessageProtobuf hash](self->_removeOutputDevicesMessage, "hash");
  v71 = -[_MRRemoteTextInputMessageProtobuf hash](self->_remoteTextInputMessage, "hash");
  v72 = v71 ^ -[_MRGetRemoteTextInputSessionProtobuf hash](self->_getRemoteTextInputSessionMessage, "hash");
  v73 = v72 ^ -[_MRPlaybackSessionRequestMessageProtobuf hash](self->_playbackSessionRequestMessage, "hash");
  v74 = v73 ^ -[_MRPlaybackSessionResponseMessageProtobuf hash](self->_playbackSessionResponseMessage, "hash");
  v75 = v74 ^ -[_MRSetStateMessageProtobuf hash](self->_setDefaultSupportedCommandsMessage, "hash");
  v76 = v75 ^ -[_MRPlaybackSessionMigrateRequestMessageProtobuf hash](self->_playbackSessionMigrateRequestMessage, "hash");
  v77 = v76 ^ -[_MRPlaybackSessionMigrateResponseMessageProtobuf hash](self->_playbackSessionMigrateResponseMessage, "hash");
  v78 = v77 ^ -[NSString hash](self->_errorDescription, "hash");
  v79 = v78 ^ -[_MRPlaybackSessionMigrateBeginMessageProtobuf hash](self->_playbackSessionMigrateBeginMessage, "hash");
  v80 = v79 ^ -[_MRPlaybackSessionMigrateEndMessageProtobuf hash](self->_playbackSessionMigrateEndMessage, "hash");
  v81 = v80 ^ -[_MRUpdateActiveSystemEndpointMessageProtobuf hash](self->_updateActiveSystemEndpointMessage, "hash");
  v82 = v70 ^ v81 ^ -[_MRSetDiscoveryModeProtobufMessage hash](self->_discoveryModeMessage, "hash");
  v83 = -[_MRUpdateEndpointsMessageProtobuf hash](self->_updateEndpointsMessage, "hash");
  v84 = v83 ^ -[_MRRemoveEndpointsMessageProtobuf hash](self->_removeEndpointsMessage, "hash");
  v85 = v84 ^ -[NSString hash](self->_uniqueIdentifier, "hash");
  v86 = v85 ^ -[_MRPlayerClientPropertiesMessageProtobuf hash](self->_playerClientPropertiesMessage, "hash");
  v87 = v86 ^ -[_MROriginClientPropertiesMessageProtobuf hash](self->_originClientPropertiesMessage, "hash");
  v88 = v87 ^ -[_MRAudioFadeMessageProtobuf hash](self->_audioFadeMessage, "hash");
  v89 = v88 ^ -[_MRAudioFadeResponseMessageProtobuf hash](self->_audioFadeResponseMessage, "hash");
  v90 = v89 ^ -[_MRDiscoveryUpdateEndpointsProtobufMessage hash](self->_discoveryUpdateEndpointsMessage, "hash");
  v91 = v90 ^ -[_MRDiscoveryUpdateOutputDevicesProtobufMessage hash](self->_discoveryUpdateOutputDevicesMessage, "hash");
  v92 = v91 ^ -[_MRSetListeningModeMessageProtobuf hash](self->_setListeningModeMessage, "hash");
  v93 = v92 ^ -[_MRErrorProtobuf hash](self->_error, "hash");
  v94 = v93 ^ -[_MRConfigureConnectionMessageProtobuf hash](self->_configureConnectionMessage, "hash");
  v95 = v82 ^ v94 ^ -[_MRCreateHostedEndpointRequestProtobuf hash](self->_createHostedEndpointRequest, "hash");
  v96 = -[_MRCreateHostedEndpointResponseProtobuf hash](self->_createHostedEndpointResponse, "hash");
  v97 = v96 ^ -[_MRAdjustVolumeMessageProtobuf hash](self->_adjustVolumeMessage, "hash");
  v98 = v97 ^ -[_MRGetVolumeMutedMessageProtobuf hash](self->_getVolumeMutedMessage, "hash");
  v99 = v98 ^ -[_MRGetVolumeMutedResultMessageProtobuf hash](self->_getVolumeMutedResultMessage, "hash");
  v100 = v99 ^ -[_MRSetVolumeMutedMessageProtobuf hash](self->_setVolumeMutedMessage, "hash");
  v101 = v100 ^ -[_MRVolumeMutedDidChangeMessageProtobuf hash](self->_volumeMutedDidChangeMessage, "hash");
  v102 = v101 ^ -[_MRSetConversationDetectionEnabledMessageProtobuf hash](self->_setConversationDetectionEnabledMessage, "hash");
  v103 = v102 ^ -[_MRPlayerClientParticipantsUpdateMessageProtobuf hash](self->_playerClientParticipantsUpdateMessage, "hash");
  return v95 ^ v103 ^ -[_MRRequestGroupSessionMessageProtobuf hash](self->_requestGroupSessionMessage, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  _MRSendCommandMessageProtobuf *sendCommandMessage;
  uint64_t v8;
  _MRSendCommandResultMessageProtobuf *sendCommandResultMessage;
  uint64_t v10;
  _MRGetStateMessageProtobuf *getStateMessage;
  uint64_t v12;
  _MRSetStateMessageProtobuf *setStateMessage;
  uint64_t v14;
  _MRSetArtworkMessageProtobuf *setArtworkMessage;
  uint64_t v16;
  _MRRegisterHIDDeviceMessageProtobuf *registerHIDDeviceMessage;
  uint64_t v18;
  _MRRegisterHIDDeviceResultMessageProtobuf *registerHIDDeviceResultMessage;
  uint64_t v20;
  _MRSendHIDEventMessageProtobuf *sendHIDEventMessage;
  uint64_t v22;
  _MRSendHIDReportMessageProtobuf *sendHIDReportMessage;
  uint64_t v24;
  _MRSendVirtualTouchEventMessageProtobuf *sendVirtualTouchEventMessage;
  uint64_t v26;
  _MRNotificationMessageProtobuf *notificationMessage;
  uint64_t v28;
  _MRPlaybackQueueProtobuf *contentItemsChangedNotificationMessage;
  uint64_t v30;
  _MRDeviceInfoMessageProtobuf *deviceInfoMessage;
  uint64_t v32;
  _MRClientUpdatesConfigurationProtobuf *clientUpdatesConfigMessage;
  uint64_t v34;
  _MRVolumeControlAvailabilityProtobuf *masterVolumeControlCapabilitiesDidChangeMessage;
  uint64_t v36;
  _MRGameControllerMessageProtobuf *gameController;
  uint64_t v38;
  _MRRegisterGameControllerMessageProtobuf *registerGameController;
  uint64_t v40;
  _MRRegisterGameControllerResponseMessageProtobuf *registerGameControllerResponse;
  uint64_t v42;
  _MRUnregisterGameControllerMessageProtobuf *unregisterGameController;
  uint64_t v44;
  _MRRegisterForGameControllerEventsMessageProtobuf *registerForGameControllerEvents;
  uint64_t v46;
  _MRKeyboardMessageProtobuf *keyboardMessage;
  uint64_t v48;
  _MRGetKeyboardSessionProtobuf *getKeyboardMessage;
  uint64_t v50;
  _MRTextInputMessageProtobuf *textInputMessage;
  uint64_t v52;
  _MRGetVoiceInputDevicesMessageProtobuf *getVoiceInputDevicesMessage;
  uint64_t v54;
  _MRGetVoiceInputDevicesResponseMessageProtobuf *getVoiceInputDevicesResponseMessage;
  uint64_t v56;
  _MRRegisterVoiceInputDeviceMessageProtobuf *registerVoiceInputDeviceMessage;
  uint64_t v58;
  _MRRegisterVoiceInputDeviceResponseMessageProtobuf *registerVoiceInputDeviceResponseMessage;
  uint64_t v60;
  _MRSetRecordingStateMessageProtobuf *setRecordingStateMessage;
  uint64_t v62;
  _MRSendVoiceInputMessageProtobuf *sendVoiceInputMessage;
  uint64_t v64;
  _MRPlaybackQueueRequestProtobuf *playbackQueueRequest;
  uint64_t v66;
  _MRTransactionMessageProtobuf *transactionPackets;
  uint64_t v68;
  _MRCryptoPairingMessageProtobuf *cryptoPairingMessage;
  uint64_t v70;
  _MRGameControllerPropertiesMessageProtobuf *gameControllerProperties;
  uint64_t v72;
  _MRSetReadyStateMessageProtobuf *readyStateMessage;
  uint64_t v74;
  _MRSetConnectionStateMessageProtobuf *connectionState;
  uint64_t v76;
  _MRSendButtonEventMessageProtobuf *sendButtonEventMessage;
  uint64_t v78;
  _MRSetHiliteModeMessageProtobuf *setHiliteModeMessage;
  uint64_t v80;
  _MRWakeDeviceMessageProtobuf *wakeDeviceMessage;
  uint64_t v82;
  _MRGenericMessageProtobuf *genericMessage;
  uint64_t v84;
  _MRSendPackedVirtualTouchEventMessageProtobuf *sendPackedVirtualTouchEventMessage;
  uint64_t v86;
  _MRSendLyricsEventMessageProtobuf *sendLyricsEventMessage;
  uint64_t v88;
  _MRSetNowPlayingClientMessageProtobuf *setNowPlayingClientMessage;
  uint64_t v90;
  _MRSetNowPlayingPlayerMessageProtobuf *setNowPlayingPlayerMessage;
  uint64_t v92;
  _MRAVModifyOutputContextRequestProtobuf *modifyOutputContextRequestMessage;
  uint64_t v94;
  _MRGetVolumeMessageProtobuf *getVolumeMessage;
  uint64_t v96;
  _MRGetVolumeResultMessageProtobuf *getVolumeResultMessage;
  uint64_t v98;
  _MRSetVolumeMessageProtobuf *setVolumeMessage;
  uint64_t v100;
  _MRVolumeDidChangeMessageProtobuf *volumeDidChangeMessage;
  uint64_t v102;
  _MRRemoveClientMessageProtobuf *removeClientMessage;
  uint64_t v104;
  _MRRemovePlayerMessageProtobuf *removePlayerMessage;
  uint64_t v106;
  _MRUpdateClientMessageProtobuf *updateClientMessage;
  uint64_t v108;
  _MRUpdateContentItemMessageProtobuf *updateContentItemMessage;
  uint64_t v110;
  _MRUpdateContentItemArtworkMessageProtobuf *updateContentItemArtworkMessage;
  uint64_t v112;
  _MRUpdatePlayerMessageProtobuf *updatePlayerMessage;
  uint64_t v114;
  _MRPromptForRouteAuthorizationMessageProtobuf *promptForRouteAuthorizationMessage;
  uint64_t v116;
  _MRPromptForRouteAuthorizationResponseMessageProtobuf *promptForRouteAuthorizationResponseMessage;
  uint64_t v118;
  _MRPresentRouteAuthorizationStatusMessageProtobuf *presentRouteAuthorizationStatusMessage;
  uint64_t v120;
  _MRGetVolumeControlCapabilitiesMessageProtobuf *getVolumeControlCapabilitiesMessage;
  uint64_t v122;
  _MRGetVolumeControlCapabilitiesResultMessageProtobuf *getVolumeControlCapabilitiesResultMessage;
  uint64_t v124;
  _MRVolumeControlCapabilitiesDidChangeMessageProtobuf *volumeControlCapabilitiesDidChangeMessage;
  uint64_t v126;
  _MRUpdateOutputDevicesMessageProtobuf *updateOutputDevicesMessage;
  uint64_t v128;
  _MRRemoveOutputDevicesMessageProtobuf *removeOutputDevicesMessage;
  uint64_t v130;
  _MRRemoteTextInputMessageProtobuf *remoteTextInputMessage;
  uint64_t v132;
  _MRGetRemoteTextInputSessionProtobuf *getRemoteTextInputSessionMessage;
  uint64_t v134;
  _MRPlaybackSessionRequestMessageProtobuf *playbackSessionRequestMessage;
  uint64_t v136;
  _MRPlaybackSessionResponseMessageProtobuf *playbackSessionResponseMessage;
  uint64_t v138;
  _MRSetStateMessageProtobuf *setDefaultSupportedCommandsMessage;
  uint64_t v140;
  _MRPlaybackSessionMigrateRequestMessageProtobuf *playbackSessionMigrateRequestMessage;
  uint64_t v142;
  _MRPlaybackSessionMigrateResponseMessageProtobuf *playbackSessionMigrateResponseMessage;
  uint64_t v144;
  _MRPlaybackSessionMigrateBeginMessageProtobuf *playbackSessionMigrateBeginMessage;
  uint64_t v146;
  _MRPlaybackSessionMigrateEndMessageProtobuf *playbackSessionMigrateEndMessage;
  uint64_t v148;
  _MRUpdateActiveSystemEndpointMessageProtobuf *updateActiveSystemEndpointMessage;
  uint64_t v150;
  _MRSetDiscoveryModeProtobufMessage *discoveryModeMessage;
  uint64_t v152;
  _MRUpdateEndpointsMessageProtobuf *updateEndpointsMessage;
  uint64_t v154;
  _MRRemoveEndpointsMessageProtobuf *removeEndpointsMessage;
  uint64_t v156;
  _MRPlayerClientPropertiesMessageProtobuf *playerClientPropertiesMessage;
  uint64_t v158;
  _MROriginClientPropertiesMessageProtobuf *originClientPropertiesMessage;
  uint64_t v160;
  _MRAudioFadeMessageProtobuf *audioFadeMessage;
  uint64_t v162;
  _MRAudioFadeResponseMessageProtobuf *audioFadeResponseMessage;
  uint64_t v164;
  _MRDiscoveryUpdateEndpointsProtobufMessage *discoveryUpdateEndpointsMessage;
  uint64_t v166;
  _MRDiscoveryUpdateOutputDevicesProtobufMessage *discoveryUpdateOutputDevicesMessage;
  uint64_t v168;
  _MRSetListeningModeMessageProtobuf *setListeningModeMessage;
  uint64_t v170;
  _MRErrorProtobuf *error;
  uint64_t v172;
  _MRConfigureConnectionMessageProtobuf *configureConnectionMessage;
  uint64_t v174;
  _MRCreateHostedEndpointRequestProtobuf *createHostedEndpointRequest;
  uint64_t v176;
  _MRCreateHostedEndpointResponseProtobuf *createHostedEndpointResponse;
  uint64_t v178;
  _MRAdjustVolumeMessageProtobuf *adjustVolumeMessage;
  uint64_t v180;
  _MRGetVolumeMutedMessageProtobuf *getVolumeMutedMessage;
  uint64_t v182;
  _MRGetVolumeMutedResultMessageProtobuf *getVolumeMutedResultMessage;
  uint64_t v184;
  _MRSetVolumeMutedMessageProtobuf *setVolumeMutedMessage;
  uint64_t v186;
  _MRVolumeMutedDidChangeMessageProtobuf *volumeMutedDidChangeMessage;
  uint64_t v188;
  _MRSetConversationDetectionEnabledMessageProtobuf *setConversationDetectionEnabledMessage;
  uint64_t v190;
  _MRPlayerClientParticipantsUpdateMessageProtobuf *playerClientParticipantsUpdateMessage;
  uint64_t v192;
  _MRRequestGroupSessionMessageProtobuf *requestGroupSessionMessage;
  uint64_t v194;
  _DWORD *v195;

  v4 = a3;
  v5 = v4;
  if ((v4[204] & 4) != 0)
  {
    self->_type = v4[176];
    *(_BYTE *)&self->_has |= 4u;
  }
  v195 = v4;
  if (*((_QWORD *)v4 + 64))
  {
    -[_MRMediaRemoteMessageProtobuf setReplyIdentifier:](self, "setReplyIdentifier:");
    v5 = v195;
  }
  if (*((_QWORD *)v5 + 5))
  {
    -[_MRMediaRemoteMessageProtobuf setAuthenticationToken:](self, "setAuthenticationToken:");
    v5 = v195;
  }
  v6 = *((_BYTE *)v5 + 816);
  if ((v6 & 2) != 0)
  {
    self->_errorCode = *((_DWORD *)v5 + 36);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v5 + 816);
  }
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  sendCommandMessage = self->_sendCommandMessage;
  v8 = *((_QWORD *)v5 + 67);
  if (sendCommandMessage)
  {
    if (!v8)
      goto LABEL_17;
    -[_MRSendCommandMessageProtobuf mergeFrom:](sendCommandMessage, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[_MRMediaRemoteMessageProtobuf setSendCommandMessage:](self, "setSendCommandMessage:");
  }
  v5 = v195;
LABEL_17:
  sendCommandResultMessage = self->_sendCommandResultMessage;
  v10 = *((_QWORD *)v5 + 68);
  if (sendCommandResultMessage)
  {
    if (!v10)
      goto LABEL_23;
    -[_MRSendCommandResultMessageProtobuf mergeFrom:](sendCommandResultMessage, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_23;
    -[_MRMediaRemoteMessageProtobuf setSendCommandResultMessage:](self, "setSendCommandResultMessage:");
  }
  v5 = v195;
LABEL_23:
  getStateMessage = self->_getStateMessage;
  v12 = *((_QWORD *)v5 + 25);
  if (getStateMessage)
  {
    if (!v12)
      goto LABEL_29;
    -[_MRGetStateMessageProtobuf mergeFrom:](getStateMessage, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_29;
    -[_MRMediaRemoteMessageProtobuf setGetStateMessage:](self, "setGetStateMessage:");
  }
  v5 = v195;
LABEL_29:
  setStateMessage = self->_setStateMessage;
  v14 = *((_QWORD *)v5 + 83);
  if (setStateMessage)
  {
    if (!v14)
      goto LABEL_35;
    -[_MRSetStateMessageProtobuf mergeFrom:](setStateMessage, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_35;
    -[_MRMediaRemoteMessageProtobuf setSetStateMessage:](self, "setSetStateMessage:");
  }
  v5 = v195;
LABEL_35:
  setArtworkMessage = self->_setArtworkMessage;
  v16 = *((_QWORD *)v5 + 75);
  if (setArtworkMessage)
  {
    if (!v16)
      goto LABEL_41;
    -[_MRSetArtworkMessageProtobuf mergeFrom:](setArtworkMessage, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_41;
    -[_MRMediaRemoteMessageProtobuf setSetArtworkMessage:](self, "setSetArtworkMessage:");
  }
  v5 = v195;
LABEL_41:
  registerHIDDeviceMessage = self->_registerHIDDeviceMessage;
  v18 = *((_QWORD *)v5 + 55);
  if (registerHIDDeviceMessage)
  {
    if (!v18)
      goto LABEL_47;
    -[_MRRegisterHIDDeviceMessageProtobuf mergeFrom:](registerHIDDeviceMessage, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_47;
    -[_MRMediaRemoteMessageProtobuf setRegisterHIDDeviceMessage:](self, "setRegisterHIDDeviceMessage:");
  }
  v5 = v195;
LABEL_47:
  registerHIDDeviceResultMessage = self->_registerHIDDeviceResultMessage;
  v20 = *((_QWORD *)v5 + 56);
  if (registerHIDDeviceResultMessage)
  {
    if (!v20)
      goto LABEL_53;
    -[_MRRegisterHIDDeviceResultMessageProtobuf mergeFrom:](registerHIDDeviceResultMessage, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_53;
    -[_MRMediaRemoteMessageProtobuf setRegisterHIDDeviceResultMessage:](self, "setRegisterHIDDeviceResultMessage:");
  }
  v5 = v195;
LABEL_53:
  sendHIDEventMessage = self->_sendHIDEventMessage;
  v22 = *((_QWORD *)v5 + 69);
  if (sendHIDEventMessage)
  {
    if (!v22)
      goto LABEL_59;
    -[_MRSendHIDEventMessageProtobuf mergeFrom:](sendHIDEventMessage, "mergeFrom:");
  }
  else
  {
    if (!v22)
      goto LABEL_59;
    -[_MRMediaRemoteMessageProtobuf setSendHIDEventMessage:](self, "setSendHIDEventMessage:");
  }
  v5 = v195;
LABEL_59:
  sendHIDReportMessage = self->_sendHIDReportMessage;
  v24 = *((_QWORD *)v5 + 70);
  if (sendHIDReportMessage)
  {
    if (!v24)
      goto LABEL_65;
    -[_MRSendHIDReportMessageProtobuf mergeFrom:](sendHIDReportMessage, "mergeFrom:");
  }
  else
  {
    if (!v24)
      goto LABEL_65;
    -[_MRMediaRemoteMessageProtobuf setSendHIDReportMessage:](self, "setSendHIDReportMessage:");
  }
  v5 = v195;
LABEL_65:
  sendVirtualTouchEventMessage = self->_sendVirtualTouchEventMessage;
  v26 = *((_QWORD *)v5 + 73);
  if (sendVirtualTouchEventMessage)
  {
    if (!v26)
      goto LABEL_71;
    -[_MRSendVirtualTouchEventMessageProtobuf mergeFrom:](sendVirtualTouchEventMessage, "mergeFrom:");
  }
  else
  {
    if (!v26)
      goto LABEL_71;
    -[_MRMediaRemoteMessageProtobuf setSendVirtualTouchEventMessage:](self, "setSendVirtualTouchEventMessage:");
  }
  v5 = v195;
LABEL_71:
  notificationMessage = self->_notificationMessage;
  v28 = *((_QWORD *)v5 + 37);
  if (notificationMessage)
  {
    if (!v28)
      goto LABEL_77;
    -[_MRNotificationMessageProtobuf mergeFrom:](notificationMessage, "mergeFrom:");
  }
  else
  {
    if (!v28)
      goto LABEL_77;
    -[_MRMediaRemoteMessageProtobuf setNotificationMessage:](self, "setNotificationMessage:");
  }
  v5 = v195;
LABEL_77:
  contentItemsChangedNotificationMessage = self->_contentItemsChangedNotificationMessage;
  v30 = *((_QWORD *)v5 + 9);
  if (contentItemsChangedNotificationMessage)
  {
    if (!v30)
      goto LABEL_83;
    -[_MRPlaybackQueueProtobuf mergeFrom:](contentItemsChangedNotificationMessage, "mergeFrom:");
  }
  else
  {
    if (!v30)
      goto LABEL_83;
    -[_MRMediaRemoteMessageProtobuf setContentItemsChangedNotificationMessage:](self, "setContentItemsChangedNotificationMessage:");
  }
  v5 = v195;
LABEL_83:
  deviceInfoMessage = self->_deviceInfoMessage;
  v32 = *((_QWORD *)v5 + 13);
  if (deviceInfoMessage)
  {
    if (!v32)
      goto LABEL_89;
    -[_MRDeviceInfoMessageProtobuf mergeFrom:](deviceInfoMessage, "mergeFrom:");
  }
  else
  {
    if (!v32)
      goto LABEL_89;
    -[_MRMediaRemoteMessageProtobuf setDeviceInfoMessage:](self, "setDeviceInfoMessage:");
  }
  v5 = v195;
LABEL_89:
  clientUpdatesConfigMessage = self->_clientUpdatesConfigMessage;
  v34 = *((_QWORD *)v5 + 6);
  if (clientUpdatesConfigMessage)
  {
    if (!v34)
      goto LABEL_95;
    -[_MRClientUpdatesConfigurationProtobuf mergeFrom:](clientUpdatesConfigMessage, "mergeFrom:");
  }
  else
  {
    if (!v34)
      goto LABEL_95;
    -[_MRMediaRemoteMessageProtobuf setClientUpdatesConfigMessage:](self, "setClientUpdatesConfigMessage:");
  }
  v5 = v195;
LABEL_95:
  masterVolumeControlCapabilitiesDidChangeMessage = self->_masterVolumeControlCapabilitiesDidChangeMessage;
  v36 = *((_QWORD *)v5 + 35);
  if (masterVolumeControlCapabilitiesDidChangeMessage)
  {
    if (!v36)
      goto LABEL_101;
    -[_MRVolumeControlAvailabilityProtobuf mergeFrom:](masterVolumeControlCapabilitiesDidChangeMessage, "mergeFrom:");
  }
  else
  {
    if (!v36)
      goto LABEL_101;
    -[_MRMediaRemoteMessageProtobuf setMasterVolumeControlCapabilitiesDidChangeMessage:](self, "setMasterVolumeControlCapabilitiesDidChangeMessage:");
  }
  v5 = v195;
LABEL_101:
  gameController = self->_gameController;
  v38 = *((_QWORD *)v5 + 20);
  if (gameController)
  {
    if (!v38)
      goto LABEL_107;
    -[_MRGameControllerMessageProtobuf mergeFrom:](gameController, "mergeFrom:");
  }
  else
  {
    if (!v38)
      goto LABEL_107;
    -[_MRMediaRemoteMessageProtobuf setGameController:](self, "setGameController:");
  }
  v5 = v195;
LABEL_107:
  registerGameController = self->_registerGameController;
  v40 = *((_QWORD *)v5 + 53);
  if (registerGameController)
  {
    if (!v40)
      goto LABEL_113;
    -[_MRRegisterGameControllerMessageProtobuf mergeFrom:](registerGameController, "mergeFrom:");
  }
  else
  {
    if (!v40)
      goto LABEL_113;
    -[_MRMediaRemoteMessageProtobuf setRegisterGameController:](self, "setRegisterGameController:");
  }
  v5 = v195;
LABEL_113:
  registerGameControllerResponse = self->_registerGameControllerResponse;
  v42 = *((_QWORD *)v5 + 54);
  if (registerGameControllerResponse)
  {
    if (!v42)
      goto LABEL_119;
    -[_MRRegisterGameControllerResponseMessageProtobuf mergeFrom:](registerGameControllerResponse, "mergeFrom:");
  }
  else
  {
    if (!v42)
      goto LABEL_119;
    -[_MRMediaRemoteMessageProtobuf setRegisterGameControllerResponse:](self, "setRegisterGameControllerResponse:");
  }
  v5 = v195;
LABEL_119:
  unregisterGameController = self->_unregisterGameController;
  v44 = *((_QWORD *)v5 + 90);
  if (unregisterGameController)
  {
    if (!v44)
      goto LABEL_125;
    -[_MRUnregisterGameControllerMessageProtobuf mergeFrom:](unregisterGameController, "mergeFrom:");
  }
  else
  {
    if (!v44)
      goto LABEL_125;
    -[_MRMediaRemoteMessageProtobuf setUnregisterGameController:](self, "setUnregisterGameController:");
  }
  v5 = v195;
LABEL_125:
  registerForGameControllerEvents = self->_registerForGameControllerEvents;
  v46 = *((_QWORD *)v5 + 52);
  if (registerForGameControllerEvents)
  {
    if (!v46)
      goto LABEL_131;
    -[_MRRegisterForGameControllerEventsMessageProtobuf mergeFrom:](registerForGameControllerEvents, "mergeFrom:");
  }
  else
  {
    if (!v46)
      goto LABEL_131;
    -[_MRMediaRemoteMessageProtobuf setRegisterForGameControllerEvents:](self, "setRegisterForGameControllerEvents:");
  }
  v5 = v195;
LABEL_131:
  keyboardMessage = self->_keyboardMessage;
  v48 = *((_QWORD *)v5 + 34);
  if (keyboardMessage)
  {
    if (!v48)
      goto LABEL_137;
    -[_MRKeyboardMessageProtobuf mergeFrom:](keyboardMessage, "mergeFrom:");
  }
  else
  {
    if (!v48)
      goto LABEL_137;
    -[_MRMediaRemoteMessageProtobuf setKeyboardMessage:](self, "setKeyboardMessage:");
  }
  v5 = v195;
LABEL_137:
  getKeyboardMessage = self->_getKeyboardMessage;
  v50 = *((_QWORD *)v5 + 23);
  if (getKeyboardMessage)
  {
    if (!v50)
      goto LABEL_143;
    -[_MRGetKeyboardSessionProtobuf mergeFrom:](getKeyboardMessage, "mergeFrom:");
  }
  else
  {
    if (!v50)
      goto LABEL_143;
    -[_MRMediaRemoteMessageProtobuf setGetKeyboardMessage:](self, "setGetKeyboardMessage:");
  }
  v5 = v195;
LABEL_143:
  textInputMessage = self->_textInputMessage;
  v52 = *((_QWORD *)v5 + 86);
  if (textInputMessage)
  {
    if (!v52)
      goto LABEL_149;
    -[_MRTextInputMessageProtobuf mergeFrom:](textInputMessage, "mergeFrom:");
  }
  else
  {
    if (!v52)
      goto LABEL_149;
    -[_MRMediaRemoteMessageProtobuf setTextInputMessage:](self, "setTextInputMessage:");
  }
  v5 = v195;
LABEL_149:
  getVoiceInputDevicesMessage = self->_getVoiceInputDevicesMessage;
  v54 = *((_QWORD *)v5 + 26);
  if (getVoiceInputDevicesMessage)
  {
    if (!v54)
      goto LABEL_155;
    -[_MRGetVoiceInputDevicesMessageProtobuf mergeFrom:](getVoiceInputDevicesMessage, "mergeFrom:");
  }
  else
  {
    if (!v54)
      goto LABEL_155;
    -[_MRMediaRemoteMessageProtobuf setGetVoiceInputDevicesMessage:](self, "setGetVoiceInputDevicesMessage:");
  }
  v5 = v195;
LABEL_155:
  getVoiceInputDevicesResponseMessage = self->_getVoiceInputDevicesResponseMessage;
  v56 = *((_QWORD *)v5 + 27);
  if (getVoiceInputDevicesResponseMessage)
  {
    if (!v56)
      goto LABEL_161;
    -[_MRGetVoiceInputDevicesResponseMessageProtobuf mergeFrom:](getVoiceInputDevicesResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v56)
      goto LABEL_161;
    -[_MRMediaRemoteMessageProtobuf setGetVoiceInputDevicesResponseMessage:](self, "setGetVoiceInputDevicesResponseMessage:");
  }
  v5 = v195;
LABEL_161:
  registerVoiceInputDeviceMessage = self->_registerVoiceInputDeviceMessage;
  v58 = *((_QWORD *)v5 + 57);
  if (registerVoiceInputDeviceMessage)
  {
    if (!v58)
      goto LABEL_167;
    -[_MRRegisterVoiceInputDeviceMessageProtobuf mergeFrom:](registerVoiceInputDeviceMessage, "mergeFrom:");
  }
  else
  {
    if (!v58)
      goto LABEL_167;
    -[_MRMediaRemoteMessageProtobuf setRegisterVoiceInputDeviceMessage:](self, "setRegisterVoiceInputDeviceMessage:");
  }
  v5 = v195;
LABEL_167:
  registerVoiceInputDeviceResponseMessage = self->_registerVoiceInputDeviceResponseMessage;
  v60 = *((_QWORD *)v5 + 58);
  if (registerVoiceInputDeviceResponseMessage)
  {
    if (!v60)
      goto LABEL_173;
    -[_MRRegisterVoiceInputDeviceResponseMessageProtobuf mergeFrom:](registerVoiceInputDeviceResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v60)
      goto LABEL_173;
    -[_MRMediaRemoteMessageProtobuf setRegisterVoiceInputDeviceResponseMessage:](self, "setRegisterVoiceInputDeviceResponseMessage:");
  }
  v5 = v195;
LABEL_173:
  setRecordingStateMessage = self->_setRecordingStateMessage;
  v62 = *((_QWORD *)v5 + 82);
  if (setRecordingStateMessage)
  {
    if (!v62)
      goto LABEL_179;
    -[_MRSetRecordingStateMessageProtobuf mergeFrom:](setRecordingStateMessage, "mergeFrom:");
  }
  else
  {
    if (!v62)
      goto LABEL_179;
    -[_MRMediaRemoteMessageProtobuf setSetRecordingStateMessage:](self, "setSetRecordingStateMessage:");
  }
  v5 = v195;
LABEL_179:
  sendVoiceInputMessage = self->_sendVoiceInputMessage;
  v64 = *((_QWORD *)v5 + 74);
  if (sendVoiceInputMessage)
  {
    if (!v64)
      goto LABEL_185;
    -[_MRSendVoiceInputMessageProtobuf mergeFrom:](sendVoiceInputMessage, "mergeFrom:");
  }
  else
  {
    if (!v64)
      goto LABEL_185;
    -[_MRMediaRemoteMessageProtobuf setSendVoiceInputMessage:](self, "setSendVoiceInputMessage:");
  }
  v5 = v195;
LABEL_185:
  playbackQueueRequest = self->_playbackQueueRequest;
  v66 = *((_QWORD *)v5 + 39);
  if (playbackQueueRequest)
  {
    if (!v66)
      goto LABEL_191;
    -[_MRPlaybackQueueRequestProtobuf mergeFrom:](playbackQueueRequest, "mergeFrom:");
  }
  else
  {
    if (!v66)
      goto LABEL_191;
    -[_MRMediaRemoteMessageProtobuf setPlaybackQueueRequest:](self, "setPlaybackQueueRequest:");
  }
  v5 = v195;
LABEL_191:
  transactionPackets = self->_transactionPackets;
  v68 = *((_QWORD *)v5 + 87);
  if (transactionPackets)
  {
    if (!v68)
      goto LABEL_197;
    -[_MRTransactionMessageProtobuf mergeFrom:](transactionPackets, "mergeFrom:");
  }
  else
  {
    if (!v68)
      goto LABEL_197;
    -[_MRMediaRemoteMessageProtobuf setTransactionPackets:](self, "setTransactionPackets:");
  }
  v5 = v195;
LABEL_197:
  cryptoPairingMessage = self->_cryptoPairingMessage;
  v70 = *((_QWORD *)v5 + 12);
  if (cryptoPairingMessage)
  {
    if (!v70)
      goto LABEL_203;
    -[_MRCryptoPairingMessageProtobuf mergeFrom:](cryptoPairingMessage, "mergeFrom:");
  }
  else
  {
    if (!v70)
      goto LABEL_203;
    -[_MRMediaRemoteMessageProtobuf setCryptoPairingMessage:](self, "setCryptoPairingMessage:");
  }
  v5 = v195;
LABEL_203:
  gameControllerProperties = self->_gameControllerProperties;
  v72 = *((_QWORD *)v5 + 21);
  if (gameControllerProperties)
  {
    if (!v72)
      goto LABEL_209;
    -[_MRGameControllerPropertiesMessageProtobuf mergeFrom:](gameControllerProperties, "mergeFrom:");
  }
  else
  {
    if (!v72)
      goto LABEL_209;
    -[_MRMediaRemoteMessageProtobuf setGameControllerProperties:](self, "setGameControllerProperties:");
  }
  v5 = v195;
LABEL_209:
  readyStateMessage = self->_readyStateMessage;
  v74 = *((_QWORD *)v5 + 51);
  if (readyStateMessage)
  {
    if (!v74)
      goto LABEL_215;
    -[_MRSetReadyStateMessageProtobuf mergeFrom:](readyStateMessage, "mergeFrom:");
  }
  else
  {
    if (!v74)
      goto LABEL_215;
    -[_MRMediaRemoteMessageProtobuf setReadyStateMessage:](self, "setReadyStateMessage:");
  }
  v5 = v195;
LABEL_215:
  connectionState = self->_connectionState;
  v76 = *((_QWORD *)v5 + 8);
  if (connectionState)
  {
    if (!v76)
      goto LABEL_221;
    -[_MRSetConnectionStateMessageProtobuf mergeFrom:](connectionState, "mergeFrom:");
  }
  else
  {
    if (!v76)
      goto LABEL_221;
    -[_MRMediaRemoteMessageProtobuf setConnectionState:](self, "setConnectionState:");
  }
  v5 = v195;
LABEL_221:
  sendButtonEventMessage = self->_sendButtonEventMessage;
  v78 = *((_QWORD *)v5 + 66);
  if (sendButtonEventMessage)
  {
    if (!v78)
      goto LABEL_227;
    -[_MRSendButtonEventMessageProtobuf mergeFrom:](sendButtonEventMessage, "mergeFrom:");
  }
  else
  {
    if (!v78)
      goto LABEL_227;
    -[_MRMediaRemoteMessageProtobuf setSendButtonEventMessage:](self, "setSendButtonEventMessage:");
  }
  v5 = v195;
LABEL_227:
  setHiliteModeMessage = self->_setHiliteModeMessage;
  v80 = *((_QWORD *)v5 + 78);
  if (setHiliteModeMessage)
  {
    if (!v80)
      goto LABEL_233;
    -[_MRSetHiliteModeMessageProtobuf mergeFrom:](setHiliteModeMessage, "mergeFrom:");
  }
  else
  {
    if (!v80)
      goto LABEL_233;
    -[_MRMediaRemoteMessageProtobuf setSetHiliteModeMessage:](self, "setSetHiliteModeMessage:");
  }
  v5 = v195;
LABEL_233:
  wakeDeviceMessage = self->_wakeDeviceMessage;
  v82 = *((_QWORD *)v5 + 101);
  if (wakeDeviceMessage)
  {
    if (!v82)
      goto LABEL_239;
    -[_MRWakeDeviceMessageProtobuf mergeFrom:](wakeDeviceMessage, "mergeFrom:");
  }
  else
  {
    if (!v82)
      goto LABEL_239;
    -[_MRMediaRemoteMessageProtobuf setWakeDeviceMessage:](self, "setWakeDeviceMessage:");
  }
  v5 = v195;
LABEL_239:
  genericMessage = self->_genericMessage;
  v84 = *((_QWORD *)v5 + 22);
  if (genericMessage)
  {
    if (!v84)
      goto LABEL_245;
    -[_MRGenericMessageProtobuf mergeFrom:](genericMessage, "mergeFrom:");
  }
  else
  {
    if (!v84)
      goto LABEL_245;
    -[_MRMediaRemoteMessageProtobuf setGenericMessage:](self, "setGenericMessage:");
  }
  v5 = v195;
LABEL_245:
  sendPackedVirtualTouchEventMessage = self->_sendPackedVirtualTouchEventMessage;
  v86 = *((_QWORD *)v5 + 72);
  if (sendPackedVirtualTouchEventMessage)
  {
    if (!v86)
      goto LABEL_251;
    -[_MRSendPackedVirtualTouchEventMessageProtobuf mergeFrom:](sendPackedVirtualTouchEventMessage, "mergeFrom:");
  }
  else
  {
    if (!v86)
      goto LABEL_251;
    -[_MRMediaRemoteMessageProtobuf setSendPackedVirtualTouchEventMessage:](self, "setSendPackedVirtualTouchEventMessage:");
  }
  v5 = v195;
LABEL_251:
  sendLyricsEventMessage = self->_sendLyricsEventMessage;
  v88 = *((_QWORD *)v5 + 71);
  if (sendLyricsEventMessage)
  {
    if (!v88)
      goto LABEL_257;
    -[_MRSendLyricsEventMessageProtobuf mergeFrom:](sendLyricsEventMessage, "mergeFrom:");
  }
  else
  {
    if (!v88)
      goto LABEL_257;
    -[_MRMediaRemoteMessageProtobuf setSendLyricsEventMessage:](self, "setSendLyricsEventMessage:");
  }
  v5 = v195;
LABEL_257:
  setNowPlayingClientMessage = self->_setNowPlayingClientMessage;
  v90 = *((_QWORD *)v5 + 80);
  if (setNowPlayingClientMessage)
  {
    if (!v90)
      goto LABEL_263;
    -[_MRSetNowPlayingClientMessageProtobuf mergeFrom:](setNowPlayingClientMessage, "mergeFrom:");
  }
  else
  {
    if (!v90)
      goto LABEL_263;
    -[_MRMediaRemoteMessageProtobuf setSetNowPlayingClientMessage:](self, "setSetNowPlayingClientMessage:");
  }
  v5 = v195;
LABEL_263:
  setNowPlayingPlayerMessage = self->_setNowPlayingPlayerMessage;
  v92 = *((_QWORD *)v5 + 81);
  if (setNowPlayingPlayerMessage)
  {
    if (!v92)
      goto LABEL_269;
    -[_MRSetNowPlayingPlayerMessageProtobuf mergeFrom:](setNowPlayingPlayerMessage, "mergeFrom:");
  }
  else
  {
    if (!v92)
      goto LABEL_269;
    -[_MRMediaRemoteMessageProtobuf setSetNowPlayingPlayerMessage:](self, "setSetNowPlayingPlayerMessage:");
  }
  v5 = v195;
LABEL_269:
  modifyOutputContextRequestMessage = self->_modifyOutputContextRequestMessage;
  v94 = *((_QWORD *)v5 + 36);
  if (modifyOutputContextRequestMessage)
  {
    if (!v94)
      goto LABEL_275;
    -[_MRAVModifyOutputContextRequestProtobuf mergeFrom:](modifyOutputContextRequestMessage, "mergeFrom:");
  }
  else
  {
    if (!v94)
      goto LABEL_275;
    -[_MRMediaRemoteMessageProtobuf setModifyOutputContextRequestMessage:](self, "setModifyOutputContextRequestMessage:");
  }
  v5 = v195;
LABEL_275:
  getVolumeMessage = self->_getVolumeMessage;
  v96 = *((_QWORD *)v5 + 30);
  if (getVolumeMessage)
  {
    if (!v96)
      goto LABEL_281;
    -[_MRGetVolumeMessageProtobuf mergeFrom:](getVolumeMessage, "mergeFrom:");
  }
  else
  {
    if (!v96)
      goto LABEL_281;
    -[_MRMediaRemoteMessageProtobuf setGetVolumeMessage:](self, "setGetVolumeMessage:");
  }
  v5 = v195;
LABEL_281:
  getVolumeResultMessage = self->_getVolumeResultMessage;
  v98 = *((_QWORD *)v5 + 33);
  if (getVolumeResultMessage)
  {
    if (!v98)
      goto LABEL_287;
    -[_MRGetVolumeResultMessageProtobuf mergeFrom:](getVolumeResultMessage, "mergeFrom:");
  }
  else
  {
    if (!v98)
      goto LABEL_287;
    -[_MRMediaRemoteMessageProtobuf setGetVolumeResultMessage:](self, "setGetVolumeResultMessage:");
  }
  v5 = v195;
LABEL_287:
  setVolumeMessage = self->_setVolumeMessage;
  v100 = *((_QWORD *)v5 + 84);
  if (setVolumeMessage)
  {
    if (!v100)
      goto LABEL_293;
    -[_MRSetVolumeMessageProtobuf mergeFrom:](setVolumeMessage, "mergeFrom:");
  }
  else
  {
    if (!v100)
      goto LABEL_293;
    -[_MRMediaRemoteMessageProtobuf setSetVolumeMessage:](self, "setSetVolumeMessage:");
  }
  v5 = v195;
LABEL_293:
  volumeDidChangeMessage = self->_volumeDidChangeMessage;
  v102 = *((_QWORD *)v5 + 99);
  if (volumeDidChangeMessage)
  {
    if (!v102)
      goto LABEL_299;
    -[_MRVolumeDidChangeMessageProtobuf mergeFrom:](volumeDidChangeMessage, "mergeFrom:");
  }
  else
  {
    if (!v102)
      goto LABEL_299;
    -[_MRMediaRemoteMessageProtobuf setVolumeDidChangeMessage:](self, "setVolumeDidChangeMessage:");
  }
  v5 = v195;
LABEL_299:
  removeClientMessage = self->_removeClientMessage;
  v104 = *((_QWORD *)v5 + 60);
  if (removeClientMessage)
  {
    if (!v104)
      goto LABEL_305;
    -[_MRRemoveClientMessageProtobuf mergeFrom:](removeClientMessage, "mergeFrom:");
  }
  else
  {
    if (!v104)
      goto LABEL_305;
    -[_MRMediaRemoteMessageProtobuf setRemoveClientMessage:](self, "setRemoveClientMessage:");
  }
  v5 = v195;
LABEL_305:
  removePlayerMessage = self->_removePlayerMessage;
  v106 = *((_QWORD *)v5 + 63);
  if (removePlayerMessage)
  {
    if (!v106)
      goto LABEL_311;
    -[_MRRemovePlayerMessageProtobuf mergeFrom:](removePlayerMessage, "mergeFrom:");
  }
  else
  {
    if (!v106)
      goto LABEL_311;
    -[_MRMediaRemoteMessageProtobuf setRemovePlayerMessage:](self, "setRemovePlayerMessage:");
  }
  v5 = v195;
LABEL_311:
  updateClientMessage = self->_updateClientMessage;
  v108 = *((_QWORD *)v5 + 92);
  if (updateClientMessage)
  {
    if (!v108)
      goto LABEL_317;
    -[_MRUpdateClientMessageProtobuf mergeFrom:](updateClientMessage, "mergeFrom:");
  }
  else
  {
    if (!v108)
      goto LABEL_317;
    -[_MRMediaRemoteMessageProtobuf setUpdateClientMessage:](self, "setUpdateClientMessage:");
  }
  v5 = v195;
LABEL_317:
  updateContentItemMessage = self->_updateContentItemMessage;
  v110 = *((_QWORD *)v5 + 94);
  if (updateContentItemMessage)
  {
    if (!v110)
      goto LABEL_323;
    -[_MRUpdateContentItemMessageProtobuf mergeFrom:](updateContentItemMessage, "mergeFrom:");
  }
  else
  {
    if (!v110)
      goto LABEL_323;
    -[_MRMediaRemoteMessageProtobuf setUpdateContentItemMessage:](self, "setUpdateContentItemMessage:");
  }
  v5 = v195;
LABEL_323:
  updateContentItemArtworkMessage = self->_updateContentItemArtworkMessage;
  v112 = *((_QWORD *)v5 + 93);
  if (updateContentItemArtworkMessage)
  {
    if (!v112)
      goto LABEL_329;
    -[_MRUpdateContentItemArtworkMessageProtobuf mergeFrom:](updateContentItemArtworkMessage, "mergeFrom:");
  }
  else
  {
    if (!v112)
      goto LABEL_329;
    -[_MRMediaRemoteMessageProtobuf setUpdateContentItemArtworkMessage:](self, "setUpdateContentItemArtworkMessage:");
  }
  v5 = v195;
LABEL_329:
  updatePlayerMessage = self->_updatePlayerMessage;
  v114 = *((_QWORD *)v5 + 97);
  if (updatePlayerMessage)
  {
    if (!v114)
      goto LABEL_335;
    -[_MRUpdatePlayerMessageProtobuf mergeFrom:](updatePlayerMessage, "mergeFrom:");
  }
  else
  {
    if (!v114)
      goto LABEL_335;
    -[_MRMediaRemoteMessageProtobuf setUpdatePlayerMessage:](self, "setUpdatePlayerMessage:");
  }
  v5 = v195;
LABEL_335:
  promptForRouteAuthorizationMessage = self->_promptForRouteAuthorizationMessage;
  v116 = *((_QWORD *)v5 + 49);
  if (promptForRouteAuthorizationMessage)
  {
    if (!v116)
      goto LABEL_341;
    -[_MRPromptForRouteAuthorizationMessageProtobuf mergeFrom:](promptForRouteAuthorizationMessage, "mergeFrom:");
  }
  else
  {
    if (!v116)
      goto LABEL_341;
    -[_MRMediaRemoteMessageProtobuf setPromptForRouteAuthorizationMessage:](self, "setPromptForRouteAuthorizationMessage:");
  }
  v5 = v195;
LABEL_341:
  promptForRouteAuthorizationResponseMessage = self->_promptForRouteAuthorizationResponseMessage;
  v118 = *((_QWORD *)v5 + 50);
  if (promptForRouteAuthorizationResponseMessage)
  {
    if (!v118)
      goto LABEL_347;
    -[_MRPromptForRouteAuthorizationResponseMessageProtobuf mergeFrom:](promptForRouteAuthorizationResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v118)
      goto LABEL_347;
    -[_MRMediaRemoteMessageProtobuf setPromptForRouteAuthorizationResponseMessage:](self, "setPromptForRouteAuthorizationResponseMessage:");
  }
  v5 = v195;
LABEL_347:
  presentRouteAuthorizationStatusMessage = self->_presentRouteAuthorizationStatusMessage;
  v120 = *((_QWORD *)v5 + 48);
  if (presentRouteAuthorizationStatusMessage)
  {
    if (!v120)
      goto LABEL_353;
    -[_MRPresentRouteAuthorizationStatusMessageProtobuf mergeFrom:](presentRouteAuthorizationStatusMessage, "mergeFrom:");
  }
  else
  {
    if (!v120)
      goto LABEL_353;
    -[_MRMediaRemoteMessageProtobuf setPresentRouteAuthorizationStatusMessage:](self, "setPresentRouteAuthorizationStatusMessage:");
  }
  v5 = v195;
LABEL_353:
  getVolumeControlCapabilitiesMessage = self->_getVolumeControlCapabilitiesMessage;
  v122 = *((_QWORD *)v5 + 28);
  if (getVolumeControlCapabilitiesMessage)
  {
    if (!v122)
      goto LABEL_359;
    -[_MRGetVolumeControlCapabilitiesMessageProtobuf mergeFrom:](getVolumeControlCapabilitiesMessage, "mergeFrom:");
  }
  else
  {
    if (!v122)
      goto LABEL_359;
    -[_MRMediaRemoteMessageProtobuf setGetVolumeControlCapabilitiesMessage:](self, "setGetVolumeControlCapabilitiesMessage:");
  }
  v5 = v195;
LABEL_359:
  getVolumeControlCapabilitiesResultMessage = self->_getVolumeControlCapabilitiesResultMessage;
  v124 = *((_QWORD *)v5 + 29);
  if (getVolumeControlCapabilitiesResultMessage)
  {
    if (!v124)
      goto LABEL_365;
    -[_MRGetVolumeControlCapabilitiesResultMessageProtobuf mergeFrom:](getVolumeControlCapabilitiesResultMessage, "mergeFrom:");
  }
  else
  {
    if (!v124)
      goto LABEL_365;
    -[_MRMediaRemoteMessageProtobuf setGetVolumeControlCapabilitiesResultMessage:](self, "setGetVolumeControlCapabilitiesResultMessage:");
  }
  v5 = v195;
LABEL_365:
  volumeControlCapabilitiesDidChangeMessage = self->_volumeControlCapabilitiesDidChangeMessage;
  v126 = *((_QWORD *)v5 + 98);
  if (volumeControlCapabilitiesDidChangeMessage)
  {
    if (!v126)
      goto LABEL_371;
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf mergeFrom:](volumeControlCapabilitiesDidChangeMessage, "mergeFrom:");
  }
  else
  {
    if (!v126)
      goto LABEL_371;
    -[_MRMediaRemoteMessageProtobuf setVolumeControlCapabilitiesDidChangeMessage:](self, "setVolumeControlCapabilitiesDidChangeMessage:");
  }
  v5 = v195;
LABEL_371:
  updateOutputDevicesMessage = self->_updateOutputDevicesMessage;
  v128 = *((_QWORD *)v5 + 96);
  if (updateOutputDevicesMessage)
  {
    if (!v128)
      goto LABEL_377;
    -[_MRUpdateOutputDevicesMessageProtobuf mergeFrom:](updateOutputDevicesMessage, "mergeFrom:");
  }
  else
  {
    if (!v128)
      goto LABEL_377;
    -[_MRMediaRemoteMessageProtobuf setUpdateOutputDevicesMessage:](self, "setUpdateOutputDevicesMessage:");
  }
  v5 = v195;
LABEL_377:
  removeOutputDevicesMessage = self->_removeOutputDevicesMessage;
  v130 = *((_QWORD *)v5 + 62);
  if (removeOutputDevicesMessage)
  {
    if (!v130)
      goto LABEL_383;
    -[_MRRemoveOutputDevicesMessageProtobuf mergeFrom:](removeOutputDevicesMessage, "mergeFrom:");
  }
  else
  {
    if (!v130)
      goto LABEL_383;
    -[_MRMediaRemoteMessageProtobuf setRemoveOutputDevicesMessage:](self, "setRemoveOutputDevicesMessage:");
  }
  v5 = v195;
LABEL_383:
  remoteTextInputMessage = self->_remoteTextInputMessage;
  v132 = *((_QWORD *)v5 + 59);
  if (remoteTextInputMessage)
  {
    if (!v132)
      goto LABEL_389;
    -[_MRRemoteTextInputMessageProtobuf mergeFrom:](remoteTextInputMessage, "mergeFrom:");
  }
  else
  {
    if (!v132)
      goto LABEL_389;
    -[_MRMediaRemoteMessageProtobuf setRemoteTextInputMessage:](self, "setRemoteTextInputMessage:");
  }
  v5 = v195;
LABEL_389:
  getRemoteTextInputSessionMessage = self->_getRemoteTextInputSessionMessage;
  v134 = *((_QWORD *)v5 + 24);
  if (getRemoteTextInputSessionMessage)
  {
    if (!v134)
      goto LABEL_395;
    -[_MRGetRemoteTextInputSessionProtobuf mergeFrom:](getRemoteTextInputSessionMessage, "mergeFrom:");
  }
  else
  {
    if (!v134)
      goto LABEL_395;
    -[_MRMediaRemoteMessageProtobuf setGetRemoteTextInputSessionMessage:](self, "setGetRemoteTextInputSessionMessage:");
  }
  v5 = v195;
LABEL_395:
  playbackSessionRequestMessage = self->_playbackSessionRequestMessage;
  v136 = *((_QWORD *)v5 + 44);
  if (playbackSessionRequestMessage)
  {
    if (!v136)
      goto LABEL_401;
    -[_MRPlaybackSessionRequestMessageProtobuf mergeFrom:](playbackSessionRequestMessage, "mergeFrom:");
  }
  else
  {
    if (!v136)
      goto LABEL_401;
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionRequestMessage:](self, "setPlaybackSessionRequestMessage:");
  }
  v5 = v195;
LABEL_401:
  playbackSessionResponseMessage = self->_playbackSessionResponseMessage;
  v138 = *((_QWORD *)v5 + 45);
  if (playbackSessionResponseMessage)
  {
    if (!v138)
      goto LABEL_407;
    -[_MRPlaybackSessionResponseMessageProtobuf mergeFrom:](playbackSessionResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v138)
      goto LABEL_407;
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionResponseMessage:](self, "setPlaybackSessionResponseMessage:");
  }
  v5 = v195;
LABEL_407:
  setDefaultSupportedCommandsMessage = self->_setDefaultSupportedCommandsMessage;
  v140 = *((_QWORD *)v5 + 77);
  if (setDefaultSupportedCommandsMessage)
  {
    if (!v140)
      goto LABEL_413;
    -[_MRSetStateMessageProtobuf mergeFrom:](setDefaultSupportedCommandsMessage, "mergeFrom:");
  }
  else
  {
    if (!v140)
      goto LABEL_413;
    -[_MRMediaRemoteMessageProtobuf setSetDefaultSupportedCommandsMessage:](self, "setSetDefaultSupportedCommandsMessage:");
  }
  v5 = v195;
LABEL_413:
  playbackSessionMigrateRequestMessage = self->_playbackSessionMigrateRequestMessage;
  v142 = *((_QWORD *)v5 + 42);
  if (playbackSessionMigrateRequestMessage)
  {
    if (!v142)
      goto LABEL_419;
    -[_MRPlaybackSessionMigrateRequestMessageProtobuf mergeFrom:](playbackSessionMigrateRequestMessage, "mergeFrom:");
  }
  else
  {
    if (!v142)
      goto LABEL_419;
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateRequestMessage:](self, "setPlaybackSessionMigrateRequestMessage:");
  }
  v5 = v195;
LABEL_419:
  playbackSessionMigrateResponseMessage = self->_playbackSessionMigrateResponseMessage;
  v144 = *((_QWORD *)v5 + 43);
  if (playbackSessionMigrateResponseMessage)
  {
    if (!v144)
      goto LABEL_425;
    -[_MRPlaybackSessionMigrateResponseMessageProtobuf mergeFrom:](playbackSessionMigrateResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v144)
      goto LABEL_425;
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateResponseMessage:](self, "setPlaybackSessionMigrateResponseMessage:");
  }
  v5 = v195;
LABEL_425:
  if (*((_QWORD *)v5 + 19))
  {
    -[_MRMediaRemoteMessageProtobuf setErrorDescription:](self, "setErrorDescription:");
    v5 = v195;
  }
  playbackSessionMigrateBeginMessage = self->_playbackSessionMigrateBeginMessage;
  v146 = *((_QWORD *)v5 + 40);
  if (playbackSessionMigrateBeginMessage)
  {
    if (!v146)
      goto LABEL_433;
    -[_MRPlaybackSessionMigrateBeginMessageProtobuf mergeFrom:](playbackSessionMigrateBeginMessage, "mergeFrom:");
  }
  else
  {
    if (!v146)
      goto LABEL_433;
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateBeginMessage:](self, "setPlaybackSessionMigrateBeginMessage:");
  }
  v5 = v195;
LABEL_433:
  playbackSessionMigrateEndMessage = self->_playbackSessionMigrateEndMessage;
  v148 = *((_QWORD *)v5 + 41);
  if (playbackSessionMigrateEndMessage)
  {
    if (!v148)
      goto LABEL_439;
    -[_MRPlaybackSessionMigrateEndMessageProtobuf mergeFrom:](playbackSessionMigrateEndMessage, "mergeFrom:");
  }
  else
  {
    if (!v148)
      goto LABEL_439;
    -[_MRMediaRemoteMessageProtobuf setPlaybackSessionMigrateEndMessage:](self, "setPlaybackSessionMigrateEndMessage:");
  }
  v5 = v195;
LABEL_439:
  updateActiveSystemEndpointMessage = self->_updateActiveSystemEndpointMessage;
  v150 = *((_QWORD *)v5 + 91);
  if (updateActiveSystemEndpointMessage)
  {
    if (!v150)
      goto LABEL_445;
    -[_MRUpdateActiveSystemEndpointMessageProtobuf mergeFrom:](updateActiveSystemEndpointMessage, "mergeFrom:");
  }
  else
  {
    if (!v150)
      goto LABEL_445;
    -[_MRMediaRemoteMessageProtobuf setUpdateActiveSystemEndpointMessage:](self, "setUpdateActiveSystemEndpointMessage:");
  }
  v5 = v195;
LABEL_445:
  discoveryModeMessage = self->_discoveryModeMessage;
  v152 = *((_QWORD *)v5 + 14);
  if (discoveryModeMessage)
  {
    if (!v152)
      goto LABEL_451;
    -[_MRSetDiscoveryModeProtobufMessage mergeFrom:](discoveryModeMessage, "mergeFrom:");
  }
  else
  {
    if (!v152)
      goto LABEL_451;
    -[_MRMediaRemoteMessageProtobuf setDiscoveryModeMessage:](self, "setDiscoveryModeMessage:");
  }
  v5 = v195;
LABEL_451:
  updateEndpointsMessage = self->_updateEndpointsMessage;
  v154 = *((_QWORD *)v5 + 95);
  if (updateEndpointsMessage)
  {
    if (!v154)
      goto LABEL_457;
    -[_MRUpdateEndpointsMessageProtobuf mergeFrom:](updateEndpointsMessage, "mergeFrom:");
  }
  else
  {
    if (!v154)
      goto LABEL_457;
    -[_MRMediaRemoteMessageProtobuf setUpdateEndpointsMessage:](self, "setUpdateEndpointsMessage:");
  }
  v5 = v195;
LABEL_457:
  removeEndpointsMessage = self->_removeEndpointsMessage;
  v156 = *((_QWORD *)v5 + 61);
  if (removeEndpointsMessage)
  {
    if (!v156)
      goto LABEL_463;
    -[_MRRemoveEndpointsMessageProtobuf mergeFrom:](removeEndpointsMessage, "mergeFrom:");
  }
  else
  {
    if (!v156)
      goto LABEL_463;
    -[_MRMediaRemoteMessageProtobuf setRemoveEndpointsMessage:](self, "setRemoveEndpointsMessage:");
  }
  v5 = v195;
LABEL_463:
  if (*((_QWORD *)v5 + 89))
  {
    -[_MRMediaRemoteMessageProtobuf setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v5 = v195;
  }
  playerClientPropertiesMessage = self->_playerClientPropertiesMessage;
  v158 = *((_QWORD *)v5 + 47);
  if (playerClientPropertiesMessage)
  {
    if (!v158)
      goto LABEL_471;
    -[_MRPlayerClientPropertiesMessageProtobuf mergeFrom:](playerClientPropertiesMessage, "mergeFrom:");
  }
  else
  {
    if (!v158)
      goto LABEL_471;
    -[_MRMediaRemoteMessageProtobuf setPlayerClientPropertiesMessage:](self, "setPlayerClientPropertiesMessage:");
  }
  v5 = v195;
LABEL_471:
  originClientPropertiesMessage = self->_originClientPropertiesMessage;
  v160 = *((_QWORD *)v5 + 38);
  if (originClientPropertiesMessage)
  {
    if (!v160)
      goto LABEL_477;
    -[_MROriginClientPropertiesMessageProtobuf mergeFrom:](originClientPropertiesMessage, "mergeFrom:");
  }
  else
  {
    if (!v160)
      goto LABEL_477;
    -[_MRMediaRemoteMessageProtobuf setOriginClientPropertiesMessage:](self, "setOriginClientPropertiesMessage:");
  }
  v5 = v195;
LABEL_477:
  audioFadeMessage = self->_audioFadeMessage;
  v162 = *((_QWORD *)v5 + 3);
  if (audioFadeMessage)
  {
    if (!v162)
      goto LABEL_483;
    -[_MRAudioFadeMessageProtobuf mergeFrom:](audioFadeMessage, "mergeFrom:");
  }
  else
  {
    if (!v162)
      goto LABEL_483;
    -[_MRMediaRemoteMessageProtobuf setAudioFadeMessage:](self, "setAudioFadeMessage:");
  }
  v5 = v195;
LABEL_483:
  audioFadeResponseMessage = self->_audioFadeResponseMessage;
  v164 = *((_QWORD *)v5 + 4);
  if (audioFadeResponseMessage)
  {
    if (!v164)
      goto LABEL_489;
    -[_MRAudioFadeResponseMessageProtobuf mergeFrom:](audioFadeResponseMessage, "mergeFrom:");
  }
  else
  {
    if (!v164)
      goto LABEL_489;
    -[_MRMediaRemoteMessageProtobuf setAudioFadeResponseMessage:](self, "setAudioFadeResponseMessage:");
  }
  v5 = v195;
LABEL_489:
  discoveryUpdateEndpointsMessage = self->_discoveryUpdateEndpointsMessage;
  v166 = *((_QWORD *)v5 + 15);
  if (discoveryUpdateEndpointsMessage)
  {
    if (!v166)
      goto LABEL_495;
    -[_MRDiscoveryUpdateEndpointsProtobufMessage mergeFrom:](discoveryUpdateEndpointsMessage, "mergeFrom:");
  }
  else
  {
    if (!v166)
      goto LABEL_495;
    -[_MRMediaRemoteMessageProtobuf setDiscoveryUpdateEndpointsMessage:](self, "setDiscoveryUpdateEndpointsMessage:");
  }
  v5 = v195;
LABEL_495:
  discoveryUpdateOutputDevicesMessage = self->_discoveryUpdateOutputDevicesMessage;
  v168 = *((_QWORD *)v5 + 16);
  if (discoveryUpdateOutputDevicesMessage)
  {
    if (!v168)
      goto LABEL_501;
    -[_MRDiscoveryUpdateOutputDevicesProtobufMessage mergeFrom:](discoveryUpdateOutputDevicesMessage, "mergeFrom:");
  }
  else
  {
    if (!v168)
      goto LABEL_501;
    -[_MRMediaRemoteMessageProtobuf setDiscoveryUpdateOutputDevicesMessage:](self, "setDiscoveryUpdateOutputDevicesMessage:");
  }
  v5 = v195;
LABEL_501:
  setListeningModeMessage = self->_setListeningModeMessage;
  v170 = *((_QWORD *)v5 + 79);
  if (setListeningModeMessage)
  {
    if (!v170)
      goto LABEL_507;
    -[_MRSetListeningModeMessageProtobuf mergeFrom:](setListeningModeMessage, "mergeFrom:");
  }
  else
  {
    if (!v170)
      goto LABEL_507;
    -[_MRMediaRemoteMessageProtobuf setSetListeningModeMessage:](self, "setSetListeningModeMessage:");
  }
  v5 = v195;
LABEL_507:
  error = self->_error;
  v172 = *((_QWORD *)v5 + 17);
  if (error)
  {
    if (!v172)
      goto LABEL_513;
    -[_MRErrorProtobuf mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v172)
      goto LABEL_513;
    -[_MRMediaRemoteMessageProtobuf setError:](self, "setError:");
  }
  v5 = v195;
LABEL_513:
  configureConnectionMessage = self->_configureConnectionMessage;
  v174 = *((_QWORD *)v5 + 7);
  if (configureConnectionMessage)
  {
    if (!v174)
      goto LABEL_519;
    -[_MRConfigureConnectionMessageProtobuf mergeFrom:](configureConnectionMessage, "mergeFrom:");
  }
  else
  {
    if (!v174)
      goto LABEL_519;
    -[_MRMediaRemoteMessageProtobuf setConfigureConnectionMessage:](self, "setConfigureConnectionMessage:");
  }
  v5 = v195;
LABEL_519:
  createHostedEndpointRequest = self->_createHostedEndpointRequest;
  v176 = *((_QWORD *)v5 + 10);
  if (createHostedEndpointRequest)
  {
    if (!v176)
      goto LABEL_525;
    -[_MRCreateHostedEndpointRequestProtobuf mergeFrom:](createHostedEndpointRequest, "mergeFrom:");
  }
  else
  {
    if (!v176)
      goto LABEL_525;
    -[_MRMediaRemoteMessageProtobuf setCreateHostedEndpointRequest:](self, "setCreateHostedEndpointRequest:");
  }
  v5 = v195;
LABEL_525:
  createHostedEndpointResponse = self->_createHostedEndpointResponse;
  v178 = *((_QWORD *)v5 + 11);
  if (createHostedEndpointResponse)
  {
    if (!v178)
      goto LABEL_531;
    -[_MRCreateHostedEndpointResponseProtobuf mergeFrom:](createHostedEndpointResponse, "mergeFrom:");
  }
  else
  {
    if (!v178)
      goto LABEL_531;
    -[_MRMediaRemoteMessageProtobuf setCreateHostedEndpointResponse:](self, "setCreateHostedEndpointResponse:");
  }
  v5 = v195;
LABEL_531:
  adjustVolumeMessage = self->_adjustVolumeMessage;
  v180 = *((_QWORD *)v5 + 2);
  if (adjustVolumeMessage)
  {
    if (!v180)
      goto LABEL_537;
    -[_MRAdjustVolumeMessageProtobuf mergeFrom:](adjustVolumeMessage, "mergeFrom:");
  }
  else
  {
    if (!v180)
      goto LABEL_537;
    -[_MRMediaRemoteMessageProtobuf setAdjustVolumeMessage:](self, "setAdjustVolumeMessage:");
  }
  v5 = v195;
LABEL_537:
  getVolumeMutedMessage = self->_getVolumeMutedMessage;
  v182 = *((_QWORD *)v5 + 31);
  if (getVolumeMutedMessage)
  {
    if (!v182)
      goto LABEL_543;
    -[_MRGetVolumeMutedMessageProtobuf mergeFrom:](getVolumeMutedMessage, "mergeFrom:");
  }
  else
  {
    if (!v182)
      goto LABEL_543;
    -[_MRMediaRemoteMessageProtobuf setGetVolumeMutedMessage:](self, "setGetVolumeMutedMessage:");
  }
  v5 = v195;
LABEL_543:
  getVolumeMutedResultMessage = self->_getVolumeMutedResultMessage;
  v184 = *((_QWORD *)v5 + 32);
  if (getVolumeMutedResultMessage)
  {
    if (!v184)
      goto LABEL_549;
    -[_MRGetVolumeMutedResultMessageProtobuf mergeFrom:](getVolumeMutedResultMessage, "mergeFrom:");
  }
  else
  {
    if (!v184)
      goto LABEL_549;
    -[_MRMediaRemoteMessageProtobuf setGetVolumeMutedResultMessage:](self, "setGetVolumeMutedResultMessage:");
  }
  v5 = v195;
LABEL_549:
  setVolumeMutedMessage = self->_setVolumeMutedMessage;
  v186 = *((_QWORD *)v5 + 85);
  if (setVolumeMutedMessage)
  {
    if (!v186)
      goto LABEL_555;
    -[_MRSetVolumeMutedMessageProtobuf mergeFrom:](setVolumeMutedMessage, "mergeFrom:");
  }
  else
  {
    if (!v186)
      goto LABEL_555;
    -[_MRMediaRemoteMessageProtobuf setSetVolumeMutedMessage:](self, "setSetVolumeMutedMessage:");
  }
  v5 = v195;
LABEL_555:
  volumeMutedDidChangeMessage = self->_volumeMutedDidChangeMessage;
  v188 = *((_QWORD *)v5 + 100);
  if (volumeMutedDidChangeMessage)
  {
    if (!v188)
      goto LABEL_561;
    -[_MRVolumeMutedDidChangeMessageProtobuf mergeFrom:](volumeMutedDidChangeMessage, "mergeFrom:");
  }
  else
  {
    if (!v188)
      goto LABEL_561;
    -[_MRMediaRemoteMessageProtobuf setVolumeMutedDidChangeMessage:](self, "setVolumeMutedDidChangeMessage:");
  }
  v5 = v195;
LABEL_561:
  setConversationDetectionEnabledMessage = self->_setConversationDetectionEnabledMessage;
  v190 = *((_QWORD *)v5 + 76);
  if (setConversationDetectionEnabledMessage)
  {
    if (!v190)
      goto LABEL_567;
    -[_MRSetConversationDetectionEnabledMessageProtobuf mergeFrom:](setConversationDetectionEnabledMessage, "mergeFrom:");
  }
  else
  {
    if (!v190)
      goto LABEL_567;
    -[_MRMediaRemoteMessageProtobuf setSetConversationDetectionEnabledMessage:](self, "setSetConversationDetectionEnabledMessage:");
  }
  v5 = v195;
LABEL_567:
  playerClientParticipantsUpdateMessage = self->_playerClientParticipantsUpdateMessage;
  v192 = *((_QWORD *)v5 + 46);
  if (playerClientParticipantsUpdateMessage)
  {
    if (!v192)
      goto LABEL_573;
    -[_MRPlayerClientParticipantsUpdateMessageProtobuf mergeFrom:](playerClientParticipantsUpdateMessage, "mergeFrom:");
  }
  else
  {
    if (!v192)
      goto LABEL_573;
    -[_MRMediaRemoteMessageProtobuf setPlayerClientParticipantsUpdateMessage:](self, "setPlayerClientParticipantsUpdateMessage:");
  }
  v5 = v195;
LABEL_573:
  requestGroupSessionMessage = self->_requestGroupSessionMessage;
  v194 = *((_QWORD *)v5 + 65);
  if (requestGroupSessionMessage)
  {
    if (v194)
    {
      -[_MRRequestGroupSessionMessageProtobuf mergeFrom:](requestGroupSessionMessage, "mergeFrom:");
LABEL_578:
      v5 = v195;
    }
  }
  else if (v194)
  {
    -[_MRMediaRemoteMessageProtobuf setRequestGroupSessionMessage:](self, "setRequestGroupSessionMessage:");
    goto LABEL_578;
  }

}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationToken, a3);
}

- (_MRSendCommandMessageProtobuf)sendCommandMessage
{
  return self->_sendCommandMessage;
}

- (void)setSendCommandMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sendCommandMessage, a3);
}

- (_MRSendCommandResultMessageProtobuf)sendCommandResultMessage
{
  return self->_sendCommandResultMessage;
}

- (void)setSendCommandResultMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sendCommandResultMessage, a3);
}

- (_MRSetStateMessageProtobuf)setStateMessage
{
  return self->_setStateMessage;
}

- (void)setSetStateMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setStateMessage, a3);
}

- (_MRNotificationMessageProtobuf)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_notificationMessage, a3);
}

- (_MRPlaybackQueueProtobuf)contentItemsChangedNotificationMessage
{
  return self->_contentItemsChangedNotificationMessage;
}

- (void)setContentItemsChangedNotificationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_contentItemsChangedNotificationMessage, a3);
}

- (_MRDeviceInfoMessageProtobuf)deviceInfoMessage
{
  return self->_deviceInfoMessage;
}

- (void)setDeviceInfoMessage:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfoMessage, a3);
}

- (_MRClientUpdatesConfigurationProtobuf)clientUpdatesConfigMessage
{
  return self->_clientUpdatesConfigMessage;
}

- (void)setClientUpdatesConfigMessage:(id)a3
{
  objc_storeStrong((id *)&self->_clientUpdatesConfigMessage, a3);
}

- (_MRPlaybackQueueRequestProtobuf)playbackQueueRequest
{
  return self->_playbackQueueRequest;
}

- (void)setPlaybackQueueRequest:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueRequest, a3);
}

- (_MRSetConnectionStateMessageProtobuf)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(id)a3
{
  objc_storeStrong((id *)&self->_connectionState, a3);
}

- (_MRGetVolumeMessageProtobuf)getVolumeMessage
{
  return self->_getVolumeMessage;
}

- (void)setGetVolumeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getVolumeMessage, a3);
}

- (_MRGetVolumeResultMessageProtobuf)getVolumeResultMessage
{
  return self->_getVolumeResultMessage;
}

- (void)setGetVolumeResultMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getVolumeResultMessage, a3);
}

- (_MRSetVolumeMessageProtobuf)setVolumeMessage
{
  return self->_setVolumeMessage;
}

- (void)setSetVolumeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setVolumeMessage, a3);
}

- (_MRVolumeDidChangeMessageProtobuf)volumeDidChangeMessage
{
  return self->_volumeDidChangeMessage;
}

- (void)setVolumeDidChangeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_volumeDidChangeMessage, a3);
}

- (_MRUpdateContentItemMessageProtobuf)updateContentItemMessage
{
  return self->_updateContentItemMessage;
}

- (void)setUpdateContentItemMessage:(id)a3
{
  objc_storeStrong((id *)&self->_updateContentItemMessage, a3);
}

- (_MRSetStateMessageProtobuf)setDefaultSupportedCommandsMessage
{
  return self->_setDefaultSupportedCommandsMessage;
}

- (void)setSetDefaultSupportedCommandsMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setDefaultSupportedCommandsMessage, a3);
}

- (_MRGetStateMessageProtobuf)getStateMessage
{
  return self->_getStateMessage;
}

- (void)setGetStateMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getStateMessage, a3);
}

- (_MRErrorProtobuf)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (_MRSetArtworkMessageProtobuf)setArtworkMessage
{
  return self->_setArtworkMessage;
}

- (void)setSetArtworkMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setArtworkMessage, a3);
}

- (_MRRegisterHIDDeviceMessageProtobuf)registerHIDDeviceMessage
{
  return self->_registerHIDDeviceMessage;
}

- (void)setRegisterHIDDeviceMessage:(id)a3
{
  objc_storeStrong((id *)&self->_registerHIDDeviceMessage, a3);
}

- (_MRRegisterHIDDeviceResultMessageProtobuf)registerHIDDeviceResultMessage
{
  return self->_registerHIDDeviceResultMessage;
}

- (void)setRegisterHIDDeviceResultMessage:(id)a3
{
  objc_storeStrong((id *)&self->_registerHIDDeviceResultMessage, a3);
}

- (_MRSendHIDEventMessageProtobuf)sendHIDEventMessage
{
  return self->_sendHIDEventMessage;
}

- (void)setSendHIDEventMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sendHIDEventMessage, a3);
}

- (_MRSendHIDReportMessageProtobuf)sendHIDReportMessage
{
  return self->_sendHIDReportMessage;
}

- (void)setSendHIDReportMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sendHIDReportMessage, a3);
}

- (_MRSendVirtualTouchEventMessageProtobuf)sendVirtualTouchEventMessage
{
  return self->_sendVirtualTouchEventMessage;
}

- (void)setSendVirtualTouchEventMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sendVirtualTouchEventMessage, a3);
}

- (_MRVolumeControlAvailabilityProtobuf)masterVolumeControlCapabilitiesDidChangeMessage
{
  return self->_masterVolumeControlCapabilitiesDidChangeMessage;
}

- (void)setMasterVolumeControlCapabilitiesDidChangeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_masterVolumeControlCapabilitiesDidChangeMessage, a3);
}

- (_MRGameControllerMessageProtobuf)gameController
{
  return self->_gameController;
}

- (void)setGameController:(id)a3
{
  objc_storeStrong((id *)&self->_gameController, a3);
}

- (_MRRegisterGameControllerMessageProtobuf)registerGameController
{
  return self->_registerGameController;
}

- (void)setRegisterGameController:(id)a3
{
  objc_storeStrong((id *)&self->_registerGameController, a3);
}

- (_MRRegisterGameControllerResponseMessageProtobuf)registerGameControllerResponse
{
  return self->_registerGameControllerResponse;
}

- (void)setRegisterGameControllerResponse:(id)a3
{
  objc_storeStrong((id *)&self->_registerGameControllerResponse, a3);
}

- (_MRUnregisterGameControllerMessageProtobuf)unregisterGameController
{
  return self->_unregisterGameController;
}

- (void)setUnregisterGameController:(id)a3
{
  objc_storeStrong((id *)&self->_unregisterGameController, a3);
}

- (_MRRegisterForGameControllerEventsMessageProtobuf)registerForGameControllerEvents
{
  return self->_registerForGameControllerEvents;
}

- (void)setRegisterForGameControllerEvents:(id)a3
{
  objc_storeStrong((id *)&self->_registerForGameControllerEvents, a3);
}

- (_MRKeyboardMessageProtobuf)keyboardMessage
{
  return self->_keyboardMessage;
}

- (void)setKeyboardMessage:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardMessage, a3);
}

- (_MRGetKeyboardSessionProtobuf)getKeyboardMessage
{
  return self->_getKeyboardMessage;
}

- (void)setGetKeyboardMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getKeyboardMessage, a3);
}

- (_MRTextInputMessageProtobuf)textInputMessage
{
  return self->_textInputMessage;
}

- (void)setTextInputMessage:(id)a3
{
  objc_storeStrong((id *)&self->_textInputMessage, a3);
}

- (_MRGetVoiceInputDevicesMessageProtobuf)getVoiceInputDevicesMessage
{
  return self->_getVoiceInputDevicesMessage;
}

- (void)setGetVoiceInputDevicesMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getVoiceInputDevicesMessage, a3);
}

- (_MRGetVoiceInputDevicesResponseMessageProtobuf)getVoiceInputDevicesResponseMessage
{
  return self->_getVoiceInputDevicesResponseMessage;
}

- (void)setGetVoiceInputDevicesResponseMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getVoiceInputDevicesResponseMessage, a3);
}

- (_MRRegisterVoiceInputDeviceMessageProtobuf)registerVoiceInputDeviceMessage
{
  return self->_registerVoiceInputDeviceMessage;
}

- (void)setRegisterVoiceInputDeviceMessage:(id)a3
{
  objc_storeStrong((id *)&self->_registerVoiceInputDeviceMessage, a3);
}

- (_MRRegisterVoiceInputDeviceResponseMessageProtobuf)registerVoiceInputDeviceResponseMessage
{
  return self->_registerVoiceInputDeviceResponseMessage;
}

- (void)setRegisterVoiceInputDeviceResponseMessage:(id)a3
{
  objc_storeStrong((id *)&self->_registerVoiceInputDeviceResponseMessage, a3);
}

- (_MRSetRecordingStateMessageProtobuf)setRecordingStateMessage
{
  return self->_setRecordingStateMessage;
}

- (void)setSetRecordingStateMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setRecordingStateMessage, a3);
}

- (_MRSendVoiceInputMessageProtobuf)sendVoiceInputMessage
{
  return self->_sendVoiceInputMessage;
}

- (void)setSendVoiceInputMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sendVoiceInputMessage, a3);
}

- (_MRTransactionMessageProtobuf)transactionPackets
{
  return self->_transactionPackets;
}

- (void)setTransactionPackets:(id)a3
{
  objc_storeStrong((id *)&self->_transactionPackets, a3);
}

- (_MRCryptoPairingMessageProtobuf)cryptoPairingMessage
{
  return self->_cryptoPairingMessage;
}

- (void)setCryptoPairingMessage:(id)a3
{
  objc_storeStrong((id *)&self->_cryptoPairingMessage, a3);
}

- (_MRGameControllerPropertiesMessageProtobuf)gameControllerProperties
{
  return self->_gameControllerProperties;
}

- (void)setGameControllerProperties:(id)a3
{
  objc_storeStrong((id *)&self->_gameControllerProperties, a3);
}

- (_MRSetReadyStateMessageProtobuf)readyStateMessage
{
  return self->_readyStateMessage;
}

- (void)setReadyStateMessage:(id)a3
{
  objc_storeStrong((id *)&self->_readyStateMessage, a3);
}

- (_MRSendButtonEventMessageProtobuf)sendButtonEventMessage
{
  return self->_sendButtonEventMessage;
}

- (void)setSendButtonEventMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sendButtonEventMessage, a3);
}

- (_MRSetHiliteModeMessageProtobuf)setHiliteModeMessage
{
  return self->_setHiliteModeMessage;
}

- (void)setSetHiliteModeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setHiliteModeMessage, a3);
}

- (_MRWakeDeviceMessageProtobuf)wakeDeviceMessage
{
  return self->_wakeDeviceMessage;
}

- (void)setWakeDeviceMessage:(id)a3
{
  objc_storeStrong((id *)&self->_wakeDeviceMessage, a3);
}

- (_MRGenericMessageProtobuf)genericMessage
{
  return self->_genericMessage;
}

- (void)setGenericMessage:(id)a3
{
  objc_storeStrong((id *)&self->_genericMessage, a3);
}

- (_MRSendPackedVirtualTouchEventMessageProtobuf)sendPackedVirtualTouchEventMessage
{
  return self->_sendPackedVirtualTouchEventMessage;
}

- (void)setSendPackedVirtualTouchEventMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sendPackedVirtualTouchEventMessage, a3);
}

- (_MRSendLyricsEventMessageProtobuf)sendLyricsEventMessage
{
  return self->_sendLyricsEventMessage;
}

- (void)setSendLyricsEventMessage:(id)a3
{
  objc_storeStrong((id *)&self->_sendLyricsEventMessage, a3);
}

- (_MRSetNowPlayingClientMessageProtobuf)setNowPlayingClientMessage
{
  return self->_setNowPlayingClientMessage;
}

- (void)setSetNowPlayingClientMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setNowPlayingClientMessage, a3);
}

- (_MRSetNowPlayingPlayerMessageProtobuf)setNowPlayingPlayerMessage
{
  return self->_setNowPlayingPlayerMessage;
}

- (void)setSetNowPlayingPlayerMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setNowPlayingPlayerMessage, a3);
}

- (_MRAVModifyOutputContextRequestProtobuf)modifyOutputContextRequestMessage
{
  return self->_modifyOutputContextRequestMessage;
}

- (void)setModifyOutputContextRequestMessage:(id)a3
{
  objc_storeStrong((id *)&self->_modifyOutputContextRequestMessage, a3);
}

- (_MRRemoveClientMessageProtobuf)removeClientMessage
{
  return self->_removeClientMessage;
}

- (void)setRemoveClientMessage:(id)a3
{
  objc_storeStrong((id *)&self->_removeClientMessage, a3);
}

- (_MRRemovePlayerMessageProtobuf)removePlayerMessage
{
  return self->_removePlayerMessage;
}

- (void)setRemovePlayerMessage:(id)a3
{
  objc_storeStrong((id *)&self->_removePlayerMessage, a3);
}

- (_MRUpdateClientMessageProtobuf)updateClientMessage
{
  return self->_updateClientMessage;
}

- (void)setUpdateClientMessage:(id)a3
{
  objc_storeStrong((id *)&self->_updateClientMessage, a3);
}

- (_MRUpdateContentItemArtworkMessageProtobuf)updateContentItemArtworkMessage
{
  return self->_updateContentItemArtworkMessage;
}

- (void)setUpdateContentItemArtworkMessage:(id)a3
{
  objc_storeStrong((id *)&self->_updateContentItemArtworkMessage, a3);
}

- (_MRUpdatePlayerMessageProtobuf)updatePlayerMessage
{
  return self->_updatePlayerMessage;
}

- (void)setUpdatePlayerMessage:(id)a3
{
  objc_storeStrong((id *)&self->_updatePlayerMessage, a3);
}

- (_MRPromptForRouteAuthorizationMessageProtobuf)promptForRouteAuthorizationMessage
{
  return self->_promptForRouteAuthorizationMessage;
}

- (void)setPromptForRouteAuthorizationMessage:(id)a3
{
  objc_storeStrong((id *)&self->_promptForRouteAuthorizationMessage, a3);
}

- (_MRPromptForRouteAuthorizationResponseMessageProtobuf)promptForRouteAuthorizationResponseMessage
{
  return self->_promptForRouteAuthorizationResponseMessage;
}

- (void)setPromptForRouteAuthorizationResponseMessage:(id)a3
{
  objc_storeStrong((id *)&self->_promptForRouteAuthorizationResponseMessage, a3);
}

- (_MRPresentRouteAuthorizationStatusMessageProtobuf)presentRouteAuthorizationStatusMessage
{
  return self->_presentRouteAuthorizationStatusMessage;
}

- (void)setPresentRouteAuthorizationStatusMessage:(id)a3
{
  objc_storeStrong((id *)&self->_presentRouteAuthorizationStatusMessage, a3);
}

- (_MRGetVolumeControlCapabilitiesMessageProtobuf)getVolumeControlCapabilitiesMessage
{
  return self->_getVolumeControlCapabilitiesMessage;
}

- (void)setGetVolumeControlCapabilitiesMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getVolumeControlCapabilitiesMessage, a3);
}

- (_MRGetVolumeControlCapabilitiesResultMessageProtobuf)getVolumeControlCapabilitiesResultMessage
{
  return self->_getVolumeControlCapabilitiesResultMessage;
}

- (void)setGetVolumeControlCapabilitiesResultMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getVolumeControlCapabilitiesResultMessage, a3);
}

- (_MRVolumeControlCapabilitiesDidChangeMessageProtobuf)volumeControlCapabilitiesDidChangeMessage
{
  return self->_volumeControlCapabilitiesDidChangeMessage;
}

- (void)setVolumeControlCapabilitiesDidChangeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_volumeControlCapabilitiesDidChangeMessage, a3);
}

- (_MRUpdateOutputDevicesMessageProtobuf)updateOutputDevicesMessage
{
  return self->_updateOutputDevicesMessage;
}

- (void)setUpdateOutputDevicesMessage:(id)a3
{
  objc_storeStrong((id *)&self->_updateOutputDevicesMessage, a3);
}

- (_MRRemoveOutputDevicesMessageProtobuf)removeOutputDevicesMessage
{
  return self->_removeOutputDevicesMessage;
}

- (void)setRemoveOutputDevicesMessage:(id)a3
{
  objc_storeStrong((id *)&self->_removeOutputDevicesMessage, a3);
}

- (_MRRemoteTextInputMessageProtobuf)remoteTextInputMessage
{
  return self->_remoteTextInputMessage;
}

- (void)setRemoteTextInputMessage:(id)a3
{
  objc_storeStrong((id *)&self->_remoteTextInputMessage, a3);
}

- (_MRGetRemoteTextInputSessionProtobuf)getRemoteTextInputSessionMessage
{
  return self->_getRemoteTextInputSessionMessage;
}

- (void)setGetRemoteTextInputSessionMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getRemoteTextInputSessionMessage, a3);
}

- (_MRPlaybackSessionRequestMessageProtobuf)playbackSessionRequestMessage
{
  return self->_playbackSessionRequestMessage;
}

- (void)setPlaybackSessionRequestMessage:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionRequestMessage, a3);
}

- (_MRPlaybackSessionResponseMessageProtobuf)playbackSessionResponseMessage
{
  return self->_playbackSessionResponseMessage;
}

- (void)setPlaybackSessionResponseMessage:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionResponseMessage, a3);
}

- (_MRPlaybackSessionMigrateRequestMessageProtobuf)playbackSessionMigrateRequestMessage
{
  return self->_playbackSessionMigrateRequestMessage;
}

- (void)setPlaybackSessionMigrateRequestMessage:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionMigrateRequestMessage, a3);
}

- (_MRPlaybackSessionMigrateResponseMessageProtobuf)playbackSessionMigrateResponseMessage
{
  return self->_playbackSessionMigrateResponseMessage;
}

- (void)setPlaybackSessionMigrateResponseMessage:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionMigrateResponseMessage, a3);
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_errorDescription, a3);
}

- (_MRPlaybackSessionMigrateBeginMessageProtobuf)playbackSessionMigrateBeginMessage
{
  return self->_playbackSessionMigrateBeginMessage;
}

- (void)setPlaybackSessionMigrateBeginMessage:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionMigrateBeginMessage, a3);
}

- (_MRPlaybackSessionMigrateEndMessageProtobuf)playbackSessionMigrateEndMessage
{
  return self->_playbackSessionMigrateEndMessage;
}

- (void)setPlaybackSessionMigrateEndMessage:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionMigrateEndMessage, a3);
}

- (_MRUpdateActiveSystemEndpointMessageProtobuf)updateActiveSystemEndpointMessage
{
  return self->_updateActiveSystemEndpointMessage;
}

- (void)setUpdateActiveSystemEndpointMessage:(id)a3
{
  objc_storeStrong((id *)&self->_updateActiveSystemEndpointMessage, a3);
}

- (_MRSetDiscoveryModeProtobufMessage)discoveryModeMessage
{
  return self->_discoveryModeMessage;
}

- (void)setDiscoveryModeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryModeMessage, a3);
}

- (_MRUpdateEndpointsMessageProtobuf)updateEndpointsMessage
{
  return self->_updateEndpointsMessage;
}

- (void)setUpdateEndpointsMessage:(id)a3
{
  objc_storeStrong((id *)&self->_updateEndpointsMessage, a3);
}

- (_MRRemoveEndpointsMessageProtobuf)removeEndpointsMessage
{
  return self->_removeEndpointsMessage;
}

- (void)setRemoveEndpointsMessage:(id)a3
{
  objc_storeStrong((id *)&self->_removeEndpointsMessage, a3);
}

- (_MRPlayerClientPropertiesMessageProtobuf)playerClientPropertiesMessage
{
  return self->_playerClientPropertiesMessage;
}

- (void)setPlayerClientPropertiesMessage:(id)a3
{
  objc_storeStrong((id *)&self->_playerClientPropertiesMessage, a3);
}

- (_MROriginClientPropertiesMessageProtobuf)originClientPropertiesMessage
{
  return self->_originClientPropertiesMessage;
}

- (void)setOriginClientPropertiesMessage:(id)a3
{
  objc_storeStrong((id *)&self->_originClientPropertiesMessage, a3);
}

- (_MRAudioFadeMessageProtobuf)audioFadeMessage
{
  return self->_audioFadeMessage;
}

- (void)setAudioFadeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_audioFadeMessage, a3);
}

- (_MRAudioFadeResponseMessageProtobuf)audioFadeResponseMessage
{
  return self->_audioFadeResponseMessage;
}

- (void)setAudioFadeResponseMessage:(id)a3
{
  objc_storeStrong((id *)&self->_audioFadeResponseMessage, a3);
}

- (_MRDiscoveryUpdateEndpointsProtobufMessage)discoveryUpdateEndpointsMessage
{
  return self->_discoveryUpdateEndpointsMessage;
}

- (void)setDiscoveryUpdateEndpointsMessage:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryUpdateEndpointsMessage, a3);
}

- (_MRDiscoveryUpdateOutputDevicesProtobufMessage)discoveryUpdateOutputDevicesMessage
{
  return self->_discoveryUpdateOutputDevicesMessage;
}

- (void)setDiscoveryUpdateOutputDevicesMessage:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryUpdateOutputDevicesMessage, a3);
}

- (_MRSetListeningModeMessageProtobuf)setListeningModeMessage
{
  return self->_setListeningModeMessage;
}

- (void)setSetListeningModeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setListeningModeMessage, a3);
}

- (_MRConfigureConnectionMessageProtobuf)configureConnectionMessage
{
  return self->_configureConnectionMessage;
}

- (void)setConfigureConnectionMessage:(id)a3
{
  objc_storeStrong((id *)&self->_configureConnectionMessage, a3);
}

- (_MRCreateHostedEndpointRequestProtobuf)createHostedEndpointRequest
{
  return self->_createHostedEndpointRequest;
}

- (void)setCreateHostedEndpointRequest:(id)a3
{
  objc_storeStrong((id *)&self->_createHostedEndpointRequest, a3);
}

- (_MRCreateHostedEndpointResponseProtobuf)createHostedEndpointResponse
{
  return self->_createHostedEndpointResponse;
}

- (void)setCreateHostedEndpointResponse:(id)a3
{
  objc_storeStrong((id *)&self->_createHostedEndpointResponse, a3);
}

- (_MRAdjustVolumeMessageProtobuf)adjustVolumeMessage
{
  return self->_adjustVolumeMessage;
}

- (void)setAdjustVolumeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_adjustVolumeMessage, a3);
}

- (_MRGetVolumeMutedMessageProtobuf)getVolumeMutedMessage
{
  return self->_getVolumeMutedMessage;
}

- (void)setGetVolumeMutedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_getVolumeMutedMessage, a3);
}

- (_MRSetVolumeMutedMessageProtobuf)setVolumeMutedMessage
{
  return self->_setVolumeMutedMessage;
}

- (void)setSetVolumeMutedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setVolumeMutedMessage, a3);
}

- (_MRVolumeMutedDidChangeMessageProtobuf)volumeMutedDidChangeMessage
{
  return self->_volumeMutedDidChangeMessage;
}

- (void)setVolumeMutedDidChangeMessage:(id)a3
{
  objc_storeStrong((id *)&self->_volumeMutedDidChangeMessage, a3);
}

- (_MRSetConversationDetectionEnabledMessageProtobuf)setConversationDetectionEnabledMessage
{
  return self->_setConversationDetectionEnabledMessage;
}

- (void)setSetConversationDetectionEnabledMessage:(id)a3
{
  objc_storeStrong((id *)&self->_setConversationDetectionEnabledMessage, a3);
}

- (_MRPlayerClientParticipantsUpdateMessageProtobuf)playerClientParticipantsUpdateMessage
{
  return self->_playerClientParticipantsUpdateMessage;
}

- (void)setPlayerClientParticipantsUpdateMessage:(id)a3
{
  objc_storeStrong((id *)&self->_playerClientParticipantsUpdateMessage, a3);
}

- (_MRRequestGroupSessionMessageProtobuf)requestGroupSessionMessage
{
  return self->_requestGroupSessionMessage;
}

- (void)setRequestGroupSessionMessage:(id)a3
{
  objc_storeStrong((id *)&self->_requestGroupSessionMessage, a3);
}

@end
