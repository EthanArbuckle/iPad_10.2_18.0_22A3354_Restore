@implementation ADSponsoredSearchRequest

+ (id)options
{
  if (options_once_10 != -1)
    dispatch_once(&options_once_10, &__block_literal_global_17);
  return (id)options_sOptions_10;
}

void __35__ADSponsoredSearchRequest_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions_10;
  options_sOptions_10 = (uint64_t)&unk_1E82BED18;

}

- (BOOL)hasProperties
{
  return self->_properties != 0;
}

- (void)setIsTest:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isTest = a3;
}

- (void)setHasIsTest:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsTest
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsBaseline:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isBaseline = a3;
}

- (void)setHasIsBaseline:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsBaseline
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setEnableImagesForDupes:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_enableImagesForDupes = a3;
}

- (void)setHasEnableImagesForDupes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnableImagesForDupes
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupportedODMLVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_supportedODMLVersion = a3;
}

- (void)setHasSupportedODMLVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportedODMLVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasExperimentID
{
  return self->_experimentID != 0;
}

- (BOOL)hasTreatmentID
{
  return self->_treatmentID != 0;
}

- (BOOL)hasDeploymentID
{
  return self->_deploymentID != 0;
}

- (void)setInAllocation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_inAllocation = a3;
}

- (void)setHasInAllocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInAllocation
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setClientExclusive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_clientExclusive = a3;
}

- (void)setHasClientExclusive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasClientExclusive
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ADSponsoredSearchRequest;
  -[ADSponsoredSearchRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADSponsoredSearchRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ADUserTargetingProperties *properties;
  void *v5;
  char has;
  void *v7;
  NSString *experimentID;
  NSString *treatmentID;
  NSString *deploymentID;
  char v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  properties = self->_properties;
  if (properties)
  {
    -[ADUserTargetingProperties dictionaryRepresentation](properties, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("properties"));

  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isTest);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("isTest"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBaseline);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("isBaseline"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableImagesForDupes);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("enableImagesForDupes"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_supportedODMLVersion);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("supportedODMLVersion"));

  }
LABEL_8:
  experimentID = self->_experimentID;
  if (experimentID)
    objc_msgSend(v3, "setObject:forKey:", experimentID, CFSTR("experimentID"));
  treatmentID = self->_treatmentID;
  if (treatmentID)
    objc_msgSend(v3, "setObject:forKey:", treatmentID, CFSTR("treatmentID"));
  deploymentID = self->_deploymentID;
  if (deploymentID)
    objc_msgSend(v3, "setObject:forKey:", deploymentID, CFSTR("deploymentID"));
  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inAllocation);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("inAllocation"));

    v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_clientExclusive);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("clientExclusive"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ADSponsoredSearchRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_properties)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_8:
  if (self->_experimentID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_treatmentID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_deploymentID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  if (self->_properties)
  {
    objc_msgSend(v4, "setProperties:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 52) = self->_isTest;
    *((_BYTE *)v4 + 56) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 51) = self->_isBaseline;
  *((_BYTE *)v4 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  *((_BYTE *)v4 + 49) = self->_enableImagesForDupes;
  *((_BYTE *)v4 + 56) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 8) = self->_supportedODMLVersion;
    *((_BYTE *)v4 + 56) |= 1u;
  }
LABEL_8:
  if (self->_experimentID)
  {
    objc_msgSend(v7, "setExperimentID:");
    v4 = v7;
  }
  if (self->_treatmentID)
  {
    objc_msgSend(v7, "setTreatmentID:");
    v4 = v7;
  }
  if (self->_deploymentID)
  {
    objc_msgSend(v7, "setDeploymentID:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_BYTE *)v4 + 50) = self->_inAllocation;
    *((_BYTE *)v4 + 56) |= 8u;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_clientExclusive;
    *((_BYTE *)v4 + 56) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ADUserTargetingProperties copyWithZone:](self->_properties, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 52) = self->_isTest;
    *(_BYTE *)(v5 + 56) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 51) = self->_isBaseline;
  *(_BYTE *)(v5 + 56) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  *(_BYTE *)(v5 + 49) = self->_enableImagesForDupes;
  *(_BYTE *)(v5 + 56) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 32) = self->_supportedODMLVersion;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
