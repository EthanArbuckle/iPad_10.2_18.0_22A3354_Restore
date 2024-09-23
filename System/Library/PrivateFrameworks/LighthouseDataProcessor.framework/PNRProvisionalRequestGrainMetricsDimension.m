@implementation PNRProvisionalRequestGrainMetricsDimension

- (void)setNumQueries:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numQueries = a3;
}

- (BOOL)hasNumQueries
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasNumQueries:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)deleteNumQueries
{
  -[PNRProvisionalRequestGrainMetricsDimension setNumQueries:](self, "setNumQueries:", 0);
  *(_BYTE *)&self->_has &= ~1u;
}

- (void)setNumPlansCreated:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numPlansCreated = a3;
}

- (BOOL)hasNumPlansCreated
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasNumPlansCreated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)deleteNumPlansCreated
{
  -[PNRProvisionalRequestGrainMetricsDimension setNumPlansCreated:](self, "setNumPlansCreated:", 0);
  *(_BYTE *)&self->_has &= ~2u;
}

- (void)setNumQueryPlansCreated:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numQueryPlansCreated = a3;
}

- (BOOL)hasNumQueryPlansCreated
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasNumQueryPlansCreated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)deleteNumQueryPlansCreated
{
  -[PNRProvisionalRequestGrainMetricsDimension setNumQueryPlansCreated:](self, "setNumQueryPlansCreated:", 0);
  *(_BYTE *)&self->_has &= ~4u;
}

- (void)setNumResponsePlansCreated:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numResponsePlansCreated = a3;
}

- (BOOL)hasNumResponsePlansCreated
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasNumResponsePlansCreated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)deleteNumResponsePlansCreated
{
  -[PNRProvisionalRequestGrainMetricsDimension setNumResponsePlansCreated:](self, "setNumResponsePlansCreated:", 0);
  *(_BYTE *)&self->_has &= ~8u;
}

- (void)setNumActionsCreated:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numActionsCreated = a3;
}

- (BOOL)hasNumActionsCreated
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasNumActionsCreated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)deleteNumActionsCreated
{
  -[PNRProvisionalRequestGrainMetricsDimension setNumActionsCreated:](self, "setNumActionsCreated:", 0);
  *(_BYTE *)&self->_has &= ~0x10u;
}

- (void)setNumActionsExecuted:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_numActionsExecuted = a3;
}

- (BOOL)hasNumActionsExecuted
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasNumActionsExecuted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)deleteNumActionsExecuted
{
  -[PNRProvisionalRequestGrainMetricsDimension setNumActionsExecuted:](self, "setNumActionsExecuted:", 0);
  *(_BYTE *)&self->_has &= ~0x20u;
}

- (void)setNumActionResponseGenerated:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_numActionResponseGenerated = a3;
}

- (BOOL)hasNumActionResponseGenerated
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasNumActionResponseGenerated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (void)deleteNumActionResponseGenerated
{
  -[PNRProvisionalRequestGrainMetricsDimension setNumActionResponseGenerated:](self, "setNumActionResponseGenerated:", 0);
  *(_BYTE *)&self->_has &= ~0x40u;
}

- (BOOL)hasFullQueryResponseTime
{
  return self->_fullQueryResponseTime != 0;
}

- (void)deleteFullQueryResponseTime
{
  -[PNRProvisionalRequestGrainMetricsDimension setFullQueryResponseTime:](self, "setFullQueryResponseTime:", 0);
}

- (BOOL)hasPlanningTime
{
  return self->_planningTime != 0;
}

- (void)deletePlanningTime
{
  -[PNRProvisionalRequestGrainMetricsDimension setPlanningTime:](self, "setPlanningTime:", 0);
}

- (BOOL)hasExecutionTime
{
  return self->_executionTime != 0;
}

- (void)deleteExecutionTime
{
  -[PNRProvisionalRequestGrainMetricsDimension setExecutionTime:](self, "setExecutionTime:", 0);
}

