@implementation SGMIMetricsSubmodelAgeVector

- (void)setPersonFromSenderAge:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_personFromSenderAge = a3;
}

- (void)setHasPersonFromSenderAge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPersonFromSenderAge
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPersonFromSenderInDyadicConversationAge:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_personFromSenderInDyadicConversationAge = a3;
}

- (void)setHasPersonFromSenderInDyadicConversationAge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPersonFromSenderInDyadicConversationAge
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setSubjectContentAge:(float)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_subjectContentAge = a3;
}

- (void)setHasSubjectContentAge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSubjectContentAge
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setPersonToRecipientsAge:(float)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_personToRecipientsAge = a3;
}

- (void)setHasPersonToRecipientsAge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPersonToRecipientsAge
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPersonCCRecipientsAge:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_personCCRecipientsAge = a3;
}

- (void)setHasPersonCCRecipientsAge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPersonCCRecipientsAge
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDomainFromSenderAge:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_domainFromSenderAge = a3;
}

- (void)setHasDomainFromSenderAge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDomainFromSenderAge
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setConversationAge:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_conversationAge = a3;
}

- (void)setHasConversationAge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConversationAge
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
  v8.super_class = (Class)SGMIMetricsSubmodelAgeVector;
  -[SGMIMetricsSubmodelAgeVector description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsSubmodelAgeVector dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&v4 = self->_personFromSenderAge;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("personFromSenderAge"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_personFromSenderInDyadicConversationAge;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("personFromSenderInDyadicConversationAge"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(float *)&v4 = self->_subjectContentAge;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("subjectContentAge"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(float *)&v4 = self->_personToRecipientsAge;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("personToRecipientsAge"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
LABEL_15:
    *(float *)&v4 = self->_domainFromSenderAge;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("domainFromSenderAge"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  *(float *)&v4 = self->_personCCRecipientsAge;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("personCCRecipientsAge"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    *(float *)&v4 = self->_conversationAge;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("conversationAge"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsSubmodelAgeVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteFloatField();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 1) != 0)
LABEL_8:
    PBDataWriterWriteFloatField();
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = LODWORD(self->_personFromSenderAge);
    *((_BYTE *)v4 + 36) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = LODWORD(self->_personFromSenderInDyadicConversationAge);
  *((_BYTE *)v4 + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4[8] = LODWORD(self->_subjectContentAge);
  *((_BYTE *)v4 + 36) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4[7] = LODWORD(self->_personToRecipientsAge);
  *((_BYTE *)v4 + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
LABEL_15:
    v4[3] = LODWORD(self->_domainFromSenderAge);
    *((_BYTE *)v4 + 36) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  v4[4] = LODWORD(self->_personCCRecipientsAge);
  *((_BYTE *)v4 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    v4[2] = LODWORD(self->_conversationAge);
    *((_BYTE *)v4 + 36) |= 1u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = LODWORD(self->_personFromSenderAge);
    *((_BYTE *)result + 36) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = LODWORD(self->_personFromSenderInDyadicConversationAge);
  *((_BYTE *)result + 36) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 8) = LODWORD(self->_subjectContentAge);
  *((_BYTE *)result + 36) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 7) = LODWORD(self->_personToRecipientsAge);
  *((_BYTE *)result + 36) |= 0x20u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 4) = LODWORD(self->_personCCRecipientsAge);
  *((_BYTE *)result + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 3) = LODWORD(self->_domainFromSenderAge);
  *((_BYTE *)result + 36) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_8:
  *((_DWORD *)result + 2) = LODWORD(self->_conversationAge);
  *((_BYTE *)result + 36) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_personFromSenderAge != *((float *)v4 + 5))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
LABEL_36:
    v5 = 0;
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0 || self->_personFromSenderInDyadicConversationAge != *((float *)v4 + 6))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x40) == 0 || self->_subjectContentAge != *((float *)v4 + 8))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x20) == 0 || self->_personToRecipientsAge != *((float *)v4 + 7))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_personCCRecipientsAge != *((float *)v4 + 4))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_domainFromSenderAge != *((float *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_36;
  }
  v5 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_conversationAge != *((float *)v4 + 2))
      goto LABEL_36;
    v5 = 1;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float personFromSenderAge;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  float personFromSenderInDyadicConversationAge;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float subjectContentAge;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float personToRecipientsAge;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  float personCCRecipientsAge;
  float v26;
  float v27;
  float v28;
  unint64_t v29;
  float domainFromSenderAge;
  float v31;
  float v32;
  float v33;
  unint64_t v34;
  float conversationAge;
  float v36;
  float v37;
  float v38;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    personFromSenderAge = self->_personFromSenderAge;
    v6 = -personFromSenderAge;
    if (personFromSenderAge >= 0.0)
      v6 = self->_personFromSenderAge;
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
  if ((has & 0x10) != 0)
  {
    personFromSenderInDyadicConversationAge = self->_personFromSenderInDyadicConversationAge;
    v11 = -personFromSenderInDyadicConversationAge;
    if (personFromSenderInDyadicConversationAge >= 0.0)
      v11 = self->_personFromSenderInDyadicConversationAge;
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
  if ((has & 0x40) != 0)
  {
    subjectContentAge = self->_subjectContentAge;
    v16 = -subjectContentAge;
    if (subjectContentAge >= 0.0)
      v16 = self->_subjectContentAge;
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
  if ((has & 0x20) != 0)
  {
    personToRecipientsAge = self->_personToRecipientsAge;
    v21 = -personToRecipientsAge;
    if (personToRecipientsAge >= 0.0)
      v21 = self->_personToRecipientsAge;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 4) != 0)
  {
    personCCRecipientsAge = self->_personCCRecipientsAge;
    v26 = -personCCRecipientsAge;
    if (personCCRecipientsAge >= 0.0)
      v26 = self->_personCCRecipientsAge;
    v27 = floorf(v26 + 0.5);
    v28 = (float)(v26 - v27) * 1.8447e19;
    v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((has & 2) != 0)
  {
    domainFromSenderAge = self->_domainFromSenderAge;
    v31 = -domainFromSenderAge;
    if (domainFromSenderAge >= 0.0)
      v31 = self->_domainFromSenderAge;
    v32 = floorf(v31 + 0.5);
    v33 = (float)(v31 - v32) * 1.8447e19;
    v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((has & 1) != 0)
  {
    conversationAge = self->_conversationAge;
    v36 = -conversationAge;
    if (conversationAge >= 0.0)
      v36 = self->_conversationAge;
    v37 = floorf(v36 + 0.5);
    v38 = (float)(v36 - v37) * 1.8447e19;
    v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 8) != 0)
  {
    self->_personFromSenderAge = *((float *)v4 + 5);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_personFromSenderInDyadicConversationAge = *((float *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_subjectContentAge = *((float *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_personToRecipientsAge = *((float *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
LABEL_15:
    self->_domainFromSenderAge = *((float *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_personCCRecipientsAge = *((float *)v4 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v5 & 1) != 0)
  {
LABEL_8:
    self->_conversationAge = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_9:

}

- (float)personFromSenderAge
{
  return self->_personFromSenderAge;
}

- (float)personFromSenderInDyadicConversationAge
{
  return self->_personFromSenderInDyadicConversationAge;
}

- (float)subjectContentAge
{
  return self->_subjectContentAge;
}

- (float)personToRecipientsAge
{
  return self->_personToRecipientsAge;
}

- (float)personCCRecipientsAge
{
  return self->_personCCRecipientsAge;
}

- (float)domainFromSenderAge
{
  return self->_domainFromSenderAge;
}

- (float)conversationAge
{
  return self->_conversationAge;
}

@end
