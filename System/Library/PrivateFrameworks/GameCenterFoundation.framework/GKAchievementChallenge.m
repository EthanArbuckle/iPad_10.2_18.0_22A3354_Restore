@implementation GKAchievementChallenge

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
  -[GKAchievementChallenge challengeID](self, "challengeID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAchievementChallenge achievement](self, "achievement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAchievementChallenge issueDate](self, "issueDate");
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
  +[GKChallenge stringForState:](GKChallenge, "stringForState:", -[GKAchievementChallenge state](self, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAchievementChallenge completionDate](self, "completionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%p GKAchievementChallenge %@ achievement:%@ issueDate: %@ issuingPlayer: %@ receivingPlayer: %@ state: %@ completedDate: %@"), self, v14, v13, v3, v5, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (GKAchievementChallenge)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKAchievementChallenge *v5;
  GKAchievementChallenge *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKAchievementChallenge;
  v5 = -[GKAchievementChallenge init](&v8, sel_init);
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
      +[GKAchievementChallengeInternal internalRepresentation](GKAchievementChallengeInternal, "internalRepresentation");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[GKAchievementChallenge setInternal:](v5, "setInternal:", v4);
  }
  v6 = v5;
LABEL_8:

  return v6;
}

- (void)setInternal:(id)a3
{
  id v4;
  id v5;
  GKAchievement *v6;
  GKAchievement *v7;
  void *v8;
  GKGame *v9;
  void *v10;
  GKGame *v11;
  objc_super v12;

  v4 = a3;
  -[GKChallenge internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)GKAchievementChallenge;
  -[GKChallenge setInternal:](&v12, sel_setInternal_, v4);
  if (v5 != v4)
  {
    objc_msgSend(v4, "achievement");
    v6 = (GKAchievement *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [GKAchievement alloc];
      objc_msgSend(v4, "achievement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[GKAchievement initWithInternalRepresentation:](v7, "initWithInternalRepresentation:", v8);

      v9 = [GKGame alloc];
      objc_msgSend(v4, "game");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[GKGame initWithInternalRepresentation:](v9, "initWithInternalRepresentation:", v10);
      -[GKAchievement setGame:](v6, "setGame:", v11);

    }
    -[GKAchievementChallenge setAchievement:](self, "setAchievement:", v6);

  }
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
    return +[GKAchievementChallengeInternal instancesRespondToSelector:](GKAchievementChallengeInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)titleText
{
  void *v2;
  void *v3;

  -[GKAchievementChallenge achievement](self, "achievement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)detailGoalTextForPlayer:(id)a3 withAchievement:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  +[GCFLocalizedStrings CHALLENGE_DETAIL_ACHIEVEMENT_GOAL_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "CHALLENGE_DETAIL_ACHIEVEMENT_GOAL_FORMAT");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayNameWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unachievedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)detailsLoaded
{
  void *v2;
  void *v3;
  BOOL v4;

  -[GKAchievementChallenge achievement](self, "achievement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unachievedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)loadDetailsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  GKAchievementChallenge *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKAchievementChallenge achievement](self, "achievement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKChallenge game](self, "game");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__GKAchievementChallenge_loadDetailsWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E75B5A58;
  v13 = v6;
  v14 = self;
  v15 = v4;
  v10 = v4;
  v11 = v6;
  +[GKAchievement loadAchievementsForGameV2:players:includeUnreported:includeHidden:withCompletionHandler:](GKAchievement, "loadAchievementsForGameV2:players:includeUnreported:includeHidden:withCompletionHandler:", v7, v9, 1, 1, v12);

}

uint64_t __59__GKAchievementChallenge_loadDetailsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t i;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t result;
  id obj;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a2, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v19 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              objc_msgSend(v10, "identifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32)))
              {

LABEL_17:
                objc_msgSend(*(id *)(a1 + 40), "setAchievement:", v10);
                goto LABEL_18;
              }
              objc_msgSend(v10, "groupIdentifier");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 32));

              if (v13)
                goto LABEL_17;
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v7)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v17);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (GKAchievement)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
  objc_storeStrong((id *)&self->_achievement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achievement, 0);
}

@end
