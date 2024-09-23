@implementation _DKSyncStreamsTombstoneRequirement

- (id)predicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  +[_DKSync2Coordinator streamNamesToTombstone](_DKSync2Coordinator, "streamNamesToTombstone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("streamName IN %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)eventPredicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  +[_DKSync2Coordinator streamNamesToTombstone](_DKSync2Coordinator, "streamNamesToTombstone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("stream.name IN %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)propertiesToFetch
{
  return &unk_1E272BBC0;
}

- (void)assignPropertiesToTombstone:(id)a3 extractedFromEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v5, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKTombstoneMetadataKey eventSourceDeviceID](_DKTombstoneMetadataKey, "eventSourceDeviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v10);

  v11 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v6, "setMetadata:", v11);

}

- (void)assignPropertiesToTombstone:(id)a3 extractedFromPartialEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source.deviceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKTombstoneMetadataKey eventSourceDeviceID](_DKTombstoneMetadataKey, "eventSourceDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v9);

  v10 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v6, "setMetadata:", v10);

}

@end
