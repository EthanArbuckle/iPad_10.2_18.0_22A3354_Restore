@implementation HDCodableOnboardingCompletion

- (id)decodedCompletionDate
{
  void *v3;

  if (-[HDCodableOnboardingCompletion hasCompletionDate](self, "hasCompletionDate"))
  {
    -[HDCodableOnboardingCompletion completionDate](self, "completionDate");
    HDDecodeDateForValue();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)decodedModificationDate
{
  void *v3;

  if (-[HDCodableOnboardingCompletion hasModificationDate](self, "hasModificationDate"))
  {
    -[HDCodableOnboardingCompletion modificationDate](self, "modificationDate");
    HDDecodeDateForValue();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)decodedUUID
{
  void *v3;
  void *v4;
  void *v5;

  if (-[HDCodableOnboardingCompletion hasUuid](self, "hasUuid"))
  {
    v3 = (void *)MEMORY[0x1E0CB3A28];
    -[HDCodableOnboardingCompletion uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_UUIDWithData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isValidWithError:(id *)a3
{
  void *v5;
  const __CFString *v7;

  -[HDCodableOnboardingCompletion decodedUUID](self, "decodedUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[HDCodableOnboardingCompletion hasModificationDate](self, "hasModificationDate"))
    {
      if (-[HDCodableOnboardingCompletion deleted](self, "deleted"))
        return 1;
      if (-[HDCodableOnboardingCompletion hasFeatureIdentifier](self, "hasFeatureIdentifier"))
      {
        if (-[HDCodableOnboardingCompletion hasVersion](self, "hasVersion")
          && -[HDCodableOnboardingCompletion hasCompletionDate](self, "hasCompletionDate"))
        {
          return 1;
        }
        v7 = CFSTR("Failed to decode onboarding completion due to missing version");
      }
      else
      {
        v7 = CFSTR("Failed to decode onboarding completion due to missing featureIdentifier");
      }
    }
    else
    {
      v7 = CFSTR("Failed to decode onboarding completion due to missing modification date");
    }
  }
  else
  {
    v7 = CFSTR("Failed to decode onboarding completion due to missing UUID");
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, v7);
  return 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasFeatureIdentifier
{
  return self->_featureIdentifier != 0;
}

- (void)setVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCompletionDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_completionDate = a3;
}

- (void)setHasCompletionDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompletionDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setModificationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModificationDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDeleted
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCountryCodeProvenance:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_countryCodeProvenance = a3;
}

- (void)setHasCountryCodeProvenance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCountryCodeProvenance
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
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
  v8.super_class = (Class)HDCodableOnboardingCompletion;
  -[HDCodableOnboardingCompletion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableOnboardingCompletion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *uuid;
  NSString *featureIdentifier;
  char has;
  void *v8;
  void *v9;
  NSString *countryCode;
  char v11;
  void *v12;
  HDCodableSyncIdentity *syncIdentity;
  void *v14;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier)
    objc_msgSend(v4, "setObject:forKey:", featureIdentifier, CFSTR("featureIdentifier"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("version"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_completionDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("completionDate"));

  }
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v4, "setObject:forKey:", countryCode, CFSTR("countryCode"));
  v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modificationDate);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("modificationDate"));

    v11 = (char)self->_has;
    if ((v11 & 0x10) == 0)
    {
LABEL_13:
      if ((v11 & 2) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deleted);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("deleted"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_countryCodeProvenance);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("countryCodeProvenance"));

  }
LABEL_15:
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[HDCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableOnboardingCompletionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if (self->_featureIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_13:
      if ((v6 & 2) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
LABEL_15:
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v7;
  }
  if (self->_featureIdentifier)
  {
    objc_msgSend(v7, "setFeatureIdentifier:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_version;
    *((_BYTE *)v4 + 76) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_completionDate;
    *((_BYTE *)v4 + 76) |= 1u;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v7, "setCountryCode:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_modificationDate;
    *((_BYTE *)v4 + 76) |= 4u;
    v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_13:
      if ((v6 & 2) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_13;
  }
  *((_BYTE *)v4 + 72) = self->_deleted;
  *((_BYTE *)v4 + 76) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_14:
    *((_QWORD *)v4 + 2) = self->_countryCodeProvenance;
    *((_BYTE *)v4 + 76) |= 2u;
  }
LABEL_15:
  if (self->_syncIdentity)
  {
    objc_msgSend(v7, "setSyncIdentity:");
    v4 = v7;
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
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_featureIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_version;
    *(_BYTE *)(v5 + 76) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_completionDate;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = (char)self->_has;
  if ((v13 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
LABEL_11:
    *(_BYTE *)(v5 + 72) = self->_deleted;
    *(_BYTE *)(v5 + 76) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(double *)(v5 + 24) = self->_modificationDate;
  *(_BYTE *)(v5 + 76) |= 4u;
  v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v13 & 2) != 0)
  {
LABEL_8:
    *(_QWORD *)(v5 + 16) = self->_countryCodeProvenance;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
LABEL_9:
  v14 = -[HDCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *uuid;
  NSString *featureIdentifier;
  char has;
  char v8;
  NSString *countryCode;
  HDCodableSyncIdentity *syncIdentity;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_39;
  }
  featureIdentifier = self->_featureIdentifier;
  if ((unint64_t)featureIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](featureIdentifier, "isEqual:"))
      goto LABEL_39;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 76);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0 || self->_version != *((_QWORD *)v4 + 4))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_completionDate != *((double *)v4 + 1))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_39;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_39;
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 76);
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_modificationDate != *((double *)v4 + 3))
      goto LABEL_39;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) != 0)
    {
      if (self->_deleted)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_39;
        goto LABEL_32;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_32;
    }
