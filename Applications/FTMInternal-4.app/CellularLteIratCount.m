@implementation CellularLteIratCount

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

- (void)setDurationSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_durationSeconds = a3;
}

- (void)setHasDurationSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearFromLteHoCounts
{
  -[NSMutableArray removeAllObjects](self->_fromLteHoCounts, "removeAllObjects");
}

- (void)addFromLteHoCount:(id)a3
{
  id v4;
  NSMutableArray *fromLteHoCounts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fromLteHoCounts = self->_fromLteHoCounts;
  v8 = v4;
  if (!fromLteHoCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_fromLteHoCounts;
    self->_fromLteHoCounts = v6;

    v4 = v8;
    fromLteHoCounts = self->_fromLteHoCounts;
  }
  -[NSMutableArray addObject:](fromLteHoCounts, "addObject:", v4);

}

- (unint64_t)fromLteHoCountsCount
{
  return (unint64_t)-[NSMutableArray count](self->_fromLteHoCounts, "count");
}

- (id)fromLteHoCountAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_fromLteHoCounts, "objectAtIndex:", a3);
}

+ (Class)fromLteHoCountType
{
  return (Class)objc_opt_class(HoFromEutranCount, a2);
}

- (void)clearFromLteReselCounts
{
  -[NSMutableArray removeAllObjects](self->_fromLteReselCounts, "removeAllObjects");
}

- (void)addFromLteReselCount:(id)a3
{
  id v4;
  NSMutableArray *fromLteReselCounts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fromLteReselCounts = self->_fromLteReselCounts;
  v8 = v4;
  if (!fromLteReselCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_fromLteReselCounts;
    self->_fromLteReselCounts = v6;

    v4 = v8;
    fromLteReselCounts = self->_fromLteReselCounts;
  }
  -[NSMutableArray addObject:](fromLteReselCounts, "addObject:", v4);

}

- (unint64_t)fromLteReselCountsCount
{
  return (unint64_t)-[NSMutableArray count](self->_fromLteReselCounts, "count");
}

- (id)fromLteReselCountAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_fromLteReselCounts, "objectAtIndex:", a3);
}

+ (Class)fromLteReselCountType
{
  return (Class)objc_opt_class(ReFromEutranCount, a2);
}

- (void)clearFromLteRedirCounts
{
  -[NSMutableArray removeAllObjects](self->_fromLteRedirCounts, "removeAllObjects");
}

- (void)addFromLteRedirCount:(id)a3
{
  id v4;
  NSMutableArray *fromLteRedirCounts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fromLteRedirCounts = self->_fromLteRedirCounts;
  v8 = v4;
  if (!fromLteRedirCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_fromLteRedirCounts;
    self->_fromLteRedirCounts = v6;

    v4 = v8;
    fromLteRedirCounts = self->_fromLteRedirCounts;
  }
  -[NSMutableArray addObject:](fromLteRedirCounts, "addObject:", v4);

}

- (unint64_t)fromLteRedirCountsCount
{
  return (unint64_t)-[NSMutableArray count](self->_fromLteRedirCounts, "count");
}

- (id)fromLteRedirCountAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_fromLteRedirCounts, "objectAtIndex:", a3);
}

+ (Class)fromLteRedirCountType
{
  return (Class)objc_opt_class(ReFromEutranCount, a2);
}

- (BOOL)hasWtolHoCount
{
  return self->_wtolHoCount != 0;
}

- (BOOL)hasWtolReselCount
{
  return self->_wtolReselCount != 0;
}

- (void)clearWtolRedirCounts
{
  -[NSMutableArray removeAllObjects](self->_wtolRedirCounts, "removeAllObjects");
}

- (void)addWtolRedirCount:(id)a3
{
  id v4;
  NSMutableArray *wtolRedirCounts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  wtolRedirCounts = self->_wtolRedirCounts;
  v8 = v4;
  if (!wtolRedirCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_wtolRedirCounts;
    self->_wtolRedirCounts = v6;

    v4 = v8;
    wtolRedirCounts = self->_wtolRedirCounts;
  }
  -[NSMutableArray addObject:](wtolRedirCounts, "addObject:", v4);

}

- (unint64_t)wtolRedirCountsCount
{
  return (unint64_t)-[NSMutableArray count](self->_wtolRedirCounts, "count");
}

