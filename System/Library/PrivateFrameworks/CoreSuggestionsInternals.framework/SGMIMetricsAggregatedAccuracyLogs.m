@implementation SGMIMetricsAggregatedAccuracyLogs

- (void)setHoursSinceReference:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hoursSinceReference = a3;
}

- (void)setHasHoursSinceReference:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHoursSinceReference
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasActiveTrialMetadata
{
  return self->_activeTrialMetadata != 0;
}

- (BOOL)hasActiveAggregatedAccuracyLogForThePastFourWeeks
{
  return self->_activeAggregatedAccuracyLogForThePastFourWeeks != 0;
}

- (BOOL)hasActiveAggregatedAccuracyLogSinceModelInitialization
{
  return self->_activeAggregatedAccuracyLogSinceModelInitialization != 0;
}

- (BOOL)hasBackgroundTrialMetadata
{
  return self->_backgroundTrialMetadata != 0;
}

- (BOOL)hasBackgroundAggregatedAccuracyLogForThePastFourWeeks
{
  return self->_backgroundAggregatedAccuracyLogForThePastFourWeeks != 0;
}

- (BOOL)hasBackgroundAggregatedAccuracyLogSinceModelInitialization
{
  return self->_backgroundAggregatedAccuracyLogSinceModelInitialization != 0;
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
  v8.super_class = (Class)SGMIMetricsAggregatedAccuracyLogs;
  -[SGMIMetricsAggregatedAccuracyLogs description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsAggregatedAccuracyLogs dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  SGMIMetricsTrialMetadata *activeTrialMetadata;
  void *v6;
  SGMIMetricsAggregatedAccuracyLog *activeAggregatedAccuracyLogForThePastFourWeeks;
  void *v8;
  SGMIMetricsAggregatedAccuracyLog *activeAggregatedAccuracyLogSinceModelInitialization;
  void *v10;
  SGMIMetricsTrialMetadata *backgroundTrialMetadata;
  void *v12;
  SGMIMetricsAggregatedAccuracyLog *backgroundAggregatedAccuracyLogForThePastFourWeeks;
  void *v14;
  SGMIMetricsAggregatedAccuracyLog *backgroundAggregatedAccuracyLogSinceModelInitialization;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hoursSinceReference);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("hoursSinceReference"));

  }
  activeTrialMetadata = self->_activeTrialMetadata;
  if (activeTrialMetadata)
  {
    -[SGMIMetricsTrialMetadata dictionaryRepresentation](activeTrialMetadata, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("activeTrialMetadata"));

  }
  activeAggregatedAccuracyLogForThePastFourWeeks = self->_activeAggregatedAccuracyLogForThePastFourWeeks;
  if (activeAggregatedAccuracyLogForThePastFourWeeks)
  {
    -[SGMIMetricsAggregatedAccuracyLog dictionaryRepresentation](activeAggregatedAccuracyLogForThePastFourWeeks, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("activeAggregatedAccuracyLogForThePastFourWeeks"));

  }
  activeAggregatedAccuracyLogSinceModelInitialization = self->_activeAggregatedAccuracyLogSinceModelInitialization;
  if (activeAggregatedAccuracyLogSinceModelInitialization)
  {
    -[SGMIMetricsAggregatedAccuracyLog dictionaryRepresentation](activeAggregatedAccuracyLogSinceModelInitialization, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("activeAggregatedAccuracyLogSinceModelInitialization"));

  }
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  if (backgroundTrialMetadata)
  {
    -[SGMIMetricsTrialMetadata dictionaryRepresentation](backgroundTrialMetadata, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("backgroundTrialMetadata"));

  }
  backgroundAggregatedAccuracyLogForThePastFourWeeks = self->_backgroundAggregatedAccuracyLogForThePastFourWeeks;
  if (backgroundAggregatedAccuracyLogForThePastFourWeeks)
  {
    -[SGMIMetricsAggregatedAccuracyLog dictionaryRepresentation](backgroundAggregatedAccuracyLogForThePastFourWeeks, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("backgroundAggregatedAccuracyLogForThePastFourWeeks"));

  }
  backgroundAggregatedAccuracyLogSinceModelInitialization = self->_backgroundAggregatedAccuracyLogSinceModelInitialization;
  if (backgroundAggregatedAccuracyLogSinceModelInitialization)
  {
    -[SGMIMetricsAggregatedAccuracyLog dictionaryRepresentation](backgroundAggregatedAccuracyLogSinceModelInitialization, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("backgroundAggregatedAccuracyLogSinceModelInitialization"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsAggregatedAccuracyLogsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_activeTrialMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_activeAggregatedAccuracyLogForThePastFourWeeks)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_activeAggregatedAccuracyLogSinceModelInitialization)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_backgroundTrialMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_backgroundAggregatedAccuracyLogForThePastFourWeeks)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_backgroundAggregatedAccuracyLogSinceModelInitialization)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[14] = self->_hoursSinceReference;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  v5 = v4;
  if (self->_activeTrialMetadata)
  {
    objc_msgSend(v4, "setActiveTrialMetadata:");
    v4 = v5;
  }
  if (self->_activeAggregatedAccuracyLogForThePastFourWeeks)
  {
    objc_msgSend(v5, "setActiveAggregatedAccuracyLogForThePastFourWeeks:");
    v4 = v5;
  }
  if (self->_activeAggregatedAccuracyLogSinceModelInitialization)
  {
    objc_msgSend(v5, "setActiveAggregatedAccuracyLogSinceModelInitialization:");
    v4 = v5;
  }
  if (self->_backgroundTrialMetadata)
  {
    objc_msgSend(v5, "setBackgroundTrialMetadata:");
    v4 = v5;
  }
  if (self->_backgroundAggregatedAccuracyLogForThePastFourWeeks)
  {
    objc_msgSend(v5, "setBackgroundAggregatedAccuracyLogForThePastFourWeeks:");
    v4 = v5;
  }
  if (self->_backgroundAggregatedAccuracyLogSinceModelInitialization)
  {
    objc_msgSend(v5, "setBackgroundAggregatedAccuracyLogSinceModelInitialization:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_hoursSinceReference;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v7 = -[SGMIMetricsTrialMetadata copyWithZone:](self->_activeTrialMetadata, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[SGMIMetricsAggregatedAccuracyLog copyWithZone:](self->_activeAggregatedAccuracyLogForThePastFourWeeks, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[SGMIMetricsAggregatedAccuracyLog copyWithZone:](self->_activeAggregatedAccuracyLogSinceModelInitialization, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v13 = -[SGMIMetricsTrialMetadata copyWithZone:](self->_backgroundTrialMetadata, "copyWithZone:", a3);
  v14 = (void *)v6[6];
  v6[6] = v13;

  v15 = -[SGMIMetricsAggregatedAccuracyLog copyWithZone:](self->_backgroundAggregatedAccuracyLogForThePastFourWeeks, "copyWithZone:", a3);
  v16 = (void *)v6[4];
  v6[4] = v15;

  v17 = -[SGMIMetricsAggregatedAccuracyLog copyWithZone:](self->_backgroundAggregatedAccuracyLogSinceModelInitialization, "copyWithZone:", a3);
  v18 = (void *)v6[5];
  v6[5] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SGMIMetricsTrialMetadata *activeTrialMetadata;
  SGMIMetricsAggregatedAccuracyLog *activeAggregatedAccuracyLogForThePastFourWeeks;
  SGMIMetricsAggregatedAccuracyLog *activeAggregatedAccuracyLogSinceModelInitialization;
  SGMIMetricsTrialMetadata *backgroundTrialMetadata;
  SGMIMetricsAggregatedAccuracyLog *backgroundAggregatedAccuracyLogForThePastFourWeeks;
  SGMIMetricsAggregatedAccuracyLog *backgroundAggregatedAccuracyLogSinceModelInitialization;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_hoursSinceReference != *((_DWORD *)v4 + 14))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  activeTrialMetadata = self->_activeTrialMetadata;
  if ((unint64_t)activeTrialMetadata | *((_QWORD *)v4 + 3)
    && !-[SGMIMetricsTrialMetadata isEqual:](activeTrialMetadata, "isEqual:"))
  {
    goto LABEL_19;
  }
  activeAggregatedAccuracyLogForThePastFourWeeks = self->_activeAggregatedAccuracyLogForThePastFourWeeks;
  if ((unint64_t)activeAggregatedAccuracyLogForThePastFourWeeks | *((_QWORD *)v4 + 1))
  {
    if (!-[SGMIMetricsAggregatedAccuracyLog isEqual:](activeAggregatedAccuracyLogForThePastFourWeeks, "isEqual:"))
      goto LABEL_19;
  }
  activeAggregatedAccuracyLogSinceModelInitialization = self->_activeAggregatedAccuracyLogSinceModelInitialization;
  if ((unint64_t)activeAggregatedAccuracyLogSinceModelInitialization | *((_QWORD *)v4 + 2))
  {
    if (!-[SGMIMetricsAggregatedAccuracyLog isEqual:](activeAggregatedAccuracyLogSinceModelInitialization, "isEqual:"))
      goto LABEL_19;
  }
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  if ((unint64_t)backgroundTrialMetadata | *((_QWORD *)v4 + 6))
  {
    if (!-[SGMIMetricsTrialMetadata isEqual:](backgroundTrialMetadata, "isEqual:"))
      goto LABEL_19;
  }
  backgroundAggregatedAccuracyLogForThePastFourWeeks = self->_backgroundAggregatedAccuracyLogForThePastFourWeeks;
  if ((unint64_t)backgroundAggregatedAccuracyLogForThePastFourWeeks | *((_QWORD *)v4 + 4))
  {
    if (!-[SGMIMetricsAggregatedAccuracyLog isEqual:](backgroundAggregatedAccuracyLogForThePastFourWeeks, "isEqual:"))
      goto LABEL_19;
  }
  backgroundAggregatedAccuracyLogSinceModelInitialization = self->_backgroundAggregatedAccuracyLogSinceModelInitialization;
  if ((unint64_t)backgroundAggregatedAccuracyLogSinceModelInitialization | *((_QWORD *)v4 + 5))
    v11 = -[SGMIMetricsAggregatedAccuracyLog isEqual:](backgroundAggregatedAccuracyLogSinceModelInitialization, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_hoursSinceReference;
  else
    v3 = 0;
  v4 = -[SGMIMetricsTrialMetadata hash](self->_activeTrialMetadata, "hash") ^ v3;
  v5 = -[SGMIMetricsAggregatedAccuracyLog hash](self->_activeAggregatedAccuracyLogForThePastFourWeeks, "hash");
  v6 = v4 ^ v5 ^ -[SGMIMetricsAggregatedAccuracyLog hash](self->_activeAggregatedAccuracyLogSinceModelInitialization, "hash");
  v7 = -[SGMIMetricsTrialMetadata hash](self->_backgroundTrialMetadata, "hash");
  v8 = v7 ^ -[SGMIMetricsAggregatedAccuracyLog hash](self->_backgroundAggregatedAccuracyLogForThePastFourWeeks, "hash");
  return v6 ^ v8 ^ -[SGMIMetricsAggregatedAccuracyLog hash](self->_backgroundAggregatedAccuracyLogSinceModelInitialization, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  SGMIMetricsTrialMetadata *activeTrialMetadata;
  uint64_t v7;
  SGMIMetricsAggregatedAccuracyLog *activeAggregatedAccuracyLogForThePastFourWeeks;
  uint64_t v9;
  SGMIMetricsAggregatedAccuracyLog *activeAggregatedAccuracyLogSinceModelInitialization;
  uint64_t v11;
  SGMIMetricsTrialMetadata *backgroundTrialMetadata;
  uint64_t v13;
  SGMIMetricsAggregatedAccuracyLog *backgroundAggregatedAccuracyLogForThePastFourWeeks;
  uint64_t v15;
  SGMIMetricsAggregatedAccuracyLog *backgroundAggregatedAccuracyLogSinceModelInitialization;
  uint64_t v17;
  _QWORD *v18;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    self->_hoursSinceReference = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
  }
  activeTrialMetadata = self->_activeTrialMetadata;
  v7 = v5[3];
  v18 = v5;
  if (activeTrialMetadata)
  {
    if (!v7)
      goto LABEL_9;
    -[SGMIMetricsTrialMetadata mergeFrom:](activeTrialMetadata, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[SGMIMetricsAggregatedAccuracyLogs setActiveTrialMetadata:](self, "setActiveTrialMetadata:");
  }
  v5 = v18;
LABEL_9:
  activeAggregatedAccuracyLogForThePastFourWeeks = self->_activeAggregatedAccuracyLogForThePastFourWeeks;
  v9 = v5[1];
  if (activeAggregatedAccuracyLogForThePastFourWeeks)
  {
    if (!v9)
      goto LABEL_15;
    -[SGMIMetricsAggregatedAccuracyLog mergeFrom:](activeAggregatedAccuracyLogForThePastFourWeeks, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[SGMIMetricsAggregatedAccuracyLogs setActiveAggregatedAccuracyLogForThePastFourWeeks:](self, "setActiveAggregatedAccuracyLogForThePastFourWeeks:");
  }
  v5 = v18;
LABEL_15:
  activeAggregatedAccuracyLogSinceModelInitialization = self->_activeAggregatedAccuracyLogSinceModelInitialization;
  v11 = v5[2];
  if (activeAggregatedAccuracyLogSinceModelInitialization)
  {
    if (!v11)
      goto LABEL_21;
    -[SGMIMetricsAggregatedAccuracyLog mergeFrom:](activeAggregatedAccuracyLogSinceModelInitialization, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[SGMIMetricsAggregatedAccuracyLogs setActiveAggregatedAccuracyLogSinceModelInitialization:](self, "setActiveAggregatedAccuracyLogSinceModelInitialization:");
  }
  v5 = v18;
LABEL_21:
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  v13 = v5[6];
  if (backgroundTrialMetadata)
  {
    if (!v13)
      goto LABEL_27;
    -[SGMIMetricsTrialMetadata mergeFrom:](backgroundTrialMetadata, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[SGMIMetricsAggregatedAccuracyLogs setBackgroundTrialMetadata:](self, "setBackgroundTrialMetadata:");
  }
  v5 = v18;
LABEL_27:
  backgroundAggregatedAccuracyLogForThePastFourWeeks = self->_backgroundAggregatedAccuracyLogForThePastFourWeeks;
  v15 = v5[4];
  if (backgroundAggregatedAccuracyLogForThePastFourWeeks)
  {
    if (!v15)
      goto LABEL_33;
    -[SGMIMetricsAggregatedAccuracyLog mergeFrom:](backgroundAggregatedAccuracyLogForThePastFourWeeks, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_33;
    -[SGMIMetricsAggregatedAccuracyLogs setBackgroundAggregatedAccuracyLogForThePastFourWeeks:](self, "setBackgroundAggregatedAccuracyLogForThePastFourWeeks:");
  }
  v5 = v18;
LABEL_33:
  backgroundAggregatedAccuracyLogSinceModelInitialization = self->_backgroundAggregatedAccuracyLogSinceModelInitialization;
  v17 = v5[5];
  if (backgroundAggregatedAccuracyLogSinceModelInitialization)
  {
    if (v17)
    {
      -[SGMIMetricsAggregatedAccuracyLog mergeFrom:](backgroundAggregatedAccuracyLogSinceModelInitialization, "mergeFrom:");
LABEL_38:
      v5 = v18;
    }
  }
  else if (v17)
  {
    -[SGMIMetricsAggregatedAccuracyLogs setBackgroundAggregatedAccuracyLogSinceModelInitialization:](self, "setBackgroundAggregatedAccuracyLogSinceModelInitialization:");
    goto LABEL_38;
  }

}

- (unsigned)hoursSinceReference
{
  return self->_hoursSinceReference;
}

- (SGMIMetricsTrialMetadata)activeTrialMetadata
{
  return self->_activeTrialMetadata;
}

- (void)setActiveTrialMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_activeTrialMetadata, a3);
}

- (SGMIMetricsAggregatedAccuracyLog)activeAggregatedAccuracyLogForThePastFourWeeks
{
  return self->_activeAggregatedAccuracyLogForThePastFourWeeks;
}

- (void)setActiveAggregatedAccuracyLogForThePastFourWeeks:(id)a3
{
  objc_storeStrong((id *)&self->_activeAggregatedAccuracyLogForThePastFourWeeks, a3);
}

- (SGMIMetricsAggregatedAccuracyLog)activeAggregatedAccuracyLogSinceModelInitialization
{
  return self->_activeAggregatedAccuracyLogSinceModelInitialization;
}

- (void)setActiveAggregatedAccuracyLogSinceModelInitialization:(id)a3
{
  objc_storeStrong((id *)&self->_activeAggregatedAccuracyLogSinceModelInitialization, a3);
}

- (SGMIMetricsTrialMetadata)backgroundTrialMetadata
{
  return self->_backgroundTrialMetadata;
}

- (void)setBackgroundTrialMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTrialMetadata, a3);
}

- (SGMIMetricsAggregatedAccuracyLog)backgroundAggregatedAccuracyLogForThePastFourWeeks
{
  return self->_backgroundAggregatedAccuracyLogForThePastFourWeeks;
}

- (void)setBackgroundAggregatedAccuracyLogForThePastFourWeeks:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundAggregatedAccuracyLogForThePastFourWeeks, a3);
}

- (SGMIMetricsAggregatedAccuracyLog)backgroundAggregatedAccuracyLogSinceModelInitialization
{
  return self->_backgroundAggregatedAccuracyLogSinceModelInitialization;
}

- (void)setBackgroundAggregatedAccuracyLogSinceModelInitialization:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundAggregatedAccuracyLogSinceModelInitialization, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTrialMetadata, 0);
  objc_storeStrong((id *)&self->_backgroundAggregatedAccuracyLogSinceModelInitialization, 0);
  objc_storeStrong((id *)&self->_backgroundAggregatedAccuracyLogForThePastFourWeeks, 0);
  objc_storeStrong((id *)&self->_activeTrialMetadata, 0);
  objc_storeStrong((id *)&self->_activeAggregatedAccuracyLogSinceModelInitialization, 0);
  objc_storeStrong((id *)&self->_activeAggregatedAccuracyLogForThePastFourWeeks, 0);
}

@end