LABEL_39:
    v11 = 0;
    goto LABEL_40;
  }
  if ((v8 & 0x10) != 0)
    goto LABEL_39;
LABEL_32:
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_countryCodeProvenance != *((_QWORD *)v4 + 2))
      goto LABEL_39;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_39;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 7))
    v11 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v11 = 1;
LABEL_40:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  double completionDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  NSUInteger v11;
  char has;
  unint64_t v13;
  double modificationDate;
  double v15;
  long double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;

  v3 = -[NSData hash](self->_uuid, "hash");
  v4 = -[NSString hash](self->_featureIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v5 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  completionDate = self->_completionDate;
  v7 = -completionDate;
  if (completionDate >= 0.0)
    v7 = self->_completionDate;
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
LABEL_11:
  v11 = -[NSString hash](self->_countryCode, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    modificationDate = self->_modificationDate;
    v15 = -modificationDate;
    if (modificationDate >= 0.0)
      v15 = self->_modificationDate;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((has & 0x10) != 0)
  {
    v18 = 2654435761 * self->_deleted;
    if ((has & 2) != 0)
      goto LABEL_21;
LABEL_23:
    v19 = 0;
    return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v13 ^ v18 ^ v19 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
  }
  v18 = 0;
  if ((has & 2) == 0)
    goto LABEL_23;
LABEL_21:
  v19 = 2654435761 * self->_countryCodeProvenance;
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v13 ^ v18 ^ v19 ^ -[HDCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  HDCodableSyncIdentity *syncIdentity;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[HDCodableOnboardingCompletion setUuid:](self, "setUuid:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableOnboardingCompletion setFeatureIdentifier:](self, "setFeatureIdentifier:");
    v4 = v9;
  }
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 8) != 0)
  {
    self->_version = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 76);
  }
  if ((v5 & 1) != 0)
  {
    self->_completionDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableOnboardingCompletion setCountryCode:](self, "setCountryCode:");
    v4 = v9;
  }
  v6 = *((_BYTE *)v4 + 76);
  if ((v6 & 4) != 0)
  {
    self->_modificationDate = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 76);
    if ((v6 & 0x10) == 0)
    {
LABEL_13:
      if ((v6 & 2) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 0x10) == 0)
  {
    goto LABEL_13;
  }
  self->_deleted = *((_BYTE *)v4 + 72);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
LABEL_14:
    self->_countryCodeProvenance = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_15:
  syncIdentity = self->_syncIdentity;
  v8 = *((_QWORD *)v4 + 7);
  if (syncIdentity)
  {
    if (v8)
    {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_23:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[HDCodableOnboardingCompletion setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_23;
  }

}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_featureIdentifier, a3);
}

- (int64_t)version
{
  return self->_version;
}

- (double)completionDate
{
  return self->_completionDate;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (int64_t)countryCodeProvenance
{
  return self->_countryCodeProvenance;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
