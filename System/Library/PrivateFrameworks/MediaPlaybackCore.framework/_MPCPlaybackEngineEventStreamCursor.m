@implementation _MPCPlaybackEngineEventStreamCursor

- (_MPCPlaybackEngineEventStreamCursor)initWithEventStream:(id)a3 startEvent:(id)a4 endEvent:(id)a5
{
  id v9;
  id v10;
  id v11;
  _MPCPlaybackEngineEventStreamCursor *v12;
  _MPCPlaybackEngineEventStreamCursor *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_MPCPlaybackEngineEventStreamCursor;
  v12 = -[_MPCPlaybackEngineEventStreamCursor init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_eventStream, a3);
    objc_storeStrong((id *)&v13->_startEvent, a4);
    if (v10)
    {
      objc_msgSend(v10, "monotonicTime");
      objc_msgSend(v10, "monotonicTime");
      v14 = v19 + v20;
    }
    else
    {
      v14 = 0;
    }
    v13->_startNS = v14;
    objc_storeStrong((id *)&v13->_endEvent, a5);
    if (v11)
    {
      objc_msgSend(v11, "monotonicTime");
      objc_msgSend(v11, "monotonicTime");
      v15 = v17 + v18;
    }
    else
    {
      v15 = 0;
    }
    v13->_endNS = v15;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
}

- (id)findPreviousEventWithType:(id)a3 matchingPayload:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v14 = v6;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = a4;
    objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCPlaybackEngineEventStreamCursor findPreviousEventWithTypes:matchingPayload:](self, "findPreviousEventWithTypes:matchingPayload:", v10, v9, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = a4;
    -[_MPCPlaybackEngineEventStreamCursor findPreviousEventWithTypes:matchingPayload:](self, "findPreviousEventWithTypes:matchingPayload:", MEMORY[0x24BDBD1A8], v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)findPreviousEventWithTypes:(id)a3 matchingPayload:(id)a4
{
  id v6;
  id v7;
  MPCPlaybackEngineEventStream *eventStream;
  NSObject *queue;
  MPCPlaybackEngineEventStream *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  MPCPlaybackEngineEventStream *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  eventStream = self->_eventStream;
  if (eventStream)
    queue = eventStream->_queue;
  else
    queue = 0;
  dispatch_assert_queue_V2(queue);
  v10 = self->_eventStream;
  if (v10 && v10->_invalidated)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[MPCPlaybackEngineEventStream engineID](self->_eventStream, "engineID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] findPreviousEventsWithTypes:… | return nil [invalidated]", buf, 0xCu);

    }
    v13 = 0;
  }
  else
  {
    -[MPCPlaybackEngineEventStream cachedEventWithTypes:matchingPayload:cursor:]((uint64_t)v10, v6, v7, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v11 = v14;
      v13 = v11;
    }
    else
    {
      -[_MPCPlaybackEngineEventStreamCursor _statementForEventTypes:payload:limit:](self, v6, v7, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlaybackEngineEventStream sql](&self->_eventStream->super.isa);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resultsForStatement:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0;
      objc_msgSend(v17, "nextObjectWithError:", &v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v24;
      if (v19)
      {
        v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          -[MPCPlaybackEngineEventStream engineID](self->_eventStream, "engineID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v26 = v21;
          v27 = 2114;
          v28 = v6;
          v29 = 2114;
          v30 = v19;
          _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_FAULT, "[EVS:%public}@] findPreviousEventsWithTypes:%{public}@ … | failed to find events [sql failure] error=%{public}@", buf, 0x20u);

        }
        v13 = 0;
      }
      else
      {
        if (v18)
        {
          +[MPCPlaybackEngineEvent eventFromRowResult:]((uint64_t)MPCPlaybackEngineEvent, v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v22 = self->_eventStream;
            if (v22)
              dispatch_assert_queue_V2((dispatch_queue_t)v22->_queue);
          }
        }
        else
        {
          v13 = 0;
        }
        objc_msgSend(v15, "invalidate");
      }

      v11 = 0;
    }
  }

  return v13;
}

