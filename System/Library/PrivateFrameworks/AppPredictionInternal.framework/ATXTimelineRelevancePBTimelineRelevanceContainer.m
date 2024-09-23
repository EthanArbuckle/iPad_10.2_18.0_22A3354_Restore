@implementation ATXTimelineRelevancePBTimelineRelevanceContainer

- (BOOL)hasContainerBundleIdentifier
{
  return self->_containerBundleIdentifier != 0;
}

- (id)widgetFamilyAsString:(int)a3
{
  if (a3 < 5)
    return off_1E82E3DD0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetFamily:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_FAMILY_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_FAMILY_SMALL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_FAMILY_MEDIUM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_FAMILY_LARGE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_FAMILY_EXTRA_LARGE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTimelineDonationNilCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timelineDonationNilCount = a3;
}

- (void)setHasTimelineDonationNilCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimelineDonationNilCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setAtLeastOnePositiveTimelineRelevanceScore:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_atLeastOnePositiveTimelineRelevanceScore = a3;
}

- (void)setHasAtLeastOnePositiveTimelineRelevanceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAtLeastOnePositiveTimelineRelevanceScore
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearTimelineRelevanceScores
{
  -[NSMutableArray removeAllObjects](self->_timelineRelevanceScores, "removeAllObjects");
}

- (void)addTimelineRelevanceScore:(id)a3
{
  id v4;
  NSMutableArray *timelineRelevanceScores;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  timelineRelevanceScores = self->_timelineRelevanceScores;
  v8 = v4;
  if (!timelineRelevanceScores)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_timelineRelevanceScores;
    self->_timelineRelevanceScores = v6;

    v4 = v8;
    timelineRelevanceScores = self->_timelineRelevanceScores;
  }
  -[NSMutableArray addObject:](timelineRelevanceScores, "addObject:", v4);

}

- (unint64_t)timelineRelevanceScoresCount
{
  return -[NSMutableArray count](self->_timelineRelevanceScores, "count");
}

- (id)timelineRelevanceScoreAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_timelineRelevanceScores, "objectAtIndex:", a3);
}

+ (Class)timelineRelevanceScoreType
{
  return (Class)objc_opt_class();
}

- (void)clearTimelineRelevanceSuggestions
{
  -[NSMutableArray removeAllObjects](self->_timelineRelevanceSuggestions, "removeAllObjects");
}

- (void)addTimelineRelevanceSuggestion:(id)a3
{
  id v4;
  NSMutableArray *timelineRelevanceSuggestions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  timelineRelevanceSuggestions = self->_timelineRelevanceSuggestions;
  v8 = v4;
  if (!timelineRelevanceSuggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_timelineRelevanceSuggestions;
    self->_timelineRelevanceSuggestions = v6;

    v4 = v8;
    timelineRelevanceSuggestions = self->_timelineRelevanceSuggestions;
  }
  -[NSMutableArray addObject:](timelineRelevanceSuggestions, "addObject:", v4);

}

- (unint64_t)timelineRelevanceSuggestionsCount
{
  return -[NSMutableArray count](self->_timelineRelevanceSuggestions, "count");
}

- (id)timelineRelevanceSuggestionAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_timelineRelevanceSuggestions, "objectAtIndex:", a3);
}

+ (Class)timelineRelevanceSuggestionType
{
  return (Class)objc_opt_class();
}

- (void)clearRotations
{
  -[NSMutableArray removeAllObjects](self->_rotations, "removeAllObjects");
}

- (void)addRotation:(id)a3
{
  id v4;
  NSMutableArray *rotations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rotations = self->_rotations;
  v8 = v4;
  if (!rotations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_rotations;
    self->_rotations = v6;

    v4 = v8;
    rotations = self->_rotations;
  }
  -[NSMutableArray addObject:](rotations, "addObject:", v4);

}

- (unint64_t)rotationsCount
{
  return -[NSMutableArray count](self->_rotations, "count");
}

- (id)rotationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rotations, "objectAtIndex:", a3);
}

+ (Class)rotationType
{
  return (Class)objc_opt_class();
}

- (void)setTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearStackConfigSummarys
{
  -[NSMutableArray removeAllObjects](self->_stackConfigSummarys, "removeAllObjects");
}

