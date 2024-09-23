@implementation ATXCandidateRelevanceModelPBModelMetrics

- (BOOL)hasBlendingABGroup
{
  return self->_blendingABGroup != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setPipelineEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_pipelineEnabled = a3;
}

- (void)setHasPipelineEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasPipelineEnabled
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasTrainedModel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_hasTrainedModel = a3;
}

- (void)setHasHasTrainedModel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasHasTrainedModel
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasDefaultHyperParams:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_hasDefaultHyperParams = a3;
}

- (void)setHasHasDefaultHyperParams:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasHasDefaultHyperParams
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasModelType
{
  return self->_modelType != 0;
}

- (void)setAvgNumberOfModelWeights:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_avgNumberOfModelWeights = a3;
}

- (void)setHasAvgNumberOfModelWeights:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAvgNumberOfModelWeights
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setAvgNumberOfNonZeroModelWeights:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_avgNumberOfNonZeroModelWeights = a3;
}

- (void)setHasAvgNumberOfNonZeroModelWeights:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAvgNumberOfNonZeroModelWeights
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumberOfCandidateModels:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numberOfCandidateModels = a3;
}

- (void)setHasNumberOfCandidateModels:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumberOfCandidateModels
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasLogisticRegressionRegularizationStrategy
{
  return self->_logisticRegressionRegularizationStrategy != 0;
}

- (void)setLogisticRegressionRegularizationRate:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_logisticRegressionRegularizationRate = a3;
}

- (void)setHasLogisticRegressionRegularizationRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLogisticRegressionRegularizationRate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLogisticRegressionRegularizationL1Ratio:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_logisticRegressionRegularizationL1Ratio = a3;
}

- (void)setHasLogisticRegressionRegularizationL1Ratio:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLogisticRegressionRegularizationL1Ratio
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLearningRate:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_learningRate = a3;
}

- (void)setHasLearningRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLearningRate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMinIterations:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_minIterations = a3;
}

- (void)setHasMinIterations:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMinIterations
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setStoppingThreshold:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_stoppingThreshold = a3;
}

- (void)setHasStoppingThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasStoppingThreshold
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTrainDataNumberOfPositiveSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_trainDataNumberOfPositiveSamples = a3;
}

- (void)setHasTrainDataNumberOfPositiveSamples:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTrainDataNumberOfPositiveSamples
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTrainDataNumberOfSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_trainDataNumberOfSamples = a3;
}

- (void)setHasTrainDataNumberOfSamples:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTrainDataNumberOfSamples
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setTrainDataNumberOfDaysWithPositiveSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_trainDataNumberOfDaysWithPositiveSamples = a3;
}

- (void)setHasTrainDataNumberOfDaysWithPositiveSamples:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTrainDataNumberOfDaysWithPositiveSamples
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTrainDataNumberOfCandidates:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_trainDataNumberOfCandidates = a3;
}

- (void)setHasTrainDataNumberOfCandidates:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTrainDataNumberOfCandidates
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasExecutableType
{
  return self->_executableType != 0;
}

- (void)setModelAgeInDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_modelAgeInDays = a3;
}

- (void)setHasModelAgeInDays:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasModelAgeInDays
{
  return (*(_WORD *)&self->_has >> 6) & 1;
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
  v8.super_class = (Class)ATXCandidateRelevanceModelPBModelMetrics;
  -[ATXCandidateRelevanceModelPBModelMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceModelPBModelMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *blendingABGroup;
  NSString *abGroup;
  NSString *clientModelId;
  $858CD4590B3952EEF70BA3EF88502D79 has;
  void *v10;
  void *v11;
  NSString *modelType;
  __int16 v13;
  void *v14;
  NSString *logisticRegressionRegularizationStrategy;
  __int16 v16;
  void *v17;
  NSString *executableType;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  blendingABGroup = self->_blendingABGroup;
  if (blendingABGroup)
    objc_msgSend(v3, "setObject:forKey:", blendingABGroup, CFSTR("blendingABGroup"));
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v5, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v5, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_pipelineEnabled);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v31, CFSTR("pipelineEnabled"));

  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasTrainedModel);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("hasTrainedModel"));

    *(_WORD *)&has = self->_has;
  }
