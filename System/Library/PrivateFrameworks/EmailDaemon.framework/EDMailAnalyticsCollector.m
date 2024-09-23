@implementation EDMailAnalyticsCollector

- (EDMailAnalyticsCollector)initWithAnalyticsCollector:(id)a3 smimeConfigurationProvider:(id)a4 messagePersistence:(id)a5
{
  id v8;
  id v9;
  id v10;
  EDMailAnalyticsCollector *v11;
  EDMailAnalyticsCollector *v12;
  EDSMIMEAnalyticsCollector *v13;
  EDSMIMEAnalyticsCollector *smimeAnalyticsCollector;
  id v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDMailAnalyticsCollector;
  v11 = -[EDMailAnalyticsCollector init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_messagePersistence, a5);
    v13 = -[EDSMIMEAnalyticsCollector initWithAnalyticsCollector:smimeConfigurationProvider:messagePersistence:]([EDSMIMEAnalyticsCollector alloc], "initWithAnalyticsCollector:smimeConfigurationProvider:messagePersistence:", v8, v9, v10);
    smimeAnalyticsCollector = v12->_smimeAnalyticsCollector;
    v12->_smimeAnalyticsCollector = v13;

    v15 = (id)objc_msgSend(v8, "registerForLogEventsWithPeriodicDataProvider:", v12);
  }

  return v12;
}

- (id)coreAnalyticsPeriodicEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D1E040]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "ef_midnightNdaysAgo:", 30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EFC0], "column:", CFSTR("date_received"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "greaterThan:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D1F040]);
  objc_msgSend(MEMORY[0x1E0D1EF88], "count:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMessagePersistence messagesTableName](EDMessagePersistence, "messagesTableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithResult:table:", v11, v12);

  objc_msgSend(v13, "setWhere:", v9);
  -[EDMailAnalyticsCollector messagePersistence](self, "messagePersistence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countOfMessageStatement:", v13);

  if (v15 < 1)
    v16 = 0;
  else
    v16 = objc_msgSend(v4, "ef_isLaterThanDate:", v5);
  v21 = CFSTR("usesMail");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.mail.usage"), v18);
  return v19;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDSMIMEAnalyticsCollector)smimeAnalyticsCollector
{
  return self->_smimeAnalyticsCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smimeAnalyticsCollector, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

@end
