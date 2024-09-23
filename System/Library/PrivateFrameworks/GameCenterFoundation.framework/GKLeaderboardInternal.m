@implementation GKLeaderboardInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_20 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_20, &__block_literal_global_61);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_20;
}

void __48__GKLeaderboardInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[27];
  _QWORD v14[29];

  v14[27] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("baseLeaderboardID");
  v14[0] = objc_opt_class();
  v13[1] = CFSTR("context");
  v14[1] = objc_opt_class();
  v13[2] = CFSTR("creator");
  v14[2] = objc_opt_class();
  v13[3] = CFSTR("duration");
  v14[3] = objc_opt_class();
  v13[4] = CFSTR("friendRank");
  v14[4] = objc_opt_class();
  v13[5] = CFSTR("friendRankCount");
  v14[5] = objc_opt_class();
  v13[6] = CFSTR("groupIdentifier");
  v14[6] = objc_opt_class();
  v13[7] = CFSTR("icons");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v3;
  v13[8] = CFSTR("identifier");
  v14[8] = objc_opt_class();
  v13[9] = CFSTR("lastSubmittedDate");
  v14[9] = objc_opt_class();
  v13[10] = CFSTR("leaderboardSetIdentifier");
  v14[10] = objc_opt_class();
  v13[11] = CFSTR("maxRank");
  v14[11] = objc_opt_class();
  v13[12] = CFSTR("nextStartDate");
  v14[12] = objc_opt_class();
  v13[13] = CFSTR("overallRank");
  v14[13] = objc_opt_class();
  v13[14] = CFSTR("overallRankCount");
  v14[14] = objc_opt_class();
  v13[15] = CFSTR("playerScore");
  v14[15] = objc_opt_class();
  v13[16] = CFSTR("recordID");
  v14[16] = objc_opt_class();
  v13[17] = CFSTR("releaseState");
  v14[17] = objc_opt_class();
  v13[18] = CFSTR("scores");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[18] = v7;
  v13[19] = CFSTR("startDate");
  v14[19] = objc_opt_class();
  v13[20] = CFSTR("title");
  v14[20] = objc_opt_class();
  v13[21] = CFSTR("type");
  v14[21] = objc_opt_class();
  v13[22] = CFSTR("supportsChallenges");
  v14[22] = objc_opt_class();
  v13[23] = CFSTR("hasActiveChallenges");
  v14[23] = objc_opt_class();
  v13[24] = CFSTR("activityType");
  v14[24] = objc_opt_class();
  v13[25] = CFSTR("userInfo");
  v8 = (void *)MEMORY[0x1E0C99E60];
  +[GKInternalRepresentation secureCodedJsonTypes](GKInternalRepresentation, "secureCodedJsonTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[25] = v10;
  v13[26] = CFSTR("leaderboardDescription");
  v14[26] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 27);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_20;
  secureCodedPropertyKeys_sSecureCodedKeys_20 = v11;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKLeaderboardInternal identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKLeaderboardInternal identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unint64_t)releaseState
{
  return self->_releaseState;
}

- (void)setReleaseState:(unint64_t)a3
{
  self->_releaseState = a3;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)baseLeaderboardID
{
  return self->_baseLeaderboardID;
}

- (void)setBaseLeaderboardID:(id)a3
{
  objc_storeStrong((id *)&self->_baseLeaderboardID, a3);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (NSString)leaderboardSetIdentifier
{
  return self->_leaderboardSetIdentifier;
}

- (void)setLeaderboardSetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardSetIdentifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSDate)lastSubmittedDate
{
  return self->_lastSubmittedDate;
}

- (void)setLastSubmittedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSubmittedDate, a3);
}

- (NSDictionary)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  objc_storeStrong((id *)&self->_icons, a3);
}

- (unsigned)overallRank
{
  return self->_overallRank;
}

- (void)setOverallRank:(unsigned int)a3
{
  self->_overallRank = a3;
}

- (unsigned)overallRankCount
{
  return self->_overallRankCount;
}

- (void)setOverallRankCount:(unsigned int)a3
{
  self->_overallRankCount = a3;
}

- (unsigned)friendRank
{
  return self->_friendRank;
}

- (void)setFriendRank:(unsigned __int16)a3
{
  self->_friendRank = a3;
}

- (unsigned)friendRankCount
{
  return self->_friendRankCount;
}

- (void)setFriendRankCount:(unsigned __int16)a3
{
  self->_friendRankCount = a3;
}

- (unsigned)maxRank
{
  return self->_maxRank;
}

- (void)setMaxRank:(unsigned int)a3
{
  self->_maxRank = a3;
}

- (NSArray)scores
{
  return self->_scores;
}

- (void)setScores:(id)a3
{
  objc_storeStrong((id *)&self->_scores, a3);
}

- (GKScoreInternal)playerScore
{
  return self->_playerScore;
}

- (void)setPlayerScore:(id)a3
{
  objc_storeStrong((id *)&self->_playerScore, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)nextStartDate
{
  return self->_nextStartDate;
}

- (void)setNextStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextStartDate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (GKPlayerInternal)creator
{
  return self->_creator;
}

- (void)setCreator:(id)a3
{
  objc_storeStrong((id *)&self->_creator, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)supportsChallenges
{
  return self->_supportsChallenges;
}

- (void)setSupportsChallenges:(BOOL)a3
{
  self->_supportsChallenges = a3;
}

- (BOOL)hasActiveChallenges
{
  return self->_hasActiveChallenges;
}

- (void)setHasActiveChallenges:(BOOL)a3
{
  self->_hasActiveChallenges = a3;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)leaderboardDescription
{
  return self->_leaderboardDescription;
}

- (void)setLeaderboardDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_leaderboardDescription, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_nextStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_playerScore, 0);
  objc_storeStrong((id *)&self->_scores, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_lastSubmittedDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_leaderboardSetIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_baseLeaderboardID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

- (unint64_t)maxRange
{
  return -[GKLeaderboardInternal maxRank](self, "maxRank");
}

@end