LABEL_10:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasDefaultHyperParams);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("hasDefaultHyperParams"));

  }
  modelType = self->_modelType;
  if (modelType)
    objc_msgSend(v5, "setObject:forKey:", modelType, CFSTR("modelType"));
  v13 = (__int16)self->_has;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_avgNumberOfModelWeights);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("avgNumberOfModelWeights"));

    v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_16:
      if ((v13 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_avgNumberOfNonZeroModelWeights);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("avgNumberOfNonZeroModelWeights"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfCandidateModels);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("numberOfCandidateModels"));

  }
LABEL_18:
  logisticRegressionRegularizationStrategy = self->_logisticRegressionRegularizationStrategy;
  if (logisticRegressionRegularizationStrategy)
    objc_msgSend(v5, "setObject:forKey:", logisticRegressionRegularizationStrategy, CFSTR("logisticRegressionRegularizationStrategy"));
  v16 = (__int16)self->_has;
  if ((v16 & 0x10) != 0)
  {
    *(float *)&v4 = self->_logisticRegressionRegularizationRate;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("logisticRegressionRegularizationRate"));

    v16 = (__int16)self->_has;
    if ((v16 & 8) == 0)
    {
LABEL_22:
      if ((v16 & 4) == 0)
        goto LABEL_23;
      goto LABEL_40;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_22;
  }
  *(float *)&v4 = self->_logisticRegressionRegularizationL1Ratio;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("logisticRegressionRegularizationL1Ratio"));

  v16 = (__int16)self->_has;
  if ((v16 & 4) == 0)
  {
LABEL_23:
    if ((v16 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_41;
  }
LABEL_40:
  *(float *)&v4 = self->_learningRate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("learningRate"));

  v16 = (__int16)self->_has;
  if ((v16 & 0x20) == 0)
  {
LABEL_24:
    if ((v16 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_minIterations);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("minIterations"));

  v16 = (__int16)self->_has;
  if ((v16 & 0x100) == 0)
  {
LABEL_25:
    if ((v16 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_43;
  }
LABEL_42:
  *(float *)&v4 = self->_stoppingThreshold;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("stoppingThreshold"));

  v16 = (__int16)self->_has;
  if ((v16 & 0x800) == 0)
  {
LABEL_26:
    if ((v16 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_trainDataNumberOfPositiveSamples);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("trainDataNumberOfPositiveSamples"));

  v16 = (__int16)self->_has;
  if ((v16 & 0x1000) == 0)
  {
LABEL_27:
    if ((v16 & 0x400) == 0)
      goto LABEL_28;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_trainDataNumberOfSamples);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v29, CFSTR("trainDataNumberOfSamples"));

  v16 = (__int16)self->_has;
  if ((v16 & 0x400) == 0)
  {
LABEL_28:
    if ((v16 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_trainDataNumberOfDaysWithPositiveSamples);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("trainDataNumberOfDaysWithPositiveSamples"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_trainDataNumberOfCandidates);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("trainDataNumberOfCandidates"));

  }
LABEL_30:
  executableType = self->_executableType;
  if (executableType)
    objc_msgSend(v5, "setObject:forKey:", executableType, CFSTR("executableType"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_modelAgeInDays);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("modelAgeInDays"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return ATXCandidateRelevanceModelPBModelMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $858CD4590B3952EEF70BA3EF88502D79 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_blendingABGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    PBDataWriterWriteBOOLField();
    v4 = v8;
    *(_WORD *)&has = self->_has;
  }
LABEL_10:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_modelType)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_16:
      if ((v6 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_17:
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }
LABEL_18:
  if (self->_logisticRegressionRegularizationStrategy)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v8;
    v7 = (__int16)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_22:
      if ((v7 & 4) == 0)
        goto LABEL_23;
      goto LABEL_40;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteFloatField();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_23:
    if ((v7 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteFloatField();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) == 0)
  {
LABEL_24:
    if ((v7 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_25:
    if ((v7 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteFloatField();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
LABEL_26:
    if ((v7 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 0x1000) == 0)
  {
LABEL_27:
    if ((v7 & 0x400) == 0)
      goto LABEL_28;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 0x400) == 0)
  {
LABEL_28:
    if ((v7 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_29:
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }
LABEL_30:
  if (self->_executableType)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  $858CD4590B3952EEF70BA3EF88502D79 has;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_blendingABGroup)
  {
    objc_msgSend(v4, "setBlendingABGroup:");
    v4 = v8;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v8, "setAbGroup:");
    v4 = v8;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v8, "setClientModelId:");
    v4 = v8;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  *((_BYTE *)v4 + 114) = self->_pipelineEnabled;
  *((_WORD *)v4 + 58) |= 0x8000u;
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    *((_BYTE *)v4 + 113) = self->_hasTrainedModel;
    *((_WORD *)v4 + 58) |= 0x4000u;
    *(_WORD *)&has = self->_has;
  }
LABEL_10:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    *((_BYTE *)v4 + 112) = self->_hasDefaultHyperParams;
    *((_WORD *)v4 + 58) |= 0x2000u;
  }
  if (self->_modelType)
  {
    objc_msgSend(v8, "setModelType:");
    v4 = v8;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_avgNumberOfModelWeights;
    *((_WORD *)v4 + 58) |= 1u;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_16:
      if ((v6 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v4 + 5) = self->_avgNumberOfNonZeroModelWeights;
  *((_WORD *)v4 + 58) |= 2u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 22) = self->_numberOfCandidateModels;
    *((_WORD *)v4 + 58) |= 0x80u;
  }
LABEL_18:
  if (self->_logisticRegressionRegularizationStrategy)
  {
    objc_msgSend(v8, "setLogisticRegressionRegularizationStrategy:");
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = LODWORD(self->_logisticRegressionRegularizationRate);
    *((_WORD *)v4 + 58) |= 0x10u;
    v7 = (__int16)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_22:
      if ((v7 & 4) == 0)
        goto LABEL_23;
      goto LABEL_40;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_22;
  }
  *((_DWORD *)v4 + 13) = LODWORD(self->_logisticRegressionRegularizationL1Ratio);
  *((_WORD *)v4 + 58) |= 8u;
  v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_23:
    if ((v7 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 12) = LODWORD(self->_learningRate);
  *((_WORD *)v4 + 58) |= 4u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) == 0)
  {
LABEL_24:
    if ((v7 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 18) = self->_minIterations;
  *((_WORD *)v4 + 58) |= 0x20u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_25:
    if ((v7 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 23) = LODWORD(self->_stoppingThreshold);
  *((_WORD *)v4 + 58) |= 0x100u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
LABEL_26:
    if ((v7 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 26) = self->_trainDataNumberOfPositiveSamples;
  *((_WORD *)v4 + 58) |= 0x800u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x1000) == 0)
  {
LABEL_27:
    if ((v7 & 0x400) == 0)
      goto LABEL_28;
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 27) = self->_trainDataNumberOfSamples;
  *((_WORD *)v4 + 58) |= 0x1000u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x400) == 0)
  {
LABEL_28:
    if ((v7 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_45:
  *((_DWORD *)v4 + 25) = self->_trainDataNumberOfDaysWithPositiveSamples;
  *((_WORD *)v4 + 58) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_29:
    *((_DWORD *)v4 + 24) = self->_trainDataNumberOfCandidates;
    *((_WORD *)v4 + 58) |= 0x200u;
  }
LABEL_30:
  if (self->_executableType)
  {
    objc_msgSend(v8, "setExecutableType:");
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_modelAgeInDays;
    *((_WORD *)v4 + 58) |= 0x40u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  $858CD4590B3952EEF70BA3EF88502D79 has;
  uint64_t v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  void *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_blendingABGroup, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 114) = self->_pipelineEnabled;
  *(_WORD *)(v5 + 116) |= 0x8000u;
  *(_WORD *)&has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_3:
    *(_BYTE *)(v5 + 113) = self->_hasTrainedModel;
    *(_WORD *)(v5 + 116) |= 0x4000u;
    *(_WORD *)&has = self->_has;
  }
LABEL_4:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    *(_BYTE *)(v5 + 112) = self->_hasDefaultHyperParams;
    *(_WORD *)(v5 + 116) |= 0x2000u;
  }
  v13 = -[NSString copyWithZone:](self->_modelType, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v13;

  v15 = (__int16)self->_has;
  if ((v15 & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_avgNumberOfModelWeights;
    *(_WORD *)(v5 + 116) |= 1u;
    v15 = (__int16)self->_has;
    if ((v15 & 2) == 0)
    {
LABEL_8:
      if ((v15 & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 20) = self->_avgNumberOfNonZeroModelWeights;
  *(_WORD *)(v5 + 116) |= 2u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 88) = self->_numberOfCandidateModels;
    *(_WORD *)(v5 + 116) |= 0x80u;
  }
LABEL_10:
  v16 = -[NSString copyWithZone:](self->_logisticRegressionRegularizationStrategy, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  v18 = (__int16)self->_has;
  if ((v18 & 0x10) != 0)
  {
    *(float *)(v5 + 56) = self->_logisticRegressionRegularizationRate;
    *(_WORD *)(v5 + 116) |= 0x10u;
    v18 = (__int16)self->_has;
    if ((v18 & 8) == 0)
    {
LABEL_12:
      if ((v18 & 4) == 0)
        goto LABEL_13;
      goto LABEL_28;
    }
  }
  else if ((v18 & 8) == 0)
  {
    goto LABEL_12;
  }
  *(float *)(v5 + 52) = self->_logisticRegressionRegularizationL1Ratio;
  *(_WORD *)(v5 + 116) |= 8u;
  v18 = (__int16)self->_has;
  if ((v18 & 4) == 0)
  {
LABEL_13:
    if ((v18 & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *(float *)(v5 + 48) = self->_learningRate;
  *(_WORD *)(v5 + 116) |= 4u;
  v18 = (__int16)self->_has;
  if ((v18 & 0x20) == 0)
  {
LABEL_14:
    if ((v18 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 72) = self->_minIterations;
  *(_WORD *)(v5 + 116) |= 0x20u;
  v18 = (__int16)self->_has;
  if ((v18 & 0x100) == 0)
  {
LABEL_15:
    if ((v18 & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  *(float *)(v5 + 92) = self->_stoppingThreshold;
  *(_WORD *)(v5 + 116) |= 0x100u;
  v18 = (__int16)self->_has;
  if ((v18 & 0x800) == 0)
  {
LABEL_16:
    if ((v18 & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 104) = self->_trainDataNumberOfPositiveSamples;
  *(_WORD *)(v5 + 116) |= 0x800u;
  v18 = (__int16)self->_has;
  if ((v18 & 0x1000) == 0)
  {
LABEL_17:
    if ((v18 & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v5 + 108) = self->_trainDataNumberOfSamples;
  *(_WORD *)(v5 + 116) |= 0x1000u;
  v18 = (__int16)self->_has;
  if ((v18 & 0x400) == 0)
  {
LABEL_18:
    if ((v18 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_33:
  *(_DWORD *)(v5 + 100) = self->_trainDataNumberOfDaysWithPositiveSamples;
  *(_WORD *)(v5 + 116) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_19:
    *(_DWORD *)(v5 + 96) = self->_trainDataNumberOfCandidates;
    *(_WORD *)(v5 + 116) |= 0x200u;
  }
LABEL_20:
  v19 = -[NSString copyWithZone:](self->_executableType, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_modelAgeInDays;
    *(_WORD *)(v5 + 116) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *blendingABGroup;
  NSString *abGroup;
  NSString *clientModelId;
  $858CD4590B3952EEF70BA3EF88502D79 has;
  NSString *modelType;
  __int16 v10;
  NSString *logisticRegressionRegularizationStrategy;
  __int16 v12;
  NSString *executableType;
  __int16 v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_106;
  blendingABGroup = self->_blendingABGroup;
  if ((unint64_t)blendingABGroup | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](blendingABGroup, "isEqual:"))
      goto LABEL_106;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:"))
      goto LABEL_106;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:"))
      goto LABEL_106;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x8000) == 0)
      goto LABEL_106;
    if (self->_pipelineEnabled)
    {
      if (!*((_BYTE *)v4 + 114))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 114))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x8000) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x4000) == 0)
      goto LABEL_106;
    if (self->_hasTrainedModel)
    {
      if (!*((_BYTE *)v4 + 113))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 113))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x4000) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x2000) == 0)
      goto LABEL_106;
    if (self->_hasDefaultHyperParams)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x2000) != 0)
  {
    goto LABEL_106;
  }
  modelType = self->_modelType;
  if ((unint64_t)modelType | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](modelType, "isEqual:"))
      goto LABEL_106;
    *(_WORD *)&has = self->_has;
  }
  v10 = *((_WORD *)v4 + 58);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_avgNumberOfModelWeights != *((_DWORD *)v4 + 4))
      goto LABEL_106;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_avgNumberOfNonZeroModelWeights != *((_DWORD *)v4 + 5))
      goto LABEL_106;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_numberOfCandidateModels != *((_DWORD *)v4 + 22))
      goto LABEL_106;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  logisticRegressionRegularizationStrategy = self->_logisticRegressionRegularizationStrategy;
  if ((unint64_t)logisticRegressionRegularizationStrategy | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](logisticRegressionRegularizationStrategy, "isEqual:"))
      goto LABEL_106;
    *(_WORD *)&has = self->_has;
  }
  v12 = *((_WORD *)v4 + 58);
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_logisticRegressionRegularizationRate != *((float *)v4 + 14))
      goto LABEL_106;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_logisticRegressionRegularizationL1Ratio != *((float *)v4 + 13))
      goto LABEL_106;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_learningRate != *((float *)v4 + 12))
      goto LABEL_106;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_minIterations != *((_DWORD *)v4 + 18))
      goto LABEL_106;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_stoppingThreshold != *((float *)v4 + 23))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x800) == 0 || self->_trainDataNumberOfPositiveSamples != *((_DWORD *)v4 + 26))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 58) & 0x800) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x1000) == 0 || self->_trainDataNumberOfSamples != *((_DWORD *)v4 + 27))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 58) & 0x1000) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x400) == 0 || self->_trainDataNumberOfDaysWithPositiveSamples != *((_DWORD *)v4 + 25))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 58) & 0x400) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0 || self->_trainDataNumberOfCandidates != *((_DWORD *)v4 + 24))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_106;
  }
  executableType = self->_executableType;
  if ((unint64_t)executableType | *((_QWORD *)v4 + 5))
  {
    if (-[NSString isEqual:](executableType, "isEqual:"))
    {
      *(_WORD *)&has = self->_has;
      goto LABEL_101;
    }
LABEL_106:
    v15 = 0;
    goto LABEL_107;
  }
