@implementation SGCuratedChangeNotificationsAddressBookListener

- (void)startListening
{
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *notificationQueue;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *notificationCenterToken;
  _QWORD v13[4];
  id v14;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (OS_dispatch_queue *)dispatch_queue_create(v5, v6);
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C96870];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__SGCuratedChangeNotificationsAddressBookListener_startListening__block_invoke;
  v13[3] = &unk_1E7DADE20;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, 0, 0, v13);
  v11 = objc_claimAutoreleasedReturnValue();
  notificationCenterToken = self->_notificationCenterToken;
  self->_notificationCenterToken = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)stopListening
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_notificationCenterToken);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenterToken, 0);
}

void __65__SGCuratedChangeNotificationsAddressBookListener_startListening__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject **v4;
  _QWORD block[5];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[3];
    block[1] = 3221225472;
    block[2] = __65__SGCuratedChangeNotificationsAddressBookListener_startListening__block_invoke_2;
    block[3] = &unk_1E7DB56F0;
    block[4] = v2;
    v4 = v2;
    block[0] = MEMORY[0x1E0C809B0];
    dispatch_async_and_wait(v3, block);
    v2 = v4;
  }

}

uint64_t __65__SGCuratedChangeNotificationsAddressBookListener_startListening__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fire");
}

@end
