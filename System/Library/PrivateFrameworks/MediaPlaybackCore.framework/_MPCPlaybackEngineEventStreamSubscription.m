@implementation _MPCPlaybackEngineEventStreamSubscription

- (void)subscribeToEventType:(id)a3 options:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id WeakRetained;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary **p_mutatingEventHandlers;
  void *v16;
  NSMutableDictionary **p_eventHandlers;
  void *v18;
  __int16 v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  id aBlock;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  aBlock = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  v10 = objc_loadWeakRetained((id *)&self->_eventStream);
  objc_msgSend((id)objc_opt_class(), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "engineID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v27 = v13;
    v28 = 2114;
    v29 = v11;
    v30 = 2048;
    v31 = WeakRetained;
    v32 = 2114;
    v33 = v8;
    v34 = 2048;
    v35 = a4;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] subscribeToEventType:%{public}@ options:%llu | adding handlers", buf, 0x34u);

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_mutatingEventHandlers = &self->_mutatingEventHandlers;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutatingEventHandlers, "objectForKeyedSubscript:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEventStream.m"), 859, CFSTR("Consumer %@ already has a mutating subscription to %@"), v11, v8);

  }
  p_eventHandlers = &self->_eventHandlers;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventHandlers, "objectForKeyedSubscript:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEventStream.m"), 860, CFSTR("Consumer %@ already has a subscription to %@"), v11, v8);

  }
  v19 = ~(_WORD)a4;
  v20 = _Block_copy(aBlock);
  if ((v19 & 0x101) != 0)
    v21 = (id *)p_eventHandlers;
  else
    v21 = (id *)p_mutatingEventHandlers;
  objc_msgSend(*v21, "setObject:forKeyedSubscript:", v20, v8);

  os_unfair_lock_unlock(p_lock);
}

- (void)subscribeToEventType:(id)a3 handler:(id)a4
{
  -[_MPCPlaybackEngineEventStreamSubscription subscribeToEventType:options:handler:](self, "subscribeToEventType:options:handler:", a3, 0, a4);
}