- (BOOL)hasResponsePreparationTime
{
  return self->_responsePreparationTime != 0;
}

- (void)deleteResponsePreparationTime
{
  -[PNRProvisionalRequestGrainMetricsDimension setResponsePreparationTime:](self, "setResponsePreparationTime:", 0);
}

- (void)clearToolId
{
  -[NSArray removeAllObjects](self->_toolIds, "removeAllObjects");
}

- (void)addToolId:(id)a3
{
  id v4;
  NSArray *toolIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  toolIds = self->_toolIds;
  v8 = v4;
  if (!toolIds)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_toolIds;
    self->_toolIds = v6;

    v4 = v8;
    toolIds = self->_toolIds;
  }
  -[NSArray addObject:](toolIds, "addObject:", v4);

}

- (unint64_t)toolIdCount
{
  return -[NSArray count](self->_toolIds, "count");
}

- (id)toolIdAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_toolIds, "objectAtIndexedSubscript:", a3);
}

- (void)clearBundleId
{
  -[NSArray removeAllObjects](self->_bundleIds, "removeAllObjects");
}

- (void)addBundleId:(id)a3
{
  id v4;
  NSArray *bundleIds;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  bundleIds = self->_bundleIds;
  v8 = v4;
  if (!bundleIds)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_bundleIds;
    self->_bundleIds = v6;

    v4 = v8;
    bundleIds = self->_bundleIds;
  }
  -[NSArray addObject:](bundleIds, "addObject:", v4);

}

- (unint64_t)bundleIdCount
{
  return -[NSArray count](self->_bundleIds, "count");
}

