@implementation EKCalendarSuggestionNotification

- (NSString)originAppName
{
  NSString *originAppName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;

  originAppName = self->_originAppName;
  if (!originAppName)
  {
    -[EKCalendarSuggestionNotification suggestedEvent](self, "suggestedEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "origin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);
    objc_msgSend(v7, "localizedName");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_originAppName;
    self->_originAppName = v8;

    originAppName = self->_originAppName;
  }
  return originAppName;
}

+ (id)_queue
{
  if (_queue_onceToken_0 != -1)
    dispatch_once(&_queue_onceToken_0, &__block_literal_global_33);
  return (id)_queue_queue_0;
}

void __42__EKCalendarSuggestionNotification__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.EventKit.EKCalendarSuggestionNotificationQueue", 0);
  v1 = (void *)_queue_queue_0;
  _queue_queue_0 = (uint64_t)v0;

}

- (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass();
}

- (void)updateSuggestedEventWithEventStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__EKCalendarSuggestionNotification_updateSuggestedEventWithEventStore___block_invoke;
  v7[3] = &unk_1E47853B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __71__EKCalendarSuggestionNotification_updateSuggestedEventWithEventStore___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "resourceChangeFromEventStore:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD **)(a1 + 32);
  if (v5)
  {
    objc_msgSend((id)objc_msgSend(v6, "_SGSuggestionsServiceClass"), "serviceForEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__8;
    v20 = __Block_byref_object_dispose__8;
    v21 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__EKCalendarSuggestionNotification_updateSuggestedEventWithEventStore___block_invoke_9;
    v12[3] = &unk_1E4785F18;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v2;
    v15 = &v16;
    v9 = v8;
    v14 = v9;
    objc_msgSend(v7, "eventFromUniqueId:withCompletion:", v5, v12);
    v10 = dispatch_time(0, 100000000);
    if (!dispatch_group_wait(v9, v10))
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 216), (id)v17[5]);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v11 = (void *)v6[27];
    v6[27] = 0;

  }
}

void __71__EKCalendarSuggestionNotification_updateSuggestedEventWithEventStore___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = CFSTR("no error returned");
      if (v7)
        v14 = v7;
      v15 = 136315906;
      v16 = "-[EKCalendarSuggestionNotification updateSuggestedEventWithEventStore:]_block_invoke";
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_error_impl(&dword_1A2318000, v8, OS_LOG_TYPE_ERROR, "%s: Error attempting to look up the suggested event for notification [%@] and resource change [%@] with error [%@].", (uint8_t *)&v15, 0x2Au);
    }
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (SGEvent)suggestedEvent
{
  SGEvent *suggestedEvent;
  NSObject *v4;

  suggestedEvent = self->_suggestedEvent;
  if (!suggestedEvent)
  {
    objc_msgSend((id)objc_opt_class(), "_queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v4, &__block_literal_global_13_0);

    suggestedEvent = self->_suggestedEvent;
  }
  return suggestedEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originAppName, 0);
  objc_storeStrong((id *)&self->_suggestedEvent, 0);
}

@end