- (id)wtolRedirCountAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_wtolRedirCounts, "objectAtIndex:", a3);
}

+ (Class)wtolRedirCountType
{
  return (Class)objc_opt_class(RedirFromUtranCount, a2);
}

- (void)clearCtolReselCounts
{
  -[NSMutableArray removeAllObjects](self->_ctolReselCounts, "removeAllObjects");
}

- (void)addCtolReselCount:(id)a3
{
  id v4;
  NSMutableArray *ctolReselCounts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  ctolReselCounts = self->_ctolReselCounts;
  v8 = v4;
  if (!ctolReselCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_ctolReselCounts;
    self->_ctolReselCounts = v6;

    v4 = v8;
    ctolReselCounts = self->_ctolReselCounts;
  }
  -[NSMutableArray addObject:](ctolReselCounts, "addObject:", v4);

}

- (unint64_t)ctolReselCountsCount
{
  return (unint64_t)-[NSMutableArray count](self->_ctolReselCounts, "count");
}

- (id)ctolReselCountAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_ctolReselCounts, "objectAtIndex:", a3);
}

+ (Class)ctolReselCountType
{
  return (Class)objc_opt_class(ReselFromDoCount, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteIratCount;
  v3 = -[CellularLteIratCount description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteIratCount dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  id v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *k;
  void *v27;
  HoFromUtranCount *wtolHoCount;
  void *v29;
  ReselFromUtranCount *wtolReselCount;
  void *v31;
  id v32;
  NSMutableArray *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *m;
  void *v38;
  id v39;
  NSMutableArray *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *n;
  void *v45;
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
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationSeconds));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("duration_seconds"));

  }
  if (-[NSMutableArray count](self->_fromLteHoCounts, "count"))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_fromLteHoCounts, "count"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v8 = self->_fromLteHoCounts;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v64 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("from_lte_ho_count"));
  }
  if (-[NSMutableArray count](self->_fromLteReselCounts, "count"))
  {
    v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_fromLteReselCounts, "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v15 = self->_fromLteReselCounts;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v60 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("from_lte_resel_count"));
  }
  if (-[NSMutableArray count](self->_fromLteRedirCounts, "count"))
  {
    v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_fromLteRedirCounts, "count"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v22 = self->_fromLteRedirCounts;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v56;
      do
      {
        for (k = 0; k != v24; k = (char *)k + 1)
        {
          if (*(_QWORD *)v56 != v25)
            objc_enumerationMutation(v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("from_lte_redir_count"));
  }
  wtolHoCount = self->_wtolHoCount;
  if (wtolHoCount)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HoFromUtranCount dictionaryRepresentation](wtolHoCount, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("wtol_ho_count"));

  }
  wtolReselCount = self->_wtolReselCount;
  if (wtolReselCount)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ReselFromUtranCount dictionaryRepresentation](wtolReselCount, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("wtol_resel_count"));

  }
  if (-[NSMutableArray count](self->_wtolRedirCounts, "count"))
  {
    v32 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_wtolRedirCounts, "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v33 = self->_wtolRedirCounts;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v52;
      do
      {
        for (m = 0; m != v35; m = (char *)m + 1)
        {
          if (*(_QWORD *)v52 != v36)
            objc_enumerationMutation(v33);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)m), "dictionaryRepresentation"));
          objc_msgSend(v32, "addObject:", v38);

        }
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
      }
      while (v35);
    }

    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("wtol_redir_count"));
  }
  if (-[NSMutableArray count](self->_ctolReselCounts, "count"))
  {
    v39 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_ctolReselCounts, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v40 = self->_ctolReselCounts;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v48;
      do
      {
        for (n = 0; n != v42; n = (char *)n + 1)
        {
          if (*(_QWORD *)v48 != v43)
            objc_enumerationMutation(v40);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)n), "dictionaryRepresentation", (_QWORD)v47));
          objc_msgSend(v39, "addObject:", v45);

        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v47, v67, 16);
      }
      while (v42);
    }

    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("ctol_resel_count"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10010CD18((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  NSMutableArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *k;
  HoFromUtranCount *wtolHoCount;
  ReselFromUtranCount *wtolReselCount;
  NSMutableArray *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *m;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *n;
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
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field(v5, self->_durationSeconds, 2);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = self->_fromLteHoCounts;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i), 4);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v9);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v12 = self->_fromLteReselCounts;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j), 6);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v14);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v17 = self->_fromLteRedirCounts;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(_QWORD *)v43 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)k), 8);
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v19);
  }

  wtolHoCount = self->_wtolHoCount;
  if (wtolHoCount)
    PBDataWriterWriteSubmessage(v5, wtolHoCount, 11);
  wtolReselCount = self->_wtolReselCount;
  if (wtolReselCount)
    PBDataWriterWriteSubmessage(v5, wtolReselCount, 12);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v24 = self->_wtolRedirCounts;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v39;
    do
    {
      for (m = 0; m != v26; m = (char *)m + 1)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(v24);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)m), 14);
      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
    }
    while (v26);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v29 = self->_ctolReselCounts;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v35;
    do
    {
      for (n = 0; n != v31; n = (char *)n + 1)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v29);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)n), 16);
      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    }
    while (v31);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t n;
  void *v25;
  id v26;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 80) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_durationSeconds;
    *((_BYTE *)v4 + 80) |= 2u;
  }
  v26 = v4;
  if (-[CellularLteIratCount fromLteHoCountsCount](self, "fromLteHoCountsCount"))
  {
    objc_msgSend(v26, "clearFromLteHoCounts");
    v6 = -[CellularLteIratCount fromLteHoCountsCount](self, "fromLteHoCountsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteIratCount fromLteHoCountAtIndex:](self, "fromLteHoCountAtIndex:", i));
        objc_msgSend(v26, "addFromLteHoCount:", v9);

      }
    }
  }
  if (-[CellularLteIratCount fromLteReselCountsCount](self, "fromLteReselCountsCount"))
  {
    objc_msgSend(v26, "clearFromLteReselCounts");
    v10 = -[CellularLteIratCount fromLteReselCountsCount](self, "fromLteReselCountsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteIratCount fromLteReselCountAtIndex:](self, "fromLteReselCountAtIndex:", j));
        objc_msgSend(v26, "addFromLteReselCount:", v13);

      }
    }
  }
  if (-[CellularLteIratCount fromLteRedirCountsCount](self, "fromLteRedirCountsCount"))
  {
    objc_msgSend(v26, "clearFromLteRedirCounts");
    v14 = -[CellularLteIratCount fromLteRedirCountsCount](self, "fromLteRedirCountsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteIratCount fromLteRedirCountAtIndex:](self, "fromLteRedirCountAtIndex:", k));
        objc_msgSend(v26, "addFromLteRedirCount:", v17);

      }
    }
  }
  if (self->_wtolHoCount)
    objc_msgSend(v26, "setWtolHoCount:");
  if (self->_wtolReselCount)
    objc_msgSend(v26, "setWtolReselCount:");
  if (-[CellularLteIratCount wtolRedirCountsCount](self, "wtolRedirCountsCount"))
  {
    objc_msgSend(v26, "clearWtolRedirCounts");
    v18 = -[CellularLteIratCount wtolRedirCountsCount](self, "wtolRedirCountsCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteIratCount wtolRedirCountAtIndex:](self, "wtolRedirCountAtIndex:", m));
        objc_msgSend(v26, "addWtolRedirCount:", v21);

      }
    }
  }
  if (-[CellularLteIratCount ctolReselCountsCount](self, "ctolReselCountsCount"))
  {
    objc_msgSend(v26, "clearCtolReselCounts");
    v22 = -[CellularLteIratCount ctolReselCountsCount](self, "ctolReselCountsCount");
    if (v22)
    {
      v23 = v22;
      for (n = 0; n != v23; ++n)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteIratCount ctolReselCountAtIndex:](self, "ctolReselCountAtIndex:", n));
        objc_msgSend(v26, "addCtolReselCount:", v25);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  char has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *k;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  NSMutableArray *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *m;
  id v35;
  NSMutableArray *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *n;
  id v41;
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
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 80) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_durationSeconds;
    *((_BYTE *)v5 + 80) |= 2u;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v8 = self->_fromLteHoCounts;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addFromLteHoCount:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v10);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v14 = self->_fromLteReselCounts;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v56 != v17)
          objc_enumerationMutation(v14);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v6, "addFromLteReselCount:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v16);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v20 = self->_fromLteRedirCounts;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v22; k = (char *)k + 1)
      {
        if (*(_QWORD *)v52 != v23)
          objc_enumerationMutation(v20);
        v25 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3);
        objc_msgSend(v6, "addFromLteRedirCount:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    }
    while (v22);
  }

  v26 = -[HoFromUtranCount copyWithZone:](self->_wtolHoCount, "copyWithZone:", a3);
  v27 = (void *)v6[7];
  v6[7] = v26;

  v28 = -[ReselFromUtranCount copyWithZone:](self->_wtolReselCount, "copyWithZone:", a3);
  v29 = (void *)v6[9];
  v6[9] = v28;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v30 = self->_wtolRedirCounts;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v48;
    do
    {
      for (m = 0; m != v32; m = (char *)m + 1)
      {
        if (*(_QWORD *)v48 != v33)
          objc_enumerationMutation(v30);
        v35 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)m), "copyWithZone:", a3);
        objc_msgSend(v6, "addWtolRedirCount:", v35);

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
    }
    while (v32);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v36 = self->_ctolReselCounts;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v44;
    do
    {
      for (n = 0; n != v38; n = (char *)n + 1)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(v36);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)n), "copyWithZone:", a3, (_QWORD)v43);
        objc_msgSend(v6, "addCtolReselCount:", v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
    }
    while (v38);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *fromLteHoCounts;
  NSMutableArray *fromLteReselCounts;
  NSMutableArray *fromLteRedirCounts;
  HoFromUtranCount *wtolHoCount;
  ReselFromUtranCount *wtolReselCount;
  NSMutableArray *wtolRedirCounts;
  NSMutableArray *ctolReselCounts;
  unsigned __int8 v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_26:
    v13 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_durationSeconds != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_26;
  }
  fromLteHoCounts = self->_fromLteHoCounts;
  if ((unint64_t)fromLteHoCounts | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](fromLteHoCounts, "isEqual:"))
  {
    goto LABEL_26;
  }
  fromLteReselCounts = self->_fromLteReselCounts;
  if ((unint64_t)fromLteReselCounts | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](fromLteReselCounts, "isEqual:"))
      goto LABEL_26;
  }
  fromLteRedirCounts = self->_fromLteRedirCounts;
  if ((unint64_t)fromLteRedirCounts | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](fromLteRedirCounts, "isEqual:"))
      goto LABEL_26;
  }
  wtolHoCount = self->_wtolHoCount;
  if ((unint64_t)wtolHoCount | *((_QWORD *)v4 + 7))
  {
    if (!-[HoFromUtranCount isEqual:](wtolHoCount, "isEqual:"))
      goto LABEL_26;
  }
  wtolReselCount = self->_wtolReselCount;
  if ((unint64_t)wtolReselCount | *((_QWORD *)v4 + 9))
  {
    if (!-[ReselFromUtranCount isEqual:](wtolReselCount, "isEqual:"))
      goto LABEL_26;
  }
  wtolRedirCounts = self->_wtolRedirCounts;
  if ((unint64_t)wtolRedirCounts | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](wtolRedirCounts, "isEqual:"))
      goto LABEL_26;
  }
  ctolReselCounts = self->_ctolReselCounts;
  if ((unint64_t)ctolReselCounts | *((_QWORD *)v4 + 2))
    v13 = -[NSMutableArray isEqual:](ctolReselCounts, "isEqual:");
  else
    v13 = 1;
