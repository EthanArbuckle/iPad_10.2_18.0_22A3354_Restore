@implementation BMPBSiriInferredHelpfulnessEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setInferredHelpfulnessScore:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_inferredHelpfulnessScore = a3;
}

- (void)setHasInferredHelpfulnessScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInferredHelpfulnessScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRestatementScore:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_restatementScore = a3;
}

- (void)setHasRestatementScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRestatementScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasTurnID
{
  return self->_turnID != 0;
}

- (BOOL)hasModelID
{
  return self->_modelID != 0;
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
  v8.super_class = (Class)BMPBSiriInferredHelpfulnessEvent;
  -[BMPBSiriInferredHelpfulnessEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSiriInferredHelpfulnessEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *turnID;
  NSString *modelID;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("absoluteTimestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_inferredHelpfulnessScore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("inferredHelpfulnessScore"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_restatementScore);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("restatementScore"));

  }
LABEL_5:
  turnID = self->_turnID;
  if (turnID)
    objc_msgSend(v3, "setObject:forKey:", turnID, CFSTR("turnID"));
  modelID = self->_modelID;
  if (modelID)
    objc_msgSend(v3, "setObject:forKey:", modelID, CFSTR("modelID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriInferredHelpfulnessEventReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:
  if (self->_turnID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_modelID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = *(_QWORD *)&self->_inferredHelpfulnessScore;
  *((_BYTE *)v4 + 48) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = *(_QWORD *)&self->_restatementScore;
    *((_BYTE *)v4 + 48) |= 4u;
  }
LABEL_5:
  v6 = v4;
  if (self->_turnID)
  {
    objc_msgSend(v4, "setTurnID:");
    v4 = v6;
  }
  if (self->_modelID)
  {
    objc_msgSend(v6, "setModelID:");
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
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 16) = self->_inferredHelpfulnessScore;
    *(_BYTE *)(v5 + 48) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_absoluteTimestamp;
  *(_BYTE *)(v5 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(double *)(v5 + 24) = self->_restatementScore;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_turnID, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  v10 = -[NSString copyWithZone:](self->_modelID, "copyWithZone:", a3);
  v11 = (void *)v6[4];
  v6[4] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *turnID;
  NSString *modelID;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_inferredHelpfulnessScore != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_restatementScore != *((double *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_21;
  }
  turnID = self->_turnID;
  if ((unint64_t)turnID | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](turnID, "isEqual:"))
    goto LABEL_21;
  modelID = self->_modelID;
  if ((unint64_t)modelID | *((_QWORD *)v4 + 4))
    v7 = -[NSString isEqual:](modelID, "isEqual:");
  else
    v7 = 1;
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double absoluteTimestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double inferredHelpfulnessScore;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double restatementScore;
  double v16;
  long double v17;
  double v18;
  NSUInteger v19;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v6 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v6 = self->_absoluteTimestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    inferredHelpfulnessScore = self->_inferredHelpfulnessScore;
    v11 = -inferredHelpfulnessScore;
    if (inferredHelpfulnessScore >= 0.0)
      v11 = self->_inferredHelpfulnessScore;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 4) != 0)
  {
    restatementScore = self->_restatementScore;
    v16 = -restatementScore;
    if (restatementScore >= 0.0)
      v16 = self->_restatementScore;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v19 = v9 ^ v4 ^ v14 ^ -[NSString hash](self->_turnID, "hash");
  return v19 ^ -[NSString hash](self->_modelID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_inferredHelpfulnessScore = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_4:
    self->_restatementScore = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[BMPBSiriInferredHelpfulnessEvent setTurnID:](self, "setTurnID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBSiriInferredHelpfulnessEvent setModelID:](self, "setModelID:");
    v4 = v6;
  }

}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (double)inferredHelpfulnessScore
{
  return self->_inferredHelpfulnessScore;
}

- (double)restatementScore
{
  return self->_restatementScore;
}

- (NSString)turnID
{
  return self->_turnID;
}

- (void)setTurnID:(id)a3
{
  objc_storeStrong((id *)&self->_turnID, a3);
}

- (NSString)modelID
{
  return self->_modelID;
}

- (void)setModelID:(id)a3
{
  objc_storeStrong((id *)&self->_modelID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnID, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
}

@end