- (void)_onQueue_flush
{
  id WeakRetained;
  NSObject *isa;
  NSObject *v5;
  unint64_t maximumEventDeliveryTimestamp;
  const __CFString *v7;
  _MPCPlaybackEngineEventStreamSubscription *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  unint64_t lastEventSuccessTimestamp;
  Class v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_unfair_lock_s *p_lock;
  uint64_t v19;
  _MPCPlaybackEngineEventStreamSubscription *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  os_unfair_lock_s *v26;
  _MPCPlaybackEngineEventStreamCursor *v27;
  unint64_t v28;
  void *v29;
  _MPCPlaybackEngineEventStreamSubscription *v30;
  unint64_t v31;
  NSObject *v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id obj;
  _MPCPlaybackEngineEventStreamSubscription *v45;
  void *context;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  unint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  if (WeakRetained)
  {
    objc_msgSend((id)objc_opt_class(), "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    isa = objc_loadWeakRetained((id *)&self->_eventStream);
    v5 = isa;
    if (isa)
      isa = isa[10].isa;
    dispatch_assert_queue_V2(isa);
    maximumEventDeliveryTimestamp = self->_maximumEventDeliveryTimestamp;
    if (maximumEventDeliveryTimestamp)
      v7 = CFSTR("SELECT identifier, type, monoAbsolute, monoContinuous, monoTimebaseNS, userNS, threadPriority, payload, _ns FROM events WHERE _ns > @lastNS && _ns < @maximumNS ORDER BY _ns");
    else
      v7 = CFSTR("SELECT identifier, type, monoAbsolute, monoContinuous, monoTimebaseNS, userNS, threadPriority, payload, _ns FROM events WHERE _ns > @lastNS ORDER BY _ns");
    -[MPCPlaybackEngineEventStream sql](v5);
    v8 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v9, "statementWithString:error:", v7, &v51);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v51;

    v45 = v8;
    objc_msgSend(v10, "bindUInt64Value:toParameterNamed:", v8->_lastEventSuccessTimestamp, CFSTR("@lastNS"));
    if (maximumEventDeliveryTimestamp)
      objc_msgSend(v10, "bindUInt64Value:toParameterNamed:", maximumEventDeliveryTimestamp, CFSTR("@maximumNS"), v37);
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject engineID](v5, "engineID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      lastEventSuccessTimestamp = v8->_lastEventSuccessTimestamp;
      *(_DWORD *)buf = 138544130;
      v54 = v12;
      v55 = 2114;
      v56 = v42;
      v57 = 2048;
      v58 = WeakRetained;
      v59 = 2048;
      v60 = lastEventSuccessTimestamp;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] _onQueue_flush | running query [] lastEventSuccessTimestamp=%llu", buf, 0x2Au);

    }
    v41 = WeakRetained;
    if (v5)
      v14 = v5[8].isa;
    else
      v14 = 0;
    v39 = v10;
    -[objc_class resultsForStatement:](v14, "resultsForStatement:", v10, v37);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v48;
      p_lock = &v45->_lock;
      v40 = v5;
      while (2)
      {
        v19 = 0;
        v20 = v45;
        v43 = v16;
        do
        {
          if (*(_QWORD *)v48 != v17)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v19);
          v22 = (void *)MEMORY[0x212BD2784]();
          objc_msgSend(v21, "stringValueAtColumnIndex:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_lock(p_lock);
          -[NSMutableDictionary objectForKeyedSubscript:](v20->_eventHandlers, "objectForKeyedSubscript:", v23);
          v24 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          os_unfair_lock_unlock(p_lock);
          if (v24)
          {
            context = v22;
            +[MPCPlaybackEngineEvent eventFromRowResult:]((uint64_t)MPCPlaybackEngineEvent, v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = p_lock;
              v27 = -[_MPCPlaybackEngineEventStreamCursor initWithEventStream:startEvent:endEvent:]([_MPCPlaybackEngineEventStreamCursor alloc], "initWithEventStream:startEvent:endEvent:", v5, v25, 0);
              if (!((unsigned int (**)(_QWORD, void *, _MPCPlaybackEngineEventStreamCursor *))v24)[2](v24, v25, v27))
              {

                objc_autoreleasePoolPop(context);
                goto LABEL_36;
              }
              v28 = objc_msgSend(v21, "uint64ValueAtColumnIndex:", 8);
              -[NSObject testingDelegate](v5, "testingDelegate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v29)
                _MPCPlaybackEngineEventStreamValidateSystemTime(v23, v28);
              v30 = v45;
              v31 = v45->_lastEventSuccessTimestamp;
              if (v31 && v28 - v31 >= 0x34630B8A001)
              {
                v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  -[NSObject engineID](v5, "engineID");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = v28 - v45->_lastEventSuccessTimestamp;
                  *(_DWORD *)buf = 138544130;
                  v54 = v33;
                  v55 = 2114;
                  v56 = v42;
                  v57 = 2048;
                  v58 = v41;
                  v59 = 2048;
                  v60 = v34;
                  _os_log_impl(&dword_210BD8000, v32, OS_LOG_TYPE_INFO, "[EVS:%{public}@:%{public}@:%p] _onQueue_flush | unusual delay between events [more than 5m between events] delta=%lluns", buf, 0x2Au);

                  v5 = v40;
                }

                v30 = v45;
              }
              v30->_lastEventSuccessTimestamp = v28;
              v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                -[NSObject engineID](v5, "engineID");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v54 = v36;
                v55 = 2114;
                v56 = v42;
                v57 = 2048;
                v58 = v41;
                v59 = 2048;
                v60 = v28;
                _os_log_impl(&dword_210BD8000, v35, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] _onQueue_flush | updating bookmark [successful delivery] lastEventSuccessTimestamp=%llu", buf, 0x2Au);

                v5 = v40;
              }

              v20 = v45;
              p_lock = v26;
              v16 = v43;
            }

            v22 = context;
          }

          objc_autoreleasePoolPop(v22);
          ++v19;
        }
        while (v16 != v19);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_36:

    objc_msgSend(v39, "invalidate");
    WeakRetained = v41;
  }

}

