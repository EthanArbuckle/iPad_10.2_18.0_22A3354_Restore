@implementation ATXCombinedIntentStream

- (ATXCombinedIntentStream)init
{
  void *v3;
  void *v4;
  ATXCombinedIntentStream *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXCombinedIntentStream initWithIntentStream:activityStream:](self, "initWithIntentStream:activityStream:", v3, v4);

  return v5;
}

- (ATXCombinedIntentStream)initWithIntentStream:(id)a3 activityStream:(id)a4
{
  id v7;
  id v8;
  ATXCombinedIntentStream *v9;
  ATXCombinedIntentStream *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXCombinedIntentStream;
  v9 = -[ATXCombinedIntentStream init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intentStream, a3);
    objc_storeStrong((id *)&v10->_activityStream, a4);
  }

  return v10;
}

- (id)getSortedActivityAndIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 comparator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1A85A4F90]();
  -[ATXIntentStream getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:](self->_intentStream, "getIntentEventsBetweenStartDate:endDate:forSource:bundleIdFilter:allowMissingTitles:", v10, v11, 1, v12, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUserActivityStream getActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:](self->_activityStream, "getActivityIntentEventsBetweenStartDate:endDate:bundleIdFilter:", v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v17, "addObjectsFromArray:", v15);
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v17, "addObjectsFromArray:", v16);
  if (v13)
    objc_msgSend(v17, "sortUsingComparator:", v13);
  v18 = (void *)objc_msgSend(v17, "copy");

  objc_autoreleasePoolPop(v14);
  return v18;
}

- (id)getActivityAndIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 ascending:(BOOL)a5
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  BOOL v10;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__ATXCombinedIntentStream_getActivityAndIntentEventsBetweenStartDate_endDate_ascending___block_invoke;
  v9[3] = &__block_descriptor_33_e43_q24__0__ATXIntentEvent_8__ATXIntentEvent_16l;
  v10 = a5;
  -[ATXCombinedIntentStream getSortedActivityAndIntentEventsBetweenStartDate:endDate:bundleIdFilter:comparator:](self, "getSortedActivityAndIntentEventsBetweenStartDate:endDate:bundleIdFilter:comparator:", a3, a4, 0, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v5;

  return v7;
}

uint64_t __88__ATXCombinedIntentStream_getActivityAndIntentEventsBetweenStartDate_endDate_ascending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "dateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "dateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dateInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = objc_msgSend(v8, "compare:", v9);

  return v10;
}

- (id)getActivityAndIntentEventsFromLastMonth
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -2419200.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCombinedIntentStream getActivityAndIntentEventsBetweenStartDate:endDate:ascending:](self, "getActivityAndIntentEventsBetweenStartDate:endDate:ascending:", v4, v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityStream, 0);
  objc_storeStrong((id *)&self->_intentStream, 0);
}

@end
