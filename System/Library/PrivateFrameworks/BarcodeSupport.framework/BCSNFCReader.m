@implementation BCSNFCReader

- (BCSNFCReader)initWithDelegate:(id)a3
{
  id v5;
  BCSNFCReader *v6;
  BCSNFCReader *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *disconnectQueue;
  uint64_t v14;
  NSMutableArray *urlQueue;
  void *v16;
  int v17;
  id v18;
  void *v19;
  BCSNFCReader *v20;
  id v22;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BCSNFCReader;
  v6 = -[BCSNFCReader init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v7->_state = 0;
    dispatch_get_global_queue(2, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create_with_target_V2("com.apple.BarcodeSupport.BCSNFCReader", 0, v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create_with_target_V2("com.apple.BarcodeSupport.BCSNFCReader.disconnectQueue", 0, v11);
    disconnectQueue = v7->_disconnectQueue;
    v7->_disconnectQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    urlQueue = v7->_urlQueue;
    v7->_urlQueue = (NSMutableArray *)v14;

    objc_msgSend(getNFHardwareManagerClass(), "sharedHardwareManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v17 = objc_msgSend(v16, "queryHardwareSupport:", &v22);
    v18 = v22;

    if (v18)
    {
      if (readerLog_onceToken != -1)
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      v19 = (void *)readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR))
        -[BCSNFCReader initWithDelegate:].cold.1(v19);
    }
    if (v17 != 2)
      -[BCSNFCReader _setStateAndNotifyDelegate:](v7, "_setStateAndNotifyDelegate:", 1);
    v20 = v7;

  }
  return v7;
}

- (int64_t)state
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __21__BCSNFCReader_state__block_invoke;
  v5[3] = &unk_24D7874D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__BCSNFCReader_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void)startReading
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__BCSNFCReader_startReading__block_invoke;
  block[3] = &unk_24D787300;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __28__BCSNFCReader_startReading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startReading");
}

- (void)_startReading
{
  NSTimer *reactivateTimer;
  NSObject *v4;
  void *v5;
  NFSession *v6;
  NFSession *tentativeSession;
  _QWORD v8[5];
  id v9;
  id buf[2];

  -[NSTimer invalidate](self->_reactivateTimer, "invalidate");
  reactivateTimer = self->_reactivateTimer;
  self->_reactivateTimer = 0;

  if (self->_state != 1 && !self->_tentativeSession && !self->_session)
  {
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v4 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21748C000, v4, OS_LOG_TYPE_INFO, "Starting reader", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    objc_msgSend(getNFHardwareManagerClass(), "sharedHardwareManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __29__BCSNFCReader__startReading__block_invoke;
    v8[3] = &unk_24D787528;
    objc_copyWeak(&v9, buf);
    v8[4] = self;
    objc_msgSend(v5, "startReaderSession:", v8);
    v6 = (NFSession *)objc_claimAutoreleasedReturnValue();
    tentativeSession = self->_tentativeSession;
    self->_tentativeSession = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

void __29__BCSNFCReader__startReading__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __29__BCSNFCReader__startReading__block_invoke_2;
  v11[3] = &unk_24D787500;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  v8 = v6;
  v12 = v8;
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v14 = v10;
  objc_msgSend(WeakRetained, "_performBlockOnQueue:", v11);

  objc_destroyWeak(&v15);
}

void __29__BCSNFCReader__startReading__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[5];
    WeakRetained[5] = 0;

    v5 = a1 + 32;
    if (*(_QWORD *)(a1 + 32))
    {
      if (readerLog_onceToken != -1)
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      v6 = (void *)readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR))
        __29__BCSNFCReader__startReading__block_invoke_2_cold_1(v5, v6);
      objc_msgSend(v3, "_setStateAndNotifyDelegate:", 8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setDelegate:", v3);
      v7 = v3 + 6;
      objc_storeStrong(v3 + 6, *(id *)(a1 + 40));
      if (objc_msgSend(v3, "_startPolling"))
      {
        objc_msgSend(v3, "_setStateAndNotifyDelegate:", 2);
        v8 = os_transaction_create();
        v9 = *(_QWORD *)(a1 + 48);
        v10 = *(void **)(v9 + 80);
        *(_QWORD *)(v9 + 80) = v8;

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "endSession");
        v11 = *v7;
        *v7 = 0;

      }
    }
  }

}

