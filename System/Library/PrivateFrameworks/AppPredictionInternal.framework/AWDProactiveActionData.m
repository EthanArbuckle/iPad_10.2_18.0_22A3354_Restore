@implementation AWDProactiveActionData

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasActionKey
{
  return self->_actionKey != 0;
}

- (void)setCacheRank:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_cacheRank = a3;
}

- (void)setHasCacheRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCacheRank
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEngagedAction:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_engagedAction = a3;
}

- (void)setHasEngagedAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEngagedAction
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setFutureMedia:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_futureMedia = a3;
}

- (void)setHasFutureMedia:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFutureMedia
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setShown:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_shown = a3;
}

- (void)setHasShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasShown
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasSubscores
{
  return self->_subscores != 0;
}

- (BOOL)hasHeuristicName
{
  return self->_heuristicName != 0;
}

- (BOOL)hasEngaged
{
  return self->_engaged != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveActionData;
  -[AWDProactiveActionData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveActionData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *actionKey;
  char has;
  void *v7;
  AWDProactiveAppPredictionSubscores *subscores;
  void *v9;
  NSString *heuristicName;
  NSString *engaged;
  NSString *sessionId;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  actionKey = self->_actionKey;
  if (actionKey)
    objc_msgSend(v3, "setObject:forKey:", actionKey, CFSTR("actionKey"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_cacheRank);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cacheRank"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_engagedAction);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("engagedAction"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_futureMedia);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("futureMedia"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("score"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shown);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("shown"));

  }
LABEL_11:
  subscores = self->_subscores;
  if (subscores)
  {
    -[AWDProactiveAppPredictionSubscores dictionaryRepresentation](subscores, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("subscores"));

  }
  heuristicName = self->_heuristicName;
  if (heuristicName)
    objc_msgSend(v3, "setObject:forKey:", heuristicName, CFSTR("heuristicName"));
  engaged = self->_engaged;
  if (engaged)
    objc_msgSend(v3, "setObject:forKey:", engaged, CFSTR("engaged"));
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveActionDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_actionKey)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_11:
  if (self->_subscores)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_heuristicName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_engaged)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_sessionId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((_BYTE *)v4 + 76) |= 2u;
  }
  v6 = v4;
  if (self->_actionKey)
  {
    objc_msgSend(v4, "setActionKey:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_cacheRank;
    *((_BYTE *)v4 + 76) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v4 + 72) = self->_engagedAction;
  *((_BYTE *)v4 + 76) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)v4 + 73) = self->_futureMedia;
  *((_BYTE *)v4 + 76) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_23:
  v4[1] = *(_QWORD *)&self->_score;
  *((_BYTE *)v4 + 76) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    *((_BYTE *)v4 + 74) = self->_shown;
    *((_BYTE *)v4 + 76) |= 0x20u;
  }
LABEL_11:
  if (self->_subscores)
  {
    objc_msgSend(v6, "setSubscores:");
    v4 = v6;
  }
  if (self->_heuristicName)
  {
    objc_msgSend(v6, "setHeuristicName:");
    v4 = v6;
  }
  if (self->_engaged)
  {
    objc_msgSend(v6, "setEngaged:");
    v4 = v6;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v6, "setSessionId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_actionKey, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_cacheRank;
    *(_BYTE *)(v6 + 76) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 72) = self->_engagedAction;
  *(_BYTE *)(v6 + 76) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
LABEL_13:
    *(double *)(v6 + 8) = self->_score;
    *(_BYTE *)(v6 + 76) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  *(_BYTE *)(v6 + 73) = self->_futureMedia;
  *(_BYTE *)(v6 + 76) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 74) = self->_shown;
    *(_BYTE *)(v6 + 76) |= 0x20u;
  }
LABEL_9:
  v10 = -[AWDProactiveAppPredictionSubscores copyWithZone:](self->_subscores, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v10;

  v12 = -[NSString copyWithZone:](self->_heuristicName, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_engaged, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v14;

  v16 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v16;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *actionKey;
  AWDProactiveAppPredictionSubscores *subscores;
  NSString *heuristicName;
  NSString *engaged;
  NSString *sessionId;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 2))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_52;
  }
  actionKey = self->_actionKey;
  if ((unint64_t)actionKey | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](actionKey, "isEqual:"))
      goto LABEL_52;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_cacheRank != *((_DWORD *)v4 + 8))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0)
      goto LABEL_52;
    if (self->_engagedAction)
    {
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 72))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x10) == 0)
      goto LABEL_52;
    if (self->_futureMedia)
    {
      if (!*((_BYTE *)v4 + 73))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 73))
    {
      goto LABEL_52;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_score != *((double *)v4 + 1))
      goto LABEL_52;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x20) != 0)
    {
      if (self->_shown)
      {
        if (!*((_BYTE *)v4 + 74))
          goto LABEL_52;
        goto LABEL_44;
      }
      if (!*((_BYTE *)v4 + 74))
        goto LABEL_44;
    }
