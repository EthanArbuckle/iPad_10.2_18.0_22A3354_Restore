@implementation ATXPBUnifiedInferredActivitySession

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBUnifiedInferredActivitySession *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[ATXPBUnifiedInferredActivitySession init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confidence"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      -[ATXPBUnifiedInferredActivitySession setConfidence:](v5, "setConfidence:");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("inferredActivity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUnifiedInferredActivitySession setInferredActivity:](v5, "setInferredActivity:", objc_msgSend(v8, "integerValue"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startTime"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      -[ATXPBUnifiedInferredActivitySession setStartTime:](v5, "setStartTime:");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("source"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXPBUnifiedInferredActivitySession setSource:](v5, "setSource:", v10);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endTime"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "doubleValue");
      -[ATXPBUnifiedInferredActivitySession setEndTime:](v5, "setEndTime:");

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
  void *v20;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("confidence");
  v3 = (void *)MEMORY[0x1E0CF8F00];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXPBUnifiedInferredActivitySession confidence](self, "confidence");
  objc_msgSend(v4, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wrapObject:", v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v23[1] = CFSTR("inferredActivity");
  v6 = (void *)MEMORY[0x1E0CF8F00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ATXPBUnifiedInferredActivitySession inferredActivity](self, "inferredActivity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wrapObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  v23[2] = CFSTR("startTime");
  v9 = (void *)MEMORY[0x1E0CF8F00];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXPBUnifiedInferredActivitySession startTime](self, "startTime");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wrapObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v12;
  v23[3] = CFSTR("endTime");
  v13 = (void *)MEMORY[0x1E0CF8F00];
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXPBUnifiedInferredActivitySession endTime](self, "endTime");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "wrapObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v16;
  v23[4] = CFSTR("source");
  v17 = (void *)MEMORY[0x1E0CF8F00];
  -[ATXPBUnifiedInferredActivitySession source](self, "source");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "wrapObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setStartTime:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartTime
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEndTime:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setInferredActivity:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_inferredActivity = a3;
}

- (void)setHasInferredActivity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInferredActivity
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)ATXPBUnifiedInferredActivitySession;
  -[ATXPBUnifiedInferredActivitySession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUnifiedInferredActivitySession dictionaryRepresentation](self, "dictionaryRepresentation");
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
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("startTime"));

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("endTime"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
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
  return ATXPBUnifiedInferredActivitySessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
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
  if ((*(_BYTE *)&self->_has & 4) != 0)
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
  if ((has & 8) != 0)
  {
    v4[4] = *(_QWORD *)&self->_startTime;
    *((_BYTE *)v4 + 48) |= 8u;
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
  v4[2] = *(_QWORD *)&self->_endTime;
  *((_BYTE *)v4 + 48) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_inferredActivity;
    *((_BYTE *)v4 + 48) |= 4u;
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
    *((_BYTE *)v4 + 48) |= 1u;
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
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_startTime;
    *(_BYTE *)(v5 + 48) |= 8u;
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
  *(double *)(v5 + 16) = self->_endTime;
  *(_BYTE *)(v5 + 48) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_inferredActivity;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_confidence;
    *(_BYTE *)(v6 + 48) |= 1u;
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
    goto LABEL_24;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_startTime != *((double *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_endTime != *((double *)v4 + 2))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_inferredActivity != *((_QWORD *)v4 + 3))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](source, "isEqual:"))
    {
LABEL_24:
      v7 = 0;
      goto LABEL_25;
    }
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 48) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_confidence != *((double *)v4 + 1))
      goto LABEL_24;
    v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startTime;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double endTime;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  NSUInteger v15;
  unint64_t v16;
  double confidence;
  double v18;
  long double v19;
  double v20;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    startTime = self->_startTime;
    v6 = -startTime;
    if (startTime >= 0.0)
      v6 = self->_startTime;
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
    endTime = self->_endTime;
    v11 = -endTime;
    if (endTime >= 0.0)
      v11 = self->_endTime;
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
    v14 = 2654435761 * self->_inferredActivity;
  else
    v14 = 0;
  v15 = -[NSString hash](self->_source, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    confidence = self->_confidence;
    v18 = -confidence;
    if (confidence >= 0.0)
      v18 = self->_confidence;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v16 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 8) != 0)
  {
    self->_startTime = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
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
  self->_endTime = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_4:
    self->_inferredActivity = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 5))
  {
    v6 = v4;
    -[ATXPBUnifiedInferredActivitySession setSource:](self, "setSource:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_confidence = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
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

@end
