@implementation IREvent(Transformations)

+ (id)eventFromEventDO:()Transformations
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE5B320]);

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE5B2F0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "eventType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "eventSubType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithEventType:eventSubType:", v8, objc_msgSend(v9, "integerValue"));

    objc_msgSend(v3, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBundleID:", v11);

    objc_msgSend(v3, "contextIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContextIdentifier:", v12);

    objc_msgSend(v10, "setIsOutsideApp:", objc_msgSend(v3, "isOutsideApp"));
  }
  else
  {
    objc_msgSend(v3, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE5B318]);

    if (!v14)
      +[IREvent(Transformations) eventFromEventDO:].cold.1();
    v15 = objc_alloc(MEMORY[0x24BE5B2B8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "eventType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v3, "eventSubType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v15, "initWithEventType:eventSubType:", v17, objc_msgSend(v18, "integerValue"));

    objc_msgSend(v3, "bundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBundleID:", v19);

    objc_msgSend(v3, "contextIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContextIdentifier:", v20);

  }
  return v10;
}

+ (id)eventTypeStringEventDO:()Transformations
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE5B320]);

  if (v5)
  {
    objc_msgSend(v3, "eventType");
    IRMediaEventTypeToString();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE5B318]);

    if (!v8)
      +[IREvent(Transformations) eventTypeStringEventDO:].cold.1();
    objc_msgSend(v3, "eventType");
    IRAppleTVControlEventTypeToString();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;

  return v9;
}

+ (id)eventSubTypeStringEventDO:()Transformations
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE5B320]);

  if (v5)
  {
    objc_msgSend(v3, "eventSubType");
    IRMediaEventSubTypeToString();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE5B318]);

    if (!v8)
      +[IREvent(Transformations) eventSubTypeStringEventDO:].cold.1();
    objc_msgSend(v3, "eventSubType");
    IRAppleTVControlEventSubTypeToString();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;

  return v9;
}

- (IREventDO)eventDO
{
  void *v2;
  void *v3;
  IREventDO *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  IREventDO *v11;
  uint64_t v13;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:", *MEMORY[0x24BE5B318]) & 1) == 0)
  {
    objc_msgSend(a1, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", *MEMORY[0x24BE5B320]) & 1) == 0)
      -[IREvent(Transformations) eventDO].cold.1();

  }
  v4 = [IREventDO alloc];
  v5 = objc_msgSend(a1, "eventType");
  v6 = objc_msgSend(a1, "eventSubType");
  objc_msgSend(a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "isOutsideApp");
  LOBYTE(v13) = objc_msgSend(a1, "isEligibleApp");
  v11 = -[IREventDO initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:](v4, "initWithEventType:eventSubType:name:bundleID:contextIdentifier:isOutsideApp:isEligibleApp:", v5, v6, v7, v8, v9, v10, v13);

  return v11;
}

+ (void)eventFromEventDO:()Transformations .cold.1()
{
  __assert_rtn("+[IREvent(Transformations) eventFromEventDO:]", "IREvent+Transformations.m", 30, "NO");
}

+ (void)eventTypeStringEventDO:()Transformations .cold.1()
{
  __assert_rtn("+[IREvent(Transformations) eventTypeStringEventDO:]", "IREvent+Transformations.m", 41, "NO");
}

+ (void)eventSubTypeStringEventDO:()Transformations .cold.1()
{
  __assert_rtn("+[IREvent(Transformations) eventSubTypeStringEventDO:]", "IREvent+Transformations.m", 52, "NO");
}

- (void)eventDO
{
  __assert_rtn("-[IREvent(Transformations) eventDO]", "IREvent+Transformations.m", 58, "[self.name isEqual:kIREventNameAppleTVControl] || [self.name isEqual:kIREventNameMedia]");
}

@end
