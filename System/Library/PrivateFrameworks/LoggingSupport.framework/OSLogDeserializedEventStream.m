@implementation OSLogDeserializedEventStream

- (NSDate)firstDate
{
  void *v2;
  void *v3;

  -[OSLogDeserializedEventStream metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)lastDate
{
  void *v2;
  void *v3;

  -[OSLogDeserializedEventStream metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (OSLogDeserializedEventStream)initWithDataSourceDelegate:(id)a3
{
  id v5;
  OSLogDeserializedEventStream *v6;
  OSLogDeserializedEventStream *v7;
  void *v8;
  void *v9;
  _OSLogEventSerializationMetadata *v10;
  _OSLogEventSerializationMetadata *metadata;
  OSLogDeserializedEventStream *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OSLogDeserializedEventStream;
  v6 = -[OSLogEventStreamBase init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceDelegate, a3);
    -[OSLogDeserializedEventStream dataSourceDelegate](v7, "dataSourceDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "metadataChunk");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[_OSLogEventSerializationMetadata initWithDataRepresentation:]([_OSLogEventSerializationMetadata alloc], "initWithDataRepresentation:", v9);
    if (!v10)
    {

      v12 = 0;
      goto LABEL_6;
    }
    metadata = v7->_metadata;
    v7->_metadata = v10;

  }
  v12 = v7;
LABEL_6:

  return v12;
}

- (id)_nextEventDictionary
{
  void *v3;
  void *v4;
  void *v5;

  -[OSLogDeserializedEventStream eventDictionaryEnumerator](self, "eventDictionaryEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[OSLogDeserializedEventStream _updateEventArray](self, "_updateEventArray");
    -[OSLogDeserializedEventStream eventDictionaryEnumerator](self, "eventDictionaryEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_runInvalidationHandler:(unint64_t)a3
{
  void *v5;
  OSLogEventStreamPosition *v6;
  void (**v7)(id, unint64_t, OSLogEventStreamPosition *);

  -[OSLogEventStreamBase invalidationHandler](self, "invalidationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[OSLogEventStreamBase invalidationHandler](self, "invalidationHandler");
    v7 = (void (**)(id, unint64_t, OSLogEventStreamPosition *))objc_claimAutoreleasedReturnValue();
    v6 = [OSLogEventStreamPosition alloc];
    v7[2](v7, a3, v6);

  }
}

- (void)_iterateThroughEventsWithProxy:(id)a3 filter:(id)a4 startingDate:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  uint64_t v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  -[OSLogDeserializedEventStream _nextEventDictionary](self, "_nextEventDictionary");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    LOBYTE(v12) = 0;
    while (1)
    {
      objc_msgSend(v18, "setCurEventDictionary:", v11);
      -[OSLogDeserializedEventStream metadata](self, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMetadata:", v13);

      v14 = 1;
      if (v9 && !v12)
      {
        objc_msgSend(v18, "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v15, "compare:", v9) != -1;

        v14 = v12;
      }
      if (v8 && v14)
        v14 = objc_msgSend(v8, "evaluateWithObject:", v18);
      if (v14)
      {
        -[OSLogEventStreamBase streamHandler](self, "streamHandler");
        v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v16)[2](v16, v18);

        if (-[OSLogEventStreamBase invalidated](self, "invalidated"))
          break;
      }
      -[OSLogDeserializedEventStream _nextEventDictionary](self, "_nextEventDictionary");
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v17;
      if (!v17)
        goto LABEL_12;
    }
    -[OSLogDeserializedEventStream _runInvalidationHandler:](self, "_runInvalidationHandler:", 4);

  }
  else
  {
LABEL_12:
    if (!-[OSLogEventStreamBase invalidated](self, "invalidated"))
    {
      -[OSLogEventStreamBase invalidate](self, "invalidate");
      -[OSLogDeserializedEventStream _runInvalidationHandler:](self, "_runInvalidationHandler:", 5);
    }
  }

}

- (id)_eventArrayFromData:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v8;
  id v9;

  if (!a3)
    return 0;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3)
  {
    objc_opt_class();
    v5 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && !v4)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Version"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && !objc_msgSend(v6, "unsignedIntValue"))
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Events"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          v5 = v8;
        else
          v5 = 0;

      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateEventArray
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *curEventArray;
  NSEnumerator *v7;
  NSEnumerator *eventDictionaryEnumerator;
  id v9;

  -[OSLogDeserializedEventStream dataSourceDelegate](self, "dataSourceDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEventDataChunk");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogDeserializedEventStream _eventArrayFromData:](self, "_eventArrayFromData:", v4);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  curEventArray = self->_curEventArray;
  self->_curEventArray = v5;

  -[OSLogDeserializedEventStream curEventArray](self, "curEventArray");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectEnumerator");
  v7 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
  eventDictionaryEnumerator = self->_eventDictionaryEnumerator;
  self->_eventDictionaryEnumerator = v7;

}

- (void)activateStreamFromDate:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[OSLogEventStreamBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__OSLogDeserializedEventStream_activateStreamFromDate___block_invoke;
  block[3] = &unk_1E4157EC0;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)activate
{
  -[OSLogDeserializedEventStream activateStreamFromDate:](self, "activateStreamFromDate:", 0);
}

- (BOOL)hasActivated
{
  return self->_hasActivated;
}

- (void)setHasActivated:(BOOL)a3
{
  self->_hasActivated = a3;
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (OSLogEventDeserializerDataSourceDelegate)dataSourceDelegate
{
  return self->_dataSourceDelegate;
}

- (NSArray)curEventArray
{
  return self->_curEventArray;
}

- (NSEnumerator)eventDictionaryEnumerator
{
  return self->_eventDictionaryEnumerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDictionaryEnumerator, 0);
  objc_storeStrong((id *)&self->_curEventArray, 0);
  objc_storeStrong((id *)&self->_dataSourceDelegate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

void __55__OSLogDeserializedEventStream_activateStreamFromDate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "streamHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("EventSerializer.m"), 799, CFSTR("Cannot activate %@ without streamHandler block"), objc_opt_class());

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasActivated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("EventSerializer.m"), 800, CFSTR("Cannot activate the same %@ instance twice"), objc_opt_class());

  }
  objc_msgSend(*(id *)(a1 + 32), "setHasActivated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_updateEventArray");
  objc_msgSend(*(id *)(a1 + 32), "filterPredicate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = +[OSLogEventProxy _make](_OSLogDeserializedEventProxy, "_make");
  objc_msgSend(*(id *)(a1 + 32), "_iterateThroughEventsWithProxy:filter:startingDate:", v3, v6, *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "_unmake");

}

@end