- (id)_statementForEventTypes:(void *)a3 payload:(uint64_t)a4 limit:
{
  if (a1)
  {
    -[_MPCPlaybackEngineEventStreamCursor _statementForColumnsExpression:eventTypes:payload:limit:]((uint64_t)a1, CFSTR("DISTINCT events.identifier, events.type, events.monoAbsolute, events.monoContinuous, events.monoTimebaseNS, events.userNS, events.threadPriority, events.payload"), a2, a3, a4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_statementForColumnsExpression:(void *)a3 eventTypes:(void *)a4 payload:(uint64_t)a5 limit:
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  unint64_t i;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  _BYTE *v40;
  char *v41;
  id v42;
  _BYTE buf[24];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v32 = a2;
  v9 = a3;
  v10 = a4;
  v36 = a1;
  v34 = v10;
  if (a1)
  {
    MPCPlaybackEngineEventPayloadJSONFromPayload(v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _MPCPlaybackEngineEventFlattenPayload(v33, v11, &unk_24CB174D0);
    v12 = objc_msgSend(v9, "count");
    if ((unint64_t)(v12 + 2 * objc_msgSend(v11, "count") + 3) >= 0x3E7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", sel__statementForColumnsExpression_eventTypes_payload_limit_, a1, CFSTR("MPCPlaybackEngineEventStream.m"), 1108, CFSTR("Query too large"));

    }
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("SELECT %@ FROM events"), v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count") && objc_msgSend(v11, "count"))
    {
      v15 = 0;
      do
      {
        objc_msgSend(v13, "appendFormat:", CFSTR(", json_tree(events.payload, @payload_key_%d) AS payload_%d"), v15, v15);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(payload_%d.value IS @payload_value_%d)"), v15, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v16);

        ++v15;
      }
      while (v15 < objc_msgSend(v11, "count"));
    }
    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v14, "addObject:", CFSTR("events.type = @type"));
    }
    else if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      v17 = (void *)objc_msgSend(CFSTR("events.type IN ("), "mutableCopy");
      if (objc_msgSend(v9, "count"))
      {
        v18 = 0;
        do
        {
          if (v18)
            objc_msgSend(v17, "appendString:", CFSTR(", "));
          objc_msgSend(v17, "appendFormat:", CFSTR("@type_%d"), v18++);
        }
        while (v18 < objc_msgSend(v9, "count"));
      }
      objc_msgSend(v17, "appendString:", CFSTR(")"));
      objc_msgSend(v14, "addObject:", v17);

    }
    objc_msgSend(v14, "addObject:", CFSTR("_ns < @startNS"));
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(v14, "addObject:", CFSTR("_ns > @endNS"));
    objc_msgSend(v13, "appendString:", CFSTR(" WHERE "));
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR(" AND "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:", v19);

    objc_msgSend(v13, "appendString:", CFSTR(" ORDER BY _ns DESC"));
    if (a5 >= 1)
      objc_msgSend(v13, "appendFormat:", CFSTR(" LIMIT %lld"), 1);
    -[MPCPlaybackEngineEventStream sql](*(_QWORD **)(a1 + 24));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v20, "statementWithString:error:", v13, &v42);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v42;

    if (v35)
    {
      v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(*(id *)(a1 + 24), "engineID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2114;
        v44 = v35;
        _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_FAULT, "[EVS:%{public}@] _statementForColumnsExpression:… | failed to create statement [sql failure] sql=%{public}@ error=%{public}@", buf, 0x20u);

      }
      v23 = 0;
    }
    else
    {
      objc_msgSend(v31, "bindUInt64Value:toParameterNamed:", *(_QWORD *)(a1 + 8), CFSTR("@startNS"));
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v44 = 0;
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __95___MPCPlaybackEngineEventStreamCursor__statementForColumnsExpression_eventTypes_payload_limit___block_invoke;
      v37[3] = &unk_24CAB7838;
      v40 = buf;
      v24 = v31;
      v41 = sel__statementForColumnsExpression_eventTypes_payload_limit_;
      v38 = v24;
      v39 = a1;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v37);
      if (objc_msgSend(v9, "count") == 1)
      {
        objc_msgSend(v9, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bindStringValue:toParameterNamed:", v25, CFSTR("@type"));

      }
      else if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        for (i = 0; i < objc_msgSend(v9, "count"); ++i)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", i);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("@type_%d"), i);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "bindStringValue:toParameterNamed:", v27, v28);

        }
      }
      if (*(_QWORD *)(v36 + 40))
        objc_msgSend(v24, "bindUInt64Value:toParameterNamed:", *(_QWORD *)(v36 + 16), CFSTR("@endNS"));
      v23 = v24;

      _Block_object_dispose(buf, 8);
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (MPCPlaybackEngineEvent)startEvent
{
  return self->_startEvent;
}

