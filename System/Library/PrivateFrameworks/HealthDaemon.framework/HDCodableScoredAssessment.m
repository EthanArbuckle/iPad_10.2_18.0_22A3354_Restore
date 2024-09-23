@implementation HDCodableScoredAssessment

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setScore:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAnswers
{
  return self->_answers != 0;
}

- (void)setRisk:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_risk = a3;
}

- (void)setHasRisk:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRisk
{
  return *(_BYTE *)&self->_has & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableScoredAssessment;
  -[HDCodableScoredAssessment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableScoredAssessment dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSample *sample;
  void *v5;
  void *v6;
  NSData *answers;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_score);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("score"));

  }
  answers = self->_answers;
  if (answers)
    objc_msgSend(v3, "setObject:forKey:", answers, CFSTR("answers"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_risk);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("risk"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableScoredAssessmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_answers)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_score;
    *((_BYTE *)v4 + 40) |= 2u;
  }
  if (self->_answers)
  {
    objc_msgSend(v5, "setAnswers:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_risk;
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_score;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_answers, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_risk;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  char has;
  char v7;
  NSData *answers;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 4))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_16;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 40);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_score != *((_QWORD *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  answers = self->_answers;
  if ((unint64_t)answers | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](answers, "isEqual:"))
    {
LABEL_16:
      v9 = 0;
      goto LABEL_17;
    }
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 40);
  }
  v9 = (v7 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_risk != *((_QWORD *)v4 + 1))
      goto LABEL_16;
    v9 = 1;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_score;
  else
    v4 = 0;
  v5 = -[NSData hash](self->_answers, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_risk;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableSample *sample;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  sample = self->_sample;
  v6 = v4[4];
  v7 = v4;
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableScoredAssessment setSample:](self, "setSample:");
  }
  v4 = v7;
LABEL_7:
  if ((v4[5] & 2) != 0)
  {
    self->_score = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (v4[3])
  {
    -[HDCodableScoredAssessment setAnswers:](self, "setAnswers:");
    v4 = v7;
  }
  if ((v4[5] & 1) != 0)
  {
    self->_risk = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (int64_t)score
{
  return self->_score;
}

- (NSData)answers
{
  return self->_answers;
}

- (void)setAnswers:(id)a3
{
  objc_storeStrong((id *)&self->_answers, a3);
}

- (int64_t)risk
{
  return self->_risk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_answers, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF227240)
    && (-[HDCodableScoredAssessment sample](self, "sample"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "applyToObject:", v4),
        v5,
        v6))
  {
    objc_msgSend(v4, "_setScore:", -[HDCodableScoredAssessment score](self, "score"));
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = objc_opt_class();
    -[HDCodableScoredAssessment answers](self, "answers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v7, "unarchivedArrayOfObjectsOfClass:fromData:error:", v8, v9, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;

    v12 = v10 != 0;
    if (v10)
    {
      objc_msgSend(v4, "_setAnswers:", v10);
      objc_msgSend(v4, "_setRisk:", -[HDCodableScoredAssessment risk](self, "risk"));
    }
    else if (v11)
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB5318];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5318], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Error unarchiving answers: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
