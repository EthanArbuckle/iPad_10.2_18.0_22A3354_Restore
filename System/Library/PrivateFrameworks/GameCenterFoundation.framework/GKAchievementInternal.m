@implementation GKAchievementInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_19 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_19, &__block_literal_global_60);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_19;
}

void __48__GKAchievementInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[14];
  _QWORD v11[15];

  v11[14] = *MEMORY[0x1E0C80C00];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, CFSTR("achievedDescription"), CFSTR("attributes"), CFSTR("friendsWhoHaveThis"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v3;
  v10[3] = CFSTR("groupIdentifier");
  v11[3] = objc_opt_class();
  v10[4] = CFSTR("icons");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  v10[5] = CFSTR("identifier");
  v11[5] = objc_opt_class();
  v10[6] = CFSTR("lastReportedDate");
  v11[6] = objc_opt_class();
  v10[7] = CFSTR("percentComplete");
  v11[7] = objc_opt_class();
  v10[8] = CFSTR("player");
  v11[8] = objc_opt_class();
  v10[9] = CFSTR("rarityPercent");
  v11[9] = objc_opt_class();
  v10[10] = CFSTR("releaseState");
  v11[10] = objc_opt_class();
  v10[11] = CFSTR("title");
  v11[11] = objc_opt_class();
  v10[12] = CFSTR("unachievedDescription");
  v11[12] = objc_opt_class();
  v10[13] = CFSTR("gameHint");
  v11[13] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 14);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_19;
  secureCodedPropertyKeys_sSecureCodedKeys_19 = v8;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKAchievementInternal;
  v4 = a3;
  -[GKInternalRepresentation encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[GKAchievementInternal player](self, "player", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("playerID"));

  objc_msgSend(v4, "encodeObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasFullPlayer"));
}

- (GKAchievementInternal)initWithCoder:(id)a3
{
  id v4;
  GKAchievementInternal *v5;
  GKAchievementInternal *v6;
  GKPlayerInternal *v7;
  void *v8;
  GKPlayerInternal *player;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKAchievementInternal;
  v5 = -[GKInternalRepresentation initWithCoder:](&v11, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5 && !v5->_player)
  {
    +[GKInternalRepresentation internalRepresentation](GKPlayerInternal, "internalRepresentation");
    v7 = (GKPlayerInternal *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playerID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayerInternal setPlayerID:](v7, "setPlayerID:", v8);

    player = v6->_player;
    v6->_player = v7;

  }
  return v6;
}

- (id)serverRepresentation
{
  double v3;
  double v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[GKAchievementInternal percentComplete](self, "percentComplete");
  v4 = v3;
  -[GKAchievementInternal lastReportedDate](self, "lastReportedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  if (v6 <= 100.0)
    v7 = v4;
  else
    v7 = 100.0;
  v8 = (void *)MEMORY[0x1E0C99D80];
  -[GKAchievementInternal identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[GKAchievementInternal isHidden](self, "isHidden"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", (uint64_t)v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_gkServerTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAchievementInternal groupIdentifier](self, "groupIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, CFSTR("achievement-id"), v10, CFSTR("is-hidden"), v11, CFSTR("achievement-pct"), v12, CFSTR("timestamp"), v13, CFSTR("group-achievement-id"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKAchievementInternal identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      -[GKAchievementInternal groupIdentifier](self, "groupIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isEqualToString:", v10);

    }
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

  -[GKAchievementInternal identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unsigned)attributes
{
  return self->_attributes._value;
}

- (void)setAttributes:(unsigned int)a3
{
  self->_attributes._value = a3;
}

- (unsigned)maximumPoints
{
  return self->_attributes._value;
}

- (void)setMaximumPoints:(unsigned __int16)a3
{
  *(_WORD *)&self->_attributes.var0 = a3;
}

- (BOOL)isHidden
{
  return BYTE2(self->_attributes._value) & 1;
}

- (void)setHidden:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_attributes._value = self->_attributes._value & 0xFFFEFFFF | v3;
}

- (BOOL)isReplayable
{
  return (BYTE2(self->_attributes._value) >> 1) & 1;
}

- (void)setReplayable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_attributes._value = self->_attributes._value & 0xFFFDFFFF | v3;
}

- (BOOL)isCompleted
{
  double v2;

  -[GKAchievementInternal percentComplete](self, "percentComplete");
  return v2 >= 100.0;
}

- (id)descriptionSubstitutionMap
{
  return &unk_1E75FB280;
}

- (NSString)achievedDescription
{
  return self->_achievedDescription;
}

- (void)setAchievedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_achievedDescription, a3);
}

- (NSArray)friendsWhoHaveThis
{
  return self->_friendsWhoHaveThis;
}

- (void)setFriendsWhoHaveThis:(id)a3
{
  objc_storeStrong((id *)&self->_friendsWhoHaveThis, a3);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (NSDictionary)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  objc_storeStrong((id *)&self->_icons, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDate)lastReportedDate
{
  return self->_lastReportedDate;
}

- (void)setLastReportedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastReportedDate, a3);
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (NSNumber)rarityPercent
{
  return self->_rarityPercent;
}

- (void)setRarityPercent:(id)a3
{
  objc_storeStrong((id *)&self->_rarityPercent, a3);
}

- (unint64_t)releaseState
{
  return self->_releaseState;
}

- (void)setReleaseState:(unint64_t)a3
{
  self->_releaseState = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)unachievedDescription
{
  return self->_unachievedDescription;
}

- (void)setUnachievedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_unachievedDescription, a3);
}

- (GKGameInternal)gameHint
{
  return self->_gameHint;
}

- (void)setGameHint:(id)a3
{
  objc_storeStrong((id *)&self->_gameHint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameHint, 0);
  objc_storeStrong((id *)&self->_rarityPercent, 0);
  objc_storeStrong((id *)&self->_friendsWhoHaveThis, 0);
  objc_storeStrong((id *)&self->_lastReportedDate, 0);
  objc_storeStrong((id *)&self->rarityPercent, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_unachievedDescription, 0);
  objc_storeStrong((id *)&self->_achievedDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
