@implementation HKCodableSummaryTrendTileViewModel

- (BOOL)hasTrendDescription
{
  return self->_trendDescription != 0;
}

- (BOOL)hasChangeTypeRawValue
{
  return self->_changeTypeRawValue != 0;
}

- (int)diagramStyle
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_diagramStyle;
  else
    return 0;
}

- (void)setDiagramStyle:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_diagramStyle = a3;
}

- (void)setHasDiagramStyle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDiagramStyle
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)diagramStyleAsString:(int)a3
{
  if (a3 < 5)
    return off_1E9C3FE30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDiagramStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bar")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("line")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("minMax")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("distribution")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("bloodPressure")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasObjectTypeIdentifier
{
  return self->_objectTypeIdentifier != 0;
}

- (BOOL)hasCoveredDateRangeRawValue
{
  return self->_coveredDateRangeRawValue != 0;
}

- (BOOL)hasBaseTrendLine
{
  return self->_baseTrendLine != 0;
}

- (BOOL)hasChangeTrendLine
{
  return self->_changeTrendLine != 0;
}

- (void)clearVisualizationPoints
{
  -[NSMutableArray removeAllObjects](self->_visualizationPoints, "removeAllObjects");
}

- (void)addVisualizationPoints:(id)a3
{
  id v4;
  NSMutableArray *visualizationPoints;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  visualizationPoints = self->_visualizationPoints;
  v8 = v4;
  if (!visualizationPoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_visualizationPoints;
    self->_visualizationPoints = v6;

    v4 = v8;
    visualizationPoints = self->_visualizationPoints;
  }
  -[NSMutableArray addObject:](visualizationPoints, "addObject:", v4);

}

- (unint64_t)visualizationPointsCount
{
  return -[NSMutableArray count](self->_visualizationPoints, "count");
}

- (id)visualizationPointsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_visualizationPoints, "objectAtIndex:", a3);
}

+ (Class)visualizationPointsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNotificationIdentifier
{
  return self->_notificationIdentifier != 0;
}

- (void)setDiscoveryDateData:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_discoveryDateData = a3;
}

- (void)setHasDiscoveryDateData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDiscoveryDateData
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setOriginalEventDateData:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_originalEventDateData = a3;
}

- (void)setHasOriginalEventDateData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOriginalEventDateData
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasTrendDescriptionSharingPreviewOverride
{
  return self->_trendDescriptionSharingPreviewOverride != 0;
}

- (BOOL)hasCellHeaderViewModel
{
  return self->_cellHeaderViewModel != 0;
}

