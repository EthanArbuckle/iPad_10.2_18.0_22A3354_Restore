@implementation _MSPSharedTripSingleCapabilityLevelFetcher

- (_MSPSharedTripSingleCapabilityLevelFetcher)initWithContact:(id)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  _MSPSharedTripSingleCapabilityLevelFetcher *v14;
  _MSPSharedTripSingleCapabilityLevelFetcher *v15;
  uint64_t v16;
  id completion;
  double v18;
  objc_super v20;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_MSPSharedTripSingleCapabilityLevelFetcher;
  v14 = -[_MSPSharedTripSingleCapabilityLevelFetcher init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contact, a3);
    v16 = objc_msgSend(v13, "copy");
    completion = v15->_completion;
    v15->_completion = (id)v16;

    objc_storeStrong((id *)&v15->_keepAliveReference, v15);
    objc_storeStrong((id *)&v15->_callbackQueue, a5);
    v18 = 10.0;
    if (a4 > 0.0)
      v18 = a4;
    v15->_timeoutInterval = v18;
  }

  return v15;
}

- (void)start
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  MSPSharedTripContact *contact;
  NSObject *callbackQueue;
  double timeoutInterval;
  OS_dispatch_queue *v9;
  GCDTimer *v10;
  GCDTimer *timeoutTimer;
  NSObject *v12;
  MSPSharedTripContact *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD block[6];
  MSPSharedTripContact *v20;
  uint8_t buf[4];
  MSPSharedTripContact *v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "capabilityLevelForContact:", self->_contact);

  if (v4)
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      contact = self->_contact;
      *(_DWORD *)buf = 138477827;
      v22 = contact;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_INFO, "fetchCapabilityLevelForContact found existing capability for single destination %{private}@", buf, 0xCu);
    }

    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51___MSPSharedTripSingleCapabilityLevelFetcher_start__block_invoke;
    block[3] = &unk_1E6653BB8;
    block[4] = self;
    block[5] = v4;
    dispatch_async(callbackQueue, block);
  }
  else
  {
    timeoutInterval = self->_timeoutInterval;
    v9 = self->_callbackQueue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51___MSPSharedTripSingleCapabilityLevelFetcher_start__block_invoke_2;
    v18[3] = &unk_1E6653B08;
    v18[4] = self;
    +[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", v9, v18, timeoutInterval);
    v10 = (GCDTimer *)objc_claimAutoreleasedReturnValue();
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v10;

    MSPGetSharedTripCapabilityFetcherLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = self->_contact;
      v14 = self->_timeoutInterval;
      *(_DWORD *)buf = 138478083;
      v22 = v13;
      v23 = 2048;
      v24 = v14;
      _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_INFO, "fetchCapabilityLevelForContact enqueuing single destination %{private}@, timeout: %#.1lfs", buf, 0x16u);
    }

    +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerObserver:", self);

    +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self->_contact;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "requestCapabilityLevelsForContacts:", v17);

  }
}

- (void)capabilityLevelFetcher:(id)a3 didUpdateCapabilityLevelsForHandles:(id)a4
{
  MSPSharedTripContact *contact;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  MSPSharedTripContact *v12;
  void *v13;
  NSObject *callbackQueue;
  _QWORD v15[6];
  uint8_t buf[4];
  MSPSharedTripContact *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  contact = self->_contact;
  v6 = a4;
  -[MSPSharedTripContact stringValue](contact, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "capabilityLevelForContact:", self->_contact);

    if (v10)
    {
      MSPGetSharedTripCapabilityFetcherLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = self->_contact;
        *(_DWORD *)buf = 138478083;
        v17 = v12;
        v18 = 2048;
        v19 = v10;
        _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_INFO, "fetchCapabilityLevelForContact response for contact %{private}@: %lu", buf, 0x16u);
      }

      +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "unregisterObserver:", self);

      callbackQueue = self->_callbackQueue;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __105___MSPSharedTripSingleCapabilityLevelFetcher_capabilityLevelFetcher_didUpdateCapabilityLevelsForHandles___block_invoke;
      v15[3] = &unk_1E6653BB8;
      v15[4] = self;
      v15[5] = v10;
      dispatch_async(callbackQueue, v15);
    }
  }
}

- (void)_timeout
{
  NSObject *v3;
  MSPSharedTripContact *contact;
  void *v5;
  int v6;
  MSPSharedTripContact *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripCapabilityFetcherLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    contact = self->_contact;
    v6 = 138477827;
    v7 = contact;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_INFO, "fetchCapabilityLevelForContact timed out waiting for contact %{private}@", (uint8_t *)&v6, 0xCu);
  }

  +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", self);

  -[_MSPSharedTripSingleCapabilityLevelFetcher _finishWithType:](self, "_finishWithType:", 0);
}

- (void)_finishWithType:(unint64_t)a3
{
  id completion;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  MSPSharedTripContact *v9;
  MSPSharedTripContact *contact;
  GCDTimer *timeoutTimer;
  void *v12;
  id v13;
  _MSPSharedTripSingleCapabilityLevelFetcher *keepAliveReference;
  int v15;
  void *v16;
  __int16 v17;
  MSPSharedTripContact *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  completion = self->_completion;
  MSPGetSharedTripCapabilityFetcherLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (uint64_t)v6;
  if (completion)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (a3 > 4)
        v8 = CFSTR("Unknown");
      else
        v8 = *(&off_1E6653BF8 + a3);
      contact = self->_contact;
      v15 = 138543619;
      v16 = (void *)v8;
      v17 = 2113;
      v18 = contact;
      _os_log_impl(&dword_1B39C0000, (os_log_t)v7, OS_LOG_TYPE_INFO, "fetchCapabilityLevelForContact cleaning up and calling completion handler with type %{public}@ for contact %{private}@", (uint8_t *)&v15, 0x16u);
    }

    -[GCDTimer invalidate](self->_timeoutTimer, "invalidate");
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;

    +[MSPSharedTripCapabilityLevelFetcher sharedFetcher](MSPSharedTripCapabilityLevelFetcher, "sharedFetcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unregisterObserver:", self);

    v7 = MEMORY[0x1B5E2B4E8](self->_completion);
    v13 = self->_completion;
    self->_completion = 0;

    (*(void (**)(uint64_t, unint64_t))(v7 + 16))(v7, a3);
    keepAliveReference = self->_keepAliveReference;
    self->_keepAliveReference = 0;

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v9 = self->_contact;
    v15 = 138477827;
    v16 = v9;
    _os_log_impl(&dword_1B39C0000, (os_log_t)v7, OS_LOG_TYPE_FAULT, "fetchCapabilityLevelForContact single-fetcher finish was called multiple times for contact %{private}@", (uint8_t *)&v15, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_keepAliveReference, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
