@implementation GKLeaderboardChallengeWinComparisonInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_377 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_377, &__block_literal_global_378);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_376;
}

void __70__GKLeaderboardChallengeWinComparisonInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("bundleID");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("playerWinCount");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("otherPlayerWinCount");
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_376;
  secureCodedPropertyKeys_sSecureCodedKeys_376 = v0;

}

+ (id)initWithServerFragment:(id)a3
{
  id v3;
  GKLeaderboardChallengeWinComparisonInternal *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardChallengeWinComparisonInternal);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundle-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeWinComparisonInternal setBundleID:](v4, "setBundleID:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("player-win-count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardChallengeWinComparisonInternal setPlayerWinCount:](v4, "setPlayerWinCount:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("compare-to-player-win-count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKLeaderboardChallengeWinComparisonInternal setOtherPlayerWinCount:](v4, "setOtherPlayerWinCount:", v7);
  return v4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSNumber)playerWinCount
{
  return self->_playerWinCount;
}

- (void)setPlayerWinCount:(id)a3
{
  objc_storeStrong((id *)&self->_playerWinCount, a3);
}

- (NSNumber)otherPlayerWinCount
{
  return self->_otherPlayerWinCount;
}

- (void)setOtherPlayerWinCount:(id)a3
{
  objc_storeStrong((id *)&self->_otherPlayerWinCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherPlayerWinCount, 0);
  objc_storeStrong((id *)&self->_playerWinCount, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
