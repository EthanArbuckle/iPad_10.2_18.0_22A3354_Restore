@implementation CNUIMeContactMonitor

void __34__CNUIMeContactMonitor_meChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "strategy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "meContactChangedInStore:", v2);

}

void __36__CNUIMeContactMonitor_isMeContact___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "strategy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "isMeContact:", *(_QWORD *)(a1 + 40));

}

- (CNMeContactComparisonStrategy)strategy
{
  return self->_strategy;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

+ (id)log
{
  if (log_cn_once_token_1_0 != -1)
    dispatch_once(&log_cn_once_token_1_0, &__block_literal_global_22);
  return (id)log_cn_once_object_1_0;
}

void __47__CNUIMeContactMonitor_unifiedMeContactMonitor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeUnifiedMeContactMonitor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)unifiedMeContactMonitor_cn_once_object_3;
  unifiedMeContactMonitor_cn_once_object_3 = v1;

}

+ (id)makeUnifiedMeContactMonitor
{
  CNUIMeContactComparisonStrategyUnified *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(CNUIMeContactComparisonStrategyUnified);
  v4 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  objc_msgSend(v4, "setIncludeLocalContacts:", 1);
  objc_msgSend(v4, "setIncludeDonatedContacts:", 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v4);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithComparisonStrategy:contactStore:", v3, v5);
  objc_msgSend(v6, "startMonitoring");

  return v6;
}

- (void)startMonitoring
{
  -[CNUIMeContactMonitor meChanged:](self, "meChanged:", 0);
}

- (void)meChanged:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[CNUIMeContactMonitor lock](self, "lock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__CNUIMeContactMonitor_meChanged___block_invoke;
  v5[3] = &unk_1EA6035F0;
  v5[4] = self;
  objc_msgSend(v4, "performSynchronousWriterBlock:", v5);

}

- (BOOL)isMeContact:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    -[CNUIMeContactMonitor lock](self, "lock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__CNUIMeContactMonitor_isMeContact___block_invoke;
    v8[3] = &unk_1EA603C40;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v5, "performSynchronousReaderBlock:", v8);

    v6 = *((_BYTE *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CNReaderWriterScheduler)lock
{
  return self->_lock;
}

- (CNUIMeContactMonitor)initWithComparisonStrategy:(id)a3 contactStore:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  CNUIMeContactMonitor *v11;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNUIMeContactMonitor initWithComparisonStrategy:contactStore:notificationCenter:schedulerProvider:](self, "initWithComparisonStrategy:contactStore:notificationCenter:schedulerProvider:", v8, v7, v9, v10);

  return v11;
}

- (CNUIMeContactMonitor)initWithComparisonStrategy:(id)a3 contactStore:(id)a4 notificationCenter:(id)a5 schedulerProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CNUIMeContactMonitor *v31;
  CNUIMeContactMonitor *v32;
  uint64_t v33;
  CNReaderWriterScheduler *lock;
  void *v35;
  void *v36;
  uint64_t v37;
  CNCancelable *meNotificationToken;
  CNUIMeContactMonitor *v39;
  objc_super v41;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_5 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_5, &__block_literal_global_139);
  v15 = CNGuardOSLog_cn_once_object_0_5;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_5, OS_LOG_TYPE_FAULT))
  {
    -[CNUIMeContactMonitor initWithComparisonStrategy:contactStore:notificationCenter:schedulerProvider:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    if (v12)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v12)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_5 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_5, &__block_literal_global_139);
  v23 = CNGuardOSLog_cn_once_object_0_5;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_5, OS_LOG_TYPE_FAULT))
    -[CNUIMeContactMonitor initWithComparisonStrategy:contactStore:notificationCenter:schedulerProvider:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
LABEL_10:
  v41.receiver = self;
  v41.super_class = (Class)CNUIMeContactMonitor;
  v31 = -[CNUIMeContactMonitor init](&v41, sel_init);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_strategy, a3);
    objc_storeStrong((id *)&v32->_contactStore, a4);
    objc_storeStrong((id *)&v32->_notificationCenter, a5);
    v33 = objc_msgSend(v14, "newReaderWriterSchedulerWithName:", CFSTR("com.apple.contacts.me-contact-monitor"));
    lock = v32->_lock;
    v32->_lock = (CNReaderWriterScheduler *)v33;

    objc_msgSend(MEMORY[0x1E0D13AE8], "observableOnNotificationCenter:withName:object:", v13, *MEMORY[0x1E0C96878], 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13AF0], "observerWithWeakTarget:resultSelector:", v32, sel_meChanged_);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "subscribe:", v36);
    v37 = objc_claimAutoreleasedReturnValue();
    meNotificationToken = v32->_meNotificationToken;
    v32->_meNotificationToken = (CNCancelable *)v37;

    v39 = v32;
  }

  return v32;
}

