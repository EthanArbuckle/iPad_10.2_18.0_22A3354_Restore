@implementation ATXUserEducationSuggestionExploreFaces(Internal)

- (id)userDefaultsKeyForTrackingSuggestionState
{
  void *v1;
  void *v2;
  void *v3;
  objc_super v5;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v5.receiver = a1;
  v5.super_class = (Class)&off_1EF9DA330;
  objc_msgSendSuper2(&v5, sel_userDefaultsKeyForTrackingSuggestionState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@.%@"), v2, CFSTR("ExploreFaces"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)metricClass
{
  return objc_opt_class();
}

- (id)server
{
  void *v0;
  void *v1;

  +[ATXUserEducationSuggestionServer sharedInstance](ATXUserEducationSuggestionServer, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "exploreFacesServer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (void)logFeedback:()Internal
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ATXUserEducationSuggestionExploreFaces_Internal__logFeedback___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "performBlockOnInternalSerialQueue:", v7);

}

@end
