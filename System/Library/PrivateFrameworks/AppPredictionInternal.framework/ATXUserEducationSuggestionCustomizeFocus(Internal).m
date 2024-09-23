@implementation ATXUserEducationSuggestionCustomizeFocus(Internal)

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
  objc_msgSend(v0, "customizeFocusServer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (void)supportedModeSemanticTypes
{
  return &unk_1E83D04C0;
}

+ (id)supportedModeSemanticTypeStrings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "supportedModeSemanticTypes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_pas_mappedArrayWithTransform:", &__block_literal_global_177);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)suggestionsAreSupportedForModeSemanticType:()Internal
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "supportedModeSemanticTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (id)userDefaultsKeyForTrackingSuggestionState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = a1;
  v7.super_class = (Class)&off_1EF9DA568;
  objc_msgSendSuper2(&v7, sel_userDefaultsKeyForTrackingSuggestionState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modeSemanticType");
  DNDModeSemanticTypeToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@.%@"), v3, CFSTR("CustomizeFocus"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
