@implementation _DKEligibleForPredictionTombstoneRequirement

- (id)eligibleForPredictionKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[_DKMetadataPersistenceLookupTable keyToAttribute]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("structuredMetadata.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)predicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3880];
  +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKEligibleForPredictionTombstoneRequirement eligibleForPredictionKey](self, "eligibleForPredictionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("streamName == %@ && %K == 1"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)eventPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3880];
  +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("stream.name == %@ && metadata.%K == 1"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)propertiesToFetch
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_DKEligibleForPredictionTombstoneRequirement eligibleForPredictionKey](self, "eligibleForPredictionKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  void *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v5, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v11);

  v12 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v6, "setMetadata:", v12);

}

- (void)assignPropertiesToTombstone:(id)a3 extractedFromPartialEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v8, "mutableCopy");

  -[_DKEligibleForPredictionTombstoneRequirement eligibleForPredictionKey](self, "eligibleForPredictionKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v11);

  v12 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v7, "setMetadata:", v12);

}

- (id)identifier
{
  return (id)_DKTombstoneEligibleForPredictionIdentifier;
}

@end
