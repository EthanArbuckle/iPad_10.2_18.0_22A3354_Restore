@implementation AMLUserLevelPhotosSearchMetrics

- (void)setIsProductionModel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isProductionModel = a3;
}

- (void)setHasIsProductionModel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsProductionModel
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasModelName
{
  return self->_modelName != 0;
}

- (void)setTtrDaily:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_ttrDaily = a3;
}

- (void)setHasTtrDaily:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTtrDaily
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTtrWeekly:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_ttrWeekly = a3;
}

- (void)setHasTtrWeekly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTtrWeekly
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCoverageDaily:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_coverageDaily = a3;
}

- (void)setHasCoverageDaily:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoverageDaily
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCoverageWeekly:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_coverageWeekly = a3;
}

- (void)setHasCoverageWeekly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCoverageWeekly
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNdcgDaily:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_ndcgDaily = a3;
}

- (void)setHasNdcgDaily:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNdcgDaily
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNdcgWeekly:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_ndcgWeekly = a3;
}

- (void)setHasNdcgWeekly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNdcgWeekly
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasMetricDefinitionVersion
{
  return self->_metricDefinitionVersion != 0;
}

- (int)uiSurface
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_uiSurface;
  else
    return 0;
}

- (void)setUiSurface:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_uiSurface = a3;
}

- (void)setHasUiSurface:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUiSurface
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)uiSurfaceAsString:(int)a3
{
  if (a3 < 4)
    return off_250752F68[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUiSurface:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMLUISurfaceTypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMLUISurfaceTypeSpotlight")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AMLUISurfaceTypePhotosApp")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AMLUISurfaceTypeStoryTellingBackground")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasTrialDeploymentId
{
  return self->_trialDeploymentId != 0;
}

- (BOOL)hasTrialExperimentId
{
  return self->_trialExperimentId != 0;
}

- (BOOL)hasTrialTreatmentId
{
  return self->_trialTreatmentId != 0;
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
  v8.super_class = (Class)AMLUserLevelPhotosSearchMetrics;
  -[AMLUserLevelPhotosSearchMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMLUserLevelPhotosSearchMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *modelName;
  char has;
  void *v7;
  NSString *metricDefinitionVersion;
  uint64_t uiSurface;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *trialDeploymentId;
  NSString *trialExperimentId;
  NSString *trialTreatmentId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isProductionModel);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("isProductionModel"));

  }
  modelName = self->_modelName;
  if (modelName)
    objc_msgSend(v3, "setObject:forKey:", modelName, CFSTR("modelName"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_ttrDaily);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("ttrDaily"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_ttrWeekly);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("ttrWeekly"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_coverageDaily);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("coverageDaily"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_coverageWeekly);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("coverageWeekly"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_ndcgDaily);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ndcgDaily"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_ndcgWeekly);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("ndcgWeekly"));

  }
