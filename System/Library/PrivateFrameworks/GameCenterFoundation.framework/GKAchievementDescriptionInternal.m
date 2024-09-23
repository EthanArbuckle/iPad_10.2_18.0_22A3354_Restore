@implementation GKAchievementDescriptionInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_5 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_5, &__block_literal_global_30);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_5;
}

void __59__GKAchievementDescriptionInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[10];
  _QWORD v7[11];

  v7[10] = *MEMORY[0x1E0C80C00];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v7[5] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, CFSTR("identifier"), CFSTR("title"), CFSTR("achievedDescription"), CFSTR("unachievedDescription"), CFSTR("maximumPoints"), CFSTR("hidden"), CFSTR("icons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[6] = v3;
  v6[7] = CFSTR("replayable");
  v7[7] = objc_opt_class();
  v6[8] = CFSTR("groupIdentifier");
  v7[8] = objc_opt_class();
  v6[9] = CFSTR("rarityPercent");
  v7[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_5;
  secureCodedPropertyKeys_sSecureCodedKeys_5 = v4;

}

@end