- (void)stopReading
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__BCSNFCReader_stopReading__block_invoke;
  block[3] = &unk_24D787300;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__BCSNFCReader_stopReading__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (!objc_msgSend(*(id *)(a1 + 32), "_isWaiting"))
    return objc_msgSend(*(id *)(a1 + 32), "_stopReadingAndTransitionToState:", 0);
  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v2 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21748C000, v2, OS_LOG_TYPE_INFO, "Reader is waiting", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_stopReadingAndTransitionToState:", 7);
}

- (void)_stopReadingAndTransitionToState:(int64_t)a3
{
  NSObject *v5;
  NFSession *tentativeSession;
  NFReaderSession *session;
  NSTimer *reactivateTimer;
  OS_os_transaction *transaction;
  CPSClipRequest *clipRequest;
  OS_os_transaction *v11;
  uint8_t v12[16];

  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v5 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21748C000, v5, OS_LOG_TYPE_INFO, "Stopping reader", v12, 2u);
  }
  -[NFSession endSession](self->_tentativeSession, "endSession");
  tentativeSession = self->_tentativeSession;
  self->_tentativeSession = 0;

  -[NFReaderSession endSession](self->_session, "endSession");
  session = self->_session;
  self->_session = 0;

  self->_sessionErrorCount = 0;
  self->_debouncedTagNotNDEFFormattedError = 0;
  -[NSTimer invalidate](self->_reactivateTimer, "invalidate");
  reactivateTimer = self->_reactivateTimer;
  self->_reactivateTimer = 0;

  if (a3 == 7)
  {
    -[NSMutableArray removeAllObjects](self->_urlQueue, "removeAllObjects");
    transaction = self->_transaction;
    self->_transaction = 0;

LABEL_11:
    -[BCSNFCReader _setStateAndNotifyDelegate:](self, "_setStateAndNotifyDelegate:", a3);
    return;
  }
  -[CPSClipRequest cancel](self->_clipRequest, "cancel");
  clipRequest = self->_clipRequest;
  self->_clipRequest = 0;

  if (a3 == 5)
    goto LABEL_11;
  -[NSMutableArray removeAllObjects](self->_urlQueue, "removeAllObjects");
  if (a3 == 6)
    goto LABEL_11;
  if (a3 == 9)
    goto LABEL_11;
  v11 = self->_transaction;
  self->_transaction = 0;

  if (a3 != 10)
    goto LABEL_11;
}

- (BOOL)_isWaiting
{
  return self->_clipRequest != 0;
}

- (BOOL)_startPolling
{
  NFReaderSession *session;
  id v4;
  void *v5;
  id v7;

  session = self->_session;
  v7 = 0;
  -[NFReaderSession startPollingWithError:](session, "startPollingWithError:", &v7);
  v4 = v7;
  if (v4)
  {
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v5 = (void *)readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR))
      -[BCSNFCReader _startPolling].cold.1(v5);
    -[BCSNFCReader _stopReadingAndTransitionToState:](self, "_stopReadingAndTransitionToState:", 8);
  }

  return v4 == 0;
}

- (void)_stopPolling
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "_bcs_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v3, v4, "Failed to stop polling with error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_restart
{
  int64_t state;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  state = self->_state;
  if (state == 2)
  {
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v5 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21748C000, v5, OS_LOG_TYPE_INFO, "Restarting polling", v6, 2u);
    }
    -[BCSNFCReader _startPolling](self, "_startPolling");
  }
  else if (state == 9)
  {
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v4 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21748C000, v4, OS_LOG_TYPE_INFO, "Restarting reader due to repeated errors", buf, 2u);
    }
    -[BCSNFCReader _startReading](self, "_startReading");
  }
}

- (void)_setStateAndNotifyDelegate:(int64_t)a3
{
  self->_state = a3;
  -[BCSNFCReaderDelegate nfcReaderStateDidChange:](self->_delegate, "nfcReaderStateDidChange:");
}

