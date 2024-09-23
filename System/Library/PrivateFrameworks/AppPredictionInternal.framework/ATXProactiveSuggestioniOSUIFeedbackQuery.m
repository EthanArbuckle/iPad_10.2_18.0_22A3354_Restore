@implementation ATXProactiveSuggestioniOSUIFeedbackQuery

- (ATXProactiveSuggestioniOSUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ATXProactiveSuggestioniOSUIFeedbackQuery *v20;
  NSObject *v21;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v14 = v13;
  -[ATXProactiveSuggestioniOSUIFeedbackQuery uiPublisherForConsumerSubType:startTime:](self, "uiPublisherForConsumerSubType:startTime:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "publisherFromStartTime:consumerSubType:", v8, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXProactiveSuggestioniOSUIFeedbackQuery contextPublisherWithStartTime:](self, "contextPublisherWithStartTime:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ATXProactiveSuggestionUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:uiPublisher:blendingModelPublisher:contextPublisher:hyperParameters:](self, "initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:uiPublisher:blendingModelPublisher:contextPublisher:hyperParameters:", v10, v8, v11, v12, v15, v17, v18, v19);

    v20 = self;
  }
  else
  {
    __atxlog_handle_blending_ecosystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestioniOSUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:].cold.1((uint64_t)self, v8, v21);

    v20 = 0;
  }

  return v20;
}

- (id)uiPublisherForConsumerSubType:(unsigned __int8)a3 startTime:(double)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = 0;
  if ((int)a3 > 33)
  {
    if (a3 == 43 || a3 == 35)
    {
      v6 = a3;
    }
    else
    {
      v6 = a3;
      if (a3 != 34)
        return v5;
    }
    goto LABEL_11;
  }
  v6 = 9;
  if (a3 == 9 || a3 == 21 || (v6 = a3, a3 == 22))
  {
LABEL_11:
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "genericEventPublisherFromStartTime:consumerSubType:", v6, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)contextPublisherWithStartTime:(double)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "publisherFromStartTime:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)initWithClientModelIds:(NSObject *)a3 consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:.cold.1(uint64_t a1, unsigned __int8 a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_fault_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_FAULT, "%@ - could not find iOS ui publisher for consumerSubType: %@", (uint8_t *)&v8, 0x16u);

}

@end
