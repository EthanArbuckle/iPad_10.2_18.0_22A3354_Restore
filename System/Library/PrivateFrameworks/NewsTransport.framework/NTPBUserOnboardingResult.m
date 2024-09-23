@implementation NTPBUserOnboardingResult

- (int)resultType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_resultType;
  else
    return 0;
}

- (void)setResultType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResultType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIcloudAccountMatch:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_icloudAccountMatch = a3;
}

- (void)setHasIcloudAccountMatch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIcloudAccountMatch
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasOnboardAbandonStage
{
  return self->_onboardAbandonStage != 0;
}

- (void)setTotalChannelSelections:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_totalChannelSelections = a3;
}

- (void)setHasTotalChannelSelections:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalChannelSelections
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTotalTopicSelections:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_totalTopicSelections = a3;
}

- (void)setHasTotalTopicSelections:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalTopicSelections
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearChannelIds
{
  -[NSMutableArray removeAllObjects](self->_channelIds, "removeAllObjects");
}

- (void)addChannelId:(id)a3
{
  id v4;
  NSMutableArray *channelIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  channelIds = self->_channelIds;
  v8 = v4;
  if (!channelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_channelIds;
    self->_channelIds = v6;

    v4 = v8;
    channelIds = self->_channelIds;
  }
  -[NSMutableArray addObject:](channelIds, "addObject:", v4);

}

- (unint64_t)channelIdsCount
{
  return -[NSMutableArray count](self->_channelIds, "count");
}

- (id)channelIdAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_channelIds, "objectAtIndex:", a3);
}

+ (Class)channelIdType
{
  return (Class)objc_opt_class();
}

- (void)clearTopicIds
{
  -[NSMutableArray removeAllObjects](self->_topicIds, "removeAllObjects");
}

- (void)addTopicId:(id)a3
{
  id v4;
  NSMutableArray *topicIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicIds = self->_topicIds;
  v8 = v4;
  if (!topicIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicIds;
    self->_topicIds = v6;

    v4 = v8;
    topicIds = self->_topicIds;
  }
  -[NSMutableArray addObject:](topicIds, "addObject:", v4);

}

- (unint64_t)topicIdsCount
{
  return -[NSMutableArray count](self->_topicIds, "count");
}

- (id)topicIdAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicIds, "objectAtIndex:", a3);
}

+ (Class)topicIdType
{
  return (Class)objc_opt_class();
}

- (void)setTotalResets:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalResets = a3;
}

- (void)setHasTotalResets:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalResets
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSawEmailOptIn:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_sawEmailOptIn = a3;
}

- (void)setHasSawEmailOptIn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSawEmailOptIn
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserOnboardingResult;
  -[NTPBUserOnboardingResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBUserOnboardingResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  NSString *onboardAbandonStage;
  char v8;
  void *v9;
  void *v10;
  NSMutableArray *channelIds;
  NSMutableArray *topicIds;
  char v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resultType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("result_type"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_icloudAccountMatch);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("icloud_account_match"));

  }
  onboardAbandonStage = self->_onboardAbandonStage;
  if (onboardAbandonStage)
    objc_msgSend(v3, "setObject:forKey:", onboardAbandonStage, CFSTR("onboard_abandon_stage"));
  v8 = (char)self->_has;
  if ((v8 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalChannelSelections);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("total_channel_selections"));

    v8 = (char)self->_has;
  }
  if ((v8 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalTopicSelections);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("total_topic_selections"));

  }
  channelIds = self->_channelIds;
  if (channelIds)
    objc_msgSend(v3, "setObject:forKey:", channelIds, CFSTR("channel_id"));
  topicIds = self->_topicIds;
  if (topicIds)
    objc_msgSend(v3, "setObject:forKey:", topicIds, CFSTR("topic_id"));
  v13 = (char)self->_has;
  if ((v13 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalResets);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("total_resets"));

    v13 = (char)self->_has;
  }
  if ((v13 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sawEmailOptIn);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("saw_email_opt_in"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserOnboardingResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  char v17;
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

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_onboardAbandonStage)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0)
    PBDataWriterWriteInt32Field();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = self->_channelIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_topicIds;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  v17 = (char)self->_has;
  if ((v17 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v17 = (char)self->_has;
  }
  if ((v17 & 0x20) != 0)
    PBDataWriterWriteBOOLField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  char v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_resultType;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 52) = self->_icloudAccountMatch;
    *(_BYTE *)(v5 + 56) |= 0x10u;
  }
  v8 = -[NSString copyWithZone:](self->_onboardAbandonStage, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v10 = (char)self->_has;
  if ((v10 & 2) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_totalChannelSelections;
    *(_BYTE *)(v6 + 56) |= 2u;
    v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_totalTopicSelections;
    *(_BYTE *)(v6 + 56) |= 8u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = self->_channelIds;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addChannelId:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v13);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = self->_topicIds;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v6, "addTopicId:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

  v23 = (char)self->_has;
  if ((v23 & 4) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_totalResets;
    *(_BYTE *)(v6 + 56) |= 4u;
    v23 = (char)self->_has;
  }
  if ((v23 & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 53) = self->_sawEmailOptIn;
    *(_BYTE *)(v6 + 56) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *onboardAbandonStage;
  NSMutableArray *channelIds;
  NSMutableArray *topicIds;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_resultType != *((_DWORD *)v4 + 6))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0)
      goto LABEL_39;
    if (self->_icloudAccountMatch)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_39;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_39;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  onboardAbandonStage = self->_onboardAbandonStage;
  if ((unint64_t)onboardAbandonStage | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](onboardAbandonStage, "isEqual:"))
      goto LABEL_39;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_totalChannelSelections != *((_DWORD *)v4 + 10))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_totalTopicSelections != *((_DWORD *)v4 + 12))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_39;
  }
  channelIds = self->_channelIds;
  if ((unint64_t)channelIds | *((_QWORD *)v4 + 1)
    && !-[NSMutableArray isEqual:](channelIds, "isEqual:"))
  {
    goto LABEL_39;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](topicIds, "isEqual:"))
      goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_totalResets != *((_DWORD *)v4 + 11))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_39;
  }
  v9 = (*((_BYTE *)v4 + 56) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) != 0)
    {
      if (self->_sawEmailOptIn)
      {
        if (!*((_BYTE *)v4 + 53))
          goto LABEL_39;
      }
      else if (*((_BYTE *)v4 + 53))
      {
        goto LABEL_39;
      }
      v9 = 1;
      goto LABEL_40;
    }