LABEL_12:
  metricDefinitionVersion = self->_metricDefinitionVersion;
  if (metricDefinitionVersion)
    objc_msgSend(v3, "setObject:forKey:", metricDefinitionVersion, CFSTR("metricDefinitionVersion"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    uiSurface = self->_uiSurface;
    if (uiSurface >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_uiSurface);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_250752F68[uiSurface];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("uiSurface"));

  }
  trialDeploymentId = self->_trialDeploymentId;
  if (trialDeploymentId)
    objc_msgSend(v3, "setObject:forKey:", trialDeploymentId, CFSTR("trialDeploymentId"));
  trialExperimentId = self->_trialExperimentId;
  if (trialExperimentId)
    objc_msgSend(v3, "setObject:forKey:", trialExperimentId, CFSTR("trialExperimentId"));
  trialTreatmentId = self->_trialTreatmentId;
  if (trialTreatmentId)
    objc_msgSend(v3, "setObject:forKey:", trialTreatmentId, CFSTR("trialTreatmentId"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AMLUserLevelPhotosSearchMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_modelName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_12:
  if (self->_metricDefinitionVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_trialDeploymentId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_trialExperimentId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_trialTreatmentId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    v4[100] = self->_isProductionModel;
    v4[104] |= 0x80u;
  }
  v6 = v4;
  if (self->_modelName)
  {
    objc_msgSend(v4, "setModelName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_ttrDaily;
    v4[104] |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_ttrWeekly;
  v4[104] |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_coverageDaily;
  v4[104] |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_coverageWeekly;
  v4[104] |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_27:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_ndcgDaily;
  v4[104] |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_ndcgWeekly;
    v4[104] |= 8u;
  }
LABEL_12:
  if (self->_metricDefinitionVersion)
  {
    objc_msgSend(v6, "setMetricDefinitionVersion:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_uiSurface;
    v4[104] |= 0x40u;
  }
  if (self->_trialDeploymentId)
  {
    objc_msgSend(v6, "setTrialDeploymentId:");
    v4 = v6;
  }
  if (self->_trialExperimentId)
  {
    objc_msgSend(v6, "setTrialExperimentId:");
    v4 = v6;
  }
  if (self->_trialTreatmentId)
  {
    objc_msgSend(v6, "setTrialTreatmentId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_BYTE *)(v5 + 100) = self->_isProductionModel;
    *(_BYTE *)(v5 + 104) |= 0x80u;
  }
  v7 = -[NSString copyWithZone:](self->_modelName, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v7;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(double *)(v6 + 40) = self->_ttrDaily;
    *(_BYTE *)(v6 + 104) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v6 + 48) = self->_ttrWeekly;
  *(_BYTE *)(v6 + 104) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *(double *)(v6 + 8) = self->_coverageDaily;
  *(_BYTE *)(v6 + 104) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *(double *)(v6 + 16) = self->_coverageWeekly;
  *(_BYTE *)(v6 + 104) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  *(double *)(v6 + 24) = self->_ndcgDaily;
  *(_BYTE *)(v6 + 104) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_9:
    *(double *)(v6 + 32) = self->_ndcgWeekly;
    *(_BYTE *)(v6 + 104) |= 8u;
  }
LABEL_10:
  v10 = -[NSString copyWithZone:](self->_metricDefinitionVersion, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v10;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_uiSurface;
    *(_BYTE *)(v6 + 104) |= 0x40u;
  }
  v12 = -[NSString copyWithZone:](self->_trialDeploymentId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v12;

  v14 = -[NSString copyWithZone:](self->_trialExperimentId, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v14;

  v16 = -[NSString copyWithZone:](self->_trialTreatmentId, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v16;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  $5E3C5A6893583B82D06FCB23CB312A5A has;
  int v6;
  NSString *modelName;
  NSString *metricDefinitionVersion;
  NSString *trialDeploymentId;
  NSString *trialExperimentId;
  NSString *trialTreatmentId;
  char v12;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  has = self->_has;
  v6 = v4[104];
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0)
      goto LABEL_58;
    if (self->_isProductionModel)
    {
      if (!v4[100])
        goto LABEL_58;
    }
    else if (v4[100])
    {
      goto LABEL_58;
    }
  }
  else if (v6 < 0)
  {
    goto LABEL_58;
  }
  modelName = self->_modelName;
  if ((unint64_t)modelName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](modelName, "isEqual:"))
      goto LABEL_58;
    *(_BYTE *)&has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v4[104] & 0x10) == 0 || self->_ttrDaily != *((double *)v4 + 5))
      goto LABEL_58;
  }
  else if ((v4[104] & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v4[104] & 0x20) == 0 || self->_ttrWeekly != *((double *)v4 + 6))
      goto LABEL_58;
  }
  else if ((v4[104] & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v4[104] & 1) == 0 || self->_coverageDaily != *((double *)v4 + 1))
      goto LABEL_58;
  }
  else if ((v4[104] & 1) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v4[104] & 2) == 0 || self->_coverageWeekly != *((double *)v4 + 2))
      goto LABEL_58;
  }
  else if ((v4[104] & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v4[104] & 4) == 0 || self->_ndcgDaily != *((double *)v4 + 3))
      goto LABEL_58;
  }
  else if ((v4[104] & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v4[104] & 8) == 0 || self->_ndcgWeekly != *((double *)v4 + 4))
      goto LABEL_58;
  }
  else if ((v4[104] & 8) != 0)
  {
    goto LABEL_58;
  }
  metricDefinitionVersion = self->_metricDefinitionVersion;
  if ((unint64_t)metricDefinitionVersion | *((_QWORD *)v4 + 7))
  {
    if (-[NSString isEqual:](metricDefinitionVersion, "isEqual:"))
    {
      *(_BYTE *)&has = self->_has;
      goto LABEL_47;
    }
LABEL_58:
    v12 = 0;
    goto LABEL_59;
  }
LABEL_47:
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v4[104] & 0x40) == 0 || self->_uiSurface != *((_DWORD *)v4 + 24))
      goto LABEL_58;
  }
  else if ((v4[104] & 0x40) != 0)
  {
    goto LABEL_58;
  }
  trialDeploymentId = self->_trialDeploymentId;
  if ((unint64_t)trialDeploymentId | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](trialDeploymentId, "isEqual:"))
  {
    goto LABEL_58;
  }
  trialExperimentId = self->_trialExperimentId;
  if ((unint64_t)trialExperimentId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](trialExperimentId, "isEqual:"))
      goto LABEL_58;
  }
  trialTreatmentId = self->_trialTreatmentId;
  if ((unint64_t)trialTreatmentId | *((_QWORD *)v4 + 11))
    v12 = -[NSString isEqual:](trialTreatmentId, "isEqual:");
  else
    v12 = 1;
