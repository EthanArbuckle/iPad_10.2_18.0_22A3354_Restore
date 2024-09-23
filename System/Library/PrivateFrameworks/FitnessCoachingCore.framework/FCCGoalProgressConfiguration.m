@implementation FCCGoalProgressConfiguration

- (FCCGoalProgressConfiguration)initWithMinimumNumberOfActiveDays:(int64_t)a3 userStartOfDay:(id)a4 userEndOfDay:(id)a5 expirationDate:(id)a6 almostThereConfiguration:(id)a7 atypicalDayConfiguration:(id)a8 completionOffTrackConfiguration:(id)a9
{
  id v16;
  id v17;
  FCCGoalProgressConfiguration *v18;
  FCCGoalProgressConfiguration *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)FCCGoalProgressConfiguration;
  v18 = -[FCCGoalProgressConfiguration init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_minimumNumberOfActiveDays = a3;
    objc_storeStrong((id *)&v18->_userStartOfDay, a4);
    objc_storeStrong((id *)&v19->_userEndOfDay, a5);
    objc_storeStrong((id *)&v19->_expirationDate, a6);
    objc_storeStrong((id *)&v19->_almostThereConfiguration, a7);
    objc_storeStrong((id *)&v19->_atypicalDayConfiguration, a8);
    objc_storeStrong((id *)&v19->_completionOffTrackConfiguration, a9);
  }

  return v19;
}

- (NSString)description
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = CFSTR("YES");
  if (self->_almostThereConfiguration)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (self->_atypicalDayConfiguration)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (!self->_completionOffTrackConfiguration)
    v2 = CFSTR("NO");
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCGoalProgressConfiguration: { \n    minimumNumberOfActiveDays: %ld, \n    userStartOfDay: %@, \n    userEndOfDay: %@, \n    expirationDate: %@ \n    almostThereConfiguration: %@ \n    atypicalDayConfiguration: %@ \n    completionOffTrackConfiguration %@ \n}"), *(_OWORD *)&self->_minimumNumberOfActiveDays, self->_userEndOfDay, self->_expirationDate, v3, v4, v2);
}

