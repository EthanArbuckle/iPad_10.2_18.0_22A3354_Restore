@implementation PNRProvisionalPlannerGrainMetricsDimension

- (BOOL)hasPlanningStep
{
  return self->_planningStep != 0;
}

- (void)deletePlanningStep
{
  -[PNRProvisionalPlannerGrainMetricsDimension setPlanningStep:](self, "setPlanningStep:", 0);
}

- (void)setNumQueriesCreated:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numQueriesCreated = a3;
}

- (BOOL)hasNumQueriesCreated
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumQueriesCreated:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumQueriesCreated
{
  -[PNRProvisionalPlannerGrainMetricsDimension setNumQueriesCreated:](self, "setNumQueriesCreated:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumQueriesExecuted:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numQueriesExecuted = a3;
}

- (BOOL)hasNumQueriesExecuted
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumQueriesExecuted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumQueriesExecuted
{
  -[PNRProvisionalPlannerGrainMetricsDimension setNumQueriesExecuted:](self, "setNumQueriesExecuted:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumClientActionCreated:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numClientActionCreated = a3;
}

- (BOOL)hasNumClientActionCreated
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumClientActionCreated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumClientActionCreated
{
  -[PNRProvisionalPlannerGrainMetricsDimension setNumClientActionCreated:](self, "setNumClientActionCreated:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setNumSystemPromptResolved:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numSystemPromptResolved = a3;
}

- (BOOL)hasNumSystemPromptResolved
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNumSystemPromptResolved:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteNumSystemPromptResolved
{
  -[PNRProvisionalPlannerGrainMetricsDimension setNumSystemPromptResolved:](self, "setNumSystemPromptResolved:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (BOOL)hasPlannerResponseTime
{
  return self->_plannerResponseTime != 0;
}

- (void)deletePlannerResponseTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setPlannerResponseTime:](self, "setPlannerResponseTime:", 0);
}

- (BOOL)hasStartToPlanCreatedTime
{
  return self->_startToPlanCreatedTime != 0;
}

- (void)deleteStartToPlanCreatedTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setStartToPlanCreatedTime:](self, "setStartToPlanCreatedTime:", 0);
}

- (BOOL)hasStartToLastQueryDecorationEventTime
{
  return self->_startToLastQueryDecorationEventTime != 0;
}

- (void)deleteStartToLastQueryDecorationEventTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setStartToLastQueryDecorationEventTime:](self, "setStartToLastQueryDecorationEventTime:", 0);
}

- (BOOL)hasLastQueryDecorationEventToPlanCreatedTime
{
  return self->_lastQueryDecorationEventToPlanCreatedTime != 0;
}

- (void)deleteLastQueryDecorationEventToPlanCreatedTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setLastQueryDecorationEventToPlanCreatedTime:](self, "setLastQueryDecorationEventToPlanCreatedTime:", 0);
}

- (BOOL)hasPlanCreatedToResolutionTime
{
  return self->_planCreatedToResolutionTime != 0;
}

- (void)deletePlanCreatedToResolutionTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setPlanCreatedToResolutionTime:](self, "setPlanCreatedToResolutionTime:", 0);
}

- (BOOL)hasResolutionToResponseGeneratedTime
{
  return self->_resolutionToResponseGeneratedTime != 0;
}

- (void)deleteResolutionToResponseGeneratedTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setResolutionToResponseGeneratedTime:](self, "setResolutionToResponseGeneratedTime:", 0);
}

- (BOOL)hasStartToContextRetrievedTime
{
  return self->_startToContextRetrievedTime != 0;
}

- (void)deleteStartToContextRetrievedTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setStartToContextRetrievedTime:](self, "setStartToContextRetrievedTime:", 0);
}

- (BOOL)hasStartToToolsRetrievedTime
{
  return self->_startToToolsRetrievedTime != 0;
}

- (void)deleteStartToToolsRetrievedTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setStartToToolsRetrievedTime:](self, "setStartToToolsRetrievedTime:", 0);
}

- (BOOL)hasStartToEntitySpanMatchedTime
{
  return self->_startToEntitySpanMatchedTime != 0;
}

- (void)deleteStartToEntitySpanMatchedTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setStartToEntitySpanMatchedTime:](self, "setStartToEntitySpanMatchedTime:", 0);
}

- (BOOL)hasPlanCreatedToResolverRequestTime
{
  return self->_planCreatedToResolverRequestTime != 0;
}

- (void)deletePlanCreatedToResolverRequestTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setPlanCreatedToResolverRequestTime:](self, "setPlanCreatedToResolverRequestTime:", 0);
}

- (BOOL)hasResolverRequestToResolutionTime
{
  return self->_resolverRequestToResolutionTime != 0;
}

- (void)deleteResolverRequestToResolutionTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setResolverRequestToResolutionTime:](self, "setResolverRequestToResolutionTime:", 0);
}

- (BOOL)hasResolverTotalQueryTime
{
  return self->_resolverTotalQueryTime != 0;
}

- (void)deleteResolverTotalQueryTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setResolverTotalQueryTime:](self, "setResolverTotalQueryTime:", 0);
}

- (BOOL)hasResolverTotalClientActionTime
{
  return self->_resolverTotalClientActionTime != 0;
}

- (void)deleteResolverTotalClientActionTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setResolverTotalClientActionTime:](self, "setResolverTotalClientActionTime:", 0);
}

- (BOOL)hasResolverFirstSystemPromptToResolutionTime
{
  return self->_resolverFirstSystemPromptToResolutionTime != 0;
}

- (void)deleteResolverFirstSystemPromptToResolutionTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setResolverFirstSystemPromptToResolutionTime:](self, "setResolverFirstSystemPromptToResolutionTime:", 0);
}

- (void)setNumPlansCreated:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numPlansCreated = a3;
}

- (BOOL)hasNumPlansCreated
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasNumPlansCreated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteNumPlansCreated
{
  -[PNRProvisionalPlannerGrainMetricsDimension setNumPlansCreated:](self, "setNumPlansCreated:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setNumActionResolverRequests:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_numActionResolverRequests = a3;
}

- (BOOL)hasNumActionResolverRequests
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasNumActionResolverRequests:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteNumActionResolverRequests
{
  -[PNRProvisionalPlannerGrainMetricsDimension setNumActionResolverRequests:](self, "setNumActionResolverRequests:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setNumStatementEvaluatedFromPlanner:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_numStatementEvaluatedFromPlanner = a3;
}

- (BOOL)hasNumStatementEvaluatedFromPlanner
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasNumStatementEvaluatedFromPlanner:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteNumStatementEvaluatedFromPlanner
{
  -[PNRProvisionalPlannerGrainMetricsDimension setNumStatementEvaluatedFromPlanner:](self, "setNumStatementEvaluatedFromPlanner:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (void)setNumCriticalErrors:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_numCriticalErrors = a3;
}

- (BOOL)hasNumCriticalErrors
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasNumCriticalErrors:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (void)deleteNumCriticalErrors
{
  -[PNRProvisionalPlannerGrainMetricsDimension setNumCriticalErrors:](self, "setNumCriticalErrors:", 0);
  *(_BYTE *)&self->_has &= ~0x80u;
}

- (BOOL)hasStartToLastResolverEventTime
{
  return self->_startToLastResolverEventTime != 0;
}

- (void)deleteStartToLastResolverEventTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setStartToLastResolverEventTime:](self, "setStartToLastResolverEventTime:", 0);
}

- (BOOL)hasStartToActionResolverRequestTime
{
  return self->_startToActionResolverRequestTime != 0;
}

- (void)deleteStartToActionResolverRequestTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setStartToActionResolverRequestTime:](self, "setStartToActionResolverRequestTime:", 0);
}

