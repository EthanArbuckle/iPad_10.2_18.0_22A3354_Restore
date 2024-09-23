@implementation NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext

- (BOOL)hasPhysicalCardImageURL
{
  return self->_physicalCardImageURL != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (int)ingestionState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_ingestionState;
  else
    return 100;
}

- (void)setIngestionState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_ingestionState = a3;
}

- (void)setHasIngestionState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIngestionState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)ingestionStateAsString:(int)a3
{
  __CFString *v3;

  if (a3 > 129)
  {
    switch(a3)
    {
      case 130:
        return CFSTR("ReaderModeIngestionStateTransferring");
      case 140:
        return CFSTR("ReaderModeIngestionStateCardAdded");
      case 150:
        return CFSTR("ReaderModeIngestionStateCommuteCardAdded");
    }
    goto LABEL_16;
  }
  if (a3 == 100)
    return CFSTR("ReaderModeIngestionStateDefault");
  if (a3 == 110)
    return CFSTR("ReaderModeIngestionStateCardNotFound");
  if (a3 != 120)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("ReaderModeIngestionStateTransferValue");
  return v3;
}

- (int)StringAsIngestionState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReaderModeIngestionStateDefault")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReaderModeIngestionStateCardNotFound")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReaderModeIngestionStateTransferValue")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReaderModeIngestionStateTransferring")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReaderModeIngestionStateCardAdded")) & 1) != 0)
  {
    v4 = 140;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ReaderModeIngestionStateCommuteCardAdded")))
  {
    v4 = 150;
  }
  else
  {
    v4 = 100;
  }

  return v4;
}

- (void)setIngestionProgress:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ingestionProgress = a3;
}

- (void)setHasIngestionProgress:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIngestionProgress
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext;
  -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *physicalCardImageURL;
  NSString *title;
  NSString *subtitle;
  char has;
  int ingestionState;
  __CFString *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  physicalCardImageURL = self->_physicalCardImageURL;
  if (physicalCardImageURL)
    objc_msgSend(v3, "setObject:forKey:", physicalCardImageURL, CFSTR("physicalCardImageURL"));
  title = self->_title;
  if (title)
    objc_msgSend(v5, "setObject:forKey:", title, CFSTR("title"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v5, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    ingestionState = self->_ingestionState;
    if (ingestionState > 129)
    {
      switch(ingestionState)
      {
        case 130:
          v11 = CFSTR("ReaderModeIngestionStateTransferring");
          goto LABEL_22;
        case 140:
          v11 = CFSTR("ReaderModeIngestionStateCardAdded");
          goto LABEL_22;
        case 150:
          v11 = CFSTR("ReaderModeIngestionStateCommuteCardAdded");
          goto LABEL_22;
      }
    }
    else
    {
      switch(ingestionState)
      {
        case 'd':
          v11 = CFSTR("ReaderModeIngestionStateDefault");
          goto LABEL_22;
        case 'n':
          v11 = CFSTR("ReaderModeIngestionStateCardNotFound");
          goto LABEL_22;
        case 'x':
          v11 = CFSTR("ReaderModeIngestionStateTransferValue");
LABEL_22:
          objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("ingestionState"));

          has = (char)self->_has;
          goto LABEL_23;
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_ingestionState);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
LABEL_23:
  if ((has & 1) != 0)
  {
    *(float *)&v4 = self->_ingestionProgress;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("ingestionProgress"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_physicalCardImageURL)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
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
  if (self->_physicalCardImageURL)
  {
    objc_msgSend(v4, "setPhysicalCardImageURL:");
    v4 = v6;
  }
  if (self->_title)
  {
    objc_msgSend(v6, "setTitle:");
    v4 = v6;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v6, "setSubtitle:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 3) = self->_ingestionState;
    *((_BYTE *)v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_ingestionProgress);
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
  uint64_t v10;
  void *v11;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_physicalCardImageURL, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_ingestionState;
    *(_BYTE *)(v5 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)(v5 + 8) = self->_ingestionProgress;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *physicalCardImageURL;
  NSString *title;
  NSString *subtitle;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  physicalCardImageURL = self->_physicalCardImageURL;
  if ((unint64_t)physicalCardImageURL | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](physicalCardImageURL, "isEqual:"))
      goto LABEL_17;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_17;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_ingestionState != *((_DWORD *)v4 + 3))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_ingestionProgress != *((float *)v4 + 2))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  float ingestionProgress;
  float v8;
  float v9;
  float v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_physicalCardImageURL, "hash");
  v4 = -[NSString hash](self->_title, "hash");
  v5 = -[NSString hash](self->_subtitle, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_ingestionState;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v11;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  ingestionProgress = self->_ingestionProgress;
  v8 = -ingestionProgress;
  if (ingestionProgress >= 0.0)
    v8 = self->_ingestionProgress;
  v9 = floorf(v8 + 0.5);
  v10 = (float)(v8 - v9) * 1.8447e19;
  v11 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabsf(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext setPhysicalCardImageURL:](self, "setPhysicalCardImageURL:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext setTitle:](self, "setTitle:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext setSubtitle:](self, "setSubtitle:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_ingestionState = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 1) != 0)
  {
    self->_ingestionProgress = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)physicalCardImageURL
{
  return self->_physicalCardImageURL;
}

- (void)setPhysicalCardImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_physicalCardImageURL, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (float)ingestionProgress
{
  return self->_ingestionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_physicalCardImageURL, 0);
}

@end
