@implementation MRTelevisionDevice

- (id)currentClientUpdatesConfigMessage
{
  void *v3;
  _BOOL8 v4;
  void *v5;

  -[MRTelevisionDevice textInputCallback](self, "textInputCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[MRTelevisionDevice rtiCallback](self, "rtiCallback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return -[MRClientUpdatesConfigMessage initWithNowPlayingUpdates:artworkUpdates:volumeUpdates:keyboardUpdates:outputDeviceUpdates:systemEndpointUpdates:subscribedPlayerPaths:]([MRClientUpdatesConfigMessage alloc], "initWithNowPlayingUpdates:artworkUpdates:volumeUpdates:keyboardUpdates:outputDeviceUpdates:systemEndpointUpdates:subscribedPlayerPaths:", -[MRExternalDevice wantsNowPlayingNotifications](self, "wantsNowPlayingNotifications"), -[MRExternalDevice wantsNowPlayingArtworkNotifications](self, "wantsNowPlayingArtworkNotifications"), -[MRExternalDevice wantsVolumeNotifications](self, "wantsVolumeNotifications"), v4, -[MRExternalDevice wantsOutputDeviceNotifications](self, "wantsOutputDeviceNotifications"), -[MRExternalDevice wantsSystemEndpointNotifications](self, "wantsSystemEndpointNotifications"), 0);
}

- (BOOL)hiliteMode
{
  return self->_hiliteMode;
}

- (id)gameControllerInputModeCallback
{
  return self->_gameControllerInputModeCallback;
}

- (void)setGameControllerInputModeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unsigned)gameControllerInputMode
{
  return self->_gameControllerInputMode;
}

- (OS_dispatch_queue)gameControllerInputModeCallbackQueue
{
  return self->_gameControllerInputModeCallbackQueue;
}

- (void)setGameControllerInputModeCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_gameControllerInputModeCallbackQueue, a3);
}

- (id)gameControllerPropertiesCallback
{
  return self->_gameControllerPropertiesCallback;
}

- (void)setGameControllerPropertiesCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (OS_dispatch_queue)gameControllerPropertiesCallbackQueue
{
  return self->_gameControllerPropertiesCallbackQueue;
}

- (void)setGameControllerPropertiesCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_gameControllerPropertiesCallbackQueue, a3);
}

- (id)recordingStateCallback
{
  return self->_recordingStateCallback;
}

- (void)setRecordingStateCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (OS_dispatch_queue)recordingStateCallbackQueue
{
  return self->_recordingStateCallbackQueue;
}

- (void)setRecordingStateCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recordingStateCallbackQueue, a3);
}

- (id)textInputCallback
{
  return self->_textInputCallback;
}

- (void)setTextInputCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (OS_dispatch_queue)textInputCallbackQueue
{
  return self->_textInputCallbackQueue;
}

- (void)setTextInputCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_textInputCallbackQueue, a3);
}

- (id)rtiCallback
{
  return self->_rtiCallback;
}

- (void)setRtiCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (OS_dispatch_queue)rtiCallbackQueue
{
  return self->_rtiCallbackQueue;
}

- (void)setRtiCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_rtiCallbackQueue, a3);
}

- (RTIInputSystemSourceSession)rtiSourceSession
{
  return self->_rtiSourceSession;
}

- (void)setRtiSourceSession:(id)a3
{
  objc_storeStrong((id *)&self->_rtiSourceSession, a3);
}

- (id)hiliteModeCallback
{
  return self->_hiliteModeCallback;
}

- (void)setHiliteModeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (OS_dispatch_queue)hiliteModeCallbackQueue
{
  return self->_hiliteModeCallbackQueue;
}

- (void)setHiliteModeCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_hiliteModeCallbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiliteModeCallbackQueue, 0);
  objc_storeStrong(&self->_hiliteModeCallback, 0);
  objc_storeStrong((id *)&self->_rtiSourceSession, 0);
  objc_storeStrong((id *)&self->_rtiCallbackQueue, 0);
  objc_storeStrong(&self->_rtiCallback, 0);
  objc_storeStrong((id *)&self->_textInputCallbackQueue, 0);
  objc_storeStrong(&self->_textInputCallback, 0);
  objc_storeStrong((id *)&self->_recordingStateCallbackQueue, 0);
  objc_storeStrong(&self->_recordingStateCallback, 0);
  objc_storeStrong((id *)&self->_gameControllerPropertiesCallbackQueue, 0);
  objc_storeStrong(&self->_gameControllerPropertiesCallback, 0);
  objc_storeStrong((id *)&self->_gameControllerInputModeCallbackQueue, 0);
  objc_storeStrong(&self->_gameControllerInputModeCallback, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
