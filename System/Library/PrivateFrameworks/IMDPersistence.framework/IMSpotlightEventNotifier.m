@implementation IMSpotlightEventNotifier

+ (id)sharedNotifier
{
  id v2;

  if (qword_1ED0D3918 != -1)
    dispatch_once(&qword_1ED0D3918, &unk_1E5AAF388);
  if (qword_1ED0D3920 && objc_msgSend(MEMORY[0x1E0D397C8], "notifyForSpotlightEvents"))
    v2 = (id)qword_1ED0D3920;
  else
    v2 = 0;
  return v2;
}

- (id)_displayStringForReason:(int64_t)a3
{
  void *v3;
  uint64_t v4;

  NSStringFromIMCoreSpotlightIndexReason();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("IMCoreSpotlightIndexReason")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("IMCoreSpotlightIndexReason"), "length"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (void)_presentNotificationWithMessage:(id)a3 newState:(id)a4 verbose:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v7 = a4;
  if (!v5 || objc_msgSend(MEMORY[0x1E0D397C8], "notifyForVerboseSpotlightEvents"))
  {
    v8 = objc_alloc(MEMORY[0x1E0D39800]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Messages Indexing %@"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTitle:body:", v9, v12);

    objc_msgSend(v10, "setTimeSensitive:", objc_msgSend(MEMORY[0x1E0D397C8], "spotlightEventsAreTimeSensitive"));
    v11 = objc_alloc_init(MEMORY[0x1E0D39808]);
    objc_msgSend(v11, "postNotification:", v10);

  }
}

- (void)deferredReindexScheduled
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Full reindex requested by Spotlight at %@, scheduled to run later."), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _presentNotificationWithMessage:newState:verbose:](self, "_presentNotificationWithMessage:newState:verbose:", v4, CFSTR("Scheduled"), 0);

}

- (id)_formatDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  __CFString *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3578];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "setDateStyle:", 1);
    objc_msgSend(v5, "setTimeStyle:", 2);
    objc_msgSend(v5, "stringFromDate:", v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("(nil)");
  }
  return v6;
}

- (void)reindexCompletedWithState:(id)a3 reason:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v7, "indexBeginDate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _formatDate:](self, "_formatDate:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _displayStringForReason:](self, "_displayStringForReason:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "initialIndexedMessages");
  v11 = objc_msgSend(v7, "initialTotalMessages");

  objc_msgSend(v6, "stringWithFormat:", CFSTR("Indexing initially began %@ due to %@. Indexed %lld/%lld messages."), v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _presentNotificationWithMessage:newState:verbose:](self, "_presentNotificationWithMessage:newState:verbose:", v12, CFSTR("Finished"), 0);

}

- (void)reindexInitiatedWithTotalMessages:(int64_t)a3 reason:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[IMSpotlightEventNotifier _displayStringForReason:](self, "_displayStringForReason:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Initiating reindex of %lld messages due to %@."), a3, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _presentNotificationWithMessage:newState:verbose:](self, "_presentNotificationWithMessage:newState:verbose:", v7, CFSTR("Initiated"), 0);

}

- (void)reindexResumedWithState:(id)a3 reason:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v7, "indexBeginDate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _formatDate:](self, "_formatDate:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _displayStringForReason:](self, "_displayStringForReason:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "initialIndexedMessages");
  v11 = objc_msgSend(v7, "initialTotalMessages");

  objc_msgSend(v6, "stringWithFormat:", CFSTR("Resuming indexing, which initially began %@ due to %@. Indexed %lld/%lld messages."), v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _presentNotificationWithMessage:newState:verbose:](self, "_presentNotificationWithMessage:newState:verbose:", v12, CFSTR("Resumed"), 1);

}

- (void)reindexPausedWithState:(id)a3 reason:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v7, "indexBeginDate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _formatDate:](self, "_formatDate:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _displayStringForReason:](self, "_displayStringForReason:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "initialIndexedMessages");
  v11 = objc_msgSend(v7, "initialTotalMessages");

  objc_msgSend(v6, "stringWithFormat:", CFSTR("Reindexing paused, which initially began %@ due to %@. Indexed %lld/%lld messages."), v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _presentNotificationWithMessage:newState:verbose:](self, "_presentNotificationWithMessage:newState:verbose:", v12, CFSTR("Paused"), 1);

}

- (void)reindexSuspendedUntilDate:(id)a3 withError:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reindexing suspended until %@ due to an error.\n\n%@"), a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMSpotlightEventNotifier _presentNotificationWithMessage:newState:verbose:](self, "_presentNotificationWithMessage:newState:verbose:", v5, CFSTR("Suspended"), 1);

}

@end