LABEL_52:
    v11 = 0;
    goto LABEL_53;
  }
  if ((*((_BYTE *)v4 + 76) & 0x20) != 0)
    goto LABEL_52;
LABEL_44:
  subscores = self->_subscores;
  if ((unint64_t)subscores | *((_QWORD *)v4 + 8)
    && !-[AWDProactiveAppPredictionSubscores isEqual:](subscores, "isEqual:"))
  {
    goto LABEL_52;
  }
  heuristicName = self->_heuristicName;
  if ((unint64_t)heuristicName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](heuristicName, "isEqual:"))
      goto LABEL_52;
  }
  engaged = self->_engaged;
  if ((unint64_t)engaged | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](engaged, "isEqual:"))
      goto LABEL_52;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 7))
    v11 = -[NSString isEqual:](sessionId, "isEqual:");
  else
    v11 = 1;
LABEL_53:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  char has;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double score;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  NSUInteger v17;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_actionKey, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v6 = 2654435761 * self->_cacheRank;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_engagedAction;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_7;
LABEL_14:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_8;
LABEL_15:
      v13 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_7:
  v8 = 2654435761 * self->_futureMedia;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_15;
LABEL_8:
  score = self->_score;
  v10 = -score;
  if (score >= 0.0)
    v10 = self->_score;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_18:
  if ((has & 0x20) != 0)
    v14 = 2654435761 * self->_shown;
  else
    v14 = 0;
  v15 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ -[AWDProactiveAppPredictionSubscores hash](self->_subscores, "hash");
  v16 = -[NSString hash](self->_heuristicName, "hash");
  v17 = v16 ^ -[NSString hash](self->_engaged, "hash");
  return v15 ^ v17 ^ -[NSString hash](self->_sessionId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  char v6;
  AWDProactiveAppPredictionSubscores *subscores;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    self->_timestamp = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  v9 = v4;
  if (v4[3])
  {
    -[AWDProactiveActionData setActionKey:](self, "setActionKey:");
    v5 = v9;
  }
  v6 = *((_BYTE *)v5 + 76);
  if ((v6 & 4) != 0)
  {
    self->_cacheRank = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v5 + 76);
    if ((v6 & 8) == 0)
    {
LABEL_7:
      if ((v6 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v5 + 76) & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_engagedAction = *((_BYTE *)v5 + 72);
  *(_BYTE *)&self->_has |= 8u;
  v6 = *((_BYTE *)v5 + 76);
  if ((v6 & 0x10) == 0)
  {
LABEL_8:
    if ((v6 & 1) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  self->_futureMedia = *((_BYTE *)v5 + 73);
  *(_BYTE *)&self->_has |= 0x10u;
  v6 = *((_BYTE *)v5 + 76);
  if ((v6 & 1) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_17:
  self->_score = *((double *)v5 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v5 + 76) & 0x20) != 0)
  {
LABEL_10:
    self->_shown = *((_BYTE *)v5 + 74);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_11:
  subscores = self->_subscores;
  v8 = *((_QWORD *)v5 + 8);
  if (subscores)
  {
    if (!v8)
      goto LABEL_22;
    -[AWDProactiveAppPredictionSubscores mergeFrom:](subscores, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_22;
    -[AWDProactiveActionData setSubscores:](self, "setSubscores:");
  }
  v5 = v9;
LABEL_22:
  if (*((_QWORD *)v5 + 6))
  {
    -[AWDProactiveActionData setHeuristicName:](self, "setHeuristicName:");
    v5 = v9;
  }
  if (*((_QWORD *)v5 + 5))
  {
    -[AWDProactiveActionData setEngaged:](self, "setEngaged:");
    v5 = v9;
  }
  if (*((_QWORD *)v5 + 7))
  {
    -[AWDProactiveActionData setSessionId:](self, "setSessionId:");
    v5 = v9;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)actionKey
{
  return self->_actionKey;
}

- (void)setActionKey:(id)a3
{
  objc_storeStrong((id *)&self->_actionKey, a3);
}

- (int)cacheRank
{
  return self->_cacheRank;
}

- (BOOL)engagedAction
{
  return self->_engagedAction;
}

- (BOOL)futureMedia
{
  return self->_futureMedia;
}

- (double)score
{
  return self->_score;
}

- (BOOL)shown
{
  return self->_shown;
}

- (AWDProactiveAppPredictionSubscores)subscores
{
  return self->_subscores;
}

- (void)setSubscores:(id)a3
{
  objc_storeStrong((id *)&self->_subscores, a3);
}

- (NSString)heuristicName
{
  return self->_heuristicName;
}

- (void)setHeuristicName:(id)a3
{
  objc_storeStrong((id *)&self->_heuristicName, a3);
}

- (NSString)engaged
{
  return self->_engaged;
}

- (void)setEngaged:(id)a3
{
  objc_storeStrong((id *)&self->_engaged, a3);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscores, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_heuristicName, 0);
  objc_storeStrong((id *)&self->_engaged, 0);
  objc_storeStrong((id *)&self->_actionKey, 0);
}

@end
