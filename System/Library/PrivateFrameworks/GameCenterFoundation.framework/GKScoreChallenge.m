@implementation GKScoreChallenge

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[GKScoreChallenge challengeID](self, "challengeID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScoreChallenge score](self, "score");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "formattedValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScoreChallenge issueDate](self, "issueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallenge issuingPlayer](self, "issuingPlayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conciseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKChallenge receivingPlayer](self, "receivingPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conciseDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKChallenge stringForState:](GKChallenge, "stringForState:", -[GKScoreChallenge state](self, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKScoreChallenge completionDate](self, "completionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%p GKScoreChallenge %@ score:%@ issueDate: %@ issuingPlayer: %@ receivingPlayer: %@ state: %@ completedDate: %@"), self, v14, v13, v3, v5, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (GKScoreChallenge)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKScoreChallenge *v5;
  GKScoreChallenge *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKScoreChallenge;
  v5 = -[GKScoreChallenge init](&v8, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_8;
    }
    if (!v4)
    {
      +[GKScoreChallengeInternal internalRepresentation](GKScoreChallengeInternal, "internalRepresentation");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[GKScoreChallenge setInternal:](v5, "setInternal:", v4);
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (void)setInternal:(id)a3
{
  id v4;
  id v5;
  GKScore *v6;
  GKScore *v7;
  void *v8;
  GKGame *v9;
  void *v10;
  GKGame *v11;
  objc_super v12;

  v4 = a3;
  -[GKChallenge internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)GKScoreChallenge;
  -[GKChallenge setInternal:](&v12, sel_setInternal_, v4);
  if (v5 != v4)
  {
    objc_msgSend(v4, "score");
    v6 = (GKScore *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [GKScore alloc];
      objc_msgSend(v4, "score");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[GKScore initWithInternalRepresentation:](v7, "initWithInternalRepresentation:", v8);

      v9 = [GKGame alloc];
      objc_msgSend(v4, "game");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[GKGame initWithInternalRepresentation:](v9, "initWithInternalRepresentation:", v10);
      -[GKScore setGame:](v6, "setGame:", v11);

    }
    -[GKScoreChallenge setScore:](self, "setScore:", v6);

  }
}

- (GKLeaderboard)leaderboard
{
  GKLeaderboard *v3;
  void *v4;
  void *v5;
  GKLeaderboard *v6;

  v3 = [GKLeaderboard alloc];
  -[GKChallenge internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leaderboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKLeaderboard initWithInternalRepresentation:](v3, "initWithInternalRepresentation:", v5);

  return v6;
}

- (GKLeaderboardEntry)leaderboardEntry
{
  void *v3;
  void *v4;
  void *v5;

  -[GKScoreChallenge score](self, "score");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GKScoreChallenge score](self, "score");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKLeaderboardEntry fromGKScore:](GKLeaderboardEntry, "fromGKScore:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (GKLeaderboardEntry *)v5;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  BOOL result;
  int v5;

  if (!a3)
    return 0;
  if (class_respondsToSelector((Class)a1, a3))
    return 1;
  v5 = GKApplicationLinkedOnOrAfter();
  result = 0;
  if (v5)
    return +[GKScoreChallengeInternal instancesRespondToSelector:](GKScoreChallengeInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)titleText
{
  void *v2;
  void *v3;
  void *v4;

  -[GKChallenge internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leaderboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)detailsLoaded
{
  void *v2;
  void *v3;
  BOOL v4;

  -[GKChallenge internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leaderboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)loadDetailsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("ScoreChallengeDetails"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E75B1C80;
  v10[4] = self;
  objc_msgSend(v5, "perform:", v10);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_4;
  v8[3] = &unk_1E75B1520;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "notifyOnMainQueueWithBlock:", v8);

}

void __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "score");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leaderboardIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "score");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "game");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E75B5A30;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v9 = v3;
  +[GKLeaderboard loadLeaderboardWithIdentifier:forGame:withPlayer:withCompletionHandler:](GKLeaderboard, "loadLeaderboardWithIdentifier:forGame:withPlayer:withCompletionHandler:", v5, v7, v8, v10);

}

void __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeaderboard:", v5);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "formattedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gameStatServicePrivate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "game");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "gameDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_3;
    v14[3] = &unk_1E75B1C58;
    v13 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v13;
    objc_msgSend(v8, "getHypotheticalLeaderboardRanksForScores:forGameDescriptor:handler:", v10, v12, v14);

  }
}

void __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("formatted-score-value"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setFormattedValue:", v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __53__GKScoreChallenge_loadDetailsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)detailGoalTextForPlayer:(id)a3 withLeaderboard:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  +[GCFLocalizedStrings CHALLENGE_DETAIL_SCORE_GOAL_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_DETAIL_SCORE_GOAL_FORMAT");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayNameWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKScoreChallenge score](self, "score");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "formattedValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", v9, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (GKScore)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
}

@end
