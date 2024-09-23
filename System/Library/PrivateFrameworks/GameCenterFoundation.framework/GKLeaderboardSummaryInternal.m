@implementation GKLeaderboardSummaryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_25 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_25, &__block_literal_global_66);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_25;
}

void __55__GKLeaderboardSummaryInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[17];
  _QWORD v3[18];

  v3[17] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("baseLeaderboardID");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("leaderboardID");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("timeScope");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("groupID");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("title");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("type");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("formattedScoreValue");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("context");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("status");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("startDate");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("duration");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("nextStartDate");
  v3[11] = objc_opt_class();
  v2[12] = CFSTR("scoreValue");
  v3[12] = objc_opt_class();
  v2[13] = CFSTR("rank");
  v3[13] = objc_opt_class();
  v2[14] = CFSTR("totalEntries");
  v3[14] = objc_opt_class();
  v2[15] = CFSTR("friendRank");
  v3[15] = objc_opt_class();
  v2[16] = CFSTR("totalFriendEntries");
  v3[16] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_25;
  secureCodedPropertyKeys_sSecureCodedKeys_25 = v0;

}

- (NSString)baseLeaderboardID
{
  return self->_baseLeaderboardID;
}

- (void)setBaseLeaderboardID:(id)a3
{
  objc_storeStrong((id *)&self->_baseLeaderboardID, a3);
}

- (NSString)leaderboardID
{
  return self->_leaderboardID;
}

- (void)setLeaderboardID:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboardID, a3);
}

- (NSString)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(id)a3
{
  objc_storeStrong((id *)&self->_timeScope, a3);
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)formattedScoreValue
{
  return self->_formattedScoreValue;
}

- (void)setFormattedScoreValue:(id)a3
{
  objc_storeStrong((id *)&self->_formattedScoreValue, a3);
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(unint64_t)a3
{
  self->_startDate = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (unint64_t)nextStartDate
{
  return self->_nextStartDate;
}

- (void)setNextStartDate:(unint64_t)a3
{
  self->_nextStartDate = a3;
}

- (unint64_t)scoreValue
{
  return self->_scoreValue;
}

- (void)setScoreValue:(unint64_t)a3
{
  self->_scoreValue = a3;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (unint64_t)totalEntries
{
  return self->_totalEntries;
}

- (void)setTotalEntries:(unint64_t)a3
{
  self->_totalEntries = a3;
}

- (unint64_t)friendRank
{
  return self->_friendRank;
}

- (void)setFriendRank:(unint64_t)a3
{
  self->_friendRank = a3;
}

- (unint64_t)totalFriendEntries
{
  return self->_totalFriendEntries;
}

- (void)setTotalFriendEntries:(unint64_t)a3
{
  self->_totalFriendEntries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedScoreValue, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_timeScope, 0);
  objc_storeStrong((id *)&self->_leaderboardID, 0);
  objc_storeStrong((id *)&self->_baseLeaderboardID, 0);
}

@end
