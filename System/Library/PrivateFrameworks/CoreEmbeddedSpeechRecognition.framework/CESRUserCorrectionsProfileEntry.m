@implementation CESRUserCorrectionsProfileEntry

- (BOOL)hasCorrectedText
{
  return self->_correctedText != 0;
}

- (BOOL)hasPronunciationData
{
  return self->_pronunciationData != 0;
}

- (void)setSpellingCorrectionsCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_spellingCorrectionsCount = a3;
}

- (void)setHasSpellingCorrectionsCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSpellingCorrectionsCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTap2editCorrectionsCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_tap2editCorrectionsCount = a3;
}

- (void)setHasTap2editCorrectionsCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTap2editCorrectionsCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAlternativesCorrectionsCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_alternativesCorrectionsCount = a3;
}

- (void)setHasAlternativesCorrectionsCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlternativesCorrectionsCount
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
  v8.super_class = (Class)CESRUserCorrectionsProfileEntry;
  -[CESRUserCorrectionsProfileEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CESRUserCorrectionsProfileEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *correctedText;
  CESRCorrectionPronunciation *pronunciationData;
  void *v7;
  char has;
  void *v9;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  correctedText = self->_correctedText;
  if (correctedText)
    objc_msgSend(v3, "setObject:forKey:", correctedText, CFSTR("corrected_text"));
  pronunciationData = self->_pronunciationData;
  if (pronunciationData)
  {
    -[CESRCorrectionPronunciation dictionaryRepresentation](pronunciationData, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("pronunciation_data"));

  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tap2editCorrectionsCount);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("tap2edit_corrections_count"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v4;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_spellingCorrectionsCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("spelling_corrections_count"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_alternativesCorrectionsCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("alternatives_corrections_count"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CESRUserCorrectionsProfileEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_correctedText)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_pronunciationData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_9:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_correctedText)
  {
    objc_msgSend(v4, "setCorrectedText:");
    v4 = v6;
  }
  if (self->_pronunciationData)
  {
    objc_msgSend(v6, "setPronunciationData:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    *((_DWORD *)v4 + 9) = self->_tap2editCorrectionsCount;
    *((_BYTE *)v4 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_DWORD *)v4 + 8) = self->_spellingCorrectionsCount;
  *((_BYTE *)v4 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 2) = self->_alternativesCorrectionsCount;
    *((_BYTE *)v4 + 40) |= 1u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_correctedText, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[CESRCorrectionPronunciation copyWithZone:](self->_pronunciationData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 36) = self->_tap2editCorrectionsCount;
    *(_BYTE *)(v5 + 40) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_spellingCorrectionsCount;
  *(_BYTE *)(v5 + 40) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 8) = self->_alternativesCorrectionsCount;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *correctedText;
  CESRCorrectionPronunciation *pronunciationData;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  correctedText = self->_correctedText;
  if ((unint64_t)correctedText | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](correctedText, "isEqual:"))
      goto LABEL_20;
  }
  pronunciationData = self->_pronunciationData;
  if ((unint64_t)pronunciationData | *((_QWORD *)v4 + 3))
  {
    if (!-[CESRCorrectionPronunciation isEqual:](pronunciationData, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_spellingCorrectionsCount != *((_DWORD *)v4 + 8))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_20:
    v7 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_tap2editCorrectionsCount != *((_DWORD *)v4 + 9))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_20;
  }
  v7 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_alternativesCorrectionsCount != *((_DWORD *)v4 + 2))
      goto LABEL_20;
    v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_correctedText, "hash");
  v4 = -[CESRCorrectionPronunciation hash](self->_pronunciationData, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_spellingCorrectionsCount;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_tap2editCorrectionsCount;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_alternativesCorrectionsCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  CESRCorrectionPronunciation *pronunciationData;
  uint64_t v6;
  char v7;
  unsigned int *v8;

  v4 = (unsigned int *)a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[CESRUserCorrectionsProfileEntry setCorrectedText:](self, "setCorrectedText:");
    v4 = v8;
  }
  pronunciationData = self->_pronunciationData;
  v6 = *((_QWORD *)v4 + 3);
  if (pronunciationData)
  {
    if (!v6)
      goto LABEL_9;
    -[CESRCorrectionPronunciation mergeFrom:](pronunciationData, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[CESRUserCorrectionsProfileEntry setPronunciationData:](self, "setPronunciationData:");
  }
  v4 = v8;
LABEL_9:
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 2) == 0)
  {
    if ((v4[10] & 4) == 0)
      goto LABEL_11;
LABEL_15:
    self->_tap2editCorrectionsCount = v4[9];
    *(_BYTE *)&self->_has |= 4u;
    if ((v4[10] & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  self->_spellingCorrectionsCount = v4[8];
  *(_BYTE *)&self->_has |= 2u;
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 4) != 0)
    goto LABEL_15;
LABEL_11:
  if ((v7 & 1) != 0)
  {
LABEL_12:
    self->_alternativesCorrectionsCount = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_13:

}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void)setCorrectedText:(id)a3
{
  objc_storeStrong((id *)&self->_correctedText, a3);
}

- (CESRCorrectionPronunciation)pronunciationData
{
  return self->_pronunciationData;
}

- (void)setPronunciationData:(id)a3
{
  objc_storeStrong((id *)&self->_pronunciationData, a3);
}

- (unsigned)spellingCorrectionsCount
{
  return self->_spellingCorrectionsCount;
}

- (unsigned)tap2editCorrectionsCount
{
  return self->_tap2editCorrectionsCount;
}

- (unsigned)alternativesCorrectionsCount
{
  return self->_alternativesCorrectionsCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pronunciationData, 0);
  objc_storeStrong((id *)&self->_correctedText, 0);
}

@end
