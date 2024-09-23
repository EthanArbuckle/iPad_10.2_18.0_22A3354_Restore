@implementation DNDApplicationConfiguration(Record)

+ (id)configurationForRecord:()Record
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0D1D6C0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "minimumBreakthroughUrgency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumBreakthroughUrgency:", objc_msgSend(v6, "integerValue"));

  objc_msgSend(v4, "allowedThreads");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v5, "setAllowedThreads:", v8);

  objc_msgSend(v4, "deniedThreads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v5, "setDeniedThreads:", v10);

  return v5;
}

- (DNDSMutableApplicationConfigurationRecord)makeRecord
{
  DNDSMutableApplicationConfigurationRecord *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(DNDSMutableApplicationConfigurationRecord);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "minimumBreakthroughUrgency"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableApplicationConfigurationRecord setMinimumBreakthroughUrgency:](v2, "setMinimumBreakthroughUrgency:", v3);

  objc_msgSend(a1, "allowedThreads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableApplicationConfigurationRecord setAllowedThreads:](v2, "setAllowedThreads:", v4);

  objc_msgSend(a1, "deniedThreads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableApplicationConfigurationRecord setDeniedThreads:](v2, "setDeniedThreads:", v5);

  return v2;
}

@end