- (id)bundleIdAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_bundleIds, "objectAtIndexedSubscript:", a3);
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
  -[PNRProvisionalRequestGrainMetricsDimension setFailureInfo:](self, "setFailureInfo:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalRequestGrainMetricsDimensionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_8:
    PBDataWriterWriteInt32Field();
LABEL_9:
  -[PNRProvisionalRequestGrainMetricsDimension fullQueryResponseTime](self, "fullQueryResponseTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PNRProvisionalRequestGrainMetricsDimension fullQueryResponseTime](self, "fullQueryResponseTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalRequestGrainMetricsDimension planningTime](self, "planningTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PNRProvisionalRequestGrainMetricsDimension planningTime](self, "planningTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalRequestGrainMetricsDimension executionTime](self, "executionTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PNRProvisionalRequestGrainMetricsDimension executionTime](self, "executionTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[PNRProvisionalRequestGrainMetricsDimension responsePreparationTime](self, "responsePreparationTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PNRProvisionalRequestGrainMetricsDimension responsePreparationTime](self, "responsePreparationTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = self->_toolIds;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteStringField();
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v16);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->_bundleIds;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteStringField();
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v21);
  }

  -[PNRProvisionalRequestGrainMetricsDimension failureInfo](self, "failureInfo", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[PNRProvisionalRequestGrainMetricsDimension failureInfo](self, "failureInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $AA289F35DA062A6B8AB178B047ED4B74 has;
  unsigned int v6;
  int numQueries;
  int v8;
  int numPlansCreated;
  int v10;
  int numQueryPlansCreated;
  int v12;
  int numResponsePlansCreated;
  int v14;
  int numActionsCreated;
  int v16;
  int numActionsExecuted;
  int v18;
  int numActionResponseGenerated;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  BOOL v57;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_64;
  has = self->_has;
  v6 = v4[96];
  if ((*(_BYTE *)&has & 1) != (v6 & 1))
    goto LABEL_64;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    numQueries = self->_numQueries;
    if (numQueries != objc_msgSend(v4, "numQueries"))
      goto LABEL_64;
    has = self->_has;
    v6 = v4[96];
  }
  v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      numPlansCreated = self->_numPlansCreated;
      if (numPlansCreated != objc_msgSend(v4, "numPlansCreated"))
        goto LABEL_64;
      has = self->_has;
      v6 = v4[96];
    }
    v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        numQueryPlansCreated = self->_numQueryPlansCreated;
        if (numQueryPlansCreated != objc_msgSend(v4, "numQueryPlansCreated"))
          goto LABEL_64;
        has = self->_has;
        v6 = v4[96];
      }
      v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          numResponsePlansCreated = self->_numResponsePlansCreated;
          if (numResponsePlansCreated != objc_msgSend(v4, "numResponsePlansCreated"))
            goto LABEL_64;
          has = self->_has;
          v6 = v4[96];
        }
        v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (v14)
          {
            numActionsCreated = self->_numActionsCreated;
            if (numActionsCreated != objc_msgSend(v4, "numActionsCreated"))
              goto LABEL_64;
            has = self->_has;
            v6 = v4[96];
          }
          v16 = (*(unsigned int *)&has >> 5) & 1;
          if (v16 == ((v6 >> 5) & 1))
          {
            if (v16)
            {
              numActionsExecuted = self->_numActionsExecuted;
              if (numActionsExecuted != objc_msgSend(v4, "numActionsExecuted"))
                goto LABEL_64;
              has = self->_has;
              v6 = v4[96];
            }
            v18 = (*(unsigned int *)&has >> 6) & 1;
            if (v18 != ((v6 >> 6) & 1))
              goto LABEL_64;
            if (v18)
            {
              numActionResponseGenerated = self->_numActionResponseGenerated;
              if (numActionResponseGenerated != objc_msgSend(v4, "numActionResponseGenerated"))
                goto LABEL_64;
            }
            -[PNRProvisionalRequestGrainMetricsDimension fullQueryResponseTime](self, "fullQueryResponseTime");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "fullQueryResponseTime");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) == (v21 != 0))
              goto LABEL_63;
            -[PNRProvisionalRequestGrainMetricsDimension fullQueryResponseTime](self, "fullQueryResponseTime");
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = (void *)v22;
              -[PNRProvisionalRequestGrainMetricsDimension fullQueryResponseTime](self, "fullQueryResponseTime");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "fullQueryResponseTime");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v24, "isEqual:", v25);

              if (!v26)
                goto LABEL_64;
            }
            else
            {

            }
            -[PNRProvisionalRequestGrainMetricsDimension planningTime](self, "planningTime");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "planningTime");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) == (v21 != 0))
              goto LABEL_63;
            -[PNRProvisionalRequestGrainMetricsDimension planningTime](self, "planningTime");
            v27 = objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v28 = (void *)v27;
              -[PNRProvisionalRequestGrainMetricsDimension planningTime](self, "planningTime");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "planningTime");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v29, "isEqual:", v30);

              if (!v31)
                goto LABEL_64;
            }
            else
            {

            }
            -[PNRProvisionalRequestGrainMetricsDimension executionTime](self, "executionTime");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "executionTime");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) == (v21 != 0))
              goto LABEL_63;
            -[PNRProvisionalRequestGrainMetricsDimension executionTime](self, "executionTime");
            v32 = objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v33 = (void *)v32;
              -[PNRProvisionalRequestGrainMetricsDimension executionTime](self, "executionTime");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "executionTime");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v34, "isEqual:", v35);

              if (!v36)
                goto LABEL_64;
            }
            else
            {

            }
            -[PNRProvisionalRequestGrainMetricsDimension responsePreparationTime](self, "responsePreparationTime");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "responsePreparationTime");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) == (v21 != 0))
              goto LABEL_63;
            -[PNRProvisionalRequestGrainMetricsDimension responsePreparationTime](self, "responsePreparationTime");
            v37 = objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              v38 = (void *)v37;
              -[PNRProvisionalRequestGrainMetricsDimension responsePreparationTime](self, "responsePreparationTime");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "responsePreparationTime");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v39, "isEqual:", v40);

              if (!v41)
                goto LABEL_64;
            }
            else
            {

            }
            -[PNRProvisionalRequestGrainMetricsDimension toolIds](self, "toolIds");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "toolIds");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) == (v21 != 0))
              goto LABEL_63;
            -[PNRProvisionalRequestGrainMetricsDimension toolIds](self, "toolIds");
            v42 = objc_claimAutoreleasedReturnValue();
            if (v42)
            {
              v43 = (void *)v42;
              -[PNRProvisionalRequestGrainMetricsDimension toolIds](self, "toolIds");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "toolIds");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v44, "isEqual:", v45);

              if (!v46)
                goto LABEL_64;
            }
            else
            {

            }
            -[PNRProvisionalRequestGrainMetricsDimension bundleIds](self, "bundleIds");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "bundleIds");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) == (v21 != 0))
              goto LABEL_63;
            -[PNRProvisionalRequestGrainMetricsDimension bundleIds](self, "bundleIds");
            v47 = objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              v48 = (void *)v47;
              -[PNRProvisionalRequestGrainMetricsDimension bundleIds](self, "bundleIds");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "bundleIds");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v49, "isEqual:", v50);

              if (!v51)
                goto LABEL_64;
            }
            else
            {

            }
            -[PNRProvisionalRequestGrainMetricsDimension failureInfo](self, "failureInfo");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "failureInfo");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v20 == 0) != (v21 != 0))
            {
              -[PNRProvisionalRequestGrainMetricsDimension failureInfo](self, "failureInfo");
              v52 = objc_claimAutoreleasedReturnValue();
              if (!v52)
              {

LABEL_67:
                v57 = 1;
                goto LABEL_65;
              }
              v53 = (void *)v52;
              -[PNRProvisionalRequestGrainMetricsDimension failureInfo](self, "failureInfo");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "failureInfo");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v54, "isEqual:", v55);

              if ((v56 & 1) != 0)
                goto LABEL_67;
            }
            else
            {
LABEL_63:

            }
          }
        }
      }
    }
  }