- (BOOL)hasLastResolverEventToResponseGeneratedTime
{
  return self->_lastResolverEventToResponseGeneratedTime != 0;
}

- (void)deleteLastResolverEventToResponseGeneratedTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setLastResolverEventToResponseGeneratedTime:](self, "setLastResolverEventToResponseGeneratedTime:", 0);
}

- (BOOL)hasActionResolverRequestToLastResolverEventTime
{
  return self->_actionResolverRequestToLastResolverEventTime != 0;
}

- (void)deleteActionResolverRequestToLastResolverEventTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setActionResolverRequestToLastResolverEventTime:](self, "setActionResolverRequestToLastResolverEventTime:", 0);
}

- (BOOL)hasPlanCreatedToLastResolverEventTime
{
  return self->_planCreatedToLastResolverEventTime != 0;
}

- (void)deletePlanCreatedToLastResolverEventTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setPlanCreatedToLastResolverEventTime:](self, "setPlanCreatedToLastResolverEventTime:", 0);
}

- (BOOL)hasPlanCreatedToActionResolverRequestTime
{
  return self->_planCreatedToActionResolverRequestTime != 0;
}

- (void)deletePlanCreatedToActionResolverRequestTime
{
  -[PNRProvisionalPlannerGrainMetricsDimension setPlanCreatedToActionResolverRequestTime:](self, "setPlanCreatedToActionResolverRequestTime:", 0);
}

- (BOOL)hasPlannerGrainStage
{
  return self->_plannerGrainStage != 0;
}

