@implementation ATXMPBAnchorModelPredictionsGeneratedTracker

- (BOOL)hasAnchorType
{
  return self->_anchorType != 0;
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

- (BOOL)hasCandidateType
{
  return self->_candidateType != 0;
}

- (void)setSecondsAfterAnchorStart:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_secondsAfterAnchorStart = a3;
}

- (void)setHasSecondsAfterAnchorStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecondsAfterAnchorStart
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSecondsAfterAnchorEnd:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_secondsAfterAnchorEnd = a3;
}

- (void)setHasSecondsAfterAnchorEnd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSecondsAfterAnchorEnd
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasExecutableObject
{
  return self->_executableObject != 0;
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
  v8.super_class = (Class)ATXMPBAnchorModelPredictionsGeneratedTracker;
  -[ATXMPBAnchorModelPredictionsGeneratedTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBAnchorModelPredictionsGeneratedTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *anchorType;
  void *v6;
  NSString *candidateType;
  char has;
  void *v9;
  void *v10;
  NSString *abGroup;
  NSString *executableObject;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  anchorType = self->_anchorType;
  if (anchorType)
    objc_msgSend(v3, "setObject:forKey:", anchorType, CFSTR("anchorType"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("score"));

  }
  candidateType = self->_candidateType;
  if (candidateType)
    objc_msgSend(v4, "setObject:forKey:", candidateType, CFSTR("candidateType"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_secondsAfterAnchorStart);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("secondsAfterAnchorStart"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_secondsAfterAnchorEnd);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("secondsAfterAnchorEnd"));

  }
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v4, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  executableObject = self->_executableObject;
  if (executableObject)
    objc_msgSend(v4, "setObject:forKey:", executableObject, CFSTR("executableObject"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBAnchorModelPredictionsGeneratedTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_anchorType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_candidateType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_executableObject)
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
  if (self->_anchorType)
  {
    objc_msgSend(v4, "setAnchorType:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_score;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (self->_candidateType)
  {
    objc_msgSend(v6, "setCandidateType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_secondsAfterAnchorStart;
    *((_BYTE *)v4 + 56) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_secondsAfterAnchorEnd;
    *((_BYTE *)v4 + 56) |= 2u;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v6, "setAbGroup:");
    v4 = v6;
  }
  if (self->_executableObject)
  {
    objc_msgSend(v6, "setExecutableObject:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_anchorType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_score;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_candidateType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_secondsAfterAnchorStart;
    *(_BYTE *)(v5 + 56) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_secondsAfterAnchorEnd;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v11 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  v13 = -[NSString copyWithZone:](self->_executableObject, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *anchorType;
  char has;
  NSString *candidateType;
  NSString *abGroup;
  NSString *executableObject;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  anchorType = self->_anchorType;
  if ((unint64_t)anchorType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](anchorType, "isEqual:"))
      goto LABEL_26;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_score != *((double *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_26;
  }
  candidateType = self->_candidateType;
  if ((unint64_t)candidateType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](candidateType, "isEqual:"))
    {
LABEL_26:
      v10 = 0;
      goto LABEL_27;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_secondsAfterAnchorStart != *((_DWORD *)v4 + 13))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_secondsAfterAnchorEnd != *((_DWORD *)v4 + 12))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_26;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](abGroup, "isEqual:"))
    goto LABEL_26;
  executableObject = self->_executableObject;
  if ((unint64_t)executableObject | *((_QWORD *)v4 + 5))
    v10 = -[NSString isEqual:](executableObject, "isEqual:");
  else
    v10 = 1;
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double score;
  double v6;
  long double v7;
  double v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSUInteger v13;

  v3 = -[NSString hash](self->_anchorType, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    score = self->_score;
    v6 = -score;
    if (score >= 0.0)
      v6 = self->_score;
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
  v9 = -[NSString hash](self->_candidateType, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v10 = 2654435761 * self->_secondsAfterAnchorStart;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_11;
LABEL_13:
    v11 = 0;
    goto LABEL_14;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_11:
  v11 = 2654435761 * self->_secondsAfterAnchorEnd;
LABEL_14:
  v12 = v4 ^ v3 ^ v9 ^ v10;
  v13 = v11 ^ -[NSString hash](self->_abGroup, "hash");
  return v12 ^ v13 ^ -[NSString hash](self->_executableObject, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXMPBAnchorModelPredictionsGeneratedTracker setAnchorType:](self, "setAnchorType:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_score = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXMPBAnchorModelPredictionsGeneratedTracker setCandidateType:](self, "setCandidateType:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 4) != 0)
  {
    self->_secondsAfterAnchorStart = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_secondsAfterAnchorEnd = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBAnchorModelPredictionsGeneratedTracker setAbGroup:](self, "setAbGroup:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXMPBAnchorModelPredictionsGeneratedTracker setExecutableObject:](self, "setExecutableObject:");
    v4 = v6;
  }

}

- (NSString)anchorType
{
  return self->_anchorType;
}

- (void)setAnchorType:(id)a3
{
  objc_storeStrong((id *)&self->_anchorType, a3);
}

- (double)score
{
  return self->_score;
}

- (NSString)candidateType
{
  return self->_candidateType;
}

- (void)setCandidateType:(id)a3
{
  objc_storeStrong((id *)&self->_candidateType, a3);
}

- (int)secondsAfterAnchorStart
{
  return self->_secondsAfterAnchorStart;
}

- (int)secondsAfterAnchorEnd
{
  return self->_secondsAfterAnchorEnd;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (NSString)executableObject
{
  return self->_executableObject;
}

- (void)setExecutableObject:(id)a3
{
  objc_storeStrong((id *)&self->_executableObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableObject, 0);
  objc_storeStrong((id *)&self->_candidateType, 0);
  objc_storeStrong((id *)&self->_anchorType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
