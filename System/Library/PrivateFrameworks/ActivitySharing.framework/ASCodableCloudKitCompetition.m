@implementation ASCodableCloudKitCompetition

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ASCodableCloudKitCompetition;
  -[ASCodableCloudKitCompetition dealloc](&v3, sel_dealloc);
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setCurrentCacheIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_currentCacheIndex = a3;
}

- (void)setHasCurrentCacheIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCurrentCacheIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)scoresCount
{
  return self->_scores.count;
}

- (int64_t)scores
{
  return self->_scores.list;
}

- (void)clearScores
{
  PBRepeatedInt64Clear();
}

- (void)addScores:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)scoresAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_scores;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_scores = &self->_scores;
  count = self->_scores.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_scores->list[a3];
}

- (void)setScores:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)opponentScoresCount
{
  return self->_opponentScores.count;
}

- (int64_t)opponentScores
{
  return self->_opponentScores.list;
}

- (void)clearOpponentScores
{
  PBRepeatedInt64Clear();
}

- (void)addOpponentScores:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)opponentScoresAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_opponentScores;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_opponentScores = &self->_opponentScores;
  count = self->_opponentScores.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_opponentScores->list[a3];
}

- (void)setOpponentScores:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (BOOL)hasStartDateComponents
{
  return self->_startDateComponents != 0;
}

- (BOOL)hasDurationDateComponents
{
  return self->_durationDateComponents != 0;
}

- (unint64_t)preferredVictoryBadgeStylesCount
{
  return self->_preferredVictoryBadgeStyles.count;
}

- (int)preferredVictoryBadgeStyles
{
  return self->_preferredVictoryBadgeStyles.list;
}

- (void)clearPreferredVictoryBadgeStyles
{
  PBRepeatedInt32Clear();
}

- (void)addPreferredVictoryBadgeStyles:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)preferredVictoryBadgeStylesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_preferredVictoryBadgeStyles;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_preferredVictoryBadgeStyles = &self->_preferredVictoryBadgeStyles;
  count = self->_preferredVictoryBadgeStyles.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_preferredVictoryBadgeStyles->list[a3];
}

- (void)setPreferredVictoryBadgeStyles:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setMaximumNumberOfPointsPerDay:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_maximumNumberOfPointsPerDay = a3;
}

- (void)setHasMaximumNumberOfPointsPerDay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaximumNumberOfPointsPerDay
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ASCodableCloudKitCompetition;
  -[ASCodableCloudKitCompetition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitCompetition dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *uuid;
  void *v6;
  void *v7;
  void *v8;
  ASCodableCloudKitDateComponents *startDateComponents;
  void *v10;
  ASCodableCloudKitDateComponents *durationDateComponents;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_currentCacheIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("currentCacheIndex"));

  }
  PBRepeatedInt64NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("scores"));

  PBRepeatedInt64NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("opponentScores"));

  startDateComponents = self->_startDateComponents;
  if (startDateComponents)
  {
    -[ASCodableCloudKitDateComponents dictionaryRepresentation](startDateComponents, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("startDateComponents"));

  }
  durationDateComponents = self->_durationDateComponents;
  if (durationDateComponents)
  {
    -[ASCodableCloudKitDateComponents dictionaryRepresentation](durationDateComponents, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("durationDateComponents"));

  }
  PBRepeatedInt32NSArray();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("preferredVictoryBadgeStyles"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_maximumNumberOfPointsPerDay);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("maximumNumberOfPointsPerDay"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableCloudKitCompetitionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v8;
  }
  if (self->_scores.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v8;
      ++v5;
    }
    while (v5 < self->_scores.count);
  }
  if (self->_opponentScores.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v8;
      ++v6;
    }
    while (v6 < self->_opponentScores.count);
  }
  if (self->_startDateComponents)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if (self->_durationDateComponents)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if (self->_preferredVictoryBadgeStyles.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v8;
      ++v7;
    }
    while (v7 < self->_preferredVictoryBadgeStyles.count);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  id v14;

  v4 = a3;
  v14 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v14;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 10) = self->_currentCacheIndex;
    *((_BYTE *)v4 + 120) |= 1u;
  }
  if (-[ASCodableCloudKitCompetition scoresCount](self, "scoresCount"))
  {
    objc_msgSend(v14, "clearScores");
    v5 = -[ASCodableCloudKitCompetition scoresCount](self, "scoresCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v14, "addScores:", -[ASCodableCloudKitCompetition scoresAtIndex:](self, "scoresAtIndex:", i));
    }
  }
  if (-[ASCodableCloudKitCompetition opponentScoresCount](self, "opponentScoresCount"))
  {
    objc_msgSend(v14, "clearOpponentScores");
    v8 = -[ASCodableCloudKitCompetition opponentScoresCount](self, "opponentScoresCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v14, "addOpponentScores:", -[ASCodableCloudKitCompetition opponentScoresAtIndex:](self, "opponentScoresAtIndex:", j));
    }
  }
  if (self->_startDateComponents)
    objc_msgSend(v14, "setStartDateComponents:");
  if (self->_durationDateComponents)
    objc_msgSend(v14, "setDurationDateComponents:");
  if (-[ASCodableCloudKitCompetition preferredVictoryBadgeStylesCount](self, "preferredVictoryBadgeStylesCount"))
  {
    objc_msgSend(v14, "clearPreferredVictoryBadgeStyles");
    v11 = -[ASCodableCloudKitCompetition preferredVictoryBadgeStylesCount](self, "preferredVictoryBadgeStylesCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(v14, "addPreferredVictoryBadgeStyles:", -[ASCodableCloudKitCompetition preferredVictoryBadgeStylesAtIndex:](self, "preferredVictoryBadgeStylesAtIndex:", k));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v14 + 11) = self->_maximumNumberOfPointsPerDay;
    *((_BYTE *)v14 + 120) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_currentCacheIndex;
    *(_BYTE *)(v5 + 120) |= 1u;
  }
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  v8 = -[ASCodableCloudKitDateComponents copyWithZone:](self->_startDateComponents, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v8;

  v10 = -[ASCodableCloudKitDateComponents copyWithZone:](self->_durationDateComponents, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v10;

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 88) = self->_maximumNumberOfPointsPerDay;
    *(_BYTE *)(v5 + 120) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *uuid;
  ASCodableCloudKitDateComponents *startDateComponents;
  ASCodableCloudKitDateComponents *durationDateComponents;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 14))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 1) == 0 || self->_currentCacheIndex != *((_QWORD *)v4 + 10))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