- (void)deletePlannerGrainStage
{
  -[PNRProvisionalPlannerGrainMetricsDimension setPlannerGrainStage:](self, "setPlannerGrainStage:", 0);
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
  -[PNRProvisionalPlannerGrainMetricsDimension setFailureInfo:](self, "setFailureInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalPlannerGrainMetricsDimensionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;

  v51 = a3;
  -[PNRProvisionalPlannerGrainMetricsDimension planningStep](self, "planningStep");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_59;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:
  -[PNRProvisionalPlannerGrainMetricsDimension plannerResponseTime](self, "plannerResponseTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension plannerResponseTime](self, "plannerResponseTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToPlanCreatedTime](self, "startToPlanCreatedTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToPlanCreatedTime](self, "startToPlanCreatedTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolutionTime](self, "planCreatedToResolutionTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolutionTime](self, "planCreatedToResolutionTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension resolutionToResponseGeneratedTime](self, "resolutionToResponseGeneratedTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension resolutionToResponseGeneratedTime](self, "resolutionToResponseGeneratedTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToContextRetrievedTime](self, "startToContextRetrievedTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToContextRetrievedTime](self, "startToContextRetrievedTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolverRequestTime](self, "planCreatedToResolverRequestTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolverRequestTime](self, "planCreatedToResolverRequestTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension resolverRequestToResolutionTime](self, "resolverRequestToResolutionTime");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension resolverRequestToResolutionTime](self, "resolverRequestToResolutionTime");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalQueryTime](self, "resolverTotalQueryTime");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalQueryTime](self, "resolverTotalQueryTime");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalClientActionTime](self, "resolverTotalClientActionTime");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalClientActionTime](self, "resolverTotalClientActionTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension resolverFirstSystemPromptToResolutionTime](self, "resolverFirstSystemPromptToResolutionTime");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension resolverFirstSystemPromptToResolutionTime](self, "resolverFirstSystemPromptToResolutionTime");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v34 = (char)self->_has;
  if ((v34 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v34 = (char)self->_has;
    if ((v34 & 0x20) == 0)
    {
LABEL_38:
      if ((v34 & 0x40) == 0)
        goto LABEL_39;
LABEL_63:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_has & 0x80) == 0)
        goto LABEL_40;
      goto LABEL_64;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_38;
  }
  PBDataWriterWriteInt32Field();
  v34 = (char)self->_has;
  if ((v34 & 0x40) != 0)
    goto LABEL_63;
LABEL_39:
  if ((v34 & 0x80) == 0)
    goto LABEL_40;
LABEL_64:
  PBDataWriterWriteInt32Field();
LABEL_40:
  -[PNRProvisionalPlannerGrainMetricsDimension startToLastResolverEventTime](self, "startToLastResolverEventTime");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToLastResolverEventTime](self, "startToLastResolverEventTime");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalPlannerGrainMetricsDimension plannerGrainStage](self, "plannerGrainStage");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
    PBDataWriterWriteStringField();
  -[PNRProvisionalPlannerGrainMetricsDimension failureInfo](self, "failureInfo");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = v51;
  if (v48)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension failureInfo](self, "failureInfo");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v49 = v51;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  $953F8AC6BAE7205F228116AF38C4AAF6 has;
  unsigned int v13;
  int numQueriesCreated;
  int v15;
  int numQueriesExecuted;
  int v17;
  int numClientActionCreated;
  int v19;
  int numSystemPromptResolved;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  $953F8AC6BAE7205F228116AF38C4AAF6 v91;
  int v92;
  unsigned int v93;
  int numPlansCreated;
  int v95;
  int numActionResolverRequests;
  int v97;
  int numStatementEvaluatedFromPlanner;
  int numCriticalErrors;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  int v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  char v139;
  BOOL v140;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_147;
  -[PNRProvisionalPlannerGrainMetricsDimension planningStep](self, "planningStep");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planningStep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension planningStep](self, "planningStep");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PNRProvisionalPlannerGrainMetricsDimension planningStep](self, "planningStep");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planningStep");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_147;
  }
  else
  {

  }
  has = self->_has;
  v13 = v4[224];
  if ((*(_BYTE *)&has & 1) != (v13 & 1))
    goto LABEL_147;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numQueriesCreated = self->_numQueriesCreated;
    if (numQueriesCreated != objc_msgSend(v4, "numQueriesCreated"))
      goto LABEL_147;
    has = self->_has;
    v13 = v4[224];
  }
  v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1))
    goto LABEL_147;
  if (v15)
  {
    numQueriesExecuted = self->_numQueriesExecuted;
    if (numQueriesExecuted != objc_msgSend(v4, "numQueriesExecuted"))
      goto LABEL_147;
    has = self->_has;
    v13 = v4[224];
  }
  v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1))
    goto LABEL_147;
  if (v17)
  {
    numClientActionCreated = self->_numClientActionCreated;
    if (numClientActionCreated != objc_msgSend(v4, "numClientActionCreated"))
      goto LABEL_147;
    has = self->_has;
    v13 = v4[224];
  }
  v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1))
    goto LABEL_147;
  if (v19)
  {
    numSystemPromptResolved = self->_numSystemPromptResolved;
    if (numSystemPromptResolved != objc_msgSend(v4, "numSystemPromptResolved"))
      goto LABEL_147;
  }
  -[PNRProvisionalPlannerGrainMetricsDimension plannerResponseTime](self, "plannerResponseTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plannerResponseTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension plannerResponseTime](self, "plannerResponseTime");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[PNRProvisionalPlannerGrainMetricsDimension plannerResponseTime](self, "plannerResponseTime");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plannerResponseTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToPlanCreatedTime](self, "startToPlanCreatedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToPlanCreatedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension startToPlanCreatedTime](self, "startToPlanCreatedTime");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[PNRProvisionalPlannerGrainMetricsDimension startToPlanCreatedTime](self, "startToPlanCreatedTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToPlanCreatedTime");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToLastQueryDecorationEventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[PNRProvisionalPlannerGrainMetricsDimension startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToLastQueryDecorationEventTime");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastQueryDecorationEventToPlanCreatedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[PNRProvisionalPlannerGrainMetricsDimension lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastQueryDecorationEventToPlanCreatedTime");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolutionTime](self, "planCreatedToResolutionTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planCreatedToResolutionTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolutionTime](self, "planCreatedToResolutionTime");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolutionTime](self, "planCreatedToResolutionTime");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planCreatedToResolutionTime");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "isEqual:", v44);

    if (!v45)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension resolutionToResponseGeneratedTime](self, "resolutionToResponseGeneratedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolutionToResponseGeneratedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension resolutionToResponseGeneratedTime](self, "resolutionToResponseGeneratedTime");
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v47 = (void *)v46;
    -[PNRProvisionalPlannerGrainMetricsDimension resolutionToResponseGeneratedTime](self, "resolutionToResponseGeneratedTime");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolutionToResponseGeneratedTime");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "isEqual:", v49);

    if (!v50)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToContextRetrievedTime](self, "startToContextRetrievedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToContextRetrievedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension startToContextRetrievedTime](self, "startToContextRetrievedTime");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    -[PNRProvisionalPlannerGrainMetricsDimension startToContextRetrievedTime](self, "startToContextRetrievedTime");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToContextRetrievedTime");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isEqual:", v54);

    if (!v55)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToToolsRetrievedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
  v56 = objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    v57 = (void *)v56;
    -[PNRProvisionalPlannerGrainMetricsDimension startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToToolsRetrievedTime");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "isEqual:", v59);

    if (!v60)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToEntitySpanMatchedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
  v61 = objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v62 = (void *)v61;
    -[PNRProvisionalPlannerGrainMetricsDimension startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToEntitySpanMatchedTime");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "isEqual:", v64);

    if (!v65)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolverRequestTime](self, "planCreatedToResolverRequestTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planCreatedToResolverRequestTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolverRequestTime](self, "planCreatedToResolverRequestTime");
  v66 = objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    v67 = (void *)v66;
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolverRequestTime](self, "planCreatedToResolverRequestTime");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planCreatedToResolverRequestTime");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "isEqual:", v69);

    if (!v70)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension resolverRequestToResolutionTime](self, "resolverRequestToResolutionTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolverRequestToResolutionTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension resolverRequestToResolutionTime](self, "resolverRequestToResolutionTime");
  v71 = objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v72 = (void *)v71;
    -[PNRProvisionalPlannerGrainMetricsDimension resolverRequestToResolutionTime](self, "resolverRequestToResolutionTime");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolverRequestToResolutionTime");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v73, "isEqual:", v74);

    if (!v75)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalQueryTime](self, "resolverTotalQueryTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolverTotalQueryTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalQueryTime](self, "resolverTotalQueryTime");
  v76 = objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    v77 = (void *)v76;
    -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalQueryTime](self, "resolverTotalQueryTime");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolverTotalQueryTime");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v78, "isEqual:", v79);

    if (!v80)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalClientActionTime](self, "resolverTotalClientActionTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolverTotalClientActionTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalClientActionTime](self, "resolverTotalClientActionTime");
  v81 = objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v82 = (void *)v81;
    -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalClientActionTime](self, "resolverTotalClientActionTime");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolverTotalClientActionTime");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqual:", v84);

    if (!v85)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension resolverFirstSystemPromptToResolutionTime](self, "resolverFirstSystemPromptToResolutionTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolverFirstSystemPromptToResolutionTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension resolverFirstSystemPromptToResolutionTime](self, "resolverFirstSystemPromptToResolutionTime");
  v86 = objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    v87 = (void *)v86;
    -[PNRProvisionalPlannerGrainMetricsDimension resolverFirstSystemPromptToResolutionTime](self, "resolverFirstSystemPromptToResolutionTime");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resolverFirstSystemPromptToResolutionTime");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v88, "isEqual:", v89);

    if (!v90)
      goto LABEL_147;
  }
  else
  {

  }
  v91 = self->_has;
  v92 = (*(unsigned int *)&v91 >> 4) & 1;
  v93 = v4[224];
  if (v92 != ((v93 >> 4) & 1))
    goto LABEL_147;
  if (v92)
  {
    numPlansCreated = self->_numPlansCreated;
    if (numPlansCreated != objc_msgSend(v4, "numPlansCreated"))
      goto LABEL_147;
    v91 = self->_has;
    v93 = v4[224];
  }
  v95 = (*(unsigned int *)&v91 >> 5) & 1;
  if (v95 != ((v93 >> 5) & 1))
    goto LABEL_147;
  if (v95)
  {
    numActionResolverRequests = self->_numActionResolverRequests;
    if (numActionResolverRequests != objc_msgSend(v4, "numActionResolverRequests"))
      goto LABEL_147;
    v91 = self->_has;
    v93 = v4[224];
  }
  v97 = (*(unsigned int *)&v91 >> 6) & 1;
  if (v97 != ((v93 >> 6) & 1))
    goto LABEL_147;
  if (v97)
  {
    numStatementEvaluatedFromPlanner = self->_numStatementEvaluatedFromPlanner;
    if (numStatementEvaluatedFromPlanner != objc_msgSend(v4, "numStatementEvaluatedFromPlanner"))
      goto LABEL_147;
    v91 = self->_has;
    v93 = v4[224];
  }
  if (((v93 ^ *(_DWORD *)&v91) & 0x80) != 0)
    goto LABEL_147;
  if ((*(_BYTE *)&v91 & 0x80) != 0)
  {
    numCriticalErrors = self->_numCriticalErrors;
    if (numCriticalErrors != objc_msgSend(v4, "numCriticalErrors"))
      goto LABEL_147;
  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToLastResolverEventTime](self, "startToLastResolverEventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToLastResolverEventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension startToLastResolverEventTime](self, "startToLastResolverEventTime");
  v100 = objc_claimAutoreleasedReturnValue();
  if (v100)
  {
    v101 = (void *)v100;
    -[PNRProvisionalPlannerGrainMetricsDimension startToLastResolverEventTime](self, "startToLastResolverEventTime");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToLastResolverEventTime");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v102, "isEqual:", v103);

    if (!v104)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startToActionResolverRequestTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
  v105 = objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    v106 = (void *)v105;
    -[PNRProvisionalPlannerGrainMetricsDimension startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startToActionResolverRequestTime");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v107, "isEqual:", v108);

    if (!v109)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastResolverEventToResponseGeneratedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
  v110 = objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    v111 = (void *)v110;
    -[PNRProvisionalPlannerGrainMetricsDimension lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastResolverEventToResponseGeneratedTime");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v112, "isEqual:", v113);

    if (!v114)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionResolverRequestToLastResolverEventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
  v115 = objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    v116 = (void *)v115;
    -[PNRProvisionalPlannerGrainMetricsDimension actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionResolverRequestToLastResolverEventTime");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v117, "isEqual:", v118);

    if (!v119)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planCreatedToLastResolverEventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
  v120 = objc_claimAutoreleasedReturnValue();
  if (v120)
  {
    v121 = (void *)v120;
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planCreatedToLastResolverEventTime");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v122, "isEqual:", v123);

    if (!v124)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planCreatedToActionResolverRequestTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
  v125 = objc_claimAutoreleasedReturnValue();
  if (v125)
  {
    v126 = (void *)v125;
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "planCreatedToActionResolverRequestTime");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v127, "isEqual:", v128);

    if (!v129)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension plannerGrainStage](self, "plannerGrainStage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plannerGrainStage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_146;
  -[PNRProvisionalPlannerGrainMetricsDimension plannerGrainStage](self, "plannerGrainStage");
  v130 = objc_claimAutoreleasedReturnValue();
  if (v130)
  {
    v131 = (void *)v130;
    -[PNRProvisionalPlannerGrainMetricsDimension plannerGrainStage](self, "plannerGrainStage");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "plannerGrainStage");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v132, "isEqual:", v133);

    if (!v134)
      goto LABEL_147;
  }
  else
  {

  }
  -[PNRProvisionalPlannerGrainMetricsDimension failureInfo](self, "failureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_146:

    goto LABEL_147;
  }
  -[PNRProvisionalPlannerGrainMetricsDimension failureInfo](self, "failureInfo");
  v135 = objc_claimAutoreleasedReturnValue();
  if (!v135)
  {

LABEL_150:
    v140 = 1;
    goto LABEL_148;
  }
  v136 = (void *)v135;
  -[PNRProvisionalPlannerGrainMetricsDimension failureInfo](self, "failureInfo");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failureInfo");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = objc_msgSend(v137, "isEqual:", v138);

  if ((v139 & 1) != 0)
    goto LABEL_150;
LABEL_147:
  v140 = 0;
LABEL_148:

  return v140;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSUInteger v28;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger v38;

  v3 = -[NSString hash](self->_planningStep, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_numQueriesCreated;
  else
    v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_numQueriesExecuted;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_numClientActionCreated;
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:
  v37 = v4;
  v38 = v3;
  v35 = v6;
  v36 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v7 = -[PNRProvisionalMetrics hash](self->_plannerResponseTime, "hash", 2654435761 * self->_numSystemPromptResolved);
  else
    v7 = -[PNRProvisionalMetrics hash](self->_plannerResponseTime, "hash", 0);
  v34 = v7;
  v32 = -[PNRProvisionalMetrics hash](self->_startToPlanCreatedTime, "hash");
  v8 = -[PNRProvisionalMetrics hash](self->_startToLastQueryDecorationEventTime, "hash");
  v9 = -[PNRProvisionalMetrics hash](self->_lastQueryDecorationEventToPlanCreatedTime, "hash");
  v10 = -[PNRProvisionalMetrics hash](self->_planCreatedToResolutionTime, "hash");
  v11 = -[PNRProvisionalMetrics hash](self->_resolutionToResponseGeneratedTime, "hash");
  v12 = -[PNRProvisionalMetrics hash](self->_startToContextRetrievedTime, "hash");
  v13 = -[PNRProvisionalMetrics hash](self->_startToToolsRetrievedTime, "hash");
  v31 = -[PNRProvisionalMetrics hash](self->_startToEntitySpanMatchedTime, "hash");
  v33 = -[PNRProvisionalMetrics hash](self->_planCreatedToResolverRequestTime, "hash");
  v14 = -[PNRProvisionalMetrics hash](self->_resolverRequestToResolutionTime, "hash");
  v15 = -[PNRProvisionalMetrics hash](self->_resolverTotalQueryTime, "hash");
  v16 = -[PNRProvisionalMetrics hash](self->_resolverTotalClientActionTime, "hash");
  v17 = -[PNRProvisionalMetrics hash](self->_resolverFirstSystemPromptToResolutionTime, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v18 = 2654435761 * self->_numPlansCreated;
  else
    v18 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v19 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_17;
LABEL_20:
    v20 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_18;
LABEL_21:
    v21 = 0;
    goto LABEL_22;
  }
  v19 = 2654435761 * self->_numActionResolverRequests;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_20;
LABEL_17:
  v20 = 2654435761 * self->_numStatementEvaluatedFromPlanner;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_21;
LABEL_18:
  v21 = 2654435761 * self->_numCriticalErrors;
LABEL_22:
  v22 = v37 ^ v38 ^ v36 ^ v35 ^ v30 ^ v34 ^ v32 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v31 ^ v33 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ -[PNRProvisionalMetrics hash](self->_startToLastResolverEventTime, "hash");
  v23 = -[PNRProvisionalMetrics hash](self->_startToActionResolverRequestTime, "hash");
  v24 = v23 ^ -[PNRProvisionalMetrics hash](self->_lastResolverEventToResponseGeneratedTime, "hash");
  v25 = v24 ^ -[PNRProvisionalMetrics hash](self->_actionResolverRequestToLastResolverEventTime, "hash");
  v26 = v25 ^ -[PNRProvisionalMetrics hash](self->_planCreatedToLastResolverEventTime, "hash");
  v27 = v26 ^ -[PNRProvisionalMetrics hash](self->_planCreatedToActionResolverRequestTime, "hash");
  v28 = v27 ^ -[NSString hash](self->_plannerGrainStage, "hash");
  return v22 ^ v28 ^ -[PNRProvisionalSageFailureInfo hash](self->_failureInfo, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char has;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionResolverRequestToLastResolverEventTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension actionResolverRequestToLastResolverEventTime](self, "actionResolverRequestToLastResolverEventTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionResolverRequestToLastResolverEventTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("actionResolverRequestToLastResolverEventTime"));

    }
  }
  if (self->_failureInfo)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension failureInfo](self, "failureInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("failureInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("failureInfo"));

    }
  }
  if (self->_lastQueryDecorationEventToPlanCreatedTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension lastQueryDecorationEventToPlanCreatedTime](self, "lastQueryDecorationEventToPlanCreatedTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("lastQueryDecorationEventToPlanCreatedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lastQueryDecorationEventToPlanCreatedTime"));

    }
  }
  if (self->_lastResolverEventToResponseGeneratedTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension lastResolverEventToResponseGeneratedTime](self, "lastResolverEventToResponseGeneratedTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("lastResolverEventToResponseGeneratedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("lastResolverEventToResponseGeneratedTime"));

    }
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numActionResolverRequests](self, "numActionResolverRequests"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numActionResolverRequests"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_23:
      if ((has & 0x80) == 0)
        goto LABEL_24;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numClientActionCreated](self, "numClientActionCreated"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("numClientActionCreated"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_24:
    if ((has & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numCriticalErrors](self, "numCriticalErrors"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("numCriticalErrors"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_25:
    if ((has & 1) == 0)
      goto LABEL_26;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numPlansCreated](self, "numPlansCreated"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("numPlansCreated"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_26:
    if ((has & 2) == 0)
      goto LABEL_27;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numQueriesCreated](self, "numQueriesCreated"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("numQueriesCreated"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0)
      goto LABEL_28;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numQueriesExecuted](self, "numQueriesExecuted"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("numQueriesExecuted"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 8) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numStatementEvaluatedFromPlanner](self, "numStatementEvaluatedFromPlanner"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("numStatementEvaluatedFromPlanner"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numSystemPromptResolved](self, "numSystemPromptResolved"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("numSystemPromptResolved"));

  }
LABEL_30:
  if (self->_planCreatedToActionResolverRequestTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToActionResolverRequestTime](self, "planCreatedToActionResolverRequestTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("planCreatedToActionResolverRequestTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("planCreatedToActionResolverRequestTime"));

    }
  }
  if (self->_planCreatedToLastResolverEventTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToLastResolverEventTime](self, "planCreatedToLastResolverEventTime");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("planCreatedToLastResolverEventTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("planCreatedToLastResolverEventTime"));

    }
  }
  if (self->_planCreatedToResolutionTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolutionTime](self, "planCreatedToResolutionTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("planCreatedToResolutionTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("planCreatedToResolutionTime"));

    }
  }
  if (self->_planCreatedToResolverRequestTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension planCreatedToResolverRequestTime](self, "planCreatedToResolverRequestTime");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("planCreatedToResolverRequestTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("planCreatedToResolverRequestTime"));

    }
  }
  if (self->_plannerGrainStage)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension plannerGrainStage](self, "plannerGrainStage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("plannerGrainStage"));

  }
  if (self->_plannerResponseTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension plannerResponseTime](self, "plannerResponseTime");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("plannerResponseTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("plannerResponseTime"));

    }
  }
  if (self->_planningStep)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension planningStep](self, "planningStep");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("planningStep"));

  }
  if (self->_resolutionToResponseGeneratedTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension resolutionToResponseGeneratedTime](self, "resolutionToResponseGeneratedTime");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("resolutionToResponseGeneratedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("resolutionToResponseGeneratedTime"));

    }
  }
  if (self->_resolverFirstSystemPromptToResolutionTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension resolverFirstSystemPromptToResolutionTime](self, "resolverFirstSystemPromptToResolutionTime");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("resolverFirstSystemPromptToResolutionTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("resolverFirstSystemPromptToResolutionTime"));

    }
  }
  if (self->_resolverRequestToResolutionTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension resolverRequestToResolutionTime](self, "resolverRequestToResolutionTime");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "dictionaryRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("resolverRequestToResolutionTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("resolverRequestToResolutionTime"));

    }
  }
  if (self->_resolverTotalClientActionTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalClientActionTime](self, "resolverTotalClientActionTime");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "dictionaryRepresentation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("resolverTotalClientActionTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("resolverTotalClientActionTime"));

    }
  }
  if (self->_resolverTotalQueryTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension resolverTotalQueryTime](self, "resolverTotalQueryTime");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "dictionaryRepresentation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("resolverTotalQueryTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v58, CFSTR("resolverTotalQueryTime"));

    }
  }
  if (self->_startToActionResolverRequestTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToActionResolverRequestTime](self, "startToActionResolverRequestTime");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "dictionaryRepresentation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("startToActionResolverRequestTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("startToActionResolverRequestTime"));

    }
  }
  if (self->_startToContextRetrievedTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToContextRetrievedTime](self, "startToContextRetrievedTime");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "dictionaryRepresentation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("startToContextRetrievedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("startToContextRetrievedTime"));

    }
  }
  if (self->_startToEntitySpanMatchedTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToEntitySpanMatchedTime](self, "startToEntitySpanMatchedTime");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "dictionaryRepresentation");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("startToEntitySpanMatchedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("startToEntitySpanMatchedTime"));

    }
  }
  if (self->_startToLastQueryDecorationEventTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToLastQueryDecorationEventTime](self, "startToLastQueryDecorationEventTime");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "dictionaryRepresentation");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("startToLastQueryDecorationEventTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("startToLastQueryDecorationEventTime"));

    }
  }
  if (self->_startToLastResolverEventTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToLastResolverEventTime](self, "startToLastResolverEventTime");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "dictionaryRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v72, CFSTR("startToLastResolverEventTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v73, CFSTR("startToLastResolverEventTime"));

    }
  }
  if (self->_startToPlanCreatedTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToPlanCreatedTime](self, "startToPlanCreatedTime");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "dictionaryRepresentation");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("startToPlanCreatedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v76, CFSTR("startToPlanCreatedTime"));

    }
  }
  if (self->_startToToolsRetrievedTime)
  {
    -[PNRProvisionalPlannerGrainMetricsDimension startToToolsRetrievedTime](self, "startToToolsRetrievedTime");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "dictionaryRepresentation");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (v78)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("startToToolsRetrievedTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v79, CFSTR("startToToolsRetrievedTime"));

    }
  }
  -[PNRProvisionalPlannerGrainMetricsDimension willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  v80 = v3;

  return v80;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRProvisionalPlannerGrainMetricsDimension dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (PNRProvisionalPlannerGrainMetricsDimension)initWithJSON:(id)a3
{
  void *v4;
  PNRProvisionalPlannerGrainMetricsDimension *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[PNRProvisionalPlannerGrainMetricsDimension initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRProvisionalPlannerGrainMetricsDimension)initWithDictionary:(id)a3
{
  id v4;
  PNRProvisionalPlannerGrainMetricsDimension *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PNRProvisionalMetrics *v13;
  uint64_t v14;
  PNRProvisionalMetrics *v15;
  uint64_t v16;
  PNRProvisionalMetrics *v17;
  uint64_t v18;
  PNRProvisionalMetrics *v19;
  uint64_t v20;
  PNRProvisionalMetrics *v21;
  uint64_t v22;
  PNRProvisionalMetrics *v23;
  uint64_t v24;
  PNRProvisionalMetrics *v25;
  uint64_t v26;
  PNRProvisionalMetrics *v27;
  uint64_t v28;
  PNRProvisionalMetrics *v29;
  uint64_t v30;
  PNRProvisionalMetrics *v31;
  uint64_t v32;
  PNRProvisionalMetrics *v33;
  uint64_t v34;
  PNRProvisionalMetrics *v35;
  uint64_t v36;
  PNRProvisionalMetrics *v37;
  uint64_t v38;
  PNRProvisionalMetrics *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  PNRProvisionalMetrics *v45;
  uint64_t v46;
  PNRProvisionalMetrics *v47;
  void *v48;
  PNRProvisionalMetrics *v49;
  void *v50;
  PNRProvisionalMetrics *v51;
  void *v52;
  PNRProvisionalMetrics *v53;
  void *v54;
  void *v55;
  PNRProvisionalMetrics *v56;
  void *v57;
  void *v58;
  void *v59;
  PNRProvisionalSageFailureInfo *v60;
  PNRProvisionalPlannerGrainMetricsDimension *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  objc_super v87;

  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)PNRProvisionalPlannerGrainMetricsDimension;
  v5 = -[PNRProvisionalPlannerGrainMetricsDimension init](&v87, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planningStep"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[PNRProvisionalPlannerGrainMetricsDimension setPlanningStep:](v5, "setPlanningStep:", v7);

    }
    v70 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numQueriesCreated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalPlannerGrainMetricsDimension setNumQueriesCreated:](v5, "setNumQueriesCreated:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numQueriesExecuted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalPlannerGrainMetricsDimension setNumQueriesExecuted:](v5, "setNumQueriesExecuted:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numClientActionCreated"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalPlannerGrainMetricsDimension setNumClientActionCreated:](v5, "setNumClientActionCreated:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numSystemPromptResolved"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalPlannerGrainMetricsDimension setNumSystemPromptResolved:](v5, "setNumSystemPromptResolved:", objc_msgSend(v11, "intValue"));
    v66 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plannerResponseTime"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = (void *)v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v12);
      -[PNRProvisionalPlannerGrainMetricsDimension setPlannerResponseTime:](v5, "setPlannerResponseTime:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToPlanCreatedTime"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = (void *)v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v14);
      -[PNRProvisionalPlannerGrainMetricsDimension setStartToPlanCreatedTime:](v5, "setStartToPlanCreatedTime:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToLastQueryDecorationEventTime"));
    v16 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = (void *)v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v16);
      -[PNRProvisionalPlannerGrainMetricsDimension setStartToLastQueryDecorationEventTime:](v5, "setStartToLastQueryDecorationEventTime:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastQueryDecorationEventToPlanCreatedTime"));
    v18 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = (void *)v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v18);
      -[PNRProvisionalPlannerGrainMetricsDimension setLastQueryDecorationEventToPlanCreatedTime:](v5, "setLastQueryDecorationEventToPlanCreatedTime:", v19);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planCreatedToResolutionTime"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = (void *)v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v20);
      -[PNRProvisionalPlannerGrainMetricsDimension setPlanCreatedToResolutionTime:](v5, "setPlanCreatedToResolutionTime:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolutionToResponseGeneratedTime"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = (void *)v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v22);
      -[PNRProvisionalPlannerGrainMetricsDimension setResolutionToResponseGeneratedTime:](v5, "setResolutionToResponseGeneratedTime:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToContextRetrievedTime"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v80 = (void *)v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v24);
      -[PNRProvisionalPlannerGrainMetricsDimension setStartToContextRetrievedTime:](v5, "setStartToContextRetrievedTime:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToToolsRetrievedTime"));
    v26 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v79 = (void *)v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v26);
      -[PNRProvisionalPlannerGrainMetricsDimension setStartToToolsRetrievedTime:](v5, "setStartToToolsRetrievedTime:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToEntitySpanMatchedTime"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = (void *)v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v28);
      -[PNRProvisionalPlannerGrainMetricsDimension setStartToEntitySpanMatchedTime:](v5, "setStartToEntitySpanMatchedTime:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planCreatedToResolverRequestTime"));
    v30 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v77 = (void *)v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v30);
      -[PNRProvisionalPlannerGrainMetricsDimension setPlanCreatedToResolverRequestTime:](v5, "setPlanCreatedToResolverRequestTime:", v31);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolverRequestToResolutionTime"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v76 = (void *)v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v32);
      -[PNRProvisionalPlannerGrainMetricsDimension setResolverRequestToResolutionTime:](v5, "setResolverRequestToResolutionTime:", v33);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolverTotalQueryTime"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v75 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v34);
      -[PNRProvisionalPlannerGrainMetricsDimension setResolverTotalQueryTime:](v5, "setResolverTotalQueryTime:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolverTotalClientActionTime"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v74 = (void *)v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v36);
      -[PNRProvisionalPlannerGrainMetricsDimension setResolverTotalClientActionTime:](v5, "setResolverTotalClientActionTime:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resolverFirstSystemPromptToResolutionTime"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = (void *)v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v38);
      -[PNRProvisionalPlannerGrainMetricsDimension setResolverFirstSystemPromptToResolutionTime:](v5, "setResolverFirstSystemPromptToResolutionTime:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numPlansCreated"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalPlannerGrainMetricsDimension setNumPlansCreated:](v5, "setNumPlansCreated:", objc_msgSend(v40, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionResolverRequests"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v72 = v41;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalPlannerGrainMetricsDimension setNumActionResolverRequests:](v5, "setNumActionResolverRequests:", objc_msgSend(v41, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numStatementEvaluatedFromPlanner"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalPlannerGrainMetricsDimension setNumStatementEvaluatedFromPlanner:](v5, "setNumStatementEvaluatedFromPlanner:", objc_msgSend(v42, "intValue"));
    v65 = v40;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numCriticalErrors"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v71 = v43;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalPlannerGrainMetricsDimension setNumCriticalErrors:](v5, "setNumCriticalErrors:", objc_msgSend(v43, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToLastResolverEventTime"));
    v44 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v44);
      -[PNRProvisionalPlannerGrainMetricsDimension setStartToLastResolverEventTime:](v5, "setStartToLastResolverEventTime:", v45);

    }
    v64 = (void *)v44;
    v69 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startToActionResolverRequestTime"));
    v46 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v46);
      -[PNRProvisionalPlannerGrainMetricsDimension setStartToActionResolverRequestTime:](v5, "setStartToActionResolverRequestTime:", v47);

    }
    v68 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastResolverEventToResponseGeneratedTime"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v48);
      -[PNRProvisionalPlannerGrainMetricsDimension setLastResolverEventToResponseGeneratedTime:](v5, "setLastResolverEventToResponseGeneratedTime:", v49);

    }
    v67 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionResolverRequestToLastResolverEventTime"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v50);
      -[PNRProvisionalPlannerGrainMetricsDimension setActionResolverRequestToLastResolverEventTime:](v5, "setActionResolverRequestToLastResolverEventTime:", v51);

    }
    v63 = (void *)v46;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planCreatedToLastResolverEventTime"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v53 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v52);
      -[PNRProvisionalPlannerGrainMetricsDimension setPlanCreatedToLastResolverEventTime:](v5, "setPlanCreatedToLastResolverEventTime:", v53);

    }
    v54 = v42;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planCreatedToActionResolverRequestTime"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v55);
      -[PNRProvisionalPlannerGrainMetricsDimension setPlanCreatedToActionResolverRequestTime:](v5, "setPlanCreatedToActionResolverRequestTime:", v56);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("plannerGrainStage"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = (void *)objc_msgSend(v57, "copy");
      -[PNRProvisionalPlannerGrainMetricsDimension setPlannerGrainStage:](v5, "setPlannerGrainStage:", v58);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureInfo"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = -[PNRProvisionalSageFailureInfo initWithDictionary:]([PNRProvisionalSageFailureInfo alloc], "initWithDictionary:", v59);
      -[PNRProvisionalPlannerGrainMetricsDimension setFailureInfo:](v5, "setFailureInfo:", v60);

    }
    v61 = v5;

  }
  return v5;
}