- (void)addStackConfigSummary:(id)a3
{
  id v4;
  NSMutableArray *stackConfigSummarys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  stackConfigSummarys = self->_stackConfigSummarys;
  v8 = v4;
  if (!stackConfigSummarys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_stackConfigSummarys;
    self->_stackConfigSummarys = v6;

    v4 = v8;
    stackConfigSummarys = self->_stackConfigSummarys;
  }
  -[NSMutableArray addObject:](stackConfigSummarys, "addObject:", v4);

}

- (unint64_t)stackConfigSummarysCount
{
  return -[NSMutableArray count](self->_stackConfigSummarys, "count");
}

- (id)stackConfigSummaryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_stackConfigSummarys, "objectAtIndex:", a3);
}

+ (Class)stackConfigSummaryType
{
  return (Class)objc_opt_class();
}

- (NSString)abGroup
{
  if (self->_abGroup)
    return self->_abGroup;
  else
    return (NSString *)CFSTR("default");
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasFeatureVector
{
  return self->_featureVector != 0;
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
  v8.super_class = (Class)ATXTimelineRelevancePBTimelineRelevanceContainer;
  -[ATXTimelineRelevancePBTimelineRelevanceContainer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTimelineRelevancePBTimelineRelevanceContainer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *widgetBundleId;
  NSString *widgetKind;
  NSString *containerBundleIdentifier;
  uint64_t widgetFamily;
  __CFString *v9;
  char has;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  NSString *abGroup;
  ATXTimelineRelevancePBFeatureVector *featureVector;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  widgetBundleId = self->_widgetBundleId;
  if (widgetBundleId)
    objc_msgSend(v3, "setObject:forKey:", widgetBundleId, CFSTR("widgetBundleId"));
  widgetKind = self->_widgetKind;
  if (widgetKind)
    objc_msgSend(v4, "setObject:forKey:", widgetKind, CFSTR("widgetKind"));
  containerBundleIdentifier = self->_containerBundleIdentifier;
  if (containerBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", containerBundleIdentifier, CFSTR("containerBundleIdentifier"));
  widgetFamily = self->_widgetFamily;
  if (widgetFamily >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetFamily);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E82E3DD0[widgetFamily];
  }
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("widgetFamily"));

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_timelineDonationNilCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timelineDonationNilCount"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_atLeastOnePositiveTimelineRelevanceScore);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("atLeastOnePositiveTimelineRelevanceScore"));

  }
  if (-[NSMutableArray count](self->_timelineRelevanceScores, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_timelineRelevanceScores, "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v14 = self->_timelineRelevanceScores;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v59 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("timelineRelevanceScore"));
  }
  if (-[NSMutableArray count](self->_timelineRelevanceSuggestions, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_timelineRelevanceSuggestions, "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v21 = self->_timelineRelevanceSuggestions;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v55 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("timelineRelevanceSuggestion"));
  }
  if (-[NSMutableArray count](self->_rotations, "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_rotations, "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v28 = self->_rotations;
    v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v51;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v51 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * k), "dictionaryRepresentation");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      }
      while (v30);
    }

    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("rotation"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_timestamp);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("timestamp"));

  }
  if (-[NSMutableArray count](self->_stackConfigSummarys, "count"))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_stackConfigSummarys, "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v36 = self->_stackConfigSummarys;
    v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v47;
      do
      {
        for (m = 0; m != v38; ++m)
        {
          if (*(_QWORD *)v47 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * m), "dictionaryRepresentation");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v41);

        }
        v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
      }
      while (v38);
    }

    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("stackConfigSummary"));
  }
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v4, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  featureVector = self->_featureVector;
  if (featureVector)
  {
    -[ATXTimelineRelevancePBFeatureVector dictionaryRepresentation](featureVector, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("featureVector"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXTimelineRelevancePBTimelineRelevanceContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_widgetBundleId)
    -[ATXTimelineRelevancePBTimelineRelevanceContainer writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_widgetKind)
    -[ATXTimelineRelevancePBTimelineRelevanceContainer writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if (self->_containerBundleIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteBOOLField();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = self->_timelineRelevanceScores;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v9);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = self->_timelineRelevanceSuggestions;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = self->_rotations;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v19);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = self->_stackConfigSummarys;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteSubmessage();
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v24);
  }

  if (self->_abGroup)
    PBDataWriterWriteStringField();
  if (self->_featureVector)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "setWidgetBundleId:", self->_widgetBundleId);
  objc_msgSend(v22, "setWidgetKind:", self->_widgetKind);
  if (self->_containerBundleIdentifier)
    objc_msgSend(v22, "setContainerBundleIdentifier:");
  *((_DWORD *)v22 + 22) = self->_widgetFamily;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v22 + 1) = self->_timelineDonationNilCount;
    *((_BYTE *)v22 + 108) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)v22 + 104) = self->_atLeastOnePositiveTimelineRelevanceScore;
    *((_BYTE *)v22 + 108) |= 4u;
  }
  if (-[ATXTimelineRelevancePBTimelineRelevanceContainer timelineRelevanceScoresCount](self, "timelineRelevanceScoresCount"))
  {
    objc_msgSend(v22, "clearTimelineRelevanceScores");
    v5 = -[ATXTimelineRelevancePBTimelineRelevanceContainer timelineRelevanceScoresCount](self, "timelineRelevanceScoresCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[ATXTimelineRelevancePBTimelineRelevanceContainer timelineRelevanceScoreAtIndex:](self, "timelineRelevanceScoreAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addTimelineRelevanceScore:", v8);

      }
    }
  }
  if (-[ATXTimelineRelevancePBTimelineRelevanceContainer timelineRelevanceSuggestionsCount](self, "timelineRelevanceSuggestionsCount"))
  {
    objc_msgSend(v22, "clearTimelineRelevanceSuggestions");
    v9 = -[ATXTimelineRelevancePBTimelineRelevanceContainer timelineRelevanceSuggestionsCount](self, "timelineRelevanceSuggestionsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[ATXTimelineRelevancePBTimelineRelevanceContainer timelineRelevanceSuggestionAtIndex:](self, "timelineRelevanceSuggestionAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addTimelineRelevanceSuggestion:", v12);

      }
    }
  }
  if (-[ATXTimelineRelevancePBTimelineRelevanceContainer rotationsCount](self, "rotationsCount"))
  {
    objc_msgSend(v22, "clearRotations");
    v13 = -[ATXTimelineRelevancePBTimelineRelevanceContainer rotationsCount](self, "rotationsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[ATXTimelineRelevancePBTimelineRelevanceContainer rotationAtIndex:](self, "rotationAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addRotation:", v16);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v22 + 2) = self->_timestamp;
    *((_BYTE *)v22 + 108) |= 2u;
  }
  if (-[ATXTimelineRelevancePBTimelineRelevanceContainer stackConfigSummarysCount](self, "stackConfigSummarysCount"))
  {
    objc_msgSend(v22, "clearStackConfigSummarys");
    v17 = -[ATXTimelineRelevancePBTimelineRelevanceContainer stackConfigSummarysCount](self, "stackConfigSummarysCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[ATXTimelineRelevancePBTimelineRelevanceContainer stackConfigSummaryAtIndex:](self, "stackConfigSummaryAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addStackConfigSummary:", v20);

      }
    }
  }
  if (self->_abGroup)
    objc_msgSend(v22, "setAbGroup:");
  v21 = v22;
  if (self->_featureVector)
  {
    objc_msgSend(v22, "setFeatureVector:");
    v21 = v22;
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
  char has;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_widgetBundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[NSString copyWithZone:](self->_widgetKind, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v8;

  v10 = -[NSString copyWithZone:](self->_containerBundleIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  *(_DWORD *)(v5 + 88) = self->_widgetFamily;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timelineDonationNilCount;
    *(_BYTE *)(v5 + 108) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 104) = self->_atLeastOnePositiveTimelineRelevanceScore;
    *(_BYTE *)(v5 + 108) |= 4u;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v13 = self->_timelineRelevanceScores;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTimelineRelevanceScore:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    }
    while (v15);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v19 = self->_timelineRelevanceSuggestions;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v51 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTimelineRelevanceSuggestion:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v21);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v25 = self->_rotations;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v47 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRotation:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
    }
    while (v27);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 108) |= 2u;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v31 = self->_stackConfigSummarys;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v43;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v42);
        objc_msgSend((id)v5, "addStackConfigSummary:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
    }
    while (v33);
  }

  v37 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v37;

  v39 = -[ATXTimelineRelevancePBFeatureVector copyWithZone:](self->_featureVector, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v39;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *widgetBundleId;
  NSString *widgetKind;
  NSString *containerBundleIdentifier;
  NSMutableArray *timelineRelevanceScores;
  NSMutableArray *timelineRelevanceSuggestions;
  NSMutableArray *rotations;
  NSMutableArray *stackConfigSummarys;
  NSString *abGroup;
  ATXTimelineRelevancePBFeatureVector *featureVector;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  widgetBundleId = self->_widgetBundleId;
  if ((unint64_t)widgetBundleId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](widgetBundleId, "isEqual:"))
      goto LABEL_39;
  }
  widgetKind = self->_widgetKind;
  if ((unint64_t)widgetKind | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](widgetKind, "isEqual:"))
      goto LABEL_39;
  }
  containerBundleIdentifier = self->_containerBundleIdentifier;
  if ((unint64_t)containerBundleIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](containerBundleIdentifier, "isEqual:"))
      goto LABEL_39;
  }
  if (self->_widgetFamily != *((_DWORD *)v4 + 22))
    goto LABEL_39;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 1) == 0 || self->_timelineDonationNilCount != *((_QWORD *)v4 + 1))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 108) & 1) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 4) != 0)
    {
      if (self->_atLeastOnePositiveTimelineRelevanceScore)
      {
        if (!*((_BYTE *)v4 + 104))
          goto LABEL_39;
        goto LABEL_22;
      }
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_22;
    }
