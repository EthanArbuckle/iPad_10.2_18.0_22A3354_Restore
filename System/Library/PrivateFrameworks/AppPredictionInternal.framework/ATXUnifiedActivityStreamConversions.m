@implementation ATXUnifiedActivityStreamConversions

id __80___ATXUnifiedActivityStreamConversions_transitionPublisherFromSessionPublisher___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXUnifiedInferredActivityTransition *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v9;
  ATXUnifiedInferredActivityTransition *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = [ATXUnifiedInferredActivityTransition alloc];
  objc_msgSend(v2, "startTime");
  v5 = v4;
  objc_msgSend(v2, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "inferredActivityType");
  objc_msgSend(v2, "confidence");
  v9 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](v3, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", 1, v6, v7, v5, v8);
  v21[0] = v9;
  v10 = [ATXUnifiedInferredActivityTransition alloc];
  objc_msgSend(v2, "endTime");
  v12 = v11;
  objc_msgSend(v2, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v2, "inferredActivityType");
  objc_msgSend(v2, "confidence");
  v16 = v15;

  v17 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](v10, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", 0, v13, v14, v12, v16);
  v21[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "bpsPublisher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __80___ATXUnifiedActivityStreamConversions_sessionPublisherFromTransitionPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D81638];
  v5 = a3;
  objc_msgSend(a2, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tupleWithFirst:second:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __80___ATXUnifiedActivityStreamConversions_sessionPublisherFromTransitionPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "second");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v2, "first");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEntryEvent");
      objc_msgSend(v2, "second");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6 ^ objc_msgSend(v7, "isEntryEvent");

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __80___ATXUnifiedActivityStreamConversions_sessionPublisherFromTransitionPublisher___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  ATXUnifiedInferredActivitySession *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  id v19;
  double v20;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEntryEvent");

  v5 = [ATXUnifiedInferredActivitySession alloc];
  objc_msgSend(v2, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionTime");
  v8 = v7;
  objc_msgSend(v2, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitionTime");
  v11 = v10;
  objc_msgSend(v2, "first");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "first");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v4)
  {
    v16 = objc_msgSend(v14, "inferredActivityType");
    objc_msgSend(v2, "first");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "confidence");
    v19 = -[ATXUnifiedInferredActivitySession initFromStartTime:endTime:source:activityType:confidence:](v5, "initFromStartTime:endTime:source:activityType:confidence:", v13, v16, v8, v11, v18);

  }
  else
  {

    objc_msgSend(v15, "confidence");
    v19 = -[ATXUnifiedInferredActivitySession initFromStartTime:endTime:source:activityType:confidence:](v5, "initFromStartTime:endTime:source:activityType:confidence:", v13, 14, v8, v11, v20);
  }

  return v19;
}

BOOL __80___ATXUnifiedActivityStreamConversions_sessionPublisherFromTransitionPublisher___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = a2;
  objc_msgSend(v2, "endTime");
  v4 = v3;
  objc_msgSend(v2, "startTime");
  v6 = v5;

  return v4 - v6 > 1.0;
}

@end
