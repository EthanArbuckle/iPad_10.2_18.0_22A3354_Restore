@implementation _DKAppUsageTombstoneRequirement

- (id)predicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3880];
  +[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("streamName == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)eventPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3880];
  +[_DKSystemEventStreams appUsageStream](_DKSystemEventStreams, "appUsageStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("stream.name == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)propertiesToFetch
{
  return &unk_1E272BBD8;
}

- (void)assignPropertiesToTombstone:(id)a3 extractedFromEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStartDate:", v7);

  objc_msgSend(v5, "endDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEndDate:", v8);
}

- (void)assignPropertiesToTombstone:(id)a3 extractedFromPartialEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStartDate:", v7);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endDate"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEndDate:", v8);
}

@end
