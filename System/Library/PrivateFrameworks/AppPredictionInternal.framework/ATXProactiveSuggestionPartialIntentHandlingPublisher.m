@implementation ATXProactiveSuggestionPartialIntentHandlingPublisher

- (id)partialIntentUIFeedbackPublisher
{
  BPSPublisher *uiFeedbackPublisher;
  BMBookmarkablePublisher *intentPublisher;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  uiFeedbackPublisher = self->_uiFeedbackPublisher;
  intentPublisher = self->_intentPublisher;
  v14[0] = self->_appLaunchPublisher;
  v14[1] = intentPublisher;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__ATXProactiveSuggestionPartialIntentHandlingPublisher_partialIntentUIFeedbackPublisher__block_invoke;
  v13[3] = &unk_1E82DBFF8;
  v13[4] = self;
  -[BPSPublisher orderedMergeWithOthers:comparator:](uiFeedbackPublisher, "orderedMergeWithOthers:comparator:", v5, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CF94F0]);
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_msgSend(v7, "initWithFirst:second:", 0, v8);

  objc_msgSend(v6, "scanWithInitial:nextPartialResult:", v9, &__block_literal_global_181);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flatMapWithTransform:", &__block_literal_global_18_3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __88__ATXProactiveSuggestionPartialIntentHandlingPublisher_partialIntentUIFeedbackPublisher__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a2, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v4, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "handleAppLaunchAndReturnCompletedResults:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v5, "handleNewIntentEventAndReturnCompletedResults:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v8;
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v5, "handleNewFeedbackResultAndReturnCompletedResults:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF94F0]), "initWithFirst:second:", v6, v5);

  return v9;
}

- (ATXProactiveSuggestionPartialIntentHandlingPublisher)initWithUIFeedbackPublisher:(id)a3 appLaunchPublisher:(id)a4 intentPublisher:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXProactiveSuggestionPartialIntentHandlingPublisher *v12;
  ATXProactiveSuggestionPartialIntentHandlingPublisher *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXProactiveSuggestionPartialIntentHandlingPublisher;
  v12 = -[ATXProactiveSuggestionPartialIntentHandlingPublisher init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uiFeedbackPublisher, a3);
    objc_storeStrong((id *)&v13->_appLaunchPublisher, a4);
    objc_storeStrong((id *)&v13->_intentPublisher, a5);
  }

  return v13;
}

id __88__ATXProactiveSuggestionPartialIntentHandlingPublisher_partialIntentUIFeedbackPublisher__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "first");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_opt_new();
  }
  v5 = v4;
  objc_msgSend(v4, "bpsPublisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __88__ATXProactiveSuggestionPartialIntentHandlingPublisher_partialIntentUIFeedbackPublisher__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_timestampFromEvent:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_timestampFromEvent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (id)_timestampFromEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  void *v20;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "timestamp");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v5;
      objc_msgSend(v8, "session");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sessionEndDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXProactiveSuggestionPartialIntentHandlingPublisher.m"), 75, CFSTR("_timestampFromEvent received nil sessionEndDate with uiFeedbackResult: %@"), v8);

      }
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sessionEndDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      objc_msgSend(v11, "numberWithDouble:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      __atxlog_handle_blending_ecosystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXProactiveSuggestionPartialIntentHandlingPublisher _timestampFromEvent:].cold.1((uint64_t)self, (uint64_t)v5, v14);

      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = *MEMORY[0x1E0C99768];
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "raise:format:", v16, CFSTR("%@ - _timestampFromEvent invoked with unknown object: %@"), v18, v5);

      v7 = &unk_1E83CD9C0;
    }
  }

  return v7;
}

- (BPSPublisher)uiFeedbackPublisher
{
  return self->_uiFeedbackPublisher;
}

- (void)setUiFeedbackPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_uiFeedbackPublisher, a3);
}

- (BMBookmarkablePublisher)appLaunchPublisher
{
  return self->_appLaunchPublisher;
}

- (void)setAppLaunchPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_appLaunchPublisher, a3);
}

- (BMBookmarkablePublisher)intentPublisher
{
  return self->_intentPublisher;
}

- (void)setIntentPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_intentPublisher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentPublisher, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_uiFeedbackPublisher, 0);
}

- (void)_timestampFromEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ - _timestampFromEvent invoked with unknown object: %@", (uint8_t *)&v7, 0x16u);

}

@end