LABEL_39:
    v9 = 0;
  }
LABEL_40:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_resultType;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_icloudAccountMatch;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_onboardAbandonStage, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_totalChannelSelections;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_totalTopicSelections;
      goto LABEL_11;
    }
  }
  v7 = 0;
LABEL_11:
  v8 = -[NSMutableArray hash](self->_channelIds, "hash");
  v9 = -[NSMutableArray hash](self->_topicIds, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v10 = 2654435761 * self->_totalResets;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_13;
LABEL_15:
    v11 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_15;
LABEL_13:
  v11 = 2654435761 * self->_sawEmailOptIn;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 56);
  if ((v6 & 1) != 0)
  {
    self->_resultType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 56);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_icloudAccountMatch = *((_BYTE *)v4 + 52);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 2))
    -[NTPBUserOnboardingResult setOnboardAbandonStage:](self, "setOnboardAbandonStage:");
  v7 = *((_BYTE *)v5 + 56);
  if ((v7 & 2) != 0)
  {
    self->_totalChannelSelections = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v5 + 56);
  }
  if ((v7 & 8) != 0)
  {
    self->_totalTopicSelections = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 8u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = *((id *)v5 + 1);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        -[NTPBUserOnboardingResult addChannelId:](self, "addChannelId:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v10);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = *((id *)v5 + 4);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        -[NTPBUserOnboardingResult addTopicId:](self, "addTopicId:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  v18 = *((_BYTE *)v5 + 56);
  if ((v18 & 4) != 0)
  {
    self->_totalResets = *((_DWORD *)v5 + 11);
    *(_BYTE *)&self->_has |= 4u;
    v18 = *((_BYTE *)v5 + 56);
  }
  if ((v18 & 0x20) != 0)
  {
    self->_sawEmailOptIn = *((_BYTE *)v5 + 53);
    *(_BYTE *)&self->_has |= 0x20u;
  }

}

- (BOOL)icloudAccountMatch
{
  return self->_icloudAccountMatch;
}

- (NSString)onboardAbandonStage
{
  return self->_onboardAbandonStage;
}

- (void)setOnboardAbandonStage:(id)a3
{
  objc_storeStrong((id *)&self->_onboardAbandonStage, a3);
}

- (int)totalChannelSelections
{
  return self->_totalChannelSelections;
}

- (int)totalTopicSelections
{
  return self->_totalTopicSelections;
}

- (NSMutableArray)channelIds
{
  return self->_channelIds;
}

- (void)setChannelIds:(id)a3
{
  objc_storeStrong((id *)&self->_channelIds, a3);
}

- (NSMutableArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
  objc_storeStrong((id *)&self->_topicIds, a3);
}

- (int)totalResets
{
  return self->_totalResets;
}

- (BOOL)sawEmailOptIn
{
  return self->_sawEmailOptIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_onboardAbandonStage, 0);
  objc_storeStrong((id *)&self->_channelIds, 0);
}

@end
