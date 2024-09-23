@implementation HMUserActionPredictionDuetPredictionValue

- (BOOL)hasHomeIdentifier
{
  return self->_homeIdentifier != 0;
}

- (BOOL)hasTargetIdentifier
{
  return self->_targetIdentifier != 0;
}

- (BOOL)hasTargetAccessoryServiceIdentifier
{
  return self->_targetAccessoryServiceIdentifier != 0;
}

- (void)setScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)predictionType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_predictionType;
  else
    return 0;
}

- (void)setPredictionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_predictionType = a3;
}

- (void)setHasPredictionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPredictionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)predictionTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E3AB6108[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPredictionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("scene")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("accessory")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)HMUserActionPredictionDuetPredictionValue;
  -[HMUserActionPredictionDuetPredictionValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMUserActionPredictionDuetPredictionValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *homeIdentifier;
  NSString *targetIdentifier;
  NSString *targetAccessoryServiceIdentifier;
  char has;
  void *v9;
  uint64_t predictionType;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  homeIdentifier = self->_homeIdentifier;
  if (homeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", homeIdentifier, CFSTR("homeIdentifier"));
  targetIdentifier = self->_targetIdentifier;
  if (targetIdentifier)
    objc_msgSend(v4, "setObject:forKey:", targetIdentifier, CFSTR("targetIdentifier"));
  targetAccessoryServiceIdentifier = self->_targetAccessoryServiceIdentifier;
  if (targetAccessoryServiceIdentifier)
    objc_msgSend(v4, "setObject:forKey:", targetAccessoryServiceIdentifier, CFSTR("targetAccessoryServiceIdentifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("score"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    predictionType = self->_predictionType;
    if (predictionType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_predictionType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E3AB6108[predictionType];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("predictionType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMUserActionPredictionDuetPredictionValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_homeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_targetIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_targetAccessoryServiceIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
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
  if (self->_homeIdentifier)
  {
    objc_msgSend(v4, "setHomeIdentifier:");
    v4 = v6;
  }
  if (self->_targetIdentifier)
  {
    objc_msgSend(v6, "setTargetIdentifier:");
    v4 = v6;
  }
  if (self->_targetAccessoryServiceIdentifier)
  {
    objc_msgSend(v6, "setTargetAccessoryServiceIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_score;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_predictionType;
    *((_BYTE *)v4 + 48) |= 2u;
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
  v6 = -[NSString copyWithZone:](self->_homeIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_targetIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_targetAccessoryServiceIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_score;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_predictionType;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *homeIdentifier;
  NSString *targetIdentifier;
  NSString *targetAccessoryServiceIdentifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  homeIdentifier = self->_homeIdentifier;
  if ((unint64_t)homeIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](homeIdentifier, "isEqual:"))
      goto LABEL_17;
  }
  targetIdentifier = self->_targetIdentifier;
  if ((unint64_t)targetIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](targetIdentifier, "isEqual:"))
      goto LABEL_17;
  }
  targetAccessoryServiceIdentifier = self->_targetAccessoryServiceIdentifier;
  if ((unint64_t)targetAccessoryServiceIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](targetAccessoryServiceIdentifier, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_score != *((double *)v4 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  v8 = (*((_BYTE *)v4 + 48) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_predictionType != *((_DWORD *)v4 + 6))
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
  char has;
  unint64_t v7;
  double score;
  double v9;
  long double v10;
  double v11;
  uint64_t v12;

  v3 = -[NSString hash](self->_homeIdentifier, "hash");
  v4 = -[NSString hash](self->_targetIdentifier, "hash");
  v5 = -[NSString hash](self->_targetAccessoryServiceIdentifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    score = self->_score;
    v9 = -score;
    if (score >= 0.0)
      v9 = self->_score;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 2) != 0)
    v12 = 2654435761 * self->_predictionType;
  else
    v12 = 0;
  return v4 ^ v3 ^ v5 ^ v7 ^ v12;
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
    -[HMUserActionPredictionDuetPredictionValue setHomeIdentifier:](self, "setHomeIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HMUserActionPredictionDuetPredictionValue setTargetIdentifier:](self, "setTargetIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HMUserActionPredictionDuetPredictionValue setTargetAccessoryServiceIdentifier:](self, "setTargetAccessoryServiceIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 1) != 0)
  {
    self->_score = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 48);
  }
  if ((v5 & 2) != 0)
  {
    self->_predictionType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifier, a3);
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_targetIdentifier, a3);
}

- (NSString)targetAccessoryServiceIdentifier
{
  return self->_targetAccessoryServiceIdentifier;
}

- (void)setTargetAccessoryServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_targetAccessoryServiceIdentifier, a3);
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_targetAccessoryServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
}

@end