LABEL_6:
  v9 = -[NSString copyWithZone:](self->_experimentID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_treatmentID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[NSString copyWithZone:](self->_deploymentID, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v13;

  v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    *(_BYTE *)(v5 + 50) = self->_inAllocation;
    *(_BYTE *)(v5 + 56) |= 8u;
    v15 = (char)self->_has;
  }
  if ((v15 & 2) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_clientExclusive;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ADUserTargetingProperties *properties;
  NSString *experimentID;
  NSString *treatmentID;
  NSString *deploymentID;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  properties = self->_properties;
  if ((unint64_t)properties | *((_QWORD *)v4 + 3))
  {
    if (!-[ADUserTargetingProperties isEqual:](properties, "isEqual:"))
      goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0)
      goto LABEL_49;
    if (self->_isTest)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0)
      goto LABEL_49;
    if (self->_isBaseline)
    {
      if (!*((_BYTE *)v4 + 51))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 51))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0)
      goto LABEL_49;
    if (self->_enableImagesForDupes)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_supportedODMLVersion != *((_DWORD *)v4 + 8))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_49;
  }
  experimentID = self->_experimentID;
  if ((unint64_t)experimentID | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](experimentID, "isEqual:"))
  {
    goto LABEL_49;
  }
  treatmentID = self->_treatmentID;
  if ((unint64_t)treatmentID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](treatmentID, "isEqual:"))
      goto LABEL_49;
  }
  deploymentID = self->_deploymentID;
  if ((unint64_t)deploymentID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](deploymentID, "isEqual:"))
      goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0)
      goto LABEL_49;
    if (self->_inAllocation)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_49;
  }
  v9 = (*((_BYTE *)v4 + 56) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) != 0)
    {
      if (self->_clientExclusive)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_49;
      }
      else if (*((_BYTE *)v4 + 48))
      {
        goto LABEL_49;
      }
      v9 = 1;
      goto LABEL_50;
    }
LABEL_49:
    v9 = 0;
  }
LABEL_50:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[ADUserTargetingProperties hash](self->_properties, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v4 = 2654435761 * self->_isTest;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_isBaseline;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_enableImagesForDupes;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_supportedODMLVersion;
    goto LABEL_10;
  }
LABEL_9:
  v7 = 0;
LABEL_10:
  v8 = -[NSString hash](self->_experimentID, "hash");
  v9 = -[NSString hash](self->_treatmentID, "hash");
  v10 = -[NSString hash](self->_deploymentID, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v11 = 2654435761 * self->_inAllocation;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_12;
LABEL_14:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_14;
LABEL_12:
  v12 = 2654435761 * self->_clientExclusive;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ADUserTargetingProperties *properties;
  uint64_t v6;
  char v7;
  char v8;
  id v9;

  v4 = a3;
  properties = self->_properties;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (properties)
  {
    if (!v6)
      goto LABEL_7;
    -[ADUserTargetingProperties mergeFrom:](properties, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[ADSponsoredSearchRequest setProperties:](self, "setProperties:");
  }
  v4 = v9;
LABEL_7:
  v7 = *((_BYTE *)v4 + 56);
  if ((v7 & 0x20) != 0)
  {
    self->_isTest = *((_BYTE *)v4 + 52);
    *(_BYTE *)&self->_has |= 0x20u;
    v7 = *((_BYTE *)v4 + 56);
    if ((v7 & 0x10) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0)
        goto LABEL_10;
      goto LABEL_25;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) == 0)
  {
    goto LABEL_9;
  }
  self->_isBaseline = *((_BYTE *)v4 + 51);
  *(_BYTE *)&self->_has |= 0x10u;
  v7 = *((_BYTE *)v4 + 56);
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_25:
  self->_enableImagesForDupes = *((_BYTE *)v4 + 49);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_11:
    self->_supportedODMLVersion = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 2))
  {
    -[ADSponsoredSearchRequest setExperimentID:](self, "setExperimentID:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ADSponsoredSearchRequest setTreatmentID:](self, "setTreatmentID:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ADSponsoredSearchRequest setDeploymentID:](self, "setDeploymentID:");
    v4 = v9;
  }
  v8 = *((_BYTE *)v4 + 56);
  if ((v8 & 8) != 0)
  {
    self->_inAllocation = *((_BYTE *)v4 + 50);
    *(_BYTE *)&self->_has |= 8u;
    v8 = *((_BYTE *)v4 + 56);
  }
  if ((v8 & 2) != 0)
  {
    self->_clientExclusive = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (ADUserTargetingProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (BOOL)isBaseline
{
  return self->_isBaseline;
}

- (BOOL)enableImagesForDupes
{
  return self->_enableImagesForDupes;
}

- (int)supportedODMLVersion
{
  return self->_supportedODMLVersion;
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (void)setExperimentID:(id)a3
{
  objc_storeStrong((id *)&self->_experimentID, a3);
}

- (NSString)treatmentID
{
  return self->_treatmentID;
}

- (void)setTreatmentID:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentID, a3);
}

- (NSString)deploymentID
{
  return self->_deploymentID;
}

- (void)setDeploymentID:(id)a3
{
  objc_storeStrong((id *)&self->_deploymentID, a3);
}

- (BOOL)inAllocation
{
  return self->_inAllocation;
}

- (BOOL)clientExclusive
{
  return self->_clientExclusive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_deploymentID, 0);
}

@end
