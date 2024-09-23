@implementation FCPuzzleLeaderboard

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboardID, 0);
}

- (FCPuzzleLeaderboard)initWithDictionary:(id)a3
{
  id v4;
  FCPuzzleLeaderboard *v5;
  void *v6;
  FCPuzzleLeaderboard *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPuzzleLeaderboard;
  v5 = -[FCPuzzleLeaderboard init](&v9, sel_init);
  if (!v5
    || (FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("identifier"), 0),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[FCPuzzleLeaderboard setLeaderboardID:](v5, "setLeaderboardID:", v6),
        v6,
        -[FCPuzzleLeaderboard leaderboardID](v5, "leaderboardID"),
        v7 = (FCPuzzleLeaderboard *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v7 = v5;
  }

  return v7;
}

- (void)setLeaderboardID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)leaderboardID
{
  return self->_leaderboardID;
}

@end