- (void)_performBlockOnQueue:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v3 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21748C000, v3, OS_LOG_TYPE_INFO, "Deallocating", buf, 2u);
  }
  -[BCSNFCReader _stopReadingAndTransitionToState:](self, "_stopReadingAndTransitionToState:", 10);
  v4.receiver = self;
  v4.super_class = (Class)BCSNFCReader;
  -[BCSNFCReader dealloc](&v4, sel_dealloc);
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__BCSNFCReader_readerSession_didDetectTags___block_invoke;
  block[3] = &unk_24D787550;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __44__BCSNFCReader_readerSession_didDetectTags___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didDetectTags:", *(_QWORD *)(a1 + 32));

}

- (void)readerSessionDidEndUnexpectedly:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v8 = (void *)readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR))
    -[BCSNFCReader readerSessionDidEndUnexpectedly:reason:].cold.1(v8);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__BCSNFCReader_readerSessionDidEndUnexpectedly_reason___block_invoke;
  block[3] = &unk_24D787550;
  objc_copyWeak(&v13, &location);
  v12 = v7;
  v10 = v7;
  dispatch_async(queue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __55__BCSNFCReader_readerSessionDidEndUnexpectedly_reason___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    v5 = WeakRetained;

    if (objc_msgSend(*(id *)(a1 + 32), "code") == 5)
      v4 = 3;
    else
      v4 = 8;
    objc_msgSend(v5, "_stopReadingAndTransitionToState:", v4);
    WeakRetained = v5;
  }

}

- (void)readerSession:(id)a3 externalReaderFieldNotification:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__BCSNFCReader_readerSession_externalReaderFieldNotification___block_invoke;
  block[3] = &unk_24D787300;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__BCSNFCReader_readerSession_externalReaderFieldNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v2 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21748C000, v2, OS_LOG_TYPE_INFO, "Entered external reader field", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_stopReadingAndTransitionToState:", 4);
}

- (void)_didDetectTags:(id)a3
{
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    v5 = -[BCSNFCReader _readTag:](self, "_readTag:", v4);
    v4 = v7;
    if (v5)
    {
      v6 = -[NSMutableArray count](self->_urlQueue, "count");
      v4 = v7;
      if (v6)
      {
        -[BCSNFCReader _startProcessingURLs](self, "_startProcessingURLs");
        v4 = v7;
      }
    }
  }

}

