@implementation ContextualSpanMatcherSELFLogging

+ (BOOL)emitEvent:(id)a3
{
  id v3;
  os_log_t v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.siri.marrs.mrr", "ContextualSpanMatcher");
  if (objc_msgSend(v3, "hasEventMetadata")
    && (objc_msgSend(v3, "eventMetadata"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasNlId"),
        v5,
        (v6 & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emitMessage:", v3);

    v8 = v4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "eventMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nlId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "toNSUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = 136315138;
      v16 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1C281A000, v8, OS_LOG_TYPE_DEFAULT, "Emitted event with NL ID: %s", (uint8_t *)&v15, 0xCu);

    }
    v13 = 1;
  }
  else
  {
    v13 = 0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1C281A000, v4, OS_LOG_TYPE_DEFAULT, "Due to NL ID being Nil, this event won't be emitted.", (uint8_t *)&v15, 2u);
      v13 = 0;
    }
  }

  return v13;
}

+ (id)createContextualSpanMatcherEndedEvent:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D99D78]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "contextualSpans");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = 0;
    do
    {
      v15 = (void *)MEMORY[0x1E0D9FAC8];
      objc_msgSend(v7, "contextualSpans");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "convertMatchingSpan:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "mainItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v19);

      }
      ++v14;
      objc_msgSend(v7, "contextualSpans");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v14 < v21);
  }
  objc_msgSend(v10, "setContextualSpans:", v11);
  objc_msgSend(v10, "setLinkId:", v9);
  v22 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v22, "setMarrsContextualSpanMatcherEnded:", v10);
  objc_msgSend(v22, "setEventMetadata:", v8);

  return v22;
}

+ (id)createContextualSpanMatcherEndedTier1Event:(id)a3 withNLXMetadata:(id)a4 andLinkId:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D99D80]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "contextualSpans");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = 0;
    do
    {
      v15 = (void *)MEMORY[0x1E0D9FAC8];
      objc_msgSend(v7, "contextualSpans");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "convertMatchingSpanTier1:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addObject:", v18);
      ++v14;
      objc_msgSend(v7, "contextualSpans");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

    }
    while (v14 < v20);
  }
  objc_msgSend(v10, "setContextualSpansTier1s:", v11);
  objc_msgSend(v10, "setLinkId:", v9);
  v21 = objc_alloc_init(MEMORY[0x1E0D99E28]);
  objc_msgSend(v21, "setMarrsContextualSpanMatcherEndedTier1:", v10);
  objc_msgSend(v21, "setEventMetadata:", v8);

  return v21;
}

+ (BOOL)emitContextualSpanMatcherEndedEventWithResponse:(id)a3 WithNlId:(id)a4 andWithTrpId:(id)a5 andWithRequestId:(id)a6 andWithResultCandidateId:(id)a7 andWithRequester:(int)a8
{
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  int v31;
  int v32;
  void *v34;
  NSObject *v35;
  uint8_t buf[16];

  v8 = *(_QWORD *)&a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = os_log_create("com.apple.siri.marrs.mrr", "ContextualSpanMatcher");
  v20 = v19;
  if (v14)
  {
    +[NLXMetadataGenerator createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:](NLXMetadataGenerator, "createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:", v15, v16, v17, v18, v8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x1E0D9A500]);
    v22 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    v23 = (void *)objc_msgSend(v21, "initWithNSUUID:", v22);

    objc_msgSend(a1, "createContextualSpanMatcherEndedEvent:withNLXMetadata:andLinkId:", v14, v34, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "createContextualSpanMatcherEndedTier1Event:withNLXMetadata:andLinkId:", v14, v34, v23);
    v35 = v20;
    v25 = v17;
    v26 = v15;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v14;
    v29 = v18;
    v30 = v16;
    v31 = objc_msgSend(a1, "emitEvent:", v24);
    v32 = v31 & objc_msgSend(a1, "emitEvent:", v27);
    v16 = v30;
    v18 = v29;
    v14 = v28;

    v15 = v26;
    v17 = v25;
    v20 = v35;

  }
  else
  {
    LOBYTE(v32) = 0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C281A000, v20, OS_LOG_TYPE_DEFAULT, "Due to CSM Response being Nil, this event won't be emitted.", buf, 2u);
      LOBYTE(v32) = 0;
    }
  }

  return v32;
}

@end
