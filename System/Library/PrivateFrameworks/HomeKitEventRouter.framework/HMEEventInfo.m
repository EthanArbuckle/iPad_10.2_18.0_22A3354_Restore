@implementation HMEEventInfo

- (HMEEventInfo)initWithEvent:(id)a3 topic:(id)a4
{
  id v7;
  id v8;
  HMEEventInfo *v9;
  HMEEventInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMEEventInfo;
  v9 = -[HMEEventInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v10->_topic, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMEEventInfo topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEEventInfo event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMEEventInfo topic = %@, event = %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pbEventInfo
{
  HMEProtoEventInfo *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(HMEProtoEventInfo);
  -[HMEEventInfo topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEProtoEventInfo setTopic:](v3, "setTopic:", v4);

  -[HMEEventInfo event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pbEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEProtoEventInfo setEvent:](v3, "setEvent:", v6);

  return v3;
}

- (HMEEvent)event
{
  return self->_event;
}

- (NSString)topic
{
  return self->_topic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

+ (id)fromProtobuff:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  HMEEventInfo *v6;
  void *v7;
  HMEEventInfo *v8;

  v3 = a3;
  if (objc_msgSend(v3, "hasTopic")
    && objc_msgSend(v3, "hasEvent")
    && (objc_msgSend(v3, "event"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        +[HMEEvent eventFromProtobuff:](HMEEvent, "eventFromProtobuff:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    v6 = [HMEEventInfo alloc];
    objc_msgSend(v3, "topic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMEEventInfo initWithEvent:topic:](v6, "initWithEvent:topic:", v5, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)eventInfoFromProtoData:(id)a3
{
  id v4;
  HMEProtoEventInfo *v5;
  void *v6;

  v4 = a3;
  v5 = -[HMEProtoEventInfo initWithData:]([HMEProtoEventInfo alloc], "initWithData:", v4);

  if (v5)
  {
    objc_msgSend(a1, "fromProtobuff:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)eventsMapFromEventInfos:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "topic", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "event");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "topic");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

+ (id)eventsMapFromProtoEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        +[HMEEventInfo fromProtobuff:](HMEEventInfo, "fromProtobuff:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "eventsMapFromEventInfos:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (unint64_t)topicAndMetadataMaxSizeInBytes
{
  return 256;
}

@end
