@implementation ANAnalyticsStorage

- (ANAnalyticsStorage)init
{
  void *v3;
  ANAnalyticsStorage *v4;

  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ANAnalyticsStorage initWithDefaults:](self, "initWithDefaults:", v3);

  return v4;
}

- (ANAnalyticsStorage)initWithDefaults:(id)a3
{
  id v5;
  ANAnalyticsStorage *v6;
  ANAnalyticsStorage *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ANAnalyticsStorage;
  v6 = -[ANAnalyticsStorage init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaults, a3);
    -[ANDefaults objectForDefault:](v7->_defaults, "objectForDefault:", *MEMORY[0x1E0CF7AB8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "mutableCopy");
    else
      v10 = objc_opt_new();
    v11 = (void *)v10;
    -[ANAnalyticsStorage setEventPayloads:](v7, "setEventPayloads:", v10);

  }
  return v7;
}

- (void)erase
{
  void *v2;
  ANAnalyticsStorage *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_opt_new();
  -[ANAnalyticsStorage setEventPayloads:](obj, "setEventPayloads:", v2);

  -[ANAnalyticsStorage _synchronizedSave](obj, "_synchronizedSave");
  objc_sync_exit(obj);

}

- (NSDictionary)eventsToReport
{
  ANAnalyticsStorage *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[ANAnalyticsStorage eventPayloads](v2, "eventPayloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return (NSDictionary *)v4;
}

- (void)save:(id)a3 payload:(id)a4
{
  id v6;
  ANAnalyticsStorage *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[ANAnalyticsStorage eventPayloads](v7, "eventPayloads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  -[ANAnalyticsStorage _synchronizedSave](v7, "_synchronizedSave");
  objc_sync_exit(v7);

}

- (void)save:(id)a3 counter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "finished");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v6, "hexCount");

  objc_msgSend(v8, "numberWithUnsignedLongLong:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ANAnalyticsStorage save:payload:](self, "save:payload:", v7, v10);

}

- (void)_synchronizedSave
{
  void *v3;
  void *v4;
  id v5;

  -[ANAnalyticsStorage defaults](self, "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ANAnalyticsStorage eventPayloads](self, "eventPayloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "setObject:forDefault:", v4, *MEMORY[0x1E0CF7AB8]);

}

- (NSMutableDictionary)eventPayloads
{
  return self->_eventPayloads;
}

- (void)setEventPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_eventPayloads, a3);
}

- (ANDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_eventPayloads, 0);
}

@end
