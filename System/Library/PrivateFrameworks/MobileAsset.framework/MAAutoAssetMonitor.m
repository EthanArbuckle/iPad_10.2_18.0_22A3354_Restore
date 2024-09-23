@implementation MAAutoAssetMonitor

- (id)initForClientName:(id)a3 forAssetSelector:(id)a4 error:(id *)a5 notifyingStatusChanges:(id)a6
{
  return -[MAAutoAssetMonitor initForClientName:forAssetSelector:notifyingFromQueue:error:notifyingStatusChanges:](self, "initForClientName:forAssetSelector:notifyingFromQueue:error:notifyingStatusChanges:", a3, a4, 0, a5, a6);
}

- (id)initForClientName:(id)a3 forAssetSelector:(id)a4 notifyingFromQueue:(id)a5 error:(id *)a6 notifyingStatusChanges:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MAAutoAssetMonitor *v17;
  MAAutoAssetMonitor *v18;
  uint64_t v19;
  id statusChangeNotificationBlock;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *notificationDispatchQueue;
  MAAutoAssetMonitor *v23;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MAAutoAssetMonitor;
  v17 = -[MAAutoAssetMonitor init](&v25, sel_init);
  v18 = v17;
  if (!v17)
  {
LABEL_8:
    v23 = v18;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v17->_autoAssetClientName, a3);
  objc_storeStrong((id *)&v18->_assetSelector, a4);
  v19 = MEMORY[0x1AF44EFD8](v16);
  statusChangeNotificationBlock = v18->_statusChangeNotificationBlock;
  v18->_statusChangeNotificationBlock = (id)v19;

  if (v15)
  {
    v21 = (OS_dispatch_queue *)v15;
  }
  else
  {
    +[MAAutoAssetMonitor defaultDispatchQueue](MAAutoAssetMonitor, "defaultDispatchQueue");
    v21 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  }
  notificationDispatchQueue = v18->_notificationDispatchQueue;
  v18->_notificationDispatchQueue = v21;

  if (v18->_notificationDispatchQueue)
  {
    if (a6)
      *a6 = 0;
    goto LABEL_8;
  }
  if (a6)
  {
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6101, CFSTR("auto-monitor(defaultDispatchQueue)"), 0, CFSTR("unable to assign notification dispatch queue"));
    v23 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
LABEL_9:

  return v23;
}

- (MAAutoAssetMonitor)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MAAutoAssetMonitor;
  return -[MAAutoAssetMonitor init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)registerForNotifications:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__MAAutoAssetMonitor_registerForNotifications___block_invoke;
  v7[3] = &unk_1E5D5CD38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __47__MAAutoAssetMonitor_registerForNotifications___block_invoke(uint64_t a1)
{
  MAAutoAssetNotifications *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6801, CFSTR("auto-monitor(registerForNotifications)"), 0, CFSTR("MAAutoAsset-under-development"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = objc_alloc_init(MAAutoAssetNotifications);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, MAAutoAssetNotifications *, id))(v3 + 16))(v3, v4, v2, v5);

  }
}

- (id)registerForNotificationsSync
{
  return +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6801, CFSTR("auto-monitor(registerForNotificationsSync)"), 0, CFSTR("MAAutoAsset-under-development"));
}

- (void)registerForNotifications:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__MAAutoAssetMonitor_registerForNotifications_completion___block_invoke;
  v8[3] = &unk_1E5D5CD38;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __58__MAAutoAssetMonitor_registerForNotifications_completion___block_invoke(uint64_t a1)
{
  MAAutoAssetNotifications *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6801, CFSTR("auto-monitor(registerForNotifications:)"), 0, CFSTR("MAAutoAsset-under-development"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = objc_alloc_init(MAAutoAssetNotifications);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, MAAutoAssetNotifications *, id))(v3 + 16))(v3, v4, v2, v5);

  }
}

- (id)registerForNotificationsSync:(id)a3
{
  return +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6801, CFSTR("auto-monitor(registerForNotificationsSync:)"), 0, CFSTR("MAAutoAsset-under-development"));
}

- (void)cancelRegistration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__MAAutoAssetMonitor_cancelRegistration___block_invoke;
  v7[3] = &unk_1E5D5CD38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __41__MAAutoAssetMonitor_cancelRegistration___block_invoke(uint64_t a1)
{
  MAAutoAssetNotifications *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6801, CFSTR("auto-monitor(cancelRegistration:)"), 0, CFSTR("MAAutoAsset-under-development"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = objc_alloc_init(MAAutoAssetNotifications);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, MAAutoAssetNotifications *, id))(v3 + 16))(v3, v4, v2, v5);

  }
}

- (id)cancelRegistrationSync
{
  return +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:](MAAutoAssetError, "buildError:fromOperation:underlyingError:withDescription:", 6801, CFSTR("auto-monitor(cancelRegistrationSync)"), 0, CFSTR("MAAutoAsset-under-development"));
}

- (id)description
{
  return CFSTR("MAAutoAssetMonitor SPI:description not-yet-implemented [see rdar://84676752]");
}

- (id)summary
{
  return CFSTR("MAAutoAssetMonitor SPI:summary not-yet-implemented [see rdar://84676752]");
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce_0 != -1)
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce_0, &__block_literal_global_3);
  return (id)defaultDispatchQueue_defaultQueue_0;
}

void __42__MAAutoAssetMonitor_defaultDispatchQueue__block_invoke()
{
  const char *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.MobileAsset.framework.autoassetmonitor"), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)defaultDispatchQueue_defaultQueue_0;
  defaultDispatchQueue_defaultQueue_0 = (uint64_t)v1;

}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (id)statusChangeNotificationBlock
{
  return self->_statusChangeNotificationBlock;
}

- (void)setStatusChangeNotificationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)notificationDispatchQueue
{
  return self->_notificationDispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationDispatchQueue, 0);
  objc_storeStrong(&self->_statusChangeNotificationBlock, 0);
  objc_storeStrong((id *)&self->_assetSelector, 0);
  objc_storeStrong((id *)&self->_autoAssetClientName, 0);
}

@end
