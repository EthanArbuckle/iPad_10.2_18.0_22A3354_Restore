@implementation ATXHomeFocusModeEventProvider

- (ATXHomeFocusModeEventProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXHomeFocusModeEventProvider;
  return -[ATXModeTransitionModeEventProvider initWithMode:](&v3, sel_initWithMode_, 1);
}

- (id)biomePublisherWithBookmark:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  ATXModeEvent *v16;
  id v17;
  void *v18;
  void *v20;
  void *v22;
  void *v23;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", 17, 0, 0, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", 22, 0, 0, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", 10, 0, 0, v9, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", 22, 0, 0, v10, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -61;
  do
  {
    objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, v11 + 1, v6, 0, v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, v11 + 1, v8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isDateInWeekend:", v12))
    {
      objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, v11 + 1, v23, 0);
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, v11 + 1, v22, 0);
      v15 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v15;
      v12 = (void *)v14;
    }
    v16 = -[ATXModeEvent initWithStartDate:endDate:]([ATXModeEvent alloc], "initWithStartDate:endDate:", v12, v13);
    v17 = objc_alloc(MEMORY[0x1E0D024C8]);
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v18 = (void *)objc_msgSend(v17, "initWithEventBody:timestamp:", v16);
    objc_msgSend(v3, "addObject:", v18);

  }
  while (!__CFADD__(v11++, 1));
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02478]), "initWithSequence:", v3);

  return v20;
}

@end