- (BOOL)_readTag:(id)a3
{
  id v4;
  NSObject *v5;
  NFReaderSession *session;
  char v7;
  id v8;
  NFReaderSession *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  NSMutableArray *urlQueue;
  BCSNFCReaderURLRecord *v32;
  void *v34;
  id v35;
  id v36;
  void *v37;
  BCSNFCReader *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  id v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v5 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v47 = v4;
    _os_log_impl(&dword_21748C000, v5, OS_LOG_TYPE_INFO, "Connecting to tag: %{private}@", buf, 0xCu);
  }
  session = self->_session;
  v44 = 0;
  v7 = -[NFReaderSession connectTag:error:](session, "connectTag:error:", v4, &v44);
  v8 = v44;
  if ((v7 & 1) != 0)
  {
    v9 = self->_session;
    v43 = 0;
    -[NFReaderSession ndefReadWithError:](v9, "ndefReadWithError:", &v43);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v43;
    v12 = v11 == 0;
    if (!v11)
    {
      objc_msgSend(v10, "records");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "count"))
      {
        if (readerLog_onceToken != -1)
          dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
        v18 = readerLog_log;
        if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21748C000, v18, OS_LOG_TYPE_INFO, "Tag is empty", buf, 2u);
        }
      }
      v34 = 0;
      v37 = v10;
      v38 = self;
      v35 = v8;
      v36 = v4;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v19 = v17;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v40;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v40 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v23), "decode", v34);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (readerLog_onceToken != -1)
              dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
            v25 = readerLog_log;
            if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              v47 = v24;
              _os_log_impl(&dword_21748C000, v25, OS_LOG_TYPE_INFO, "Reading record with payload: %{private}@", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x24BDBCF48], "_lp_URLWithUserTypedString:relativeToURL:", v24, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v27 = v26;
              objc_msgSend(v26, "scheme");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "length") ? v27 : 0;

              if (v29)
              {
                if (readerLog_onceToken != -1)
                  dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
                v30 = readerLog_log;
                if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138477827;
                  v47 = v29;
                  _os_log_impl(&dword_21748C000, v30, OS_LOG_TYPE_INFO, "Parsed URL: %{private}@", buf, 0xCu);
                }
                urlQueue = v38->_urlQueue;
                v32 = -[BCSNFCReaderURLRecord initWithURL:message:]([BCSNFCReaderURLRecord alloc], "initWithURL:message:", v29, v37);
                -[NSMutableArray addObject:](urlQueue, "addObject:", v32);

              }
            }

            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v21);
      }

      v38->_sessionErrorCount = 0;
      v38->_debouncedTagNotNDEFFormattedError = 0;
      -[BCSNFCReader _disconnectTagAndBlockReadingUntilRemoved](v38, "_disconnectTagAndBlockReadingUntilRemoved");

      v8 = v35;
      v4 = v36;
      v12 = v11 == 0;
      v10 = v37;
      v11 = v34;
      goto LABEL_51;
    }
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v13 = (void *)readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR))
      -[BCSNFCReader _readTag:].cold.1(v13);
    v14 = objc_msgSend(v11, "code");
    v15 = v14;
    if (v14 == 37)
    {
      if (self->_debouncedTagNotNDEFFormattedError)
      {
        -[BCSNFCReaderDelegate nfcReaderDidDetectNonNDEFTag](self->_delegate, "nfcReaderDidDetectNonNDEFTag");
        -[BCSNFCReader _disconnectTagAndBlockReadingUntilRemoved](self, "_disconnectTagAndBlockReadingUntilRemoved");
LABEL_50:
        self->_debouncedTagNotNDEFFormattedError = 1;
        goto LABEL_51;
      }
    }
    else if (v14 == 49 || v14 == 28)
    {
      -[BCSNFCReader _disconnectTagAndBlockReadingUntilRemoved](self, "_disconnectTagAndBlockReadingUntilRemoved");
      goto LABEL_51;
    }
    -[BCSNFCReader _disconnectTag](self, "_disconnectTag");
    -[BCSNFCReader _restartPolling](self, "_restartPolling");
    if (v15 == 37)
      goto LABEL_50;
LABEL_51:

    goto LABEL_52;
  }
  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v16 = (void *)readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR))
    -[BCSNFCReader _readTag:].cold.2(v16);
  -[BCSNFCReader _restartPolling](self, "_restartPolling");
  v12 = 0;
LABEL_52:

  return v12;
}

- (void)_restartPolling
{
  int64_t sessionErrorCount;
  dispatch_time_t v4;
  NSObject *queue;
  _QWORD v6[4];
  id v7;
  id location;

  -[BCSNFCReader _stopPolling](self, "_stopPolling");
  sessionErrorCount = self->_sessionErrorCount;
  if (sessionErrorCount < 6)
    self->_sessionErrorCount = sessionErrorCount + 1;
  else
    -[BCSNFCReader _stopReadingAndTransitionToState:](self, "_stopReadingAndTransitionToState:", 9);
  objc_initWeak(&location, self);
  v4 = dispatch_time(0, 100000000);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__BCSNFCReader__restartPolling__block_invoke;
  v6[3] = &unk_24D787578;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __31__BCSNFCReader__restartPolling__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_restart");

}

- (void)_disconnectTag
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "_bcs_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v3, v4, "Failed to disconnect from tag with error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_disconnectTagAndBlockReadingUntilRemoved
{
  NSObject *disconnectQueue;
  _QWORD v4[4];
  id v5;
  id v6;
  id from;
  id location;

  objc_initWeak(&location, self->_session);
  objc_initWeak(&from, self);
  disconnectQueue = self->_disconnectQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke;
  v4[3] = &unk_24D7875A0;
  objc_copyWeak(&v5, &location);
  objc_copyWeak(&v6, &from);
  dispatch_async(disconnectQueue, v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  id *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];

  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v2 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21748C000, v2, OS_LOG_TYPE_INFO, "Waiting for tag removal", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = 0;
  objc_msgSend(WeakRetained, "disconnectTagWithCardRemoval:", &v11);
  v4 = v11;

  if (v4)
  {
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v5 = (void *)readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR))
      __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke_cold_1(v5, v4);
  }
  else
  {
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v6 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21748C000, v6, OS_LOG_TYPE_INFO, "Disconnected from tag", buf, 2u);
    }
  }
  v7 = (id *)(a1 + 40);
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke_30;
  v9[3] = &unk_24D787578;
  objc_copyWeak(&v10, v7);
  objc_msgSend(v8, "_performBlockOnQueue:", v9);

  objc_destroyWeak(&v10);
}

