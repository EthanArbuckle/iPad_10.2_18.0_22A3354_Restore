@implementation KCellularWcdmaNbrCellMeas

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearMeasUtraResults
{
  -[NSMutableArray removeAllObjects](self->_measUtraResults, "removeAllObjects");
}

- (void)addMeasUtraResult:(id)a3
{
  id v4;
  NSMutableArray *measUtraResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  measUtraResults = self->_measUtraResults;
  v8 = v4;
  if (!measUtraResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_measUtraResults;
    self->_measUtraResults = v6;

    v4 = v8;
    measUtraResults = self->_measUtraResults;
  }
  -[NSMutableArray addObject:](measUtraResults, "addObject:", v4);

}

- (unint64_t)measUtraResultsCount
{
  return (unint64_t)-[NSMutableArray count](self->_measUtraResults, "count");
}

- (id)measUtraResultAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_measUtraResults, "objectAtIndex:", a3);
}

+ (Class)measUtraResultType
{
  return (Class)objc_opt_class(UtraCellMeasResult, a2);
}

- (void)clearMeasGsmResults
{
  -[NSMutableArray removeAllObjects](self->_measGsmResults, "removeAllObjects");
}

- (void)addMeasGsmResult:(id)a3
{
  id v4;
  NSMutableArray *measGsmResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  measGsmResults = self->_measGsmResults;
  v8 = v4;
  if (!measGsmResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_measGsmResults;
    self->_measGsmResults = v6;

    v4 = v8;
    measGsmResults = self->_measGsmResults;
  }
  -[NSMutableArray addObject:](measGsmResults, "addObject:", v4);

}

- (unint64_t)measGsmResultsCount
{
  return (unint64_t)-[NSMutableArray count](self->_measGsmResults, "count");
}

- (id)measGsmResultAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_measGsmResults, "objectAtIndex:", a3);
}

+ (Class)measGsmResultType
{
  return (Class)objc_opt_class(GsmCellMeasResult, a2);
}

- (void)clearMeasLteResults
{
  -[NSMutableArray removeAllObjects](self->_measLteResults, "removeAllObjects");
}

- (void)addMeasLteResult:(id)a3
{
  id v4;
  NSMutableArray *measLteResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  measLteResults = self->_measLteResults;
  v8 = v4;
  if (!measLteResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_measLteResults;
    self->_measLteResults = v6;

    v4 = v8;
    measLteResults = self->_measLteResults;
  }
  -[NSMutableArray addObject:](measLteResults, "addObject:", v4);

}

- (unint64_t)measLteResultsCount
{
  return (unint64_t)-[NSMutableArray count](self->_measLteResults, "count");
}

- (id)measLteResultAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_measLteResults, "objectAtIndex:", a3);
}

