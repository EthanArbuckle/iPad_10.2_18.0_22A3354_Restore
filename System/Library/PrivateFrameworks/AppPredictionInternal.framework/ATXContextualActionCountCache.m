@implementation ATXContextualActionCountCache

- (ATXContextualActionCountCache)init
{
  ATXContextualActionCountCache *v2;
  uint64_t v3;
  NSDate *oldestAction;
  uint64_t v5;
  NSCountedSet *headingToWorkActions;
  uint64_t v7;
  NSCountedSet *headingHomeActions;
  uint64_t v9;
  NSCountedSet *unspecifiedActions;
  uint64_t v11;
  NSDateInterval *headingToWorkDateInterval;
  uint64_t v13;
  NSDateInterval *headingHomeDateInterval;
  uint64_t v15;
  NSDateInterval *otherDateInterval;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ATXContextualActionCountCache;
  v2 = -[ATXContextualActionCountCache init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v3 = objc_claimAutoreleasedReturnValue();
    oldestAction = v2->_oldestAction;
    v2->_oldestAction = (NSDate *)v3;

    v5 = objc_opt_new();
    headingToWorkActions = v2->headingToWorkActions;
    v2->headingToWorkActions = (NSCountedSet *)v5;

    v7 = objc_opt_new();
    headingHomeActions = v2->headingHomeActions;
    v2->headingHomeActions = (NSCountedSet *)v7;

    v9 = objc_opt_new();
    unspecifiedActions = v2->unspecifiedActions;
    v2->unspecifiedActions = (NSCountedSet *)v9;

    objc_storeStrong((id *)&v2->allActions, v2->unspecifiedActions);
    objc_msgSend(MEMORY[0x1E0CF8D50], "defaultTimeWindowForContextType:", 2);
    v11 = objc_claimAutoreleasedReturnValue();
    headingToWorkDateInterval = v2->headingToWorkDateInterval;
    v2->headingToWorkDateInterval = (NSDateInterval *)v11;

    objc_msgSend(MEMORY[0x1E0CF8D50], "defaultTimeWindowForContextType:", 1);
    v13 = objc_claimAutoreleasedReturnValue();
    headingHomeDateInterval = v2->headingHomeDateInterval;
    v2->headingHomeDateInterval = (NSDateInterval *)v13;

    objc_msgSend(MEMORY[0x1E0CF8D50], "defaultTimeWindowForContextType:", 0);
    v15 = objc_claimAutoreleasedReturnValue();
    otherDateInterval = v2->otherDateInterval;
    v2->otherDateInterval = (NSDateInterval *)v15;

  }
  return v2;
}

- (void)addMinimalActionParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDate *v7;
  NSDate *oldestAction;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  NSObject *v12;

  v4 = a3;
  objc_msgSend(v4, "actionTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "actionTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActionTime:", 0);
    -[NSDate earlierDate:](self->_oldestAction, "earlierDate:", v6);
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    oldestAction = self->_oldestAction;
    self->_oldestAction = v7;

    v9 = -[ATXContextualActionCountCache isHeadingToWorkActionTime:](self, "isHeadingToWorkActionTime:", v6);
    v10 = -[ATXContextualActionCountCache isHeadingHomeActionTime:](self, "isHeadingHomeActionTime:", v6);
    v11 = -[ATXContextualActionCountCache isOtherActionTime:](self, "isOtherActionTime:", v6);
    if (v9)
    {
      -[NSCountedSet addObject:](self->headingToWorkActions, "addObject:", v4);
      if (!v10)
      {
LABEL_4:
        if (!v11)
        {
LABEL_6:

          goto LABEL_10;
        }
LABEL_5:
        -[NSCountedSet addObject:](self->unspecifiedActions, "addObject:", v4);
        goto LABEL_6;
      }
    }
    else if (!v10)
    {
      goto LABEL_4;
    }
    -[NSCountedSet addObject:](self->headingHomeActions, "addObject:", v4);
    if (!v11)
      goto LABEL_6;
    goto LABEL_5;
  }
  __atxlog_handle_dailyroutines();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[ATXContextualActionCountCache addMinimalActionParameter:].cold.1(v4, v12);

LABEL_10:
}

- (BOOL)isHeadingToWorkActionTime:(id)a3
{
  NSDateInterval *headingToWorkDateInterval;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  headingToWorkDateInterval = self->headingToWorkDateInterval;
  if (!headingToWorkDateInterval)
    return 1;
  v5 = a3;
  -[NSDateInterval startDate](headingToWorkDateInterval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->headingToWorkDateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[ATXTimeUtil time:isBetweenStartTime:andEndTime:](ATXTimeUtil, "time:isBetweenStartTime:andEndTime:", v5, v6, v7);

  return v8;
}

- (BOOL)isHeadingHomeActionTime:(id)a3
{
  NSDateInterval *headingHomeDateInterval;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  headingHomeDateInterval = self->headingHomeDateInterval;
  if (!headingHomeDateInterval)
    return 1;
  v5 = a3;
  -[NSDateInterval startDate](headingHomeDateInterval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->headingHomeDateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[ATXTimeUtil time:isBetweenStartTime:andEndTime:](ATXTimeUtil, "time:isBetweenStartTime:andEndTime:", v5, v6, v7);

  return v8;
}

- (BOOL)isOtherActionTime:(id)a3
{
  NSDateInterval *otherDateInterval;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  otherDateInterval = self->otherDateInterval;
  if (!otherDateInterval)
    return 1;
  v5 = a3;
  -[NSDateInterval startDate](otherDateInterval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->otherDateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[ATXTimeUtil time:isBetweenStartTime:andEndTime:](ATXTimeUtil, "time:isBetweenStartTime:andEndTime:", v5, v6, v7);

  return v8;
}

- (id)getCountsForContext:(id)a3
{
  id v4;
  uint64_t v5;
  NSCountedSet *unspecifiedActions;
  uint64_t v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "contextType");
  switch(v5)
  {
    case 0:
      unspecifiedActions = self->unspecifiedActions;
      goto LABEL_7;
    case 1:
      unspecifiedActions = self->headingHomeActions;
      goto LABEL_7;
    case 2:
      unspecifiedActions = self->headingToWorkActions;
LABEL_7:
      v7 = -[NSCountedSet copy](unspecifiedActions, "copy");
      goto LABEL_11;
  }
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[ATXContextualActionCountCache getCountsForContext:].cold.1(v4, v8);

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unsupported context type was given: %lu"), objc_msgSend(v4, "contextType"));
  v7 = objc_opt_new();
LABEL_11:
  v9 = (void *)v7;

  return v9;
}

- (id)getAllCounts
{
  return (id)-[NSCountedSet copy](self->allActions, "copy");
}

- (NSDate)oldestAction
{
  return self->_oldestAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestAction, 0);
  objc_storeStrong((id *)&self->otherDateInterval, 0);
  objc_storeStrong((id *)&self->headingHomeDateInterval, 0);
  objc_storeStrong((id *)&self->headingToWorkDateInterval, 0);
  objc_storeStrong((id *)&self->allActions, 0);
  objc_storeStrong((id *)&self->unspecifiedActions, 0);
  objc_storeStrong((id *)&self->headingHomeActions, 0);
  objc_storeStrong((id *)&self->headingToWorkActions, 0);
}

- (void)addMinimalActionParameter:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Cannot process action %@:%@ without valid actionTime", (uint8_t *)&v6, 0x16u);

}

- (void)getCountsForContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "contextType");
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Unsupported context type was given: %lu", (uint8_t *)&v3, 0xCu);
}

@end
