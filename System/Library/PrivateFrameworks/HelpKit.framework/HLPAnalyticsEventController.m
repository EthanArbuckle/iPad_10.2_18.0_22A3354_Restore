@implementation HLPAnalyticsEventController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_3 != -1)
    dispatch_once(&sharedInstance_predicate_3, &__block_literal_global_7);
  return (id)gHLPAnalyticsController;
}

void __45__HLPAnalyticsEventController_sharedInstance__block_invoke()
{
  HLPAnalyticsEventController *v0;
  void *v1;

  v0 = objc_alloc_init(HLPAnalyticsEventController);
  v1 = (void *)gHLPAnalyticsController;
  gHLPAnalyticsController = (uint64_t)v0;

}

- (void)configureWithHelpBookID:(id)a3 version:(id)a4
{
  id v7;
  id v8;
  NSString *v9;
  NSString *version;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  const __CFString *v15;
  const __CFString *identifier;
  const __CFString *v17;
  const __CFString *v18;
  NSDictionary *v19;
  NSDictionary *requiredKeys;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)&self->_identifier, a3);
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  version = self->_version;
  self->_version = v9;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v15 = CFSTR("undefined");
  v21[0] = CFSTR("book_ID");
  v21[1] = CFSTR("book_version");
  identifier = (const __CFString *)self->_identifier;
  v17 = (const __CFString *)self->_version;
  if (!identifier)
    identifier = CFSTR("undefined");
  if (!v17)
    v17 = CFSTR("undefined");
  v22[0] = identifier;
  v22[1] = v17;
  v21[2] = CFSTR("product");
  v21[3] = CFSTR("product_version");
  if (v12)
    v18 = v12;
  else
    v18 = CFSTR("undefined");
  if (v14)
    v15 = v14;
  v22[2] = v18;
  v22[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  requiredKeys = self->_requiredKeys;
  self->_requiredKeys = v19;

}

- (void)logAnalyticsEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.HelpKit"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v3;
  v7 = v3;
  AnalyticsSendEventLazy();

}

uint64_t __49__HLPAnalyticsEventController_logAnalyticsEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "caRepresentation");
}

- (void)incrementCounterForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HLPAnalyticsEventController countersByKey](self, "countersByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPAnalyticsEventController setCountersByKey:](self, "setCountersByKey:", v6);

  }
  -[HLPAnalyticsEventController counterForKey:](self, "counterForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "intValue") + 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HLPAnalyticsEventController countersByKey](self, "countersByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v4);

}

- (id)counterForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HLPAnalyticsEventController countersByKey](self, "countersByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = &unk_24D33A408;

  return v7;
}

- (NSDictionary)requiredKeys
{
  return self->_requiredKeys;
}

- (NSMutableDictionary)countersByKey
{
  return self->_countersByKey;
}

- (void)setCountersByKey:(id)a3
{
  objc_storeStrong((id *)&self->_countersByKey, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_countersByKey, 0);
  objc_storeStrong((id *)&self->_requiredKeys, 0);
}

@end
