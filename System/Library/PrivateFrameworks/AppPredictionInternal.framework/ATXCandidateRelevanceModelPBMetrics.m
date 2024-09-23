@implementation ATXCandidateRelevanceModelPBMetrics

- (BOOL)hasModelMetrics
{
  return self->_modelMetrics != 0;
}

- (BOOL)hasEvaluationMetricsOneWeekAgo
{
  return self->_evaluationMetricsOneWeekAgo != 0;
}

- (BOOL)hasEvaluationMetricsTwoWeeksAgo
{
  return self->_evaluationMetricsTwoWeeksAgo != 0;
}

- (BOOL)hasEvaluationMetricsThreeWeeksAgo
{
  return self->_evaluationMetricsThreeWeeksAgo != 0;
}

- (BOOL)hasEvaluationMetricsFourWeeksAgo
{
  return self->_evaluationMetricsFourWeeksAgo != 0;
}

- (BOOL)hasEvaluationMetricsLastFourWeeks
{
  return self->_evaluationMetricsLastFourWeeks != 0;
}

- (void)clearCandidateMetrics
{
  -[NSMutableArray removeAllObjects](self->_candidateMetrics, "removeAllObjects");
}

- (void)addCandidateMetrics:(id)a3
{
  id v4;
  NSMutableArray *candidateMetrics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  candidateMetrics = self->_candidateMetrics;
  v8 = v4;
  if (!candidateMetrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_candidateMetrics;
    self->_candidateMetrics = v6;

    v4 = v8;
    candidateMetrics = self->_candidateMetrics;
  }
  -[NSMutableArray addObject:](candidateMetrics, "addObject:", v4);

}

- (unint64_t)candidateMetricsCount
{
  return -[NSMutableArray count](self->_candidateMetrics, "count");
}

- (id)candidateMetricsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_candidateMetrics, "objectAtIndex:", a3);
}