LABEL_101:
  v14 = *((_WORD *)v4 + 58);
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_modelAgeInDays != *((_DWORD *)v4 + 19))
      goto LABEL_106;
    v15 = 1;
  }
  else
  {
    v15 = (v14 & 0x40) == 0;
  }
LABEL_107:

  return v15;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  unint64_t v5;
  float logisticRegressionRegularizationRate;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  float logisticRegressionRegularizationL1Ratio;
  float v12;
  float v13;
  float v14;
  unint64_t v15;
  float learningRate;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  float stoppingThreshold;
  float v22;
  float v23;
  float v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  uint64_t v31;
  unint64_t v33;
  unint64_t v34;
  NSUInteger v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSUInteger v43;
  NSUInteger v44;
  NSUInteger v45;

  v45 = -[NSString hash](self->_blendingABGroup, "hash");
  v44 = -[NSString hash](self->_abGroup, "hash");
  v43 = -[NSString hash](self->_clientModelId, "hash");
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
    v42 = 0;
    if ((*(_WORD *)&self->_has & 0x4000) == 0)
      goto LABEL_3;
LABEL_6:
    v41 = 2654435761 * self->_hasTrainedModel;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v42 = 2654435761 * self->_pipelineEnabled;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
    goto LABEL_6;
LABEL_3:
  v41 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_4:
    v40 = 2654435761 * self->_hasDefaultHyperParams;
    goto LABEL_8;
  }
