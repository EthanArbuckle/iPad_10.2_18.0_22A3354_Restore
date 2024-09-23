@implementation NTPBVideoGroupsConfig

- (void)setPlaysMutedByDefault:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_playsMutedByDefault = a3;
}

- (void)setHasPlaysMutedByDefault:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPlaysMutedByDefault
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNowPlayingBarTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_nowPlayingBarTime = a3;
}

- (void)setHasNowPlayingBarTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNowPlayingBarTime
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setUpNextBarTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_upNextBarTime = a3;
}

- (void)setHasUpNextBarTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasUpNextBarTime
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMoreFromPublisherBarTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_moreFromPublisherBarTime = a3;
}

- (void)setHasMoreFromPublisherBarTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasMoreFromPublisherBarTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMoreFromPublisherBarEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_moreFromPublisherBarEnabled = a3;
}

- (void)setHasMoreFromPublisherBarEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMoreFromPublisherBarEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)moreVideosGroupSortOption
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_moreVideosGroupSortOption;
  else
    return 0;
}

- (void)setMoreVideosGroupSortOption:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_moreVideosGroupSortOption = a3;
}

- (void)setHasMoreVideosGroupSortOption:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMoreVideosGroupSortOption
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)moreVideosGroupFilterOption
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_moreVideosGroupFilterOption;
  else
    return 0;
}

- (void)setMoreVideosGroupFilterOption:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_moreVideosGroupFilterOption = a3;
}

- (void)setHasMoreVideosGroupFilterOption:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMoreVideosGroupFilterOption
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMoreVideosGroupMinNumberOfVideos:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_moreVideosGroupMinNumberOfVideos = a3;
}

- (void)setHasMoreVideosGroupMinNumberOfVideos:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMoreVideosGroupMinNumberOfVideos
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMoreVideosGroupMaxNumberOfVideos:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_moreVideosGroupMaxNumberOfVideos = a3;
}

- (void)setHasMoreVideosGroupMaxNumberOfVideos:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMoreVideosGroupMaxNumberOfVideos
{
  return (*(_WORD *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)NTPBVideoGroupsConfig;
  -[NTPBVideoGroupsConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBVideoGroupsConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_playsMutedByDefault);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("plays_muted_by_default"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_nowPlayingBarTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("now_playing_bar_time"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_upNextBarTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("up_next_bar_time"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_moreFromPublisherBarTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("more_from_publisher_bar_time"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_moreFromPublisherBarEnabled);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("more_from_publisher_bar_enabled"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_moreVideosGroupSortOption);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("more_videos_group_sort_option"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_moreVideosGroupMinNumberOfVideos);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("more_videos_group_min_number_of_videos"));

    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_moreVideosGroupFilterOption);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("more_videos_group_filter_option"));

  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 2) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_moreVideosGroupMaxNumberOfVideos);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("more_videos_group_max_number_of_videos"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBVideoGroupsConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteInt64Field();
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 2) != 0)
LABEL_10:
    PBDataWriterWriteInt64Field();
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_BYTE *)result + 57) = self->_playsMutedByDefault;
    *((_WORD *)result + 30) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 4) = self->_nowPlayingBarTime;
  *((_WORD *)result + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 5) = self->_upNextBarTime;
  *((_WORD *)result + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 1) = self->_moreFromPublisherBarTime;
  *((_WORD *)result + 30) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)result + 56) = self->_moreFromPublisherBarEnabled;
  *((_WORD *)result + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 13) = self->_moreVideosGroupSortOption;
  *((_WORD *)result + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 12) = self->_moreVideosGroupFilterOption;
  *((_WORD *)result + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      return result;
    goto LABEL_10;
  }
LABEL_19:
  *((_QWORD *)result + 3) = self->_moreVideosGroupMinNumberOfVideos;
  *((_WORD *)result + 30) |= 4u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return result;
LABEL_10:
  *((_QWORD *)result + 2) = self->_moreVideosGroupMaxNumberOfVideos;
  *((_WORD *)result + 30) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_53;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 30);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0)
      goto LABEL_53;
    if (self->_playsMutedByDefault)
    {
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_53;
    }
    else if (*((_BYTE *)v4 + 57))
    {
      goto LABEL_53;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_nowPlayingBarTime != *((_QWORD *)v4 + 4))
      goto LABEL_53;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_upNextBarTime != *((_QWORD *)v4 + 5))
      goto LABEL_53;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_moreFromPublisherBarTime != *((_QWORD *)v4 + 1))
      goto LABEL_53;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_moreFromPublisherBarEnabled)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_53;
        goto LABEL_33;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_33;
    }
LABEL_53:
    v7 = 0;
    goto LABEL_54;
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_53;
LABEL_33:
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_moreVideosGroupSortOption != *((_DWORD *)v4 + 13))
      goto LABEL_53;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_moreVideosGroupFilterOption != *((_DWORD *)v4 + 12))
      goto LABEL_53;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_moreVideosGroupMinNumberOfVideos != *((_QWORD *)v4 + 3))
      goto LABEL_53;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_53;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_moreVideosGroupMaxNumberOfVideos != *((_QWORD *)v4 + 2))
      goto LABEL_53;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 2) == 0;
  }
LABEL_54:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v3 = 2654435761 * self->_playsMutedByDefault;
    if ((has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_nowPlayingBarTime;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_upNextBarTime;
    if ((has & 1) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((has & 1) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_moreFromPublisherBarTime;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_moreFromPublisherBarEnabled;
    if ((has & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_moreVideosGroupSortOption;
    if ((has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_moreVideosGroupFilterOption;
    if ((has & 4) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((has & 2) != 0)
      goto LABEL_10;
LABEL_19:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  v9 = 0;
  if ((has & 4) == 0)
    goto LABEL_18;
LABEL_9:
  v10 = 2654435761 * self->_moreVideosGroupMinNumberOfVideos;
  if ((has & 2) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761 * self->_moreVideosGroupMaxNumberOfVideos;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) != 0)
  {
    self->_playsMutedByDefault = *((_BYTE *)v4 + 57);
    *(_WORD *)&self->_has |= 0x100u;
    v5 = *((_WORD *)v4 + 30);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_nowPlayingBarTime = *((_QWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_upNextBarTime = *((_QWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_moreFromPublisherBarTime = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_moreFromPublisherBarEnabled = *((_BYTE *)v4 + 56);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_moreVideosGroupSortOption = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0)
      goto LABEL_9;
LABEL_19:
    self->_moreVideosGroupMinNumberOfVideos = *((_QWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
    if ((*((_WORD *)v4 + 30) & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  self->_moreVideosGroupFilterOption = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) != 0)
    goto LABEL_19;
LABEL_9:
  if ((v5 & 2) != 0)
  {
LABEL_10:
    self->_moreVideosGroupMaxNumberOfVideos = *((_QWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_11:

}

- (BOOL)playsMutedByDefault
{
  return self->_playsMutedByDefault;
}

- (int64_t)nowPlayingBarTime
{
  return self->_nowPlayingBarTime;
}

- (int64_t)upNextBarTime
{
  return self->_upNextBarTime;
}

- (int64_t)moreFromPublisherBarTime
{
  return self->_moreFromPublisherBarTime;
}

- (BOOL)moreFromPublisherBarEnabled
{
  return self->_moreFromPublisherBarEnabled;
}

- (int64_t)moreVideosGroupMinNumberOfVideos
{
  return self->_moreVideosGroupMinNumberOfVideos;
}

- (int64_t)moreVideosGroupMaxNumberOfVideos
{
  return self->_moreVideosGroupMaxNumberOfVideos;
}

@end
