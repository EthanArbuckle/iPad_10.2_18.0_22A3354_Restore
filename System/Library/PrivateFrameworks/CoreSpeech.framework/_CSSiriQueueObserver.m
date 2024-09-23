@implementation _CSSiriQueueObserver

- (_CSSiriQueueObserver)initWithQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  id v11;
  id v12;
  _CSSiriQueueObserver *v13;
  _CSSiriQueueObserver *v14;
  uint64_t v15;
  id timeoutHandler;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_CSSiriQueueObserver;
  v13 = -[_CSSiriQueueObserver init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    v14->_heartBeatInterval = a4;
    v14->_timeoutInterval = a5;
    v15 = objc_msgSend(v12, "copy");
    timeoutHandler = v14->_timeoutHandler;
    v14->_timeoutHandler = (id)v15;

  }
  return v14;
}

- (void)startWithQueue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  double heartBeatInterval;
  AFHeartBeat *v9;
  AFHeartBeat *heartBeat;
  OS_dispatch_queue *queue;
  _QWORD v12[4];
  id v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  OS_dispatch_queue *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_heartBeat)
  {
    v5 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_DEBUG))
    {
      queue = self->_queue;
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[_CSSiriQueueObserver startWithQueue:]";
      v16 = 2112;
      v17 = queue;
      _os_log_debug_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEBUG, "%s queue = %@", location, 0x16u);
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.assistant.queue-observer.%s"), dispatch_queue_get_label((dispatch_queue_t)self->_queue));
    objc_initWeak((id *)location, self);
    v7 = objc_alloc(MEMORY[0x1E0CFE8C8]);
    heartBeatInterval = self->_heartBeatInterval;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39___CSSiriQueueObserver_startWithQueue___block_invoke;
    v12[3] = &unk_1E7C271C0;
    objc_copyWeak(&v14, (id *)location);
    v13 = v4;
    v9 = (AFHeartBeat *)objc_msgSend(v7, "initWithIdentifier:queue:effectiveDate:expirationDuration:heartBeatInterval:heartBeatHandler:invalidationHandler:", v6, v13, 0, v12, 0, 0.0, heartBeatInterval);
    heartBeat = self->_heartBeat;
    self->_heartBeat = v9;

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);

  }
}

- (void)stop
{
  AFHeartBeat *heartBeat;
  NSObject *v4;
  AFHeartBeat *v5;
  OS_dispatch_queue *queue;
  int v7;
  const char *v8;
  __int16 v9;
  OS_dispatch_queue *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  heartBeat = self->_heartBeat;
  if (heartBeat)
  {
    v4 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_DEBUG))
    {
      queue = self->_queue;
      v7 = 136315394;
      v8 = "-[_CSSiriQueueObserver stop]";
      v9 = 2112;
      v10 = queue;
      _os_log_debug_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEBUG, "%s queue = %@", (uint8_t *)&v7, 0x16u);
      heartBeat = self->_heartBeat;
    }
    -[AFHeartBeat invalidate](heartBeat, "invalidate");
    v5 = self->_heartBeat;
    self->_heartBeat = 0;

  }
}

- (void)heartBeatFiredWithQueue:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  double timeoutInterval;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__19354;
  v28 = __Block_byref_object_dispose__19355;
  v29 = 0;
  v5 = objc_alloc(MEMORY[0x1E0CFE998]);
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke;
  v22[3] = &unk_1E7C271E8;
  objc_copyWeak(&v23, &location);
  v7 = (void *)objc_msgSend(v5, "initWithBlock:", v22);
  v8 = objc_alloc(MEMORY[0x1E0CFEAC8]);
  timeoutInterval = self->_timeoutInterval;
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_2;
  v20[3] = &unk_1E7C292C8;
  v10 = v7;
  v21 = v10;
  v11 = objc_msgSend(v8, "initWithTimeoutInterval:onQueue:timeoutHandler:", v4, v20, timeoutInterval);
  v12 = (void *)v25[5];
  v25[5] = v11;

  objc_msgSend((id)v25[5], "start");
  queue = self->_queue;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __48___CSSiriQueueObserver_heartBeatFiredWithQueue___block_invoke_3;
  v16[3] = &unk_1E7C277D0;
  v17 = v10;
  v18 = v4;
  v19 = &v24;
  v14 = v4;
  v15 = v10;
  dispatch_async(queue, v16);

  objc_destroyWeak(&v23);
  _Block_object_dispose(&v24, 8);

  objc_destroyWeak(&location);
}

- (void)timeoutDetected
{
  unint64_t v3;
  NSObject *v4;
  void (**timeoutHandler)(id, unint64_t);
  OS_dispatch_queue *queue;
  int v7;
  const char *v8;
  __int16 v9;
  OS_dispatch_queue *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = self->_numberOfOccurrences + 1;
  self->_numberOfOccurrences = v3;
  v4 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
  {
    queue = self->_queue;
    v7 = 136315650;
    v8 = "-[_CSSiriQueueObserver timeoutDetected]";
    v9 = 2112;
    v10 = queue;
    v11 = 2048;
    v12 = v3;
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s queue = %@, numberOfOccurrences = %tu", (uint8_t *)&v7, 0x20u);
  }
  timeoutHandler = (void (**)(id, unint64_t))self->_timeoutHandler;
  if (timeoutHandler)
    timeoutHandler[2](timeoutHandler, self->_numberOfOccurrences);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heartBeat, 0);
}

@end
