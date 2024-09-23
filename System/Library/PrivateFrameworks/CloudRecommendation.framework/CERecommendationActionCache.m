@implementation CERecommendationActionCache

- (CERecommendationActionCache)init
{
  CERecommendationActionCache *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CERecommendationActionCache;
  v2 = -[CERecommendationActionCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.cloudexperience"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

  }
  return v2;
}

- (id)_timestamp:(id)a3 tableName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[CERecommendationActionCache defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_trackAction:(id)a3 tableName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[CERecommendationActionCache defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v12);

  -[CERecommendationActionCache defaults](self, "defaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v10, v6);

  objc_sync_exit(v7);
}

- (void)_clearAction:(id)a3 tableName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_opt_class();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[CERecommendationActionCache defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    objc_msgSend(v13, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

    -[CERecommendationActionCache defaults](self, "defaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v10, v6);

  }
  objc_sync_exit(v7);

}

- (id)timestampForLastCompleted:(id)a3
{
  return -[CERecommendationActionCache _timestamp:tableName:](self, "_timestamp:tableName:", a3, CFSTR("CERecommendationCompletedActionsTable"));
}

- (void)trackActionCompletedForRecommendation:(id)a3
{
  -[CERecommendationActionCache _trackAction:tableName:](self, "_trackAction:tableName:", a3, CFSTR("CERecommendationCompletedActionsTable"));
}

- (id)timestampForLastCanceled:(id)a3
{
  return -[CERecommendationActionCache _timestamp:tableName:](self, "_timestamp:tableName:", a3, CFSTR("CERecommendationCanceledActionsTable"));
}

- (void)trackActionCanceledForRecommendation:(id)a3
{
  -[CERecommendationActionCache _trackAction:tableName:](self, "_trackAction:tableName:", a3, CFSTR("CERecommendationCanceledActionsTable"));
}

- (void)trackActionDismissedForRecommendation:(id)a3
{
  -[CERecommendationActionCache _trackAction:tableName:](self, "_trackAction:tableName:", a3, CFSTR("CERecommendationDismissedActionsTable"));
}

- (id)lastDismissedTimestamp:(id)a3
{
  return -[CERecommendationActionCache _timestamp:tableName:](self, "_timestamp:tableName:", a3, CFSTR("CERecommendationDismissedActionsTable"));
}

- (void)clearLastDismissed:(id)a3
{
  -[CERecommendationActionCache _clearAction:tableName:](self, "_clearAction:tableName:", a3, CFSTR("CERecommendationDismissedActionsTable"));
}

- (void)flushCache
{
  void *v3;
  void *v4;
  id v5;

  -[CERecommendationActionCache defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("CERecommendationCompletedActionsTable"));

  -[CERecommendationActionCache defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("CERecommendationCanceledActionsTable"));

  -[CERecommendationActionCache defaults](self, "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("CERecommendationDismissedActionsTable"));

}

- (NSUserDefaults)defaults
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
}

@end
