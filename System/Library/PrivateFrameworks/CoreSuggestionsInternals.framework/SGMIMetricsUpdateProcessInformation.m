@implementation SGMIMetricsUpdateProcessInformation

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)SGMIMetricsUpdateProcessInformation;
  -[SGMIMetricsUpdateProcessInformation dealloc](&v3, sel_dealloc);
}

- (BOOL)hasTrialMetadata
{
  return self->_trialMetadata != 0;
}

- (BOOL)hasBackgroundTrialMetadata
{
  return self->_backgroundTrialMetadata != 0;
}

- (void)setHoursSinceReference:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_hoursSinceReference = a3;
}

- (void)setHasHoursSinceReference:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasHoursSinceReference
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (unint64_t)ctsJobConstraintsCount
{
  return self->_ctsJobConstraints.count;
}

- (int)ctsJobConstraints
{
  return self->_ctsJobConstraints.list;
}

- (void)clearCtsJobConstraints
{
  PBRepeatedInt32Clear();
}

- (void)addCtsJobConstraints:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)ctsJobConstraintsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_ctsJobConstraints;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_ctsJobConstraints = &self->_ctsJobConstraints;
  count = self->_ctsJobConstraints.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_ctsJobConstraints->list[a3];
}

- (void)setCtsJobConstraints:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)ctsJobConstraintsAsString:(int)a3
{
  if ((a3 - 1) < 0x11)
    return off_1E7DA8260[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCtsJobConstraints:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CancelAfterDeadline")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CpuIntensive")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DiskIntensive")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("StartHandler")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SuspendHandler")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MemoryIntensive")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SchedulingPriorityBackground")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SchedulingPriorityDefault")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SchedulingPriorityMaintenance")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SchedulingPriorityUtility")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SchedulingPriorityUserInitiated")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SchedulingPriorityUserInitiatedOvercommit")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequestsApplicationLaunch")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequiresInexpensiveNetworking")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequiresNetwork")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RequiresPlugin")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TriggersRestart")))
  {
    v4 = 17;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setHoursSinceLastIncrementalUpdate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_hoursSinceLastIncrementalUpdate = a3;
}

- (void)setHasHoursSinceLastIncrementalUpdate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasHoursSinceLastIncrementalUpdate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsSubmodelRebuilt:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isSubmodelRebuilt = a3;
}

- (void)setHasIsSubmodelRebuilt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsSubmodelRebuilt
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setDaysAvailableDuringIncrementalUpdate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_daysAvailableDuringIncrementalUpdate = a3;
}

- (void)setHasDaysAvailableDuringIncrementalUpdate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDaysAvailableDuringIncrementalUpdate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDaysProcessedDuringIncrementalUpdate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_daysProcessedDuringIncrementalUpdate = a3;
}

- (void)setHasDaysProcessedDuringIncrementalUpdate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasDaysProcessedDuringIncrementalUpdate
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setMailsProcessedDuringIncrementalUpdate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_mailsProcessedDuringIncrementalUpdate = a3;
}

- (void)setHasMailsProcessedDuringIncrementalUpdate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMailsProcessedDuringIncrementalUpdate
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setDeletedTokensCountToComplyToCappingPolicy:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_deletedTokensCountToComplyToCappingPolicy = a3;
}

- (void)setHasDeletedTokensCountToComplyToCappingPolicy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDeletedTokensCountToComplyToCappingPolicy
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDeletedEmailsCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_deletedEmailsCount = a3;
}

- (void)setHasDeletedEmailsCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDeletedEmailsCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRollbackedSlicesCountToComplyToPostDeletionPolicy:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_rollbackedSlicesCountToComplyToPostDeletionPolicy = a3;
}

- (void)setHasRollbackedSlicesCountToComplyToPostDeletionPolicy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasRollbackedSlicesCountToComplyToPostDeletionPolicy
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setRollbackedEmailsCountToComplyToPostDeletionPolicy:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rollbackedEmailsCountToComplyToPostDeletionPolicy = a3;
}

- (void)setHasRollbackedEmailsCountToComplyToPostDeletionPolicy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRollbackedEmailsCountToComplyToPostDeletionPolicy
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasSubmodelsStats
{
  return self->_submodelsStats != 0;
}

- (void)setBiomeAggregationPerformanceInMilliSeconds:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_biomeAggregationPerformanceInMilliSeconds = a3;
}

