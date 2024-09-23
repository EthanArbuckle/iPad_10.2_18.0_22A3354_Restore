@implementation MRExternalDevice

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRExternalDevice;
  return -[MRExternalDevice init](&v3, sel_init);
}

- (NSArray)subscribedPlayerPaths
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice subscribedPlayerPaths]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)setSubscribedPlayerPaths:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setSubscribedPlayerPaths:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (NSString)name
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice name]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (NSString)hostName
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice hostName]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (int64_t)port
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice port]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (NSString)uid
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice uid]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (MROrigin)customOrigin
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice customOrigin]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (MRDeviceInfo)deviceInfo
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice deviceInfo]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (MRSupportedProtocolMessages)supportedMessages
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice supportedMessages]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (MRGroupSessionToken)groupSessionToken
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice groupSessionToken]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (BOOL)wantsNowPlayingNotifications
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice wantsNowPlayingNotifications]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)setWantsNowPlayingNotifications:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setWantsNowPlayingNotifications:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)wantsNowPlayingArtworkNotifications
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice wantsNowPlayingArtworkNotifications]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)setWantsNowPlayingArtworkNotifications:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setWantsNowPlayingArtworkNotifications:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)wantsVolumeNotifications
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice wantsVolumeNotifications]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)setWantsVolumeNotifications:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setWantsVolumeNotifications:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)wantsOutputDeviceNotifications
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice wantsOutputDeviceNotifications]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)setWantsOutputDeviceNotifications:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setWantsOutputDeviceNotifications:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)wantsSystemEndpointNotifications
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice wantsSystemEndpointNotifications]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)setWantsSystemEndpointNotifications:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setWantsSystemEndpointNotifications:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (BOOL)isPaired
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice isPaired]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (BOOL)isUsingSystemPairing
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice isUsingSystemPairing]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)disconnect:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice disconnect:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)setPairingCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setPairingCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setConnectionStateCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setNameCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setNameCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setPairingAllowedCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setPairingAllowedCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setCustomDataCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setCustomDataCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setVolumeCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setVolumeCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setOutputDevicesUpdatedCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setOutputDevicesRemovedCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setVolumeChangedCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setVolumeControlCapabilitiesCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setVolumeMutedChangedCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setDeviceInfoChangedCallback:withQueue:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice removeFromParentGroup:queue:completion:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice requestGroupSessionWithDetails:queue:completion:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice outputDeviceVolumeControlCapabilities:queue:completion:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice outputDeviceVolume:queue:completion:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  MRRequestDetails *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v14 = -[MRRequestDetails initWithName:requestID:reason:]([MRRequestDetails alloc], "initWithName:requestID:reason:", CFSTR("setOutputDeviceVolume"), 0, CFSTR("LegacyAPI"));
  *(float *)&v13 = a3;
  -[MRExternalDevice setOutputDeviceVolume:outputDeviceUID:details:queue:completion:](self, "setOutputDeviceVolume:outputDeviceUID:details:queue:completion:", v12, v14, v11, v10, v13);

}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0C99DA0];
  v15 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setOutputDeviceVolume:outputDeviceUID:details:queue:completion:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0C99DA0];
  v15 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice adjustOutputDeviceVolume:outputDeviceUID:details:queue:completion:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0C99DA0];
  v15 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice muteOutputDeviceVolume:outputDeviceUID:details:queue:completion:]");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v17);
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0C99DA0];
  v14 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setListeningMode:outputDeviceUID:queue:completion:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0C99DA0];
  v12 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setConversationDetectionEnabled:outputDeviceUID:queue:completion:]");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice modifyTopologyWithRequest:withReplyQueue:completion:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice createHostedEndpointWithOutputDeviceUIDs:queue:completion:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)sendButtonEvent:(_MRHIDButtonEvent)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), *(_QWORD *)&a3.var2, "-[MRExternalDevice sendButtonEvent:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)sendCustomData:(id)a3 withName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice sendCustomData:withName:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice ping:callback:withQueue:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (id)errorForCurrentState
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice errorForCurrentState]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (id)currentClientUpdatesConfigMessage
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice currentClientUpdatesConfigMessage]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)sendClientUpdatesConfigMessage
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice sendClientUpdatesConfigMessage]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (void)connectWithOptions:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v3 = *(_QWORD *)&a3;
  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("MRExternalDeviceConnectionReasonUserInfoKey");
  v7[0] = CFSTR("Deprecated");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRExternalDevice connectWithOptions:userInfo:](self, "connectWithOptions:userInfo:", v3, v5);

}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4
{
  -[MRExternalDevice connectWithOptions:userInfo:completion:](self, "connectWithOptions:userInfo:completion:", *(_QWORD *)&a3, a4, 0);
}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice connectWithOptions:userInfo:completion:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (BOOL)supportsIdleDisconnection
{
  return 1;
}