- (BOOL)hasPregnancyLabelValue
{
  return self->_pregnancyLabelValue != 0;
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
  v8.super_class = (Class)HKCodableSummaryTrendTileViewModel;
  -[HKCodableSummaryTrendTileViewModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryTrendTileViewModel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *trendDescription;
  NSString *changeTypeRawValue;
  uint64_t diagramStyle;
  __CFString *v8;
  NSString *objectTypeIdentifier;
  NSString *coveredDateRangeRawValue;
  HKCodableSummaryTrendLineViewModel *baseTrendLine;
  void *v12;
  HKCodableSummaryTrendLineViewModel *changeTrendLine;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSString *notificationIdentifier;
  char has;
  void *v24;
  void *v25;
  NSString *trendDescriptionSharingPreviewOverride;
  HKCodableCellHeaderViewModel *cellHeaderViewModel;
  void *v28;
  NSString *pregnancyLabelValue;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  trendDescription = self->_trendDescription;
  if (trendDescription)
    objc_msgSend(v3, "setObject:forKey:", trendDescription, CFSTR("trendDescription"));
  changeTypeRawValue = self->_changeTypeRawValue;
  if (changeTypeRawValue)
    objc_msgSend(v4, "setObject:forKey:", changeTypeRawValue, CFSTR("changeTypeRawValue"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    diagramStyle = self->_diagramStyle;
    if (diagramStyle >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_diagramStyle);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E9C3FE30[diagramStyle];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("diagramStyle"));

  }
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if (objectTypeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", objectTypeIdentifier, CFSTR("objectTypeIdentifier"));
  coveredDateRangeRawValue = self->_coveredDateRangeRawValue;
  if (coveredDateRangeRawValue)
    objc_msgSend(v4, "setObject:forKey:", coveredDateRangeRawValue, CFSTR("coveredDateRangeRawValue"));
  baseTrendLine = self->_baseTrendLine;
  if (baseTrendLine)
  {
    -[HKCodableSummaryTrendLineViewModel dictionaryRepresentation](baseTrendLine, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("baseTrendLine"));

  }
  changeTrendLine = self->_changeTrendLine;
  if (changeTrendLine)
  {
    -[HKCodableSummaryTrendLineViewModel dictionaryRepresentation](changeTrendLine, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("changeTrendLine"));

  }
  if (-[NSMutableArray count](self->_visualizationPoints, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_visualizationPoints, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v16 = self->_visualizationPoints;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("visualizationPoints"));
  }
  notificationIdentifier = self->_notificationIdentifier;
  if (notificationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", notificationIdentifier, CFSTR("notificationIdentifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_discoveryDateData);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("discoveryDateData"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_originalEventDateData);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("originalEventDateData"));

  }
  trendDescriptionSharingPreviewOverride = self->_trendDescriptionSharingPreviewOverride;
  if (trendDescriptionSharingPreviewOverride)
    objc_msgSend(v4, "setObject:forKey:", trendDescriptionSharingPreviewOverride, CFSTR("trendDescriptionSharingPreviewOverride"));
  cellHeaderViewModel = self->_cellHeaderViewModel;
  if (cellHeaderViewModel)
  {
    -[HKCodableCellHeaderViewModel dictionaryRepresentation](cellHeaderViewModel, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("cellHeaderViewModel"));

  }
  pregnancyLabelValue = self->_pregnancyLabelValue;
  if (pregnancyLabelValue)
    objc_msgSend(v4, "setObject:forKey:", pregnancyLabelValue, CFSTR("pregnancyLabelValue"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryTrendTileViewModelReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_trendDescription)
    PBDataWriterWriteStringField();
  if (self->_changeTypeRawValue)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_objectTypeIdentifier)
    PBDataWriterWriteStringField();
  if (self->_coveredDateRangeRawValue)
    PBDataWriterWriteStringField();
  if (self->_baseTrendLine)
    PBDataWriterWriteSubmessage();
  if (self->_changeTrendLine)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_visualizationPoints;
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

  if (self->_notificationIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_trendDescriptionSharingPreviewOverride)
    PBDataWriterWriteStringField();
  if (self->_cellHeaderViewModel)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_pregnancyLabelValue)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _QWORD *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_trendDescription)
  {
    objc_msgSend(v4, "setTrendDescription:");
    v4 = v10;
  }
  if (self->_changeTypeRawValue)
  {
    objc_msgSend(v10, "setChangeTypeRawValue:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_diagramStyle;
    *((_BYTE *)v4 + 120) |= 4u;
  }
  if (self->_objectTypeIdentifier)
    objc_msgSend(v10, "setObjectTypeIdentifier:");
  if (self->_coveredDateRangeRawValue)
    objc_msgSend(v10, "setCoveredDateRangeRawValue:");
  if (self->_baseTrendLine)
    objc_msgSend(v10, "setBaseTrendLine:");
  if (self->_changeTrendLine)
    objc_msgSend(v10, "setChangeTrendLine:");
  if (-[HKCodableSummaryTrendTileViewModel visualizationPointsCount](self, "visualizationPointsCount"))
  {
    objc_msgSend(v10, "clearVisualizationPoints");
    v5 = -[HKCodableSummaryTrendTileViewModel visualizationPointsCount](self, "visualizationPointsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HKCodableSummaryTrendTileViewModel visualizationPointsAtIndex:](self, "visualizationPointsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addVisualizationPoints:", v8);

      }
    }
  }
  if (self->_notificationIdentifier)
    objc_msgSend(v10, "setNotificationIdentifier:");
  v9 = v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v10 + 1) = *(_QWORD *)&self->_discoveryDateData;
    *((_BYTE *)v10 + 120) |= 1u;
  }
  if (self->_trendDescriptionSharingPreviewOverride)
  {
    objc_msgSend(v10, "setTrendDescriptionSharingPreviewOverride:");
    v9 = v10;
  }
  if (self->_cellHeaderViewModel)
  {
    objc_msgSend(v10, "setCellHeaderViewModel:");
    v9 = v10;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9[2] = *(_QWORD *)&self->_originalEventDateData;
    *((_BYTE *)v9 + 120) |= 2u;
  }
  if (self->_pregnancyLabelValue)
  {
    objc_msgSend(v10, "setPregnancyLabelValue:");
    v9 = v10;
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
  uint64_t v12;
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
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_trendDescription, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v6;

  v8 = -[NSString copyWithZone:](self->_changeTypeRawValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_diagramStyle;
    *(_BYTE *)(v5 + 120) |= 4u;
  }
  v10 = -[NSString copyWithZone:](self->_objectTypeIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v10;

  v12 = -[NSString copyWithZone:](self->_coveredDateRangeRawValue, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[HKCodableSummaryTrendLineViewModel copyWithZone:](self->_baseTrendLine, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v16 = -[HKCodableSummaryTrendLineViewModel copyWithZone:](self->_changeTrendLine, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = self->_visualizationPoints;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v22), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addVisualizationPoints:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v20);
  }

  v24 = -[NSString copyWithZone:](self->_notificationIdentifier, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_discoveryDateData;
    *(_BYTE *)(v5 + 120) |= 1u;
  }
  v26 = -[NSString copyWithZone:](self->_trendDescriptionSharingPreviewOverride, "copyWithZone:", a3, (_QWORD)v33);
  v27 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v26;

  v28 = -[HKCodableCellHeaderViewModel copyWithZone:](self->_cellHeaderViewModel, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v28;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_originalEventDateData;
    *(_BYTE *)(v5 + 120) |= 2u;
  }
  v30 = -[NSString copyWithZone:](self->_pregnancyLabelValue, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v30;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *trendDescription;
  NSString *changeTypeRawValue;
  NSString *objectTypeIdentifier;
  NSString *coveredDateRangeRawValue;
  HKCodableSummaryTrendLineViewModel *baseTrendLine;
  HKCodableSummaryTrendLineViewModel *changeTrendLine;
  NSMutableArray *visualizationPoints;
  NSString *notificationIdentifier;
  NSString *trendDescriptionSharingPreviewOverride;
  HKCodableCellHeaderViewModel *cellHeaderViewModel;
  NSString *pregnancyLabelValue;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  trendDescription = self->_trendDescription;
  if ((unint64_t)trendDescription | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](trendDescription, "isEqual:"))
      goto LABEL_39;
  }
  changeTypeRawValue = self->_changeTypeRawValue;
  if ((unint64_t)changeTypeRawValue | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](changeTypeRawValue, "isEqual:"))
      goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 4) == 0 || self->_diagramStyle != *((_DWORD *)v4 + 16))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 120) & 4) != 0)
  {
LABEL_39:
    v16 = 0;
    goto LABEL_40;
  }
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if ((unint64_t)objectTypeIdentifier | *((_QWORD *)v4 + 10)
    && !-[NSString isEqual:](objectTypeIdentifier, "isEqual:"))
  {
    goto LABEL_39;
  }
  coveredDateRangeRawValue = self->_coveredDateRangeRawValue;
  if ((unint64_t)coveredDateRangeRawValue | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](coveredDateRangeRawValue, "isEqual:"))
      goto LABEL_39;
  }
  baseTrendLine = self->_baseTrendLine;
  if ((unint64_t)baseTrendLine | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodableSummaryTrendLineViewModel isEqual:](baseTrendLine, "isEqual:"))
      goto LABEL_39;
  }
  changeTrendLine = self->_changeTrendLine;
  if ((unint64_t)changeTrendLine | *((_QWORD *)v4 + 5))
  {
    if (!-[HKCodableSummaryTrendLineViewModel isEqual:](changeTrendLine, "isEqual:"))
      goto LABEL_39;
  }
  visualizationPoints = self->_visualizationPoints;
  if ((unint64_t)visualizationPoints | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](visualizationPoints, "isEqual:"))
      goto LABEL_39;
  }
  notificationIdentifier = self->_notificationIdentifier;
  if ((unint64_t)notificationIdentifier | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](notificationIdentifier, "isEqual:"))
      goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 1) == 0 || self->_discoveryDateData != *((double *)v4 + 1))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
    goto LABEL_39;
  }
  trendDescriptionSharingPreviewOverride = self->_trendDescriptionSharingPreviewOverride;
  if ((unint64_t)trendDescriptionSharingPreviewOverride | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](trendDescriptionSharingPreviewOverride, "isEqual:"))
  {
    goto LABEL_39;
  }
  cellHeaderViewModel = self->_cellHeaderViewModel;
  if ((unint64_t)cellHeaderViewModel | *((_QWORD *)v4 + 4))
  {
    if (!-[HKCodableCellHeaderViewModel isEqual:](cellHeaderViewModel, "isEqual:"))
      goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 2) == 0 || self->_originalEventDateData != *((double *)v4 + 2))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 120) & 2) != 0)
  {
    goto LABEL_39;
  }
  pregnancyLabelValue = self->_pregnancyLabelValue;
  if ((unint64_t)pregnancyLabelValue | *((_QWORD *)v4 + 11))
    v16 = -[NSString isEqual:](pregnancyLabelValue, "isEqual:");
  else
    v16 = 1;