- (void)setHasBiomeAggregationPerformanceInMilliSeconds:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBiomeAggregationPerformanceInMilliSeconds
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSubmodelsUpdatePerformanceInMilliSeconds:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_submodelsUpdatePerformanceInMilliSeconds = a3;
}

- (void)setHasSubmodelsUpdatePerformanceInMilliSeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSubmodelsUpdatePerformanceInMilliSeconds
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds = a3;
}

- (void)setHasSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSubmodelsPruningForCappingPolicyPerformanceInMilliSeconds
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds = a3;
}

- (void)setHasCumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds
{
  return (*(_WORD *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)SGMIMetricsUpdateProcessInformation;
  -[SGMIMetricsUpdateProcessInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsUpdateProcessInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SGMIMetricsTrialMetadata *trialMetadata;
  void *v5;
  SGMIMetricsTrialMetadata *backgroundTrialMetadata;
  void *v7;
  void *v8;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_ctsJobConstraints;
  void *v10;
  unint64_t v11;
  unsigned int v12;
  __CFString *v13;
  __int16 has;
  void *v15;
  SGMIMetricsSubmodelsStats *submodelsStats;
  void *v17;
  __int16 v18;
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
  trialMetadata = self->_trialMetadata;
  if (trialMetadata)
  {
    -[SGMIMetricsTrialMetadata dictionaryRepresentation](trialMetadata, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("trialMetadata"));

  }
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  if (backgroundTrialMetadata)
  {
    -[SGMIMetricsTrialMetadata dictionaryRepresentation](backgroundTrialMetadata, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("backgroundTrialMetadata"));

  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hoursSinceReference);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("hoursSinceReference"));

  }
  p_ctsJobConstraints = &self->_ctsJobConstraints;
  if (self->_ctsJobConstraints.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_ctsJobConstraints.count)
    {
      v11 = 0;
      do
      {
        v12 = p_ctsJobConstraints->list[v11] - 1;
        if (v12 >= 0x11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_ctsJobConstraints->list[v11]);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_1E7DA8260[v12];
        }
        objc_msgSend(v10, "addObject:", v13);

        ++v11;
      }
      while (v11 < self->_ctsJobConstraints.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ctsJobConstraints"));

  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hoursSinceLastIncrementalUpdate);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("hoursSinceLastIncrementalUpdate"));

    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_17:
      if ((has & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSubmodelRebuilt);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("isSubmodelRebuilt"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((has & 0x20) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_daysAvailableDuringIncrementalUpdate);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("daysAvailableDuringIncrementalUpdate"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_19:
    if ((has & 0x400) == 0)
      goto LABEL_20;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_daysProcessedDuringIncrementalUpdate);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("daysProcessedDuringIncrementalUpdate"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_20:
    if ((has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mailsProcessedDuringIncrementalUpdate);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("mailsProcessedDuringIncrementalUpdate"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_21:
    if ((has & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_deletedTokensCountToComplyToCappingPolicy);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("deletedTokensCountToComplyToCappingPolicy"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_22:
    if ((has & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_deletedEmailsCount);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("deletedEmailsCount"));

  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_23:
    if ((has & 0x800) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rollbackedSlicesCountToComplyToPostDeletionPolicy);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("rollbackedSlicesCountToComplyToPostDeletionPolicy"));

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rollbackedEmailsCountToComplyToPostDeletionPolicy);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("rollbackedEmailsCountToComplyToPostDeletionPolicy"));

  }
LABEL_25:
  submodelsStats = self->_submodelsStats;
  if (submodelsStats)
  {
    -[SGMIMetricsSubmodelsStats dictionaryRepresentation](submodelsStats, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("submodelsStats"));

  }
  v18 = (__int16)self->_has;
  if ((v18 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_biomeAggregationPerformanceInMilliSeconds);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("biomeAggregationPerformanceInMilliSeconds"));

    v18 = (__int16)self->_has;
    if ((v18 & 8) == 0)
    {
LABEL_29:
      if ((v18 & 4) == 0)
        goto LABEL_30;
LABEL_44:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("submodelsPruningForCappingPolicyPerformanceInMilliSeconds"));

      if ((*(_WORD *)&self->_has & 2) == 0)
        return v3;
      goto LABEL_31;
    }
  }
  else if ((v18 & 8) == 0)
  {
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_submodelsUpdatePerformanceInMilliSeconds);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("submodelsUpdatePerformanceInMilliSeconds"));

  v18 = (__int16)self->_has;
  if ((v18 & 4) != 0)
    goto LABEL_44;
