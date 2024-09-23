@implementation BBMuteExpirationManager

- (BOOL)cleanAndWatchExpirationsForSectionInfo:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[BBMuteExpirationManager cleanAndWatchExpirationsForSectionInfo:currentDate:](self, "cleanAndWatchExpirationsForSectionInfo:currentDate:", v5, v6);

  return (char)self;
}

- (void)_cancelTimerForSectionID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[BBMuteExpirationManager accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__BBMuteExpirationManager__cancelTimerForSectionID___block_invoke;
  block[3] = &unk_24C562E50;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)scheduledExpirationDateForSectionID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  -[BBMuteExpirationManager accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__BBMuteExpirationManager_scheduledExpirationDateForSectionID___block_invoke;
  block[3] = &unk_24C5631B8;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  v10 = v6;
  dispatch_sync(v5, block);

  objc_msgSend((id)v13[5], "valueForKey:", CFSTR("scheduledExpirationDateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (NSMutableDictionary)timersBySectionID
{
  return self->_timersBySectionID;
}

- (BBMuteExpirationManager)initWithQueue:(id)a3
{
  id v4;
  BBMuteExpirationManager *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BBMuteExpirationManager;
  v5 = -[BBMuteExpirationManager init](&v10, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.BulletinBoard.BBMuteExpirationManager.accessQueue", v6);
    -[BBMuteExpirationManager setAccessQueue:](v5, "setAccessQueue:", v7);

    -[BBMuteExpirationManager setQueue:](v5, "setQueue:", v4);
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[BBMuteExpirationManager setTimersBySectionID:](v5, "setTimersBySectionID:", v8);

  }
  return v5;
}

- (void)dealloc
{
  NSObject *accessQueue;
  objc_super v4;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__BBMuteExpirationManager_dealloc__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)BBMuteExpirationManager;
  -[BBMuteExpirationManager dealloc](&v4, sel_dealloc);
}

void __34__BBMuteExpirationManager_dealloc__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "timersBySectionID");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_21);

}

uint64_t __34__BBMuteExpirationManager_dealloc__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (BOOL)cleanAndWatchExpirationsForSectionInfo:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  char v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v24 = 0;
  v7 = a4;
  objc_msgSend(v6, "muteAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v8, "getNextExpirationDate:wasPurged:currentDate:", &v23, &v24, v7);

  v9 = v23;
  objc_msgSend(v6, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v6, "muteAssertion"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    v11 = v24 != 0;
  }
  else
  {
    objc_msgSend(v6, "setMuteAssertion:", 0);
    v11 = 1;
  }
  -[BBMuteExpirationManager scheduledExpirationDateForSectionID:](self, "scheduledExpirationDateForSectionID:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && v9)
  {
    if ((objc_msgSend(v9, "isEqualToDate:", v13) & 1) == 0)
    {
      -[BBMuteExpirationManager _cancelTimerForSectionID:](self, "_cancelTimerForSectionID:", v10);
LABEL_10:
      v25[0] = CFSTR("sectionIDKey");
      v25[1] = CFSTR("scheduledExpirationDateKey");
      v26[0] = v10;
      v26[1] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE71A08]), "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v9, v10, self, sel__queue_triggerDidFireForExpiryTimer_, v14);
      objc_msgSend(v15, "setMinimumEarlyFireProportion:", 1.0);
      objc_msgSend(v15, "setUserVisible:", 1);
      -[BBMuteExpirationManager queue](self, "queue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scheduleInQueue:", v16);

      -[BBMuteExpirationManager accessQueue](self, "accessQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __78__BBMuteExpirationManager_cleanAndWatchExpirationsForSectionInfo_currentDate___block_invoke;
      v20[3] = &unk_24C563438;
      v20[4] = self;
      v21 = v15;
      v22 = v10;
      v18 = v15;
      dispatch_sync(v17, v20);

    }
  }
  else
  {
    -[BBMuteExpirationManager _cancelTimerForSectionID:](self, "_cancelTimerForSectionID:", v10);
    if (v9)
      goto LABEL_10;
  }

  return v11;
}

void __78__BBMuteExpirationManager_cleanAndWatchExpirationsForSectionInfo_currentDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "timersBySectionID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (unint64_t)numberOfTimers
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BBMuteExpirationManager accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__BBMuteExpirationManager_numberOfTimers__block_invoke;
  v6[3] = &unk_24C563748;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __41__BBMuteExpirationManager_numberOfTimers__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "timersBySectionID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)timerForSectionID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  -[BBMuteExpirationManager accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__BBMuteExpirationManager_timerForSectionID___block_invoke;
  block[3] = &unk_24C5631B8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__BBMuteExpirationManager_timerForSectionID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "timersBySectionID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__BBMuteExpirationManager_scheduledExpirationDateForSectionID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "timersBySectionID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __52__BBMuteExpirationManager__cancelTimerForSectionID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "timersBySectionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "timersBySectionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    v3 = v5;
  }

}

- (void)_queue_triggerDidFireForExpiryTimer:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  BBMuteExpirationManager *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("sectionIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = BBLogSettings;
  if (os_log_type_enabled((os_log_t)BBLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v5;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Mute assertion expired", buf, 0xCu);
  }
  -[BBMuteExpirationManager accessQueue](self, "accessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __63__BBMuteExpirationManager__queue_triggerDidFireForExpiryTimer___block_invoke;
  v13 = &unk_24C562E50;
  v14 = self;
  v15 = v5;
  v8 = v5;
  dispatch_sync(v7, &v10);

  -[BBMuteExpirationManager delegate](self, "delegate", v10, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didChangeMuteAssertionForSectionID:", v8);

}

void __63__BBMuteExpirationManager__queue_triggerDidFireForExpiryTimer___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "timersBySectionID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (BBMuteExpirationManagerDelegate)delegate
{
  return (BBMuteExpirationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (void)setTimersBySectionID:(id)a3
{
  objc_storeStrong((id *)&self->_timersBySectionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timersBySectionID, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
