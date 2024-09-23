@implementation ICClearOnNotificationLRUCache

- (void)setNotificationToken:(id)a3
{
  objc_storeStrong((id *)&self->_notificationToken, a3);
}

- (ICClearOnNotificationLRUCache)initWithMaxSize:(unint64_t)a3 notificationName:(id)a4
{
  id v6;
  ICClearOnNotificationLRUCache *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICClearOnNotificationLRUCache;
  v7 = -[ICLRUCache initWithMaxSize:](&v17, sel_initWithMaxSize_, a3);
  if (v7)
  {
    objc_initWeak(&location, v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __66__ICClearOnNotificationLRUCache_initWithMaxSize_notificationName___block_invoke;
    v14 = &unk_1EA824648;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICClearOnNotificationLRUCache setNotificationToken:](v7, "setNotificationToken:", v9, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __66__ICClearOnNotificationLRUCache_initWithMaxSize_notificationName___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_msgSend(v5, "removeAllObjects");
    objc_sync_exit(v5);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("ICCachedClearedOnChangedNotification"), v5);

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[ICClearOnNotificationLRUCache notificationToken](self, "notificationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICClearOnNotificationLRUCache notificationToken](self, "notificationToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

    -[ICClearOnNotificationLRUCache setNotificationToken:](self, "setNotificationToken:", 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)ICClearOnNotificationLRUCache;
  -[ICClearOnNotificationLRUCache dealloc](&v6, sel_dealloc);
}

- (NSObject)notificationToken
{
  return self->_notificationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationToken, 0);
}

@end
