@implementation BLTPBIntelligentSummaryBulletinRequest

- (BOOL)hasBulletin
{
  return self->_bulletin != 0;
}

- (void)setDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setUpdateType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_updateType = a3;
}

- (void)setHasUpdateType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpdateType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)BLTPBIntelligentSummaryBulletinRequest;
  -[BLTPBIntelligentSummaryBulletinRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBIntelligentSummaryBulletinRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  BLTPBBulletin *bulletin;
  void *v5;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  bulletin = self->_bulletin;
  if (bulletin)
  {
    -[BLTPBBulletin dictionaryRepresentation](bulletin, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bulletin"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_date);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("date"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_updateType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("updateType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBIntelligentSummaryBulletinRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_bulletin)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_bulletin)
  {
    v6 = v4;
    objc_msgSend(v4, "setBulletin:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_date;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_updateType;
    *((_BYTE *)v4 + 28) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[BLTPBBulletin copyWithZone:](self->_bulletin, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_BYTE *)(v5 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_updateType;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BLTPBBulletin *bulletin;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  bulletin = self->_bulletin;
  if ((unint64_t)bulletin | *((_QWORD *)v4 + 2))
  {
    if (!-[BLTPBBulletin isEqual:](bulletin, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_updateType != *((_DWORD *)v4 + 6))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  double date;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;

  v3 = -[BLTPBBulletin hash](self->_bulletin, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    date = self->_date;
    v7 = -date;
    if (date >= 0.0)
      v7 = self->_date;
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
  if ((has & 2) != 0)
    v10 = 2654435761 * self->_updateType;
  else
    v10 = 0;
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BLTPBBulletin *bulletin;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  bulletin = self->_bulletin;
  v6 = *((_QWORD *)v4 + 2);
  if (bulletin)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[BLTPBBulletin mergeFrom:](bulletin, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[BLTPBIntelligentSummaryBulletinRequest setBulletin:](self, "setBulletin:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 28);
  if ((v7 & 1) != 0)
  {
    self->_date = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 28);
  }
  if ((v7 & 2) != 0)
  {
    self->_updateType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (BLTPBBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
  objc_storeStrong((id *)&self->_bulletin, a3);
}

- (double)date
{
  return self->_date;
}

- (unsigned)updateType
{
  return self->_updateType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletin, 0);
}

@end
