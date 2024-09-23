@implementation ATXPBDigestTimeline

- (void)setFirstUpcomingViewTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_firstUpcomingViewTimestamp = a3;
}

- (void)setHasFirstUpcomingViewTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFirstUpcomingViewTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setFirstCollapsedViewTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_firstCollapsedViewTimestamp = a3;
}

- (void)setHasFirstCollapsedViewTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFirstCollapsedViewTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFirstScheduledViewTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_firstScheduledViewTimestamp = a3;
}

- (void)setHasFirstScheduledViewTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFirstScheduledViewTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDigestRemovedTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_digestRemovedTimestamp = a3;
}

- (void)setHasDigestRemovedTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDigestRemovedTimestamp
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
  v8.super_class = (Class)ATXPBDigestTimeline;
  -[ATXPBDigestTimeline description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBDigestTimeline dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstUpcomingViewTimestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("firstUpcomingViewTimestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstScheduledViewTimestamp);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("firstScheduledViewTimestamp"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstCollapsedViewTimestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("firstCollapsedViewTimestamp"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_digestRemovedTimestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("digestRemovedTimestamp"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBDigestTimelineReadFrom((uint64_t)self, (uint64_t)a3);
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
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(_QWORD *)&self->_firstUpcomingViewTimestamp;
    *((_BYTE *)v4 + 40) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      v4[3] = *(_QWORD *)&self->_firstScheduledViewTimestamp;
      *((_BYTE *)v4 + 40) |= 4u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = *(_QWORD *)&self->_firstCollapsedViewTimestamp;
  *((_BYTE *)v4 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    v4[1] = *(_QWORD *)&self->_digestRemovedTimestamp;
    *((_BYTE *)v4 + 40) |= 1u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_firstUpcomingViewTimestamp;
    *((_BYTE *)result + 40) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_firstCollapsedViewTimestamp;
  *((_BYTE *)result + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_firstScheduledViewTimestamp;
  *((_BYTE *)result + 40) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_5:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_digestRemovedTimestamp;
  *((_BYTE *)result + 40) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_firstUpcomingViewTimestamp != *((double *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_firstCollapsedViewTimestamp != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_firstScheduledViewTimestamp != *((double *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_digestRemovedTimestamp != *((double *)v4 + 1))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double firstUpcomingViewTimestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double firstCollapsedViewTimestamp;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double firstScheduledViewTimestamp;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double digestRemovedTimestamp;
  double v21;
  long double v22;
  double v23;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    firstUpcomingViewTimestamp = self->_firstUpcomingViewTimestamp;
    v6 = -firstUpcomingViewTimestamp;
    if (firstUpcomingViewTimestamp >= 0.0)
      v6 = self->_firstUpcomingViewTimestamp;
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
    firstCollapsedViewTimestamp = self->_firstCollapsedViewTimestamp;
    v11 = -firstCollapsedViewTimestamp;
    if (firstCollapsedViewTimestamp >= 0.0)
      v11 = self->_firstCollapsedViewTimestamp;
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
    firstScheduledViewTimestamp = self->_firstScheduledViewTimestamp;
    v16 = -firstScheduledViewTimestamp;
    if (firstScheduledViewTimestamp >= 0.0)
      v16 = self->_firstScheduledViewTimestamp;
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
  if ((has & 1) != 0)
  {
    digestRemovedTimestamp = self->_digestRemovedTimestamp;
    v21 = -digestRemovedTimestamp;
    if (digestRemovedTimestamp >= 0.0)
      v21 = self->_digestRemovedTimestamp;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 8) != 0)
  {
    self->_firstUpcomingViewTimestamp = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      self->_firstScheduledViewTimestamp = *((double *)v4 + 3);
      *(_BYTE *)&self->_has |= 4u;
      if ((*((_BYTE *)v4 + 40) & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_firstCollapsedViewTimestamp = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    self->_digestRemovedTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_6:

}

- (double)firstUpcomingViewTimestamp
{
  return self->_firstUpcomingViewTimestamp;
}

- (double)firstCollapsedViewTimestamp
{
  return self->_firstCollapsedViewTimestamp;
}

- (double)firstScheduledViewTimestamp
{
  return self->_firstScheduledViewTimestamp;
}

- (double)digestRemovedTimestamp
{
  return self->_digestRemovedTimestamp;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBDigestTimeline *v5;
  id v6;
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
  void *v21;
  void *v22;

  v4 = a3;
  v5 = -[ATXPBDigestTimeline init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstUpcomingViewTimestamp"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstUpcomingViewTimestamp"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        -[ATXPBDigestTimeline setFirstUpcomingViewTimestamp:](v5, "setFirstUpcomingViewTimestamp:");

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstCollapsedViewTimestamp"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstCollapsedViewTimestamp"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        -[ATXPBDigestTimeline setFirstUpcomingViewTimestamp:](v5, "setFirstUpcomingViewTimestamp:");

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstScheduledViewTimestamp"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstScheduledViewTimestamp"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        -[ATXPBDigestTimeline setFirstUpcomingViewTimestamp:](v5, "setFirstUpcomingViewTimestamp:");

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("digestRemovedTimestamp"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("digestRemovedTimestamp"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXJSONHelper unwrapObject:](ATXJSONHelper, "unwrapObject:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        -[ATXPBDigestTimeline setFirstUpcomingViewTimestamp:](v5, "setFirstUpcomingViewTimestamp:");

      }
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("firstUpcomingViewTimestamp");
  v21 = -[ATXPBDigestTimeline hasFirstUpcomingViewTimestamp](self, "hasFirstUpcomingViewTimestamp");
  if (v21)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[ATXPBDigestTimeline firstUpcomingViewTimestamp](self, "firstUpcomingViewTimestamp");
    objc_msgSend(v3, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v4;
  }
  v23[0] = v4;
  v22[1] = CFSTR("firstCollapsedViewTimestamp");
  v18 = -[ATXPBDigestTimeline hasFirstCollapsedViewTimestamp](self, "hasFirstCollapsedViewTimestamp", v4);
  if (v18)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[ATXPBDigestTimeline firstCollapsedViewTimestamp](self, "firstCollapsedViewTimestamp");
    objc_msgSend(v5, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v6;
  }
  v23[1] = v6;
  v22[2] = CFSTR("firstScheduledViewTimestamp");
  v7 = -[ATXPBDigestTimeline hasFirstScheduledViewTimestamp](self, "hasFirstScheduledViewTimestamp");
  v8 = 0x1E4D53000uLL;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[ATXPBDigestTimeline firstScheduledViewTimestamp](self, "firstScheduledViewTimestamp");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
  }
  v23[2] = v11;
  v22[3] = CFSTR("digestRemovedTimestamp");
  v12 = -[ATXPBDigestTimeline hasDigestRemovedTimestamp](self, "hasDigestRemovedTimestamp");
  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[ATXPBDigestTimeline digestRemovedTimestamp](self, "digestRemovedTimestamp");
    objc_msgSend(v13, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();
    +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

    v14 = (void *)v8;
  }

  if (v7)
  if (v18)

  if (v21)
  return v15;
}

@end