LABEL_40:

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  double discoveryDateData;
  double v9;
  long double v10;
  double v11;
  NSUInteger v12;
  unint64_t v13;
  unint64_t v14;
  double originalEventDateData;
  double v16;
  long double v17;
  double v18;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;

  v24 = -[NSString hash](self->_trendDescription, "hash");
  v23 = -[NSString hash](self->_changeTypeRawValue, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v22 = 2654435761 * self->_diagramStyle;
  else
    v22 = 0;
  v21 = -[NSString hash](self->_objectTypeIdentifier, "hash");
  v20 = -[NSString hash](self->_coveredDateRangeRawValue, "hash");
  v3 = -[HKCodableSummaryTrendLineViewModel hash](self->_baseTrendLine, "hash");
  v4 = -[HKCodableSummaryTrendLineViewModel hash](self->_changeTrendLine, "hash");
  v5 = -[NSMutableArray hash](self->_visualizationPoints, "hash");
  v6 = -[NSString hash](self->_notificationIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    discoveryDateData = self->_discoveryDateData;
    v9 = -discoveryDateData;
    if (discoveryDateData >= 0.0)
      v9 = self->_discoveryDateData;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  v12 = -[NSString hash](self->_trendDescriptionSharingPreviewOverride, "hash");
  v13 = -[HKCodableCellHeaderViewModel hash](self->_cellHeaderViewModel, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    originalEventDateData = self->_originalEventDateData;
    v16 = -originalEventDateData;
    if (originalEventDateData >= 0.0)
      v16 = self->_originalEventDateData;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v14 ^ -[NSString hash](self->_pregnancyLabelValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableSummaryTrendLineViewModel *baseTrendLine;
  uint64_t v6;
  HKCodableSummaryTrendLineViewModel *changeTrendLine;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  HKCodableCellHeaderViewModel *cellHeaderViewModel;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 12))
    -[HKCodableSummaryTrendTileViewModel setTrendDescription:](self, "setTrendDescription:");
  if (*((_QWORD *)v4 + 6))
    -[HKCodableSummaryTrendTileViewModel setChangeTypeRawValue:](self, "setChangeTypeRawValue:");
  if ((*((_BYTE *)v4 + 120) & 4) != 0)
  {
    self->_diagramStyle = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 10))
    -[HKCodableSummaryTrendTileViewModel setObjectTypeIdentifier:](self, "setObjectTypeIdentifier:");
  if (*((_QWORD *)v4 + 7))
    -[HKCodableSummaryTrendTileViewModel setCoveredDateRangeRawValue:](self, "setCoveredDateRangeRawValue:");
  baseTrendLine = self->_baseTrendLine;
  v6 = *((_QWORD *)v4 + 3);
  if (baseTrendLine)
  {
    if (v6)
      -[HKCodableSummaryTrendLineViewModel mergeFrom:](baseTrendLine, "mergeFrom:");
  }
  else if (v6)
  {
    -[HKCodableSummaryTrendTileViewModel setBaseTrendLine:](self, "setBaseTrendLine:");
  }
  changeTrendLine = self->_changeTrendLine;
  v8 = *((_QWORD *)v4 + 5);
  if (changeTrendLine)
  {
    if (v8)
      -[HKCodableSummaryTrendLineViewModel mergeFrom:](changeTrendLine, "mergeFrom:");
  }
  else if (v8)
  {
    -[HKCodableSummaryTrendTileViewModel setChangeTrendLine:](self, "setChangeTrendLine:");
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = *((id *)v4 + 14);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[HKCodableSummaryTrendTileViewModel addVisualizationPoints:](self, "addVisualizationPoints:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  if (*((_QWORD *)v4 + 9))
    -[HKCodableSummaryTrendTileViewModel setNotificationIdentifier:](self, "setNotificationIdentifier:");
  if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
    self->_discoveryDateData = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 13))
    -[HKCodableSummaryTrendTileViewModel setTrendDescriptionSharingPreviewOverride:](self, "setTrendDescriptionSharingPreviewOverride:");
  cellHeaderViewModel = self->_cellHeaderViewModel;
  v15 = *((_QWORD *)v4 + 4);
  if (cellHeaderViewModel)
  {
    if (v15)
      -[HKCodableCellHeaderViewModel mergeFrom:](cellHeaderViewModel, "mergeFrom:");
  }
  else if (v15)
  {
    -[HKCodableSummaryTrendTileViewModel setCellHeaderViewModel:](self, "setCellHeaderViewModel:");
  }
  if ((*((_BYTE *)v4 + 120) & 2) != 0)
  {
    self->_originalEventDateData = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 11))
    -[HKCodableSummaryTrendTileViewModel setPregnancyLabelValue:](self, "setPregnancyLabelValue:");

}

