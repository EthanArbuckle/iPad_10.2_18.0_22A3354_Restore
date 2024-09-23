@implementation GKGameRecordInternal

+ (id)gameRecordForGame:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[GKInternalRepresentation internalRepresentation](GKGameRecordInternal, "internalRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithGame:", v3);

  return v4;
}

- (void)updateWithGame:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "secureCodedPropertyKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKGameRecordInternal setValue:forKey:](self, "setValue:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__GKGameRecordInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_197 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_197, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_196;
}

void __47__GKGameRecordInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[9];
  _QWORD v7[10];

  v7[9] = *MEMORY[0x1E0C80C00];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKGameRecordInternal;
  objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v6[0] = CFSTR("score");
  v7[0] = objc_opt_class();
  v6[1] = CFSTR("lastPlayedDate");
  v7[1] = objc_opt_class();
  v6[2] = CFSTR("purchaseDate");
  v7[2] = objc_opt_class();
  v6[3] = CFSTR("achievements");
  v7[3] = objc_opt_class();
  v6[4] = CFSTR("achievementPoints");
  v7[4] = objc_opt_class();
  v6[5] = CFSTR("friendRank");
  v7[5] = objc_opt_class();
  v6[6] = CFSTR("maxFriendRank");
  v7[6] = objc_opt_class();
  v6[7] = CFSTR("rank");
  v7[7] = objc_opt_class();
  v6[8] = CFSTR("maxRank");
  v7[8] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_196;
  secureCodedPropertyKeys_sSecureCodedKeys_196 = (uint64_t)v2;

}

- (GKScoreInternal)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (void)setLastPlayedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayedDate, a3);
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseDate, a3);
}

- (unsigned)achievements
{
  return self->_achievements;
}

- (void)setAchievements:(unsigned __int16)a3
{
  self->_achievements = a3;
}

- (signed)achievementPoints
{
  return self->_achievementPoints;
}

- (void)setAchievementPoints:(signed __int16)a3
{
  self->_achievementPoints = a3;
}

- (unsigned)friendRank
{
  return self->_friendRank;
}

- (void)setFriendRank:(unsigned __int16)a3
{
  self->_friendRank = a3;
}

- (unsigned)maxFriendRank
{
  return self->_maxFriendRank;
}

- (void)setMaxFriendRank:(unsigned __int16)a3
{
  self->_maxFriendRank = a3;
}

- (unsigned)rank
{
  return self->_rank;
}

- (void)setRank:(unsigned int)a3
{
  self->_rank = a3;
}

- (unsigned)maxRank
{
  return self->_maxRank;
}

- (void)setMaxRank:(unsigned int)a3
{
  self->_maxRank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_lastPlayedDate, 0);
  objc_storeStrong((id *)&self->_score, 0);
}

@end
