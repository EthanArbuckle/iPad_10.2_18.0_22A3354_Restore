@implementation ATXPBUnifiedInferredActivityTransition

- (void)setTransitionTime:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_transitionTime = a3;
}

- (void)setHasTransitionTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTransitionTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsActivityStart:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isActivityStart = a3;
}

- (void)setHasIsActivityStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsActivityStart
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setInferredActivity:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_inferredActivity = a3;
}

- (void)setHasInferredActivity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInferredActivity
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)setConfidence:(double)a3
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUnifiedInferredActivityTransition;
  -[ATXPBUnifiedInferredActivityTransition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUnifiedInferredActivityTransition dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *source;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_transitionTime);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("transitionTime"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isActivityStart);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isActivityStart"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_inferredActivity);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("inferredActivity"));

  }
LABEL_5:
  source = self->_source;
  if (source)
    objc_msgSend(v3, "setObject:forKey:", source, CFSTR("source"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("confidence"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUnifiedInferredActivityTransitionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteInt64Field();
LABEL_5:
  if (self->_source)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(_QWORD *)&self->_transitionTime;
    *((_BYTE *)v4 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 40) = self->_isActivityStart;
  *((_BYTE *)v4 + 44) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[2] = self->_inferredActivity;
    *((_BYTE *)v4 + 44) |= 2u;
  }
LABEL_5:
  if (self->_source)
  {
    v6 = v4;
    objc_msgSend(v4, "setSource:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_confidence;
    *((_BYTE *)v4 + 44) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_transitionTime;
    *(_BYTE *)(v5 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 40) = self->_isActivityStart;
  *(_BYTE *)(v5 + 44) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 16) = self->_inferredActivity;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_confidence;
    *(_BYTE *)(v6 + 44) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *source;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_transitionTime != *((double *)v4 + 3))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0)
      goto LABEL_27;
    if (self->_isActivityStart)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_inferredActivity != *((_QWORD *)v4 + 2))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_27;
  }
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 4))
  {
    if (-[NSString isEqual:](source, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_23;
    }
LABEL_27:
    v7 = 0;
    goto LABEL_28;
  }
LABEL_23:
  v7 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_confidence != *((double *)v4 + 1))
      goto LABEL_27;
    v7 = 1;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double transitionTime;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  double confidence;
  double v14;
  long double v15;
  double v16;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    transitionTime = self->_transitionTime;
    v6 = -transitionTime;
    if (transitionTime >= 0.0)
      v6 = self->_transitionTime;
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
  if ((has & 8) != 0)
  {
    v9 = 2654435761 * self->_isActivityStart;
    if ((has & 2) != 0)
      goto LABEL_11;
  }
  else
  {
    v9 = 0;
    if ((has & 2) != 0)
    {
LABEL_11:
      v10 = 2654435761 * self->_inferredActivity;
      goto LABEL_14;
    }
  }
  v10 = 0;
LABEL_14:
  v11 = -[NSString hash](self->_source, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    confidence = self->_confidence;
    v14 = -confidence;
    if (confidence >= 0.0)
      v14 = self->_confidence;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) != 0)
  {
    self->_transitionTime = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_isActivityStart = *((_BYTE *)v4 + 40);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_4:
    self->_inferredActivity = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[ATXPBUnifiedInferredActivityTransition setSource:](self, "setSource:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_confidence = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (double)transitionTime
{
  return self->_transitionTime;
}

- (BOOL)isActivityStart
{
  return self->_isActivityStart;
}

- (int64_t)inferredActivity
{
  return self->_inferredActivity;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBUnifiedInferredActivityTransition *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[ATXPBUnifiedInferredActivityTransition init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confidence"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      -[ATXPBUnifiedInferredActivityTransition setConfidence:](v5, "setConfidence:");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inferredActivity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUnifiedInferredActivityTransition setInferredActivity:](v5, "setInferredActivity:", objc_msgSend(v8, "integerValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isActivityStart"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUnifiedInferredActivityTransition setIsActivityStart:](v5, "setIsActivityStart:", objc_msgSend(v9, "BOOLValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("source"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUnifiedInferredActivityTransition setSource:](v5, "setSource:", v10);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transitionTime"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "doubleValue");
      -[ATXPBUnifiedInferredActivityTransition setTransitionTime:](v5, "setTransitionTime:");

    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("confidence");
  v3 = (void *)MEMORY[0x1E0CF8F00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXPBUnifiedInferredActivityTransition confidence](self, "confidence");
  objc_msgSend(v4, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wrapObject:", v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v22[1] = CFSTR("inferredActivity");
  v6 = (void *)MEMORY[0x1E0CF8F00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ATXPBUnifiedInferredActivityTransition inferredActivity](self, "inferredActivity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wrapObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v8;
  v22[2] = CFSTR("isActivityStart");
  v9 = (void *)MEMORY[0x1E0CF8F00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPBUnifiedInferredActivityTransition isActivityStart](self, "isActivityStart"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wrapObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  v22[3] = CFSTR("transitionTime");
  v12 = (void *)MEMORY[0x1E0CF8F00];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXPBUnifiedInferredActivityTransition transitionTime](self, "transitionTime");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wrapObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v15;
  v22[4] = CFSTR("source");
  v16 = (void *)MEMORY[0x1E0CF8F00];
  -[ATXPBUnifiedInferredActivityTransition source](self, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "wrapObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