- (NSString)planningStep
{
  return self->_planningStep;
}

- (void)setPlanningStep:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int)numQueriesCreated
{
  return self->_numQueriesCreated;
}

- (int)numQueriesExecuted
{
  return self->_numQueriesExecuted;
}

- (int)numClientActionCreated
{
  return self->_numClientActionCreated;
}

- (int)numSystemPromptResolved
{
  return self->_numSystemPromptResolved;
}

- (PNRProvisionalMetrics)plannerResponseTime
{
  return self->_plannerResponseTime;
}

- (void)setPlannerResponseTime:(id)a3
{
  objc_storeStrong((id *)&self->_plannerResponseTime, a3);
}

- (PNRProvisionalMetrics)startToPlanCreatedTime
{
  return self->_startToPlanCreatedTime;
}

- (void)setStartToPlanCreatedTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToPlanCreatedTime, a3);
}

- (PNRProvisionalMetrics)startToLastQueryDecorationEventTime
{
  return self->_startToLastQueryDecorationEventTime;
}

- (void)setStartToLastQueryDecorationEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToLastQueryDecorationEventTime, a3);
}

- (PNRProvisionalMetrics)lastQueryDecorationEventToPlanCreatedTime
{
  return self->_lastQueryDecorationEventToPlanCreatedTime;
}