LABEL_30:
  if ((v18 & 2) != 0)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsUpdateProcessInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  __int16 has;
  __int16 v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_trialMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if (self->_backgroundTrialMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }
  if (self->_ctsJobConstraints.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v8;
      ++v5;
    }
    while (v5 < self->_ctsJobConstraints.count);
  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_16:
    if ((has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_17:
    if ((has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_18:
    if ((has & 0x800) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_19:
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }
LABEL_20:
  if (self->_submodelsStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v8;
    v7 = (__int16)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_24:
      if ((v7 & 4) == 0)
        goto LABEL_25;
LABEL_39:
      PBDataWriterWriteUint64Field();
      v4 = v8;
      if ((*(_WORD *)&self->_has & 2) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteUint64Field();
  v4 = v8;
  v7 = (__int16)self->_has;
  if ((v7 & 4) != 0)
    goto LABEL_39;
LABEL_25:
  if ((v7 & 2) != 0)
  {
LABEL_26:
    PBDataWriterWriteUint64Field();
    v4 = v8;
  }
LABEL_27:

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  __int16 has;
  _QWORD *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (self->_trialMetadata)
  {
    objc_msgSend(v4, "setTrialMetadata:");
    v4 = v11;
  }
  if (self->_backgroundTrialMetadata)
  {
    objc_msgSend(v11, "setBackgroundTrialMetadata:");
    v4 = v11;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_hoursSinceReference;
    *((_WORD *)v4 + 66) |= 0x200u;
  }
  if (-[SGMIMetricsUpdateProcessInformation ctsJobConstraintsCount](self, "ctsJobConstraintsCount"))
  {
    objc_msgSend(v11, "clearCtsJobConstraints");
    v5 = -[SGMIMetricsUpdateProcessInformation ctsJobConstraintsCount](self, "ctsJobConstraintsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v11, "addCtsJobConstraints:", -[SGMIMetricsUpdateProcessInformation ctsJobConstraintsAtIndex:](self, "ctsJobConstraintsAtIndex:", i));
    }
  }
  has = (__int16)self->_has;
  v9 = v11;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v11 + 22) = self->_hoursSinceLastIncrementalUpdate;
    *((_WORD *)v11 + 66) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_13:
      if ((has & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_13;
  }
  *((_BYTE *)v11 + 128) = self->_isSubmodelRebuilt;
  *((_WORD *)v11 + 66) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v11 + 18) = self->_daysAvailableDuringIncrementalUpdate;
  *((_WORD *)v11 + 66) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v11 + 19) = self->_daysProcessedDuringIncrementalUpdate;
  *((_WORD *)v11 + 66) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v11 + 24) = self->_mailsProcessedDuringIncrementalUpdate;
  *((_WORD *)v11 + 66) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v11 + 21) = self->_deletedTokensCountToComplyToCappingPolicy;
  *((_WORD *)v11 + 66) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v11 + 20) = self->_deletedEmailsCount;
  *((_WORD *)v11 + 66) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_19:
    if ((has & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_36:
  *((_DWORD *)v11 + 26) = self->_rollbackedSlicesCountToComplyToPostDeletionPolicy;
  *((_WORD *)v11 + 66) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_20:
    *((_DWORD *)v11 + 25) = self->_rollbackedEmailsCountToComplyToPostDeletionPolicy;
    *((_WORD *)v11 + 66) |= 0x800u;
  }
LABEL_21:
  if (self->_submodelsStats)
  {
    objc_msgSend(v11, "setSubmodelsStats:");
    v9 = v11;
  }
  v10 = (__int16)self->_has;
  if ((v10 & 1) != 0)
  {
    v9[4] = self->_biomeAggregationPerformanceInMilliSeconds;
    *((_WORD *)v9 + 66) |= 1u;
    v10 = (__int16)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_25:
      if ((v10 & 4) == 0)
        goto LABEL_26;
LABEL_40:
      v9[6] = self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds;
      *((_WORD *)v9 + 66) |= 4u;
      if ((*(_WORD *)&self->_has & 2) == 0)
        goto LABEL_28;
      goto LABEL_27;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_25;
  }
  v9[7] = self->_submodelsUpdatePerformanceInMilliSeconds;
  *((_WORD *)v9 + 66) |= 8u;
  v10 = (__int16)self->_has;
  if ((v10 & 4) != 0)
    goto LABEL_40;
LABEL_26:
  if ((v10 & 2) != 0)
  {
LABEL_27:
    v9[5] = self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds;
    *((_WORD *)v9 + 66) |= 2u;
  }
LABEL_28:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  __int16 has;
  id v11;
  void *v12;
  __int16 v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SGMIMetricsTrialMetadata copyWithZone:](self->_trialMetadata, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v6;

  v8 = -[SGMIMetricsTrialMetadata copyWithZone:](self->_backgroundTrialMetadata, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_hoursSinceReference;
    *(_WORD *)(v5 + 132) |= 0x200u;
  }
  PBRepeatedInt32Copy();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_hoursSinceLastIncrementalUpdate;
    *(_WORD *)(v5 + 132) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v5 + 128) = self->_isSubmodelRebuilt;
  *(_WORD *)(v5 + 132) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 72) = self->_daysAvailableDuringIncrementalUpdate;
  *(_WORD *)(v5 + 132) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 76) = self->_daysProcessedDuringIncrementalUpdate;
  *(_WORD *)(v5 + 132) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 96) = self->_mailsProcessedDuringIncrementalUpdate;
  *(_WORD *)(v5 + 132) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 84) = self->_deletedTokensCountToComplyToCappingPolicy;
  *(_WORD *)(v5 + 132) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 80) = self->_deletedEmailsCount;
  *(_WORD *)(v5 + 132) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_26:
  *(_DWORD *)(v5 + 104) = self->_rollbackedSlicesCountToComplyToPostDeletionPolicy;
  *(_WORD *)(v5 + 132) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 100) = self->_rollbackedEmailsCountToComplyToPostDeletionPolicy;
    *(_WORD *)(v5 + 132) |= 0x800u;
  }
