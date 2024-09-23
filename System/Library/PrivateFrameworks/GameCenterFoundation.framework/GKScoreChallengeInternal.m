@implementation GKScoreChallengeInternal

+ (id)internalRepresentation
{
  return objc_alloc_init((Class)a1);
}

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__GKScoreChallengeInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_144 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_144, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_143;
}

void __51__GKScoreChallengeInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___GKScoreChallengeInternal;
  objc_msgSendSuper2(&v4, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "setObject:forKey:", objc_opt_class(), CFSTR("score"));
  objc_msgSend(v2, "setObject:forKey:", objc_opt_class(), CFSTR("leaderboard"));
  v3 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_143;
  secureCodedPropertyKeys_sSecureCodedKeys_143 = (uint64_t)v2;

}

- (id)serverRepresentationForReceivingPlayer:(id)a3
{
  void *v3;
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
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)GKScoreChallengeInternal;
  -[GKChallengeInternal serverRepresentationForReceivingPlayer:](&v21, sel_serverRepresentationForReceivingPlayer_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKey:", &unk_1E75FB1D8, CFSTR("challenge-type"));
  v22[0] = CFSTR("value");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[GKScoreChallengeInternal score](self, "score");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v20, "value"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v22[1] = CFSTR("leaderboard-id");
  -[GKScoreChallengeInternal score](self, "score");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leaderboardIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  v22[2] = CFSTR("timestamp");
  -[GKScoreChallengeInternal score](self, "score");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[GKScoreChallengeInternal score](self, "score");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_gkServerTimestamp");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "_gkServerTimestamp");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  v22[3] = CFSTR("context");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[GKScoreChallengeInternal score](self, "score");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithLongLong:", objc_msgSend(v14, "context"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {

    v12 = v18;
  }

  objc_msgSend(v6, "setObject:forKey:", v16, CFSTR("score"));
  return v6;
}

- (unint64_t)type
{
  return 1;
}

- (id)titleText
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

  -[GKScoreChallengeInternal score](self, "score");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formattedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (-[GKScoreChallengeInternal leaderboard](self, "leaderboard"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "title"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    +[GCFLocalizedStrings SHORT_CHALLENGE_SCORE_TITLE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SHORT_CHALLENGE_SCORE_TITLE_FORMAT");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKScoreChallengeInternal leaderboard](self, "leaderboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (GKScoreInternal)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (GKLeaderboardInternal)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
  objc_storeStrong((id *)&self->_leaderboard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboard, 0);
  objc_storeStrong((id *)&self->_score, 0);
}

@end
