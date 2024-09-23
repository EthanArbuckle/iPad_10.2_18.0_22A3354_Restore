@implementation NTPBTagMetadata

- (void)setFlowRate:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_flowRate = a3;
}

- (void)setHasFlowRate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFlowRate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSubscriptionRate:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_subscriptionRate = a3;
}

- (void)setHasSubscriptionRate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSubscriptionRate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setQuality:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_quality = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasQuality
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setOntologyLevel:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_ontologyLevel = a3;
}

- (void)setHasOntologyLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOntologyLevel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasContentAndRelevanceInfo
{
  return self->_contentAndRelevanceInfo != 0;
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
  v8.super_class = (Class)NTPBTagMetadata;
  -[NTPBTagMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTagMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  NTPBContentAndRelevanceInfo *contentAndRelevanceInfo;
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)&v4 = self->_flowRate;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("flow_rate"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_subscriptionRate;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("subscription_rate"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  *(float *)&v4 = self->_quality;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("quality"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_ontologyLevel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ontology_level"));

  }
LABEL_6:
  contentAndRelevanceInfo = self->_contentAndRelevanceInfo;
  if (contentAndRelevanceInfo)
  {
    -[NTPBContentAndRelevanceInfo dictionaryRepresentation](contentAndRelevanceInfo, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("content_and_relevance_info"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTagMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteFloatField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_6:
  if (self->_contentAndRelevanceInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)(v5 + 16) = self->_flowRate;
    *(_BYTE *)(v5 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(float *)(v5 + 24) = self->_quality;
      *(_BYTE *)(v5 + 32) |= 4u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 28) = self->_subscriptionRate;
  *(_BYTE *)(v5 + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 20) = self->_ontologyLevel;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
LABEL_6:
  v8 = -[NTPBContentAndRelevanceInfo copyWithZone:](self->_contentAndRelevanceInfo, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NTPBContentAndRelevanceInfo *contentAndRelevanceInfo;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_flowRate != *((float *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_24:
    v6 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_subscriptionRate != *((float *)v4 + 7))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_quality != *((float *)v4 + 6))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_ontologyLevel != *((_DWORD *)v4 + 5))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_24;
  }
  contentAndRelevanceInfo = self->_contentAndRelevanceInfo;
  if ((unint64_t)contentAndRelevanceInfo | *((_QWORD *)v4 + 1))
    v6 = -[NTPBContentAndRelevanceInfo isEqual:](contentAndRelevanceInfo, "isEqual:");
  else
    v6 = 1;
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float flowRate;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  float subscriptionRate;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float quality;
  float v16;
  float v17;
  float v18;
  uint64_t v19;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    flowRate = self->_flowRate;
    v6 = -flowRate;
    if (flowRate >= 0.0)
      v6 = self->_flowRate;
    v7 = floorf(v6 + 0.5);
    v8 = (float)(v6 - v7) * 1.8447e19;
    v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 8) != 0)
  {
    subscriptionRate = self->_subscriptionRate;
    v11 = -subscriptionRate;
    if (subscriptionRate >= 0.0)
      v11 = self->_subscriptionRate;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 4) != 0)
  {
    quality = self->_quality;
    v16 = -quality;
    if (quality >= 0.0)
      v16 = self->_quality;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 2) != 0)
    v19 = 2654435761 * self->_ontologyLevel;
  else
    v19 = 0;
  return v9 ^ v4 ^ v14 ^ v19 ^ -[NTPBContentAndRelevanceInfo hash](self->_contentAndRelevanceInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  NTPBContentAndRelevanceInfo *contentAndRelevanceInfo;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 32);
  if ((v6 & 1) != 0)
  {
    self->_flowRate = *((float *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 32);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_subscriptionRate = *((float *)v4 + 7);
  *(_BYTE *)&self->_has |= 8u;
  v6 = *((_BYTE *)v4 + 32);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_quality = *((float *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_5:
    self->_ontologyLevel = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_6:
  contentAndRelevanceInfo = self->_contentAndRelevanceInfo;
  v8 = v5[1];
  if (contentAndRelevanceInfo)
  {
    if (v8)
    {
      v9 = v5;
      -[NTPBContentAndRelevanceInfo mergeFrom:](contentAndRelevanceInfo, "mergeFrom:");
LABEL_15:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[NTPBTagMetadata setContentAndRelevanceInfo:](self, "setContentAndRelevanceInfo:");
    goto LABEL_15;
  }

}

- (float)flowRate
{
  return self->_flowRate;
}

- (float)subscriptionRate
{
  return self->_subscriptionRate;
}

- (float)quality
{
  return self->_quality;
}

- (int)ontologyLevel
{
  return self->_ontologyLevel;
}

- (NTPBContentAndRelevanceInfo)contentAndRelevanceInfo
{
  return self->_contentAndRelevanceInfo;
}

- (void)setContentAndRelevanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_contentAndRelevanceInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAndRelevanceInfo, 0);
}

@end