- (NSString)trendDescription
{
  return self->_trendDescription;
}

- (void)setTrendDescription:(id)a3
{
  objc_storeStrong((id *)&self->_trendDescription, a3);
}

- (NSString)changeTypeRawValue
{
  return self->_changeTypeRawValue;
}

- (void)setChangeTypeRawValue:(id)a3
{
  objc_storeStrong((id *)&self->_changeTypeRawValue, a3);
}

- (NSString)objectTypeIdentifier
{
  return self->_objectTypeIdentifier;
}

- (void)setObjectTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectTypeIdentifier, a3);
}

- (NSString)coveredDateRangeRawValue
{
  return self->_coveredDateRangeRawValue;
}

- (void)setCoveredDateRangeRawValue:(id)a3
{
  objc_storeStrong((id *)&self->_coveredDateRangeRawValue, a3);
}

- (HKCodableSummaryTrendLineViewModel)baseTrendLine
{
  return self->_baseTrendLine;
}

- (void)setBaseTrendLine:(id)a3
{
  objc_storeStrong((id *)&self->_baseTrendLine, a3);
}

- (HKCodableSummaryTrendLineViewModel)changeTrendLine
{
  return self->_changeTrendLine;
}

- (void)setChangeTrendLine:(id)a3
{
  objc_storeStrong((id *)&self->_changeTrendLine, a3);
}