- (MPCPlaybackEngineEvent)endEvent
{
  return self->_endEvent;
}

- (id)cursorUntilEvent:(id)a3
{
  MPCPlaybackEngineEvent *startEvent;
  id v5;
  _MPCPlaybackEngineEventStreamCursor *v6;
  MPCPlaybackEngineEventStream *eventStream;
  uint64_t v8;
  void *v9;

  startEvent = self->_startEvent;
  v5 = a3;
  v6 = [_MPCPlaybackEngineEventStreamCursor alloc];
  eventStream = self->_eventStream;
  if (startEvent)
    v8 = -[_MPCPlaybackEngineEventStreamCursor initWithEventStream:startEvent:endEvent:](v6, "initWithEventStream:startEvent:endEvent:", eventStream, self->_startEvent, v5);
  else
    v8 = -[_MPCPlaybackEngineEventStreamCursor initWithEventStream:fromNanoSeconds:endEvent:](v6, "initWithEventStream:fromNanoSeconds:endEvent:", eventStream, self->_startNS, v5);
  v9 = (void *)v8;

  return v9;
}

- (_MPCPlaybackEngineEventStreamCursor)initWithEventStream:(id)a3 fromNanoSeconds:(unint64_t)a4 endEvent:(id)a5
{
  id v9;
  id v10;
  _MPCPlaybackEngineEventStreamCursor *v11;
  _MPCPlaybackEngineEventStreamCursor *v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_MPCPlaybackEngineEventStreamCursor;
  v11 = -[_MPCPlaybackEngineEventStreamCursor init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_eventStream, a3);
    v12->_startNS = a4;
    objc_storeStrong((id *)&v12->_endEvent, a5);
    if (v10)
    {
      objc_msgSend(v10, "monotonicTime");
      objc_msgSend(v10, "monotonicTime");
      v13 = v15 + v16;
    }
    else
    {
      v13 = 0;
    }
    v12->_endNS = v13;
  }

  return v12;
}

- (NSString)description
{
  MPCPlaybackEngineEvent *startEvent;
  void *v4;
  uint64_t v5;
  MPCPlaybackEngineEvent *endEvent;
  MPCPlaybackEngineEvent *v7;

  startEvent = self->_startEvent;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  if (startEvent)
  {
    endEvent = self->_endEvent;
    if (!endEvent)
      endEvent = (MPCPlaybackEngineEvent *)CFSTR("…");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p %@ -> %@>"), v5, self, self->_startEvent, endEvent);
  }
  else
  {
    v7 = self->_endEvent;
    if (!v7)
      v7 = (MPCPlaybackEngineEvent *)CFSTR("…");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p %lld -> %@"), v5, self, self->_startNS, v7);
  }
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)cursorFromEvent:(id)a3 untilEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _MPCPlaybackEngineEventStreamCursor *v12;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (!v8)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEventStream.m"), 996, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startEvent"));

    if (!v9)
      goto LABEL_5;
  }
  objc_msgSend(v7, "earlierEvent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEventStream.m"), 997, CFSTR("Start event must be chronologically AFTER the limiting event."));

  }
LABEL_5:
  v12 = -[_MPCPlaybackEngineEventStreamCursor initWithEventStream:startEvent:endEvent:]([_MPCPlaybackEngineEventStreamCursor alloc], "initWithEventStream:startEvent:endEvent:", self->_eventStream, v7, v9);

  return v12;
}

- (int64_t)countOfPreviousEventsWithType:(id)a3 matchingPayload:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int64_t v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v13 = v6;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = a4;
    objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = -[_MPCPlaybackEngineEventStreamCursor countOfPreviousEventsWithTypes:matchingPayload:](self, "countOfPreviousEventsWithTypes:matchingPayload:", v10, v9, v13, v14);

  }
  else
  {
    v10 = a4;
    v11 = -[_MPCPlaybackEngineEventStreamCursor countOfPreviousEventsWithTypes:matchingPayload:](self, "countOfPreviousEventsWithTypes:matchingPayload:", MEMORY[0x24BDBD1A8], v10);
  }

  return v11;
}

