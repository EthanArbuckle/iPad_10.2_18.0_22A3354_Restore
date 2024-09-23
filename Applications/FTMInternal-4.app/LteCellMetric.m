@implementation LteCellMetric

- (void)setEvent:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_event = a3;
}

- (void)setHasEvent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEvent
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearCells
{
  -[NSMutableArray removeAllObjects](self->_cells, "removeAllObjects");
}

- (void)addCell:(id)a3
{
  id v4;
  NSMutableArray *cells;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  cells = self->_cells;
  v8 = v4;
  if (!cells)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_cells;
    self->_cells = v6;

    v4 = v8;
    cells = self->_cells;
  }
  -[NSMutableArray addObject:](cells, "addObject:", v4);

}

- (unint64_t)cellsCount
{
  return (unint64_t)-[NSMutableArray count](self->_cells, "count");
}

- (id)cellAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_cells, "objectAtIndex:", a3);
}

+ (Class)cellType
{
  return (Class)objc_opt_class(CellConfig, a2);
}

- (BOOL)hasTotalMetric
{
  return self->_totalMetric != 0;
}

- (BOOL)hasConfiguredMetric
{
  return self->_configuredMetric != 0;
}

- (BOOL)hasActivatedMetric
{
  return self->_activatedMetric != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LteCellMetric;
  v3 = -[LteCellMetric description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LteCellMetric dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  CellMetric *totalMetric;
  void *v13;
  CellMetric *configuredMetric;
  void *v15;
  CellMetric *activatedMetric;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_event));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("event"));

  }
  if (-[NSMutableArray count](self->_cells, "count"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_cells, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_cells;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v19));
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cell"));
  }
  totalMetric = self->_totalMetric;
  if (totalMetric)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CellMetric dictionaryRepresentation](totalMetric, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("total_metric"));

  }
  configuredMetric = self->_configuredMetric;
  if (configuredMetric)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CellMetric dictionaryRepresentation](configuredMetric, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("configured_metric"));

  }
  activatedMetric = self->_activatedMetric;
  if (activatedMetric)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CellMetric dictionaryRepresentation](activatedMetric, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("activated_metric"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008F324((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  CellMetric *totalMetric;
  CellMetric *configuredMetric;
  CellMetric *activatedMetric;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field(v4, self->_event, 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_cells;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), 4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  totalMetric = self->_totalMetric;
  if (totalMetric)
    PBDataWriterWriteSubmessage(v5, totalMetric, 7);
  configuredMetric = self->_configuredMetric;
  if (configuredMetric)
    PBDataWriterWriteSubmessage(v5, configuredMetric, 8);
  activatedMetric = self->_activatedMetric;
  if (activatedMetric)
    PBDataWriterWriteSubmessage(v5, activatedMetric, 9);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_event;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v10 = v4;
  if (-[LteCellMetric cellsCount](self, "cellsCount"))
  {
    objc_msgSend(v10, "clearCells");
    v5 = -[LteCellMetric cellsCount](self, "cellsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[LteCellMetric cellAtIndex:](self, "cellAtIndex:", i));
        objc_msgSend(v10, "addCell:", v8);

      }
    }
  }
  if (self->_totalMetric)
    objc_msgSend(v10, "setTotalMetric:");
  v9 = v10;
  if (self->_configuredMetric)
  {
    objc_msgSend(v10, "setConfiguredMetric:");
    v9 = v10;
  }
  if (self->_activatedMetric)
  {
    objc_msgSend(v10, "setActivatedMetric:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_event;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = self->_cells;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addCell:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v13 = -[CellMetric copyWithZone:](self->_totalMetric, "copyWithZone:", a3);
  v14 = (void *)v6[5];
  v6[5] = v13;

  v15 = -[CellMetric copyWithZone:](self->_configuredMetric, "copyWithZone:", a3);
  v16 = (void *)v6[3];
  v6[3] = v15;

  v17 = -[CellMetric copyWithZone:](self->_activatedMetric, "copyWithZone:", a3);
  v18 = (void *)v6[1];
  v6[1] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *cells;
  CellMetric *totalMetric;
  CellMetric *configuredMetric;
  CellMetric *activatedMetric;
  unsigned __int8 v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_event != *((_DWORD *)v4 + 8))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  cells = self->_cells;
  if ((unint64_t)cells | *((_QWORD *)v4 + 2) && !-[NSMutableArray isEqual:](cells, "isEqual:"))
    goto LABEL_15;
  totalMetric = self->_totalMetric;
  if ((unint64_t)totalMetric | *((_QWORD *)v4 + 5))
  {
    if (!-[CellMetric isEqual:](totalMetric, "isEqual:"))
      goto LABEL_15;
  }
  configuredMetric = self->_configuredMetric;
  if ((unint64_t)configuredMetric | *((_QWORD *)v4 + 3))
  {
    if (!-[CellMetric isEqual:](configuredMetric, "isEqual:"))
      goto LABEL_15;
  }
  activatedMetric = self->_activatedMetric;
  if ((unint64_t)activatedMetric | *((_QWORD *)v4 + 1))
    v10 = -[CellMetric isEqual:](activatedMetric, "isEqual:");
  else
    v10 = 1;
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_event;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSMutableArray hash](self->_cells, "hash") ^ v3;
  v5 = -[CellMetric hash](self->_totalMetric, "hash");
  v6 = v4 ^ v5 ^ -[CellMetric hash](self->_configuredMetric, "hash");
  return v6 ^ -[CellMetric hash](self->_activatedMetric, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  CellMetric *totalMetric;
  uint64_t v12;
  CellMetric *configuredMetric;
  uint64_t v14;
  CellMetric *activatedMetric;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_event = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        -[LteCellMetric addCell:](self, "addCell:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  totalMetric = self->_totalMetric;
  v12 = v5[5];
  if (totalMetric)
  {
    if (v12)
      -[CellMetric mergeFrom:](totalMetric, "mergeFrom:");
  }
  else if (v12)
  {
    -[LteCellMetric setTotalMetric:](self, "setTotalMetric:");
  }
  configuredMetric = self->_configuredMetric;
  v14 = v5[3];
  if (configuredMetric)
  {
    if (v14)
      -[CellMetric mergeFrom:](configuredMetric, "mergeFrom:");
  }
  else if (v14)
  {
    -[LteCellMetric setConfiguredMetric:](self, "setConfiguredMetric:");
  }
  activatedMetric = self->_activatedMetric;
  v16 = v5[1];
  if (activatedMetric)
  {
    if (v16)
      -[CellMetric mergeFrom:](activatedMetric, "mergeFrom:");
  }
  else if (v16)
  {
    -[LteCellMetric setActivatedMetric:](self, "setActivatedMetric:");
  }

}

- (unsigned)event
{
  return self->_event;
}

- (NSMutableArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
  objc_storeStrong((id *)&self->_cells, a3);
}

- (CellMetric)totalMetric
{
  return self->_totalMetric;
}

- (void)setTotalMetric:(id)a3
{
  objc_storeStrong((id *)&self->_totalMetric, a3);
}

- (CellMetric)configuredMetric
{
  return self->_configuredMetric;
}

- (void)setConfiguredMetric:(id)a3
{
  objc_storeStrong((id *)&self->_configuredMetric, a3);
}

- (CellMetric)activatedMetric
{
  return self->_activatedMetric;
}

- (void)setActivatedMetric:(id)a3
{
  objc_storeStrong((id *)&self->_activatedMetric, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalMetric, 0);
  objc_storeStrong((id *)&self->_configuredMetric, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_activatedMetric, 0);
}

@end
