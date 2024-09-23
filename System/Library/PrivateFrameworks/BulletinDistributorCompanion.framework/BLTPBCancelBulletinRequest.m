@implementation BLTPBCancelBulletinRequest

- (BOOL)hasUniversalSectionID
{
  return self->_universalSectionID != 0;
}

- (BOOL)hasPublisherMatchID
{
  return self->_publisherMatchID != 0;
}

- (void)setFeed:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_feed = a3;
}

- (void)setHasFeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeed
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BLTPBCancelBulletinRequest;
  -[BLTPBCancelBulletinRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBCancelBulletinRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *universalSectionID;
  NSString *publisherMatchID;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  universalSectionID = self->_universalSectionID;
  if (universalSectionID)
    objc_msgSend(v3, "setObject:forKey:", universalSectionID, CFSTR("universalSectionID"));
  publisherMatchID = self->_publisherMatchID;
  if (publisherMatchID)
    objc_msgSend(v4, "setObject:forKey:", publisherMatchID, CFSTR("publisherMatchID"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_feed);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("feed"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_date);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("date"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBCancelBulletinRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_universalSectionID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_publisherMatchID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_universalSectionID)
  {
    objc_msgSend(v4, "setUniversalSectionID:");
    v4 = v6;
  }
  if (self->_publisherMatchID)
  {
    objc_msgSend(v6, "setPublisherMatchID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_feed;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_date;
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_universalSectionID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_publisherMatchID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_feed;
    *(_BYTE *)(v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *universalSectionID;
  NSString *publisherMatchID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  universalSectionID = self->_universalSectionID;
  if ((unint64_t)universalSectionID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](universalSectionID, "isEqual:"))
      goto LABEL_15;
  }
  publisherMatchID = self->_publisherMatchID;
  if ((unint64_t)publisherMatchID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](publisherMatchID, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_feed != *((_DWORD *)v4 + 4))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  double date;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_universalSectionID, "hash");
  v4 = -[NSString hash](self->_publisherMatchID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_feed;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  date = self->_date;
  v7 = -date;
  if (date >= 0.0)
    v7 = self->_date;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[BLTPBCancelBulletinRequest setUniversalSectionID:](self, "setUniversalSectionID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BLTPBCancelBulletinRequest setPublisherMatchID:](self, "setPublisherMatchID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_feed = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_date = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (void)setUniversalSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_universalSectionID, a3);
}

- (NSString)publisherMatchID
{
  return self->_publisherMatchID;
}

- (void)setPublisherMatchID:(id)a3
{
  objc_storeStrong((id *)&self->_publisherMatchID, a3);
}

- (unsigned)feed
{
  return self->_feed;
}

- (double)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_publisherMatchID, 0);
}

@end
