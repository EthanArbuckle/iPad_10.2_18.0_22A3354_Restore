@implementation MRMigrationDevice

+ (id)proactiveDevice
{
  return -[MRMigrationDevice initWithUID:]([MRMigrationDevice alloc], "initWithUID:", CFSTR("proactiveEndpoint"));
}

- (MRMigrationDevice)initWithUID:(id)a3
{
  id v4;
  MRMigrationDevice *v5;
  MRQHONowPlayingController *v6;
  MRQHONowPlayingController *controller;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRMigrationDevice;
  v5 = -[MRMigrationDevice init](&v14, sel_init);
  if (v5)
  {
    v6 = -[MRQHONowPlayingController initWithUID:]([MRQHONowPlayingController alloc], "initWithUID:", v4);
    controller = v5->_controller;
    v5->_controller = v6;

    -[MRQHONowPlayingController setDelegate:](v5->_controller, "setDelegate:", v5);
    v5->_preparedForAirPlay = 0;
    v5->_deviceState = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.MediaRemote.MRMigrationDevice:%@|queue"), v4);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;
  unint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRMigrationDevice uid](self, "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("uid"));

  -[MRMigrationDevice endpoint](self, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("endpoint"));

  -[MRMigrationDevice playerState](self, "playerState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFString *)MRMediaRemoteCopyPlaybackStateDescription(objc_msgSend(v6, "playbackState"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("playbackState"));

  -[MRMigrationDevice playerState](self, "playerState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "playerHasPlayedRecently"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("playerHasPlayedRecently"));

  v10 = -[MRMigrationDevice deviceState](self, "deviceState") - 1;
  if (v10 > 2)
    v11 = CFSTR("NotPrepared");
  else
    v11 = off_1E30C9930[v10];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("deviceState"));
  if (-[MRMigrationDevice preparedForAirPlay](self, "preparedForAirPlay"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("preparedForAirPlay"));
  -[MRMigrationDevice prepareError](self, "prepareError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("prepareError"));

  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(7uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRMigrationDevice uid](self, "uid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRMigrationDevice] [MRMigrationDevice]<%{public}@> Deallocating.", buf, 0xCu);

  }
  v5.receiver = self;
  v5.super_class = (Class)MRMigrationDevice;
  -[MRMigrationDevice dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRMigrationDevice dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return (NSString *)v6;
}

- (NSString)uid
{
  void *v2;
  void *v3;

  -[MRMigrationDevice controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (MRNowPlayingPlayerResponse)playerState
{
  void *v2;
  void *v3;

  -[MRMigrationDevice controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "response");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRNowPlayingPlayerResponse *)v3;
}

- (unint64_t)deviceState
{
  MRMigrationDevice *v2;
  unint64_t deviceState;

  v2 = self;
  objc_sync_enter(v2);
  deviceState = v2->_deviceState;
  objc_sync_exit(v2);

  return deviceState;
}

- (MRAVEndpoint)endpoint
{
  void *v2;
  void *v3;

  -[MRMigrationDevice controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRAVEndpoint *)v3;
}

- (BOOL)preparedForAirPlay
{
  MRMigrationDevice *v2;
  BOOL preparedForAirPlay;

  v2 = self;
  objc_sync_enter(v2);
  preparedForAirPlay = v2->_preparedForAirPlay;
  objc_sync_exit(v2);

  return preparedForAirPlay;
}

- (BOOL)isPrepared
{
  return -[MRMigrationDevice deviceState](self, "deviceState") == 2
      || -[MRMigrationDevice preparedForAirPlay](self, "preparedForAirPlay");
}

- (void)setDeviceState:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MRMigrationDevice uid](self, "uid");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = self->_deviceState - 1;
    if (v8 > 2)
      v9 = CFSTR("NotPrepared");
    else
      v9 = off_1E30C9930[v8];
    if (a3 - 1 > 2)
      v10 = CFSTR("NotPrepared");
    else
      v10 = off_1E30C9930[a3 - 1];
    v11 = 138543874;
    v12 = v6;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRMigrationDevice] <%{public}@> changing state from %@ to %@.", (uint8_t *)&v11, 0x20u);

  }
  self->_deviceState = a3;
}

- (void)prepare
{
  MRMigrationDevice *v2;
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!-[MRMigrationDevice deviceState](v2, "deviceState"))
  {
    -[MRMigrationDevice setDeviceState:](v2, "setDeviceState:", 1);
    -[MRMigrationDevice controller](v2, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginLoadingUpdates");

    v4 = dispatch_time(0, 2000000000);
    -[MRMigrationDevice queue](v2, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__MRMigrationDevice_prepare__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = v2;
    dispatch_after(v4, v5, block);

  }
  objc_sync_exit(v2);

}

void __28__MRMigrationDevice_prepare__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "_checkIfAirPlayPossible");
}

