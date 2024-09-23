@implementation _MRTranscriptAlignmentProtobuf

- (void)setPlayerStartTime:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_playerStartTime = a3;
}

- (void)setHasPlayerStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlayerStartTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPlayerEndTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_playerEndTime = a3;
}

- (void)setHasPlayerEndTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlayerEndTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setReferenceStartTime:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_referenceStartTime = a3;
}

- (void)setHasReferenceStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReferenceStartTime
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setReferenceEndTime:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_referenceEndTime = a3;
}

- (void)setHasReferenceEndTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReferenceEndTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMatchedBeginning:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_matchedBeginning = a3;
}

- (void)setHasMatchedBeginning:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMatchedBeginning
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setMatchedEnd:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_matchedEnd = a3;
}

- (void)setHasMatchedEnd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMatchedEnd
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)_MRTranscriptAlignmentProtobuf;
  -[_MRTranscriptAlignmentProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRTranscriptAlignmentProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_playerStartTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("playerStartTime"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_playerEndTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("playerEndTime"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_referenceStartTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("referenceStartTime"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_matchedBeginning);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("matchedBeginning"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_referenceEndTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("referenceEndTime"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_matchedEnd);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("matchedEnd"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRTranscriptAlignmentProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_playerStartTime;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(_QWORD *)&self->_playerEndTime;
  *((_BYTE *)v4 + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4[4] = *(_QWORD *)&self->_referenceStartTime;
  *((_BYTE *)v4 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    *((_BYTE *)v4 + 40) = self->_matchedBeginning;
    *((_BYTE *)v4 + 44) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  v4[3] = *(_QWORD *)&self->_referenceEndTime;
  *((_BYTE *)v4 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *((_BYTE *)v4 + 41) = self->_matchedEnd;
    *((_BYTE *)v4 + 44) |= 0x20u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_playerStartTime;
    *((_BYTE *)result + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_playerEndTime;
  *((_BYTE *)result + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_referenceStartTime;
  *((_BYTE *)result + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_referenceEndTime;
  *((_BYTE *)result + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_BYTE *)result + 40) = self->_matchedBeginning;
  *((_BYTE *)result + 44) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_7:
  *((_BYTE *)result + 41) = self->_matchedEnd;
  *((_BYTE *)result + 44) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_playerStartTime != *((double *)v4 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_playerEndTime != *((double *)v4 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_referenceStartTime != *((double *)v4 + 4))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_referenceEndTime != *((double *)v4 + 3))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
      goto LABEL_32;
    if (self->_matchedBeginning)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  v5 = (*((_BYTE *)v4 + 44) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
    {
      if (self->_matchedEnd)
      {
        if (!*((_BYTE *)v4 + 41))
          goto LABEL_32;
      }
      else if (*((_BYTE *)v4 + 41))
      {
        goto LABEL_32;
      }
      v5 = 1;
      goto LABEL_33;
    }
LABEL_32:
    v5 = 0;
  }
LABEL_33:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double playerStartTime;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double playerEndTime;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double referenceStartTime;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double referenceEndTime;
  double v21;
  long double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    playerStartTime = self->_playerStartTime;
    v6 = -playerStartTime;
    if (playerStartTime >= 0.0)
      v6 = self->_playerStartTime;
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
  if ((has & 1) != 0)
  {
    playerEndTime = self->_playerEndTime;
    v11 = -playerEndTime;
    if (playerEndTime >= 0.0)
      v11 = self->_playerEndTime;
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
  if ((has & 8) != 0)
  {
    referenceStartTime = self->_referenceStartTime;
    v16 = -referenceStartTime;
    if (referenceStartTime >= 0.0)
      v16 = self->_referenceStartTime;
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
  if ((has & 4) != 0)
  {
    referenceEndTime = self->_referenceEndTime;
    v21 = -referenceEndTime;
    if (referenceEndTime >= 0.0)
      v21 = self->_referenceEndTime;
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
  if ((has & 0x10) != 0)
  {
    v24 = 2654435761 * self->_matchedBeginning;
    if ((has & 0x20) != 0)
      goto LABEL_35;
LABEL_37:
    v25 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v25;
  }
  v24 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_37;
LABEL_35:
  v25 = 2654435761 * self->_matchedEnd;
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_playerStartTime = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_playerEndTime = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_referenceStartTime = *((double *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
LABEL_13:
    self->_matchedBeginning = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_referenceEndTime = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x10) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 0x20) != 0)
  {
LABEL_7:
    self->_matchedEnd = *((_BYTE *)v4 + 41);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_8:

}

- (double)playerStartTime
{
  return self->_playerStartTime;
}

- (double)playerEndTime
{
  return self->_playerEndTime;
}

- (double)referenceStartTime
{
  return self->_referenceStartTime;
}

- (double)referenceEndTime
{
  return self->_referenceEndTime;
}

- (BOOL)matchedBeginning
{
  return self->_matchedBeginning;
}

- (BOOL)matchedEnd
{
  return self->_matchedEnd;
}

@end
