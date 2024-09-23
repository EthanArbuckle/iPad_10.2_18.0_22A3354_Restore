@implementation CNAvatarCacheChangeListener

void __54__CNAvatarCacheChangeListener_loadCurrentHistoryToken__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentHistoryToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentHistoryToken:", v2);

}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setCurrentHistoryToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)start
{
  id v3;

  -[CNAvatarCacheChangeListener notificationCenter](self, "notificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_databaseChanged_, *MEMORY[0x1E0C96870], 0);

}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (CNAvatarCacheChangeListener)initWithContactStore:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CNAvatarCacheChangeListener *v9;
  CNAvatarCacheChangeListener *v10;
  uint64_t v11;
  NSNotificationCenter *notificationCenter;
  void *v13;
  uint64_t v14;
  CNScheduler *rawPreprocessor;
  uint64_t v16;
  CNScheduler *preprocessor;
  CNAvatarCacheChangeListener *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CNAvatarCacheChangeListener;
  v9 = -[CNAvatarCacheChangeListener init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v10->_notificationCenter;
    v10->_notificationCenter = (NSNotificationCenter *)v11;

    objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.ui.avatar-cache.notification-preprocessor"));
    rawPreprocessor = v10->_rawPreprocessor;
    v10->_rawPreprocessor = (CNScheduler *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D139C0]), "initWithScheduler:coalescingWindow:", v10->_rawPreprocessor, 5.0);
    preprocessor = v10->_preprocessor;
    v10->_preprocessor = (CNScheduler *)v16;

    -[CNAvatarCacheChangeListener loadCurrentHistoryToken](v10, "loadCurrentHistoryToken");
    v18 = v10;
  }

  return v10;
}

- (void)loadCurrentHistoryToken
{
  void *v3;
  _QWORD v4[5];

  -[CNAvatarCacheChangeListener rawPreprocessor](self, "rawPreprocessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__CNAvatarCacheChangeListener_loadCurrentHistoryToken__block_invoke;
  v4[3] = &unk_1EA6035F0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (CNScheduler)rawPreprocessor
{
  return self->_rawPreprocessor;
}

- (CNAvatarCacheChangeListener)init
{
  CNAvatarCacheChangeListener *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)description
{
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("delegate"), WeakRetained);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)stop
{
  id v3;

  -[CNAvatarCacheChangeListener notificationCenter](self, "notificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

}

- (void)databaseChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[CNAvatarCacheChangeListener makeDatabaseChangedTask](self, "makeDatabaseChangedTask", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCacheChangeListener preprocessor](self, "preprocessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CNAvatarCacheChangeListener_databaseChanged___block_invoke;
  v7[3] = &unk_1EA6035F0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

id __47__CNAvatarCacheChangeListener_databaseChanged___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "run");
}

- (id)makeDatabaseChangedTask
{
  CNAvatarCacheChangeHistoryAnalysisTask *v3;
  void *v4;
  void *v5;
  CNAvatarCacheChangeHistoryAnalysisTask *v6;
  void *v7;
  _QWORD v9[5];

  v3 = [CNAvatarCacheChangeHistoryAnalysisTask alloc];
  -[CNAvatarCacheChangeListener store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCacheChangeListener currentHistoryToken](self, "currentHistoryToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNAvatarCacheChangeHistoryAnalysisTask initWithContactStore:startingToken:](v3, "initWithContactStore:startingToken:", v4, v5);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CNAvatarCacheChangeListener_makeDatabaseChangedTask__block_invoke;
  v9[3] = &unk_1EA604330;
  v9[4] = self;
  -[CNTask flatMap:](v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __54__CNAvatarCacheChangeListener_makeDatabaseChangedTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "currentChangeHistoryToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentHistoryToken:", v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifiersOfAffectedContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "makeReportingTaskWithIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)makeAnalysisTask
{
  void *v3;
  void *v4;
  CNAvatarCacheChangeHistoryAnalysisTask *v5;

  -[CNAvatarCacheChangeListener store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCacheChangeListener currentHistoryToken](self, "currentHistoryToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNAvatarCacheChangeHistoryAnalysisTask initWithContactStore:startingToken:]([CNAvatarCacheChangeHistoryAnalysisTask alloc], "initWithContactStore:startingToken:", v3, v4);

  return v5;
}

- (id)makeReportingTaskWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  CNAvatarChangeHistoryReportingTask *v6;

  v4 = a3;
  -[CNAvatarCacheChangeListener delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNAvatarChangeHistoryReportingTask initWithIdentifiers:delegate:]([CNAvatarChangeHistoryReportingTask alloc], "initWithIdentifiers:delegate:", v4, v5);

  return v6;
}

- (CNAvatarCacheChangeListenerDelegate)delegate
{
  return (CNAvatarCacheChangeListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CNScheduler)preprocessor
{
  return self->_preprocessor;
}

- (NSData)currentHistoryToken
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_rawPreprocessor, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