+ (Class)measLteResultType
{
  return (Class)objc_opt_class(LteCellMeasResult, a2);
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularWcdmaNbrCellMeas;
  v3 = -[KCellularWcdmaNbrCellMeas description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularWcdmaNbrCellMeas dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  void *v10;
  void *v11;
  id v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
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
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  if (-[NSMutableArray count](self->_measUtraResults, "count"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_measUtraResults, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v6 = self->_measUtraResults;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v37;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v37 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v10), "dictionaryRepresentation"));
          objc_msgSend(v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("meas_utra_result"));
  }
  if (-[NSMutableArray count](self->_measGsmResults, "count"))
  {
    v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_measGsmResults, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = self->_measGsmResults;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v17), "dictionaryRepresentation"));
          objc_msgSend(v12, "addObject:", v18);

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("meas_gsm_result"));
  }
  if (-[NSMutableArray count](self->_measLteResults, "count"))
  {
    v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_measLteResults, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = self->_measLteResults;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v24), "dictionaryRepresentation", (_QWORD)v28));
          objc_msgSend(v19, "addObject:", v25);

          v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("meas_lte_result"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10005B110((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_measUtraResults;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v10), 2);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_measGsmResults;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v15), 3);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_measLteResults;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), 4);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 15);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
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
  id v17;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  v17 = v4;
  if (-[KCellularWcdmaNbrCellMeas measUtraResultsCount](self, "measUtraResultsCount"))
  {
    objc_msgSend(v17, "clearMeasUtraResults");
    v5 = -[KCellularWcdmaNbrCellMeas measUtraResultsCount](self, "measUtraResultsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularWcdmaNbrCellMeas measUtraResultAtIndex:](self, "measUtraResultAtIndex:", i));
        objc_msgSend(v17, "addMeasUtraResult:", v8);

      }
    }
  }
  if (-[KCellularWcdmaNbrCellMeas measGsmResultsCount](self, "measGsmResultsCount"))
  {
    objc_msgSend(v17, "clearMeasGsmResults");
    v9 = -[KCellularWcdmaNbrCellMeas measGsmResultsCount](self, "measGsmResultsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularWcdmaNbrCellMeas measGsmResultAtIndex:](self, "measGsmResultAtIndex:", j));
        objc_msgSend(v17, "addMeasGsmResult:", v12);

      }
    }
  }
  if (-[KCellularWcdmaNbrCellMeas measLteResultsCount](self, "measLteResultsCount"))
  {
    objc_msgSend(v17, "clearMeasLteResults");
    v13 = -[KCellularWcdmaNbrCellMeas measLteResultsCount](self, "measLteResultsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularWcdmaNbrCellMeas measLteResultAtIndex:](self, "measLteResultAtIndex:", k));
        objc_msgSend(v17, "addMeasLteResult:", v16);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v17 + 10) = self->_subsId;
    *((_BYTE *)v17 + 44) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSMutableArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v26;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 44) |= 1u;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = self->_measUtraResults;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addMeasUtraResult:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v9);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = self->_measGsmResults;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v17), "copyWithZone:", a3);
        objc_msgSend(v6, "addMeasGsmResult:", v18);

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v15);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->_measLteResults;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        v24 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v23), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend(v6, "addMeasLteResult:", v24);

        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v21);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_subsId;
    *((_BYTE *)v6 + 44) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *measUtraResults;
  NSMutableArray *measGsmResults;
  NSMutableArray *measLteResults;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  measUtraResults = self->_measUtraResults;
  if ((unint64_t)measUtraResults | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](measUtraResults, "isEqual:"))
  {
    goto LABEL_17;
  }
  measGsmResults = self->_measGsmResults;
  if ((unint64_t)measGsmResults | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](measGsmResults, "isEqual:"))
      goto LABEL_17;
  }
  measLteResults = self->_measLteResults;
  if ((unint64_t)measLteResults | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](measLteResults, "isEqual:"))
      goto LABEL_17;
  }
  v9 = (*((_BYTE *)v4 + 44) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_subsId != *((_DWORD *)v4 + 10))
      goto LABEL_17;
    v9 = 1;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = (unint64_t)-[NSMutableArray hash](self->_measUtraResults, "hash");
  v5 = (unint64_t)-[NSMutableArray hash](self->_measGsmResults, "hash");
  v6 = (unint64_t)-[NSMutableArray hash](self->_measLteResults, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_subsId;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = *((id *)v4 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        -[KCellularWcdmaNbrCellMeas addMeasUtraResult:](self, "addMeasUtraResult:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v8);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = *((id *)v5 + 2);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        -[KCellularWcdmaNbrCellMeas addMeasGsmResult:](self, "addMeasGsmResult:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v15));
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v5 + 3);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[KCellularWcdmaNbrCellMeas addMeasLteResult:](self, "addMeasLteResult:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), (_QWORD)v21);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

  if ((*((_BYTE *)v5 + 44) & 2) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)measUtraResults
{
  return self->_measUtraResults;
}

- (void)setMeasUtraResults:(id)a3
{
  objc_storeStrong((id *)&self->_measUtraResults, a3);
}

- (NSMutableArray)measGsmResults
{
  return self->_measGsmResults;
}

- (void)setMeasGsmResults:(id)a3
{
  objc_storeStrong((id *)&self->_measGsmResults, a3);
}

- (NSMutableArray)measLteResults
{
  return self->_measLteResults;
}

- (void)setMeasLteResults:(id)a3
{
  objc_storeStrong((id *)&self->_measLteResults, a3);
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measUtraResults, 0);
  objc_storeStrong((id *)&self->_measLteResults, 0);
  objc_storeStrong((id *)&self->_measGsmResults, 0);
}

@end
