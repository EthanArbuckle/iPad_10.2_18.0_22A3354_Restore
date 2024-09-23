@implementation NTPBReadingHistoryItem

- (void)dealloc
{
  objc_super v3;

  -[NTPBReadingHistoryItem setArticleID:](self, "setArticleID:", 0);
  -[NTPBReadingHistoryItem setLastVisitedDate:](self, "setLastVisitedDate:", 0);
  -[NTPBReadingHistoryItem setFirstSeenDate:](self, "setFirstSeenDate:", 0);
  -[NTPBReadingHistoryItem setFirstSeenDateOfMaxVersionSeen:](self, "setFirstSeenDateOfMaxVersionSeen:", 0);
  -[NTPBReadingHistoryItem setSourceChannelTagID:](self, "setSourceChannelTagID:", 0);
  -[NTPBReadingHistoryItem setDeviceID:](self, "setDeviceID:", 0);
  -[NTPBReadingHistoryItem setLastListened:](self, "setLastListened:", 0);
  -[NTPBReadingHistoryItem setReadingPosition:](self, "setReadingPosition:", 0);
  -[NTPBReadingHistoryItem setListeningProgressSavedDate:](self, "setListeningProgressSavedDate:", 0);
  -[NTPBReadingHistoryItem setReadingPositionSavedDate:](self, "setReadingPositionSavedDate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBReadingHistoryItem;
  -[NTPBReadingHistoryItem dealloc](&v3, sel_dealloc);
}

- (BOOL)hasArticleID
{
  return self->_articleID != 0;
}

- (BOOL)hasLastVisitedDate
{
  return self->_lastVisitedDate != 0;
}

- (void)setFlags:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFlags
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setMaxVersionRead:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_maxVersionRead = a3;
}

- (void)setHasMaxVersionRead:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxVersionRead
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasFirstSeenDate
{
  return self->_firstSeenDate != 0;
}

- (BOOL)hasFirstSeenDateOfMaxVersionSeen
{
  return self->_firstSeenDateOfMaxVersionSeen != 0;
}

- (void)setMaxVersionSeen:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_maxVersionSeen = a3;
}

- (void)setHasMaxVersionSeen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMaxVersionSeen
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasSourceChannelTagID
{
  return self->_sourceChannelTagID != 0;
}

- (BOOL)hasDeviceID
{
  return self->_deviceID != 0;
}

- (void)setListeningProgress:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_listeningProgress = a3;
}

- (void)setHasListeningProgress:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasListeningProgress
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLastListened
{
  return self->_lastListened != 0;
}

- (BOOL)hasReadingPosition
{
  return self->_readingPosition != 0;
}

- (void)setReadCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_readCount = a3;
}

- (void)setHasReadCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReadCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasListeningProgressSavedDate
{
  return self->_listeningProgressSavedDate != 0;
}

- (BOOL)hasReadingPositionSavedDate
{
  return self->_readingPositionSavedDate != 0;
}

- (void)setListenedCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_listenedCount = a3;
}

