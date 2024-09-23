@implementation HMAccessoryDiagnosticInfoProtoDiagnosticInfo

- (void)setVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAppleMediaAccessoryDiagnosticInfo
{
  return self->_appleMediaAccessoryDiagnosticInfo != 0;
}

- (BOOL)hasPrimaryResidentDiagnosticInfo
{
  return self->_primaryResidentDiagnosticInfo != 0;
}

- (void)setHomeHubVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_homeHubVersion = a3;
}

- (void)setHasHomeHubVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHomeHubVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumHomes:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numHomes = a3;
}

- (void)setHasNumHomes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumHomes
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasLastSetupInfo
{
  return self->_lastSetupInfo != 0;
}

- (void)setGenerationTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_generationTime = a3;
}

- (void)setHasGenerationTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGenerationTime
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoDiagnosticInfo;
  -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *appleMediaAccessoryDiagnosticInfo;
  void *v6;
  HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *primaryResidentDiagnosticInfo;
  void *v8;
  char has;
  void *v10;
  void *v11;
  HMAccessoryDiagnosticInfoProtoSetupInfo *lastSetupInfo;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  appleMediaAccessoryDiagnosticInfo = self->_appleMediaAccessoryDiagnosticInfo;
  if (appleMediaAccessoryDiagnosticInfo)
  {
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo dictionaryRepresentation](appleMediaAccessoryDiagnosticInfo, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("appleMediaAccessoryDiagnosticInfo"));

  }
  primaryResidentDiagnosticInfo = self->_primaryResidentDiagnosticInfo;
  if (primaryResidentDiagnosticInfo)
  {
    -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo dictionaryRepresentation](primaryResidentDiagnosticInfo, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("primaryResidentDiagnosticInfo"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_homeHubVersion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("homeHubVersion"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numHomes);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("numHomes"));

  }
  lastSetupInfo = self->_lastSetupInfo;
  if (lastSetupInfo)
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo dictionaryRepresentation](lastSetupInfo, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("lastSetupInfo"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_generationTime);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("generationTime"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoDiagnosticInfoReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_appleMediaAccessoryDiagnosticInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_primaryResidentDiagnosticInfo)
  {
    PBDataWriterWriteSubmessage();
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
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_10:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_11:
  if (self->_lastSetupInfo)
  {
    PBDataWriterWriteSubmessage();
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
    v4[2] = self->_version;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  v6 = v4;
  if (self->_appleMediaAccessoryDiagnosticInfo)
  {
    objc_msgSend(v4, "setAppleMediaAccessoryDiagnosticInfo:");
    v4 = v6;
  }
  if (self->_primaryResidentDiagnosticInfo)
  {
    objc_msgSend(v6, "setPrimaryResidentDiagnosticInfo:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_homeHubVersion;
    *((_BYTE *)v4 + 64) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 12) = self->_numHomes;
  *((_BYTE *)v4 + 64) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_10:
    v4[1] = *(_QWORD *)&self->_generationTime;
    *((_BYTE *)v4 + 64) |= 1u;
  }
LABEL_11:
  if (self->_lastSetupInfo)
  {
    objc_msgSend(v6, "setLastSetupInfo:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char has;
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_version;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v7 = -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo copyWithZone:](self->_appleMediaAccessoryDiagnosticInfo, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo copyWithZone:](self->_primaryResidentDiagnosticInfo, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v9;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v6 + 48) = self->_numHomes;
    *(_BYTE *)(v6 + 64) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 32) = self->_homeHubVersion;
  *(_BYTE *)(v6 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    *(double *)(v6 + 8) = self->_generationTime;
    *(_BYTE *)(v6 + 64) |= 1u;
  }
LABEL_7:
  v12 = -[HMAccessoryDiagnosticInfoProtoSetupInfo copyWithZone:](self->_lastSetupInfo, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *appleMediaAccessoryDiagnosticInfo;
  HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *primaryResidentDiagnosticInfo;
  HMAccessoryDiagnosticInfoProtoSetupInfo *lastSetupInfo;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_version != *((_QWORD *)v4 + 2))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
LABEL_28:
    v8 = 0;
    goto LABEL_29;
  }
  appleMediaAccessoryDiagnosticInfo = self->_appleMediaAccessoryDiagnosticInfo;
  if ((unint64_t)appleMediaAccessoryDiagnosticInfo | *((_QWORD *)v4 + 3)
    && !-[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo isEqual:](appleMediaAccessoryDiagnosticInfo, "isEqual:"))
  {
    goto LABEL_28;
  }
  primaryResidentDiagnosticInfo = self->_primaryResidentDiagnosticInfo;
  if ((unint64_t)primaryResidentDiagnosticInfo | *((_QWORD *)v4 + 7))
  {
    if (!-[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo isEqual:](primaryResidentDiagnosticInfo, "isEqual:"))goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_homeHubVersion != *((_DWORD *)v4 + 8))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_numHomes != *((_DWORD *)v4 + 12))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_generationTime != *((double *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_28;
  }
  lastSetupInfo = self->_lastSetupInfo;
  if ((unint64_t)lastSetupInfo | *((_QWORD *)v4 + 5))
    v8 = -[HMAccessoryDiagnosticInfoProtoSetupInfo isEqual:](lastSetupInfo, "isEqual:");
  else
    v8 = 1;
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double generationTime;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_version;
  else
    v3 = 0;
  v4 = -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo hash](self->_appleMediaAccessoryDiagnosticInfo, "hash");
  v5 = -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo hash](self->_primaryResidentDiagnosticInfo, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12 ^ -[HMAccessoryDiagnosticInfoProtoSetupInfo hash](self->_lastSetupInfo, "hash");
  }
  v6 = 2654435761 * self->_homeHubVersion;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761 * self->_numHomes;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_7:
  generationTime = self->_generationTime;
  v9 = -generationTime;
  if (generationTime >= 0.0)
    v9 = self->_generationTime;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12 ^ -[HMAccessoryDiagnosticInfoProtoSetupInfo hash](self->_lastSetupInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo *appleMediaAccessoryDiagnosticInfo;
  uint64_t v7;
  HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo *primaryResidentDiagnosticInfo;
  uint64_t v9;
  char v10;
  HMAccessoryDiagnosticInfoProtoSetupInfo *lastSetupInfo;
  uint64_t v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if ((v4[8] & 2) != 0)
  {
    self->_version = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  appleMediaAccessoryDiagnosticInfo = self->_appleMediaAccessoryDiagnosticInfo;
  v7 = *((_QWORD *)v5 + 3);
  v13 = v5;
  if (appleMediaAccessoryDiagnosticInfo)
  {
    if (!v7)
      goto LABEL_9;
    -[HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo mergeFrom:](appleMediaAccessoryDiagnosticInfo, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo setAppleMediaAccessoryDiagnosticInfo:](self, "setAppleMediaAccessoryDiagnosticInfo:");
  }
  v5 = v13;
LABEL_9:
  primaryResidentDiagnosticInfo = self->_primaryResidentDiagnosticInfo;
  v9 = *((_QWORD *)v5 + 7);
  if (primaryResidentDiagnosticInfo)
  {
    if (!v9)
      goto LABEL_15;
    -[HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo mergeFrom:](primaryResidentDiagnosticInfo, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo setPrimaryResidentDiagnosticInfo:](self, "setPrimaryResidentDiagnosticInfo:");
  }
  v5 = v13;
LABEL_15:
  v10 = *((_BYTE *)v5 + 64);
  if ((v10 & 4) != 0)
  {
    self->_homeHubVersion = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 4u;
    v10 = *((_BYTE *)v5 + 64);
    if ((v10 & 8) == 0)
    {
LABEL_17:
      if ((v10 & 1) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v5 + 64) & 8) == 0)
  {
    goto LABEL_17;
  }
  self->_numHomes = *((_DWORD *)v5 + 12);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v5 + 64) & 1) != 0)
  {
LABEL_18:
    self->_generationTime = *((double *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_19:
  lastSetupInfo = self->_lastSetupInfo;
  v12 = *((_QWORD *)v5 + 5);
  if (lastSetupInfo)
  {
    if (v12)
    {
      -[HMAccessoryDiagnosticInfoProtoSetupInfo mergeFrom:](lastSetupInfo, "mergeFrom:");
LABEL_27:
      v5 = v13;
    }
  }
  else if (v12)
  {
    -[HMAccessoryDiagnosticInfoProtoDiagnosticInfo setLastSetupInfo:](self, "setLastSetupInfo:");
    goto LABEL_27;
  }

}

- (unint64_t)version
{
  return self->_version;
}

- (HMAccessoryDiagnosticInfoProtoAppleMediaAccessoryDiagnosticInfo)appleMediaAccessoryDiagnosticInfo
{
  return self->_appleMediaAccessoryDiagnosticInfo;
}

- (void)setAppleMediaAccessoryDiagnosticInfo:(id)a3
{
  objc_storeStrong((id *)&self->_appleMediaAccessoryDiagnosticInfo, a3);
}

- (HMAccessoryDiagnosticInfoProtoPrimaryResidentDiagnosticInfo)primaryResidentDiagnosticInfo
{
  return self->_primaryResidentDiagnosticInfo;
}

- (void)setPrimaryResidentDiagnosticInfo:(id)a3
{
  objc_storeStrong((id *)&self->_primaryResidentDiagnosticInfo, a3);
}

- (int)homeHubVersion
{
  return self->_homeHubVersion;
}

- (int)numHomes
{
  return self->_numHomes;
}

- (HMAccessoryDiagnosticInfoProtoSetupInfo)lastSetupInfo
{
  return self->_lastSetupInfo;
}

- (void)setLastSetupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lastSetupInfo, a3);
}

- (double)generationTime
{
  return self->_generationTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryResidentDiagnosticInfo, 0);
  objc_storeStrong((id *)&self->_lastSetupInfo, 0);
  objc_storeStrong((id *)&self->_appleMediaAccessoryDiagnosticInfo, 0);
}

@end