LABEL_39:
    v14 = 0;
    goto LABEL_40;
  }
  if ((*((_BYTE *)v4 + 108) & 4) != 0)
    goto LABEL_39;
LABEL_22:
  timelineRelevanceScores = self->_timelineRelevanceScores;
  if ((unint64_t)timelineRelevanceScores | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](timelineRelevanceScores, "isEqual:"))
  {
    goto LABEL_39;
  }
  timelineRelevanceSuggestions = self->_timelineRelevanceSuggestions;
  if ((unint64_t)timelineRelevanceSuggestions | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](timelineRelevanceSuggestions, "isEqual:"))
      goto LABEL_39;
  }
  rotations = self->_rotations;
  if ((unint64_t)rotations | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](rotations, "isEqual:"))
      goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 108) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 2))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    goto LABEL_39;
  }
  stackConfigSummarys = self->_stackConfigSummarys;
  if ((unint64_t)stackConfigSummarys | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](stackConfigSummarys, "isEqual:"))
  {
    goto LABEL_39;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:"))
      goto LABEL_39;
  }
  featureVector = self->_featureVector;
  if ((unint64_t)featureVector | *((_QWORD *)v4 + 5))
    v14 = -[ATXTimelineRelevancePBFeatureVector isEqual:](featureVector, "isEqual:");
  else
    v14 = 1;
