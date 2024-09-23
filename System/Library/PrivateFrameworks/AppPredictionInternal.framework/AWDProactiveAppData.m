@implementation AWDProactiveAppData

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

- (void)setEngagedApp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_engagedApp = a3;
}

- (void)setHasEngagedApp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEngagedApp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (BOOL)hasSubscores
{
  return self->_subscores != 0;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
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
  v8.super_class = (Class)AWDProactiveAppData;
  -[AWDProactiveAppData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveAppData dictionaryRepresentation](self, "dictionaryRepresentation");
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
  AWDProactiveAppPredictionSubscores *subscores;
  void *v7;
  NSString *sessionId;
  NSString *bundleId;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_engagedApp);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("engagedApp"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("score"));

  }
LABEL_5:
  subscores = self->_subscores;
  if (subscores)
  {
    -[AWDProactiveAppPredictionSubscores dictionaryRepresentation](subscores, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("subscores"));

  }
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("sessionId"));
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveAppDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:
  if (self->_subscores)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sessionId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_bundleId)
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
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((_BYTE *)v4 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 48) = self->_engagedApp;
  *((_BYTE *)v4 + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v4[1] = *(_QWORD *)&self->_score;
    *((_BYTE *)v4 + 52) |= 1u;
  }
LABEL_5:
  v6 = v4;
  if (self->_subscores)
  {
    objc_msgSend(v4, "setSubscores:");
    v4 = v6;
  }
  if (self->_sessionId)
  {
    objc_msgSend(v6, "setSessionId:");
    v4 = v6;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v6, "setBundleId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 48) = self->_engagedApp;
    *(_BYTE *)(v5 + 52) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_QWORD *)(v5 + 16) = self->_timestamp;
  *(_BYTE *)(v5 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_score;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
LABEL_5:
  v8 = -[AWDProactiveAppPredictionSubscores copyWithZone:](self->_subscores, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  v10 = -[NSString copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v11 = (void *)v6[4];
  v6[4] = v10;

  v12 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v13 = (void *)v6[3];
  v6[3] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  AWDProactiveAppPredictionSubscores *subscores;
  NSString *sessionId;
  NSString *bundleId;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) != 0)
    {
      if (self->_engagedApp)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_26;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_15;
    }
LABEL_26:
    v8 = 0;
    goto LABEL_27;
  }
  if ((*((_BYTE *)v4 + 52) & 4) != 0)
    goto LABEL_26;
LABEL_15:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_score != *((double *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_26;
  }
  subscores = self->_subscores;
  if ((unint64_t)subscores | *((_QWORD *)v4 + 5)
    && !-[AWDProactiveAppPredictionSubscores isEqual:](subscores, "isEqual:"))
  {
    goto LABEL_26;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionId, "isEqual:"))
      goto LABEL_26;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](bundleId, "isEqual:");
  else
    v8 = 1;
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  double score;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  NSUInteger v11;

  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v9 = 0;
    goto LABEL_13;
  }
  v3 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_3:
  v4 = 2654435761 * self->_engagedApp;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  score = self->_score;
  v6 = -score;
  if (score >= 0.0)
    v6 = self->_score;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_13:
  v10 = v4 ^ v3 ^ v9 ^ -[AWDProactiveAppPredictionSubscores hash](self->_subscores, "hash");
  v11 = -[NSString hash](self->_sessionId, "hash");
  return v10 ^ v11 ^ -[NSString hash](self->_bundleId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  AWDProactiveAppPredictionSubscores *subscores;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 52);
  if ((v6 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 52);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_engagedApp = *((_BYTE *)v4 + 48);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
LABEL_4:
    self->_score = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  subscores = self->_subscores;
  v8 = v5[5];
  v9 = v5;
  if (subscores)
  {
    if (!v8)
      goto LABEL_14;
    -[AWDProactiveAppPredictionSubscores mergeFrom:](subscores, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    -[AWDProactiveAppData setSubscores:](self, "setSubscores:");
  }
  v5 = v9;
LABEL_14:
  if (v5[4])
  {
    -[AWDProactiveAppData setSessionId:](self, "setSessionId:");
    v5 = v9;
  }
  if (v5[3])
  {
    -[AWDProactiveAppData setBundleId:](self, "setBundleId:");
    v5 = v9;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)engagedApp
{
  return self->_engagedApp;
}

- (double)score
{
  return self->_score;
}

- (AWDProactiveAppPredictionSubscores)subscores
{
  return self->_subscores;
}

- (void)setSubscores:(id)a3
{
  objc_storeStrong((id *)&self->_subscores, a3);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscores, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