- (void)setLastQueryDecorationEventToPlanCreatedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastQueryDecorationEventToPlanCreatedTime, a3);
}

- (PNRProvisionalMetrics)planCreatedToResolutionTime
{
  return self->_planCreatedToResolutionTime;
}

- (void)setPlanCreatedToResolutionTime:(id)a3
{
  objc_storeStrong((id *)&self->_planCreatedToResolutionTime, a3);
}

- (PNRProvisionalMetrics)resolutionToResponseGeneratedTime
{
  return self->_resolutionToResponseGeneratedTime;
}

- (void)setResolutionToResponseGeneratedTime:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionToResponseGeneratedTime, a3);
}

- (PNRProvisionalMetrics)startToContextRetrievedTime
{
  return self->_startToContextRetrievedTime;
}

- (void)setStartToContextRetrievedTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToContextRetrievedTime, a3);
}

- (PNRProvisionalMetrics)startToToolsRetrievedTime
{
  return self->_startToToolsRetrievedTime;
}

- (void)setStartToToolsRetrievedTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToToolsRetrievedTime, a3);
}

- (PNRProvisionalMetrics)startToEntitySpanMatchedTime
{
  return self->_startToEntitySpanMatchedTime;
}

- (void)setStartToEntitySpanMatchedTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToEntitySpanMatchedTime, a3);
}