void __27__CNUIMeContactMonitor_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("contactsui", "me-contact-monitor");
  v1 = (void *)log_cn_once_object_1_0;
  log_cn_once_object_1_0 = (uint64_t)v0;

}

+ (id)unifiedMeContactMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CNUIMeContactMonitor_unifiedMeContactMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unifiedMeContactMonitor_cn_once_token_3 != -1)
    dispatch_once(&unifiedMeContactMonitor_cn_once_token_3, block);
  return (id)unifiedMeContactMonitor_cn_once_object_3;
}

+ (id)meContactMonitor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CNUIMeContactMonitor_meContactMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (meContactMonitor_cn_once_token_2 != -1)
    dispatch_once(&meContactMonitor_cn_once_token_2, block);
  return (id)meContactMonitor_cn_once_object_2;
}

void __40__CNUIMeContactMonitor_meContactMonitor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeMeContactMonitor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)meContactMonitor_cn_once_object_2;
  meContactMonitor_cn_once_object_2 = v1;

}

+ (id)makeMeContactMonitor
{
  CNUIMeContactComparisonStrategyIdentifier *v3;
  void *v4;

  v3 = objc_alloc_init(CNUIMeContactComparisonStrategyIdentifier);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithComparisonStrategy:", v3);
  objc_msgSend(v4, "startMonitoring");

  return v4;
}

- (CNUIMeContactMonitor)init
{
  CNUIMeContactComparisonStrategyIdentifier *v3;
  CNUIMeContactMonitor *v4;

  v3 = objc_alloc_init(CNUIMeContactComparisonStrategyIdentifier);
  v4 = -[CNUIMeContactMonitor initWithComparisonStrategy:](self, "initWithComparisonStrategy:", v3);

  return v4;
}

- (CNUIMeContactMonitor)initWithContactStore:(id)a3
{
  id v4;
  CNUIMeContactComparisonStrategyIdentifier *v5;
  CNUIMeContactMonitor *v6;

  v4 = a3;
  v5 = objc_alloc_init(CNUIMeContactComparisonStrategyIdentifier);
  v6 = -[CNUIMeContactMonitor initWithComparisonStrategy:contactStore:](self, "initWithComparisonStrategy:contactStore:", v5, v4);

  return v6;
}

- (CNUIMeContactMonitor)initWithComparisonStrategy:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  CNUIMeContactMonitor *v8;

  v4 = (objc_class *)MEMORY[0x1E0C972A0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setIncludeLocalContacts:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v6);
  v8 = -[CNUIMeContactMonitor initWithComparisonStrategy:contactStore:](self, "initWithComparisonStrategy:contactStore:", v5, v7);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CNCancelable cancel](self->_meNotificationToken, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CNUIMeContactMonitor;
  -[CNUIMeContactMonitor dealloc](&v3, sel_dealloc);
}

- (NSArray)meContactIdentifiers
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[CNUIMeContactMonitor lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__CNUIMeContactMonitor_meContactIdentifiers__block_invoke;
  v6[3] = &unk_1EA603C68;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performSynchronousReaderBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __44__CNUIMeContactMonitor_meContactIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "strategy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "meContactIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_strategy, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (CNCancelable)meNotificationToken
{
  return self->_meNotificationToken;
}

- (void)setMeNotificationToken:(id)a3
{
  objc_storeStrong((id *)&self->_meNotificationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meNotificationToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
}

- (void)initWithComparisonStrategy:(uint64_t)a3 contactStore:(uint64_t)a4 notificationCenter:(uint64_t)a5 schedulerProvider:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘store’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)initWithComparisonStrategy:(uint64_t)a3 contactStore:(uint64_t)a4 notificationCenter:(uint64_t)a5 schedulerProvider:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘strategy’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
