@implementation NTPBOptInButtonExposure

- (int)optInButtonType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_optInButtonType;
  else
    return 0;
}

- (void)setOptInButtonType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_optInButtonType = a3;
}

- (void)setHasOptInButtonType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOptInButtonType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)optInButtonLocation
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_optInButtonLocation;
  else
    return 0;
}

- (void)setOptInButtonLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_optInButtonLocation = a3;
}

- (void)setHasOptInButtonLocation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOptInButtonLocation
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasOptInButtonLocationId
{
  return self->_optInButtonLocationId != 0;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
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
  v8.super_class = (Class)NTPBOptInButtonExposure;
  -[NTPBOptInButtonExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBOptInButtonExposure dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *optInButtonLocationId;
  NSData *groupViewExposureId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_optInButtonType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("opt_in_button_type"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_optInButtonLocation);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("opt_in_button_location"));

  }
  optInButtonLocationId = self->_optInButtonLocationId;
  if (optInButtonLocationId)
    objc_msgSend(v3, "setObject:forKey:", optInButtonLocationId, CFSTR("opt_in_button_location_id"));
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBOptInButtonExposureReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_optInButtonLocationId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_groupViewExposureId)
  {
    PBDataWriterWriteDataField();
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
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_optInButtonType;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_optInButtonLocation;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_optInButtonLocationId, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v11 = (void *)v6[1];
  v6[1] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *optInButtonLocationId;
  NSData *groupViewExposureId;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_optInButtonType != *((_DWORD *)v4 + 8))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_optInButtonLocation != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_16;
  }
  optInButtonLocationId = self->_optInButtonLocationId;
  if ((unint64_t)optInButtonLocationId | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](optInButtonLocationId, "isEqual:"))
  {
    goto LABEL_16;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 1))
    v7 = -[NSData isEqual:](groupViewExposureId, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_optInButtonType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_optInButtonLocation;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_optInButtonLocationId, "hash");
  return v5 ^ -[NSData hash](self->_groupViewExposureId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_optInButtonType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 36);
  }
  if ((v5 & 1) != 0)
  {
    self->_optInButtonLocation = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBOptInButtonExposure setOptInButtonLocationId:](self, "setOptInButtonLocationId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBOptInButtonExposure setGroupViewExposureId:](self, "setGroupViewExposureId:");
    v4 = v6;
  }

}

- (NSString)optInButtonLocationId
{
  return self->_optInButtonLocationId;
}

- (void)setOptInButtonLocationId:(id)a3
{
  objc_storeStrong((id *)&self->_optInButtonLocationId, a3);
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewExposureId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optInButtonLocationId, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
}

@end
