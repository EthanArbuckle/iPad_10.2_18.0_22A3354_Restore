@implementation DKKnowledgeStorageLogging

void __92___DKKnowledgeStorageLogging__sendDistributedNotificationName_object_throttledActivityName___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:deliverImmediately:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

}

void __44___DKKnowledgeStorageLogging_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_logger;
  sharedInstance_logger = v0;

}

void __49___DKKnowledgeStorageLogging_portraitStreamNames__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  +[_CDPortraitStreams topicStream](_CDPortraitStreams, "topicStream");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  +[_CDPortraitStreams entityStream](_CDPortraitStreams, "entityStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)portraitStreamNames_portraitStreamNames;
  portraitStreamNames_portraitStreamNames = v6;

}

void __62___DKKnowledgeStorageLogging_streamNamesNotificationWhitelist__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;

  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[_DKKnowledgeStorageLogging portraitStreamNames](*(id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "unionSet:", v2);

  +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v4);

  +[_DKSystemEventStreams appIntentsStream](_DKSystemEventStreams, "appIntentsStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v6);

  +[_DKSystemEventStreams appRelevantShortcutsStream](_DKSystemEventStreams, "appRelevantShortcutsStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v8);

  +[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v10);

  +[_DKSystemEventStreams appWebUsageStream](_DKSystemEventStreams, "appWebUsageStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v12);

  +[_DKSystemEventStreams appMediaUsageStream](_DKSystemEventStreams, "appMediaUsageStream");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v14);

  +[_DKSystemEventStreams notificationUsageStream](_DKSystemEventStreams, "notificationUsageStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v16);

  +[_DKSystemEventStreams microLocationVisitStream](_DKSystemEventStreams, "microLocationVisitStream");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v18);

  +[_DKSystemEventStreams nowPlayingStream](_DKSystemEventStreams, "nowPlayingStream");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v20);

  +[_DKSystemEventStreams homeKitSceneStream](_DKSystemEventStreams, "homeKitSceneStream");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v22);

  +[_DKSystemEventStreams homeKitAccessoryControlStream](_DKSystemEventStreams, "homeKitAccessoryControlStream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v24);

  v25 = objc_msgSend(v27, "copy");
  v26 = (void *)streamNamesNotificationWhitelist_streamNamesNotificationWhitelist;
  streamNamesNotificationWhitelist_streamNamesNotificationWhitelist = v25;

}

void __83___DKKnowledgeStorageLogging_knowledgeStorage_didInsertEventsWithStreamNameCounts___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("portraitknowledge"), CFSTR("ingest"), CFSTR("type"), &unk_1E272BFC8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knowledgeStorage_didInsertEventsWithStreamNameCounts__ingestCounter;
  knowledgeStorage_didInsertEventsWithStreamNameCounts__ingestCounter = v0;

}

void __88___DKKnowledgeStorageLogging_knowledgeStorage_didInsertLocalEventsWithStreamNameCounts___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventTypeStatsCounter counterInCollection:withEventName:eventType:eventTypePossibleValues:]((uint64_t)_DKEventTypeStatsCounter, CFSTR("portraitknowledge"), CFSTR("ingest_local"), CFSTR("type"), &unk_1E272BFE0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knowledgeStorage_didInsertLocalEventsWithStreamNameCounts__ingestLocalCounter;
  knowledgeStorage_didInsertLocalEventsWithStreamNameCounts__ingestLocalCounter = v0;

}

@end
