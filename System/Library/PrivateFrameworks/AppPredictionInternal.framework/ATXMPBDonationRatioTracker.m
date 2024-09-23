@implementation ATXMPBDonationRatioTracker

- (int)actionType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_actionType;
  else
    return 0;
}

- (void)setActionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasActionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)actionTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("NSUA");
  if (a3 == 1)
  {
    v3 = CFSTR("Intent");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsActionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NSUA")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Intent"));

  return v4;
}

- (void)setRatio:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ratio = a3;
}

- (void)setHasRatio:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRatio
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
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
  v8.super_class = (Class)ATXMPBDonationRatioTracker;
  -[ATXMPBDonationRatioTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBDonationRatioTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int actionType;
  __CFString *v6;
  void *v7;
  NSString *abGroup;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    actionType = self->_actionType;
    if (actionType)
    {
      if (actionType == 1)
      {
        v6 = CFSTR("Intent");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_actionType);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = CFSTR("NSUA");
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("actionType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ratio);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("ratio"));

  }
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v3, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBDonationRatioTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = self->_actionType;
    *((_BYTE *)v4 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_ratio;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  if (self->_abGroup)
  {
    v6 = v4;
    objc_msgSend(v4, "setAbGroup:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_actionType;
    *(_BYTE *)(v5 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_ratio;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *abGroup;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_actionType != *((_DWORD *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_ratio != *((double *)v4 + 1))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_14;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](abGroup, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  double ratio;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_actionType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    return v8 ^ v3 ^ -[NSString hash](self->_abGroup, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  ratio = self->_ratio;
  v5 = -ratio;
  if (ratio >= 0.0)
    v5 = self->_ratio;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ -[NSString hash](self->_abGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_actionType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 28);
  }
  if ((v5 & 1) != 0)
  {
    self->_ratio = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[ATXMPBDonationRatioTracker setAbGroup:](self, "setAbGroup:");
    v4 = v6;
  }

}

- (double)ratio
{
  return self->_ratio;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