- (int64_t)countOfPreviousEventsWithTypes:(id)a3 matchingPayload:(id)a4
{
  id v6;
  id v7;
  MPCPlaybackEngineEventStream *eventStream;
  NSObject *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  eventStream = self->_eventStream;
  if (eventStream && eventStream->_invalidated)
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[MPCPlaybackEngineEventStream engineID](self->_eventStream, "engineID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v10;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] countOfPreviousEventsWithTypes:… | returning 0 [invalidated]", (uint8_t *)&v17, 0xCu);

    }
    v11 = 0;
  }
  else
  {
    -[_MPCPlaybackEngineEventStreamCursor _statementForColumnsExpression:eventTypes:payload:limit:]((uint64_t)self, CFSTR("COUNT(DISTINCT events.identifier)"), v6, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCPlaybackEngineEventStream sql](&self->_eventStream->super.isa);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resultsForStatement:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "nextObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (int)objc_msgSend(v15, "int64ValueAtColumnIndex:", 0);
    objc_msgSend(v12, "invalidate");

  }
  return v11;
}

- (void)enumeratePreviousEventsWithType:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEventStream.m"), 1021, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventType"));

  }
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEngineEventStreamCursor enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:](self, "enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:", v9, MEMORY[0x24BDBD1B8], v8);

}

- (void)enumeratePreviousEventsWithType:(id)a3 matchingPayload:(id)a4 usingBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEventStream.m"), 1026, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("payload"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    -[_MPCPlaybackEngineEventStreamCursor enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:](self, "enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:", MEMORY[0x24BDBD1A8], v10, v11);
    goto LABEL_6;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCPlaybackEngineEventStreamCursor enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:](self, "enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:", v12, v10, v11);

LABEL_6:
}

- (void)enumeratePreviousEventsWithTypes:(id)a3 usingBlock:(id)a4
{
  -[_MPCPlaybackEngineEventStreamCursor enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:](self, "enumeratePreviousEventsWithTypes:matchingPayload:usingBlock:", a3, MEMORY[0x24BDBD1B8], a4);
}

- (void)enumeratePreviousEventsWithTypes:(id)a3 matchingPayload:(id)a4 usingBlock:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, _BYTE *);
  MPCPlaybackEngineEventStream *eventStream;
  NSObject *queue;
  MPCPlaybackEngineEventStream *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  char v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, _BYTE *))a5;
  eventStream = self->_eventStream;
  if (eventStream)
    queue = eventStream->_queue;
  else
    queue = 0;
  dispatch_assert_queue_V2(queue);
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEventStream.m"), 1036, CFSTR("Must provide event types to enumerate."));

    if (v10)
      goto LABEL_5;
LABEL_23:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEventStream.m"), 1037, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("payload"));

    goto LABEL_5;
  }
  if (!v10)
    goto LABEL_23;
LABEL_5:
  v14 = self->_eventStream;
  if (v14 && v14->_invalidated)
  {
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[MPCPlaybackEngineEventStream engineID](self->_eventStream, "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] enumeratePreviousEventsWithType:… | skipping enumeration [invalidated]", buf, 0xCu);

    }
  }
  else
  {
    -[_MPCPlaybackEngineEventStreamCursor _statementForEventTypes:payload:limit:](self, v9, v10, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    -[MPCPlaybackEngineEventStream sql](&self->_eventStream->super.isa);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resultsForStatement:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v30 = 0;
    objc_msgSend(v18, "nextObjectWithError:", &v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v30;
    v21 = v20;
    if (v19)
    {
      do
      {
        v22 = (void *)MEMORY[0x212BD2784]();
        +[MPCPlaybackEngineEvent eventFromRowResult:]((uint64_t)MPCPlaybackEngineEvent, v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          v11[2](v11, v23, &v31);

        objc_autoreleasePoolPop(v22);
        v30 = v21;
        objc_msgSend(v18, "nextObjectWithError:", &v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v30;

        if (!v24)
          break;
        v21 = v25;
        v19 = v24;
      }
      while (!v31);

    }
    else
    {
      v25 = v20;
    }
    -[NSObject invalidate](v15, "invalidate");
    if (v25)
    {
      v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        -[MPCPlaybackEngineEventStream engineID](self->_eventStream, "engineID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v27;
        v34 = 2114;
        v35 = v9;
        v36 = 2114;
        v37 = v25;
        _os_log_impl(&dword_210BD8000, v26, OS_LOG_TYPE_FAULT, "[EVS:%{public}@] enumeratePreviousEventsWithTypes:%{public}@ … | failed enumeration [sql failure] error=%{public}@", buf, 0x20u);

      }
    }

  }
}

- (MPCPlaybackEngineEventStream)eventStream
{
  return self->_eventStream;
}

@end