+ (Class)candidateMetricsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)ATXCandidateRelevanceModelPBMetrics;
  -[ATXCandidateRelevanceModelPBMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceModelPBMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ATXCandidateRelevanceModelPBModelMetrics *modelMetrics;
  void *v5;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsOneWeekAgo;
  void *v7;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsTwoWeeksAgo;
  void *v9;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsThreeWeeksAgo;
  void *v11;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsFourWeeksAgo;
  void *v13;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsLastFourWeeks;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  modelMetrics = self->_modelMetrics;
  if (modelMetrics)
  {
    -[ATXCandidateRelevanceModelPBModelMetrics dictionaryRepresentation](modelMetrics, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("modelMetrics"));

  }
  evaluationMetricsOneWeekAgo = self->_evaluationMetricsOneWeekAgo;
  if (evaluationMetricsOneWeekAgo)
  {
    -[ATXCandidateRelevanceModelPBEvaluationMetrics dictionaryRepresentation](evaluationMetricsOneWeekAgo, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("evaluationMetricsOneWeekAgo"));

  }
  evaluationMetricsTwoWeeksAgo = self->_evaluationMetricsTwoWeeksAgo;
  if (evaluationMetricsTwoWeeksAgo)
  {
    -[ATXCandidateRelevanceModelPBEvaluationMetrics dictionaryRepresentation](evaluationMetricsTwoWeeksAgo, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("evaluationMetricsTwoWeeksAgo"));

  }
  evaluationMetricsThreeWeeksAgo = self->_evaluationMetricsThreeWeeksAgo;
  if (evaluationMetricsThreeWeeksAgo)
  {
    -[ATXCandidateRelevanceModelPBEvaluationMetrics dictionaryRepresentation](evaluationMetricsThreeWeeksAgo, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("evaluationMetricsThreeWeeksAgo"));

  }
  evaluationMetricsFourWeeksAgo = self->_evaluationMetricsFourWeeksAgo;
  if (evaluationMetricsFourWeeksAgo)
  {
    -[ATXCandidateRelevanceModelPBEvaluationMetrics dictionaryRepresentation](evaluationMetricsFourWeeksAgo, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("evaluationMetricsFourWeeksAgo"));

  }
  evaluationMetricsLastFourWeeks = self->_evaluationMetricsLastFourWeeks;
  if (evaluationMetricsLastFourWeeks)
  {
    -[ATXCandidateRelevanceModelPBEvaluationMetrics dictionaryRepresentation](evaluationMetricsLastFourWeeks, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("evaluationMetricsLastFourWeeks"));

  }
  if (-[NSMutableArray count](self->_candidateMetrics, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_candidateMetrics, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = self->_candidateMetrics;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("candidateMetrics"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXCandidateRelevanceModelPBMetricsReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_modelMetrics)
    PBDataWriterWriteSubmessage();
  if (self->_evaluationMetricsOneWeekAgo)
    PBDataWriterWriteSubmessage();
  if (self->_evaluationMetricsTwoWeeksAgo)
    PBDataWriterWriteSubmessage();
  if (self->_evaluationMetricsThreeWeeksAgo)
    PBDataWriterWriteSubmessage();
  if (self->_evaluationMetricsFourWeeksAgo)
    PBDataWriterWriteSubmessage();
  if (self->_evaluationMetricsLastFourWeeks)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_candidateMetrics;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_modelMetrics)
    objc_msgSend(v8, "setModelMetrics:");
  if (self->_evaluationMetricsOneWeekAgo)
    objc_msgSend(v8, "setEvaluationMetricsOneWeekAgo:");
  if (self->_evaluationMetricsTwoWeeksAgo)
    objc_msgSend(v8, "setEvaluationMetricsTwoWeeksAgo:");
  if (self->_evaluationMetricsThreeWeeksAgo)
    objc_msgSend(v8, "setEvaluationMetricsThreeWeeksAgo:");
  if (self->_evaluationMetricsFourWeeksAgo)
    objc_msgSend(v8, "setEvaluationMetricsFourWeeksAgo:");
  if (self->_evaluationMetricsLastFourWeeks)
    objc_msgSend(v8, "setEvaluationMetricsLastFourWeeks:");
  if (-[ATXCandidateRelevanceModelPBMetrics candidateMetricsCount](self, "candidateMetricsCount"))
  {
    objc_msgSend(v8, "clearCandidateMetrics");
    v4 = -[ATXCandidateRelevanceModelPBMetrics candidateMetricsCount](self, "candidateMetricsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ATXCandidateRelevanceModelPBMetrics candidateMetricsAtIndex:](self, "candidateMetricsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addCandidateMetrics:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ATXCandidateRelevanceModelPBModelMetrics copyWithZone:](self->_modelMetrics, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[ATXCandidateRelevanceModelPBEvaluationMetrics copyWithZone:](self->_evaluationMetricsOneWeekAgo, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[ATXCandidateRelevanceModelPBEvaluationMetrics copyWithZone:](self->_evaluationMetricsTwoWeeksAgo, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  v12 = -[ATXCandidateRelevanceModelPBEvaluationMetrics copyWithZone:](self->_evaluationMetricsThreeWeeksAgo, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[ATXCandidateRelevanceModelPBEvaluationMetrics copyWithZone:](self->_evaluationMetricsFourWeeksAgo, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[ATXCandidateRelevanceModelPBEvaluationMetrics copyWithZone:](self->_evaluationMetricsLastFourWeeks, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = self->_candidateMetrics;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend(v5, "addCandidateMetrics:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  ATXCandidateRelevanceModelPBModelMetrics *modelMetrics;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsOneWeekAgo;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsTwoWeeksAgo;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsThreeWeeksAgo;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsFourWeeksAgo;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsLastFourWeeks;
  NSMutableArray *candidateMetrics;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((modelMetrics = self->_modelMetrics, !((unint64_t)modelMetrics | v4[7]))
     || -[ATXCandidateRelevanceModelPBModelMetrics isEqual:](modelMetrics, "isEqual:"))
    && ((evaluationMetricsOneWeekAgo = self->_evaluationMetricsOneWeekAgo,
         !((unint64_t)evaluationMetricsOneWeekAgo | v4[4]))
     || -[ATXCandidateRelevanceModelPBEvaluationMetrics isEqual:](evaluationMetricsOneWeekAgo, "isEqual:"))
    && ((evaluationMetricsTwoWeeksAgo = self->_evaluationMetricsTwoWeeksAgo,
         !((unint64_t)evaluationMetricsTwoWeeksAgo | v4[6]))
     || -[ATXCandidateRelevanceModelPBEvaluationMetrics isEqual:](evaluationMetricsTwoWeeksAgo, "isEqual:"))
    && ((evaluationMetricsThreeWeeksAgo = self->_evaluationMetricsThreeWeeksAgo,
         !((unint64_t)evaluationMetricsThreeWeeksAgo | v4[5]))
     || -[ATXCandidateRelevanceModelPBEvaluationMetrics isEqual:](evaluationMetricsThreeWeeksAgo, "isEqual:"))
    && ((evaluationMetricsFourWeeksAgo = self->_evaluationMetricsFourWeeksAgo,
         !((unint64_t)evaluationMetricsFourWeeksAgo | v4[2]))
     || -[ATXCandidateRelevanceModelPBEvaluationMetrics isEqual:](evaluationMetricsFourWeeksAgo, "isEqual:"))
    && ((evaluationMetricsLastFourWeeks = self->_evaluationMetricsLastFourWeeks,
         !((unint64_t)evaluationMetricsLastFourWeeks | v4[3]))
     || -[ATXCandidateRelevanceModelPBEvaluationMetrics isEqual:](evaluationMetricsLastFourWeeks, "isEqual:")))
  {
    candidateMetrics = self->_candidateMetrics;
    if ((unint64_t)candidateMetrics | v4[1])
      v12 = -[NSMutableArray isEqual:](candidateMetrics, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[ATXCandidateRelevanceModelPBModelMetrics hash](self->_modelMetrics, "hash");
  v4 = -[ATXCandidateRelevanceModelPBEvaluationMetrics hash](self->_evaluationMetricsOneWeekAgo, "hash") ^ v3;
  v5 = -[ATXCandidateRelevanceModelPBEvaluationMetrics hash](self->_evaluationMetricsTwoWeeksAgo, "hash");
  v6 = v4 ^ v5 ^ -[ATXCandidateRelevanceModelPBEvaluationMetrics hash](self->_evaluationMetricsThreeWeeksAgo, "hash");
  v7 = -[ATXCandidateRelevanceModelPBEvaluationMetrics hash](self->_evaluationMetricsFourWeeksAgo, "hash");
  v8 = v7 ^ -[ATXCandidateRelevanceModelPBEvaluationMetrics hash](self->_evaluationMetricsLastFourWeeks, "hash");
  return v6 ^ v8 ^ -[NSMutableArray hash](self->_candidateMetrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ATXCandidateRelevanceModelPBModelMetrics *modelMetrics;
  uint64_t v6;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsOneWeekAgo;
  uint64_t v8;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsTwoWeeksAgo;
  uint64_t v10;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsThreeWeeksAgo;
  uint64_t v12;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsFourWeeksAgo;
  uint64_t v14;
  ATXCandidateRelevanceModelPBEvaluationMetrics *evaluationMetricsLastFourWeeks;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  modelMetrics = self->_modelMetrics;
  v6 = *((_QWORD *)v4 + 7);
  if (modelMetrics)
  {
    if (v6)
      -[ATXCandidateRelevanceModelPBModelMetrics mergeFrom:](modelMetrics, "mergeFrom:");
  }
  else if (v6)
  {
    -[ATXCandidateRelevanceModelPBMetrics setModelMetrics:](self, "setModelMetrics:");
  }
  evaluationMetricsOneWeekAgo = self->_evaluationMetricsOneWeekAgo;
  v8 = *((_QWORD *)v4 + 4);
  if (evaluationMetricsOneWeekAgo)
  {
    if (v8)
      -[ATXCandidateRelevanceModelPBEvaluationMetrics mergeFrom:](evaluationMetricsOneWeekAgo, "mergeFrom:");
  }
  else if (v8)
  {
    -[ATXCandidateRelevanceModelPBMetrics setEvaluationMetricsOneWeekAgo:](self, "setEvaluationMetricsOneWeekAgo:");
  }
  evaluationMetricsTwoWeeksAgo = self->_evaluationMetricsTwoWeeksAgo;
  v10 = *((_QWORD *)v4 + 6);
  if (evaluationMetricsTwoWeeksAgo)
  {
    if (v10)
      -[ATXCandidateRelevanceModelPBEvaluationMetrics mergeFrom:](evaluationMetricsTwoWeeksAgo, "mergeFrom:");
  }
  else if (v10)
  {
    -[ATXCandidateRelevanceModelPBMetrics setEvaluationMetricsTwoWeeksAgo:](self, "setEvaluationMetricsTwoWeeksAgo:");
  }
  evaluationMetricsThreeWeeksAgo = self->_evaluationMetricsThreeWeeksAgo;
  v12 = *((_QWORD *)v4 + 5);
  if (evaluationMetricsThreeWeeksAgo)
  {
    if (v12)
      -[ATXCandidateRelevanceModelPBEvaluationMetrics mergeFrom:](evaluationMetricsThreeWeeksAgo, "mergeFrom:");
  }
  else if (v12)
  {
    -[ATXCandidateRelevanceModelPBMetrics setEvaluationMetricsThreeWeeksAgo:](self, "setEvaluationMetricsThreeWeeksAgo:");
  }
  evaluationMetricsFourWeeksAgo = self->_evaluationMetricsFourWeeksAgo;
  v14 = *((_QWORD *)v4 + 2);
  if (evaluationMetricsFourWeeksAgo)
  {
    if (v14)
      -[ATXCandidateRelevanceModelPBEvaluationMetrics mergeFrom:](evaluationMetricsFourWeeksAgo, "mergeFrom:");
  }
  else if (v14)
  {
    -[ATXCandidateRelevanceModelPBMetrics setEvaluationMetricsFourWeeksAgo:](self, "setEvaluationMetricsFourWeeksAgo:");
  }
  evaluationMetricsLastFourWeeks = self->_evaluationMetricsLastFourWeeks;
  v16 = *((_QWORD *)v4 + 3);
  if (evaluationMetricsLastFourWeeks)
  {
    if (v16)
      -[ATXCandidateRelevanceModelPBEvaluationMetrics mergeFrom:](evaluationMetricsLastFourWeeks, "mergeFrom:");
  }
  else if (v16)
  {
    -[ATXCandidateRelevanceModelPBMetrics setEvaluationMetricsLastFourWeeks:](self, "setEvaluationMetricsLastFourWeeks:");
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = *((id *)v4 + 1);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[ATXCandidateRelevanceModelPBMetrics addCandidateMetrics:](self, "addCandidateMetrics:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v19);
  }

}

- (ATXCandidateRelevanceModelPBModelMetrics)modelMetrics
{
  return self->_modelMetrics;
}

- (void)setModelMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_modelMetrics, a3);
}

- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsOneWeekAgo
{
  return self->_evaluationMetricsOneWeekAgo;
}

- (void)setEvaluationMetricsOneWeekAgo:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationMetricsOneWeekAgo, a3);
}

- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsTwoWeeksAgo
{
  return self->_evaluationMetricsTwoWeeksAgo;
}

- (void)setEvaluationMetricsTwoWeeksAgo:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationMetricsTwoWeeksAgo, a3);
}

- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsThreeWeeksAgo
{
  return self->_evaluationMetricsThreeWeeksAgo;
}

- (void)setEvaluationMetricsThreeWeeksAgo:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationMetricsThreeWeeksAgo, a3);
}

- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsFourWeeksAgo
{
  return self->_evaluationMetricsFourWeeksAgo;
}

- (void)setEvaluationMetricsFourWeeksAgo:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationMetricsFourWeeksAgo, a3);
}

- (ATXCandidateRelevanceModelPBEvaluationMetrics)evaluationMetricsLastFourWeeks
{
  return self->_evaluationMetricsLastFourWeeks;
}

- (void)setEvaluationMetricsLastFourWeeks:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationMetricsLastFourWeeks, a3);
}

- (NSMutableArray)candidateMetrics
{
  return self->_candidateMetrics;
}

- (void)setCandidateMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_candidateMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelMetrics, 0);
  objc_storeStrong((id *)&self->_evaluationMetricsTwoWeeksAgo, 0);
  objc_storeStrong((id *)&self->_evaluationMetricsThreeWeeksAgo, 0);
  objc_storeStrong((id *)&self->_evaluationMetricsOneWeekAgo, 0);
  objc_storeStrong((id *)&self->_evaluationMetricsLastFourWeeks, 0);
  objc_storeStrong((id *)&self->_evaluationMetricsFourWeeksAgo, 0);
  objc_storeStrong((id *)&self->_candidateMetrics, 0);
}

@end
