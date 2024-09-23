@implementation ATXUnifiedModeStreamModeEventProvider

- (id)biomePublisherWithBookmark:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -2419200.0);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "sessionPublisherFromStartTime:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__ATXUnifiedModeStreamModeEventProvider_biomePublisherWithBookmark___block_invoke;
  v9[3] = &unk_1E82EAAF0;
  v9[4] = self;
  objc_msgSend(v6, "filterWithIsIncluded:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __68__ATXUnifiedModeStreamModeEventProvider_biomePublisherWithBookmark___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "inferredActivityType");
  objc_msgSend(*(id *)(a1 + 32), "mode");
  return v3 == ATXActivityTypeFromMode();
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)aggregationEventsFromEvent:(id)a3
{
  id v4;
  void *v5;
  ATXModeEvent *v6;
  void *v7;
  void *v8;
  ATXModeEvent *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ATXUnifiedModeStreamModeEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    -[ATXUnifiedModeStreamModeEventProvider dateIntervalFromEvent:](self, "dateIntervalFromEvent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = [ATXModeEvent alloc];
      objc_msgSend(v5, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ATXModeEvent initWithStartDate:endDate:](v6, "initWithStartDate:endDate:", v7, v8);

      v12[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (-[ATXUnifiedModeStreamModeEventProvider isEventFromProvider:](self, "isEventFromProvider:", v4))
  {
    v5 = (objc_class *)MEMORY[0x1E0C99D68];
    v6 = v4;
    v7 = [v5 alloc];
    objc_msgSend(v6, "startTime");
    v8 = (void *)objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:");
    v9 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "endTime");
    v11 = v10;

    v12 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:", v11);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
