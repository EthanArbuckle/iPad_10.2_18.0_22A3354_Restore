@implementation GKAchievementChallengeInternal

+ (id)internalRepresentation
{
  return objc_alloc_init((Class)a1);
}

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__GKAchievementChallengeInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_182 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_182, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_181;
}

void __57__GKAchievementChallengeInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___GKAchievementChallengeInternal;
  objc_msgSendSuper2(&v4, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "setObject:forKey:", objc_opt_class(), CFSTR("achievement"));
  v3 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_181;
  secureCodedPropertyKeys_sSecureCodedKeys_181 = (uint64_t)v2;

}

- (id)serverRepresentationForReceivingPlayer:(id)a3
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
  void *v12;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v4 = self;
  v16[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)GKAchievementChallengeInternal;
  -[GKChallengeInternal serverRepresentationForReceivingPlayer:](&v14, sel_serverRepresentationForReceivingPlayer_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKey:", &unk_1E75FB1F0, CFSTR("challenge-type"));
  v15[0] = CFSTR("achievement-id");
  objc_msgSend(v4, "achievement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("timestamp");
  v16[0] = v8;
  objc_msgSend(v4, "achievement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastReportedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "achievement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastReportedDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_gkServerTimestamp");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "_gkServerTimestamp");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    v11 = v4;
  }

  objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("achievement"));
  return v6;
}

- (unint64_t)type
{
  return 2;
}

- (id)titleText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[GCFLocalizedStrings SHORT_CHALLENGE_ACHIEVEMENT_TITLE_FORMAT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "SHORT_CHALLENGE_ACHIEVEMENT_TITLE_FORMAT");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAchievementChallengeInternal achievement](self, "achievement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (GKAchievementInternal)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achievement, 0);
}

@end