LABEL_13:
  v11 = -[SGMIMetricsSubmodelsStats copyWithZone:](self->_submodelsStats, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v11;

  v13 = (__int16)self->_has;
  if ((v13 & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_biomeAggregationPerformanceInMilliSeconds;
    *(_WORD *)(v5 + 132) |= 1u;
    v13 = (__int16)self->_has;
    if ((v13 & 8) == 0)
    {
LABEL_15:
      if ((v13 & 4) == 0)
        goto LABEL_16;
LABEL_30:
      *(_QWORD *)(v5 + 48) = self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds;
      *(_WORD *)(v5 + 132) |= 4u;
      if ((*(_WORD *)&self->_has & 2) == 0)
        return (id)v5;
      goto LABEL_17;
    }
  }
  else if ((v13 & 8) == 0)
  {
    goto LABEL_15;
  }
  *(_QWORD *)(v5 + 56) = self->_submodelsUpdatePerformanceInMilliSeconds;
  *(_WORD *)(v5 + 132) |= 8u;
  v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
    goto LABEL_30;
LABEL_16:
  if ((v13 & 2) != 0)
  {
LABEL_17:
    *(_QWORD *)(v5 + 40) = self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds;
    *(_WORD *)(v5 + 132) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SGMIMetricsTrialMetadata *trialMetadata;
  SGMIMetricsTrialMetadata *backgroundTrialMetadata;
  __int16 has;
  __int16 v8;
  SGMIMetricsSubmodelsStats *submodelsStats;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_83;
  trialMetadata = self->_trialMetadata;
  if ((unint64_t)trialMetadata | *((_QWORD *)v4 + 15))
  {
    if (!-[SGMIMetricsTrialMetadata isEqual:](trialMetadata, "isEqual:"))
      goto LABEL_83;
  }
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  if ((unint64_t)backgroundTrialMetadata | *((_QWORD *)v4 + 8))
  {
    if (!-[SGMIMetricsTrialMetadata isEqual:](backgroundTrialMetadata, "isEqual:"))
      goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x200) == 0 || self->_hoursSinceReference != *((_DWORD *)v4 + 23))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    goto LABEL_83;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_83;
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 66);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x100) == 0 || self->_hoursSinceLastIncrementalUpdate != *((_DWORD *)v4 + 22))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x2000) == 0)
      goto LABEL_83;
    if (self->_isSubmodelRebuilt)
    {
      if (!*((_BYTE *)v4 + 128))
        goto LABEL_83;
    }
    else if (*((_BYTE *)v4 + 128))
    {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x2000) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_daysAvailableDuringIncrementalUpdate != *((_DWORD *)v4 + 18))
      goto LABEL_83;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_daysProcessedDuringIncrementalUpdate != *((_DWORD *)v4 + 19))
      goto LABEL_83;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x400) == 0 || self->_mailsProcessedDuringIncrementalUpdate != *((_DWORD *)v4 + 24))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 66) & 0x400) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_deletedTokensCountToComplyToCappingPolicy != *((_DWORD *)v4 + 21))
      goto LABEL_83;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_deletedEmailsCount != *((_DWORD *)v4 + 20))
      goto LABEL_83;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x1000) == 0
      || self->_rollbackedSlicesCountToComplyToPostDeletionPolicy != *((_DWORD *)v4 + 26))
    {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x1000) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x800) == 0
      || self->_rollbackedEmailsCountToComplyToPostDeletionPolicy != *((_DWORD *)v4 + 25))
    {
      goto LABEL_83;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x800) != 0)
  {
    goto LABEL_83;
  }
  submodelsStats = self->_submodelsStats;
  if ((unint64_t)submodelsStats | *((_QWORD *)v4 + 14))
  {
    if (-[SGMIMetricsSubmodelsStats isEqual:](submodelsStats, "isEqual:"))
    {
      has = (__int16)self->_has;
      v8 = *((_WORD *)v4 + 66);
      goto LABEL_63;
    }
LABEL_83:
    v10 = 0;
    goto LABEL_84;
  }
