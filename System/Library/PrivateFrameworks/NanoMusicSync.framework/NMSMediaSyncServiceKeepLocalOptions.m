@implementation NMSMediaSyncServiceKeepLocalOptions

- (void)setRequiresValidation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_requiresValidation = a3;
}

- (void)setHasRequiresValidation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRequiresValidation
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)downloadOffPowerPolicy
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_downloadOffPowerPolicy;
  else
    return 0;
}

- (void)setDownloadOffPowerPolicy:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_downloadOffPowerPolicy = a3;
}

- (void)setHasDownloadOffPowerPolicy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDownloadOffPowerPolicy
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)downloadOffPowerPolicyAsString:(int)a3
{
  if (a3 < 3)
    return off_24D6476F8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDownloadOffPowerPolicy:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Allowed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NotAllowed")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)downloadOnCellularPolicy
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_downloadOnCellularPolicy;
  else
    return 0;
}

- (void)setDownloadOnCellularPolicy:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_downloadOnCellularPolicy = a3;
}

- (void)setHasDownloadOnCellularPolicy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDownloadOnCellularPolicy
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)downloadOnCellularPolicyAsString:(int)a3
{
  if (a3 < 3)
    return off_24D6476F8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDownloadOnCellularPolicy:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Allowed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NotAllowed")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)qualityOfService
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_qualityOfService;
  else
    return 4;
}

- (void)setQualityOfService:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_qualityOfService = a3;
}

- (void)setHasQualityOfService:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasQualityOfService
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)qualityOfServiceAsString:(int)a3
{
  if (a3 < 5)
    return off_24D647710[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsQualityOfService:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserInteractive")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserInitiated")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Utility")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Background")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Default")))
  {
    v4 = 0;
  }
  else
  {
    v4 = 4;
  }

  return v4;
}

- (void)setTimeout:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeout = a3;
}

- (void)setHasTimeout:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeout
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCellularBundleIdentifier
{
  return self->_cellularBundleIdentifier != 0;
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
  v8.super_class = (Class)NMSMediaSyncServiceKeepLocalOptions;
  -[NMSMediaSyncServiceKeepLocalOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaSyncServiceKeepLocalOptions dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *cellularBundleIdentifier;
  void *v8;
  uint64_t downloadOffPowerPolicy;
  __CFString *v10;
  uint64_t downloadOnCellularPolicy;
  __CFString *v12;
  uint64_t qualityOfService;
  __CFString *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_requiresValidation);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("requiresValidation"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  downloadOffPowerPolicy = self->_downloadOffPowerPolicy;
  if (downloadOffPowerPolicy >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_downloadOffPowerPolicy);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_24D6476F8[downloadOffPowerPolicy];
  }
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("downloadOffPowerPolicy"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_15:
  downloadOnCellularPolicy = self->_downloadOnCellularPolicy;
  if (downloadOnCellularPolicy >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_downloadOnCellularPolicy);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_24D6476F8[downloadOnCellularPolicy];
  }
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("downloadOnCellularPolicy"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_19:
  qualityOfService = self->_qualityOfService;
  if (qualityOfService >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_qualityOfService);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_24D647710[qualityOfService];
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("qualityOfService"));

  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_6:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeout"));

LABEL_7:
  cellularBundleIdentifier = self->_cellularBundleIdentifier;
  if (cellularBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", cellularBundleIdentifier, CFSTR("cellularBundleIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NMSMediaSyncServiceKeepLocalOptionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_7:
  if (self->_cellularBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[36] = self->_requiresValidation;
    v4[40] |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_downloadOffPowerPolicy;
  v4[40] |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v4 + 7) = self->_downloadOnCellularPolicy;
  v4[40] |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v4 + 8) = self->_qualityOfService;
  v4[40] |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timeout;
    v4[40] |= 1u;
  }
LABEL_7:
  if (self->_cellularBundleIdentifier)
  {
    v6 = v4;
    objc_msgSend(v4, "setCellularBundleIdentifier:");
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
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 36) = self->_requiresValidation;
    *(_BYTE *)(v5 + 40) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_downloadOffPowerPolicy;
  *(_BYTE *)(v5 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    *(_DWORD *)(v5 + 32) = self->_qualityOfService;
    *(_BYTE *)(v5 + 40) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 28) = self->_downloadOnCellularPolicy;
  *(_BYTE *)(v5 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    *(double *)(v5 + 8) = self->_timeout;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
LABEL_7:
  v8 = -[NSString copyWithZone:](self->_cellularBundleIdentifier, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *cellularBundleIdentifier;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
    {
      if (self->_requiresValidation)
      {
        if (!*((_BYTE *)v4 + 36))
          goto LABEL_32;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_10;
    }
LABEL_32:
    v6 = 0;
    goto LABEL_33;
  }
  if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
    goto LABEL_32;
LABEL_10:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_downloadOffPowerPolicy != *((_DWORD *)v4 + 6))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_downloadOnCellularPolicy != *((_DWORD *)v4 + 7))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_qualityOfService != *((_DWORD *)v4 + 8))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_timeout != *((double *)v4 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_32;
  }
  cellularBundleIdentifier = self->_cellularBundleIdentifier;
  if ((unint64_t)cellularBundleIdentifier | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](cellularBundleIdentifier, "isEqual:");
  else
    v6 = 1;
LABEL_33:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double timeout;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v3 = 2654435761 * self->_requiresValidation;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_downloadOffPowerPolicy;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_downloadOnCellularPolicy;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_13:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_14:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ -[NSString hash](self->_cellularBundleIdentifier, "hash");
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_5:
  v6 = 2654435761 * self->_qualityOfService;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_14;
LABEL_6:
  timeout = self->_timeout;
  v8 = -timeout;
  if (timeout >= 0.0)
    v8 = self->_timeout;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ -[NSString hash](self->_cellularBundleIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x10) != 0)
  {
    self->_requiresValidation = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_downloadOffPowerPolicy = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_downloadOnCellularPolicy = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  self->_qualityOfService = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_6:
    self->_timeout = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 2))
  {
    v6 = v4;
    -[NMSMediaSyncServiceKeepLocalOptions setCellularBundleIdentifier:](self, "setCellularBundleIdentifier:");
    v4 = v6;
  }

}

- (BOOL)requiresValidation
{
  return self->_requiresValidation;
}

- (double)timeout
{
  return self->_timeout;
}

- (NSString)cellularBundleIdentifier
{
  return self->_cellularBundleIdentifier;
}

- (void)setCellularBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cellularBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularBundleIdentifier, 0);
}

@end