LABEL_40:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t widgetFamily;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;

  v3 = -[NSString hash](self->_widgetBundleId, "hash");
  v4 = -[NSString hash](self->_widgetKind, "hash");
  v5 = -[NSString hash](self->_containerBundleIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_timelineDonationNilCount;
  else
    v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_atLeastOnePositiveTimelineRelevanceScore;
  else
    v7 = 0;
  widgetFamily = self->_widgetFamily;
  v9 = -[NSMutableArray hash](self->_timelineRelevanceScores, "hash");
  v10 = -[NSMutableArray hash](self->_timelineRelevanceSuggestions, "hash");
  v11 = -[NSMutableArray hash](self->_rotations, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v12 = 2654435761 * self->_timestamp;
  else
    v12 = 0;
  v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (2654435761 * widgetFamily);
  v14 = v9 ^ v10 ^ v11 ^ v12 ^ -[NSMutableArray hash](self->_stackConfigSummarys, "hash");
  v15 = v13 ^ v14 ^ -[NSString hash](self->_abGroup, "hash");
  return v15 ^ -[ATXTimelineRelevancePBFeatureVector hash](self->_featureVector, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  ATXTimelineRelevancePBFeatureVector *featureVector;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 10))
    -[ATXTimelineRelevancePBTimelineRelevanceContainer setWidgetBundleId:](self, "setWidgetBundleId:");
  if (*((_QWORD *)v4 + 12))
    -[ATXTimelineRelevancePBTimelineRelevanceContainer setWidgetKind:](self, "setWidgetKind:");
  if (*((_QWORD *)v4 + 4))
    -[ATXTimelineRelevancePBTimelineRelevanceContainer setContainerBundleIdentifier:](self, "setContainerBundleIdentifier:");
  self->_widgetFamily = *((_DWORD *)v4 + 22);
  v5 = *((_BYTE *)v4 + 108);
  if ((v5 & 1) != 0)
  {
    self->_timelineDonationNilCount = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 108);
  }
  if ((v5 & 4) != 0)
  {
    self->_atLeastOnePositiveTimelineRelevanceScore = *((_BYTE *)v4 + 104);
    *(_BYTE *)&self->_has |= 4u;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = *((id *)v4 + 8);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v6);
        -[ATXTimelineRelevancePBTimelineRelevanceContainer addTimelineRelevanceScore:](self, "addTimelineRelevanceScore:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v8);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = *((id *)v4 + 9);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v11);
        -[ATXTimelineRelevancePBTimelineRelevanceContainer addTimelineRelevanceSuggestion:](self, "addTimelineRelevanceSuggestion:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v13);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = *((id *)v4 + 6);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        -[ATXTimelineRelevancePBTimelineRelevanceContainer addRotation:](self, "addRotation:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v18);
  }

  if ((*((_BYTE *)v4 + 108) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = *((id *)v4 + 7);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        -[ATXTimelineRelevancePBTimelineRelevanceContainer addStackConfigSummary:](self, "addStackConfigSummary:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * m), (_QWORD)v28);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
    }
    while (v23);
  }

  if (*((_QWORD *)v4 + 3))
    -[ATXTimelineRelevancePBTimelineRelevanceContainer setAbGroup:](self, "setAbGroup:");
  featureVector = self->_featureVector;
  v27 = *((_QWORD *)v4 + 5);
  if (featureVector)
  {
    if (v27)
      -[ATXTimelineRelevancePBFeatureVector mergeFrom:](featureVector, "mergeFrom:");
  }
  else if (v27)
  {
    -[ATXTimelineRelevancePBTimelineRelevanceContainer setFeatureVector:](self, "setFeatureVector:");
  }

}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (void)setWidgetBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetBundleId, a3);
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (void)setWidgetKind:(id)a3
{
  objc_storeStrong((id *)&self->_widgetKind, a3);
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (void)setContainerBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerBundleIdentifier, a3);
}

