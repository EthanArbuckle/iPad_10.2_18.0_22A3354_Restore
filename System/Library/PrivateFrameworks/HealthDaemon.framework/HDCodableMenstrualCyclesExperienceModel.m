@implementation HDCodableMenstrualCyclesExperienceModel

- (BOOL)hasMenstrualCyclesExperienceModelData
{
  return self->_menstrualCyclesExperienceModelData != 0;
}

- (void)setEpoch:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_epoch = a3;
}

- (void)setHasEpoch:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEpoch
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
  v8.super_class = (Class)HDCodableMenstrualCyclesExperienceModel;
  -[HDCodableMenstrualCyclesExperienceModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMenstrualCyclesExperienceModel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *menstrualCyclesExperienceModelData;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  menstrualCyclesExperienceModelData = self->_menstrualCyclesExperienceModelData;
  if (menstrualCyclesExperienceModelData)
    objc_msgSend(v3, "setObject:forKey:", menstrualCyclesExperienceModelData, CFSTR("menstrualCyclesExperienceModelData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_epoch);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("epoch"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMenstrualCyclesExperienceModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_menstrualCyclesExperienceModelData)
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
  if (self->_menstrualCyclesExperienceModelData)
  {
    v5 = v4;
    objc_msgSend(v4, "setMenstrualCyclesExperienceModelData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_epoch;
    *((_BYTE *)v4 + 24) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_menstrualCyclesExperienceModelData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_epoch;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *menstrualCyclesExperienceModelData;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  menstrualCyclesExperienceModelData = self->_menstrualCyclesExperienceModelData;
  if ((unint64_t)menstrualCyclesExperienceModelData | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](menstrualCyclesExperienceModelData, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) != 0 && self->_epoch == *((_QWORD *)v4 + 1))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_menstrualCyclesExperienceModelData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_epoch;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[HDCodableMenstrualCyclesExperienceModel setMenstrualCyclesExperienceModelData:](self, "setMenstrualCyclesExperienceModelData:");
    v4 = v5;
  }
  if ((v4[3] & 1) != 0)
  {
    self->_epoch = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)menstrualCyclesExperienceModelData
{
  return self->_menstrualCyclesExperienceModelData;
}

- (void)setMenstrualCyclesExperienceModelData:(id)a3
{
  objc_storeStrong((id *)&self->_menstrualCyclesExperienceModelData, a3);
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menstrualCyclesExperienceModelData, 0);
}

@end