LABEL_63:
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_biomeAggregationPerformanceInMilliSeconds != *((_QWORD *)v4 + 4))
      goto LABEL_83;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_submodelsUpdatePerformanceInMilliSeconds != *((_QWORD *)v4 + 7))
      goto LABEL_83;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds != *((_QWORD *)v4 + 6))
      goto LABEL_83;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0
      || self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds != *((_QWORD *)v4 + 5))
    {
      goto LABEL_83;
    }
    v10 = 1;
  }
  else
  {
    v10 = (v8 & 2) == 0;
  }
LABEL_84:

  return v10;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v24 = -[SGMIMetricsTrialMetadata hash](self->_trialMetadata, "hash");
  v23 = -[SGMIMetricsTrialMetadata hash](self->_backgroundTrialMetadata, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    v22 = 2654435761 * self->_hoursSinceReference;
  else
    v22 = 0;
  v21 = PBRepeatedInt32Hash();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v20 = 2654435761 * self->_hoursSinceLastIncrementalUpdate;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_6:
      v18 = 2654435761 * self->_isSubmodelRebuilt;
      if ((has & 0x10) != 0)
        goto LABEL_7;
      goto LABEL_16;
    }
  }
  else
  {
    v20 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_6;
  }
  v18 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_daysAvailableDuringIncrementalUpdate;
    if ((has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v4 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    v5 = 2654435761 * self->_daysProcessedDuringIncrementalUpdate;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    v6 = 2654435761 * self->_mailsProcessedDuringIncrementalUpdate;
    if ((has & 0x80) != 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    v7 = 2654435761 * self->_deletedTokensCountToComplyToCappingPolicy;
    if ((has & 0x40) != 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_11:
    v8 = 2654435761 * self->_deletedEmailsCount;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_12;
LABEL_21:
    v9 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_13;
    goto LABEL_22;
  }
LABEL_20:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_21;
LABEL_12:
  v9 = 2654435761 * self->_rollbackedSlicesCountToComplyToPostDeletionPolicy;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_13:
    v10 = 2654435761 * self->_rollbackedEmailsCountToComplyToPostDeletionPolicy;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
LABEL_23:
  v11 = -[SGMIMetricsSubmodelsStats hash](self->_submodelsStats, "hash", v18);
  v12 = (__int16)self->_has;
  if ((v12 & 1) != 0)
  {
    v13 = 2654435761u * self->_biomeAggregationPerformanceInMilliSeconds;
    if ((v12 & 8) != 0)
    {
LABEL_25:
      v14 = 2654435761u * self->_submodelsUpdatePerformanceInMilliSeconds;
      if ((v12 & 4) != 0)
        goto LABEL_26;
LABEL_30:
      v15 = 0;
      if ((v12 & 2) != 0)
        goto LABEL_27;
LABEL_31:
      v16 = 0;
      return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    v13 = 0;
    if ((v12 & 8) != 0)
      goto LABEL_25;
  }
  v14 = 0;
  if ((v12 & 4) == 0)
    goto LABEL_30;
LABEL_26:
  v15 = 2654435761u * self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds;
  if ((v12 & 2) == 0)
    goto LABEL_31;
LABEL_27:
  v16 = 2654435761u * self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SGMIMetricsTrialMetadata *trialMetadata;
  uint64_t v6;
  SGMIMetricsTrialMetadata *backgroundTrialMetadata;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  __int16 v13;
  SGMIMetricsSubmodelsStats *submodelsStats;
  uint64_t v15;
  __int16 v16;
  id v17;

  v4 = a3;
  trialMetadata = self->_trialMetadata;
  v6 = *((_QWORD *)v4 + 15);
  v17 = v4;
  if (trialMetadata)
  {
    if (!v6)
      goto LABEL_7;
    -[SGMIMetricsTrialMetadata mergeFrom:](trialMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SGMIMetricsUpdateProcessInformation setTrialMetadata:](self, "setTrialMetadata:");
  }
  v4 = v17;
LABEL_7:
  backgroundTrialMetadata = self->_backgroundTrialMetadata;
  v8 = *((_QWORD *)v4 + 8);
  if (backgroundTrialMetadata)
  {
    if (!v8)
      goto LABEL_13;
    -[SGMIMetricsTrialMetadata mergeFrom:](backgroundTrialMetadata, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[SGMIMetricsUpdateProcessInformation setBackgroundTrialMetadata:](self, "setBackgroundTrialMetadata:");
  }
  v4 = v17;
LABEL_13:
  if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    self->_hoursSinceReference = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_has |= 0x200u;
  }
  v9 = objc_msgSend(v4, "ctsJobConstraintsCount");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
      -[SGMIMetricsUpdateProcessInformation addCtsJobConstraints:](self, "addCtsJobConstraints:", objc_msgSend(v17, "ctsJobConstraintsAtIndex:", i));
  }
  v12 = v17;
  v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x100) != 0)
  {
    self->_hoursSinceLastIncrementalUpdate = *((_DWORD *)v17 + 22);
    *(_WORD *)&self->_has |= 0x100u;
    v13 = *((_WORD *)v17 + 66);
    if ((v13 & 0x2000) == 0)
    {
LABEL_20:
      if ((v13 & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_33;
    }
  }
  else if ((*((_WORD *)v17 + 66) & 0x2000) == 0)
  {
    goto LABEL_20;
  }
  self->_isSubmodelRebuilt = *((_BYTE *)v17 + 128);
  *(_WORD *)&self->_has |= 0x2000u;
  v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x10) == 0)
  {
LABEL_21:
    if ((v13 & 0x20) == 0)
      goto LABEL_22;
    goto LABEL_34;
  }
LABEL_33:
  self->_daysAvailableDuringIncrementalUpdate = *((_DWORD *)v17 + 18);
  *(_WORD *)&self->_has |= 0x10u;
  v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x20) == 0)
  {
LABEL_22:
    if ((v13 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_35;
  }
LABEL_34:
  self->_daysProcessedDuringIncrementalUpdate = *((_DWORD *)v17 + 19);
  *(_WORD *)&self->_has |= 0x20u;
  v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x400) == 0)
  {
LABEL_23:
    if ((v13 & 0x80) == 0)
      goto LABEL_24;
    goto LABEL_36;
  }