- (int)widgetFamily
{
  return self->_widgetFamily;
}

- (void)setWidgetFamily:(int)a3
{
  self->_widgetFamily = a3;
}

- (int64_t)timelineDonationNilCount
{
  return self->_timelineDonationNilCount;
}

- (BOOL)atLeastOnePositiveTimelineRelevanceScore
{
  return self->_atLeastOnePositiveTimelineRelevanceScore;
}

- (NSMutableArray)timelineRelevanceScores
{
  return self->_timelineRelevanceScores;
}

- (void)setTimelineRelevanceScores:(id)a3
{
  objc_storeStrong((id *)&self->_timelineRelevanceScores, a3);
}

- (NSMutableArray)timelineRelevanceSuggestions
{
  return self->_timelineRelevanceSuggestions;
}

- (void)setTimelineRelevanceSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_timelineRelevanceSuggestions, a3);
}

- (NSMutableArray)rotations
{
  return self->_rotations;
}

- (void)setRotations:(id)a3
{
  objc_storeStrong((id *)&self->_rotations, a3);
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)stackConfigSummarys
{
  return self->_stackConfigSummarys;
}

- (void)setStackConfigSummarys:(id)a3
{
  objc_storeStrong((id *)&self->_stackConfigSummarys, a3);
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (ATXTimelineRelevancePBFeatureVector)featureVector
{
  return self->_featureVector;
}

- (void)setFeatureVector:(id)a3
{
  objc_storeStrong((id *)&self->_featureVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
  objc_storeStrong((id *)&self->_timelineRelevanceSuggestions, 0);
  objc_storeStrong((id *)&self->_timelineRelevanceScores, 0);
  objc_storeStrong((id *)&self->_stackConfigSummarys, 0);
  objc_storeStrong((id *)&self->_rotations, 0);
  objc_storeStrong((id *)&self->_featureVector, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ATXTimelineRelevancePBTimelineRelevanceContainer writeTo:]", "ATXTimelineRelevancePBTimelineRelevanceContainer.m", 390, "nil != self->_widgetBundleId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ATXTimelineRelevancePBTimelineRelevanceContainer writeTo:]", "ATXTimelineRelevancePBTimelineRelevanceContainer.m", 395, "nil != self->_widgetKind");
}

@end
