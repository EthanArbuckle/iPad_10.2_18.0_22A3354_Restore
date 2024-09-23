@implementation GKLeaderboardEntryInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_256_0 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_256_0, &__block_literal_global_257_0);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_255_0;
}

void __53__GKLeaderboardEntryInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("player");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("rank");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("score");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("formattedScore");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("context");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("date");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("state");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("baseLeaderboardID");
  v3[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_255_0;
  secureCodedPropertyKeys_sSecureCodedKeys_255_0 = v0;

}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (int64_t)score
{
  return self->_score;
}

- (void)setScore:(int64_t)a3
{
  self->_score = a3;
}

- (NSString)formattedScore
{
  return self->_formattedScore;
}

- (void)setFormattedScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)baseLeaderboardID
{
  return self->_baseLeaderboardID;
}

- (void)setBaseLeaderboardID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseLeaderboardID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_formattedScore, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