LABEL_64:
  v57 = 0;
LABEL_65:

  return v57;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_numQueries;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_numPlansCreated;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_numQueryPlansCreated;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_numResponsePlansCreated;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_numActionsCreated;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
LABEL_14:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
LABEL_13:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_7:
  v8 = 2654435761 * self->_numActionsExecuted;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_15;
LABEL_8:
  v9 = 2654435761 * self->_numActionResponseGenerated;
LABEL_16:
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[PNRProvisionalMetrics hash](self->_fullQueryResponseTime, "hash");
  v11 = -[PNRProvisionalMetrics hash](self->_planningTime, "hash");
  v12 = v10 ^ v11 ^ -[PNRProvisionalMetrics hash](self->_executionTime, "hash");
  v13 = -[PNRProvisionalMetrics hash](self->_responsePreparationTime, "hash");
  v14 = v13 ^ -[NSArray hash](self->_toolIds, "hash");
  v15 = v12 ^ v14 ^ -[NSArray hash](self->_bundleIds, "hash");
  return v15 ^ -[PNRProvisionalSageFailureInfo hash](self->_failureInfo, "hash");
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
  char has;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_bundleIds)
  {
    -[PNRProvisionalRequestGrainMetricsDimension bundleIds](self, "bundleIds");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bundleId"));

  }
  if (self->_executionTime)
  {
    -[PNRProvisionalRequestGrainMetricsDimension executionTime](self, "executionTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("executionTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("executionTime"));

    }
  }
  if (self->_failureInfo)
  {
    -[PNRProvisionalRequestGrainMetricsDimension failureInfo](self, "failureInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("failureInfo"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("failureInfo"));

    }
  }
  if (self->_fullQueryResponseTime)
  {
    -[PNRProvisionalRequestGrainMetricsDimension fullQueryResponseTime](self, "fullQueryResponseTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("fullQueryResponseTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("fullQueryResponseTime"));

    }
  }
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numActionResponseGenerated](self, "numActionResponseGenerated"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("numActionResponseGenerated"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_20:
      if ((has & 0x20) == 0)
        goto LABEL_21;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numActionsCreated](self, "numActionsCreated"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numActionsCreated"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_21:
    if ((has & 2) == 0)
      goto LABEL_22;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numActionsExecuted](self, "numActionsExecuted"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("numActionsExecuted"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_22:
    if ((has & 1) == 0)
      goto LABEL_23;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numPlansCreated](self, "numPlansCreated"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("numPlansCreated"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_23:
    if ((has & 4) == 0)
      goto LABEL_24;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numQueries](self, "numQueries"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("numQueries"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_24:
    if ((has & 8) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numQueryPlansCreated](self, "numQueryPlansCreated"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("numQueryPlansCreated"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PNRProvisionalRequestGrainMetricsDimension numResponsePlansCreated](self, "numResponsePlansCreated"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("numResponsePlansCreated"));

  }
LABEL_26:
  if (self->_planningTime)
  {
    -[PNRProvisionalRequestGrainMetricsDimension planningTime](self, "planningTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("planningTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("planningTime"));

    }
  }
  if (self->_responsePreparationTime)
  {
    -[PNRProvisionalRequestGrainMetricsDimension responsePreparationTime](self, "responsePreparationTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("responsePreparationTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("responsePreparationTime"));

    }
  }
  if (self->_toolIds)
  {
    -[PNRProvisionalRequestGrainMetricsDimension toolIds](self, "toolIds");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("toolId"));

  }
  -[PNRProvisionalRequestGrainMetricsDimension willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[PNRProvisionalRequestGrainMetricsDimension dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (PNRProvisionalRequestGrainMetricsDimension)initWithJSON:(id)a3
{
  void *v4;
  PNRProvisionalRequestGrainMetricsDimension *v5;
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
    self = -[PNRProvisionalRequestGrainMetricsDimension initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (PNRProvisionalRequestGrainMetricsDimension)initWithDictionary:(id)a3
{
  id v4;
  PNRProvisionalRequestGrainMetricsDimension *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PNRProvisionalMetrics *v14;
  void *v15;
  PNRProvisionalMetrics *v16;
  uint64_t v17;
  PNRProvisionalMetrics *v18;
  void *v19;
  PNRProvisionalMetrics *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  PNRProvisionalSageFailureInfo *v38;
  PNRProvisionalRequestGrainMetricsDimension *v39;
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
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PNRProvisionalRequestGrainMetricsDimension;
  v5 = -[PNRProvisionalRequestGrainMetricsDimension init](&v60, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numQueries"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalRequestGrainMetricsDimension setNumQueries:](v5, "setNumQueries:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numPlansCreated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalRequestGrainMetricsDimension setNumPlansCreated:](v5, "setNumPlansCreated:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numQueryPlansCreated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalRequestGrainMetricsDimension setNumQueryPlansCreated:](v5, "setNumQueryPlansCreated:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numResponsePlansCreated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalRequestGrainMetricsDimension setNumResponsePlansCreated:](v5, "setNumResponsePlansCreated:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionsCreated"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalRequestGrainMetricsDimension setNumActionsCreated:](v5, "setNumActionsCreated:", objc_msgSend(v10, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionsExecuted"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalRequestGrainMetricsDimension setNumActionsExecuted:](v5, "setNumActionsExecuted:", objc_msgSend(v11, "intValue"));
    v48 = v8;
    v49 = v7;
    v50 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numActionResponseGenerated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PNRProvisionalRequestGrainMetricsDimension setNumActionResponseGenerated:](v5, "setNumActionResponseGenerated:", objc_msgSend(v12, "intValue"));
    v44 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullQueryResponseTime"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v13);
      -[PNRProvisionalRequestGrainMetricsDimension setFullQueryResponseTime:](v5, "setFullQueryResponseTime:", v14);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planningTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v15);
      -[PNRProvisionalRequestGrainMetricsDimension setPlanningTime:](v5, "setPlanningTime:", v16);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("executionTime"));
    v17 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = (void *)v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v17);
      -[PNRProvisionalRequestGrainMetricsDimension setExecutionTime:](v5, "setExecutionTime:", v18);

    }
    v43 = (void *)v13;
    v45 = v11;
    v46 = v10;
    v47 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responsePreparationTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[PNRProvisionalMetrics initWithDictionary:]([PNRProvisionalMetrics alloc], "initWithDictionary:", v19);
      -[PNRProvisionalRequestGrainMetricsDimension setResponsePreparationTime:](v5, "setResponsePreparationTime:", v20);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toolId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v41 = v19;
    v42 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v57 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = (void *)objc_msgSend(v27, "copy");
              -[PNRProvisionalRequestGrainMetricsDimension addToolId:](v5, "addToolId:", v28);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        }
        while (v24);
      }

      v19 = v41;
      v15 = v42;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v30 = v29;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v53 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = (void *)objc_msgSend(v35, "copy");
              -[PNRProvisionalRequestGrainMetricsDimension addBundleId:](v5, "addBundleId:", v36);

            }
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        }
        while (v32);
      }

      v19 = v41;
      v15 = v42;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failureInfo"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = -[PNRProvisionalSageFailureInfo initWithDictionary:]([PNRProvisionalSageFailureInfo alloc], "initWithDictionary:", v37);
      -[PNRProvisionalRequestGrainMetricsDimension setFailureInfo:](v5, "setFailureInfo:", v38);

    }
    v39 = v5;

  }
  return v5;
}