LABEL_59:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double ttrDaily;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double ttrWeekly;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double coverageDaily;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  double coverageWeekly;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  double ndcgDaily;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  double ndcgWeekly;
  double v32;
  long double v33;
  double v34;
  NSUInteger v35;
  uint64_t v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;
  uint64_t v41;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v41 = 2654435761 * self->_isProductionModel;
  else
    v41 = 0;
  v3 = -[NSString hash](self->_modelName, "hash");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    ttrDaily = self->_ttrDaily;
    v7 = -ttrDaily;
    if (ttrDaily >= 0.0)
      v7 = self->_ttrDaily;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 0x20) != 0)
  {
    ttrWeekly = self->_ttrWeekly;
    v12 = -ttrWeekly;
    if (ttrWeekly >= 0.0)
      v12 = self->_ttrWeekly;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 1) != 0)
  {
    coverageDaily = self->_coverageDaily;
    v17 = -coverageDaily;
    if (coverageDaily >= 0.0)
      v17 = self->_coverageDaily;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((has & 2) != 0)
  {
    coverageWeekly = self->_coverageWeekly;
    v22 = -coverageWeekly;
    if (coverageWeekly >= 0.0)
      v22 = self->_coverageWeekly;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((has & 4) != 0)
  {
    ndcgDaily = self->_ndcgDaily;
    v27 = -ndcgDaily;
    if (ndcgDaily >= 0.0)
      v27 = self->_ndcgDaily;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  if ((has & 8) != 0)
  {
    ndcgWeekly = self->_ndcgWeekly;
    v32 = -ndcgWeekly;
    if (ndcgWeekly >= 0.0)
      v32 = self->_ndcgWeekly;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  v35 = -[NSString hash](self->_metricDefinitionVersion, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v36 = 2654435761 * self->_uiSurface;
  else
    v36 = 0;
  v37 = v3 ^ v41 ^ v5 ^ v10 ^ v15 ^ v20 ^ v25 ^ v30 ^ v35;
  v38 = v36 ^ -[NSString hash](self->_trialDeploymentId, "hash");
  v39 = v37 ^ v38 ^ -[NSString hash](self->_trialExperimentId, "hash");
  return v39 ^ -[NSString hash](self->_trialTreatmentId, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char v5;
  char *v6;

  v4 = (char *)a3;
  if (v4[104] < 0)
  {
    self->_isProductionModel = v4[100];
    *(_BYTE *)&self->_has |= 0x80u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[AMLUserLevelPhotosSearchMetrics setModelName:](self, "setModelName:");
    v4 = v6;
  }
  v5 = v4[104];
  if ((v5 & 0x10) != 0)
  {
    self->_ttrDaily = *((double *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = v4[104];
    if ((v5 & 0x20) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0)
        goto LABEL_8;
      goto LABEL_25;
    }
  }
  else if ((v4[104] & 0x20) == 0)
  {
    goto LABEL_7;
  }
  self->_ttrWeekly = *((double *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = v4[104];
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  self->_coverageDaily = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = v4[104];
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  self->_coverageWeekly = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = v4[104];
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_27:
  self->_ndcgDaily = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((v4[104] & 8) != 0)
  {
LABEL_11:
    self->_ndcgWeekly = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 7))
  {
    -[AMLUserLevelPhotosSearchMetrics setMetricDefinitionVersion:](self, "setMetricDefinitionVersion:");
    v4 = v6;
  }
  if ((v4[104] & 0x40) != 0)
  {
    self->_uiSurface = *((_DWORD *)v4 + 24);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[AMLUserLevelPhotosSearchMetrics setTrialDeploymentId:](self, "setTrialDeploymentId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[AMLUserLevelPhotosSearchMetrics setTrialExperimentId:](self, "setTrialExperimentId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[AMLUserLevelPhotosSearchMetrics setTrialTreatmentId:](self, "setTrialTreatmentId:");
    v4 = v6;
  }

}

- (BOOL)isProductionModel
{
  return self->_isProductionModel;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_storeStrong((id *)&self->_modelName, a3);
}

- (double)ttrDaily
{
  return self->_ttrDaily;
}

- (double)ttrWeekly
{
  return self->_ttrWeekly;
}

- (double)coverageDaily
{
  return self->_coverageDaily;
}

- (double)coverageWeekly
{
  return self->_coverageWeekly;
}

- (double)ndcgDaily
{
  return self->_ndcgDaily;
}

- (double)ndcgWeekly
{
  return self->_ndcgWeekly;
}

- (NSString)metricDefinitionVersion
{
  return self->_metricDefinitionVersion;
}

- (void)setMetricDefinitionVersion:(id)a3
{
  objc_storeStrong((id *)&self->_metricDefinitionVersion, a3);
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialDeploymentId, a3);
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialExperimentId, a3);
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialTreatmentId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_metricDefinitionVersion, 0);
}

@end
