@implementation CALNDefaultTriggeredEventNotificationBodyDescriptionProvider

- (CALNDefaultTriggeredEventNotificationBodyDescriptionProvider)initWithTravelAdvisoryDescriptionGenerator:(id)a3 dateProvider:(id)a4
{
  id v7;
  id v8;
  CALNDefaultTriggeredEventNotificationBodyDescriptionProvider *v9;
  CALNDefaultTriggeredEventNotificationBodyDescriptionProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNDefaultTriggeredEventNotificationBodyDescriptionProvider;
  v9 = -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_travelAdvisoryDescriptionGenerator, a3);
    objc_storeStrong((id *)&v10->_dateProvider, a4);
  }

  return v10;
}

- (id)bodyForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 bodyContainsTravelAdvice:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "hypothesis");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (-[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider _bodyWithTravelAdvisoryForSourceClientIdentifier:sourceNotificationInfo:](self, "_bodyWithTravelAdvisoryForSourceClientIdentifier:sourceNotificationInfo:", v8, v9), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = v11;
    if (a5)
      *a5 = 1;
    v13 = v12;
  }
  else
  {
    -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider _bodyWithoutTravelAdvisoryForSourceClientIdentifier:sourceNotificationInfo:](self, "_bodyWithoutTravelAdvisoryForSourceClientIdentifier:sourceNotificationInfo:", v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
  }

  return v13;
}

- (id)_bodyWithTravelAdvisoryForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  void *v32;
  uint64_t v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "hypothesis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "travelAdvisoryTimelinessPeriod");
  if (!v8)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider _bodyWithTravelAdvisoryForSourceClientIdentifier:sourceNotificationInfo:].cold.1((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_12;
  }
  v10 = v9;
  if (!v9)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider _bodyWithTravelAdvisoryForSourceClientIdentifier:sourceNotificationInfo:].cold.2((uint64_t)v6, v17, v24, v25, v26, v27, v28, v29);
    goto LABEL_12;
  }
  if ((objc_msgSend(MEMORY[0x24BE14868], "shouldIncludeTravelAdvisoryDescription:", v8) & 1) == 0)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = v6;
      v36 = 2112;
      v37 = v7;
      _os_log_impl(&dword_215D9B000, v17, OS_LOG_TYPE_DEFAULT, "Cannot create route hypothesis body for notification because it was determined that it should not be included. source client identifier = %{public}@, Notification info: %@.", buf, 0x16u);
    }
LABEL_12:

    v16 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider _ttlDescriptionTypeNumberForTravelAdvisoryTimelinessPeriod:](self, "_ttlDescriptionTypeNumberForTravelAdvisoryTimelinessPeriod:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "unsignedIntegerValue");
    -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider travelAdvisoryDescriptionGenerator](self, "travelAdvisoryDescriptionGenerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "travelAdvisoryDescriptionOfType:hypothesis:location:", v14, v8, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v7, "hasSuggestedLocation") && objc_msgSend(v16, "length"))
  {
    +[CALNBundle bundle](CALNBundle, "bundle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Suggested Location: %@"), &stru_24D4856D0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v32, v16);
    v33 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v33;
  }

LABEL_13:
  return v16;
}

- (id)_bodyWithoutTravelAdvisoryForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v5 = a4;
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isAllDay");
  -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider dateProvider](self, "dateProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNDateStringUtils dateTimeStringForEventDate:alwaysIncludeDate:allDayEvent:dateProvider:](CALNDateStringUtils, "dateTimeStringForEventDate:alwaysIncludeDate:allDayEvent:dateProvider:", v6, 1, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE14820];
  objc_msgSend(v5, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationWithoutPrediction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conferenceURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v5, "conferenceURLIsBroadcast");

  objc_msgSend(v10, "locationStringForLocation:locationWithoutPrediction:preferredLocation:conferenceURL:conferenceURLIsBroadcast:options:", v11, v12, v13, v14, v15, 32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v9;
  v19 = v18;
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

- (id)_ttlDescriptionTypeNumberForTravelAdvisoryTimelinessPeriod:(unint64_t)a3
{
  NSObject *v3;
  id result;

  switch(a3)
  {
    case 0uLL:
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[CALNDefaultTriggeredEventNotificationBodyDescriptionProvider _ttlDescriptionTypeNumberForTravelAdvisoryTimelinessPeriod:].cold.1(v3);

      result = 0;
      break;
    case 1uLL:
      result = &unk_24D49BFF8;
      break;
    case 2uLL:
      result = &unk_24D49C010;
      break;
    case 3uLL:
      result = &unk_24D49C028;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (CALNTravelAdvisoryDescriptionGenerator)travelAdvisoryDescriptionGenerator
{
  return self->_travelAdvisoryDescriptionGenerator;
}

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_travelAdvisoryDescriptionGenerator, 0);
}

- (void)_bodyWithTravelAdvisoryForSourceClientIdentifier:(uint64_t)a3 sourceNotificationInfo:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Cannot create route hypothesis body for notification without a hypothesis. source client identifier: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_bodyWithTravelAdvisoryForSourceClientIdentifier:(uint64_t)a3 sourceNotificationInfo:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Cannot create body with travel advisory for notification without travel advisory timeliness status. source client identifier = %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_ttlDescriptionTypeNumberForTravelAdvisoryTimelinessPeriod:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Could not convert travel advisory timeliness period none to a ttl description type number", v1, 2u);
}

@end