void __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke_30(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[2] == 2)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_startPolling");
    WeakRetained = v2;
  }

}

- (void)_startProcessingURLs
{
  -[BCSNFCReader _stopReadingAndTransitionToState:](self, "_stopReadingAndTransitionToState:", 5);
  -[BCSNFCReader _processNextURL](self, "_processNextURL");
}

- (void)_processNextURL
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL __CPSClipsFeatureEnabled(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("BCSNFCReader.m"), 32, CFSTR("%s"), dlerror());

  __break(1u);
}

void __31__BCSNFCReader__processNextURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __31__BCSNFCReader__processNextURL__block_invoke_2;
  v10[3] = &unk_24D787500;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v8 = v5;
  v11 = v8;
  v12 = *(id *)(a1 + 32);
  v9 = v6;
  v13 = v9;
  objc_msgSend(WeakRetained, "_performBlockOnQueue:", v10);

  objc_destroyWeak(&v14);
}

void __31__BCSNFCReader__processNextURL__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      if (readerLog_onceToken != -1)
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      v3 = readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_21748C000, v3, OS_LOG_TYPE_INFO, "Clip is available", (uint8_t *)&v8, 2u);
      }
      objc_msgSend(WeakRetained, "_didFindLink");
      objc_msgSend(WeakRetained, "_requestAppClipForURLRecord:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (readerLog_onceToken != -1)
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      v4 = (void *)readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
      {
        v5 = *(void **)(a1 + 48);
        v6 = v4;
        objc_msgSend(v5, "_bcs_privacyPreservingDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543362;
        v9 = v7;
        _os_log_impl(&dword_21748C000, v6, OS_LOG_TYPE_INFO, "Clip is unavailable: %{public}@", (uint8_t *)&v8, 0xCu);

      }
      objc_msgSend(WeakRetained, "_requestNotificationForURLRecord:", *(_QWORD *)(a1 + 40));
    }
  }

}

