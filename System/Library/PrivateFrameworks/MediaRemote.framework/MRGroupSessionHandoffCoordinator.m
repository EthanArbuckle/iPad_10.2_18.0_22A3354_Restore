@implementation MRGroupSessionHandoffCoordinator

- (MRGroupSessionHandoffCoordinator)initWithDelegate:(id)a3
{
  id v4;
  MRGroupSessionHandoffCoordinator *v5;
  MRGroupSessionHandoffCoordinator *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *notificationQueue;
  MRGroupSessionDiscovery *v15;
  MRGroupSessionDiscovery *groupSessionDiscovery;
  uint64_t v17;
  MRNowPlayingController *nowPlayingController;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint8_t v26[16];
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MRGroupSessionHandoffCoordinator;
  v5 = -[MRGroupSessionHandoffCoordinator init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    MRGroupSessionSubsystemGetQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRGroupSessionHandoffCoordinator.serialQueue", v7, v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    MRGroupSessionSubsystemGetNotificationQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create_with_target_V2("com.apple.MediaRemote.MRGroupSessionHandoffCoordinator.notificationQueue", v11, v12);
    notificationQueue = v6->_notificationQueue;
    v6->_notificationQueue = (OS_dispatch_queue *)v13;

    v15 = -[MRGroupSessionDiscovery initWithDelegate:]([MRGroupSessionDiscovery alloc], "initWithDelegate:", v6);
    groupSessionDiscovery = v6->_groupSessionDiscovery;
    v6->_groupSessionDiscovery = v15;

    +[MRNowPlayingController localRouteController](MRNowPlayingController, "localRouteController");
    v17 = objc_claimAutoreleasedReturnValue();
    nowPlayingController = v6->_nowPlayingController;
    v6->_nowPlayingController = (MRNowPlayingController *)v17;

    -[MRNowPlayingController configuration](v6->_nowPlayingController, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWantsChangeCallbacksDuringInitialLoad:", 1);

    -[MRNowPlayingController configuration](v6->_nowPlayingController, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRequestPlaybackState:", 1);

    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingController configuration](v6->_nowPlayingController, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLabel:", v22);

    -[MRNowPlayingController setDelegate:](v6->_nowPlayingController, "setDelegate:", v6);
    -[MRNowPlayingController beginLoadingUpdates](v6->_nowPlayingController, "beginLoadingUpdates");
    _MRLogForCategory(0xCuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionHandoffCoordinator] Begin observing", v26, 2u);
    }

  }
  return v6;
}

- (void)groupSessionDiscovery:(id)a3 discoveredSessionsDidChange:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__MRGroupSessionHandoffCoordinator_groupSessionDiscovery_discoveredSessionsDidChange___block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __86__MRGroupSessionHandoffCoordinator_groupSessionDiscovery_discoveredSessionsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reevaluate");
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MRGroupSessionHandoffCoordinator_controller_playbackStateDidChangeFrom_to___block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __77__MRGroupSessionHandoffCoordinator_controller_playbackStateDidChangeFrom_to___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reevaluate");
}

- (void)controller:(id)a3 playerPathDidChange:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MRGroupSessionHandoffCoordinator_controller_playerPathDidChange___block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __67__MRGroupSessionHandoffCoordinator_controller_playerPathDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reevaluate");
}

- (void)reevaluate
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL4 IsAdvancing;
  void *v8;
  void *v9;
  void *v10;
  NSObject *notificationQueue;
  _QWORD v12[5];
  id v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[MRGroupSessionHandoffCoordinator nowPlayingController](self, "nowPlayingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "response");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "playerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSystemMediaApplication");

  IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing(objc_msgSend(v4, "playbackState"));
  if ((v6 & 1) != 0 || !IsAdvancing)
  {
    -[MRGroupSessionDiscovery discoveredSessions](self->_groupSessionDiscovery, "discoveredSessions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "msv_map:", &__block_literal_global_113);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((-[NSSet isEqual:](self->_handoffSuppressedDevices, "isEqual:", v8) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_handoffSuppressedDevices, v8);
    notificationQueue = self->_notificationQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__MRGroupSessionHandoffCoordinator_reevaluate__block_invoke_2;
    v12[3] = &unk_1E30C5F40;
    v12[4] = self;
    v13 = v8;
    dispatch_async(notificationQueue, v12);

  }
}

MRGroupSessionHandoffDevice *__46__MRGroupSessionHandoffCoordinator_reevaluate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRGroupSessionHandoffDevice *v3;

  v2 = a2;
  v3 = -[MRGroupSessionHandoffDevice initWithDiscoveredSession:]([MRGroupSessionHandoffDevice alloc], "initWithDiscoveredSession:", v2);

  return v3;
}

void __46__MRGroupSessionHandoffCoordinator_reevaluate__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinator:handoffSuppressedDevicesDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSSet)handoffSuppressedDevices
{
  return self->_handoffSuppressedDevices;
}

- (MRGroupSessionHandoffCoordinatorDelegate)delegate
{
  return (MRGroupSessionHandoffCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRGroupSessionDiscovery)groupSessionDiscovery
{
  return self->_groupSessionDiscovery;
}

- (void)setGroupSessionDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_groupSessionDiscovery, a3);
}

- (MRNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingController, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_groupSessionDiscovery, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_handoffSuppressedDevices, 0);
}

@end