- (PNRProvisionalMetrics)planCreatedToResolverRequestTime
{
  return self->_planCreatedToResolverRequestTime;
}

- (void)setPlanCreatedToResolverRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_planCreatedToResolverRequestTime, a3);
}

- (PNRProvisionalMetrics)resolverRequestToResolutionTime
{
  return self->_resolverRequestToResolutionTime;
}

- (void)setResolverRequestToResolutionTime:(id)a3
{
  objc_storeStrong((id *)&self->_resolverRequestToResolutionTime, a3);
}

- (PNRProvisionalMetrics)resolverTotalQueryTime
{
  return self->_resolverTotalQueryTime;
}

- (void)setResolverTotalQueryTime:(id)a3
{
  objc_storeStrong((id *)&self->_resolverTotalQueryTime, a3);
}

- (PNRProvisionalMetrics)resolverTotalClientActionTime
{
  return self->_resolverTotalClientActionTime;
}

- (void)setResolverTotalClientActionTime:(id)a3
{
  objc_storeStrong((id *)&self->_resolverTotalClientActionTime, a3);
}

- (PNRProvisionalMetrics)resolverFirstSystemPromptToResolutionTime
{
  return self->_resolverFirstSystemPromptToResolutionTime;
}

- (void)setResolverFirstSystemPromptToResolutionTime:(id)a3
{
  objc_storeStrong((id *)&self->_resolverFirstSystemPromptToResolutionTime, a3);
}

