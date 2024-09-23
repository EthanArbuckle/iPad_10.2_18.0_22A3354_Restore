@implementation MDMRSELFLoggingUtils

+ (BOOL)emitEvent:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "hasEventMetadata")
    && (objc_msgSend(v3, "eventMetadata"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "hasNlId"),
        v4,
        (v5 & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emitMessage:", v3);

    MRRLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "eventMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nlId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "toNSUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = 136315138;
      v15 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1C281A000, v7, OS_LOG_TYPE_INFO, "Emitted event with NL ID: %s", (uint8_t *)&v14, 0xCu);

      v8 = 1;
    }
  }
  else
  {
    MRRLoggerForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1C281A000, v7, OS_LOG_TYPE_ERROR, "Due to NL ID being Nil, this event won't be emitted.", (uint8_t *)&v14, 2u);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)createMentionDetectorEvaluatedEvent:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t i;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D99D88]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; ; ++i)
  {
    objc_msgSend(v7, "mentions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (i >= v14)
      break;
    v15 = (void *)MEMORY[0x1E0D9FAC8];
    objc_msgSend(v7, "mentions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertMatchingSpan:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "mainItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v19);

    }
  }
  objc_msgSend(v10, "setMentionDetectorSpans:", v11);
  objc_msgSend(v10, "setLinkId:", v9);
  v20 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v20, "setMarrsMentionDetectorEnded:", v10);
  objc_msgSend(v20, "setEventMetadata:", v8);

  return v20;
}

+ (id)createMentionDetectorEvaluatedTier1Event:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t i;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D99D90]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; ; ++i)
  {
    objc_msgSend(v7, "mentions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (i >= v14)
      break;
    v15 = (void *)MEMORY[0x1E0D9FAC8];
    objc_msgSend(v7, "mentions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertMatchingSpanTier1:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObject:", v18);
  }
  objc_msgSend(v10, "setMentionDetectorSpansTier1s:", v11);
  objc_msgSend(v10, "setLinkId:", v9);
  v19 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v19, "setMarrsMentionDetectorEndedTier1:", v10);
  objc_msgSend(v19, "setEventMetadata:", v8);

  return v19;
}

+ (BOOL)emitMentionDetectorEvaluatedEventWithResponse:(id)a3 WithNlId:(id)a4 andWithTrpId:(id)a5 andWithRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int)a8
{
  uint64_t v8;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = *(_QWORD *)&a8;
  v14 = a3;
  +[NLXMetadataGenerator createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:](NLXMetadataGenerator, "createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:", a4, a5, a6, a7, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D9A500]);
  v17 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v18 = (void *)objc_msgSend(v16, "initWithNSUUID:", v17);

  objc_msgSend(a1, "createMentionDetectorEvaluatedEvent:withNLXMetadata:andLinkId:", v14, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createMentionDetectorEvaluatedTier1Event:withNLXMetadata:andLinkId:", v14, v15, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "emitEvent:", v19);
  LOBYTE(a1) = a4 & objc_msgSend(a1, "emitEvent:", v20);

  return (char)a1;
}

+ (id)createMentionResolverEvaluatedEvent:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t i;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D99D98]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    for (i = 0; ; ++i)
    {
      objc_msgSend(v7, "mentions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (i >= v14)
        break;
      v15 = (void *)MEMORY[0x1E0D9FAC8];
      objc_msgSend(v7, "mentions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "convertMatchingSpan:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "mainItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v19);

      }
    }
  }
  objc_msgSend(v10, "setMentionResolverSpans:", v11);
  objc_msgSend(v10, "setLinkId:", v9);
  v20 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v20, "setMarrsMentionResolverEnded:", v10);
  objc_msgSend(v20, "setEventMetadata:", v8);

  return v20;
}

+ (id)createMentionResolverEvaluatedTier1Event:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t i;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D99DA0]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    for (i = 0; ; ++i)
    {
      objc_msgSend(v7, "mentions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (i >= v14)
        break;
      v15 = (void *)MEMORY[0x1E0D9FAC8];
      objc_msgSend(v7, "mentions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "convertMatchingSpanTier1:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addObject:", v18);
    }
  }
  objc_msgSend(v10, "setMentionResolverSpansTier1s:", v11);
  objc_msgSend(v10, "setLinkId:", v9);
  v19 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v19, "setMarrsMentionResolverEndedTier1:", v10);
  objc_msgSend(v19, "setEventMetadata:", v8);

  return v19;
}

+ (BOOL)emitMentionResolverEvaluatedEventWithResponse:(id)a3 WithNlId:(id)a4 andWithTrpId:(id)a5 andWithRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int)a8
{
  uint64_t v8;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = *(_QWORD *)&a8;
  v14 = a3;
  +[NLXMetadataGenerator createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:](NLXMetadataGenerator, "createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:", a4, a5, a6, a7, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D9A500]);
  v17 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v18 = (void *)objc_msgSend(v16, "initWithNSUUID:", v17);

  objc_msgSend(a1, "createMentionResolverEvaluatedEvent:withNLXMetadata:andLinkId:", v14, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createMentionResolverEvaluatedTier1Event:withNLXMetadata:andLinkId:", v14, v15, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(a1, "emitEvent:", v19);
  LOBYTE(a1) = a4 & objc_msgSend(a1, "emitEvent:", v20);

  return (char)a1;
}

@end