- (FCCGoalProgressConfiguration)initWithProtobuf:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  FCCAlmostThereConfiguration *v14;
  void *v15;
  FCCAlmostThereConfiguration *v16;
  FCCAtypicalDayConfiguration *v17;
  void *v18;
  FCCAtypicalDayConfiguration *v19;
  void *v20;
  FCCCompletionOffTrackConfiguration *v21;
  FCCGoalProgressConfiguration *v22;

  v4 = a3;
  v5 = objc_msgSend(v4, "minimumNumberOfActiveDays");
  v6 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v4, "userStartOfDayDate");
  v7 = (void *)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
  objc_msgSend(v4, "userEndOfDayDate");
  if (v8 <= 0.0)
  {
    v10 = 0;
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v4, "userEndOfDayDate");
    v10 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
  }
  v11 = v5;
  v12 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v4, "expirationDate");
  v13 = (void *)objc_msgSend(v12, "initWithTimeIntervalSinceReferenceDate:");
  v14 = [FCCAlmostThereConfiguration alloc];
  objc_msgSend(v4, "almostThereConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FCCAlmostThereConfiguration initWithProtobuf:](v14, "initWithProtobuf:", v15);

  v17 = [FCCAtypicalDayConfiguration alloc];
  objc_msgSend(v4, "atypicalDayConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[FCCAtypicalDayConfiguration initWithProtobuf:](v17, "initWithProtobuf:", v18);

  objc_msgSend(v4, "completionOffTrackConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[FCCCompletionOffTrackConfiguration initWithProtobuf:]([FCCCompletionOffTrackConfiguration alloc], "initWithProtobuf:", v20);
  v22 = -[FCCGoalProgressConfiguration initWithMinimumNumberOfActiveDays:userStartOfDay:userEndOfDay:expirationDate:almostThereConfiguration:atypicalDayConfiguration:completionOffTrackConfiguration:](self, "initWithMinimumNumberOfActiveDays:userStartOfDay:userEndOfDay:expirationDate:almostThereConfiguration:atypicalDayConfiguration:completionOffTrackConfiguration:", v11, v7, v10, v13, v16, v19, v21);

  return v22;
}

- (id)protobuf
{
  FCCGoalProgressConfigurationProtobuf *v3;
  NSDate *userEndOfDay;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(FCCGoalProgressConfigurationProtobuf);
  -[FCCGoalProgressConfigurationProtobuf setMinimumNumberOfActiveDays:](v3, "setMinimumNumberOfActiveDays:", LODWORD(self->_minimumNumberOfActiveDays));
  -[NSDate timeIntervalSinceReferenceDate](self->_userStartOfDay, "timeIntervalSinceReferenceDate");
  -[FCCGoalProgressConfigurationProtobuf setUserStartOfDayDate:](v3, "setUserStartOfDayDate:");
  userEndOfDay = self->_userEndOfDay;
  if (userEndOfDay)
    -[NSDate timeIntervalSinceReferenceDate](userEndOfDay, "timeIntervalSinceReferenceDate");
  else
    v5 = 0.0;
  -[FCCGoalProgressConfigurationProtobuf setUserEndOfDayDate:](v3, "setUserEndOfDayDate:", v5);
  -[NSDate timeIntervalSinceReferenceDate](self->_expirationDate, "timeIntervalSinceReferenceDate");
  -[FCCGoalProgressConfigurationProtobuf setExpirationDate:](v3, "setExpirationDate:");
  -[FCCAlmostThereConfiguration protobuf](self->_almostThereConfiguration, "protobuf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCGoalProgressConfigurationProtobuf setAlmostThereConfiguration:](v3, "setAlmostThereConfiguration:", v6);

  -[FCCAtypicalDayConfiguration protobuf](self->_atypicalDayConfiguration, "protobuf");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCGoalProgressConfigurationProtobuf setAtypicalDayConfiguration:](v3, "setAtypicalDayConfiguration:", v7);

  -[FCCCompletionOffTrackConfiguration protobuf](self->_completionOffTrackConfiguration, "protobuf");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCGoalProgressConfigurationProtobuf setCompletionOffTrackConfiguration:](v3, "setCompletionOffTrackConfiguration:", v8);

  return v3;
}

- (FCCGoalProgressConfiguration)initWithTransportData:(id)a3
{
  id v4;
  FCCGoalProgressConfigurationProtobuf *v5;
  FCCGoalProgressConfiguration *v6;

  v4 = a3;
  v5 = -[FCCGoalProgressConfigurationProtobuf initWithData:]([FCCGoalProgressConfigurationProtobuf alloc], "initWithData:", v4);

  v6 = -[FCCGoalProgressConfiguration initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (id)transportData
{
  void *v2;
  void *v3;

  -[FCCGoalProgressConfiguration protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)minimumNumberOfActiveDays
{
  return self->_minimumNumberOfActiveDays;
}

- (NSDate)userStartOfDay
{
  return self->_userStartOfDay;
}

- (NSDate)userEndOfDay
{
  return self->_userEndOfDay;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (FCCAlmostThereConfiguration)almostThereConfiguration
{
  return self->_almostThereConfiguration;
}

- (FCCAtypicalDayConfiguration)atypicalDayConfiguration
{
  return self->_atypicalDayConfiguration;
}

- (FCCCompletionOffTrackConfiguration)completionOffTrackConfiguration
{
  return self->_completionOffTrackConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionOffTrackConfiguration, 0);
  objc_storeStrong((id *)&self->_atypicalDayConfiguration, 0);
  objc_storeStrong((id *)&self->_almostThereConfiguration, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_userEndOfDay, 0);
  objc_storeStrong((id *)&self->_userStartOfDay, 0);
}

@end