- (int)numQueries
{
  return self->_numQueries;
}

- (int)numPlansCreated
{
  return self->_numPlansCreated;
}

- (int)numQueryPlansCreated
{
  return self->_numQueryPlansCreated;
}

- (int)numResponsePlansCreated
{
  return self->_numResponsePlansCreated;
}

- (int)numActionsCreated
{
  return self->_numActionsCreated;
}

- (int)numActionsExecuted
{
  return self->_numActionsExecuted;
}

- (int)numActionResponseGenerated
{
  return self->_numActionResponseGenerated;
}

- (PNRProvisionalMetrics)fullQueryResponseTime
{
  return self->_fullQueryResponseTime;
}

- (void)setFullQueryResponseTime:(id)a3
{
  objc_storeStrong((id *)&self->_fullQueryResponseTime, a3);
}

- (PNRProvisionalMetrics)planningTime
{
  return self->_planningTime;
}

- (void)setPlanningTime:(id)a3
{
  objc_storeStrong((id *)&self->_planningTime, a3);
}

- (PNRProvisionalMetrics)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(id)a3
{
  objc_storeStrong((id *)&self->_executionTime, a3);
}

- (PNRProvisionalMetrics)responsePreparationTime
{
  return self->_responsePreparationTime;
}

- (void)setResponsePreparationTime:(id)a3
{
  objc_storeStrong((id *)&self->_responsePreparationTime, a3);
}

- (NSArray)toolIds
{
  return self->_toolIds;
}

- (void)setToolIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PNRProvisionalSageFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setFailureInfo:(id)a3
{
  objc_storeStrong((id *)&self->_failureInfo, a3);
}

- (void)setHasFullQueryResponseTime:(BOOL)a3
{
  *((_BYTE *)&self->_has + 1) = a3;
}

- (void)setHasPlanningTime:(BOOL)a3
{
  *((_BYTE *)&self->_has + 2) = a3;
}

- (void)setHasExecutionTime:(BOOL)a3
{
  *((_BYTE *)&self->_has + 3) = a3;
}

- (void)setHasResponsePreparationTime:(BOOL)a3
{
  self->_hasFullQueryResponseTime = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasPlanningTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_toolIds, 0);
  objc_storeStrong((id *)&self->_responsePreparationTime, 0);
  objc_storeStrong((id *)&self->_executionTime, 0);
  objc_storeStrong((id *)&self->_planningTime, 0);
  objc_storeStrong((id *)&self->_fullQueryResponseTime, 0);
}

@end