- (NSMutableArray)visualizationPoints
{
  return self->_visualizationPoints;
}

- (void)setVisualizationPoints:(id)a3
{
  objc_storeStrong((id *)&self->_visualizationPoints, a3);
}

- (NSString)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (void)setNotificationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_notificationIdentifier, a3);
}

- (double)discoveryDateData
{
  return self->_discoveryDateData;
}

- (double)originalEventDateData
{
  return self->_originalEventDateData;
}

- (NSString)trendDescriptionSharingPreviewOverride
{
  return self->_trendDescriptionSharingPreviewOverride;
}

- (void)setTrendDescriptionSharingPreviewOverride:(id)a3
{
  objc_storeStrong((id *)&self->_trendDescriptionSharingPreviewOverride, a3);
}

- (HKCodableCellHeaderViewModel)cellHeaderViewModel
{
  return self->_cellHeaderViewModel;
}

- (void)setCellHeaderViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_cellHeaderViewModel, a3);
}

- (NSString)pregnancyLabelValue
{
  return self->_pregnancyLabelValue;
}

- (void)setPregnancyLabelValue:(id)a3
{
  objc_storeStrong((id *)&self->_pregnancyLabelValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualizationPoints, 0);
  objc_storeStrong((id *)&self->_trendDescriptionSharingPreviewOverride, 0);
  objc_storeStrong((id *)&self->_trendDescription, 0);
  objc_storeStrong((id *)&self->_pregnancyLabelValue, 0);
  objc_storeStrong((id *)&self->_objectTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
  objc_storeStrong((id *)&self->_coveredDateRangeRawValue, 0);
  objc_storeStrong((id *)&self->_changeTypeRawValue, 0);
  objc_storeStrong((id *)&self->_changeTrendLine, 0);
  objc_storeStrong((id *)&self->_cellHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_baseTrendLine, 0);
}

@end
