@implementation NTPBUserOnboardingChannelPickerComplete

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
  *(_BYTE *)&self->_has |= 4u;
  self->_totalTopicSelections = a3;
}

- (void)setHasTotalTopicSelections:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalTopicSelections
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (void)setFromPersonalizeNews:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_fromPersonalizeNews = a3;
}

- (void)setHasFromPersonalizeNews:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFromPersonalizeNews
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)channelPickerPresentationReason
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_channelPickerPresentationReason;
  else
    return 0;
}

- (void)setChannelPickerPresentationReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channelPickerPresentationReason = a3;
}

- (void)setHasChannelPickerPresentationReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelPickerPresentationReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)channelPickerPresentationReasonAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4EF00[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChannelPickerPresentationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CHANNEL_PICKER_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PICK_FAVORITES_FOR_YOU_CHANNEL_PICKER_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PICK_FAVORITES_FAVORITES_CHANNEL_PICKER_PRESENTATION_REASON")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)NTPBUserOnboardingChannelPickerComplete;
  -[NTPBUserOnboardingChannelPickerComplete description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBUserOnboardingChannelPickerComplete dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *channelIds;
  NSMutableArray *topicIds;
  char v9;
  void *v10;
  uint64_t channelPickerPresentationReason;
  __CFString *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalChannelSelections);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("total_channel_selections"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_totalTopicSelections);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("total_topic_selections"));

  }
  channelIds = self->_channelIds;
  if (channelIds)
    objc_msgSend(v3, "setObject:forKey:", channelIds, CFSTR("channel_id"));
  topicIds = self->_topicIds;
  if (topicIds)
    objc_msgSend(v3, "setObject:forKey:", topicIds, CFSTR("topic_id"));
  v9 = (char)self->_has;
  if ((v9 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fromPersonalizeNews);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("from_personalize_news"));

    v9 = (char)self->_has;
  }
  if ((v9 & 1) != 0)
  {
    channelPickerPresentationReason = self->_channelPickerPresentationReason;
    if (channelPickerPresentationReason >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_channelPickerPresentationReason);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_24CD4EF00[channelPickerPresentationReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("channel_picker_presentation_reason"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserOnboardingChannelPickerCompleteReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_channelIds;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_topicIds;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = (char)self->_has;
  }
  if ((v16 & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  char v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_totalChannelSelections;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_totalTopicSelections;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = self->_channelIds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addChannelId:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_topicIds;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v6, "addTopicId:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  v20 = (char)self->_has;
  if ((v20 & 8) != 0)
  {
    *(_BYTE *)(v6 + 40) = self->_fromPersonalizeNews;
    *(_BYTE *)(v6 + 44) |= 8u;
    v20 = (char)self->_has;
  }
  if ((v20 & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_channelPickerPresentationReason;
    *(_BYTE *)(v6 + 44) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *channelIds;
  NSMutableArray *topicIds;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_totalChannelSelections != *((_DWORD *)v4 + 8))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_totalTopicSelections != *((_DWORD *)v4 + 9))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_28;
  }
  channelIds = self->_channelIds;
  if ((unint64_t)channelIds | *((_QWORD *)v4 + 1)
    && !-[NSMutableArray isEqual:](channelIds, "isEqual:"))
  {
    goto LABEL_28;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](topicIds, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) != 0)
    {
      if (self->_fromPersonalizeNews)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_28;
        goto LABEL_24;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_24;
    }
LABEL_28:
    v7 = 0;
    goto LABEL_29;
  }
  if ((*((_BYTE *)v4 + 44) & 8) != 0)
    goto LABEL_28;
LABEL_24:
  v7 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_channelPickerPresentationReason != *((_DWORD *)v4 + 4))
      goto LABEL_28;
    v7 = 1;
  }
LABEL_29:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_totalChannelSelections;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_totalTopicSelections;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSMutableArray hash](self->_channelIds, "hash");
  v6 = -[NSMutableArray hash](self->_topicIds, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v7 = 2654435761 * self->_fromPersonalizeNews;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_8:
  v8 = 2654435761 * self->_channelPickerPresentationReason;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
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
  v5 = v4;
  v6 = *((_BYTE *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_totalChannelSelections = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((v6 & 4) != 0)
  {
    self->_totalTopicSelections = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 4u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
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
        -[NTPBUserOnboardingChannelPickerComplete addChannelId:](self, "addChannelId:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *((id *)v5 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
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
        -[NTPBUserOnboardingChannelPickerComplete addTopicId:](self, "addTopicId:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  v17 = *((_BYTE *)v5 + 44);
  if ((v17 & 8) != 0)
  {
    self->_fromPersonalizeNews = *((_BYTE *)v5 + 40);
    *(_BYTE *)&self->_has |= 8u;
    v17 = *((_BYTE *)v5 + 44);
  }
  if ((v17 & 1) != 0)
  {
    self->_channelPickerPresentationReason = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

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

- (BOOL)fromPersonalizeNews
{
  return self->_fromPersonalizeNews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_channelIds, 0);
}

@end