LABEL_7:
  v40 = 0;
LABEL_8:
  v39 = -[NSString hash](self->_modelType, "hash");
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    v38 = 0;
    if ((has & 2) != 0)
      goto LABEL_10;
LABEL_13:
    v37 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_14;
  }
  v38 = 2654435761 * self->_avgNumberOfModelWeights;
  if ((has & 2) == 0)
    goto LABEL_13;
LABEL_10:
  v37 = 2654435761 * self->_avgNumberOfNonZeroModelWeights;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    v36 = 2654435761 * self->_numberOfCandidateModels;
    goto LABEL_15;
  }
LABEL_14:
  v36 = 0;
LABEL_15:
  v35 = -[NSString hash](self->_logisticRegressionRegularizationStrategy, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    logisticRegressionRegularizationRate = self->_logisticRegressionRegularizationRate;
    v7 = -logisticRegressionRegularizationRate;
    if (logisticRegressionRegularizationRate >= 0.0)
      v7 = self->_logisticRegressionRegularizationRate;
    v8 = floorf(v7 + 0.5);
    v9 = (float)(v7 - v8) * 1.8447e19;
    v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((v4 & 8) != 0)
  {
    logisticRegressionRegularizationL1Ratio = self->_logisticRegressionRegularizationL1Ratio;
    v12 = -logisticRegressionRegularizationL1Ratio;
    if (logisticRegressionRegularizationL1Ratio >= 0.0)
      v12 = self->_logisticRegressionRegularizationL1Ratio;
    v13 = floorf(v12 + 0.5);
    v14 = (float)(v12 - v13) * 1.8447e19;
    v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v34 = v5;
  if ((v4 & 4) != 0)
  {
    learningRate = self->_learningRate;
    v17 = -learningRate;
    if (learningRate >= 0.0)
      v17 = self->_learningRate;
    v18 = floorf(v17 + 0.5);
    v19 = (float)(v17 - v18) * 1.8447e19;
    v15 = 2654435761u * (unint64_t)fmodf(v18, 1.8447e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabsf(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  v33 = v10;
  if ((v4 & 0x20) != 0)
  {
    v20 = 2654435761 * self->_minIterations;
    if ((v4 & 0x100) != 0)
      goto LABEL_41;
LABEL_46:
    v25 = 0;
    goto LABEL_49;
  }
  v20 = 0;
  if ((v4 & 0x100) == 0)
    goto LABEL_46;
LABEL_41:
  stoppingThreshold = self->_stoppingThreshold;
  v22 = -stoppingThreshold;
  if (stoppingThreshold >= 0.0)
    v22 = self->_stoppingThreshold;
  v23 = floorf(v22 + 0.5);
  v24 = (float)(v22 - v23) * 1.8447e19;
  v25 = 2654435761u * (unint64_t)fmodf(v23, 1.8447e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0)
      v25 += (unint64_t)v24;
  }
  else
  {
    v25 -= (unint64_t)fabsf(v24);
  }
LABEL_49:
  if ((v4 & 0x800) != 0)
  {
    v26 = 2654435761 * self->_trainDataNumberOfPositiveSamples;
    if ((v4 & 0x1000) != 0)
    {
LABEL_51:
      v27 = 2654435761 * self->_trainDataNumberOfSamples;
      if ((v4 & 0x400) != 0)
        goto LABEL_52;
LABEL_56:
      v28 = 0;
      if ((v4 & 0x200) != 0)
        goto LABEL_53;
      goto LABEL_57;
    }
  }
  else
  {
    v26 = 0;
    if ((v4 & 0x1000) != 0)
      goto LABEL_51;
  }
  v27 = 0;
  if ((v4 & 0x400) == 0)
    goto LABEL_56;
LABEL_52:
  v28 = 2654435761 * self->_trainDataNumberOfDaysWithPositiveSamples;
  if ((v4 & 0x200) != 0)
  {
LABEL_53:
    v29 = 2654435761 * self->_trainDataNumberOfCandidates;
    goto LABEL_58;
  }
LABEL_57:
  v29 = 0;
LABEL_58:
  v30 = -[NSString hash](self->_executableType, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v31 = 2654435761 * self->_modelAgeInDays;
  else
    v31 = 0;
  return v44 ^ v45 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v15 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31;
}

- (void)mergeFrom:(id)a3
{
  __int16 *v4;
  int v5;
  __int16 v6;
  __int16 v7;
  __int16 *v8;

  v4 = (__int16 *)a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setBlendingABGroup:](self, "setBlendingABGroup:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setAbGroup:](self, "setAbGroup:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setClientModelId:](self, "setClientModelId:");
    v4 = v8;
  }
  v5 = v4[58];
  if ((v5 & 0x80000000) == 0)
  {
    if ((v5 & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  self->_pipelineEnabled = *((_BYTE *)v4 + 114);
  *(_WORD *)&self->_has |= 0x8000u;
  LOWORD(v5) = v4[58];
  if ((v5 & 0x4000) != 0)
  {
LABEL_9:
    self->_hasTrainedModel = *((_BYTE *)v4 + 113);
    *(_WORD *)&self->_has |= 0x4000u;
    LOWORD(v5) = v4[58];
  }
LABEL_10:
  if ((v5 & 0x2000) != 0)
  {
    self->_hasDefaultHyperParams = *((_BYTE *)v4 + 112);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setModelType:](self, "setModelType:");
    v4 = v8;
  }
  v6 = v4[58];
  if ((v6 & 1) != 0)
  {
    self->_avgNumberOfModelWeights = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
    v6 = v4[58];
    if ((v6 & 2) == 0)
    {
LABEL_16:
      if ((v6 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_16;
  }
  self->_avgNumberOfNonZeroModelWeights = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 2u;
  if ((v4[58] & 0x80) != 0)
  {
LABEL_17:
    self->_numberOfCandidateModels = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_18:
  if (*((_QWORD *)v4 + 8))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setLogisticRegressionRegularizationStrategy:](self, "setLogisticRegressionRegularizationStrategy:");
    v4 = v8;
  }
  v7 = v4[58];
  if ((v7 & 0x10) != 0)
  {
    self->_logisticRegressionRegularizationRate = *((float *)v4 + 14);
    *(_WORD *)&self->_has |= 0x10u;
    v7 = v4[58];
    if ((v7 & 8) == 0)
    {
LABEL_22:
      if ((v7 & 4) == 0)
        goto LABEL_23;
      goto LABEL_40;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_22;
  }
  self->_logisticRegressionRegularizationL1Ratio = *((float *)v4 + 13);
  *(_WORD *)&self->_has |= 8u;
  v7 = v4[58];
  if ((v7 & 4) == 0)
  {
LABEL_23:
    if ((v7 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_41;
  }
LABEL_40:
  self->_learningRate = *((float *)v4 + 12);
  *(_WORD *)&self->_has |= 4u;
  v7 = v4[58];
  if ((v7 & 0x20) == 0)
  {
LABEL_24:
    if ((v7 & 0x100) == 0)
      goto LABEL_25;
    goto LABEL_42;
  }
LABEL_41:
  self->_minIterations = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  v7 = v4[58];
  if ((v7 & 0x100) == 0)
  {
LABEL_25:
    if ((v7 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_43;
  }
LABEL_42:
  self->_stoppingThreshold = *((float *)v4 + 23);
  *(_WORD *)&self->_has |= 0x100u;
  v7 = v4[58];
  if ((v7 & 0x800) == 0)
  {
LABEL_26:
    if ((v7 & 0x1000) == 0)
      goto LABEL_27;
    goto LABEL_44;
  }
LABEL_43:
  self->_trainDataNumberOfPositiveSamples = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 0x800u;
  v7 = v4[58];
  if ((v7 & 0x1000) == 0)
  {
LABEL_27:
    if ((v7 & 0x400) == 0)
      goto LABEL_28;
    goto LABEL_45;
  }
LABEL_44:
  self->_trainDataNumberOfSamples = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_has |= 0x1000u;
  v7 = v4[58];
  if ((v7 & 0x400) == 0)
  {
LABEL_28:
    if ((v7 & 0x200) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_45:
  self->_trainDataNumberOfDaysWithPositiveSamples = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x400u;
  if ((v4[58] & 0x200) != 0)
  {
LABEL_29:
    self->_trainDataNumberOfCandidates = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_30:
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setExecutableType:](self, "setExecutableType:");
    v4 = v8;
  }
  if ((v4[58] & 0x40) != 0)
  {
    self->_modelAgeInDays = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 0x40u;
  }

}

- (NSString)blendingABGroup
{
  return self->_blendingABGroup;
}

- (void)setBlendingABGroup:(id)a3
{
  objc_storeStrong((id *)&self->_blendingABGroup, a3);
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelId, a3);
}

- (BOOL)pipelineEnabled
{
  return self->_pipelineEnabled;
}

- (BOOL)hasTrainedModel
{
  return self->_hasTrainedModel;
}

- (BOOL)hasDefaultHyperParams
{
  return self->_hasDefaultHyperParams;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (void)setModelType:(id)a3
{
  objc_storeStrong((id *)&self->_modelType, a3);
}

- (unsigned)avgNumberOfModelWeights
{
  return self->_avgNumberOfModelWeights;
}

- (unsigned)avgNumberOfNonZeroModelWeights
{
  return self->_avgNumberOfNonZeroModelWeights;
}

- (unsigned)numberOfCandidateModels
{
  return self->_numberOfCandidateModels;
}

- (NSString)logisticRegressionRegularizationStrategy
{
  return self->_logisticRegressionRegularizationStrategy;
}

- (void)setLogisticRegressionRegularizationStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_logisticRegressionRegularizationStrategy, a3);
}

- (float)logisticRegressionRegularizationRate
{
  return self->_logisticRegressionRegularizationRate;
}

- (float)logisticRegressionRegularizationL1Ratio
{
  return self->_logisticRegressionRegularizationL1Ratio;
}

- (float)learningRate
{
  return self->_learningRate;
}

- (unsigned)minIterations
{
  return self->_minIterations;
}

- (float)stoppingThreshold
{
  return self->_stoppingThreshold;
}

- (unsigned)trainDataNumberOfPositiveSamples
{
  return self->_trainDataNumberOfPositiveSamples;
}

- (unsigned)trainDataNumberOfSamples
{
  return self->_trainDataNumberOfSamples;
}

- (unsigned)trainDataNumberOfDaysWithPositiveSamples
{
  return self->_trainDataNumberOfDaysWithPositiveSamples;
}

- (unsigned)trainDataNumberOfCandidates
{
  return self->_trainDataNumberOfCandidates;
}

- (NSString)executableType
{
  return self->_executableType;
}

- (void)setExecutableType:(id)a3
{
  objc_storeStrong((id *)&self->_executableType, a3);
}

- (unsigned)modelAgeInDays
{
  return self->_modelAgeInDays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_logisticRegressionRegularizationStrategy, 0);
  objc_storeStrong((id *)&self->_executableType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_blendingABGroup, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