- (NSString)streamID
{
  return self->_streamID;
}

- (_MPCPlaybackEngineEventStreamSubscription)initWithConsumer:(id)a3 eventStream:(id)a4
{
  id v6;
  id v7;
  _MPCPlaybackEngineEventStreamSubscription *v8;
  _MPCPlaybackEngineEventStreamSubscription *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSString *streamID;
  uint64_t v15;
  NSMutableDictionary *mutatingEventHandlers;
  uint64_t v17;
  NSMutableDictionary *eventHandlers;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_MPCPlaybackEngineEventStreamSubscription;
  v8 = -[_MPCPlaybackEngineEventStreamSubscription init](&v20, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_consumer, v6);
    objc_storeWeak((id *)&v9->_eventStream, v7);
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_opt_self();
    if (processID_onceToken != -1)
      dispatch_once(&processID_onceToken, &__block_literal_global_193);
    v11 = (id)processID_processID;
    objc_msgSend(v7, "engineID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%@"), v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    streamID = v9->_streamID;
    v9->_streamID = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    mutatingEventHandlers = v9->_mutatingEventHandlers;
    v9->_mutatingEventHandlers = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    eventHandlers = v9->_eventHandlers;
    v9->_eventHandlers = (NSMutableDictionary *)v17;

  }
  return v9;
}

- (NSMutableDictionary)mutatingEventHandlers
{
  return self->_mutatingEventHandlers;
}

- (unint64_t)lastEventSuccessTimestamp
{
  return self->_lastEventSuccessTimestamp;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_mutatingEventHandlers, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[NSMutableDictionary allKeys](self->_eventHandlers, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  objc_msgSend((id)objc_opt_class(), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p consumer=%@ events=%@>"), v7, self, v9, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)cancelSubscription
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  v5 = objc_loadWeakRetained((id *)&self->_eventStream);
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "engineID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2048;
    v14 = WeakRetained;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] cancelSubscription | removing handlers", (uint8_t *)&v9, 0x20u);

  }
  -[NSMutableDictionary removeAllObjects](self->_mutatingEventHandlers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_eventHandlers, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);

}

- (void)flushEventsWithCompletion:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  v6 = objc_loadWeakRetained((id *)&self->_eventStream);
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "engineID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    v22 = 2048;
    v23 = WeakRetained;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] flushEventsWithCompletion:… | flushing events async", buf, 0x20u);

  }
  if (v6)
    v10 = v6[10];
  else
    v10 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71___MPCPlaybackEngineEventStreamSubscription_flushEventsWithCompletion___block_invoke;
  v14[3] = &unk_24CAB7B40;
  v14[4] = self;
  v15 = v6;
  v16 = WeakRetained;
  v17 = v4;
  v11 = v4;
  v12 = WeakRetained;
  v13 = v6;
  dispatch_async(v10, v14);

}

- (MPCPlaybackEngineEventConsumer)consumer
{
  return (MPCPlaybackEngineEventConsumer *)objc_loadWeakRetained((id *)&self->_consumer);
}

- (MPCPlaybackEngineEventStream)eventStream
{
  return (MPCPlaybackEngineEventStream *)objc_loadWeakRetained((id *)&self->_eventStream);
}

- (void)setLastEventSuccessTimestamp:(unint64_t)a3
{
  self->_lastEventSuccessTimestamp = a3;
}

- (unint64_t)maximumEventDeliveryTimestamp
{
  return self->_maximumEventDeliveryTimestamp;
}

- (void)setMaximumEventDeliveryTimestamp:(unint64_t)a3
{
  self->_maximumEventDeliveryTimestamp = a3;
}

- (NSMutableDictionary)eventHandlers
{
  return self->_eventHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_storeStrong((id *)&self->_mutatingEventHandlers, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_destroyWeak((id *)&self->_eventStream);
  objc_destroyWeak((id *)&self->_consumer);
}

@end