- (void)_requestAppClipForURLRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  CPSClipRequest *v12;
  CPSClipRequest *clipRequest;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  CPSClipRequest *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[8];
  uint64_t v22;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v5 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21748C000, v5, OS_LOG_TYPE_INFO, "Creating clip request", buf, 2u);
  }
  +[BCSAnalyticsLogger sharedLogger](BCSAnalyticsLogger, "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didScanNFCTagOfType:", 1);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v7 = (void *)getCPSClipRequestClass_softClass;
  v29 = getCPSClipRequestClass_softClass;
  v8 = MEMORY[0x24BDAC760];
  if (!getCPSClipRequestClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __getCPSClipRequestClass_block_invoke;
    v24 = &unk_24D787158;
    v25 = &v26;
    __getCPSClipRequestClass_block_invoke((uint64_t)buf);
    v7 = (void *)v27[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v26, 8);
  v10 = [v9 alloc];
  objc_msgSend(v4, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (CPSClipRequest *)objc_msgSend(v10, "initWithURL:", v11);
  clipRequest = self->_clipRequest;
  self->_clipRequest = v12;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v14 = (void *)getCPSSessionConfigurationClass_softClass;
  v29 = getCPSSessionConfigurationClass_softClass;
  if (!getCPSSessionConfigurationClass_softClass)
  {
    *(_QWORD *)buf = v8;
    v22 = 3221225472;
    v23 = __getCPSSessionConfigurationClass_block_invoke;
    v24 = &unk_24D787158;
    v25 = &v26;
    __getCPSSessionConfigurationClass_block_invoke((uint64_t)buf);
    v14 = (void *)v27[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v26, 8);
  objc_msgSend(v15, "standardConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOriginIsControlCenter:", 1);
  -[CPSClipRequest sessionProxy](self->_clipRequest, "sessionProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConfiguration:", v16);

  objc_initWeak((id *)buf, self);
  v18 = self->_clipRequest;
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __44__BCSNFCReader__requestAppClipForURLRecord___block_invoke;
  v19[3] = &unk_24D787618;
  objc_copyWeak(&v20, (id *)buf);
  -[CPSClipRequest requestClipWithCompletion:](v18, "requestClipWithCompletion:", v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

void __44__BCSNFCReader__requestAppClipForURLRecord___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__BCSNFCReader__requestAppClipForURLRecord___block_invoke_2;
  v8[3] = &unk_24D7875F0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v11 = a2;
  v7 = v5;
  v9 = v7;
  objc_msgSend(WeakRetained, "_performBlockOnQueue:", v8);

  objc_destroyWeak(&v10);
}

void __44__BCSNFCReader__requestAppClipForURLRecord___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  const __CFString *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v3 = (void *)readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      if (*(_BYTE *)(a1 + 48))
        v4 = CFSTR("YES");
      else
        v4 = CFSTR("NO");
      v5 = *(void **)(a1 + 32);
      v6 = v3;
      objc_msgSend(v5, "_bcs_privacyPreservingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_21748C000, v6, OS_LOG_TYPE_INFO, "Clip request responded with available: %@, error: %@", (uint8_t *)&v9, 0x16u);

    }
    v8 = (void *)WeakRetained[8];
    WeakRetained[8] = 0;

    objc_msgSend(WeakRetained, "_scheduleReactivationWithDelay:", *((double *)WeakRetained + 15));
  }

}

- (void)_requestNotificationForURLRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  BCSNFCCodePayload *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  BCSNFCCodePayload *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 buf;
  Class (*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v5 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21748C000, v5, OS_LOG_TYPE_INFO, "Attempting to post notification", (uint8_t *)&buf, 2u);
  }
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BCSURLDataParser parseURL:](BCSURLDataParser, "parseURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_notificationService);
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v9 = (void *)readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      v11 = objc_msgSend(v7, "type");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_21748C000, v10, OS_LOG_TYPE_INFO, "BCSNFCCodeParser: Detected NFC URL has type %ld", (uint8_t *)&buf, 0xCu);

    }
    v12 = [BCSNFCCodePayload alloc];
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v13 = (void *)getNFCNDEFMessageClass_softClass;
    v26 = getNFCNDEFMessageClass_softClass;
    v14 = MEMORY[0x24BDAC760];
    if (!getNFCNDEFMessageClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v28 = __getNFCNDEFMessageClass_block_invoke;
      v29 = &unk_24D787158;
      v30 = &v23;
      __getNFCNDEFMessageClass_block_invoke((uint64_t)&buf);
      v13 = (void *)v24[3];
    }
    v15 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v23, 8);
    objc_msgSend(v4, "message");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "asData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ndefMessageWithData:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[BCSNFCCodePayload initWithNFCPayload:](v12, "initWithNFCPayload:", v18);

    objc_initWeak((id *)&buf, self);
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke;
    v21[3] = &unk_24D787668;
    objc_copyWeak(&v22, (id *)&buf);
    v21[4] = self;
    objc_msgSend(WeakRetained, "notifyParsedCodeWithData:codePayload:shouldReplacePreviousNotifications:reply:", v7, v19, 0, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)&buf);

  }
  else
  {
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v20 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR))
      -[BCSNFCReader _requestNotificationForURLRecord:].cold.1(v20);
    -[BCSNFCReader _processNextURL](self, "_processNextURL");
  }

}

void __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke_2;
  v10[3] = &unk_24D787640;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v8 = v5;
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  objc_msgSend(WeakRetained, "_performBlockOnQueue:", v10);

  objc_destroyWeak(&v13);
}

void __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[BCSAnalyticsLogger sharedLogger](BCSAnalyticsLogger, "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didScanNFCTagOfType:", 0);

    v4 = a1 + 32;
    if (*(_QWORD *)(a1 + 32))
    {
      if (readerLog_onceToken != -1)
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      v5 = (void *)readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_ERROR))
        __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke_2_cold_1(v4, v5);
      objc_msgSend(WeakRetained, "_processNextURL");
    }
    else
    {
      if (readerLog_onceToken != -1)
        dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
      v6 = readerLog_log;
      if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21748C000, v6, OS_LOG_TYPE_INFO, "URL is actionable", v7, 2u);
      }
      objc_msgSend(WeakRetained, "_didFindLink");
      objc_msgSend(WeakRetained, "_scheduleReactivationWithDelay:", *(double *)(*(_QWORD *)(a1 + 40) + 112));
    }
  }

}