LABEL_35:
  self->_mailsProcessedDuringIncrementalUpdate = *((_DWORD *)v17 + 24);
  *(_WORD *)&self->_has |= 0x400u;
  v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x80) == 0)
  {
LABEL_24:
    if ((v13 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_37;
  }
LABEL_36:
  self->_deletedTokensCountToComplyToCappingPolicy = *((_DWORD *)v17 + 21);
  *(_WORD *)&self->_has |= 0x80u;
  v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x40) == 0)
  {
LABEL_25:
    if ((v13 & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_38;
  }
LABEL_37:
  self->_deletedEmailsCount = *((_DWORD *)v17 + 20);
  *(_WORD *)&self->_has |= 0x40u;
  v13 = *((_WORD *)v17 + 66);
  if ((v13 & 0x1000) == 0)
  {
LABEL_26:
    if ((v13 & 0x800) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_38:
  self->_rollbackedSlicesCountToComplyToPostDeletionPolicy = *((_DWORD *)v17 + 26);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v17 + 66) & 0x800) != 0)
  {
LABEL_27:
    self->_rollbackedEmailsCountToComplyToPostDeletionPolicy = *((_DWORD *)v17 + 25);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_28:
  submodelsStats = self->_submodelsStats;
  v15 = *((_QWORD *)v17 + 14);
  if (submodelsStats)
  {
    if (!v15)
      goto LABEL_43;
    -[SGMIMetricsSubmodelsStats mergeFrom:](submodelsStats, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_43;
    -[SGMIMetricsUpdateProcessInformation setSubmodelsStats:](self, "setSubmodelsStats:");
  }
  v12 = v17;
LABEL_43:
  v16 = *((_WORD *)v12 + 66);
  if ((v16 & 1) != 0)
  {
    self->_biomeAggregationPerformanceInMilliSeconds = *((_QWORD *)v12 + 4);
    *(_WORD *)&self->_has |= 1u;
    v16 = *((_WORD *)v12 + 66);
    if ((v16 & 8) == 0)
    {
LABEL_45:
      if ((v16 & 4) == 0)
        goto LABEL_46;
LABEL_51:
      self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds = *((_QWORD *)v12 + 6);
      *(_WORD *)&self->_has |= 4u;
      if ((*((_WORD *)v12 + 66) & 2) == 0)
        goto LABEL_48;
      goto LABEL_47;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_45;
  }
  self->_submodelsUpdatePerformanceInMilliSeconds = *((_QWORD *)v12 + 7);
  *(_WORD *)&self->_has |= 8u;
  v16 = *((_WORD *)v12 + 66);
  if ((v16 & 4) != 0)
    goto LABEL_51;
LABEL_46:
  if ((v16 & 2) != 0)
  {
LABEL_47:
    self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds = *((_QWORD *)v12 + 5);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_48:

}

- (SGMIMetricsTrialMetadata)trialMetadata
{
  return self->_trialMetadata;
}

- (void)setTrialMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_trialMetadata, a3);
}

- (SGMIMetricsTrialMetadata)backgroundTrialMetadata
{
  return self->_backgroundTrialMetadata;
}

- (void)setBackgroundTrialMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTrialMetadata, a3);
}

