@implementation PersonLinkingPersonPair

- (BOOL)hasSourcePerson
{
  return self->_sourcePerson != 0;
}

- (BOOL)hasTargetPerson
{
  return self->_targetPerson != 0;
}

- (void)setGrade:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_grade = a3;
}

- (void)setHasGrade:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGrade
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setConfidence:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
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
  v8.super_class = (Class)PersonLinkingPersonPair;
  -[PersonLinkingPersonPair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PersonLinkingPersonPair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  PersonLinkingPerson *sourcePerson;
  void *v6;
  PersonLinkingPerson *targetPerson;
  void *v8;
  char has;
  void *v10;
  void *v11;
  NSString *reason;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sourcePerson = self->_sourcePerson;
  if (sourcePerson)
  {
    -[PersonLinkingPerson dictionaryRepresentation](sourcePerson, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sourcePerson"));

  }
  targetPerson = self->_targetPerson;
  if (targetPerson)
  {
    -[PersonLinkingPerson dictionaryRepresentation](targetPerson, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("targetPerson"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_grade);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("grade"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)&v4 = self->_confidence;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("confidence"));

  }
  reason = self->_reason;
  if (reason)
    objc_msgSend(v3, "setObject:forKey:", reason, CFSTR("reason"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PersonLinkingPersonPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sourcePerson)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_targetPerson)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
  if (self->_reason)
  {
    PBDataWriterWriteStringField();
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
  if (self->_sourcePerson)
  {
    objc_msgSend(v4, "setSourcePerson:");
    v4 = v6;
  }
  if (self->_targetPerson)
  {
    objc_msgSend(v6, "setTargetPerson:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_grade;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_confidence);
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (self->_reason)
  {
    objc_msgSend(v6, "setReason:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PersonLinkingPerson copyWithZone:](self->_sourcePerson, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[PersonLinkingPerson copyWithZone:](self->_targetPerson, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_grade;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)(v5 + 8) = self->_confidence;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PersonLinkingPerson *sourcePerson;
  PersonLinkingPerson *targetPerson;
  NSString *reason;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  sourcePerson = self->_sourcePerson;
  if ((unint64_t)sourcePerson | *((_QWORD *)v4 + 3))
  {
    if (!-[PersonLinkingPerson isEqual:](sourcePerson, "isEqual:"))
      goto LABEL_21;
  }
  targetPerson = self->_targetPerson;
  if ((unint64_t)targetPerson | *((_QWORD *)v4 + 4))
  {
    if (!-[PersonLinkingPerson isEqual:](targetPerson, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_grade)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_21;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_14;
    }
LABEL_21:
    v8 = 0;
    goto LABEL_22;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_21;
LABEL_14:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_confidence != *((float *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_21;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((_QWORD *)v4 + 2))
    v8 = -[NSString isEqual:](reason, "isEqual:");
  else
    v8 = 1;
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  float confidence;
  float v7;
  float v8;
  float v9;
  unint64_t v10;

  v3 = -[PersonLinkingPerson hash](self->_sourcePerson, "hash");
  v4 = -[PersonLinkingPerson hash](self->_targetPerson, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_grade;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10 ^ -[NSString hash](self->_reason, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  confidence = self->_confidence;
  v7 = -confidence;
  if (confidence >= 0.0)
    v7 = self->_confidence;
  v8 = floorf(v7 + 0.5);
  v9 = (float)(v7 - v8) * 1.8447e19;
  v10 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabsf(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ -[NSString hash](self->_reason, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PersonLinkingPerson *sourcePerson;
  uint64_t v6;
  PersonLinkingPerson *targetPerson;
  uint64_t v8;
  char v9;
  id v10;

  v4 = a3;
  sourcePerson = self->_sourcePerson;
  v6 = *((_QWORD *)v4 + 3);
  v10 = v4;
  if (sourcePerson)
  {
    if (!v6)
      goto LABEL_7;
    -[PersonLinkingPerson mergeFrom:](sourcePerson, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PersonLinkingPersonPair setSourcePerson:](self, "setSourcePerson:");
  }
  v4 = v10;
LABEL_7:
  targetPerson = self->_targetPerson;
  v8 = *((_QWORD *)v4 + 4);
  if (targetPerson)
  {
    if (!v8)
      goto LABEL_13;
    -[PersonLinkingPerson mergeFrom:](targetPerson, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[PersonLinkingPersonPair setTargetPerson:](self, "setTargetPerson:");
  }
  v4 = v10;
LABEL_13:
  v9 = *((_BYTE *)v4 + 44);
  if ((v9 & 2) != 0)
  {
    self->_grade = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
    v9 = *((_BYTE *)v4 + 44);
  }
  if ((v9 & 1) != 0)
  {
    self->_confidence = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PersonLinkingPersonPair setReason:](self, "setReason:");
    v4 = v10;
  }

}

- (PersonLinkingPerson)sourcePerson
{
  return self->_sourcePerson;
}

- (void)setSourcePerson:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePerson, a3);
}

- (PersonLinkingPerson)targetPerson
{
  return self->_targetPerson;
}

- (void)setTargetPerson:(id)a3
{
  objc_storeStrong((id *)&self->_targetPerson, a3);
}

- (BOOL)grade
{
  return self->_grade;
}

- (float)confidence
{
  return self->_confidence;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPerson, 0);
  objc_storeStrong((id *)&self->_sourcePerson, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