- (BOOL)supportsExternalDiscovery
{
  void *v2;
  char v3;

  -[MRExternalDevice supportedMessages](self, "supportedMessages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSupported:", 109);

  return v3;
}

- (BOOL)isConnected
{
  return -[MRExternalDevice connectionState](self, "connectionState") == 2;
}

- (id)registerDiscoveryTokenForConfiguration:(id)a3
{
  id v4;
  void *v5;
  MRExternalDevice *v6;
  NSMutableDictionary *discoveryConfigurations;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  discoveryConfigurations = v6->_discoveryConfigurations;
  if (!discoveryConfigurations)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = v6->_discoveryConfigurations;
    v6->_discoveryConfigurations = v8;

    discoveryConfigurations = v6->_discoveryConfigurations;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveryConfigurations, "setObject:forKeyedSubscript:", v4, v5);
  objc_sync_exit(v6);

  return v5;
}

- (void)setDiscoveryMode:(unsigned int)a3 forToken:(id)a4
{
  uint64_t v4;
  MRExternalDevice *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *discoveryModes;
  void *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v11 = a4;
  v6 = self;
  objc_sync_enter(v6);
  if (!v6->_discoveryModes)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    discoveryModes = v6->_discoveryModes;
    v6->_discoveryModes = v7;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_discoveryModes, "setObject:forKeyedSubscript:", v9, v11);

  -[NSMutableDictionary objectForKeyedSubscript:](v6->_discoveryConfigurations, "objectForKeyedSubscript:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRExternalDevice setDiscoveryMode:forConfiguration:](v6, "setDiscoveryMode:forConfiguration:", -[MRExternalDevice _highestDiscoveryModeForConfiguration:]((uint64_t)v6, v10), v10);

  objc_sync_exit(v6);
}

- (uint64_t)_highestDiscoveryModeForConfiguration:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v5 = *(void **)(a1 + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__MRExternalDevice__highestDiscoveryModeForConfiguration___block_invoke;
    v7[3] = &unk_1E30CA0F8;
    v7[4] = a1;
    v8 = v3;
    v9 = &v10;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);
    a1 = *((unsigned int *)v11 + 6);

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is abstract"), "-[MRExternalDevice setDiscoveryMode:forConfiguration:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)setDiscoveryOutputDevicesChangedCallback:(id)a3 forToken:(id)a4
{
  id v6;
  MRExternalDevice *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *discoveryOutputDevicesCallbacks;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = v13;
  if (!v7->_discoveryOutputDevicesCallbacks)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    discoveryOutputDevicesCallbacks = v7->_discoveryOutputDevicesCallbacks;
    v7->_discoveryOutputDevicesCallbacks = v9;

    v8 = v13;
  }
  v11 = (void *)objc_msgSend(v8, "copy");
  v12 = (void *)MEMORY[0x194036C44]();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_discoveryOutputDevicesCallbacks, "setObject:forKeyedSubscript:", v12, v6);

  objc_sync_exit(v7);
}

