@implementation NSSAboutInfoRespMsg

- (void)setAvailableStorageInBytes:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_availableStorageInBytes = a3;
}

- (void)setHasAvailableStorageInBytes:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvailableStorageInBytes
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNumberOfApps:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numberOfApps = a3;
}

- (void)setHasNumberOfApps:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfApps
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumberOfSongs:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numberOfSongs = a3;
}

- (void)setHasNumberOfSongs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumberOfSongs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setNumberOfPhotos:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numberOfPhotos = a3;
}

- (void)setHasNumberOfPhotos:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfPhotos
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBatteryCurrentCapacity:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_batteryCurrentCapacity = a3;
}

- (void)setHasBatteryCurrentCapacity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBatteryCurrentCapacity
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBatteryIsCharging:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_batteryIsCharging = a3;
}

- (void)setHasBatteryIsCharging:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasBatteryIsCharging
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setPurgeableSpace:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_purgeableSpace = a3;
}

- (void)setHasPurgeableSpace:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPurgeableSpace
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setUserDeletableSpace:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_userDeletableSpace = a3;
}

- (void)setHasUserDeletableSpace:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUserDeletableSpace
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
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
  v8.super_class = (Class)NSSAboutInfoRespMsg;
  -[NSSAboutInfoRespMsg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSAboutInfoRespMsg dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_availableStorageInBytes);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("availableStorageInBytes"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfApps);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("numberOfApps"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfSongs);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("numberOfSongs"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_numberOfPhotos);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("numberOfPhotos"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_batteryCurrentCapacity);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("batteryCurrentCapacity"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_purgeableSpace);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("purgeableSpace"));

    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_batteryIsCharging);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("batteryIsCharging"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x40) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_userDeletableSpace);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("userDeletableSpace"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSAboutInfoRespMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
LABEL_17:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x40) != 0)
LABEL_9:
    PBDataWriterWriteUint64Field();
LABEL_10:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_availableStorageInBytes;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_numberOfApps;
  *((_BYTE *)v4 + 68) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v4[5] = self->_numberOfSongs;
  *((_BYTE *)v4 + 68) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v4[4] = self->_numberOfPhotos;
  *((_BYTE *)v4 + 68) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v4[2] = self->_batteryCurrentCapacity;
  *((_BYTE *)v4 + 68) |= 2u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
LABEL_17:
    v4[6] = self->_purgeableSpace;
    *((_BYTE *)v4 + 68) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  *((_BYTE *)v4 + 64) = self->_batteryIsCharging;
  *((_BYTE *)v4 + 68) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x40) != 0)
  {
LABEL_9:
    v4[7] = self->_userDeletableSpace;
    *((_BYTE *)v4 + 68) |= 0x40u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_availableStorageInBytes;
    *((_BYTE *)result + 68) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 3) = self->_numberOfApps;
  *((_BYTE *)result + 68) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 5) = self->_numberOfSongs;
  *((_BYTE *)result + 68) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 4) = self->_numberOfPhotos;
  *((_BYTE *)result + 68) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 2) = self->_batteryCurrentCapacity;
  *((_BYTE *)result + 68) |= 2u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_BYTE *)result + 64) = self->_batteryIsCharging;
  *((_BYTE *)result + 68) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_QWORD *)result + 6) = self->_purgeableSpace;
  *((_BYTE *)result + 68) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    return result;
LABEL_9:
  *((_QWORD *)result + 7) = self->_userDeletableSpace;
  *((_BYTE *)result + 68) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_availableStorageInBytes != *((_QWORD *)v4 + 1))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_numberOfApps != *((_QWORD *)v4 + 3))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0 || self->_numberOfSongs != *((_QWORD *)v4 + 5))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0 || self->_numberOfPhotos != *((_QWORD *)v4 + 4))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_batteryCurrentCapacity != *((_QWORD *)v4 + 2))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x80) == 0)
      goto LABEL_29;
LABEL_43:
    v5 = 0;
    goto LABEL_44;
  }
  if ((*((_BYTE *)v4 + 68) & 0x80) == 0)
    goto LABEL_43;
  if (self->_batteryIsCharging)
  {
    if (!*((_BYTE *)v4 + 64))
      goto LABEL_43;
  }
  else if (*((_BYTE *)v4 + 64))
  {
    goto LABEL_43;
  }
LABEL_29:
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x20) == 0 || self->_purgeableSpace != *((_QWORD *)v4 + 6))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_43;
  }
  v5 = (*((_BYTE *)v4 + 68) & 0x40) == 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x40) == 0 || self->_userDeletableSpace != *((_QWORD *)v4 + 7))
      goto LABEL_43;
    v5 = 1;
  }
LABEL_44:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_availableStorageInBytes;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761u * self->_numberOfApps;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_numberOfSongs;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761u * self->_numberOfPhotos;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    v6 = 2654435761u * self->_batteryCurrentCapacity;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_batteryIsCharging;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761u * self->_purgeableSpace;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761u * self->_userDeletableSpace;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_availableStorageInBytes = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 68);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numberOfApps = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_numberOfSongs = *((_QWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_numberOfPhotos = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_batteryCurrentCapacity = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
LABEL_17:
    self->_purgeableSpace = *((_QWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
    if ((*((_BYTE *)v4 + 68) & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  self->_batteryIsCharging = *((_BYTE *)v4 + 64);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 0x20) != 0)
    goto LABEL_17;
LABEL_8:
  if ((v5 & 0x40) != 0)
  {
LABEL_9:
    self->_userDeletableSpace = *((_QWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_10:

}

- (unint64_t)availableStorageInBytes
{
  return self->_availableStorageInBytes;
}

- (unint64_t)numberOfApps
{
  return self->_numberOfApps;
}

- (unint64_t)numberOfSongs
{
  return self->_numberOfSongs;
}

- (unint64_t)numberOfPhotos
{
  return self->_numberOfPhotos;
}

- (unint64_t)batteryCurrentCapacity
{
  return self->_batteryCurrentCapacity;
}

- (BOOL)batteryIsCharging
{
  return self->_batteryIsCharging;
}

- (unint64_t)purgeableSpace
{
  return self->_purgeableSpace;
}

- (unint64_t)userDeletableSpace
{
  return self->_userDeletableSpace;
}

@end