- (void)setHasListenedCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasListenedCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBReadingHistoryItem;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBReadingHistoryItem description](&v3, sel_description), -[NTPBReadingHistoryItem dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleID;
  NTPBDate *lastVisitedDate;
  char has;
  NTPBDate *firstSeenDate;
  NTPBDate *firstSeenDateOfMaxVersionSeen;
  NSString *sourceChannelTagID;
  NSString *deviceID;
  NTPBDate *lastListened;
  NSString *readingPosition;
  NTPBDate *listeningProgressSavedDate;
  NTPBDate *readingPositionSavedDate;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  articleID = self->_articleID;
  if (articleID)
    objc_msgSend(v3, "setObject:forKey:", articleID, CFSTR("article_ID"));
  lastVisitedDate = self->_lastVisitedDate;
  if (lastVisitedDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastVisitedDate, "dictionaryRepresentation"), CFSTR("last_visited_date"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags), CFSTR("flags"));
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_maxVersionRead), CFSTR("max_version_read"));
  firstSeenDate = self->_firstSeenDate;
  if (firstSeenDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](firstSeenDate, "dictionaryRepresentation"), CFSTR("first_seen_date"));
  firstSeenDateOfMaxVersionSeen = self->_firstSeenDateOfMaxVersionSeen;
  if (firstSeenDateOfMaxVersionSeen)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](firstSeenDateOfMaxVersionSeen, "dictionaryRepresentation"), CFSTR("first_seen_date_of_max_version_seen"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_maxVersionSeen), CFSTR("max_version_seen"));
  sourceChannelTagID = self->_sourceChannelTagID;
  if (sourceChannelTagID)
    objc_msgSend(v4, "setObject:forKey:", sourceChannelTagID, CFSTR("source_channel_tag_ID"));
  deviceID = self->_deviceID;
  if (deviceID)
    objc_msgSend(v4, "setObject:forKey:", deviceID, CFSTR("device_ID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_listeningProgress), CFSTR("listening_progress"));
  lastListened = self->_lastListened;
  if (lastListened)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastListened, "dictionaryRepresentation"), CFSTR("last_listened"));
  readingPosition = self->_readingPosition;
  if (readingPosition)
    objc_msgSend(v4, "setObject:forKey:", readingPosition, CFSTR("reading_position"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_readCount), CFSTR("read_count"));
  listeningProgressSavedDate = self->_listeningProgressSavedDate;
  if (listeningProgressSavedDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](listeningProgressSavedDate, "dictionaryRepresentation"), CFSTR("listening_progress_saved_date"));
  readingPositionSavedDate = self->_readingPositionSavedDate;
  if (readingPositionSavedDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](readingPositionSavedDate, "dictionaryRepresentation"), CFSTR("reading_position_saved_date"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_listenedCount), CFSTR("listened_count"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBReadingHistoryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_articleID)
    PBDataWriterWriteStringField();
  if (self->_lastVisitedDate)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteFixed32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_firstSeenDate)
    PBDataWriterWriteSubmessage();
  if (self->_firstSeenDateOfMaxVersionSeen)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_sourceChannelTagID)
    PBDataWriterWriteStringField();
  if (self->_deviceID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_lastListened)
    PBDataWriterWriteSubmessage();
  if (self->_readingPosition)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_listeningProgressSavedDate)
    PBDataWriterWriteSubmessage();
  if (self->_readingPositionSavedDate)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 48) = -[NSString copyWithZone:](self->_articleID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 96) = -[NTPBDate copyWithZone:](self->_lastVisitedDate, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_flags;
    *(_BYTE *)(v5 + 136) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_maxVersionRead;
    *(_BYTE *)(v5 + 136) |= 4u;
  }

  *(_QWORD *)(v5 + 64) = -[NTPBDate copyWithZone:](self->_firstSeenDate, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 72) = -[NTPBDate copyWithZone:](self->_firstSeenDateOfMaxVersionSeen, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_maxVersionSeen;
    *(_BYTE *)(v5 + 136) |= 8u;
  }

  *(_QWORD *)(v5 + 128) = -[NSString copyWithZone:](self->_sourceChannelTagID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 56) = -[NSString copyWithZone:](self->_deviceID, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_listeningProgress;
    *(_BYTE *)(v5 + 136) |= 2u;
  }

  *(_QWORD *)(v5 + 88) = -[NTPBDate copyWithZone:](self->_lastListened, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 112) = -[NSString copyWithZone:](self->_readingPosition, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_readCount;
    *(_BYTE *)(v5 + 136) |= 0x10u;
  }

  *(_QWORD *)(v5 + 104) = -[NTPBDate copyWithZone:](self->_listeningProgressSavedDate, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 120) = -[NTPBDate copyWithZone:](self->_readingPositionSavedDate, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_listenedCount;
    *(_BYTE *)(v5 + 136) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *articleID;
  NTPBDate *lastVisitedDate;
  NTPBDate *firstSeenDate;
  NTPBDate *firstSeenDateOfMaxVersionSeen;
  NSString *sourceChannelTagID;
  NSString *deviceID;
  NTPBDate *lastListened;
  NSString *readingPosition;
  NTPBDate *listeningProgressSavedDate;
  NTPBDate *readingPositionSavedDate;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    articleID = self->_articleID;
    if (!((unint64_t)articleID | *((_QWORD *)a3 + 6)) || (v5 = -[NSString isEqual:](articleID, "isEqual:")) != 0)
    {
      lastVisitedDate = self->_lastVisitedDate;
      if (!((unint64_t)lastVisitedDate | *((_QWORD *)a3 + 12))
        || (v5 = -[NTPBDate isEqual:](lastVisitedDate, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 0x20) != 0)
        {
          if ((*((_BYTE *)a3 + 136) & 0x20) == 0 || self->_flags != *((_DWORD *)a3 + 20))
            goto LABEL_51;
        }
        else if ((*((_BYTE *)a3 + 136) & 0x20) != 0)
        {
LABEL_51:
          LOBYTE(v5) = 0;
          return v5;
        }
        if ((*(_BYTE *)&self->_has & 4) != 0)
        {
          if ((*((_BYTE *)a3 + 136) & 4) == 0 || self->_maxVersionRead != *((_QWORD *)a3 + 3))
            goto LABEL_51;
        }
        else if ((*((_BYTE *)a3 + 136) & 4) != 0)
        {
          goto LABEL_51;
        }
        firstSeenDate = self->_firstSeenDate;
        if (!((unint64_t)firstSeenDate | *((_QWORD *)a3 + 8))
          || (v5 = -[NTPBDate isEqual:](firstSeenDate, "isEqual:")) != 0)
        {
          firstSeenDateOfMaxVersionSeen = self->_firstSeenDateOfMaxVersionSeen;
          if (!((unint64_t)firstSeenDateOfMaxVersionSeen | *((_QWORD *)a3 + 9))
            || (v5 = -[NTPBDate isEqual:](firstSeenDateOfMaxVersionSeen, "isEqual:")) != 0)
          {
            if ((*(_BYTE *)&self->_has & 8) != 0)
            {
              if ((*((_BYTE *)a3 + 136) & 8) == 0 || self->_maxVersionSeen != *((_QWORD *)a3 + 4))
                goto LABEL_51;
            }
            else if ((*((_BYTE *)a3 + 136) & 8) != 0)
            {
              goto LABEL_51;
            }
            sourceChannelTagID = self->_sourceChannelTagID;
            if (!((unint64_t)sourceChannelTagID | *((_QWORD *)a3 + 16))
              || (v5 = -[NSString isEqual:](sourceChannelTagID, "isEqual:")) != 0)
            {
              deviceID = self->_deviceID;
              if (!((unint64_t)deviceID | *((_QWORD *)a3 + 7))
                || (v5 = -[NSString isEqual:](deviceID, "isEqual:")) != 0)
              {
                if ((*(_BYTE *)&self->_has & 2) != 0)
                {
                  if ((*((_BYTE *)a3 + 136) & 2) == 0 || self->_listeningProgress != *((double *)a3 + 2))
                    goto LABEL_51;
                }
                else if ((*((_BYTE *)a3 + 136) & 2) != 0)
                {
                  goto LABEL_51;
                }
                lastListened = self->_lastListened;
                if (!((unint64_t)lastListened | *((_QWORD *)a3 + 11))
                  || (v5 = -[NTPBDate isEqual:](lastListened, "isEqual:")) != 0)
                {
                  readingPosition = self->_readingPosition;
                  if (!((unint64_t)readingPosition | *((_QWORD *)a3 + 14))
                    || (v5 = -[NSString isEqual:](readingPosition, "isEqual:")) != 0)
                  {
                    if ((*(_BYTE *)&self->_has & 0x10) != 0)
                    {
                      if ((*((_BYTE *)a3 + 136) & 0x10) == 0 || self->_readCount != *((_QWORD *)a3 + 5))
                        goto LABEL_51;
                    }
                    else if ((*((_BYTE *)a3 + 136) & 0x10) != 0)
                    {
                      goto LABEL_51;
                    }
                    listeningProgressSavedDate = self->_listeningProgressSavedDate;
                    if (!((unint64_t)listeningProgressSavedDate | *((_QWORD *)a3 + 13))
                      || (v5 = -[NTPBDate isEqual:](listeningProgressSavedDate, "isEqual:")) != 0)
                    {
                      readingPositionSavedDate = self->_readingPositionSavedDate;
                      if (!((unint64_t)readingPositionSavedDate | *((_QWORD *)a3 + 15))
                        || (v5 = -[NTPBDate isEqual:](readingPositionSavedDate, "isEqual:")) != 0)
                      {
                        LOBYTE(v5) = (*((_BYTE *)a3 + 136) & 1) == 0;
                        if ((*(_BYTE *)&self->_has & 1) != 0)
                        {
                          if ((*((_BYTE *)a3 + 136) & 1) == 0 || self->_listenedCount != *((_QWORD *)a3 + 1))
                            goto LABEL_51;
                          LOBYTE(v5) = 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  double listeningProgress;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  NSUInteger v23;

  v23 = -[NSString hash](self->_articleID, "hash");
  v22 = -[NTPBDate hash](self->_lastVisitedDate, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v21 = 2654435761 * self->_flags;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v21 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v20 = 2654435761 * self->_maxVersionRead;
      goto LABEL_6;
    }
  }
  v20 = 0;
LABEL_6:
  v19 = -[NTPBDate hash](self->_firstSeenDate, "hash");
  v18 = -[NTPBDate hash](self->_firstSeenDateOfMaxVersionSeen, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v17 = 2654435761 * self->_maxVersionSeen;
  else
    v17 = 0;
  v3 = -[NSString hash](self->_sourceChannelTagID, "hash");
  v4 = -[NSString hash](self->_deviceID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    listeningProgress = self->_listeningProgress;
    v7 = -listeningProgress;
    if (listeningProgress >= 0.0)
      v7 = self->_listeningProgress;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = -[NTPBDate hash](self->_lastListened, "hash");
  v11 = -[NSString hash](self->_readingPosition, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v12 = 2654435761 * self->_readCount;
  else
    v12 = 0;
  v13 = -[NTPBDate hash](self->_listeningProgressSavedDate, "hash");
  v14 = -[NTPBDate hash](self->_readingPositionSavedDate, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v15 = 2654435761 * self->_listenedCount;
  else
    v15 = 0;
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  NTPBDate *lastVisitedDate;
  uint64_t v6;
  char v7;
  NTPBDate *firstSeenDate;
  uint64_t v9;
  NTPBDate *firstSeenDateOfMaxVersionSeen;
  uint64_t v11;
  NTPBDate *lastListened;
  uint64_t v13;
  NTPBDate *listeningProgressSavedDate;
  uint64_t v15;
  NTPBDate *readingPositionSavedDate;
  uint64_t v17;

  if (*((_QWORD *)a3 + 6))
    -[NTPBReadingHistoryItem setArticleID:](self, "setArticleID:");
  lastVisitedDate = self->_lastVisitedDate;
  v6 = *((_QWORD *)a3 + 12);
  if (lastVisitedDate)
  {
    if (v6)
      -[NTPBDate mergeFrom:](lastVisitedDate, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBReadingHistoryItem setLastVisitedDate:](self, "setLastVisitedDate:");
  }
  v7 = *((_BYTE *)a3 + 136);
  if ((v7 & 0x20) != 0)
  {
    self->_flags = *((_DWORD *)a3 + 20);
    *(_BYTE *)&self->_has |= 0x20u;
    v7 = *((_BYTE *)a3 + 136);
  }
  if ((v7 & 4) != 0)
  {
    self->_maxVersionRead = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  firstSeenDate = self->_firstSeenDate;
  v9 = *((_QWORD *)a3 + 8);
  if (firstSeenDate)
  {
    if (v9)
      -[NTPBDate mergeFrom:](firstSeenDate, "mergeFrom:");
  }
  else if (v9)
  {
    -[NTPBReadingHistoryItem setFirstSeenDate:](self, "setFirstSeenDate:");
  }
  firstSeenDateOfMaxVersionSeen = self->_firstSeenDateOfMaxVersionSeen;
  v11 = *((_QWORD *)a3 + 9);
  if (firstSeenDateOfMaxVersionSeen)
  {
    if (v11)
      -[NTPBDate mergeFrom:](firstSeenDateOfMaxVersionSeen, "mergeFrom:");
  }
  else if (v11)
  {
    -[NTPBReadingHistoryItem setFirstSeenDateOfMaxVersionSeen:](self, "setFirstSeenDateOfMaxVersionSeen:");
  }
  if ((*((_BYTE *)a3 + 136) & 8) != 0)
  {
    self->_maxVersionSeen = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)a3 + 16))
    -[NTPBReadingHistoryItem setSourceChannelTagID:](self, "setSourceChannelTagID:");
  if (*((_QWORD *)a3 + 7))
    -[NTPBReadingHistoryItem setDeviceID:](self, "setDeviceID:");
  if ((*((_BYTE *)a3 + 136) & 2) != 0)
  {
    self->_listeningProgress = *((double *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  lastListened = self->_lastListened;
  v13 = *((_QWORD *)a3 + 11);
  if (lastListened)
  {
    if (v13)
      -[NTPBDate mergeFrom:](lastListened, "mergeFrom:");
  }
  else if (v13)
  {
    -[NTPBReadingHistoryItem setLastListened:](self, "setLastListened:");
  }
  if (*((_QWORD *)a3 + 14))
    -[NTPBReadingHistoryItem setReadingPosition:](self, "setReadingPosition:");
  if ((*((_BYTE *)a3 + 136) & 0x10) != 0)
  {
    self->_readCount = *((_QWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  listeningProgressSavedDate = self->_listeningProgressSavedDate;
  v15 = *((_QWORD *)a3 + 13);
  if (listeningProgressSavedDate)
  {
    if (v15)
      -[NTPBDate mergeFrom:](listeningProgressSavedDate, "mergeFrom:");
  }
  else if (v15)
  {
    -[NTPBReadingHistoryItem setListeningProgressSavedDate:](self, "setListeningProgressSavedDate:");
  }
  readingPositionSavedDate = self->_readingPositionSavedDate;
  v17 = *((_QWORD *)a3 + 15);
  if (readingPositionSavedDate)
  {
    if (v17)
      -[NTPBDate mergeFrom:](readingPositionSavedDate, "mergeFrom:");
  }
  else if (v17)
  {
    -[NTPBReadingHistoryItem setReadingPositionSavedDate:](self, "setReadingPositionSavedDate:");
  }
  if ((*((_BYTE *)a3 + 136) & 1) != 0)
  {
    self->_listenedCount = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)articleID
{
  return self->_articleID;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NTPBDate)lastVisitedDate
{
  return self->_lastVisitedDate;
}

- (void)setLastVisitedDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (unsigned)flags
{
  return self->_flags;
}

- (int64_t)maxVersionRead
{
  return self->_maxVersionRead;
}

- (NTPBDate)firstSeenDate
{
  return self->_firstSeenDate;
}

- (void)setFirstSeenDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NTPBDate)firstSeenDateOfMaxVersionSeen
{
  return self->_firstSeenDateOfMaxVersionSeen;
}

- (void)setFirstSeenDateOfMaxVersionSeen:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (int64_t)maxVersionSeen
{
  return self->_maxVersionSeen;
}

- (NSString)sourceChannelTagID
{
  return self->_sourceChannelTagID;
}

- (void)setSourceChannelTagID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (double)listeningProgress
{
  return self->_listeningProgress;
}

- (NTPBDate)lastListened
{
  return self->_lastListened;
}

- (void)setLastListened:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSString)readingPosition
{
  return self->_readingPosition;
}

- (void)setReadingPosition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (int64_t)readCount
{
  return self->_readCount;
}

- (NTPBDate)listeningProgressSavedDate
{
  return self->_listeningProgressSavedDate;
}

- (void)setListeningProgressSavedDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NTPBDate)readingPositionSavedDate
{
  return self->_readingPositionSavedDate;
}

- (void)setReadingPositionSavedDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (int64_t)listenedCount
{
  return self->_listenedCount;
}

@end
