@implementation GKLeaderboardEntry

- (GKLeaderboardEntry)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKLeaderboardEntry *v5;
  GKLeaderboardEntry *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardEntry;
  v5 = -[GKLeaderboardEntry init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[GKLeaderboardEntry setInternal:](v5, "setInternal:", v4);

  return v6;
}

- (GKPlayer)player
{
  GKPlayer *v3;
  void *v4;
  void *v5;
  GKPlayer *v6;

  v3 = [GKPlayer alloc];
  -[GKLeaderboardEntry internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKPlayer initWithInternalRepresentation:](v3, "initWithInternalRepresentation:", v5);

  return v6;
}

+ (id)formattedDifferenceBetweenFirstScore:(id)a3 secondScore:(id)a4
{
  return +[GKScoreParser formattedDifferenceBetweenFirstScore:secondScore:](GKScoreParser, "formattedDifferenceBetweenFirstScore:secondScore:", a3, a4);
}

- (id)_gkScore
{
  GKScoreInternal *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GKScore *v9;

  v3 = objc_alloc_init(GKScoreInternal);
  -[GKScoreInternal setRank:](v3, "setRank:", -[GKLeaderboardEntry rank](self, "rank"));
  -[GKScoreInternal setContext:](v3, "setContext:", -[GKLeaderboardEntry context](self, "context"));
  -[GKScoreInternal setValue:](v3, "setValue:", -[GKLeaderboardEntry score](self, "score"));
  -[GKLeaderboardEntry formattedScore](self, "formattedScore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScoreInternal setFormattedValue:](v3, "setFormattedValue:", v4);

  -[GKLeaderboardEntry player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScoreInternal setPlayer:](v3, "setPlayer:", v6);

  -[GKLeaderboardEntry internal](self, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "baseLeaderboardID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScoreInternal setLeaderboardIdentifier:](v3, "setLeaderboardIdentifier:", v8);

  v9 = -[GKScore initWithInternalRepresentation:]([GKScore alloc], "initWithInternalRepresentation:", v3);
  return v9;
}

+ (id)fromGKScore:(id)a3
{
  id v3;
  GKLeaderboardEntryInternal *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GKLeaderboardEntry *v16;

  v3 = a3;
  v4 = objc_alloc_init(GKLeaderboardEntryInternal);
  objc_msgSend(v3, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardEntryInternal setRank:](v4, "setRank:", objc_msgSend(v5, "rank"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardEntryInternal setContext:](v4, "setContext:", objc_msgSend(v6, "_gkConvertUInt64ClampingValue:", objc_msgSend(v7, "context")));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardEntryInternal setScore:](v4, "setScore:", objc_msgSend(v8, "_gkConvertInt64ClampingValue:", objc_msgSend(v9, "value")));

  objc_msgSend(v3, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "formattedValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardEntryInternal setFormattedScore:](v4, "setFormattedScore:", v11);

  objc_msgSend(v3, "internal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "player");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardEntryInternal setPlayer:](v4, "setPlayer:", v13);

  objc_msgSend(v3, "internal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "leaderboardIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardEntryInternal setBaseLeaderboardID:](v4, "setBaseLeaderboardID:", v15);

  v16 = -[GKLeaderboardEntry initWithInternalRepresentation:]([GKLeaderboardEntry alloc], "initWithInternalRepresentation:", v4);
  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKLeaderboardEntry player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKLeaderboardEntry rank](self, "rank"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardEntry formattedScore](self, "formattedScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[GKLeaderboardEntry context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKLeaderboardEntry date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Player: %@, Rank: %@, Formatted Score: %@, Context: %@, Date: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (GKLeaderboardEntryInternal)internal
{
  return (GKLeaderboardEntryInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