LABEL_27:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_durationSeconds;
LABEL_6:
  v5 = v4 ^ v3 ^ (unint64_t)-[NSMutableArray hash](self->_fromLteHoCounts, "hash");
  v6 = (unint64_t)-[NSMutableArray hash](self->_fromLteReselCounts, "hash");
  v7 = v5 ^ v6 ^ (unint64_t)-[NSMutableArray hash](self->_fromLteRedirCounts, "hash");
  v8 = -[HoFromUtranCount hash](self->_wtolHoCount, "hash");
  v9 = v8 ^ -[ReselFromUtranCount hash](self->_wtolReselCount, "hash");
  v10 = v7 ^ v9 ^ (unint64_t)-[NSMutableArray hash](self->_wtolRedirCounts, "hash");
  return v10 ^ (unint64_t)-[NSMutableArray hash](self->_ctolReselCounts, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *k;
  HoFromUtranCount *wtolHoCount;
  id v23;
  ReselFromUtranCount *wtolReselCount;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *m;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *n;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
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
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];

  v4 = a3;
  v5 = (id *)v4;
  v6 = *((_BYTE *)v4 + 80);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 80);
  }
  if ((v6 & 2) != 0)
  {
    self->_durationSeconds = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v7 = *((id *)v4 + 4);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(v7);
        -[CellularLteIratCount addFromLteHoCount:](self, "addFromLteHoCount:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v9);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v12 = v5[6];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v49 != v15)
          objc_enumerationMutation(v12);
        -[CellularLteIratCount addFromLteReselCount:](self, "addFromLteReselCount:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v14);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v17 = v5[5];
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v45;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v17);
        -[CellularLteIratCount addFromLteRedirCount:](self, "addFromLteRedirCount:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    }
    while (v19);
  }

  wtolHoCount = self->_wtolHoCount;
  v23 = v5[7];
  if (wtolHoCount)
  {
    if (v23)
      -[HoFromUtranCount mergeFrom:](wtolHoCount, "mergeFrom:");
  }
  else if (v23)
  {
    -[CellularLteIratCount setWtolHoCount:](self, "setWtolHoCount:");
  }
  wtolReselCount = self->_wtolReselCount;
  v25 = v5[9];
  if (wtolReselCount)
  {
    if (v25)
      -[ReselFromUtranCount mergeFrom:](wtolReselCount, "mergeFrom:");
  }
  else if (v25)
  {
    -[CellularLteIratCount setWtolReselCount:](self, "setWtolReselCount:");
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v26 = v5[8];
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v41;
    do
    {
      for (m = 0; m != v28; m = (char *)m + 1)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(v26);
        -[CellularLteIratCount addWtolRedirCount:](self, "addWtolRedirCount:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)m));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    }
    while (v28);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = v5[2];
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v37;
    do
    {
      for (n = 0; n != v33; n = (char *)n + 1)
      {
        if (*(_QWORD *)v37 != v34)
          objc_enumerationMutation(v31);
        -[CellularLteIratCount addCtolReselCount:](self, "addCtolReselCount:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)n), (_QWORD)v36);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v56, 16);
    }
    while (v33);
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationSeconds
{
  return self->_durationSeconds;
}

- (NSMutableArray)fromLteHoCounts
{
  return self->_fromLteHoCounts;
}

- (void)setFromLteHoCounts:(id)a3
{
  objc_storeStrong((id *)&self->_fromLteHoCounts, a3);
}

- (NSMutableArray)fromLteReselCounts
{
  return self->_fromLteReselCounts;
}

- (void)setFromLteReselCounts:(id)a3
{
  objc_storeStrong((id *)&self->_fromLteReselCounts, a3);
}

- (NSMutableArray)fromLteRedirCounts
{
  return self->_fromLteRedirCounts;
}

- (void)setFromLteRedirCounts:(id)a3
{
  objc_storeStrong((id *)&self->_fromLteRedirCounts, a3);
}

- (HoFromUtranCount)wtolHoCount
{
  return self->_wtolHoCount;
}

- (void)setWtolHoCount:(id)a3
{
  objc_storeStrong((id *)&self->_wtolHoCount, a3);
}

- (ReselFromUtranCount)wtolReselCount
{
  return self->_wtolReselCount;
}

- (void)setWtolReselCount:(id)a3
{
  objc_storeStrong((id *)&self->_wtolReselCount, a3);
}

- (NSMutableArray)wtolRedirCounts
{
  return self->_wtolRedirCounts;
}

- (void)setWtolRedirCounts:(id)a3
{
  objc_storeStrong((id *)&self->_wtolRedirCounts, a3);
}

- (NSMutableArray)ctolReselCounts
{
  return self->_ctolReselCounts;
}

- (void)setCtolReselCounts:(id)a3
{
  objc_storeStrong((id *)&self->_ctolReselCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wtolReselCount, 0);
  objc_storeStrong((id *)&self->_wtolRedirCounts, 0);
  objc_storeStrong((id *)&self->_wtolHoCount, 0);
  objc_storeStrong((id *)&self->_fromLteReselCounts, 0);
  objc_storeStrong((id *)&self->_fromLteRedirCounts, 0);
  objc_storeStrong((id *)&self->_fromLteHoCounts, 0);
  objc_storeStrong((id *)&self->_ctolReselCounts, 0);
}

@end