- (void)_checkIfAirPlayPossible
{
  void *v3;
  char v4;
  MRAVLightweightReconnaissanceSession *v5;
  void *v6;
  void *v7;
  MRAVLightweightReconnaissanceSession *v8;
  _QWORD v9[4];
  MRAVLightweightReconnaissanceSession *v10;
  MRMigrationDevice *v11;

  if (!-[MRMigrationDevice isPrepared](self, "isPrepared"))
  {
    -[MRMigrationDevice uid](self, "uid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("proactiveEndpoint"));

    if ((v4 & 1) == 0)
    {
      v5 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
      -[MRMigrationDevice uid](self, "uid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRMigrationDevice queue](self, "queue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __44__MRMigrationDevice__checkIfAirPlayPossible__block_invoke;
      v9[3] = &unk_1E30C9910;
      v10 = v5;
      v11 = self;
      v8 = v5;
      -[MRAVLightweightReconnaissanceSession searchForOutputDeviceUID:timeout:reason:queue:completion:](v8, "searchForOutputDeviceUID:timeout:reason:queue:completion:", v6, CFSTR("MRProximityProvider AVOD fallback"), v7, v9, 7.0);

    }
  }
}

void __44__MRMigrationDevice__checkIfAirPlayPossible__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_sync_enter(v7);
  v8 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v8, "setPreparedForAirPlay:", 1);
    objc_msgSend(*(id *)(a1 + 40), "setDeviceState:", 2);
  }
  else
  {
    objc_msgSend(v8, "setPreparedForAirPlay:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setDeviceState:", 3);
  }
  objc_sync_exit(v7);

  objc_msgSend(*(id *)(a1 + 40), "_notifyDelegateOfStateChange");
}

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  id v6;
  MRMigrationDevice *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[MRMigrationDevice setDeviceState:](v7, "setDeviceState:", 2);
  -[MRMigrationDevice setPrepareError:](v7, "setPrepareError:", 0);
  objc_sync_exit(v7);

  -[MRMigrationDevice _notifyDelegateOfStateChange](v7, "_notifyDelegateOfStateChange");
  -[MRMigrationDevice _notifyDelegateOfPlayerStateChange](v7, "_notifyDelegateOfPlayerStateChange");

}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  id v6;
  MRMigrationDevice *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (objc_msgSend(v6, "code") == 42)
  {
    -[MRMigrationDevice setDeviceState:](v7, "setDeviceState:", 2);
  }
  else if (!-[MRMigrationDevice preparedForAirPlay](v7, "preparedForAirPlay"))
  {
    -[MRMigrationDevice _checkIfAirPlayPossible](v7, "_checkIfAirPlayPossible");
  }
  -[MRMigrationDevice setPrepareError:](v7, "setPrepareError:", v6);
  objc_sync_exit(v7);

  -[MRMigrationDevice _notifyDelegateOfStateChange](v7, "_notifyDelegateOfStateChange");
}

- (void)controllerWillReloadForInvalidation:(id)a3
{
  MRMigrationDevice *v4;
  id v5;

  v5 = a3;
  if (!-[MRMigrationDevice preparedForAirPlay](self, "preparedForAirPlay"))
  {
    v4 = self;
    objc_sync_enter(v4);
    -[MRMigrationDevice setDeviceState:](v4, "setDeviceState:", 1);
    objc_sync_exit(v4);

    -[MRMigrationDevice _notifyDelegateOfStateChange](v4, "_notifyDelegateOfStateChange");
  }

}

- (void)_notifyDelegateOfStateChange
{
  void *v3;
  char v4;
  NSObject *v5;
  _QWORD block[5];

  -[MRMigrationDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MRMigrationDevice queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MRMigrationDevice__notifyDelegateOfStateChange__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __49__MRMigrationDevice__notifyDelegateOfStateChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device:stateDidChange:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "deviceState"));

}

- (void)_notifyDelegateOfPlayerStateChange
{
  void *v3;
  char v4;
  NSObject *v5;
  _QWORD block[5];

  -[MRMigrationDevice delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MRMigrationDevice queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__MRMigrationDevice__notifyDelegateOfPlayerStateChange__block_invoke;
    block[3] = &unk_1E30C5CA8;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __55__MRMigrationDevice__notifyDelegateOfPlayerStateChange__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "playerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device:playerStateDidChange:", v2, v3);

}

- (NSError)prepareError
{
  return self->_prepareError;
}

- (void)setPrepareError:(id)a3
{
  objc_storeStrong((id *)&self->_prepareError, a3);
}

- (MRMigrationDeviceDelegate)delegate
{
  return (MRMigrationDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRQHONowPlayingController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setPreparedForAirPlay:(BOOL)a3
{
  self->_preparedForAirPlay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prepareError, 0);
}

@end
