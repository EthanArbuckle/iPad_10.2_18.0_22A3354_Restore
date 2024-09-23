@implementation _CDLogging

+ (id)contextChannel
{
  if (contextChannel_onceToken != -1)
    dispatch_once(&contextChannel_onceToken, &__block_literal_global_12);
  return (id)contextChannel_contextChannel;
}

+ (id)spotlightReceiverChannel
{
  if (spotlightReceiverChannel_onceToken != -1)
    dispatch_once(&spotlightReceiverChannel_onceToken, &__block_literal_global_13);
  return (id)spotlightReceiverChannel_spotlightReceiverChannel;
}

+ (id)knowledgeChannel
{
  if (knowledgeChannel_onceToken != -1)
    dispatch_once(&knowledgeChannel_onceToken, &__block_literal_global_59);
  return (id)knowledgeChannel_knowledgeChannel;
}

+ (id)instrumentationChannel
{
  if (instrumentationChannel_onceToken != -1)
    dispatch_once(&instrumentationChannel_onceToken, &__block_literal_global_10_1);
  return (id)instrumentationChannel_instrumentationChannel;
}

+ (id)knowledgeSignpost
{
  if (knowledgeSignpost_onceToken != -1)
    dispatch_once(&knowledgeSignpost_onceToken, &__block_literal_global_19);
  return (id)knowledgeSignpost_knowledgeSignpost;
}

+ (id)interactionChannel
{
  if (interactionChannel_onceToken != -1)
    dispatch_once(&interactionChannel_onceToken, &__block_literal_global_7);
  return (id)interactionChannel_interactionChannel;
}

+ (id)mediaAnalysisChannel
{
  if (mediaAnalysisChannel__pasOnceToken52 != -1)
    dispatch_once(&mediaAnalysisChannel__pasOnceToken52, &__block_literal_global_8);
  return (id)mediaAnalysisChannel_mediaAnalysisChannel;
}

+ (id)autoSUChannel
{
  if (autoSUChannel_onceToken != -1)
    dispatch_once(&autoSUChannel_onceToken, &__block_literal_global_11);
  return (id)autoSUChannel_autoSUChannel;
}

+ (id)dataCollectionChannel
{
  if (dataCollectionChannel_onceToken != -1)
    dispatch_once(&dataCollectionChannel_onceToken, &__block_literal_global_14_0);
  return (id)dataCollectionChannel_dataCollectionChannel;
}

+ (id)admissionCheckChannel
{
  if (admissionCheckChannel_onceToken != -1)
    dispatch_once(&admissionCheckChannel_onceToken, &__block_literal_global_15_0);
  return (id)admissionCheckChannel_admissionCheckChannel;
}

+ (id)communicatorChannel
{
  if (communicatorChannel_onceToken != -1)
    dispatch_once(&communicatorChannel_onceToken, &__block_literal_global_16_0);
  return (id)communicatorChannel_communicatorChannel;
}

+ (id)syncChannel
{
  if (syncChannel_onceToken != -1)
    dispatch_once(&syncChannel_onceToken, &__block_literal_global_18_0);
  return (id)syncChannel_syncChannel;
}

+ (id)interactionSignpost
{
  if (interactionSignpost_onceToken != -1)
    dispatch_once(&interactionSignpost_onceToken, &__block_literal_global_21_0);
  return (id)interactionSignpost_interactionSignpost;
}

+ (id)descriptionOfObject:(id)a3 redacted:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (a4)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v8 = CFSTR("redacted");
        goto LABEL_9;
      }
      objc_msgSend(v6, "redactedDescription");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "description");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (__CFString *)v7;
  }
  else
  {
    v8 = CFSTR("nil");
  }
LABEL_9:

  return v8;
}

+ (id)descriptionOfArray:(id)a3 redacted:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a4;
  v5 = a3;
  if (!v5)
  {
    v8 = CFSTR("nil");
    return v8;
  }
  v6 = v5;
  if (v4 && objc_msgSend(v5, "count"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42___CDLogging_descriptionOfArray_redacted___block_invoke;
    v11[3] = &unk_1E26E5ED8;
    v11[4] = &v12;
    objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*((_BYTE *)v13 + 24))
    {
      v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("redacted (%tu items)"), objc_msgSend(v7, "count"));
      _Block_object_dispose(&v12, 8);
      goto LABEL_8;
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = v6;
  }
  v8 = (__CFString *)objc_msgSend(CFSTR("\n[\n"), "mutableCopy");
  objc_msgSend(v7, "_pas_componentsJoinedByString:", CFSTR(",\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString appendString:](v8, "appendString:", v9);

  -[__CFString appendString:](v8, "appendString:", CFSTR("\n]"));
LABEL_8:

  return v8;
}

@end