LABEL_20:
    v8 = 0;
    goto LABEL_21;
  }
  if (!PBRepeatedInt64IsEqual())
    goto LABEL_20;
  if (!PBRepeatedInt64IsEqual())
    goto LABEL_20;
  startDateComponents = self->_startDateComponents;
  if ((unint64_t)startDateComponents | *((_QWORD *)v4 + 13))
  {
    if (!-[ASCodableCloudKitDateComponents isEqual:](startDateComponents, "isEqual:"))
      goto LABEL_20;
  }
  durationDateComponents = self->_durationDateComponents;
  if ((unint64_t)durationDateComponents | *((_QWORD *)v4 + 12))
  {
    if (!-[ASCodableCloudKitDateComponents isEqual:](durationDateComponents, "isEqual:"))
      goto LABEL_20;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_20;
  v8 = (*((_BYTE *)v4 + 120) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 2) == 0 || self->_maximumNumberOfPointsPerDay != *((_QWORD *)v4 + 11))
      goto LABEL_20;
    v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSData hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_currentCacheIndex;
  else
    v4 = 0;
  v5 = PBRepeatedInt64Hash();
  v6 = PBRepeatedInt64Hash();
  v7 = -[ASCodableCloudKitDateComponents hash](self->_startDateComponents, "hash");
  v8 = -[ASCodableCloudKitDateComponents hash](self->_durationDateComponents, "hash");
  v9 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761 * self->_maximumNumberOfPointsPerDay;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  ASCodableCloudKitDateComponents *startDateComponents;
  int64_t *v12;
  int64_t v13;
  ASCodableCloudKitDateComponents *durationDateComponents;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  int64_t *v19;

  v4 = (int64_t *)a3;
  v19 = v4;
  if (v4[14])
  {
    -[ASCodableCloudKitCompetition setUuid:](self, "setUuid:");
    v4 = v19;
  }
  if ((v4[15] & 1) != 0)
  {
    self->_currentCacheIndex = v4[10];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = objc_msgSend(v4, "scoresCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[ASCodableCloudKitCompetition addScores:](self, "addScores:", objc_msgSend(v19, "scoresAtIndex:", i));
  }
  v8 = objc_msgSend(v19, "opponentScoresCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[ASCodableCloudKitCompetition addOpponentScores:](self, "addOpponentScores:", objc_msgSend(v19, "opponentScoresAtIndex:", j));
  }
  startDateComponents = self->_startDateComponents;
  v12 = v19;
  v13 = v19[13];
  if (startDateComponents)
  {
    if (!v13)
      goto LABEL_17;
    -[ASCodableCloudKitDateComponents mergeFrom:](startDateComponents, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_17;
    -[ASCodableCloudKitCompetition setStartDateComponents:](self, "setStartDateComponents:");
  }
  v12 = v19;
LABEL_17:
  durationDateComponents = self->_durationDateComponents;
  v15 = v12[12];
  if (durationDateComponents)
  {
    if (!v15)
      goto LABEL_23;
    -[ASCodableCloudKitDateComponents mergeFrom:](durationDateComponents, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_23;
    -[ASCodableCloudKitCompetition setDurationDateComponents:](self, "setDurationDateComponents:");
  }
  v12 = v19;
LABEL_23:
  v16 = objc_msgSend(v12, "preferredVictoryBadgeStylesCount");
  if (v16)
  {
    v17 = v16;
    for (k = 0; k != v17; ++k)
      -[ASCodableCloudKitCompetition addPreferredVictoryBadgeStyles:](self, "addPreferredVictoryBadgeStyles:", objc_msgSend(v19, "preferredVictoryBadgeStylesAtIndex:", k));
  }
  if ((v19[15] & 2) != 0)
  {
    self->_maximumNumberOfPointsPerDay = v19[11];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (int64_t)currentCacheIndex
{
  return self->_currentCacheIndex;
}

- (ASCodableCloudKitDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (void)setStartDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_startDateComponents, a3);
}

- (ASCodableCloudKitDateComponents)durationDateComponents
{
  return self->_durationDateComponents;
}

- (void)setDurationDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_durationDateComponents, a3);
}

- (int64_t)maximumNumberOfPointsPerDay
{
  return self->_maximumNumberOfPointsPerDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
  objc_storeStrong((id *)&self->_durationDateComponents, 0);
}

@end