- (void)_didFindLink
{
  NSObject *v3;
  uint8_t v4[16];

  if (readerLog_onceToken != -1)
    dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
  v3 = readerLog_log;
  if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21748C000, v3, OS_LOG_TYPE_INFO, "Found link", v4, 2u);
  }
  -[BCSNFCReader _stopReadingAndTransitionToState:](self, "_stopReadingAndTransitionToState:", 6);
}

- (void)_scheduleReactivationWithDelay:(double)a3
{
  NSObject *v5;
  void *v6;
  NSTimer *v7;
  NSTimer *reactivateTimer;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0.0)
  {
    -[BCSNFCReader _setStateAndNotifyDelegate:](self, "_setStateAndNotifyDelegate:", 0);
  }
  else
  {
    if (readerLog_onceToken != -1)
      dispatch_once(&readerLog_onceToken, &__block_literal_global_0);
    v5 = readerLog_log;
    if (os_log_type_enabled((os_log_t)readerLog_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v13 = a3;
      _os_log_impl(&dword_21748C000, v5, OS_LOG_TYPE_INFO, "Scheduling reactivation after %f seconds", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v6 = (void *)MEMORY[0x24BDBCF40];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__BCSNFCReader__scheduleReactivationWithDelay___block_invoke;
    v10[3] = &unk_24D787690;
    objc_copyWeak(&v11, (id *)buf);
    objc_msgSend(v6, "timerWithTimeInterval:repeats:block:", 0, v10, a3);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    reactivateTimer = self->_reactivateTimer;
    self->_reactivateTimer = v7;

    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTimer:forMode:", self->_reactivateTimer, *MEMORY[0x24BDBCB80]);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __47__BCSNFCReader__scheduleReactivationWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "startReading");

}

- (BCSNotificationService)notificationService
{
  return (BCSNotificationService *)objc_loadWeakRetained((id *)&self->_notificationService);
}

- (void)setNotificationService:(id)a3
{
  objc_storeWeak((id *)&self->_notificationService, a3);
}

- (double)postNotificationReactivationDelay
{
  return self->_postNotificationReactivationDelay;
}

- (void)setPostNotificationReactivationDelay:(double)a3
{
  self->_postNotificationReactivationDelay = a3;
}

- (double)dismissProxCardReactivationDelay
{
  return self->_dismissProxCardReactivationDelay;
}

- (void)setDismissProxCardReactivationDelay:(double)a3
{
  self->_dismissProxCardReactivationDelay = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationService);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_reactivateTimer, 0);
  objc_storeStrong((id *)&self->_clipRequest, 0);
  objc_storeStrong((id *)&self->_urlQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_tentativeSession, 0);
  objc_storeStrong((id *)&self->_disconnectQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)initWithDelegate:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "_bcs_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v3, v4, "Failed to determine hardware support state with error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __29__BCSNFCReader__startReading__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "_bcs_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v4, v5, "Failed to start reader session with error: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_startPolling
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "_bcs_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v3, v4, "Failed to start polling with error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)readerSessionDidEndUnexpectedly:(void *)a1 reason:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "_bcs_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v3, v4, "Reader session ended unexpectedly: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_readTag:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "_bcs_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v3, v4, "Failed to read tag with error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_readTag:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "_bcs_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v3, v4, "Failed to connect to tag with error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __57__BCSNFCReader__disconnectTagAndBlockReadingUntilRemoved__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_4(a1);
  objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21748C000, v3, OS_LOG_TYPE_ERROR, "Failed to disconnect and wait for tag removal with error: %@", v5, 0xCu);

  OUTLINED_FUNCTION_2();
}

- (void)_requestNotificationForURLRecord:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21748C000, log, OS_LOG_TYPE_ERROR, "BCSURLDataParser does not recognize NFC URL", v1, 2u);
}

void __49__BCSNFCReader__requestNotificationForURLRecord___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "_bcs_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v4, v5, "Failed to post notification for URL with error: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

@end
