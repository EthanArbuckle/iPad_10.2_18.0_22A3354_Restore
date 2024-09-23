@implementation CNChangesNotifier

uint64_t __82__CNChangesNotifier_initWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObserver:notification:", a3, a2);
}

void __92__CNChangesNotifier_sharedNotifierWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 56)), "initWithNotificationWrapper:schedulerProvider:loggerProvider:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)s_sharedNotifier;
  s_sharedNotifier = v1;

}

- (CNChangesNotifier)initWithNotificationWrapper:(id)a3 schedulerProvider:(id)a4 loggerProvider:(id)a5
{
  CNChangeNotifierDistributedCenterWrapper *v8;
  id v9;
  id v10;
  id v11;
  id *v12;
  void *v13;
  uint64_t v14;
  CNChangeNotifierDistributedCenterWrapper *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  CNChangeNotifierDistributedCenterWrapper *v23;
  _QWORD aBlock[4];
  CNChangeNotifierDistributedCenterWrapper *v25;
  objc_super v26;

  v8 = (CNChangeNotifierDistributedCenterWrapper *)a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CNChangesNotifier;
  v11 = -[CNChangesNotifier init](&v26, sel_init);
  if (v11)
  {
    v12 = -[CNChangesNotifierProxy initWithSchedulerProvider:loggerProvider:]((id *)[CNChangesNotifierProxy alloc], v9, v10);
    v13 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v12;

    if (!v8)
      v8 = objc_alloc_init(CNChangeNotifierDistributedCenterWrapper);
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__CNChangesNotifier_initWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke;
    aBlock[3] = &unk_1E29FB8A0;
    v15 = v8;
    v25 = v15;
    v16 = _Block_copy(aBlock);
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __82__CNChangesNotifier_initWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke_2;
    v22[3] = &unk_1E29FB8A0;
    v8 = v15;
    v23 = v8;
    v17 = _Block_copy(v22);
    v18 = (void *)*MEMORY[0x1E0CF5850];
    -[CNChangesNotifierProxy addListenerForNotificationName:registration:removal:](*((_QWORD *)v11 + 1), (void *)*MEMORY[0x1E0CF5850], v16, v17);
    -[CNChangesNotifierProxy forwardNotificationName:asNotificationName:](*((_QWORD *)v11 + 1), v18, CFSTR("CNContactStoreDidChangeNotification"));
    v19 = (void *)*MEMORY[0x1E0CF57F8];
    -[CNChangesNotifierProxy addListenerForNotificationName:registration:removal:](*((_QWORD *)v11 + 1), (void *)*MEMORY[0x1E0CF57F8], v16, v17);
    -[CNChangesNotifierProxy forwardNotificationName:asNotificationName:](*((_QWORD *)v11 + 1), v19, CFSTR("CNContactStoreMeContactDidChangeNotification"));
    -[CNChangesNotifierProxy coalesceNotificationName:](*((_QWORD *)v11 + 1), v18);
    v20 = v11;

  }
  return (CNChangesNotifier *)v11;
}

+ (id)sharedNotifier
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactsLoggerProvider defaultProvider](CNContactsLoggerProvider, "defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharedNotifierWithNotificationWrapper:schedulerProvider:loggerProvider:", 0, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharedNotifierWithNotificationWrapper:(id)a3 schedulerProvider:(id)a4 loggerProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__CNChangesNotifier_sharedNotifierWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke;
  v17[3] = &unk_1E29FB878;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v21 = a1;
  v11 = s_onceToken_0;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  if (v11 != -1)
    dispatch_once(&s_onceToken_0, v17);
  v15 = (id)s_sharedNotifier;

  return v15;
}

uint64_t __82__CNChangesNotifier_initWithNotificationWrapper_schedulerProvider_loggerProvider___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:notification:", a3, a2);
}

- (void)dealloc
{
  objc_super v3;

  -[CNChangesNotifierProxy removeAllRegisteredNotificationSources]((uint64_t)self->_notifierProxy);
  v3.receiver = self;
  v3.super_class = (Class)CNChangesNotifier;
  -[CNChangesNotifier dealloc](&v3, sel_dealloc);
}

- (void)willSaveChanges
{
  -[CNChangesNotifierProxy supressNotificationName:]((uint64_t)self->_notifierProxy, CFSTR("CNContactStoreDidChangeNotification"));
}

- (void)didSaveChangesSuccessfully:(BOOL)a3 fromContactStore:(id)a4 requestIdentifier:(id)a5
{
  if (a3)
    -[CNChangesNotifierProxy postNotificationName:fromSender:saveIdentifier:isFromExternalProcess:](self->_notifierProxy, CFSTR("CNContactStoreDidChangeNotification"), a4, a5, 0);
  -[CNChangesNotifierProxy stopSupressionOfNotificationName:]((uint64_t)self->_notifierProxy, CFSTR("CNContactStoreDidChangeNotification"));
}

- (void)didChangeMeContactSuccessfully:(BOOL)a3 fromContactStore:(id)a4 requestIdentifier:(id)a5
{
  if (a3)
    -[CNChangesNotifierProxy postNotificationName:fromSender:saveIdentifier:isFromExternalProcess:](self->_notifierProxy, CFSTR("CNContactStoreMeContactDidChangeNotification"), a4, a5, 0);
}

- (void)waitForCurrentTasksToFinish
{
  id v2;

  -[CNChangesNotifier notifierProxy](self, "notifierProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitForCurrentTasksToFinish");

}

+ (void)flushSharedNotifier
{
  void *v2;

  v2 = (void *)s_sharedNotifier;
  s_sharedNotifier = 0;

  s_onceToken_0 = 0;
}

- (BOOL)forwardsSelfGeneratedDistributedSaveNotifications
{
  return -[CNChangesNotifierProxy forwardsSelfGeneratedDistributedSaveNotifications](self->_notifierProxy, "forwardsSelfGeneratedDistributedSaveNotifications");
}

- (void)setForwardsSelfGeneratedDistributedSaveNotifications:(BOOL)a3
{
  -[CNChangesNotifierProxy setForwardsSelfGeneratedDistributedSaveNotifications:](self->_notifierProxy, "setForwardsSelfGeneratedDistributedSaveNotifications:", a3);
}

- (void)setExternalNotificationCoalescingDelay:(double)a3
{
  -[CNChangesNotifierProxy setExternalNotificationCoalescingDelay:](self->_notifierProxy, "setExternalNotificationCoalescingDelay:", a3);
}

- (CNChangesNotifierProxy)notifierProxy
{
  return self->_notifierProxy;
}

- (void)setNotifierProxy:(id)a3
{
  objc_storeStrong((id *)&self->_notifierProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifierProxy, 0);
}

@end