- (unsigned)hoursSinceReference
{
  return self->_hoursSinceReference;
}

- (unsigned)hoursSinceLastIncrementalUpdate
{
  return self->_hoursSinceLastIncrementalUpdate;
}

- (BOOL)isSubmodelRebuilt
{
  return self->_isSubmodelRebuilt;
}

- (unsigned)daysAvailableDuringIncrementalUpdate
{
  return self->_daysAvailableDuringIncrementalUpdate;
}

- (unsigned)daysProcessedDuringIncrementalUpdate
{
  return self->_daysProcessedDuringIncrementalUpdate;
}

- (unsigned)mailsProcessedDuringIncrementalUpdate
{
  return self->_mailsProcessedDuringIncrementalUpdate;
}

- (unsigned)deletedTokensCountToComplyToCappingPolicy
{
  return self->_deletedTokensCountToComplyToCappingPolicy;
}

- (unsigned)deletedEmailsCount
{
  return self->_deletedEmailsCount;
}

- (unsigned)rollbackedSlicesCountToComplyToPostDeletionPolicy
{
  return self->_rollbackedSlicesCountToComplyToPostDeletionPolicy;
}

- (unsigned)rollbackedEmailsCountToComplyToPostDeletionPolicy
{
  return self->_rollbackedEmailsCountToComplyToPostDeletionPolicy;
}

- (SGMIMetricsSubmodelsStats)submodelsStats
{
  return self->_submodelsStats;
}

- (void)setSubmodelsStats:(id)a3
{
  objc_storeStrong((id *)&self->_submodelsStats, a3);
}

- (unint64_t)biomeAggregationPerformanceInMilliSeconds
{
  return self->_biomeAggregationPerformanceInMilliSeconds;
}

- (unint64_t)submodelsUpdatePerformanceInMilliSeconds
{
  return self->_submodelsUpdatePerformanceInMilliSeconds;
}

- (unint64_t)submodelsPruningForCappingPolicyPerformanceInMilliSeconds
{
  return self->_submodelsPruningForCappingPolicyPerformanceInMilliSeconds;
}

- (unint64_t)cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds
{
  return self->_cumulatedSubmodelsRollbackForPostDeletionPolicyPerformanceInMilliSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialMetadata, 0);
  objc_storeStrong((id *)&self->_submodelsStats, 0);
  objc_storeStrong((id *)&self->_backgroundTrialMetadata, 0);
}

@end
