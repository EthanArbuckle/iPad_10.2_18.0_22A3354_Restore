@implementation GKLeaderboardChallengeWinComparisonPageInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_401 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_401, &__block_literal_global_402);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_400;
}

void __74__GKLeaderboardChallengeWinComparisonPageInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("comparisons");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("nextURL");
  v7[0] = v2;
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_400;
  secureCodedPropertyKeys_sSecureCodedKeys_400 = v3;

}

+ (id)initWithServerFragment:(id)a3
{
  id v3;
  GKLeaderboardChallengeWinComparisonPageInternal *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeWinComparisonPageInternal);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("result"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkMapWithBlock:", &__block_literal_global_406);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeWinComparisonPageInternal setComparisons:](v4, "setComparisons:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("next-url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboardChallengeWinComparisonPageInternal setNextURL:](v4, "setNextURL:", v7);
  return v4;
}

GKLeaderboardChallengeWinComparisonInternal *__74__GKLeaderboardChallengeWinComparisonPageInternal_initWithServerFragment___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GKLeaderboardChallengeWinComparisonInternal initWithServerFragment:](GKLeaderboardChallengeWinComparisonInternal, "initWithServerFragment:", a2);
}

- (NSArray)comparisons
{
  return self->_comparisons;
}

- (void)setComparisons:(id)a3
{
  objc_storeStrong((id *)&self->_comparisons, a3);
}

- (NSString)nextURL
{
  return self->_nextURL;
}

- (void)setNextURL:(id)a3
{
  objc_storeStrong((id *)&self->_nextURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextURL, 0);
  objc_storeStrong((id *)&self->_comparisons, 0);
}

@end
