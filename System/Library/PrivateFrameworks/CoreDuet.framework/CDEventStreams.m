@implementation CDEventStreams

void __33___CDEventStreams_sharedInstance__block_invoke()
{
  _CDEventStreams *v0;
  void *v1;

  v0 = objc_alloc_init(_CDEventStreams);
  v1 = (void *)sharedInstance__sharedContextStoreEvents;
  sharedInstance__sharedContextStoreEvents = (uint64_t)v0;

}

void __48___CDEventStreams__eventStreamForName_orKBName___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", kCDESPEventNameKey);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", kCDESPKnowledgeBaseEventNameKey);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v8 | v9)
  {
    if (*(_BYTE *)(a1 + 80)
      || (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v8) & 1) != 0
      || objc_msgSend((id)v9, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    {
      +[_CDEventStreamProperties eventStreamPropertiesFromDictionary:defaultProperties:](_CDEventStreamProperties, "eventStreamPropertiesFromDictionary:defaultProperties:", v7, *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDEventStream eventStreamWithProperties:](_CDEventStream, "eventStreamWithProperties:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v11, v8);
      if (v9)
        objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v11, v9);
      if (!*(_BYTE *)(a1 + 80))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v11);
        *a4 = 1;
      }

    }
  }
  else
  {
    +[_CDLogging contextChannel](_CDLogging, "contextChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __48___CDEventStreams__eventStreamForName_orKBName___block_invoke_cold_1((uint64_t)v7, a3, v12);

  }
}

void __51___CDEventStreams_privacyPolicyForEventStreamName___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)privacyPolicyForEventStreamName__policies;
  privacyPolicyForEventStreamName__policies = (uint64_t)v0;

}

void __49___CDEventStreams_rateLimiterForEventStreamName___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)rateLimiterForEventStreamName__policies;
  rateLimiterForEventStreamName__policies = (uint64_t)v0;

}

void __48___CDEventStreams__eventStreamForName_orKBName___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "plistArray[%ld]:\n%@\n missing EventName and KnowledgeBaseEventName keys -- skip over this event\n", (uint8_t *)&v3, 0x16u);
}

@end