- (int)numPlansCreated
{
  return self->_numPlansCreated;
}

- (int)numActionResolverRequests
{
  return self->_numActionResolverRequests;
}

- (int)numStatementEvaluatedFromPlanner
{
  return self->_numStatementEvaluatedFromPlanner;
}

- (int)numCriticalErrors
{
  return self->_numCriticalErrors;
}

- (PNRProvisionalMetrics)startToLastResolverEventTime
{
  return self->_startToLastResolverEventTime;
}

- (void)setStartToLastResolverEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToLastResolverEventTime, a3);
}

- (PNRProvisionalMetrics)startToActionResolverRequestTime
{
  return self->_startToActionResolverRequestTime;
}

- (void)setStartToActionResolverRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_startToActionResolverRequestTime, a3);
}

- (PNRProvisionalMetrics)lastResolverEventToResponseGeneratedTime
{
  return self->_lastResolverEventToResponseGeneratedTime;
}

- (void)setLastResolverEventToResponseGeneratedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastResolverEventToResponseGeneratedTime, a3);
}

- (PNRProvisionalMetrics)actionResolverRequestToLastResolverEventTime
{
  return self->_actionResolverRequestToLastResolverEventTime;
}

- (void)setActionResolverRequestToLastResolverEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_actionResolverRequestToLastResolverEventTime, a3);
}