- (void)unregisterDiscoveryToken:(id)a3
{
  MRExternalDevice *v4;
  id v5;

  v5 = a3;
  -[MRExternalDevice setDiscoveryMode:forToken:](self, "setDiscoveryMode:forToken:", 0, v5);
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_discoveryOutputDevicesCallbacks, "setObject:forKeyedSubscript:", 0, v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_discoveryConfigurations, "setObject:forKeyedSubscript:", 0, v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_discoveryModes, "setObject:forKeyedSubscript:", 0, v5);
  objc_sync_exit(v4);

}

- (void)notifyDiscoveryOutputDevicesChanged:(id)a3 forConfiguration:(id)a4
{
  id v6;
  id v7;
  id v8;
  MRExternalDevice *v9;
  NSMutableDictionary *discoveryOutputDevicesCallbacks;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = self;
  objc_sync_enter(v9);
  discoveryOutputDevicesCallbacks = v9->_discoveryOutputDevicesCallbacks;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__MRExternalDevice_notifyDiscoveryOutputDevicesChanged_forConfiguration___block_invoke;
  v21[3] = &unk_1E30CA0A8;
  v21[4] = v9;
  v11 = v7;
  v22 = v11;
  v12 = v8;
  v23 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoveryOutputDevicesCallbacks, "enumerateKeysAndObjectsUsingBlock:", v21);

  objc_sync_exit(v9);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16));
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v14);
  }

}

void __73__MRExternalDevice_notifyDiscoveryOutputDevicesChanged_forConfiguration___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = *(void **)(a1[4] + 16);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "intValue");
  if (objc_msgSend(v7, "isEqual:", a1[5]))
    v10 = v9 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = (void *)a1[6];
    v12 = (void *)MEMORY[0x194036C44](v13);
    objc_msgSend(v11, "addObject:", v12);

  }
}

- (id)discoveryDescription
{
  MRExternalDevice *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  MRExternalDevice *v14;
  id v15;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[NSMutableDictionary allValues](v2->_discoveryConfigurations, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __40__MRExternalDevice_discoveryDescription__block_invoke;
  v13 = &unk_1E30CA0D0;
  v14 = v2;
  v7 = v3;
  v15 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v10);
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "), v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v8;
}

void __40__MRExternalDevice_discoveryDescription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  char v5;
  __CFString *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  LODWORD(v3) = -[MRExternalDevice _highestDiscoveryModeForConfiguration:](v3, v4);
  v5 = objc_msgSend(v4, "features");

  MRMediaRemoteEndpointFeaturesDescription(v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@: %@"), v8, v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

void __58__MRExternalDevice__highestDiscoveryModeForConfiguration___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1[4] + 16);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if (objc_msgSend(v9, "isEqual:", a1[5]))
  {
    v8 = *(_QWORD *)(a1[6] + 8);
    if (v7 > *(_DWORD *)(v8 + 24))
      *(_DWORD *)(v8 + 24) = v7;
  }

}

- (NSArray)personalOutputDevices
{
  return self->_personalOutputDevices;
}

- (BOOL)wantsEndpointChangeNotifications
{
  return self->_wantsEndpointChangeNotifications;
}

- (void)setWantsEndpointChangeNotifications:(BOOL)a3
{
  self->_wantsEndpointChangeNotifications = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (unsigned)connectionState
{
  return self->_connectionState;
}

- (void)setUsingSystemPairing:(BOOL)a3
{
  self->_usingSystemPairing = a3;
}

- (int64_t)connectionRecoveryBehavior
{
  return self->_connectionRecoveryBehavior;
}

- (void)setConnectionRecoveryBehavior:(int64_t)a3
{
  self->_connectionRecoveryBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalOutputDevices, 0);
  objc_storeStrong((id *)&self->_discoveryModes, 0);
  objc_storeStrong((id *)&self->_discoveryConfigurations, 0);
  objc_storeStrong((id *)&self->_discoveryOutputDevicesCallbacks, 0);
}

@end
