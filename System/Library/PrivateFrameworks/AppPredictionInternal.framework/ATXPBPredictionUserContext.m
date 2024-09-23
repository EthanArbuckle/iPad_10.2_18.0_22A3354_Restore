@implementation ATXPBPredictionUserContext

- (NSString)secondMostRecentAppLaunch
{
  return self->_secondMostRecentAppLaunch;
}

- (double)lastUnlockDate
{
  return self->_lastUnlockDate;
}

- (NSString)lastAppLaunch
{
  return self->_lastAppLaunch;
}

- (double)lastAppLaunchDate
{
  return self->_lastAppLaunchDate;
}

- (NSString)lastAppActionLaunch
{
  return self->_lastAppActionLaunch;
}

- (BOOL)hasLastUnlockDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLastAppLaunchDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSecondMostRecentAppLaunch:(id)a3
{
  objc_storeStrong((id *)&self->_secondMostRecentAppLaunch, a3);
}

- (void)setLastUnlockDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastUnlockDate = a3;
}

- (void)setLastAppLaunchDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lastAppLaunchDate = a3;
}

- (void)setLastAppLaunch:(id)a3
{
  objc_storeStrong((id *)&self->_lastAppLaunch, a3);
}

- (void)setLastAppActionLaunch:(id)a3
{
  objc_storeStrong((id *)&self->_lastAppActionLaunch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondMostRecentAppLaunch, 0);
  objc_storeStrong((id *)&self->_lastAppLaunch, 0);
  objc_storeStrong((id *)&self->_lastAppActionLaunch, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_lastAppLaunch)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_secondMostRecentAppLaunch)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_lastAppActionLaunch)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)setHasLastUnlockDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastAppLaunch
{
  return self->_lastAppLaunch != 0;
}

- (void)setHasLastAppLaunchDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecondMostRecentAppLaunch
{
  return self->_secondMostRecentAppLaunch != 0;
}

- (BOOL)hasLastAppActionLaunch
{
  return self->_lastAppActionLaunch != 0;
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
  v8.super_class = (Class)ATXPBPredictionUserContext;
  -[ATXPBPredictionUserContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBPredictionUserContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *lastAppLaunch;
  void *v6;
  NSString *secondMostRecentAppLaunch;
  NSString *lastAppActionLaunch;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastUnlockDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("lastUnlockDate"));

  }
  lastAppLaunch = self->_lastAppLaunch;
  if (lastAppLaunch)
    objc_msgSend(v3, "setObject:forKey:", lastAppLaunch, CFSTR("lastAppLaunch"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastAppLaunchDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("lastAppLaunchDate"));

  }
  secondMostRecentAppLaunch = self->_secondMostRecentAppLaunch;
  if (secondMostRecentAppLaunch)
    objc_msgSend(v3, "setObject:forKey:", secondMostRecentAppLaunch, CFSTR("secondMostRecentAppLaunch"));
  lastAppActionLaunch = self->_lastAppActionLaunch;
  if (lastAppActionLaunch)
    objc_msgSend(v3, "setObject:forKey:", lastAppActionLaunch, CFSTR("lastAppActionLaunch"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionUserContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_lastUnlockDate;
    *((_BYTE *)v4 + 48) |= 2u;
  }
  v5 = v4;
  if (self->_lastAppLaunch)
  {
    objc_msgSend(v4, "setLastAppLaunch:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_lastAppLaunchDate;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_secondMostRecentAppLaunch)
  {
    objc_msgSend(v5, "setSecondMostRecentAppLaunch:");
    v4 = v5;
  }
  if (self->_lastAppActionLaunch)
  {
    objc_msgSend(v5, "setLastAppActionLaunch:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_lastUnlockDate;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_lastAppLaunch, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_lastAppLaunchDate;
    *(_BYTE *)(v6 + 48) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_secondMostRecentAppLaunch, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_lastAppActionLaunch, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *lastAppLaunch;
  NSString *secondMostRecentAppLaunch;
  NSString *lastAppActionLaunch;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_lastUnlockDate != *((double *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_19;
  }
  lastAppLaunch = self->_lastAppLaunch;
  if ((unint64_t)lastAppLaunch | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](lastAppLaunch, "isEqual:"))
    {
LABEL_19:
      v9 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_lastAppLaunchDate != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_19;
  }
  secondMostRecentAppLaunch = self->_secondMostRecentAppLaunch;
  if ((unint64_t)secondMostRecentAppLaunch | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](secondMostRecentAppLaunch, "isEqual:"))
  {
    goto LABEL_19;
  }
  lastAppActionLaunch = self->_lastAppActionLaunch;
  if ((unint64_t)lastAppActionLaunch | *((_QWORD *)v4 + 3))
    v9 = -[NSString isEqual:](lastAppActionLaunch, "isEqual:");
  else
    v9 = 1;
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  double lastUnlockDate;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  unint64_t v9;
  double lastAppLaunchDate;
  double v11;
  long double v12;
  double v13;
  NSUInteger v14;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    lastUnlockDate = self->_lastUnlockDate;
    v5 = -lastUnlockDate;
    if (lastUnlockDate >= 0.0)
      v5 = self->_lastUnlockDate;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_lastAppLaunch, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    lastAppLaunchDate = self->_lastAppLaunchDate;
    v11 = -lastAppLaunchDate;
    if (lastAppLaunchDate >= 0.0)
      v11 = self->_lastAppLaunchDate;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = v8 ^ v3 ^ v9 ^ -[NSString hash](self->_secondMostRecentAppLaunch, "hash");
  return v14 ^ -[NSString hash](self->_lastAppActionLaunch, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  if (((_BYTE)v4[6] & 2) != 0)
  {
    self->_lastUnlockDate = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXPBPredictionUserContext setLastAppLaunch:](self, "setLastAppLaunch:");
    v4 = v5;
  }
  if (((_BYTE)v4[6] & 1) != 0)
  {
    self->_lastAppLaunchDate = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXPBPredictionUserContext setSecondMostRecentAppLaunch:](self, "setSecondMostRecentAppLaunch:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXPBPredictionUserContext setLastAppActionLaunch:](self, "setLastAppActionLaunch:");
    v4 = v5;
  }

}

@end