- (PNRProvisionalMetrics)planCreatedToLastResolverEventTime
{
  return self->_planCreatedToLastResolverEventTime;
}

- (void)setPlanCreatedToLastResolverEventTime:(id)a3
{
  objc_storeStrong((id *)&self->_planCreatedToLastResolverEventTime, a3);
}

- (PNRProvisionalMetrics)planCreatedToActionResolverRequestTime
{
  return self->_planCreatedToActionResolverRequestTime;
}

- (void)setPlanCreatedToActionResolverRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_planCreatedToActionResolverRequestTime, a3);
}

- (NSString)plannerGrainStage
{
  return self->_plannerGrainStage;
}

- (void)setPlannerGrainStage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (PNRProvisionalSageFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setFailureInfo:(id)a3
{
  objc_storeStrong((id *)&self->_failureInfo, a3);
}

- (void)setHasPlanningStep:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPlannerResponseTime:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasStartToPlanCreatedTime:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasStartToLastQueryDecorationEventTime:(BOOL)a3
{
  self->_hasPlanningStep = a3;
}

- (void)setHasLastQueryDecorationEventToPlanCreatedTime:(BOOL)a3
{
  self->_hasPlannerResponseTime = a3;
}

- (void)setHasPlanCreatedToResolutionTime:(BOOL)a3
{
  self->_hasStartToPlanCreatedTime = a3;
}

- (void)setHasResolutionToResponseGeneratedTime:(BOOL)a3
{
  self->_hasStartToLastQueryDecorationEventTime = a3;
}

- (void)setHasStartToContextRetrievedTime:(BOOL)a3
{
  self->_hasLastQueryDecorationEventToPlanCreatedTime = a3;
}

- (void)setHasStartToToolsRetrievedTime:(BOOL)a3
{
  self->_hasPlanCreatedToResolutionTime = a3;
}

- (void)setHasStartToEntitySpanMatchedTime:(BOOL)a3
{
  self->_hasResolutionToResponseGeneratedTime = a3;
}

- (void)setHasPlanCreatedToResolverRequestTime:(BOOL)a3
{
  self->_hasStartToContextRetrievedTime = a3;
}

- (void)setHasResolverRequestToResolutionTime:(BOOL)a3
{
  self->_hasStartToToolsRetrievedTime = a3;
}

- (void)setHasResolverTotalQueryTime:(BOOL)a3
{
  self->_hasStartToEntitySpanMatchedTime = a3;
}

- (void)setHasResolverTotalClientActionTime:(BOOL)a3
{
  self->_hasPlanCreatedToResolverRequestTime = a3;
}

- (void)setHasResolverFirstSystemPromptToResolutionTime:(BOOL)a3
{
  self->_hasResolverRequestToResolutionTime = a3;
}

- (void)setHasStartToLastResolverEventTime:(BOOL)a3
{
  self->_hasResolverTotalQueryTime = a3;
}

- (void)setHasStartToActionResolverRequestTime:(BOOL)a3
{
  self->_hasResolverTotalClientActionTime = a3;
}

- (void)setHasLastResolverEventToResponseGeneratedTime:(BOOL)a3
{
  self->_hasResolverFirstSystemPromptToResolutionTime = a3;
}

- (void)setHasActionResolverRequestToLastResolverEventTime:(BOOL)a3
{
  self->_hasStartToLastResolverEventTime = a3;
}

- (void)setHasPlanCreatedToLastResolverEventTime:(BOOL)a3
{
  self->_hasStartToActionResolverRequestTime = a3;
}

- (void)setHasPlanCreatedToActionResolverRequestTime:(BOOL)a3
{
  self->_hasLastResolverEventToResponseGeneratedTime = a3;
}

- (void)setHasPlannerGrainStage:(BOOL)a3
{
  self->_hasActionResolverRequestToLastResolverEventTime = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasPlanCreatedToLastResolverEventTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_plannerGrainStage, 0);
  objc_storeStrong((id *)&self->_planCreatedToActionResolverRequestTime, 0);
  objc_storeStrong((id *)&self->_planCreatedToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_actionResolverRequestToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_lastResolverEventToResponseGeneratedTime, 0);
  objc_storeStrong((id *)&self->_startToActionResolverRequestTime, 0);
  objc_storeStrong((id *)&self->_startToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_resolverFirstSystemPromptToResolutionTime, 0);
  objc_storeStrong((id *)&self->_resolverTotalClientActionTime, 0);
  objc_storeStrong((id *)&self->_resolverTotalQueryTime, 0);
  objc_storeStrong((id *)&self->_resolverRequestToResolutionTime, 0);
  objc_storeStrong((id *)&self->_planCreatedToResolverRequestTime, 0);
  objc_storeStrong((id *)&self->_startToEntitySpanMatchedTime, 0);
  objc_storeStrong((id *)&self->_startToToolsRetrievedTime, 0);
  objc_storeStrong((id *)&self->_startToContextRetrievedTime, 0);
  objc_storeStrong((id *)&self->_resolutionToResponseGeneratedTime, 0);
  objc_storeStrong((id *)&self->_planCreatedToResolutionTime, 0);
  objc_storeStrong((id *)&self->_lastQueryDecorationEventToPlanCreatedTime, 0);
  objc_storeStrong((id *)&self->_startToLastQueryDecorationEventTime, 0);
  objc_storeStrong((id *)&self->_startToPlanCreatedTime, 0);
  objc_storeStrong((id *)&self->_plannerResponseTime, 0);
  objc_storeStrong((id *)&self->_planningStep, 0);
}

@end
